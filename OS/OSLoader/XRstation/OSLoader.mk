OUTPUTFILE := OSLoader.a4x

#PRELIBS  := LX/xr17032/rta3x/_boot.o
#LIBS     := L/rta3x/rta3x.o
MOVEEXPR := text=0x3200,data=text+text_size,bss=data+data_size
MKBINARY := yes