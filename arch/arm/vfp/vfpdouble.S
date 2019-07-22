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
	.file	"vfpdouble.c"
	.text
	.align	2
	.type	vfp_propagate_nan, %function
vfp_propagate_nan:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9}
	.save {r4, r5, r6, r7, r8, r9}
	movw	r4, #2047
	ldrh	r6, [r1]
	mov	ip, r0
	cmp	r6, r4
	beq	.L24
	cmp	r6, #0
	movne	r6, #0
	movne	r0, #1
	beq	.L25
.L3:
	cmp	r2, #0
	moveq	r4, r2
	beq	.L4
	ldrh	r4, [r2]
	movw	r5, #2047
	cmp	r4, r5
	beq	.L26
	cmp	r4, #0
	movne	r4, #1
	beq	.L27
.L4:
	tst	r3, #33554432
	movwne	r1, #:lower16:.LANCHOR0
	movtne	r1, #:upper16:.LANCHOR0
	bne	.L6
	cmp	r0, #48
	beq	.L7
	subs	r4, r4, #48
	movne	r4, #1
	cmp	r0, #16
	movne	r4, #0
	cmp	r4, #0
	moveq	r1, r2
.L7:
	ldrd	r2, [r1, #8]
	mov	r4, #0
	mov	r5, #536870912
	orr	r2, r2, r4
	orr	r3, r3, r5
	strd	r2, [r1, #8]
.L6:
	ldmia	r1, {r0, r1, r2, r3}
	cmp	r6, #0
	stmia	ip, {r0, r1, r2, r3}
	moveq	r0, #256
	movne	r0, #1
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9}
	bx	lr
.L25:
	ldrd	r4, [r1, #8]
	orrs	r0, r4, r5
	movne	r0, #5
	moveq	r0, #3
	b	.L3
.L27:
	ldrd	r4, [r2, #8]
	orrs	r7, r4, r5
	moveq	r4, #3
	movne	r4, #5
	b	.L4
.L24:
	ldrd	r4, [r1, #8]
	mov	r6, #0
	orrs	r0, r4, r5
	moveq	r0, #8
	beq	.L3
	mov	r7, #536870912
	and	r4, r4, r6
	and	r5, r5, r7
	orrs	r7, r4, r5
	movne	r6, #0
	moveq	r6, #1
	moveq	r0, #48
	movne	r0, #16
	b	.L3
.L26:
	ldrd	r4, [r2, #8]
	orrs	r7, r4, r5
	moveq	r4, #8
	beq	.L4
	mov	r8, #0
	mov	r9, #536870912
	and	r4, r4, r8
	and	r5, r5, r9
	orrs	r7, r4, r5
	moveq	r6, #1
	moveq	r4, #48
	movne	r4, #16
	b	.L4
	.fnend
	.size	vfp_propagate_nan, .-vfp_propagate_nan
	.align	2
	.type	vfp_double_multiply, %function
vfp_double_multiply:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp}
	.save {r4, r5, r6, r7, r8, r9, r10, fp}
	mov	ip, r0
	mov	r4, r1
	ldrsh	r0, [r2]
	.pad #16
	sub	sp, sp, #16
	ldrsh	r1, [r1]
	cmp	r1, r0
	movlt	r1, r4
	movlt	r4, r2
	movlt	r2, r1
	ldrh	r0, [r4, #2]
	ldrh	r5, [r2, #2]
	movw	r1, #2047
	eor	r0, r5, r0
	strh	r0, [ip, #2]	@ movhi
	ldrh	r5, [r4]
	sxth	r6, r5
	cmp	r6, r1
	beq	.L42
	ldrh	r3, [r2]
	ldrd	r0, [r2, #8]
	sxth	r6, r3
	mov	r7, r6, asr #31
	orr	r6, r6, r0
	orr	r7, r7, r1
	orrs	r8, r6, r7
	beq	.L43
	add	r3, r3, r5
	mvn	r6, #0
	sub	r3, r3, #1020
	mov	r7, #0
	sub	r3, r3, #1
	strh	r3, [ip]	@ movhi
	ldrd	r0, [r4, #8]
	ldrd	r8, [r2, #8]
	and	r4, r0, r6
	and	r5, r1, r7
	and	r2, r8, r6
	and	r3, r9, r7
	umull	r10, fp, r1, r2
	umull	r6, r7, r9, r4
	strd	r10, [sp]
	umull	r10, fp, r9, r1
	mul	r0, r2, r5
	strd	r10, [sp, #8]
	ldr	fp, [sp, #4]
	mla	r7, r9, r5, r7
	umull	r8, r9, r2, r4
	mla	fp, r1, r3, fp
	mla	r4, r4, r3, r0
	str	fp, [sp, #4]
	ldrd	r10, [sp]
	mov	r0, #0
	add	r9, r4, r9
	mov	r4, #0
	adds	r10, r10, r6
	adc	fp, fp, r7
	mov	r1, r10
	cmp	r7, fp
	it eq
	cmpeq	r6, r10
	ldrd	r6, [sp, #8]
	movhi	r5, #1
	movls	r5, #0
	adds	r8, r8, r0
	adc	r9, r9, r10
	adds	r2, fp, r6
	adc	r3, r0, r7
	cmp	r1, r9
	it eq
	cmpeq	r0, r8
	movls	r1, #0
	movhi	r1, #1
	mov	r6, r0
	adds	r2, r2, r1
	adc	r3, r3, #0
	adds	r4, r4, r2
	adc	r5, r5, r3
	orrs	r7, r8, r9
	moveq	r3, #0
	movne	r3, #1
	orr	r4, r4, r3
	strd	r4, [ip, #8]
.L34:
	mov	r0, r6
	add	sp, sp, #16
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp}
	bx	lr
.L43:
	mov	r0, #0
	strd	r6, [ip, #8]
	mov	r6, r0
	strh	r0, [ip]	@ movhi
	mov	r0, r6
	add	sp, sp, #16
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp}
	bx	lr
.L42:
	ldrd	r0, [r4, #8]
	orrs	r5, r0, r1
	bne	.L31
	ldrh	r5, [r2]
	sxth	r1, r5
	cmp	r1, r6
	ldrd	r0, [r2, #8]
	beq	.L44
	sxth	r2, r5
	mov	r3, r2, asr #31
	orr	r2, r2, r0
	orr	r3, r3, r1
	orrs	r7, r2, r3
	bne	.L33
	movw	r3, #:lower16:.LANCHOR0
	mov	r6, #1
	movt	r3, #:upper16:.LANCHOR0
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	b	.L34
.L44:
	orrs	r6, r0, r1
	bne	.L31
.L33:
	mvn	r1, #63488
	mov	r2, #0
	mov	r3, #0
	strh	r1, [ip]	@ movhi
	mov	r6, #0
	strd	r2, [ip, #8]
	b	.L34
.L31:
	mov	r0, ip
	mov	r1, r4
	add	sp, sp, #16
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp}
	b	vfp_propagate_nan
	.fnend
	.size	vfp_double_multiply, .-vfp_double_multiply
	.align	2
	.type	vfp_double_normalise_denormal, %function
vfp_double_normalise_denormal:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #12]
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r3, r2
@ 0 "" 2
	sub	r3, r3, #1
	stmfd	sp!, {r4, r5}
	.save {r4, r5}
	cmp	r3, #31
	ldr	r1, [r0, #8]
	beq	.L51
.L46:
	cmp	r3, #0
	beq	.L45
	mov	r2, r2, asl r3
	sub	ip, r3, #32
	ldrh	r4, [r0]
	rsb	r5, r3, #32
	orr	r2, r2, r1, asl ip
	mov	ip, r1, asl r3
	orr	r2, r2, r1, lsr r5
	add	r1, r4, #1
	rsb	r3, r3, r1
	str	ip, [r0, #8]
	str	r2, [r0, #12]
	strh	r3, [r0]	@ movhi
.L45:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L51:
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r3, r1
@ 0 "" 2
	add	r3, r3, #31
	b	.L46
	.fnend
	.size	vfp_double_normalise_denormal, .-vfp_double_normalise_denormal
	.align	2
	.type	vfp_compare, %function
vfp_compare:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r8, #:lower16:vfp_get_double
	mov	r9, r0
	movt	r8, #:upper16:vfp_get_double
	mov	r0, r2
	mov	fp, r1
	blx	r8
	mov	r2, r1, asr #20
	mov	r3, r1, asr #31
	movw	r6, #2047
	mov	r7, #0
	and	r2, r2, r6
	and	r3, r3, r7
	cmp	r3, r7
	it eq
	cmpeq	r2, r6
	mov	r4, r0
	mov	r5, r1
	beq	.L73
.L60:
	mov	r10, #0
.L53:
	mov	r0, r9
	mov	r9, #0
	blx	r8
	mov	r6, r1, asr #20
	mov	r7, r1, asr #31
	movw	r8, #2047
	and	r7, r7, r9
	and	r6, r6, r8
	mov	r2, r0
	cmp	r7, r9
	it eq
	cmpeq	r6, r8
	mov	r3, r1
	beq	.L74
.L54:
	cmp	r10, #0
	bne	.L70
	cmp	r3, r5
	it eq
	cmpeq	r2, r4
	beq	.L66
	orr	r6, r2, r4
	orr	r7, r3, r5
	mvn	r0, #0
	mvn	r1, #-2147483648
	and	r0, r0, r6
	and	r1, r1, r7
	orrs	ip, r0, r1
	beq	.L66
	eor	r0, r2, r4
	eor	r1, r3, r5
	cmp	r0, #0
	sbcs	ip, r1, #0
	blt	.L75
	cmp	r2, r4
	sbcs	r1, r3, r5
	mov	r1, r3, lsr #31
	movge	r0, #0
	movlt	r0, #1
	cmp	r1, r0
	bne	.L58
	cmp	r4, r2
	sbcs	ip, r5, r3
	movge	r10, #0
	movlt	r10, #1
	cmp	r1, r10
	movne	r10, #536870912
	moveq	r10, #0
.L70:
	mov	r0, r10
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L66:
	mov	r10, #1610612736
	mov	r0, r10
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L74:
	movw	r1, #65535
	mvn	r0, #0
	movt	r1, 15
	and	r0, r0, r2
	and	r1, r1, r3
	orrs	ip, r0, r1
	beq	.L54
	cmp	fp, #0
	bne	.L64
	mov	r0, #0
	mov	r1, #524288
	and	r2, r2, r0
	and	r3, r3, r1
	orrs	r0, r2, r3
	orrne	r10, r10, #805306368
	bne	.L70
.L64:
	mov	r10, #805306369
	mov	r0, r10
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L73:
	movw	r3, #65535
	mvn	r2, #0
	movt	r3, 15
	and	r2, r2, r0
	and	r3, r3, r1
	orrs	r0, r2, r3
	beq	.L60
	cmp	fp, #0
	movne	r10, #805306369
	bne	.L53
	mov	r2, #0
	mov	r3, #524288
	and	r2, r2, r4
	and	r3, r3, r1
	orrs	r1, r2, r3
	moveq	r10, #805306369
	movne	r10, #805306368
	b	.L53
.L75:
	cmp	r2, #0
	sbcs	r0, r3, #0
	movge	r10, #536870912
	bge	.L70
.L58:
	mov	r10, #-2147483648
	mov	r0, r10
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.fnend
	.size	vfp_compare, .-vfp_compare
	.align	2
	.type	vfp_double_fcmpez, %function
vfp_double_fcmpez:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #1
	mov	r2, #32
	b	vfp_compare
	.fnend
	.size	vfp_double_fcmpez, .-vfp_double_fcmpez
	.align	2
	.type	vfp_double_fcmpz, %function
vfp_double_fcmpz:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	mov	r2, #32
	b	vfp_compare
	.fnend
	.size	vfp_double_fcmpz, .-vfp_double_fcmpz
	.align	2
	.type	vfp_double_fcmpe, %function
vfp_double_fcmpe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #1
	b	vfp_compare
	.fnend
	.size	vfp_double_fcmpe, .-vfp_double_fcmpe
	.align	2
	.type	vfp_double_fcmp, %function
vfp_double_fcmp:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	b	vfp_compare
	.fnend
	.size	vfp_double_fcmp, .-vfp_double_fcmp
	.align	2
	.type	vfp_double_fneg, %function
vfp_double_fneg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:vfp_get_double
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r3, #:upper16:vfp_get_double
	mov	r4, r0
	mov	r0, r2
	blx	r3
	movw	r3, #:lower16:vfp_put_double
	adds	r0, r0, #0
	adc	r1, r1, #-2147483648
	mov	r2, r4
	movt	r3, #:upper16:vfp_put_double
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	vfp_double_fneg, .-vfp_double_fneg
	.align	2
	.type	vfp_double_fabs, %function
vfp_double_fabs:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:vfp_get_double
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:vfp_get_double
	mov	r6, r0
	mov	r0, r2
	mvn	r4, #0
	blx	r3
	mvn	r5, #-2147483648
	movw	r3, #:lower16:vfp_put_double
	and	r0, r0, r4
	mov	r2, r6
	and	r1, r1, r5
	movt	r3, #:upper16:vfp_put_double
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	vfp_double_fabs, .-vfp_double_fabs
	.align	2
	.type	vfp_double_fcpy, %function
vfp_double_fcpy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:vfp_get_double
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r3, #:upper16:vfp_get_double
	mov	r4, r0
	mov	r0, r2
	blx	r3
	movw	r3, #:lower16:vfp_put_double
	mov	r2, r4
	movt	r3, #:upper16:vfp_put_double
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	vfp_double_fcpy, .-vfp_double_fcpy
	.align	2
	.type	vfp_double_add, %function
vfp_double_add:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, r1
	ldrd	r4, [r1, #8]
	.pad #4
	sub	sp, sp, #4
	mov	r7, r0
	mov	r9, r2
	mov	r8, r3
	cmp	r4, #0
	sbcs	r1, r5, #0
	blt	.L84
	ldrd	r2, [r2, #8]
	cmp	r2, #0
	sbcs	ip, r3, #0
	blt	.L84
.L85:
	ldrh	r3, [r6]
	ldrh	r2, [r9]
	sxth	r0, r3
	sxth	r1, r2
	cmp	r0, r1
	movlt	r1, r6
	movlt	r3, r2
	movlt	r6, r9
	movlt	r9, r1
	sxth	r1, r3
	movw	r3, #2047
	cmp	r1, r3
	beq	.L116
	ldmia	r6, {r0, r1, r2, r3}
	stmia	r7, {r0, r1, r2, r3}
	ldrsh	r2, [r6]
	ldrsh	r3, [r9]
	ldrd	r4, [r9, #8]
	subs	r1, r2, r3
	beq	.L96
	cmp	r1, #63
	bhi	.L97
	rsb	ip, r1, #64
	mov	r2, r4, lsr r1
	mov	r0, r5, asl ip
	sub	fp, ip, #32
	rsb	r10, r1, #32
	mov	r3, r5, lsr r1
	orr	r0, r0, r4, asl fp
	rsb	fp, ip, #32
	orr	r2, r2, r5, asl r10
	sub	r10, r1, #32
	orr	r0, r0, r4, lsr fp
	orr	r2, r2, r5, lsr r10
	mov	r5, #0
	orrs	r0, r0, r4, asl ip
	orr	r5, r5, r3
	moveq	r4, #0
	movne	r4, #1
	orr	r4, r4, r2
.L96:
	ldrh	r3, [r9, #2]
	ldrh	r2, [r6, #2]
	cmp	r2, r3
	ldrd	r2, [r6, #8]
	beq	.L98
	subs	r2, r2, r4
	sbc	r3, r3, r5
	cmp	r2, #0
	sbcs	ip, r3, #0
	blt	.L117
	orrs	r1, r2, r3
	bne	.L100
	and	r8, r8, #12582912
	cmp	r8, #8388608
	moveq	r8, #32768
	movne	r8, #0
	strh	r8, [r7, #2]	@ movhi
.L100:
	mov	ip, #0
	strd	r2, [r7, #8]
.L95:
	mov	r0, ip
	add	sp, sp, #4
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L98:
	adds	r2, r2, r4
	adc	r3, r3, r5
	b	.L100
.L97:
	orrs	r3, r4, r5
	mov	r5, #0
	moveq	r4, #0
	movne	r4, #1
	uxtb	r4, r4
	b	.L96
.L117:
	ldrh	r0, [r7, #2]
	mov	r1, #32768
	movt	r1, 65535
	rsbs	r2, r2, #0
	rsc	r3, r3, #0
	eor	r1, r0, r1
	strh	r1, [r7, #2]	@ movhi
	b	.L100
.L116:
	ldrh	r0, [r9]
	ldrd	r2, [r6, #8]
	sxth	r4, r0
	orrs	ip, r2, r3
	moveq	ip, #8
	movne	ip, #0
	cmp	r4, r1
	beq	.L118
	cmp	r0, #0
	movne	r3, #1
	bne	.L90
	ldrd	r2, [r9, #8]
	orrs	r1, r2, r3
	movne	r3, #5
	moveq	r3, #3
.L90:
	ands	r2, r3, ip
	bne	.L119
	cmp	ip, #0
	beq	.L94
	tst	r3, #1
	movne	ip, r2
	beq	.L94
.L93:
	ldmia	r6, {r0, r1, r2, r3}
	stmia	r7, {r0, r1, r2, r3}
	b	.L95
.L119:
	ldrh	r1, [r6, #2]
	movw	r3, #:lower16:.LANCHOR0
	ldrh	r2, [r9, #2]
	movt	r3, #:upper16:.LANCHOR0
	cmp	r1, r2
	movne	r6, r3
	moveq	ip, #0
	movne	ip, #1
	b	.L93
.L118:
	ldrd	r2, [r9, #8]
	orrs	r1, r2, r3
	moveq	r3, #8
	beq	.L90
	mov	r1, #536870912
	mov	r0, #0
	and	r3, r3, r1
	and	r2, r2, r0
	orrs	r1, r2, r3
	moveq	r3, #48
	movne	r3, #16
	b	.L90
.L94:
	mov	r0, r7
	mov	r1, r6
	mov	r2, r9
	mov	r3, r8
	add	sp, sp, #4
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	vfp_propagate_nan
.L84:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	b	.L85
	.fnend
	.size	vfp_double_add, .-vfp_double_add
	.align	2
	.type	vfp_double_ftosi, %function
vfp_double_ftosi:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:vfp_get_double
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movt	r1, #:upper16:vfp_get_double
	mov	r6, r0
	mov	r0, r2
	and	r7, r3, #12582912
	blx	r1
	mov	ip, r0, asl #12
	ubfx	lr, r1, #20, #11
	mov	r8, r1, asl #12
	mov	r5, #-2147483648
	mov	r2, ip, lsr #2
	sxth	ip, lr
	orr	r8, r8, r0, lsr #20
	and	r5, r5, r1
	movw	r4, #2047
	mov	r1, r5, lsr #16
	cmp	ip, r4
	cmpne	ip, #0
	orr	r2, r2, r8, asl #30
	moveq	r0, #0
	movne	r0, #1
	mov	r3, r8, lsr #2
	uxth	r1, r1
	beq	.L121
	mov	r4, #0
	mov	r5, #1073741824
	orr	r2, r2, r4
	orr	r3, r3, r5
.L122:
	cmp	lr, #0
	bne	.L125
	orrs	r0, r2, r3
	moveq	r8, #0
	movne	r8, #128
.L127:
	sxth	r4, lr
	mov	r5, r4, asr #31
	orr	r2, r2, r4
	orr	r3, r3, r5
	orrs	ip, r2, r3
	beq	.L147
	cmp	r7, #4194304
	orr	r8, r8, #16
	beq	.L157
	cmp	r7, #8388608
	beq	.L158
.L147:
	mov	r0, #0
	b	.L124
.L125:
	movw	r0, #1054
	cmp	ip, r0
	bgt	.L123
	movw	r0, #1021
	cmp	ip, r0
	ble	.L142
	sub	r0, ip, #1020
	rsb	ip, ip, #1072
	sub	lr, r0, #1
	adds	r8, r2, r2
	sub	r10, r0, #33
	add	r0, ip, #14
	adc	r9, r3, r3
	mov	r5, r3, asl lr
	mov	r3, r8, lsr r0
	rsb	r0, r0, #32
	orr	r5, r5, r2, asl r10
	cmp	r7, #0
	orr	r3, r3, r9, asl r0
	rsb	r8, lr, #32
	sub	r0, ip, #18
	orr	r5, r5, r2, lsr r8
	mov	r4, r2, asl lr
	orr	r0, r3, r9, lsr r0
	bne	.L129
	tst	r0, #1
	movne	r2, #0
	movne	r3, #-2147483648
	beq	.L159
.L130:
	adds	r2, r2, r4
	adc	r3, r3, r5
	cmp	r5, r3
	it eq
	cmpeq	r4, r2
	bls	.L131
	cmn	r0, #1
	beq	.L132
	add	r0, r0, #1
.L131:
	cmp	r1, #0
	beq	.L160
	cmp	r0, #-2147483648
	bhi	.L148
.L139:
	orrs	r3, r4, r5
	movne	r8, #16
	moveq	r8, #0
.L135:
	cmp	r1, #0
	rsbne	r0, r0, #0
	b	.L124
.L121:
	cmp	ip, r4
	bne	.L122
	orrs	ip, r2, r3
	movne	r8, #1
	bne	.L124
.L123:
	cmp	r1, #0
	mov	r8, #1
	movne	r0, #-2147483648
	mvneq	r0, #-2147483648
.L124:
	movw	r3, #:lower16:vfp_put_float
	mov	r1, r6
	movt	r3, #:upper16:vfp_put_float
	blx	r3
	mov	r0, r8
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L142:
	mov	r8, #0
	b	.L127
.L129:
	cmp	r7, #12582912
	beq	.L144
	subs	r3, r7, #4194304
	rsbs	r2, r3, #0
	adcs	r2, r2, r3
	mov	r3, #0
	cmp	r1, #0
	eorne	r2, r2, #1
	uxtb	r2, r2
	rsbs	r2, r2, #0
	rsc	r3, r3, #0
	b	.L130
.L159:
	mvn	r2, #0
	mvn	r3, #-2147483648
	b	.L130
.L158:
	subs	r0, r1, #0
	mvnne	r0, #0
	b	.L124
.L157:
	rsbs	r0, r1, #1
	movcc	r0, #0
	b	.L124
.L144:
	mov	r2, #0
	mov	r3, #0
	b	.L130
.L160:
	cmn	r0, #-2147483647
	bls	.L139
.L149:
	mvn	r0, #-2147483648
.L138:
	mov	r8, #1
	b	.L135
.L132:
	cmp	r1, #0
	beq	.L149
.L148:
	mov	r0, #-2147483648
	b	.L138
	.fnend
	.size	vfp_double_ftosi, .-vfp_double_ftosi
	.align	2
	.type	vfp_double_ftosiz, %function
vfp_double_ftosiz:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #12582912
	b	vfp_double_ftosi
	.fnend
	.size	vfp_double_ftosiz, .-vfp_double_ftosiz
	.align	2
	.type	vfp_double_ftoui, %function
vfp_double_ftoui:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:vfp_get_double
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movt	r1, #:upper16:vfp_get_double
	mov	r6, r0
	mov	r0, r2
	mov	r7, r3
	blx	r1
	mov	ip, r0, asl #12
	mov	r8, r1, asl #12
	ubfx	lr, r1, #20, #11
	mov	r2, ip, lsr #2
	mov	r5, #-2147483648
	sxth	ip, lr
	orr	r8, r8, r0, lsr #20
	and	r5, r5, r1
	movw	r0, #2047
	mov	r1, r5, lsr #16
	cmp	ip, r0
	cmpne	ip, #0
	orr	r2, r2, r8, asl #30
	mov	r3, r8, lsr #2
	uxth	r1, r1
	beq	.L163
	mov	r4, #0
	mov	r5, #1073741824
	orr	r2, r2, r4
	orr	r3, r3, r5
.L164:
	cmp	lr, #0
	bne	.L165
	orrs	r0, r2, r3
	movne	r10, #128
	beq	.L165
.L167:
	movw	r0, #1021
	and	r7, r7, #12582912
	cmp	ip, r0
	bgt	.L199
	sxth	r4, lr
	mov	r5, r4, asr #31
	orr	r2, r2, r4
	orr	r3, r3, r5
	orrs	r0, r2, r3
	moveq	r4, r10
	moveq	r0, #0
	beq	.L168
	cmp	r7, #4194304
	orr	r4, r10, #16
	beq	.L200
	cmp	r7, #8388608
	movne	r0, #0
	bne	.L168
	cmp	r1, #0
	orrne	r4, r10, #17
	movne	r0, #0
	moveq	r0, r1
.L168:
	movw	r3, #:lower16:vfp_put_float
	mov	r1, r6
	movt	r3, #:upper16:vfp_put_float
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L163:
	cmp	ip, r0
	bne	.L164
	orrs	r0, r2, r3
	bne	.L166
.L165:
	movw	r0, #1054
	cmp	ip, r0
	movle	r10, #0
	ble	.L167
	cmp	r1, #0
	movne	r0, #0
	movne	r4, #1
	bne	.L168
.L166:
	mvn	r0, #0
	mov	r4, #1
	b	.L168
.L199:
	sub	r0, ip, #1020
	rsb	ip, ip, #1072
	sub	lr, r0, #1
	sub	fp, r0, #33
	adds	r8, r2, r2
	add	r0, ip, #14
	adc	r9, r3, r3
	mov	r5, r3, asl lr
	mov	r3, r8, lsr r0
	rsb	r0, r0, #32
	orr	r5, r5, r2, asl fp
	cmp	r7, #0
	orr	r3, r3, r9, asl r0
	rsb	fp, lr, #32
	sub	r0, ip, #18
	orr	r5, r5, r2, lsr fp
	mov	r4, r2, asl lr
	orr	r0, r3, r9, lsr r0
	beq	.L201
	cmp	r7, #12582912
	beq	.L182
	subs	ip, r7, #4194304
	mov	r3, #0
	rsbs	r2, ip, #0
	adcs	r2, r2, ip
	cmp	r1, #0
	eorne	r2, r2, #1
	uxtb	r2, r2
	rsbs	r2, r2, #0
	rsc	r3, r3, #0
.L171:
	adds	r2, r2, r4
	adc	r3, r3, r5
	cmp	r5, r3
	it eq
	cmpeq	r4, r2
	bls	.L172
	cmn	r0, #1
	addne	r0, r0, #1
	orreq	r10, r10, #1
.L178:
	cmp	r1, #0
	orrne	r4, r10, #1
	movne	r0, #0
	bne	.L168
.L175:
	orrs	r3, r4, r5
	moveq	r4, r10
	orrne	r4, r10, #16
	b	.L168
.L201:
	tst	r0, #1
	movne	r2, #0
	movne	r3, #-2147483648
	mvneq	r2, #0
	mvneq	r3, #-2147483648
	b	.L171
.L172:
	cmp	r0, #0
	beq	.L175
	b	.L178
.L200:
	rsbs	r0, r1, #1
	movcc	r0, #0
	b	.L168
.L182:
	mov	r2, #0
	mov	r3, #0
	b	.L171
	.fnend
	.size	vfp_double_ftoui, .-vfp_double_ftoui
	.align	2
	.type	vfp_double_ftouiz, %function
vfp_double_ftouiz:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #12582912
	b	vfp_double_ftoui
	.fnend
	.size	vfp_double_ftouiz, .-vfp_double_ftouiz
	.align	2
	.type	vfp_double_fcvts, %function
vfp_double_fcvts:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:vfp_get_double
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movt	r1, #:upper16:vfp_get_double
	.pad #28
	sub	sp, sp, #28
	mov	r10, r0
	mov	r0, r2
	mov	fp, r3
	mov	r9, #-2147483648
	blx	r1
	mov	r2, r0, asl #12
	mov	r3, r1, asl #12
	and	r9, r9, r1
	ubfx	r1, r1, #20, #11
	mov	r4, r2, lsr #2
	mov	ip, r9, lsr #16
	sxth	r2, r1
	strh	r1, [sp, #8]	@ movhi
	mov	r6, r0
	uxth	ip, ip
	movw	r0, #2047
	orr	r3, r3, r6, lsr #20
	cmp	r2, r0
	cmpne	r2, #0
	strh	ip, [sp, #10]	@ movhi
	orr	r4, r4, r3, asl #30
	mov	r5, r3, lsr #2
	beq	.L204
	mov	r2, #0
	mov	r3, #1073741824
	orr	r4, r4, r2
	orr	r5, r5, r3
	strd	r4, [sp, #16]
.L205:
	cmp	r1, #0
	beq	.L223
	mov	r1, #0
	mov	r0, #1
.L206:
	ldrh	ip, [sp, #10]
	ldrd	r4, [sp, #16]
@ 38 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfp.h" 1
	cmp	r4, #1		@ vfp_hi64to32jamming
	movcc	r4, r5
	orrcs	r4, r5, #1
@ 0 "" 2
	cmp	r1, #0
	str	r4, [sp, #4]
	strh	ip, [sp, #2]	@ movhi
	beq	.L214
	cmp	r0, #16
	mov	r3, #255
	orreq	r4, r4, #536870912
	strh	r3, [sp]	@ movhi
	moveq	r5, #0
	streq	r4, [sp, #4]
	movne	r5, #0
.L209:
	mov	ip, ip, asl #16
	movw	r3, #:lower16:vfp_put_float
	mov	r1, r10
	add	r0, ip, #2130706432
	movt	r3, #:upper16:vfp_put_float
	add	r0, r0, #8388608
	add	r0, r0, r4, lsr #7
	blx	r3
	mov	r0, r5
	add	sp, sp, #28
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L204:
	cmp	r2, r0
	strd	r4, [sp, #16]
	bne	.L205
	orrs	r1, r4, r5
	beq	.L215
	mov	r2, #0
	mov	r3, #536870912
	and	r2, r2, r4
	and	r3, r3, r5
	orrs	r1, r2, r3
	beq	.L224
	mov	r1, #16
	mov	r0, r1
	b	.L206
.L223:
	orrs	r3, r4, r5
	moveq	r0, #3
	beq	.L206
.L225:
	add	r0, sp, #8
	bl	vfp_double_normalise_denormal
	ldrh	r1, [sp, #10]
	mov	r0, #5
	ldrd	r2, [sp, #16]
@ 38 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfp.h" 1
	cmp	r2, #1		@ vfp_hi64to32jamming
	movcc	r2, r3
	orrcs	r2, r3, #1
@ 0 "" 2
	strh	r1, [sp, #2]	@ movhi
	str	r2, [sp, #4]
.L214:
	tst	r0, #2
	movw	ip, #:lower16:__vfp_single_normaliseround
	ldreqh	r3, [sp, #8]
	movne	r3, #0
	mov	r0, r10
	mov	r2, fp
	movt	ip, #:upper16:__vfp_single_normaliseround
	mov	r1, sp
	subeq	r3, r3, #896
	strh	r3, [sp]	@ movhi
	mov	r3, #0
	blx	ip
	add	sp, sp, #28
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L215:
	mov	r1, #8
	mov	r0, r1
	b	.L206
.L224:
	mov	r3, #255
	strh	ip, [sp, #2]	@ movhi
@ 38 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfp.h" 1
	cmp	r4, #1		@ vfp_hi64to32jamming
	movcc	r4, r5
	orrcs	r4, r5, #1
@ 0 "" 2
	strh	r3, [sp]	@ movhi
	mov	r5, #1
	str	r4, [sp, #4]
	b	.L209
	.fnend
	.size	vfp_double_fcvts, .-vfp_double_fcvts
	.align	2
	.global	vfp_double_normaliseround
	.type	vfp_double_normaliseround, %function
vfp_double_normaliseround:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	ip, #2047
	ldrsh	lr, [r1]
	mov	r10, r3
	ldrd	r4, [r1, #8]
	cmp	lr, ip
	beq	.L266
	orrs	r3, r4, r5
	beq	.L267
.L230:
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r3, r5
@ 0 "" 2
	cmp	r3, #32
	mov	ip, lr
	beq	.L268
	cmp	r3, #0
	beq	.L232
.L272:
	mov	r6, r5, asl r3
	sub	ip, r3, #32
	rsb	r5, r3, #32
	mov	r7, r4, asl r3
	orr	r6, r6, r4, asl ip
	rsb	ip, r3, lr
	orr	r6, r6, r4, lsr r5
	mov	r4, r7
	mov	r5, r6
.L232:
	cmp	ip, #0
	movge	fp, #0
	bge	.L233
	rsb	ip, ip, #0
	cmp	ip, #0
	beq	.L234
	cmp	ip, #63
	bhi	.L235
	rsb	lr, ip, #64
	mov	r6, r4, lsr ip
	mov	r3, r5, asl lr
	sub	r9, lr, #32
	rsb	r8, ip, #32
	mov	r7, r5, lsr ip
	orr	r3, r3, r4, asl r9
	rsb	r9, lr, #32
	orr	r6, r6, r5, asl r8
	sub	r8, ip, #32
	orr	r3, r3, r4, lsr r9
	orr	r6, r6, r5, lsr r8
	mov	r5, #0
	orrs	r3, r3, r4, asl lr
	orr	r5, r5, r7
	moveq	r4, #0
	movne	r4, #1
	orr	r4, r4, r6
.L234:
	movw	r6, #2047
	mov	r7, #0
	and	r6, r6, r4
	and	r7, r7, r5
	orrs	r3, r6, r7
	mov	ip, #0
	moveq	fp, #0
	movne	fp, #1
.L233:
	ands	r2, r2, #12582912
	bne	.L236
	mov	r2, #2048
	mov	r3, #0
	and	r2, r2, r4
	and	r3, r3, r5
	orrs	lr, r2, r3
	ldrh	lr, [r1, #2]
	movweq	r6, #1023
	movne	r6, #1024
	mov	r7, #0
.L238:
	adds	r8, r6, r4
	adc	r9, r7, r5
	cmp	r5, r9
	it eq
	cmpeq	r4, r8
	bls	.L240
	mov	r2, #1
	movs	r9, r5, lsr #1
	mov	r8, r4, rrx
	mov	r3, #0
	and	r4, r4, r2
	movs	r7, r7, lsr #1
	mov	r6, r6, rrx
	and	r5, r5, r3
	orr	r4, r4, r8
	orr	r5, r5, r9
	adds	r8, r6, r4
	add	ip, ip, #1
	adc	r9, r7, r5
.L240:
	mov	r3, #0
	movw	r2, #2047
	and	r4, r4, r2
	and	r5, r5, r3
	orrs	r3, r4, r5
	movw	r4, #2045
	orrne	r10, r10, #16
	cmp	ip, r4
	ble	.L242
	orrs	r3, r6, r7
	orr	r10, r10, #20
	bne	.L243
	mvn	r2, #0
	mvn	r3, #-2147483648
	strd	r2, [r1, #8]
	movw	r7, #65535
	mov	r3, #0
	strh	r4, [r1]	@ movhi
	mvn	r6, #0
	movt	r7, 31
	mov	r2, #0
	movt	r3, 32720
	b	.L229
.L267:
	ldrh	lr, [r1, #2]
	mov	r6, r4
	mov	r7, r5
	mov	r2, r4
	mov	r3, r5
	mov	ip, #0
	strh	ip, [r1]	@ movhi
.L229:
	adds	r6, r6, r2
	mov	r5, lr, asl #16
	mov	r4, #0
	adc	r7, r7, r3
	mov	r2, r0
	movw	r3, #:lower16:vfp_put_double
	adds	r0, r6, r4
	movt	r3, #:upper16:vfp_put_double
	adc	r1, r7, r5
	blx	r3
	mov	r0, r10
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L236:
	cmp	r2, #12582912
	ldrh	lr, [r1, #2]
	beq	.L265
	adds	r3, lr, #0
	movne	r3, #1
	cmp	r2, #4194304
	movne	r2, r3
	eoreq	r2, r3, #1
	cmp	r2, #0
	movwne	r6, #2047
	movne	r7, #0
	bne	.L238
.L265:
	mov	r6, #0
	mov	r7, #0
	b	.L238
.L266:
	orrs	r3, r4, r5
	beq	.L269
	cmp	r10, #0
	beq	.L230
	mov	r6, r4, lsr #10
	mov	r3, #0
	ldrh	lr, [r1, #2]
	mov	r2, #0
	movt	r3, 32752
	orr	r6, r6, r5, asl #22
	mov	r7, r5, lsr #10
	b	.L229
.L242:
	mov	r2, r8, lsr #11
	mov	r3, r9, lsr #11
	orr	r2, r2, r9, asl #21
	orrs	r4, r2, r3
	moveq	ip, #0
	moveq	r4, ip
	bne	.L270
.L244:
	cmp	r9, #-2147483648
	it eq
	cmpeq	r8, #0
	orrhi	r4, r4, #1
	cmp	r4, #0
	beq	.L271
.L245:
	movs	r9, r9, lsr #1
	mov	r8, r8, rrx
	strh	ip, [r1]	@ movhi
	mov	r6, r8, lsr #10
	strd	r8, [r1, #8]
	mov	r7, r9, lsr #10
	orr	r6, r6, r9, asl #22
	b	.L229
.L271:
	cmp	fp, #0
	orrne	r10, r10, #8
	b	.L245
.L270:
	adds	r4, ip, #0
	mov	r3, ip, asl #20
	movne	r4, #1
	uxth	ip, ip
	mov	r2, #0
	b	.L244
.L243:
	mov	r2, #0
	mvn	ip, #63488
	mov	r3, #0
	mov	r6, r2
	str	r2, [r1, #8]
	mov	r7, r2
	str	r2, [r1, #12]
	movt	r3, 32752
	mov	r2, #0
	strh	ip, [r1]	@ movhi
	b	.L229
.L269:
	mov	r3, #0
	ldrh	lr, [r1, #2]
	mov	r6, r4
	mov	r7, r5
	mov	r2, #0
	movt	r3, 32752
	b	.L229
.L268:
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r3, r4
@ 0 "" 2
	add	r3, r3, #32
	cmp	r3, #0
	beq	.L232
	b	.L272
.L235:
	orrs	lr, r4, r5
	mov	r5, #0
	moveq	r4, #0
	movne	r4, #1
	uxtb	r4, r4
	b	.L234
	.fnend
	.size	vfp_double_normaliseround, .-vfp_double_normaliseround
	.align	2
	.type	vfp_double_fdiv, %function
vfp_double_fdiv:
	.fnstart
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r8, #:lower16:vfp_get_double
	.pad #116
	sub	sp, sp, #116
	movt	r8, #:upper16:vfp_get_double
	mov	fp, r0
	mov	r0, r1
	mov	r9, r2
	mov	r10, r3
	blx	r8
	mov	r2, r0, asl #12
	mov	r3, r1, asl #12
	mov	r4, r2, lsr #2
	orr	r3, r3, r0, lsr #20
	ubfx	r2, r1, #20, #11
	movw	r0, #2047
	mov	r7, #-2147483648
	cmp	r2, r0
	cmpne	r2, #0
	mov	r5, r3, lsr #2
	orr	r4, r4, r3, asl #30
	strh	r2, [sp, #80]	@ movhi
	and	r7, r7, r1
	movne	r2, #0
	movne	r3, #1073741824
	mov	r1, r7, lsr #16
	orrne	r5, r5, r3
	orrne	r4, r4, r2
	mov	r0, r9
	strd	r4, [sp, #88]
	mov	r5, #-2147483648
	strh	r1, [sp, #82]	@ movhi
	blx	r8
	mov	ip, r0, asl #12
	mov	r7, r1, asl #12
	ldrh	r8, [sp, #80]
	ubfx	lr, r1, #20, #11
	orr	r7, r7, r0, lsr #20
	mov	r2, ip, lsr #2
	sxth	ip, lr
	mov	r3, r7, lsr #2
	strh	lr, [sp, #96]	@ movhi
	and	r5, r5, r1
	orr	r2, r2, r7, asl #30
	movw	r1, #2047
	mov	r6, r5, lsr #16
	cmp	ip, r1
	cmpne	ip, #0
	movne	r1, #1073741824
	movne	r0, #0
	orrne	r3, r3, r1
	ldrh	r1, [sp, #82]
	orrne	r2, r2, r0
	uxth	r6, r6
	movw	r0, #2047
	strd	r2, [sp, #104]
	cmp	r8, r0
	strh	r6, [sp, #98]	@ movhi
	eor	r6, r6, r1
	strh	r6, [sp, #66]	@ movhi
	beq	.L328
	cmp	r8, #0
	movne	r8, #0
	movne	r5, #1
	beq	.L329
.L277:
	movw	r1, #2047
	cmp	ip, r1
	beq	.L330
.L278:
	cmp	lr, #0
	movne	r4, #1
	beq	.L331
.L279:
	cmp	r8, #0
	bne	.L280
.L333:
	tst	r4, #16
	bne	.L281
	and	r3, r5, #10
	tst	r3, r4
	bne	.L282
	tst	r5, #8
	beq	.L332
	mov	r7, r8
.L283:
.L301:
	mov	r0, #0
	mvn	ip, #63488
	mov	r1, #0
	mov	r2, r0
	str	r0, [sp, #72]
	mov	r3, r0
	str	r0, [sp, #76]
	movt	r1, 32752
	strh	ip, [sp, #64]	@ movhi
	mov	r0, #0
	b	.L300
.L331:
	orrs	r0, r2, r3
	movne	r4, #5
	moveq	r4, #3
	cmp	r8, #0
	beq	.L333
.L280:
	mov	r3, r10
	add	r1, sp, #80
	add	r2, sp, #96
	add	r0, sp, #64
	bl	vfp_propagate_nan
	ldr	lr, [sp, #72]
	mov	r7, r0
	ldr	ip, [sp, #76]
	mov	r0, #0
	ldrsh	r4, [sp, #64]
	ldrh	r6, [sp, #66]
	mov	r2, lr, lsr #10
	mov	r3, ip, lsr #10
	mov	r1, r4, asl #20
	orr	r2, r2, ip, asl #22
.L300:
	adds	r0, r0, r2
	mov	r5, r6, asl #16
	mov	r4, #0
	adc	r1, r1, r3
	adds	r0, r0, r4
	movw	r3, #:lower16:vfp_put_double
	mov	r2, fp
	movt	r3, #:upper16:vfp_put_double
	adc	r1, r1, r5
	blx	r3
	mov	r0, r7
.L327:
	add	sp, sp, #116
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L329:
	ldrd	r0, [sp, #88]
	orrs	r9, r0, r1
	movw	r1, #2047
	movne	r5, #5
	moveq	r5, #3
	cmp	ip, r1
	bne	.L278
.L330:
	orrs	ip, r2, r3
	moveq	r4, #8
	beq	.L279
	mov	r0, #0
	mov	r1, #536870912
	and	r2, r2, r0
	and	r3, r3, r1
	orrs	lr, r2, r3
	moveq	r4, #48
	movne	r4, #16
	b	.L279
.L328:
	ldrd	r0, [sp, #88]
	orrs	r4, r0, r1
	moveq	r8, #0
	moveq	r5, #8
	beq	.L277
	mov	r5, #536870912
	mov	r4, #0
	and	r1, r1, r5
	and	r0, r0, r4
	orrs	r5, r0, r1
	mov	r8, #16
	movne	r5, r8
	moveq	r5, #48
	b	.L277
.L281:
	mov	r3, r10
	add	r1, sp, #96
	add	r2, sp, #80
	add	r0, sp, #64
	bl	vfp_propagate_nan
	ldr	lr, [sp, #72]
	mov	r7, r0
	ldr	ip, [sp, #76]
	mov	r0, r8
	ldrsh	r4, [sp, #64]
	ldrh	r6, [sp, #66]
	mov	r2, lr, lsr #10
	mov	r3, ip, lsr #10
	mov	r1, r4, asl #20
	orr	r2, r2, ip, asl #22
	b	.L300
.L332:
	tst	r4, #2
	bne	.L311
	tst	r4, #8
	bne	.L284
	tst	r5, #2
	bne	.L284
	tst	r5, #4
	bne	.L334
.L285:
	tst	r4, #4
	bne	.L335
.L286:
	ldrd	r2, [sp, #104]
	ldrh	r1, [sp, #80]
	ldrd	r6, [sp, #88]
	ldrh	r0, [sp, #96]
	adds	r8, r2, r2
	add	r1, r1, #1020
	adc	r9, r3, r3
	add	r1, r1, #2
	adds	r2, r6, r6
	rsb	r1, r0, r1
	adc	r3, r7, r7
	cmp	r9, r3
	it eq
	cmpeq	r8, r2
	uxth	r1, r1
	strd	r8, [sp, #16]
	strd	r8, [sp, #104]
	movhi	r8, r6
	strh	r1, [sp, #64]	@ movhi
	movhi	r9, r7
	bhi	.L287
	movs	r7, r7, lsr #1
	mov	r6, r6, rrx
	add	r1, r1, #1
	mov	r8, r6
	mov	r9, r7
	strd	r6, [sp, #88]
	strh	r1, [sp, #64]	@ movhi
.L287:
	ldrd	r0, [sp, #16]
	cmp	r1, r9
	it eq
	cmpeq	r0, r8
	bls	.L288
	ldr	r6, [sp, #20]
	mov	r7, #0
	str	r7, [sp, #40]
	str	r6, [sp, #44]
	ldrd	r4, [sp, #40]
	cmp	r5, r9
	it eq
	cmpeq	r4, r8
	bls	.L313
	mov	r4, r6
	mov	r0, r8
	mov	r1, r9
	str	r7, [sp, #8]
@ 124 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfp.h" 1
	.ifnc r1,r1 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r4,r4 ; .err ; .endif
	bl	__do_div64
@ 0 "" 2
	mov	ip, r2
	str	r2, [sp, #12]
.L289:
	ldr	r0, [sp, #16]
	mov	r1, #0
	mov	r3, r9
	umull	r4, r5, ip, r6
	strd	r0, [sp, #48]
	ldr	r2, [sp, #48]
	ldr	r9, [sp, #52]
	mla	r5, ip, r7, r5
	umull	r0, r1, ip, r2
	mov	r2, r8
	mov	r8, #0
	str	r8, [sp, #60]
	str	r8, [sp, #24]
	mla	r1, ip, r9, r1
	str	r0, [sp, #28]
	mov	ip, r8
	mov	r9, #0
	mov	r8, #0
	str	r1, [sp, #56]
	ldrd	r0, [sp, #56]
	adds	r0, r0, r4
	adc	r1, r1, r5
	ldrd	r4, [sp, #24]
	strd	r0, [sp, #32]
	mov	r0, r8
	mov	r1, r9
	ldrd	r8, [sp, #32]
@ 62 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfp.h" 1
	subs	r0, r0, r4
	sbcs	r1, r1, r5
	sbcs	r2, r2, r8
	sbc	r3, r3, r9
	
@ 0 "" 2
	mov	r4, #0
	mov	r5, #0
	cmp	r2, r4
	sbcs	r9, r3, r5
	ldr	r5, [sp, #16]
	mov	r4, ip
	bge	.L290
	ldrd	r8, [sp, #8]
.L291:
	adds	r8, r8, #0
	sbc	r9, r9, #0
@ 49 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfp.h" 1
	adds	r0, r0, r4
	adcs	r1, r1, r5
	adcs	r2, r2, r6
	adc	r3, r3, r7
@ 0 "" 2
	cmp	r2, #0
	sbcs	ip, r3, #0
	blt	.L291
	strd	r8, [sp, #8]
.L290:
	ldrd	r8, [sp, #40]
	mov	r5, #0
	orr	r0, r5, r1
	orr	r1, r2, r5
	cmp	r9, r1
	it eq
	cmpeq	r8, r0
	bhi	.L292
	ldrd	r8, [sp, #8]
	mvn	r2, #0
	mov	r3, #0
	orr	r8, r8, r2
	orr	r9, r9, r3
.L293:
	movw	r2, #511
	mov	r3, #0
	and	r2, r2, r8
	and	r3, r3, r9
	cmp	r3, #0
	it eq
	cmpeq	r2, #2
	strd	r8, [sp, #72]
	bhi	.L294
	ldrd	r0, [sp, #16]
	mvn	r2, #0
	ldr	r5, [sp, #20]
	mov	r3, #0
	ldr	lr, [sp, #20]
	and	r0, r0, r2
	and	r2, r2, r8
	and	r1, r1, r3
	and	r3, r3, r9
	umull	r4, r5, r2, r5
	umull	r6, r7, r9, r0
	strd	r4, [sp, #32]
	mul	ip, r2, r1
	mla	lr, lr, r3, r5
	umull	r4, r5, r2, r0
	str	lr, [sp, #36]
	mla	r7, r9, r1, r7
	strd	r4, [sp, #24]
	ldrd	r4, [sp, #32]
	mla	r0, r0, r3, ip
	ldr	lr, [sp, #28]
	ldr	ip, [sp, #20]
	adds	r4, r4, r6
	adc	r5, r5, r7
	cmp	r7, r5
	it eq
	cmpeq	r6, r4
	add	r0, r0, lr
	umull	r6, r7, r9, ip
	str	r0, [sp, #28]
	bls	.L314
	mov	r0, #0
	mov	r1, #1
	strd	r0, [sp, #40]
.L295:
	mov	r3, r4
	mov	r0, r5
	ldrd	r4, [sp, #24]
	mov	r2, #0
	adds	r4, r4, r2
	adc	r5, r5, r3
	adds	r0, r0, r6
	adc	r1, r2, r7
	cmp	r3, r5
	it eq
	cmpeq	r2, r4
	movls	r3, #0
	movhi	r3, #1
	ldrd	r6, [sp, #88]
	adds	r0, r0, r3
	ldrd	r2, [sp, #40]
	adc	r1, r1, #0
	adds	r0, r0, r2
	mov	r2, #0
	adc	r1, r1, r3
	mov	r3, #0
@ 62 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfp.h" 1
	subs	r2, r2, r4
	sbcs	r3, r3, r5
	sbcs	r6, r6, r0
	sbc	r7, r7, r1
	
@ 0 "" 2
	cmp	r6, #0
	sbcs	r4, r7, #0
	bge	.L296
	mov	ip, fp
	mov	lr, r10
	ldrd	r10, [sp, #16]
	mov	r4, #0
	mov	r5, #0
.L298:
	subs	r0, r8, #1
	sbc	r1, r9, #0
@ 49 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfp.h" 1
	adds	r2, r2, r10
	adcs	r3, r3, fp
	adcs	r6, r6, r4
	adc	r7, r7, r5
@ 0 "" 2
	cmp	r6, #0
	sbcs	r8, r7, #0
	mov	r9, r1
	mov	r8, r0
	blt	.L298
	mov	fp, ip
	mov	r10, lr
.L296:
	orrs	ip, r2, r3
	moveq	r3, #0
	movne	r3, #1
	orr	r8, r8, r3
	strd	r8, [sp, #72]
.L294:
	movw	r3, #:lower16:.LC1
	mov	r0, fp
	movt	r3, #:upper16:.LC1
	mov	r2, r10
	str	r3, [sp]
	add	r1, sp, #64
	mov	r3, #0
	bl	vfp_double_normaliseround
	b	.L327
.L282:
	movw	r3, #:lower16:.LANCHOR0
	mov	r1, #0
	movt	r3, #:upper16:.LANCHOR0
	adds	r4, r8, r8
	ldrh	r0, [r3, #2]
	movw	ip, #:lower16:vfp_put_double
	ldr	r9, [r3, #8]
	mov	r2, fp
	ldr	lr, [r3, #12]
	movt	ip, #:upper16:vfp_put_double
	ldrsh	r6, [r3]
	strd	r0, [sp, #16]
	mov	r5, r0, asl #16
	mov	r0, r9, lsr #10
	mov	r1, lr, lsr #10
	mov	r3, r6, asl #20
	orr	r0, r0, lr, asl #22
	adc	r5, r5, r3
	adds	r0, r0, r4
	adc	r1, r1, r5
	blx	ip
	mov	r0, #1
	add	sp, sp, #116
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L284:
	mov	r1, #0
	mov	lr, r1
	mov	r2, r1
	mov	r3, r1
	str	r1, [sp, #72]
	mov	r0, r1
	str	lr, [sp, #76]
	mov	r7, lr
	strh	lr, [sp, #64]	@ movhi
	b	.L300
.L311:
	mov	r7, #2
	b	.L301
.L288:
	mvn	r2, #0
	mvn	r3, #0
	strd	r2, [sp, #72]
	b	.L294
.L314:
	mov	r2, #0
	mov	r3, #0
	strd	r2, [sp, #40]
	b	.L295
.L335:
	add	r0, sp, #96
	bl	vfp_double_normalise_denormal
	b	.L286
.L334:
	add	r0, sp, #80
	bl	vfp_double_normalise_denormal
	b	.L285
.L313:
	mov	r2, #0
	mvn	r3, #0
	mvn	ip, #0
	strd	r2, [sp, #8]
	b	.L289
.L292:
	ldrd	r8, [sp, #8]
	mov	r4, r6
@ 138 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfp.h" 1
	.ifnc r1,r1 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r4,r4 ; .err ; .endif
	bl	__do_div64
@ 0 "" 2
	orr	r8, r8, r2
	orr	r9, r9, r3
	b	.L293
	.fnend
	.size	vfp_double_fdiv, .-vfp_double_fdiv
	.align	2
	.type	vfp_double_fsub, %function
vfp_double_fsub:
	.fnstart
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	fp, #:lower16:vfp_get_double
	.pad #68
	sub	sp, sp, #68
	movt	fp, #:upper16:vfp_get_double
	mov	r10, r3
	mov	r9, #-2147483648
	str	r0, [sp, #8]
	mov	r0, r1
	str	r2, [sp, #12]
	blx	fp
	mov	r2, r0, asl #12
	mov	r3, r1, asl #12
	mov	r4, r2, lsr #2
	orr	r3, r3, r0, lsr #20
	ubfx	r2, r1, #20, #11
	and	r9, r9, r1
	movw	r0, #2047
	mov	r1, r9, lsr #16
	cmp	r2, r0
	cmpne	r2, #0
	orr	r4, r4, r3, asl #30
	strh	r2, [sp, #32]	@ movhi
	mov	r5, r3, lsr #2
	strh	r1, [sp, #34]	@ movhi
	beq	.L337
	mov	r2, #0
	mov	r3, #1073741824
	add	r6, sp, #32
	orr	r4, r4, r2
	orr	r5, r5, r3
	strd	r4, [sp, #40]
.L338:
	ldr	r0, [sp, #12]
	mov	r5, #-2147483648
	blx	fp
	mov	ip, r1, asl #12
	mov	lr, r0, asl #12
	and	r5, r5, r1
	orr	ip, ip, r0, lsr #20
	mov	r0, r5, lsr #16
	mov	r2, lr, lsr #2
	mov	r3, ip, lsr #2
	ubfx	r1, r1, #20, #11
	uxth	r0, r0
	movw	lr, #2047
	orr	r2, r2, ip, asl #30
	cmp	r1, lr
	cmpne	r1, #0
	strh	r1, [sp, #48]	@ movhi
	strh	r0, [sp, #50]	@ movhi
	beq	.L339
	mov	r4, #0
	mov	r5, #1073741824
	add	r7, sp, #48
	orr	r4, r4, r2
	orr	r5, r5, r3
	strd	r4, [sp, #56]
.L340:
	mov	ip, #32768
	mov	r1, r6
	movt	ip, 65535
	mov	r2, r7
	eor	ip, r0, ip
	mov	r3, r10
	add	r0, sp, #16
	strh	ip, [sp, #50]	@ movhi
	bl	vfp_double_add
	movw	ip, #:lower16:.LC2
	mov	r3, r0
	movt	ip, #:upper16:.LC2
	ldr	r0, [sp, #8]
	add	r1, sp, #16
	mov	r2, r10
	str	ip, [sp]
	bl	vfp_double_normaliseround
	add	sp, sp, #68
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L337:
	cmp	r2, #0
	add	r6, sp, #32
	strd	r4, [sp, #40]
	bne	.L338
	orrs	r1, r4, r5
	beq	.L338
	mov	r0, r6
	bl	vfp_double_normalise_denormal
	b	.L338
.L339:
	cmp	r1, #0
	add	r7, sp, #48
	strd	r2, [sp, #56]
	bne	.L340
	orrs	r1, r2, r3
	beq	.L340
	mov	r0, r7
	bl	vfp_double_normalise_denormal
	ldrh	r0, [sp, #50]
	b	.L340
	.fnend
	.size	vfp_double_fsub, .-vfp_double_fsub
	.align	2
	.type	vfp_double_fnmul, %function
vfp_double_fnmul:
	.fnstart
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	fp, #:lower16:vfp_get_double
	.pad #68
	sub	sp, sp, #68
	movt	fp, #:upper16:vfp_get_double
	mov	r10, r3
	mov	r9, #-2147483648
	str	r0, [sp, #8]
	mov	r0, r1
	str	r2, [sp, #12]
	blx	fp
	mov	r2, r0, asl #12
	mov	r3, r1, asl #12
	mov	r4, r2, lsr #2
	orr	r3, r3, r0, lsr #20
	ubfx	r2, r1, #20, #11
	and	r9, r9, r1
	movw	r0, #2047
	mov	r1, r9, lsr #16
	cmp	r2, r0
	cmpne	r2, #0
	orr	r4, r4, r3, asl #30
	strh	r2, [sp, #32]	@ movhi
	mov	r5, r3, lsr #2
	strh	r1, [sp, #34]	@ movhi
	beq	.L349
	mov	r2, #0
	mov	r3, #1073741824
	add	r6, sp, #32
	orr	r4, r4, r2
	orr	r5, r5, r3
	strd	r4, [sp, #40]
.L350:
	ldr	r0, [sp, #12]
	blx	fp
	mov	r3, r0, asl #12
	mov	ip, r1, asl #12
	mov	r4, r3, lsr #2
	mov	r3, #-2147483648
	ubfx	r2, r1, #20, #11
	orr	ip, ip, r0, lsr #20
	and	r3, r3, r1
	strh	r2, [sp, #48]	@ movhi
	movw	r1, #2047
	mov	r3, r3, lsr #16
	cmp	r2, r1
	cmpne	r2, #0
	orr	r4, r4, ip, asl #30
	mov	r5, ip, lsr #2
	strh	r3, [sp, #50]	@ movhi
	beq	.L351
	mov	r8, #0
	mov	r9, #1073741824
	add	r7, sp, #48
	orr	r4, r4, r8
	orr	r5, r5, r9
	strd	r4, [sp, #56]
.L352:
	mov	r1, r6
	mov	r2, r7
	mov	r3, r10
	add	r0, sp, #16
	bl	vfp_double_multiply
	ldrh	r4, [sp, #18]
	mov	ip, #32768
	movw	lr, #:lower16:.LC3
	movt	ip, 65535
	movt	lr, #:upper16:.LC3
	mov	r3, r0
	eor	ip, r4, ip
	ldr	r0, [sp, #8]
	add	r1, sp, #16
	mov	r2, r10
	str	lr, [sp]
	strh	ip, [sp, #18]	@ movhi
	bl	vfp_double_normaliseround
	add	sp, sp, #68
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L349:
	cmp	r2, #0
	add	r6, sp, #32
	strd	r4, [sp, #40]
	bne	.L350
	orrs	r3, r4, r5
	beq	.L350
	mov	r0, r6
	bl	vfp_double_normalise_denormal
	b	.L350
.L351:
	cmp	r2, #0
	add	r7, sp, #48
	strd	r4, [sp, #56]
	bne	.L352
	orrs	r3, r4, r5
	beq	.L352
	mov	r0, r7
	bl	vfp_double_normalise_denormal
	b	.L352
	.fnend
	.size	vfp_double_fnmul, .-vfp_double_fnmul
	.align	2
	.type	vfp_double_multiply_accumulate, %function
vfp_double_multiply_accumulate:
	.fnstart
	@ args = 8, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r8, #:lower16:vfp_get_double
	.pad #84
	sub	sp, sp, #84
	mov	r10, r0
	movt	r8, #:upper16:vfp_get_double
	mov	r0, r1
	mov	r6, r2
	mov	r9, r3
	blx	r8
	mov	lr, r0, asl #12
	mov	ip, r1, asl #12
	mov	r5, #-2147483648
	mov	r2, lr, lsr #2
	and	r5, r5, r1
	orr	ip, ip, r0, lsr #20
	ubfx	r1, r1, #20, #11
	mov	r0, r5, lsr #16
	movw	lr, #2047
	orr	r2, r2, ip, asl #30
	cmp	r1, lr
	cmpne	r1, #0
	strh	r1, [sp, #48]	@ movhi
	mov	r3, ip, lsr #2
	strh	r0, [sp, #50]	@ movhi
	beq	.L364
	mov	r0, #0
	mov	r1, #1073741824
	add	fp, sp, #48
	orr	r2, r2, r0
	orr	r3, r3, r1
	strd	r2, [sp, #56]
.L365:
	mov	r0, r6
	blx	r8
	mov	r6, r0
	mov	r7, r1
	mov	r3, r6, asl #12
	mov	r1, r1, asl #12
	mov	r4, r3, lsr #2
	mov	r3, #-2147483648
	ubfx	r2, r7, #20, #11
	orr	r1, r1, r6, lsr #20
	and	r3, r3, r7
	strh	r2, [sp, #64]	@ movhi
	movw	r0, #2047
	mov	r3, r3, lsr #16
	cmp	r2, r0
	cmpne	r2, #0
	orr	r4, r4, r1, asl #30
	mov	r5, r1, lsr #2
	strh	r3, [sp, #66]	@ movhi
	beq	.L366
	mov	r6, #0
	mov	r7, #1073741824
	add	r2, sp, #64
	orr	r4, r4, r6
	orr	r5, r5, r7
	strd	r4, [sp, #72]
.L367:
	mov	r1, fp
	mov	r3, r9
	add	r0, sp, #32
	mov	r5, #-2147483648
	bl	vfp_double_multiply
	ldr	r3, [sp, #120]
	mov	r6, r0
	mov	r0, r10
	tst	r3, #1
	ldrneh	r2, [sp, #34]
	movne	r3, #32768
	movtne	r3, 65535
	eorne	r3, r2, r3
	strneh	r3, [sp, #34]	@ movhi
	blx	r8
	mov	ip, r1, asl #12
	mov	lr, r0, asl #12
	orr	ip, ip, r0, lsr #20
	and	r5, r5, r1
	movw	r0, #2047
	mov	r2, lr, lsr #2
	ubfx	r1, r1, #20, #11
	mov	r3, ip, lsr #2
	cmp	r1, r0
	cmpne	r1, #0
	strh	r1, [sp, #48]	@ movhi
	movne	r1, #1073741824
	orr	r2, r2, ip, asl #30
	orrne	r3, r3, r1
	ldr	r1, [sp, #120]
	movne	r0, #0
	mov	lr, r5, lsr #16
	orrne	r2, r2, r0
	tst	r1, #2
	strd	r2, [sp, #56]
	uxth	lr, lr
	movne	r3, #32768
	movtne	r3, 65535
	eorne	r3, lr, r3
	strh	lr, [sp, #50]	@ movhi
	mov	r1, fp
	strneh	r3, [sp, #50]	@ movhi
	add	r2, sp, #32
	mov	r3, r9
	add	r0, sp, #16
	bl	vfp_double_add
	ldr	r2, [sp, #124]
	orr	r3, r0, r6
	add	r1, sp, #16
	mov	r0, r10
	str	r2, [sp]
	mov	r2, r9
	bl	vfp_double_normaliseround
	add	sp, sp, #84
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L364:
	cmp	r1, #0
	add	fp, sp, #48
	strd	r2, [sp, #56]
	bne	.L365
	orrs	r1, r2, r3
	beq	.L365
	mov	r0, fp
	bl	vfp_double_normalise_denormal
	b	.L365
.L366:
	cmp	r2, #0
	strd	r4, [sp, #72]
	addne	r2, sp, #64
	bne	.L367
	orrs	r2, r4, r5
	add	r2, sp, #64
	beq	.L367
	mov	r0, r2
	str	r2, [sp, #12]
	bl	vfp_double_normalise_denormal
	ldr	r2, [sp, #12]
	b	.L367
	.fnend
	.size	vfp_double_multiply_accumulate, .-vfp_double_multiply_accumulate
	.align	2
	.type	vfp_double_fnmsc, %function
vfp_double_fnmsc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:.LC4
	str	lr, [sp, #-4]!
	.save {lr}
	movt	ip, #:upper16:.LC4
	.pad #12
	sub	sp, sp, #12
	mov	lr, #3
	str	lr, [sp]
	str	ip, [sp, #4]
	bl	vfp_double_multiply_accumulate
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
	.fnend
	.size	vfp_double_fnmsc, .-vfp_double_fnmsc
	.align	2
	.type	vfp_double_fnmac, %function
vfp_double_fnmac:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:.LC5
	str	lr, [sp, #-4]!
	.save {lr}
	movt	ip, #:upper16:.LC5
	.pad #12
	sub	sp, sp, #12
	mov	lr, #1
	str	lr, [sp]
	str	ip, [sp, #4]
	bl	vfp_double_multiply_accumulate
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
	.fnend
	.size	vfp_double_fnmac, .-vfp_double_fnmac
	.align	2
	.type	vfp_double_fmsc, %function
vfp_double_fmsc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:.LC6
	str	lr, [sp, #-4]!
	.save {lr}
	movt	ip, #:upper16:.LC6
	.pad #12
	sub	sp, sp, #12
	mov	lr, #2
	str	lr, [sp]
	str	ip, [sp, #4]
	bl	vfp_double_multiply_accumulate
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
	.fnend
	.size	vfp_double_fmsc, .-vfp_double_fmsc
	.align	2
	.type	vfp_double_fmac, %function
vfp_double_fmac:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:.LC7
	str	lr, [sp, #-4]!
	.save {lr}
	movt	ip, #:upper16:.LC7
	.pad #12
	sub	sp, sp, #12
	mov	lr, #0
	str	lr, [sp]
	str	ip, [sp, #4]
	bl	vfp_double_multiply_accumulate
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
	.fnend
	.size	vfp_double_fmac, .-vfp_double_fmac
	.align	2
	.type	vfp_double_fadd, %function
vfp_double_fadd:
	.fnstart
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	fp, #:lower16:vfp_get_double
	.pad #68
	sub	sp, sp, #68
	movt	fp, #:upper16:vfp_get_double
	mov	r10, r3
	mov	r9, #-2147483648
	str	r0, [sp, #8]
	mov	r0, r1
	str	r2, [sp, #12]
	blx	fp
	mov	r2, r0, asl #12
	mov	r3, r1, asl #12
	mov	r4, r2, lsr #2
	orr	r3, r3, r0, lsr #20
	ubfx	r2, r1, #20, #11
	and	r9, r9, r1
	movw	r0, #2047
	mov	r1, r9, lsr #16
	cmp	r2, r0
	cmpne	r2, #0
	orr	r4, r4, r3, asl #30
	strh	r2, [sp, #32]	@ movhi
	mov	r5, r3, lsr #2
	strh	r1, [sp, #34]	@ movhi
	beq	.L395
	mov	r2, #0
	mov	r3, #1073741824
	add	r6, sp, #32
	orr	r4, r4, r2
	orr	r5, r5, r3
	strd	r4, [sp, #40]
.L396:
	ldr	r0, [sp, #12]
	blx	fp
	mov	r3, r0, asl #12
	mov	ip, r1, asl #12
	mov	r4, r3, lsr #2
	mov	r3, #-2147483648
	ubfx	r2, r1, #20, #11
	orr	ip, ip, r0, lsr #20
	and	r3, r3, r1
	strh	r2, [sp, #48]	@ movhi
	movw	r1, #2047
	mov	r3, r3, lsr #16
	cmp	r2, r1
	cmpne	r2, #0
	orr	r4, r4, ip, asl #30
	mov	r5, ip, lsr #2
	strh	r3, [sp, #50]	@ movhi
	beq	.L397
	mov	r8, #0
	mov	r9, #1073741824
	add	r7, sp, #48
	orr	r4, r4, r8
	orr	r5, r5, r9
	strd	r4, [sp, #56]
.L398:
	mov	r1, r6
	mov	r2, r7
	mov	r3, r10
	add	r0, sp, #16
	bl	vfp_double_add
	movw	ip, #:lower16:.LC8
	mov	r3, r0
	movt	ip, #:upper16:.LC8
	ldr	r0, [sp, #8]
	add	r1, sp, #16
	mov	r2, r10
	str	ip, [sp]
	bl	vfp_double_normaliseround
	add	sp, sp, #68
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L395:
	cmp	r2, #0
	add	r6, sp, #32
	strd	r4, [sp, #40]
	bne	.L396
	orrs	r3, r4, r5
	beq	.L396
	mov	r0, r6
	bl	vfp_double_normalise_denormal
	b	.L396
.L397:
	cmp	r2, #0
	add	r7, sp, #48
	strd	r4, [sp, #56]
	bne	.L398
	orrs	r3, r4, r5
	beq	.L398
	mov	r0, r7
	bl	vfp_double_normalise_denormal
	b	.L398
	.fnend
	.size	vfp_double_fadd, .-vfp_double_fadd
	.align	2
	.type	vfp_double_fmul, %function
vfp_double_fmul:
	.fnstart
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	fp, #:lower16:vfp_get_double
	.pad #68
	sub	sp, sp, #68
	movt	fp, #:upper16:vfp_get_double
	mov	r10, r3
	mov	r9, #-2147483648
	str	r0, [sp, #8]
	mov	r0, r1
	str	r2, [sp, #12]
	blx	fp
	mov	r2, r0, asl #12
	mov	r3, r1, asl #12
	mov	r4, r2, lsr #2
	orr	r3, r3, r0, lsr #20
	ubfx	r2, r1, #20, #11
	and	r9, r9, r1
	movw	r0, #2047
	mov	r1, r9, lsr #16
	cmp	r2, r0
	cmpne	r2, #0
	orr	r4, r4, r3, asl #30
	strh	r2, [sp, #32]	@ movhi
	mov	r5, r3, lsr #2
	strh	r1, [sp, #34]	@ movhi
	beq	.L410
	mov	r2, #0
	mov	r3, #1073741824
	add	r6, sp, #32
	orr	r4, r4, r2
	orr	r5, r5, r3
	strd	r4, [sp, #40]
.L411:
	ldr	r0, [sp, #12]
	blx	fp
	mov	r3, r0, asl #12
	mov	ip, r1, asl #12
	mov	r4, r3, lsr #2
	mov	r3, #-2147483648
	ubfx	r2, r1, #20, #11
	orr	ip, ip, r0, lsr #20
	and	r3, r3, r1
	strh	r2, [sp, #48]	@ movhi
	movw	r1, #2047
	mov	r3, r3, lsr #16
	cmp	r2, r1
	cmpne	r2, #0
	orr	r4, r4, ip, asl #30
	mov	r5, ip, lsr #2
	strh	r3, [sp, #50]	@ movhi
	beq	.L412
	mov	r8, #0
	mov	r9, #1073741824
	add	r7, sp, #48
	orr	r4, r4, r8
	orr	r5, r5, r9
	strd	r4, [sp, #56]
.L413:
	mov	r1, r6
	mov	r2, r7
	mov	r3, r10
	add	r0, sp, #16
	bl	vfp_double_multiply
	movw	ip, #:lower16:.LC9
	mov	r3, r0
	movt	ip, #:upper16:.LC9
	ldr	r0, [sp, #8]
	add	r1, sp, #16
	mov	r2, r10
	str	ip, [sp]
	bl	vfp_double_normaliseround
	add	sp, sp, #68
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L410:
	cmp	r2, #0
	add	r6, sp, #32
	strd	r4, [sp, #40]
	bne	.L411
	orrs	r3, r4, r5
	beq	.L411
	mov	r0, r6
	bl	vfp_double_normalise_denormal
	b	.L411
.L412:
	cmp	r2, #0
	add	r7, sp, #48
	strd	r4, [sp, #56]
	bne	.L413
	orrs	r3, r4, r5
	beq	.L413
	mov	r0, r7
	bl	vfp_double_normalise_denormal
	b	.L413
	.fnend
	.size	vfp_double_fmul, .-vfp_double_fmul
	.align	2
	.type	vfp_double_fsito, %function
vfp_double_fsito:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:vfp_get_float
	stmfd	sp!, {r4, r5, lr}
	.save {r4, r5, lr}
	movt	r1, #:upper16:vfp_get_float
	.pad #28
	sub	sp, sp, #28
	mov	r4, r0
	mov	r0, r2
	mov	r5, r3
	blx	r1
	cmp	r0, #0
	movw	r1, #:lower16:.LC10
	movlt	ip, #32768
	movge	ip, #0
	cmp	ip, #0
	strh	ip, [sp, #10]	@ movhi
	movw	r3, #1085
	mov	ip, #0
	movt	r1, #:upper16:.LC10
	rsbne	lr, r0, #0
	moveq	lr, r0
	strh	r3, [sp, #8]	@ movhi
	str	r1, [sp]
	mov	r0, r4
	mov	r2, r5
	mov	r3, ip
	add	r1, sp, #8
	str	lr, [sp, #16]
	str	ip, [sp, #20]
	bl	vfp_double_normaliseround
	add	sp, sp, #28
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
	.fnend
	.size	vfp_double_fsito, .-vfp_double_fsito
	.align	2
	.type	vfp_double_fuito, %function
vfp_double_fuito:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:vfp_get_float
	stmfd	sp!, {r4, r5, lr}
	.save {r4, r5, lr}
	movt	r1, #:upper16:vfp_get_float
	.pad #28
	sub	sp, sp, #28
	mov	r4, r0
	mov	r0, r2
	mov	r5, r3
	blx	r1
	movw	r1, #:lower16:.LC11
	mov	ip, #0
	movt	r1, #:upper16:.LC11
	str	r0, [sp, #16]
	str	r1, [sp]
	movw	lr, #1085
	mov	r2, r5
	mov	r0, r4
	mov	r3, ip
	add	r1, sp, #8
	strh	ip, [sp, #10]	@ movhi
	str	ip, [sp, #20]
	strh	lr, [sp, #8]	@ movhi
	bl	vfp_double_normaliseround
	add	sp, sp, #28
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
	.fnend
	.size	vfp_double_fuito, .-vfp_double_fuito
	.align	2
	.type	vfp_double_fsqrt, %function
vfp_double_fsqrt:
	.fnstart
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r1, #:lower16:vfp_get_double
	.pad #92
	sub	sp, sp, #92
	movt	r1, #:upper16:vfp_get_double
	str	r0, [sp, #16]
	mov	r0, r2
	str	r3, [sp, #20]
	blx	r1
	mov	r3, #-2147483648
	mov	lr, r0, asl #12
	and	r3, r3, r1
	mov	ip, r1, asl #12
	ubfx	r1, r1, #20, #11
	mov	r4, lr, lsr #2
	mov	lr, r3, lsr #16
	sxth	r3, r1
	orr	ip, ip, r0, lsr #20
	strh	r1, [sp, #56]	@ movhi
	movw	r0, #2047
	uxth	lr, lr
	cmp	r3, r0
	cmpne	r3, #0
	orr	r4, r4, ip, asl #30
	moveq	r2, #0
	movne	r2, #1
	mov	r5, ip, lsr #2
	strh	lr, [sp, #58]	@ movhi
	beq	.L429
	mov	r2, #0
	mov	r3, #1073741824
	orr	r4, r4, r2
	orr	r5, r5, r3
	strd	r4, [sp, #64]
.L430:
	cmp	r1, #0
	beq	.L460
	mov	r5, lr
	cmp	r5, #0
	beq	.L436
.L458:
	movw	r3, #:lower16:.LANCHOR0
	mov	r8, #1
	movt	r3, #:upper16:.LANCHOR0
	ldrh	lr, [r3, #2]
	ldrh	r1, [r3]
	ldr	ip, [r3, #8]
	ldr	r0, [r3, #12]
.L432:
	mov	r4, ip, lsr #10
	mov	r3, lr, asl #16
	mov	r7, r1, asl #20
	mov	r5, r0, lsr #10
	orr	r4, r4, r0, asl #22
	mov	r2, #0
	adds	r0, r2, r2
	movw	ip, #:lower16:vfp_put_double
	adc	r1, r3, r7
	adds	r0, r0, r4
	ldr	r2, [sp, #16]
	adc	r1, r1, r5
	movt	ip, #:upper16:vfp_put_double
	blx	ip
	mov	r0, r8
	add	sp, sp, #92
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L429:
	cmp	r3, r0
	strd	r4, [sp, #64]
	bne	.L430
	orrs	r0, r4, r5
	bne	.L461
	cmp	lr, #0
	bne	.L458
	mov	ip, lr
	mov	r1, r3
	mov	r0, lr
	mov	r8, ip
	b	.L432
.L460:
	orrs	r2, r4, r5
	moveq	r8, r1
	ldreq	ip, [sp, #64]
	ldreq	r0, [sp, #68]
	beq	.L432
.L434:
	add	r0, sp, #56
	bl	vfp_double_normalise_denormal
	ldrh	r5, [sp, #58]
	cmp	r5, #0
	bne	.L458
.L436:
	ldrsh	r0, [sp, #56]
	movw	r3, #:lower16:vfp_estimate_sqrt_significand
	movt	r3, #:upper16:vfp_estimate_sqrt_significand
	ldr	r1, [sp, #68]
	strh	r5, [sp, #74]	@ movhi
	sub	r2, r0, #1020
	sub	r2, r2, #3
	mov	r2, r2, asr #1
	add	r2, r2, #1020
	add	r2, r2, #3
	strh	r2, [sp, #72]	@ movhi
	blx	r3
	ldrh	r1, [sp, #56]
	mov	r7, r0, lsr #1
	ldr	ip, [sp, #64]
	mov	r0, r0, asl #31
	ldr	r2, [sp, #68]
	and	r1, r1, #1
	str	r7, [sp, #12]
	add	r3, r1, #1
	str	r0, [sp, #8]
	mov	r6, ip, lsr r3
	rsb	ip, r3, #32
	sub	r1, r1, #31
	ldrd	r8, [sp, #8]
	orr	r6, r6, r2, asl ip
	mov	r7, r2, lsr r3
	orr	r6, r6, r2, lsr r1
	cmp	r9, r7
	it eq
	cmpeq	r8, r6
	strd	r6, [sp, #64]
	mvnls	r2, #0
	mvnls	r3, #0
	bls	.L437
	ldr	r10, [sp, #12]
	mov	fp, r5
	str	r5, [sp, #40]
	str	r10, [sp, #44]
	ldrd	r8, [sp, #40]
	cmp	r7, r9
	it eq
	cmpeq	r6, r8
	bcs	.L451
	mov	r4, r10
	mov	r0, r6
	mov	r1, r7
	mov	r8, r5
@ 124 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfp.h" 1
	.ifnc r1,r1 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r4,r4 ; .err ; .endif
	bl	__do_div64
@ 0 "" 2
	mov	r9, r2
	mov	ip, r2
.L438:
	ldr	r2, [sp, #8]
	mov	r3, #0
	mov	r5, r3
	mov	r3, r7
	mov	lr, #0
	mov	r4, #0
	str	lr, [sp, #36]
	umull	r0, r1, ip, r2
	mov	r2, r6
	str	lr, [sp, #24]
	umull	r6, r7, ip, r10
	str	r0, [sp, #28]
	mla	r1, ip, r5, r1
	mov	r5, #0
	mla	r7, ip, fp, r7
	str	r1, [sp, #32]
	ldrd	r0, [sp, #32]
	adds	r0, r0, r6
	adc	r1, r1, r7
	ldrd	r6, [sp, #24]
@ 62 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfp.h" 1
	subs	r4, r4, r6
	sbcs	r5, r5, r7
	sbcs	r2, r2, r0
	sbc	r3, r3, r1
	
@ 0 "" 2
	mov	r0, #0
	mov	r1, #0
	cmp	r2, r0
	sbcs	r7, r3, r1
	ldr	r1, [sp, #8]
	mov	r0, lr
	bge	.L439
.L440:
	adds	r8, r8, #0
	sbc	r9, r9, #0
@ 49 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfp.h" 1
	adds	r4, r4, r0
	adcs	r5, r5, r1
	adcs	r2, r2, r10
	adc	r3, r3, fp
@ 0 "" 2
	cmp	r2, #0
	sbcs	ip, r3, #0
	blt	.L440
.L439:
	ldrd	r6, [sp, #40]
	mov	r1, #0
	orr	r0, r5, r1
	orr	r1, r1, r2
	cmp	r7, r1
	it eq
	cmpeq	r6, r0
	bhi	.L441
	mvn	r6, #0
	mov	r7, #0
	orr	r2, r8, r6
	orr	r3, r9, r7
.L437:
	ldrd	r6, [sp, #8]
	movw	r0, #1023
	mov	r1, #0
	adds	r6, r6, #2
	adc	r7, r7, #0
	adds	r6, r6, r2
	adc	r7, r7, r3
	and	r0, r0, r6
	and	r1, r1, r7
	cmp	r1, #0
	it eq
	cmpeq	r0, #5
	bhi	.L459
	cmp	r7, #0
	it eq
	cmpeq	r6, #1
	bls	.L452
	umull	r2, r3, r7, r6
	ldr	lr, [sp, #68]
	mov	r1, #0
	ldr	ip, [sp, #64]
	umull	r8, r9, r7, r7
	mov	fp, lr, asl #2
	adds	r0, r2, r2
	mov	r10, ip, asl #2
	orr	fp, fp, ip, lsr #30
	umull	r4, r5, r6, r6
	strd	r8, [sp, #8]
	strd	r10, [sp, #64]
	mla	r3, r7, r1, r3
	adc	r1, r3, r3
	cmp	r3, r1
	it eq
	cmpeq	r2, r0
	bls	.L453
	mov	r2, #0
	mov	r3, #1
	strd	r2, [sp, #24]
.L444:
	mov	r8, #0
	mov	r9, r0
	adds	r4, r4, r8
	mov	r2, r1
	adc	r5, r5, r0
	ldrd	r0, [sp, #8]
	adds	r2, r2, r0
	mov	r0, #0
	adc	r3, r8, r1
	cmp	r9, r5
	it eq
	cmpeq	r8, r4
	ldrd	r8, [sp, #24]
	movls	r1, #0
	movhi	r1, #1
	adds	r2, r2, r1
	mov	r1, #0
	adc	r3, r3, #0
	adds	r2, r2, r8
	adc	r3, r3, r9
@ 62 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfp.h" 1
	subs	r0, r0, r4
	sbcs	r1, r1, r5
	sbcs	r10, r10, r2
	sbc	fp, fp, r3
	
@ 0 "" 2
	cmp	r10, #0
	sbcs	r9, fp, #0
	bge	.L454
	strd	r6, [sp, #8]
	mov	r8, #1
	mov	r9, #0
	mov	r6, r0
	mov	r7, r1
.L447:
	ldrd	r2, [sp, #8]
	mov	r5, #0
	subs	r2, r2, #1
	sbc	r3, r3, #0
	adds	r0, r2, r2
	adc	r1, r3, r3
	mov	r4, r3, lsr #31
	orr	r0, r0, r8
	strd	r2, [sp, #8]
	orr	r1, r1, r9
@ 49 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfp.h" 1
	adds	r6, r6, r0
	adcs	r7, r7, r1
	adcs	r10, r10, r4
	adc	fp, fp, r5
@ 0 "" 2
	cmp	r10, #0
	sbcs	ip, fp, #0
	blt	.L447
	mov	r0, r6
	mov	r1, r7
.L445:
	orr	r1, r1, fp
	orr	r0, r0, r10
	orrs	lr, r0, r1
	mov	r7, r3
	moveq	r1, #0
	movne	r1, #1
	orr	r6, r2, r1
.L459:
	mov	r3, r6, asl #31
	movs	r7, r7, lsr #1
	mov	r6, r6, rrx
	adds	r3, r3, #0
	movne	r3, #1
	orr	r6, r6, r3
.L443:
	movw	r3, #:lower16:.LC12
	ldr	r0, [sp, #16]
	movt	r3, #:upper16:.LC12
	ldr	r2, [sp, #20]
	str	r3, [sp]
	add	r1, sp, #72
	mov	r3, #0
	strd	r6, [sp, #80]
	bl	vfp_double_normaliseround
	mov	r8, r0
	mov	r0, r8
	add	sp, sp, #92
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L461:
	add	r1, sp, #56
	ldr	r3, [sp, #20]
	add	r0, sp, #72
	bl	vfp_propagate_nan
	ldrh	lr, [sp, #74]
	mov	r8, r0
	ldrh	r1, [sp, #72]
	ldr	ip, [sp, #80]
	ldr	r0, [sp, #84]
	b	.L432
.L451:
	mvn	ip, #0
	mov	r8, #0
	mvn	r9, #0
	b	.L438
.L452:
	mvn	r6, #0
	mvn	r7, #-2147483648
	b	.L443
.L441:
	mov	r4, r10
@ 138 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfp.h" 1
	.ifnc r1,r1 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r4,r4 ; .err ; .endif
	bl	__do_div64
@ 0 "" 2
	orr	r2, r2, r8
	orr	r3, r3, r9
	b	.L437
.L453:
	mov	r8, #0
	mov	r9, #0
	strd	r8, [sp, #24]
	b	.L444
.L454:
	mov	r2, r6
	mov	r3, r7
	b	.L445
	.fnend
	.size	vfp_double_fsqrt, .-vfp_double_fsqrt
	.align	2
	.global	vfp_double_cpdo
	.type	vfp_double_cpdo, %function
vfp_double_cpdo:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #64
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movt	r3, 176
	and	r8, r1, #3145728
	mov	r2, #64
	and	r3, r0, r3
	cmp	r8, #3145728
	movt	r2, 176
	movne	r8, #1
	moveq	r8, #2
	cmp	r3, r2
	and	r6, r0, #983040
	andne	r10, r0, #11534336
	moveq	r10, r6, lsr #15
	ldreq	r3, .L484
	movne	r10, r10, lsr #20
	ldrne	r3, .L484+4
	mov	fp, r1
	and	r2, r0, #128
	andne	r1, r0, #64
	orrne	r10, r10, r1, lsr #4
	orreq	r10, r10, r2, lsr #7
	add	r10, r3, r10, asl #3
	.pad #12
	sub	sp, sp, #12
	ldr	r3, [r10, #4]
	tst	r3, #2
	andne	r1, r0, #61440
	ubfxne	r5, r0, #22, #1
	andeq	r5, r0, #4194304
	ubfxeq	r1, r0, #12, #4
	orrne	r5, r5, r1, lsr #11
	orreq	r5, r1, r5, lsr #18
	tst	r3, #4
	ubfxne	r1, r0, #5, #1
	andeq	r4, r0, #32
	andne	r0, r0, #15
	andeq	r0, r0, #15
	orrne	r4, r1, r0, asl #1
	orreq	r4, r0, r4, lsr #1
	tst	r3, #1
	movne	r3, #0
	strne	r3, [sp, #4]
	bne	.L470
	ands	r3, r5, #12
	andne	r3, fp, #458752
	strne	r3, [sp, #4]
	beq	.L482
.L470:
	ldr	ip, [r10]
	cmp	ip, #0
	mvneq	r0, #0
	beq	.L471
	mov	r6, r6, lsr #16
	mov	r7, #0
	mov	r9, r7
	orr	r6, r6, r2, lsr #3
	b	.L473
.L483:
	ldr	ip, [r10]
.L473:
	mov	r1, r6
	mov	r2, r4
	mov	r0, r5
	mov	r3, fp
	blx	ip
	add	r3, r6, r8
	and	r6, r6, #12
	and	r3, r3, #3
	add	ip, r4, r8
	add	r6, r3, r6
	ldr	r3, [sp, #4]
	ands	r1, r4, #12
	add	r7, r7, #65536
	and	ip, ip, #3
	add	r2, r5, r8
	addne	r4, ip, r1
	cmp	r3, r7
	and	r2, r2, #3
	and	r5, r5, #12
	orr	r9, r9, r0
	add	r5, r2, r5
	bcs	.L483
	mov	r0, r9
.L471:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L482:
	str	r3, [sp, #4]
	b	.L470
.L485:
	.align	2
.L484:
	.word	.LANCHOR0+16
	.word	.LANCHOR0+272
	.fnend
	.size	vfp_double_cpdo, .-vfp_double_cpdo
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.5706, %object
	.size	__func__.5706, 15
__func__.5706:
	.ascii	"vfp_double_add\000"
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	vfp_double_default_qnan, %object
	.size	vfp_double_default_qnan, 16
vfp_double_default_qnan:
	.short	2047
	.short	0
	.space	4
	.word	0
	.word	536870912
	.type	fops_ext, %object
	.size	fops_ext, 256
fops_ext:
	.word	vfp_double_fcpy
	.word	0
	.word	vfp_double_fabs
	.word	0
	.word	vfp_double_fneg
	.word	0
	.word	vfp_double_fsqrt
	.word	0
	.space	32
	.word	vfp_double_fcmp
	.word	1
	.word	vfp_double_fcmpe
	.word	1
	.word	vfp_double_fcmpz
	.word	1
	.word	vfp_double_fcmpez
	.word	1
	.space	24
	.word	vfp_double_fcvts
	.word	3
	.word	vfp_double_fuito
	.word	5
	.word	vfp_double_fsito
	.word	5
	.space	48
	.word	vfp_double_ftoui
	.word	3
	.word	vfp_double_ftouiz
	.word	3
	.word	vfp_double_ftosi
	.word	3
	.word	vfp_double_ftosiz
	.word	3
	.space	32
	.type	fops, %object
	.size	fops, 128
fops:
	.word	vfp_double_fmac
	.word	0
	.word	vfp_double_fmsc
	.word	0
	.word	vfp_double_fmul
	.word	0
	.word	vfp_double_fadd
	.word	0
	.word	vfp_double_fnmac
	.word	0
	.word	vfp_double_fnmsc
	.word	0
	.word	vfp_double_fnmul
	.word	0
	.word	vfp_double_fsub
	.word	0
	.word	vfp_double_fdiv
	.word	0
	.space	56
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>VFP: bad FP values in %s\012\000"
	.space	3
.LC1:
	.ascii	"fdiv\000"
	.space	3
.LC2:
	.ascii	"fsub\000"
	.space	3
.LC3:
	.ascii	"fnmul\000"
	.space	2
.LC4:
	.ascii	"fnmsc\000"
	.space	2
.LC5:
	.ascii	"fnmac\000"
	.space	2
.LC6:
	.ascii	"fmsc\000"
	.space	3
.LC7:
	.ascii	"fmac\000"
	.space	3
.LC8:
	.ascii	"fadd\000"
	.space	3
.LC9:
	.ascii	"fmul\000"
	.space	3
.LC10:
	.ascii	"fsito\000"
	.space	2
.LC11:
	.ascii	"fuito\000"
	.space	2
.LC12:
	.ascii	"fsqrt\000"
	.ident	"GCC: (GNU) 4.8"
