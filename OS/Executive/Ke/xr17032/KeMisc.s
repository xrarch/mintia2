//
// Various architecture-specific functions.
//

.section text

// outputs:
// a3 - old interrupt state
KiDisableInterrupts:
.global KiDisableInterrupts

	mfcr a3, rs
	subi t0, zero, 3
	and  t0, a3, t0
	mtcr rs, t0

	ret

// a0 - old interrupt state
KiRestoreInterrupts:
.global KiRestoreInterrupts

	mtcr rs, a0

	ret