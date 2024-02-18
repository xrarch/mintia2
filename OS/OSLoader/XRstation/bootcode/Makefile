all: .new

.new: a4xBootDescriptor.bin AisixFSBoot.bin
	dd if=a4xBootDescriptor.bin of=$(DISTIMAGE) bs=512 conv=notrunc seek=5 2>/dev/null
	dd if=AisixFSBoot.bin of=$(DISTIMAGE) bs=512 conv=notrunc seek=7 2>/dev/null
	touch .new

a4xBootDescriptor.bin: a4xBootDescriptor.s
	$(ASM) format=flat a4xBootDescriptor.s a4xBootDescriptor.bin

AisixFSBoot.bin: AisixFSBoot.s
	$(ASM) AisixFSBoot.s AisixFSBoot.bin
	$(LNK) move AisixFSBoot.bin text=0x3000,bss=text+text_size
	$(LNK) binary -nobss AisixFSBoot.bin

cleanup:
	rm -f *.bin