//
// Implements spinlocks for the kernel.
//

.section text

#IF BLD_MP

// a0 - spinlock
KiAcquireSpinlock:
.global KiAcquireSpinlock

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
KiReleaseSpinlock:
.global KiReleaseSpinlock

	// Memory barrier to ensure old writes are committed.

	wmb

	// Set spinlock un-owned.

	mov  long [a0], zero

	ret

#END