// this file defines block 0 of a MINTIA disk on fox32.
// 
// it just loads the boot block of the partition and jumps there.
// =========== BOOT PROGRAM ============

.section text

start:
	jmp  PastThePartitionTable

here:
.bytes (164 - here), 0

PastThePartitionTable:
	mov t0, 0x80002000       // command to set the location of the buffer
	mov t1, 0x80003000       // command to read a sector from a disk into the buffer
	out t0, 0xA00            // set the memory buffer location
	out t1, 7                // read the sector into memory

	jmp 0xA00

here2:
.bytes (508 - here2), 0

// fox32 boot block identifier

.dl 0x523C334C