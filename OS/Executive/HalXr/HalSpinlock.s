//
// Implements spinlocks for the HAL. These disable interrupts.
//

.section text

#IF BLD_MP

// a0 - spinlock
// outputs:
// a3 - old interrupt state
HalpAcquireSpinlock:
.global HalpAcquireSpinlock

	// First, disable interrupts.

	mfcr a3, rs
	subi t0, zero, 3
	and  t0, a3, t0
	mtcr rs, t0

	// Common case: non-contended.

.retry:
	ll   t0, a0
	bne  t0, .spin
	sc   t0, a0, a0
	beq  t0, .spin

	// Memory barrier to ensure reads in the critical section don't see stale
	// junk.

	mb

	ret

	// Spin until free without using LL since it brings the cache line in
	// exclusive which is overzealous.

.spin:
	mov  t0, long [a0]
	bne  t0, .spin
	b    .retry

// a0 - spinlock
// a1 - oldstate
HalpReleaseSpinlock:
.global HalpReleaseSpinlock

	// Memory barrier to ensure old writes are committed.

	wmb

	// Set spinlock un-owned.

	mov  long [a0], zero

	// Restore interrupt state.

	mtcr rs, a1

	ret

#END