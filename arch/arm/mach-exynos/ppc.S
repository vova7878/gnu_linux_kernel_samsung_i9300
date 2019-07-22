	.cpu cortex-a9
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"ppc.c"
	.text
	.align	2
	.global	exynos4_ppc_reset
	.type	exynos4_ppc_reset, %function
exynos4_ppc_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #8]
	mov	r3, #0
	stmfd	sp!, {r4, r5, r6, r7}
	.save {r4, r5, r6, r7}
	mov	r1, #-2147483633
	movw	r7, #61456
	movw	r6, #61520
	mov	r4, #61440
	mov	r5, #6
	mov	ip, #61696
	str	r1, [r2, r7]
	str	r1, [r2, r6]
	str	r5, [r2, r4]
	str	r3, [r2, ip]
	str	r3, [r0, #12]
	str	r3, [r0, #52]
	str	r3, [r0, #56]
	str	r3, [r0, #60]
	str	r3, [r0, #64]
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
	.fnend
	.size	exynos4_ppc_reset, .-exynos4_ppc_reset
	.align	2
	.global	exynos4_ppc_setevent
	.type	exynos4_ppc_setevent, %function
exynos4_ppc_setevent:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, r1, asl #12
	ldr	r3, [r0, #8]
	str	r1, [r0, #16]
	orr	r2, r2, #1
	str	r2, [r3, #252]
	bx	lr
	.fnend
	.size	exynos4_ppc_setevent, .-exynos4_ppc_setevent
	.align	2
	.global	exynos4_ppc_start
	.type	exynos4_ppc_start, %function
exynos4_ppc_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #8]
	mov	r3, #61440
	mov	r1, #1
	str	r1, [r2, r3]
	bx	lr
	.fnend
	.size	exynos4_ppc_start, .-exynos4_ppc_start
	.align	2
	.global	exynos4_ppc_stop
	.type	exynos4_ppc_stop, %function
exynos4_ppc_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #8]
	mov	r3, #61440
	mov	r1, #0
	str	r1, [r2, r3]
	bx	lr
	.fnend
	.size	exynos4_ppc_stop, .-exynos4_ppc_stop
	.align	2
	.global	exynos4_ppc_update
	.type	exynos4_ppc_update, %function
exynos4_ppc_update:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7}
	.save {r4, r5, r6, r7}
	mov	r7, #61696
	ldr	r2, [r0, #8]
	mov	r3, r0
	movw	r6, #61712
	movw	r5, #61728
	movw	r4, #61744
	movw	ip, #61760
	ldr	r7, [r2, r7]
	mov	r0, #0
	mov	r1, #0
	str	r7, [r3, #12]
	ldr	r6, [r2, r6]
	str	r6, [r3, #52]
	ldr	r5, [r2, r5]
	str	r5, [r3, #56]
	ldr	r4, [r2, r4]
	str	r4, [r3, #60]
	ldr	r2, [r2, ip]
	str	r2, [r3, #64]
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
	.fnend
	.size	exynos4_ppc_update, .-exynos4_ppc_update
	.ident	"GCC: (GNU) 4.8"
