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
	.file	"ppmu.c"
	.text
	.align	2
	.global	exynos4_ppmu_reset
	.type	exynos4_ppmu_reset, %function
exynos4_ppmu_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #8]
	mov	r1, #6
	mov	r2, #-2147483633
	str	r1, [r3]
	str	r2, [r3, #16]
	bx	lr
	.fnend
	.size	exynos4_ppmu_reset, .-exynos4_ppmu_reset
	.align	2
	.global	exynos4_ppmu_setevent
	.type	exynos4_ppmu_setevent, %function
exynos4_ppmu_setevent:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r2, r1, #4
	ldr	r3, [r0, #8]
	ldr	r2, [r0, r2, asl #2]
	add	r1, r1, #16
	str	r2, [r3, r1, asl #8]
	bx	lr
	.fnend
	.size	exynos4_ppmu_setevent, .-exynos4_ppmu_setevent
	.align	2
	.global	exynos4_ppmu_start
	.type	exynos4_ppmu_start, %function
exynos4_ppmu_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #8]
	mov	r2, #1
	str	r2, [r3]
	bx	lr
	.fnend
	.size	exynos4_ppmu_start, .-exynos4_ppmu_start
	.align	2
	.global	exynos4_ppmu_stop
	.type	exynos4_ppmu_stop, %function
exynos4_ppmu_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #8]
	mov	r2, #0
	str	r2, [r3]
	bx	lr
	.fnend
	.size	exynos4_ppmu_stop, .-exynos4_ppmu_stop
	.align	2
	.global	exynos4_ppmu_update
	.type	exynos4_ppmu_update, %function
exynos4_ppmu_update:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, [r0, #8]
	ldr	r3, [r2, #256]
	cmp	r3, #0
	moveq	r3, #100
	cmp	r1, #3
	str	r3, [r0, #12]
	bgt	.L13
	add	r3, r1, #4
	ldr	r3, [r0, r3, asl #2]
	cmp	r3, #0
	beq	.L13
	cmp	r1, #3
	ldr	r7, [r0, #32]
	ldreq	r3, [r2, #320]
	addne	r1, r1, #17
	ldreq	r2, [r2, #321]
	movne	r5, #0
	ldrne	r4, [r2, r1, asl #4]
	mov	r1, #0
	ldr	r10, [r0, #40]
	mov	r6, #100
	moveq	r4, r3, asl #8
	moveq	r5, r3, lsr #24
	orreq	r4, r4, r2
	ldr	r2, [r0, #12]
	mov	r3, #0
	add	lr, r10, #3
	mov	r10, r10, asl #3
	movw	ip, #:lower16:div64_u64
	cmp	r5, r3
	it eq
	cmpeq	r4, r2
	movhi	r4, r2
	movhi	r5, r3
	umull	r8, r9, r4, r7
	movw	r2, #:lower16:.LANCHOR0
	movt	r2, #:upper16:.LANCHOR0
	mov	r3, r1
	add	fp, r2, lr, asl #3
	movt	ip, #:upper16:div64_u64
	mla	r9, r7, r5, r9
	strd	r8, [r2, r10]
	ldr	r7, [r0, #12]
	str	r7, [r2, lr, asl #3]
	str	r1, [fp, #4]
	ldr	r1, [r0, #32]
	ldr	r2, [r0, #12]
	umull	r6, r7, r1, r6
	mul	lr, r6, r5
	umull	r0, r1, r6, r4
	mla	r4, r4, r7, lr
	add	r1, r4, r1
	blx	ip
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L13:
	mov	r0, #0
	mov	r1, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.fnend
	.size	exynos4_ppmu_update, .-exynos4_ppmu_update
	.align	2
	.global	ppmu_start
	.type	ppmu_start, %function
ppmu_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r1, #:lower16:.LANCHOR1
	movt	r1, #:upper16:.LANCHOR1
	ldr	r3, [r1]
	cmp	r3, r1
	bxeq	lr
	mov	ip, #1
.L20:
	ldr	r2, [r3, #48]
	cmp	r2, r0
	ldreq	r2, [r3, #8]
	streq	ip, [r2]
	ldr	r3, [r3]
	cmp	r3, r1
	bne	.L20
	bx	lr
	.fnend
	.size	ppmu_start, .-ppmu_start
	.align	2
	.global	ppmu_update
	.type	ppmu_update, %function
ppmu_update:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r5, #:lower16:.LANCHOR1
	movt	r5, #:upper16:.LANCHOR1
	.pad #12
	sub	sp, sp, #12
	mov	r6, r0
	mov	r8, r1
	ldr	r4, [r5]
	cmp	r4, r5
	beq	.L21
	movw	r7, #:lower16:.LANCHOR0
	mov	fp, #0
	movt	r7, #:upper16:.LANCHOR0
	mov	r10, #6
	mov	r9, #-2147483633
.L25:
	ldr	r3, [r4, #48]
	cmp	r3, r6
	beq	.L26
.L23:
	ldr	r4, [r4]
	cmp	r4, r5
	bne	.L25
.L21:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L26:
	ldr	r3, [r4, #8]
	mov	r0, r4
	mov	r1, r8
	str	fp, [r3]
	ldr	r3, [r4, #40]
	str	r3, [sp, #4]
	bl	exynos4_ppmu_update
	ldr	r3, [sp, #4]
	add	r3, r7, r3, asl #3
	strd	r0, [r3, #48]
	ldr	r3, [r4, #8]
	str	r10, [r3]
	str	r9, [r3, #16]
	b	.L23
	.fnend
	.size	ppmu_update, .-ppmu_update
	.align	2
	.global	ppmu_reset
	.type	ppmu_reset, %function
ppmu_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8}
	.save {r4, r5, r6, r7, r8}
	movw	r4, #:lower16:.LANCHOR1
	movt	r4, #:upper16:.LANCHOR1
	ldr	r3, [r4]
	cmp	r3, r4
	beq	.L27
	mov	r8, #0
	mov	r7, #6
	mov	r6, #-2147483633
	b	.L34
.L29:
	ldr	r3, [r3]
	cmp	r3, r4
	beq	.L27
.L34:
	ldr	r2, [r3, #48]
	cmp	r2, r0
	bne	.L29
	ldr	ip, [r3, #8]
	mov	r1, r3
	mov	r2, #4096
	str	r8, [ip]
.L32:
	ldr	ip, [r1, #16]
	add	r1, r1, #4
	cmp	ip, #0
	ldrne	r5, [r3, #8]
	strne	ip, [r5, r2]
	add	r2, r2, #256
	cmp	r2, #5120
	bne	.L32
	ldr	r2, [r3, #8]
	str	r7, [r2]
	str	r6, [r2, #16]
	ldr	r3, [r3]
	cmp	r3, r4
	bne	.L34
.L27:
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
	.fnend
	.size	ppmu_reset, .-ppmu_reset
	.align	2
	.global	ppmu_init
	.type	ppmu_init, %function
ppmu_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	ip, #:lower16:.LANCHOR1
	str	r4, [sp, #-4]!
	.save {r4}
	movt	ip, #:upper16:.LANCHOR1
	mov	r2, r0
	mov	r3, #4096
	ldr	r4, [ip]
	str	r1, [r0, #48]
	str	r0, [r4, #4]
	stmia	r0, {r4, ip}
	str	r0, [ip]
.L42:
	ldr	r1, [r2, #16]
	add	r2, r2, #4
	cmp	r1, #0
	ldrne	ip, [r0, #8]
	strne	r1, [ip, r3]
	add	r3, r3, #256
	cmp	r3, #5120
	bne	.L42
	ldr	r4, [sp], #4
	bx	lr
	.fnend
	.size	ppmu_init, .-ppmu_init
	.global	exynos_ppmu
	.global	ppmu_load_detail
	.global	ppmu_load
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	ppmu_list, %object
	.size	ppmu_list, 8
ppmu_list:
	.word	ppmu_list
	.word	ppmu_list
	.type	exynos_ppmu, %object
	.size	exynos_ppmu, 204
exynos_ppmu:
	.space	8
	.word	-23920640
	.space	4
	.space	12
	.word	7
	.word	1
	.space	4
	.word	0
	.space	24
	.space	8
	.word	-23912448
	.space	4
	.space	12
	.word	7
	.word	1
	.space	4
	.word	1
	.space	24
	.space	8
	.word	-23904256
	.space	4
	.space	12
	.word	7
	.word	1
	.space	4
	.word	2
	.space	24
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	ppmu_load_detail, %object
	.size	ppmu_load_detail, 48
ppmu_load_detail:
	.space	48
	.type	ppmu_load, %object
	.size	ppmu_load, 24
ppmu_load:
	.space	24
	.ident	"GCC: (GNU) 4.8"
