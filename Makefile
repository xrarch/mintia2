export REPO       := $(shell pwd)
export BUILDROOT  := $(REPO)/Root
export SYSROOT    := mintia
export BINROOT    := mintia/bin
export DRIVERROOT := mintia/BootDrivers
export WINROOT    := mintia/win

ifndef SDK
	SDK := $(REPO)/../sdk
endif

ifndef PLATFORM
	PLATFORM := XRstation
endif

ifndef DEBUGCHECKS
	DEBUGCHECKS := 0
endif

ifeq ($(DEBUGCHECKS),1)
	CHKFRE := chk
else
	CHKFRE := fre
endif

export CHKFRE

export SDK
export PLATFORM

export JC := $(SDK)/jcd.sh
export LNK := $(SDK)/link.sh
export ASM := $(SDK)/asm.sh
export FST := $(SDK)/fstool.sh
export APT := $(SDK)/apttool.sh

export KERNINCDIR   := $(REPO)/OS/OSKernel/include/
export HALINCDIR    := $(REPO)/OS/HAL/include/:$(REPO)/OS/HAL/$(PLATFORM)/include/
export LIBDIR       := $(REPO)/OS/Headers/

BOOTCODE := OSLoader/$(PLATFORM)/bootcode \
			OSLoader

PLATFORMS := XRstation fox32

include $(PLATFORM).mk

export DELTA := $(REPO)/DELTA.$(ARCHITECTURE).$(CHKFRE)

export KERNBIN  := $(BUILDROOT)/$(SYSROOT)/OSKernel.exe.$(ARCHITECTURE).$(CHKFRE)

ifndef SMALLDIST
	export DISTIMAGE  := $(REPO)/build/mintia2-$(PLATFORM)-$(CHKFRE).img
	export DISTIMGSZ  := 109242 # 53MB
	export DISKLABEL  := mintia2-dist
else
	export DISTIMAGE  := $(REPO)/build/mintia2-$(PLATFORM)-$(CHKFRE)-small.img
	export DISTIMGSZ  := 20910 # 10MB
	export DISKLABEL  := mintia2-small
	TEXTSUFFIX := .small
endif

export FSTOOL := $(FST) $(DISTIMAGE) offset=4
export APTOOL := $(APT) $(DISTIMAGE)

export ARCHITECTURE

BUILDCONFIG += DEBUGCHECKS=$(DEBUGCHECKS) $(PLATFORM)=1 $(ARCHITECTURE)=1 target=$(ARCHITECTURE)

JC += $(BUILDCONFIG)
ASM += target=$(ARCHITECTURE)

ifndef PROJECT
	PROJECT := $(BOOTCODE)
endif

all: $(PROJECT) | $(DISTIMAGE)
	$(FSTOOL) wdf / $(DELTA)
	rm -f $(DELTA)

update:
	$(FSTOOL) udf / ExecManifest.$(PLATFORM) .$(ARCHITECTURE).$(CHKFRE)
	$(FSTOOL) udf / ExecManifest .$(ARCHITECTURE).$(CHKFRE)
	$(FSTOOL) ud / TextManifest
	$(FSTOOL) ud / TextManifestSuffixed $(TEXTSUFFIX)

$(DISTIMAGE): | $(REPO)/build
	dd if=/dev/zero of=$(DISTIMAGE) bs=512 count=$(DISTIMGSZ) 2>/dev/null
	$(APTOOL) f $(DISKLABEL) boot -1
	$(FSTOOL) f
	rm -f OS/OSLoader/$(PLATFORM)/bootcode/.new
	$(FSTOOL) udf / ExecManifest.$(PLATFORM) .$(ARCHITECTURE).$(CHKFRE)
	$(FSTOOL) udf / ExecManifest .$(ARCHITECTURE).$(CHKFRE)
	$(FSTOOL) ud / TextManifest
	$(FSTOOL) ud / TextManifestSuffixed $(TEXTSUFFIX)

$(BOOTCODE): | $(DISTIMAGE)
	make -C OS/$@

$(REPO)/build:
	mkdir -p $(REPO)/build

cleanupall:
	for platform in $(PLATFORMS); do \
		make cleanup PLATFORM=$$platform; \
		make cleanup PLATFORM=$$platform DEBUGCHECKS=1; \
	done

cleanup:
	rm -f $(DELTA)
	rm -f $(DISTIMAGE)
	rm -f OS/OSLoader/$(PLATFORM)/bootcode/.new

	for dir in $(BOOTCODE); do \
		make -C OS/$$dir cleanup; \
	done