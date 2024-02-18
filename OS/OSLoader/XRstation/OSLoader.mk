OUTPUTFILE := OSLoader.a4x

LIBDIR := $(REPO)/../a4x/Headers:$(NEWSDK)/Rtl/Headers

LIBS     := $(NEWSDK)/Rtl/obj/$(ARCHITECTURE)/Rtl.lib
MOVEEXPR := text=0x3200,data=text+text_size,bss=data+data_size
MKBINARY := yes