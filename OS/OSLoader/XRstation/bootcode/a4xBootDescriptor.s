.section text

.ds samy

;OS label
.ds "MINTIA2\0\0\0\0\0\0\0\0\0"

;boot program offset in blocks
.dl 3
;boot program length in blocks
.dl 1

;reserved
.dl 0

.align 512

;boot picker icon bitmap
.static mint.bmp