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
	.file	"vfpsingle.c"
	.text
	.align	2
	.type	vfp_propagate_nan, %function
vfp_propagate_nan:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	.save {r4, r5}
	mov	r4, r0
	ldrh	ip, [r1]
	cmp	ip, #255
	beq	.L24
	cmp	ip, #0
	movne	ip, #0
	movne	r0, #1
	beq	.L25
.L3:
	cmp	r2, #0
	moveq	r5, r2
	beq	.L4
	ldrh	r5, [r2]
	cmp	r5, #255
	beq	.L26
	cmp	r5, #0
	movne	r5, #1
	beq	.L27
.L4:
	tst	r3, #33554432
	movwne	r1, #:lower16:.LANCHOR0
	movtne	r1, #:upper16:.LANCHOR0
	bne	.L6
	cmp	r0, #48
	beq	.L7
	subs	r5, r5, #48
	movne	r5, #1
	cmp	r0, #16
	movne	r5, #0
	cmp	r5, #0
	moveq	r1, r2
.L7:
	ldr	r3, [r1, #4]
	orr	r3, r3, #536870912
	str	r3, [r1, #4]
.L6:
	ldmia	r1, {r0, r1}
	cmp	ip, #0
	stmia	r4, {r0, r1}
	moveq	r0, #256
	movne	r0, #1
	ldmfd	sp!, {r4, r5}
	bx	lr
.L25:
	ldr	r0, [r1, #4]
	cmp	r0, #0
	movne	r0, #5
	moveq	r0, #3
	b	.L3
.L27:
	ldr	r5, [r2, #4]
	cmp	r5, #0
	moveq	r5, #3
	movne	r5, #5
	b	.L4
.L24:
	ldr	ip, [r1, #4]
	cmp	ip, #0
	moveq	r0, #8
	beq	.L3
	and	ip, ip, #536870912
	cmp	ip, #0
	movne	ip, #0
	moveq	ip, #1
	moveq	r0, #48
	movne	r0, #16
	b	.L3
.L26:
	ldr	r5, [r2, #4]
	cmp	r5, #0
	moveq	r5, #8
	beq	.L4
	and	r5, r5, #536870912
	cmp	r5, #0
	moveq	ip, #1
	moveq	r5, #48
	movne	r5, #16
	b	.L4
	.fnend
	.size	vfp_propagate_nan, .-vfp_propagate_nan
	.align	2
	.type	vfp_single_multiply, %function
vfp_single_multiply:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6}
	.save {r4, r5, r6}
	mov	ip, r0
	ldrsh	r4, [r1]
	ldrsh	r0, [r2]
	cmp	r4, r0
	movlt	r0, r1
	movlt	r1, r2
	movlt	r2, r0
	ldrh	r0, [r1, #2]
	ldrh	r4, [r2, #2]
	eor	r0, r4, r0
	strh	r0, [ip, #2]	@ movhi
	ldrh	r0, [r1]
	cmp	r0, #255
	beq	.L40
	ldrh	r5, [r2]
	ldr	r3, [r2, #4]
	sxth	r4, r5
	orrs	r3, r4, r3
	beq	.L41
	add	r0, r0, r5
	mov	r6, #0
	sub	r0, r0, #125
	strh	r0, [ip]	@ movhi
	ldr	r3, [r1, #4]
	ldr	r2, [r2, #4]
	umull	r2, r3, r2, r3
@ 38 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfp.h" 1
	cmp	r2, #1		@ vfp_hi64to32jamming
	movcc	r2, r3
	orrcs	r2, r3, #1
@ 0 "" 2
	str	r2, [ip, #4]
.L34:
	mov	r0, r6
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L41:
	mov	r6, r3
	strh	r3, [ip]	@ movhi
	mov	r0, r6
	str	r3, [ip, #4]
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L40:
	ldr	r0, [r1, #4]
	cmp	r0, #0
	bne	.L31
	ldrsh	r0, [r2]
	cmp	r0, #255
	beq	.L42
	ldr	r3, [r2, #4]
	orrs	r3, r0, r3
	bne	.L33
	movw	r3, #:lower16:.LANCHOR0
	mov	r6, #1
	movt	r3, #:upper16:.LANCHOR0
	ldmia	r3, {r0, r1}
	stmia	ip, {r0, r1}
	b	.L34
.L42:
	ldr	r0, [r2, #4]
	cmp	r0, #0
	bne	.L31
.L33:
	mov	r3, #0
	mov	r2, #255
	strh	r2, [ip]	@ movhi
	mov	r6, r3
	str	r3, [ip, #4]
	b	.L34
.L31:
	mov	r0, ip
	ldmfd	sp!, {r4, r5, r6}
	b	vfp_propagate_nan
	.fnend
	.size	vfp_single_multiply, .-vfp_single_multiply
	.align	2
	.type	vfp_single_ftosi, %function
vfp_single_ftosi:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	ubfx	lr, r2, #23, #8
	cmp	r2, #0
	sxth	ip, lr
	mov	r2, r2, asl #9
	movlt	r5, #32768
	movge	r5, #0
	mov	r2, r2, lsr #2
	cmp	ip, #255
	cmpne	ip, #0
	mov	r1, r0
	and	r3, r3, #12582912
	moveq	r0, #0
	movne	r0, #1
	orrne	r2, r2, #1073741824
	bne	.L45
	cmp	ip, #255
	bne	.L45
	cmp	r2, #0
	movne	r4, #1
	bne	.L47
.L46:
	cmp	r5, #0
	mov	r4, #1
	movne	r0, #-2147483648
	mvneq	r0, #-2147483648
.L47:
	movw	r3, #:lower16:vfp_put_float
	movt	r3, #:upper16:vfp_put_float
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, pc}
.L45:
	cmp	lr, #0
	bne	.L48
	cmp	r2, #0
	movne	r4, #128
	moveq	r4, #0
.L50:
	orrs	r0, ip, r2
	beq	.L47
	cmp	r3, #4194304
	orr	r4, r4, #16
	beq	.L80
	cmp	r3, #8388608
	movne	r0, #0
	bne	.L47
	subs	r0, r5, #0
	mvnne	r0, #0
	b	.L47
.L48:
	cmp	ip, #158
	bgt	.L46
	cmp	ip, #125
	ble	.L65
	mov	lr, r2, asl #1
	cmp	r3, #0
	rsb	r0, ip, #158
	sub	ip, ip, #125
	mov	r0, lr, lsr r0
	mov	r2, r2, asl ip
	bne	.L52
	tst	r0, #1
	mvneq	r3, #-2147483648
	movne	r3, #-2147483648
.L53:
	cmn	r3, r2
	bcc	.L54
	cmn	r0, #1
	beq	.L55
	add	r0, r0, #1
.L54:
	cmp	r5, #0
	beq	.L81
	cmp	r0, #-2147483648
	bls	.L62
.L71:
	mov	r0, #-2147483648
.L61:
	mov	r4, #1
	b	.L58
.L65:
	mov	r4, #0
	b	.L50
.L52:
	cmp	r3, #12582912
	moveq	r3, #0
	beq	.L53
	subs	ip, r3, #4194304
	rsbs	r3, ip, #0
	adcs	r3, r3, ip
	cmp	r5, #0
	eorne	r3, r3, #1
	rsb	r3, r3, #0
	b	.L53
.L81:
	cmn	r0, #-2147483647
	bhi	.L72
.L62:
	cmp	r2, #0
	movne	r4, #16
	moveq	r4, #0
.L58:
	cmp	r5, #0
	rsbne	r0, r0, #0
	b	.L47
.L80:
	rsbs	r0, r5, #1
	movcc	r0, #0
	b	.L47
.L55:
	cmp	r5, #0
	bne	.L71
.L72:
	mvn	r0, #-2147483648
	b	.L61
	.fnend
	.size	vfp_single_ftosi, .-vfp_single_ftosi
	.align	2
	.type	vfp_single_ftosiz, %function
vfp_single_ftosiz:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #12582912
	b	vfp_single_ftosi
	.fnend
	.size	vfp_single_ftosiz, .-vfp_single_ftosiz
	.align	2
	.type	vfp_single_ftoui, %function
vfp_single_ftoui:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	ubfx	lr, r2, #23, #8
	cmp	r2, #0
	sxth	ip, lr
	mov	r2, r2, asl #9
	movlt	r5, #32768
	movge	r5, #0
	mov	r2, r2, lsr #2
	cmp	ip, #255
	cmpne	ip, #0
	mov	r1, r0
	orrne	r2, r2, #1073741824
	bne	.L85
	cmp	ip, #255
	bne	.L85
	cmp	r2, #0
	bne	.L87
	cmp	r5, #0
	movne	r0, #0
	movne	r4, #1
	bne	.L89
.L87:
	mvn	r0, #0
	mov	r4, #1
.L89:
	movw	r3, #:lower16:vfp_put_float
	movt	r3, #:upper16:vfp_put_float
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, pc}
.L85:
	cmp	lr, #0
	bne	.L86
	cmp	r2, #0
	movne	lr, #128
	beq	.L86
.L88:
	cmp	ip, #125
	and	r3, r3, #12582912
	bgt	.L120
	orrs	r0, r2, ip
	beq	.L104
	cmp	r3, #4194304
	orr	r4, lr, #16
	beq	.L121
	cmp	r3, #8388608
	movne	r0, #0
	bne	.L89
	cmp	r5, #0
	orrne	r4, lr, #17
	movne	r0, #0
	moveq	r0, r5
	b	.L89
.L86:
	cmp	ip, #158
	movle	lr, #0
	ble	.L88
	cmp	r5, #0
	movne	r0, #0
	movne	r4, #1
	beq	.L87
	b	.L89
.L120:
	mov	r4, r2, asl #1
	cmp	r3, #0
	rsb	r0, ip, #158
	sub	ip, ip, #125
	mov	r0, r4, lsr r0
	mov	r2, r2, asl ip
	beq	.L122
	cmp	r3, #12582912
	moveq	r3, #0
	beq	.L92
	subs	r4, r3, #4194304
	rsbs	r3, r4, #0
	adcs	r3, r3, r4
	cmp	r5, #0
	eorne	r3, r3, #1
	rsb	r3, r3, #0
.L92:
	cmn	r3, r2
	bcc	.L93
.L123:
	cmn	r0, #1
	addne	r0, r0, #1
	orreq	lr, lr, #1
.L99:
	cmp	r5, #0
	orrne	r4, lr, #1
	movne	r0, #0
	bne	.L89
.L96:
	cmp	r2, #0
	orrne	r4, lr, #16
	bne	.L89
.L104:
	mov	r4, lr
	b	.L89
.L122:
	tst	r0, #1
	mvneq	r3, #-2147483648
	movne	r3, #-2147483648
	cmn	r3, r2
	bcs	.L123
.L93:
	cmp	r0, #0
	beq	.L96
	b	.L99
.L121:
	rsbs	r0, r5, #1
	movcc	r0, #0
	b	.L89
	.fnend
	.size	vfp_single_ftoui, .-vfp_single_ftoui
	.align	2
	.type	vfp_single_ftouiz, %function
vfp_single_ftouiz:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #12582912
	b	vfp_single_ftoui
	.fnend
	.size	vfp_single_ftouiz, .-vfp_single_ftouiz
	.align	2
	.type	vfp_single_fneg, %function
vfp_single_fneg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:vfp_put_float
	mov	r1, r0
	movt	r3, #:upper16:vfp_put_float
	add	r0, r2, #-2147483648
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	vfp_single_fneg, .-vfp_single_fneg
	.align	2
	.type	vfp_single_fabs, %function
vfp_single_fabs:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:vfp_put_float
	mov	r1, r0
	movt	r3, #:upper16:vfp_put_float
	bic	r0, r2, #-2147483648
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	vfp_single_fabs, .-vfp_single_fabs
	.align	2
	.type	vfp_single_fcpy, %function
vfp_single_fcpy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:vfp_put_float
	mov	r1, r0
	movt	r3, #:upper16:vfp_put_float
	mov	r0, r2
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	vfp_single_fcpy, .-vfp_single_fcpy
	.align	2
	.type	vfp_single_normalise_denormal, %function
vfp_single_normalise_denormal:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #4]
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r3, r2
@ 0 "" 2
	subs	r3, r3, #1
	bxeq	lr
	ldrh	r1, [r0]
	mov	r2, r2, asl r3
	str	r2, [r0, #4]
	add	r2, r1, #1
	rsb	r3, r3, r2
	strh	r3, [r0]	@ movhi
	bx	lr
	.fnend
	.size	vfp_single_normalise_denormal, .-vfp_single_normalise_denormal
	.align	2
	.type	vfp_single_add, %function
vfp_single_add:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r1
	ldr	r1, [r1, #4]
	.pad #8
	sub	sp, sp, #8
	mov	r5, r0
	cmp	r1, #0
	blt	.L134
	ldr	r1, [r2, #4]
	cmp	r1, #0
	blt	.L134
.L135:
	ldrh	r1, [r4]
	ldrh	r0, [r2]
	sxth	r6, r1
	sxth	ip, r0
	cmp	r6, ip
	movlt	ip, r4
	movlt	r1, r0
	movlt	r4, r2
	movlt	r2, ip
	cmp	r1, #255
	beq	.L166
	ldmia	r4, {r0, r1}
	stmia	r5, {r0, r1}
	ldrsh	ip, [r4]
	ldrsh	r0, [r2]
	ldr	r1, [r2, #4]
	subs	r0, ip, r0
	beq	.L146
	cmp	r0, #31
	bhi	.L147
	rsb	ip, r0, #32
	mov	ip, r1, asl ip
	adds	ip, ip, #0
	movne	ip, #1
	orr	r1, ip, r1, lsr r0
.L146:
	ldrh	r2, [r2, #2]
	ldrh	r0, [r4, #2]
	cmp	r0, r2
	ldr	r2, [r4, #4]
	addeq	r2, r1, r2
	beq	.L150
	rsb	r2, r1, r2
	cmp	r2, #0
	blt	.L167
	bne	.L150
	and	r3, r3, #12582912
	cmp	r3, #8388608
	movne	r3, r2
	moveq	r3, #32768
	strh	r3, [r5, #2]	@ movhi
.L150:
	mov	r3, #0
	str	r2, [r5, #4]
.L145:
	mov	r0, r3
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, pc}
.L147:
	adds	r1, r1, #0
	movne	r1, #1
	b	.L146
.L167:
	ldrh	r1, [r5, #2]
	mov	r3, #32768
	movt	r3, 65535
	rsb	r2, r2, #0
	eor	r3, r1, r3
	strh	r3, [r5, #2]	@ movhi
	b	.L150
.L166:
	ldr	r1, [r4, #4]
	ldrh	r0, [r2]
	cmp	r1, #0
	moveq	r1, #8
	movne	r1, #0
	cmp	r0, #255
	beq	.L168
	cmp	r0, #0
	movne	r0, #1
	bne	.L140
	ldr	r0, [r2, #4]
	cmp	r0, #0
	movne	r0, #5
	moveq	r0, #3
.L140:
	ands	ip, r0, r1
	bne	.L169
	cmp	r1, #0
	beq	.L144
	tst	r0, #1
	movne	r3, ip
	beq	.L144
.L143:
	ldmia	r4, {r0, r1}
	stmia	r5, {r0, r1}
	b	.L145
.L169:
	ldrh	r1, [r4, #2]
	movw	r3, #:lower16:.LANCHOR0
	ldrh	r2, [r2, #2]
	movt	r3, #:upper16:.LANCHOR0
	cmp	r1, r2
	movne	r4, r3
	moveq	r3, #0
	movne	r3, #1
	b	.L143
.L168:
	ldr	r0, [r2, #4]
	cmp	r0, #0
	moveq	r0, #8
	beq	.L140
	tst	r0, #536870912
	moveq	r0, #48
	movne	r0, #16
	b	.L140
.L144:
	mov	r0, r5
	mov	r1, r4
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, lr}
	b	vfp_propagate_nan
.L134:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR1
	movw	ip, #:lower16:printk
	str	r2, [sp, #4]
	str	r3, [sp]
	movt	r0, #:upper16:.LC0
	movt	r1, #:upper16:.LANCHOR1
	movt	ip, #:upper16:printk
	blx	ip
	ldr	r3, [sp]
	ldr	r2, [sp, #4]
	b	.L135
	.fnend
	.size	vfp_single_add, .-vfp_single_add
	.align	2
	.type	vfp_compare, %function
vfp_compare:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:vfp_get_float
	mov	r4, r2
	movt	r3, #:upper16:vfp_get_float
	mov	r5, r1
	blx	r3
	ubfx	r2, r4, #23, #8
	mov	r3, r0
	cmp	r2, #255
	movne	r0, #0
	beq	.L191
.L171:
	ubfx	r2, r3, #23, #8
	cmp	r2, #255
	beq	.L192
.L172:
	cmp	r0, #0
	ldmnefd	sp!, {r3, r4, r5, pc}
	cmp	r3, r4
	beq	.L184
	orr	r2, r3, r4
	bic	r2, r2, #-2147483648
	cmp	r2, #0
	beq	.L184
	teq	r3, r4
	bmi	.L193
	mov	r0, r3, lsr #31
	cmp	r3, r4
	movge	r2, r0
	eorlt	r2, r0, #1
	cmp	r2, #0
	bne	.L176
	cmp	r3, r4
	eorgt	r0, r0, #1
	mov	r0, r0, asl #29
	ldmfd	sp!, {r3, r4, r5, pc}
.L184:
	mov	r0, #1610612736
	ldmfd	sp!, {r3, r4, r5, pc}
.L192:
	ubfx	r2, r3, #0, #23
	cmp	r2, #0
	beq	.L172
	cmp	r5, #0
	bne	.L182
	tst	r3, #4194304
	bne	.L194
.L182:
	mov	r0, #805306369
	ldmfd	sp!, {r3, r4, r5, pc}
.L191:
	ubfx	r0, r4, #0, #23
	cmp	r0, #0
	beq	.L171
	cmp	r5, #0
	movne	r0, #805306369
	bne	.L171
	tst	r4, #4194304
	moveq	r0, #805306369
	movne	r0, #805306368
	b	.L171
.L176:
	mov	r0, #-2147483648
	ldmfd	sp!, {r3, r4, r5, pc}
.L193:
	cmp	r3, #0
	blt	.L176
	mov	r0, #536870912
	ldmfd	sp!, {r3, r4, r5, pc}
.L194:
	orr	r0, r0, #805306368
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	vfp_compare, .-vfp_compare
	.align	2
	.type	vfp_single_fcmpez, %function
vfp_single_fcmpez:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #1
	mov	r2, #0
	b	vfp_compare
	.fnend
	.size	vfp_single_fcmpez, .-vfp_single_fcmpez
	.align	2
	.type	vfp_single_fcmpz, %function
vfp_single_fcmpz:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	mov	r2, r1
	b	vfp_compare
	.fnend
	.size	vfp_single_fcmpz, .-vfp_single_fcmpz
	.align	2
	.type	vfp_single_fcmpe, %function
vfp_single_fcmpe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #1
	b	vfp_compare
	.fnend
	.size	vfp_single_fcmpe, .-vfp_single_fcmpe
	.align	2
	.type	vfp_single_fcmp, %function
vfp_single_fcmp:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	b	vfp_compare
	.fnend
	.size	vfp_single_fcmp, .-vfp_single_fcmp
	.align	2
	.type	vfp_single_fcvtd, %function
vfp_single_fcvtd:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r1, r2, asl #9
	ubfx	r4, r2, #23, #8
	mov	r8, r0
	sxth	r0, r4
	cmp	r2, #0
	mov	r1, r1, lsr #2
	movlt	ip, #32768
	movge	ip, #0
	cmp	r0, #255
	cmpne	r0, #0
	.pad #44
	sub	sp, sp, #44
	orrne	r1, r1, #1073741824
	strh	r4, [sp, #16]	@ movhi
	strh	ip, [sp, #18]	@ movhi
	strne	r1, [sp, #20]
	beq	.L219
.L201:
	cmp	r4, #0
	beq	.L220
	mov	r1, #0
	mov	r2, #1
.L202:
	ldrh	ip, [sp, #18]
	cmp	r1, #0
	ldr	r5, [sp, #20]
	mov	r4, #0
	strh	ip, [sp, #26]	@ movhi
	strd	r4, [sp, #32]
	beq	.L210
	cmp	r2, #16
	mvn	r3, #63488
	strh	r3, [sp, #24]	@ movhi
	movne	r2, r4
	movne	r3, r5
	movne	r9, r4
	beq	.L221
.L205:
	mov	r4, r2, lsr #10
	mov	r7, ip, asl #16
	mov	r5, r3, lsr #10
	orr	r4, r4, r3, asl #22
	mov	r6, #0
	mov	r0, #0
	mov	r1, #0
	adds	r0, r0, r6
	movt	r1, 32752
	movw	r3, #:lower16:vfp_put_double
	adc	r1, r1, r7
	adds	r0, r0, r4
	mov	r2, r8
	adc	r1, r1, r5
	movt	r3, #:upper16:vfp_put_double
	blx	r3
	mov	r0, r9
	add	sp, sp, #44
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L219:
	cmp	r0, #255
	str	r1, [sp, #20]
	bne	.L201
	cmp	r1, #0
	beq	.L211
	ands	r2, r1, #536870912
	beq	.L222
	mov	r1, #16
	mov	r2, r1
	b	.L202
.L220:
	cmp	r1, #0
	moveq	r2, #3
	beq	.L202
.L223:
	add	r0, sp, #16
	str	r3, [sp, #12]
	bl	vfp_single_normalise_denormal
	ldr	r3, [sp, #12]
	mov	r2, #5
	ldrh	r0, [sp, #18]
	ldr	r1, [sp, #20]
	str	r4, [sp, #32]
	strh	r0, [sp, #26]	@ movhi
	str	r1, [sp, #36]
.L210:
	tst	r2, #2
	movw	r1, #:lower16:.LC1
	ldreqh	r2, [sp, #16]
	movne	r2, #0
	movt	r1, #:upper16:.LC1
	movw	ip, #:lower16:vfp_double_normaliseround
	str	r1, [sp]
	mov	r0, r8
	addeq	r2, r2, #896
	movt	ip, #:upper16:vfp_double_normaliseround
	strh	r2, [sp, #24]	@ movhi
	add	r1, sp, #24
	mov	r2, r3
	mov	r3, #0
	blx	ip
	add	sp, sp, #44
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L211:
	mov	r1, #8
	mov	r2, r1
	b	.L202
.L221:
	mov	r2, #0
	mov	r3, #536870912
	orr	r5, r5, r3
	mov	r9, r4
	orr	r4, r4, r2
	mov	r3, r5
	strd	r4, [sp, #32]
	mov	r2, r4
	b	.L205
.L222:
	mvn	r0, #63488
	strh	ip, [sp, #26]	@ movhi
	str	r2, [sp, #32]
	mov	r3, r1
	str	r1, [sp, #36]
	mov	r9, #1
	strh	r0, [sp, #24]	@ movhi
	b	.L205
	.fnend
	.size	vfp_single_fcvtd, .-vfp_single_fcvtd
	.align	2
	.global	__vfp_single_normaliseround
	.type	__vfp_single_normaliseround, %function
__vfp_single_normaliseround:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r4, r3
	ldrsh	lr, [r1]
	ldr	ip, [r1, #4]
	cmp	lr, #255
	beq	.L259
	cmp	ip, #0
	beq	.L260
.L228:
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r5, ip
@ 0 "" 2
	adds	r6, r5, #0
	mov	r3, lr
	movne	r6, #1
	cmp	r5, #31
	movgt	r6, #0
	cmp	r6, #0
	rsbne	r3, r5, lr
	movne	ip, ip, asl r5
	cmp	r3, #0
	movge	r7, #0
	bge	.L230
	rsb	r3, r3, #0
	cmp	r3, #31
	bls	.L261
	adds	ip, ip, #0
	movne	ip, #1
.L232:
	tst	ip, #255
	mov	r3, #0
	moveq	r7, #0
	movne	r7, #1
.L230:
	ands	r2, r2, #12582912
	ldrh	r5, [r1, #2]
	bne	.L233
	tst	ip, #256
	moveq	r2, #127
	movne	r2, #128
.L235:
	adds	r6, r2, ip
	andcs	lr, ip, #1
	movcs	r2, r2, lsr #1
	orrcs	ip, lr, ip, lsr #1
	addcs	r3, r3, #1
	addcs	r6, r2, ip
	tst	ip, #255
	orrne	r4, r4, #16
	cmp	r3, #253
	ble	.L239
	cmp	r2, #0
	orr	r4, r4, #20
	bne	.L240
	mov	ip, #253
	mvn	r2, #-2147483648
	mov	r3, #0
	strh	ip, [r1]	@ movhi
	str	r2, [r1, #4]
	movt	r3, 32384
	mvn	lr, #-16777216
	b	.L227
.L260:
	ldrh	r5, [r1, #2]
	mov	lr, ip
	mov	r3, ip
	strh	ip, [r1]	@ movhi
.L227:
	add	r3, r3, r5, asl #16
	movw	r2, #:lower16:vfp_put_float
	mov	r1, r0
	movt	r2, #:upper16:vfp_put_float
	add	r0, r3, lr
	blx	r2
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L233:
	cmp	r2, #12582912
	moveq	r2, #0
	beq	.L235
	adds	lr, r5, #0
	movne	lr, #1
	cmp	r2, #4194304
	movne	r2, lr
	eoreq	r2, lr, #1
	cmp	r2, #0
	movne	r2, #255
	moveq	r2, #0
	b	.L235
.L259:
	cmp	ip, #0
	beq	.L262
	cmp	r3, #0
	beq	.L228
	mov	r3, #0
	mov	lr, ip, lsr #7
	ldrh	r5, [r1, #2]
	movt	r3, 32640
	b	.L227
.L239:
	movs	lr, r6, lsr #8
	beq	.L246
	adds	r2, r3, #0
	uxth	ip, r3
	mov	r3, r3, asl #23
	movne	r2, #1
.L241:
	cmp	r6, #-2147483648
	orrhi	r2, r2, #1
	tst	r2, #255
	bne	.L242
	cmp	r7, #0
	orrne	r4, r4, #8
.L242:
	mov	r6, r6, lsr #1
	strh	ip, [r1]	@ movhi
	str	r6, [r1, #4]
	b	.L227
.L246:
	mov	r3, lr
	mov	ip, lr
	mov	r2, lr
	b	.L241
.L240:
	mov	lr, #0
	mov	r2, #255
	mov	r3, lr
	strh	r2, [r1]	@ movhi
	str	lr, [r1, #4]
	movt	r3, 32640
	b	.L227
.L261:
	rsb	lr, r3, #32
	mov	lr, ip, asl lr
	adds	lr, lr, #0
	movne	lr, #1
	orr	ip, lr, ip, lsr r3
	b	.L232
.L262:
	mov	r3, #0
	ldrh	r5, [r1, #2]
	mov	lr, ip
	movt	r3, 32640
	b	.L227
	.fnend
	.size	__vfp_single_normaliseround, .-__vfp_single_normaliseround
	.align	2
	.type	vfp_single_fdiv, %function
vfp_single_fdiv:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:vfp_get_float
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movt	ip, #:upper16:vfp_get_float
	.pad #28
	sub	sp, sp, #28
	mov	r5, r0
	mov	r0, r1
	mov	r4, r2
	mov	r10, r3
	blx	ip
	cmp	r0, #0
	ubfx	r3, r0, #23, #8
	mov	r0, r0, asl #9
	sxth	r1, r3
	strh	r3, [sp, #8]	@ movhi
	mov	ip, r0, lsr #2
	movlt	r6, #32768
	movge	r6, #0
	cmp	r1, #255
	cmpne	r1, #0
	ubfx	lr, r4, #23, #8
	orrne	ip, ip, #1073741824
	cmp	r4, #0
	mov	r4, r4, asl #9
	sxth	r2, lr
	strh	r6, [sp, #10]	@ movhi
	movlt	r0, #32768
	movge	r0, #0
	mov	r4, r4, lsr #2
	cmp	r2, #255
	cmpne	r2, #0
	eor	r6, r6, r0
	str	ip, [sp, #12]
	orrne	r4, r4, #1073741824
	uxth	r6, r6
	cmp	r1, #255
	strh	lr, [sp, #16]	@ movhi
	strh	r0, [sp, #18]	@ movhi
	str	r4, [sp, #20]
	strh	r6, [sp, #2]	@ movhi
	beq	.L307
	cmp	r3, #0
	movne	r3, #0
	movne	ip, #1
	beq	.L308
.L267:
	cmp	r2, #255
	beq	.L309
.L268:
	cmp	lr, #0
	movne	r4, #1
	beq	.L310
.L269:
	cmp	r3, #0
	bne	.L270
.L312:
	tst	r4, #16
	bne	.L271
	and	r2, ip, #10
	tst	r2, r4
	bne	.L272
	tst	ip, #8
	beq	.L311
	mov	r4, r3
.L273:
.L281:
	mov	r3, #0
	mov	r1, #255
	mov	r2, r3
	strh	r1, [sp]	@ movhi
	mov	r0, r3
	str	r3, [sp, #4]
	movt	r2, 32640
	b	.L280
.L310:
	cmp	r4, #0
	movne	r4, #5
	moveq	r4, #3
	cmp	r3, #0
	beq	.L312
.L270:
	mov	r3, r10
	mov	r0, sp
	add	r1, sp, #8
	add	r2, sp, #16
.L306:
	bl	vfp_propagate_nan
	ldrsh	r2, [sp]
	mov	r4, r0
	ldr	ip, [sp, #4]
	ldrh	r6, [sp, #2]
	mov	r2, r2, asl #23
	mov	r0, ip, lsr #7
.L280:
	add	r6, r2, r6, asl #16
	movw	r2, #:lower16:vfp_put_float
	mov	r1, r5
	add	r0, r6, r0
	movt	r2, #:upper16:vfp_put_float
	blx	r2
	mov	r0, r4
.L305:
	add	sp, sp, #28
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L308:
	cmp	ip, #0
	movne	ip, #5
	moveq	ip, #3
	cmp	r2, #255
	bne	.L268
.L309:
	cmp	r4, #0
	moveq	r4, #8
	beq	.L269
	tst	r4, #536870912
	moveq	r4, #48
	movne	r4, #16
	b	.L269
.L307:
	cmp	ip, #0
	moveq	r3, ip
	moveq	ip, #8
	beq	.L267
	tst	ip, #536870912
	mov	r3, #16
	movne	ip, r3
	moveq	ip, #48
	b	.L267
.L271:
	mov	r3, r10
	mov	r0, sp
	add	r1, sp, #16
	add	r2, sp, #8
	b	.L306
.L311:
	ands	r2, r4, #2
	bne	.L292
	tst	r4, #8
	bne	.L274
	tst	ip, #2
	bne	.L274
	tst	ip, #4
	bne	.L313
.L275:
	tst	r4, #4
	bne	.L314
.L276:
	ldr	fp, [sp, #20]
	mov	r0, #0
	ldr	r1, [sp, #12]
	ldrh	r3, [sp, #8]
	ldrh	r2, [sp, #16]
	mov	fp, fp, asl #1
	add	r3, r3, #126
	cmp	fp, r1, asl #1
	rsb	r3, r2, r3
	uxth	r3, r3
	mov	r4, fp
	movls	r2, r1, lsr #1
	str	fp, [sp, #20]
	strh	r3, [sp]	@ movhi
	addls	r3, r3, #1
	strlsh	r3, [sp]	@ movhi
	movls	r1, r2
	strls	r2, [sp, #12]
@ 1120 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpsingle.c" 1
	.ifnc r1,r1 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r4,r4 ; .err ; .endif
	bl	__do_div64
@ 0 "" 2
	ands	r3, r2, #63
	str	r2, [sp, #4]
	bne	.L278
	umull	r8, r9, r2, fp
	mov	r1, #0
	ldr	r7, [sp, #12]
	mov	r6, r3
	mla	r9, fp, r1, r9
	cmp	r9, r7
	it eq
	cmpeq	r8, r6
	orrne	r2, r2, #1
	str	r2, [sp, #4]
.L278:
	mov	r0, r5
	mov	r2, r10
	mov	r1, sp
	mov	r3, #0
	bl	__vfp_single_normaliseround
	b	.L305
.L272:
	movw	r3, #:lower16:.LANCHOR0
	movw	r2, #:lower16:vfp_put_float
	movt	r3, #:upper16:.LANCHOR0
	mov	r1, r5
	ldrsh	lr, [r3]
	movt	r2, #:upper16:vfp_put_float
	ldrh	ip, [r3, #2]
	ldr	r0, [r3, #4]
	mov	r3, lr, asl #23
	add	r3, r3, ip, asl #16
	add	r0, r3, r0, lsr #7
	blx	r2
	mov	r0, #1
	add	sp, sp, #28
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L274:
	mov	r3, #0
	mov	r0, r3
	strh	r3, [sp]	@ movhi
	str	r3, [sp, #4]
	mov	r4, r3
	b	.L280
.L292:
	mov	r4, #2
	b	.L281
.L314:
	add	r0, sp, #16
	bl	vfp_single_normalise_denormal
	b	.L276
.L313:
	add	r0, sp, #8
	bl	vfp_single_normalise_denormal
	b	.L275
	.fnend
	.size	vfp_single_fdiv, .-vfp_single_fdiv
	.align	2
	.type	vfp_single_fnmul, %function
vfp_single_fnmul:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:vfp_get_float
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movt	ip, #:upper16:vfp_get_float
	.pad #24
	sub	sp, sp, #24
	mov	r6, r0
	mov	r0, r1
	mov	r5, r3
	mov	r4, r2
	blx	ip
	ubfx	r1, r0, #23, #8
	and	r3, r0, #-2147483648
	mov	r3, r3, lsr #16
	mov	ip, r0, asl #9
	strh	r1, [sp, #8]	@ movhi
	cmp	r1, #255
	cmpne	r1, #0
	strh	r3, [sp, #10]	@ movhi
	mov	ip, ip, lsr #2
	beq	.L316
	add	r8, sp, #8
	orr	ip, ip, #1073741824
	str	ip, [sp, #12]
.L317:
	ubfx	ip, r4, #23, #8
	and	r3, r4, #-2147483648
	mov	r3, r3, lsr #16
	mov	r4, r4, asl #9
	strh	ip, [sp, #16]	@ movhi
	cmp	ip, #255
	cmpne	ip, #0
	strh	r3, [sp, #18]	@ movhi
	mov	r4, r4, lsr #2
	beq	.L318
	add	r7, sp, #16
	orr	r4, r4, #1073741824
	str	r4, [sp, #20]
.L319:
	mov	r1, r8
	mov	r2, r7
	mov	r3, r5
	mov	r0, sp
	bl	vfp_single_multiply
	ldrh	lr, [sp, #2]
	mov	ip, #32768
	movt	ip, 65535
	mov	r3, r0
	mov	r1, sp
	mov	r0, r6
	eor	ip, lr, ip
	mov	r2, r5
	strh	ip, [sp, #2]	@ movhi
	bl	__vfp_single_normaliseround
	add	sp, sp, #24
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L316:
	cmp	r1, #0
	add	r8, sp, #8
	str	ip, [sp, #12]
	bne	.L317
	cmp	ip, #0
	beq	.L317
	mov	r0, r8
	bl	vfp_single_normalise_denormal
	b	.L317
.L318:
	cmp	ip, #0
	add	r7, sp, #16
	str	r4, [sp, #20]
	bne	.L319
	cmp	r4, #0
	beq	.L319
	mov	r0, r7
	bl	vfp_single_normalise_denormal
	b	.L319
	.fnend
	.size	vfp_single_fnmul, .-vfp_single_fnmul
	.align	2
	.type	vfp_single_multiply_accumulate, %function
vfp_single_multiply_accumulate:
	.fnstart
	@ args = 8, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	movw	r4, #:lower16:vfp_get_float
	.pad #44
	sub	sp, sp, #44
	mov	r7, r0
	movt	r4, #:upper16:vfp_get_float
	mov	r0, r1
	mov	r5, r3
	mov	r6, r2
	ldr	r8, [sp, #72]
	blx	r4
	ubfx	r1, r0, #23, #8
	and	r3, r0, #-2147483648
	mov	r3, r3, lsr #16
	mov	r0, r0, asl #9
	strh	r1, [sp, #24]	@ movhi
	cmp	r1, #255
	cmpne	r1, #0
	strh	r3, [sp, #26]	@ movhi
	mov	r0, r0, lsr #2
	beq	.L331
	add	r9, sp, #24
	orr	r0, r0, #1073741824
	str	r0, [sp, #28]
.L332:
	ubfx	ip, r6, #23, #8
	and	r3, r6, #-2147483648
	mov	r3, r3, lsr #16
	mov	r6, r6, asl #9
	strh	ip, [sp, #32]	@ movhi
	cmp	ip, #255
	cmpne	ip, #0
	strh	r3, [sp, #34]	@ movhi
	mov	r6, r6, lsr #2
	beq	.L333
	add	r2, sp, #32
	orr	r6, r6, #1073741824
	str	r6, [sp, #36]
.L334:
	mov	r3, r5
	mov	r1, r9
	add	r0, sp, #16
	bl	vfp_single_multiply
	tst	r8, #1
	mov	r6, r0
	ldrneh	r2, [sp, #18]
	movne	r3, #32768
	movtne	r3, 65535
	mov	r0, r7
	eorne	r3, r2, r3
	strneh	r3, [sp, #18]	@ movhi
	blx	r4
	mov	r1, r0
	ubfx	r2, r0, #23, #8
	mov	r1, r1, asl #9
	cmp	r0, #0
	movlt	r0, #32768
	strh	r2, [sp, #24]	@ movhi
	mov	r1, r1, lsr #2
	movge	r0, #0
	cmp	r2, #255
	cmpne	r2, #0
	strh	r0, [sp, #26]	@ movhi
	orrne	r1, r1, #1073741824
	tst	r8, #2
	movne	r3, #32768
	str	r1, [sp, #28]
	movtne	r3, 65535
	mov	r1, r9
	eorne	r3, r0, r3
	add	r2, sp, #16
	strneh	r3, [sp, #26]	@ movhi
	add	r0, sp, #8
	mov	r3, r5
	bl	vfp_single_add
	add	r1, sp, #8
	orr	r3, r0, r6
	mov	r2, r5
	mov	r0, r7
	bl	__vfp_single_normaliseround
	add	sp, sp, #44
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L331:
	cmp	r1, #0
	add	r9, sp, #24
	str	r0, [sp, #28]
	bne	.L332
	cmp	r0, #0
	beq	.L332
	mov	r0, r9
	bl	vfp_single_normalise_denormal
	b	.L332
.L333:
	cmp	ip, #0
	add	r2, sp, #32
	str	r6, [sp, #36]
	bne	.L334
	cmp	r6, #0
	beq	.L334
	mov	r0, r2
	str	r2, [sp, #4]
	bl	vfp_single_normalise_denormal
	ldr	r2, [sp, #4]
	b	.L334
	.fnend
	.size	vfp_single_multiply_accumulate, .-vfp_single_multiply_accumulate
	.align	2
	.type	vfp_single_fnmsc, %function
vfp_single_fnmsc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:.LC2
	str	lr, [sp, #-4]!
	.save {lr}
	movt	ip, #:upper16:.LC2
	.pad #12
	sub	sp, sp, #12
	mov	lr, #3
	str	lr, [sp]
	str	ip, [sp, #4]
	bl	vfp_single_multiply_accumulate
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
	.fnend
	.size	vfp_single_fnmsc, .-vfp_single_fnmsc
	.align	2
	.type	vfp_single_fnmac, %function
vfp_single_fnmac:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:.LC3
	str	lr, [sp, #-4]!
	.save {lr}
	movt	ip, #:upper16:.LC3
	.pad #12
	sub	sp, sp, #12
	mov	lr, #1
	str	lr, [sp]
	str	ip, [sp, #4]
	bl	vfp_single_multiply_accumulate
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
	.fnend
	.size	vfp_single_fnmac, .-vfp_single_fnmac
	.align	2
	.type	vfp_single_fmsc, %function
vfp_single_fmsc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:.LC4
	str	lr, [sp, #-4]!
	.save {lr}
	movt	ip, #:upper16:.LC4
	.pad #12
	sub	sp, sp, #12
	mov	lr, #2
	str	lr, [sp]
	str	ip, [sp, #4]
	bl	vfp_single_multiply_accumulate
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
	.fnend
	.size	vfp_single_fmsc, .-vfp_single_fmsc
	.align	2
	.type	vfp_single_fmac, %function
vfp_single_fmac:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:.LC5
	str	lr, [sp, #-4]!
	.save {lr}
	movt	ip, #:upper16:.LC5
	.pad #12
	sub	sp, sp, #12
	mov	lr, #0
	str	lr, [sp]
	str	ip, [sp, #4]
	bl	vfp_single_multiply_accumulate
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
	.fnend
	.size	vfp_single_fmac, .-vfp_single_fmac
	.align	2
	.type	vfp_single_fadd, %function
vfp_single_fadd:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:vfp_get_float
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movt	ip, #:upper16:vfp_get_float
	.pad #24
	sub	sp, sp, #24
	mov	r6, r0
	mov	r0, r1
	mov	r5, r3
	mov	r4, r2
	blx	ip
	ubfx	r1, r0, #23, #8
	and	r3, r0, #-2147483648
	mov	r3, r3, lsr #16
	mov	ip, r0, asl #9
	strh	r1, [sp, #8]	@ movhi
	cmp	r1, #255
	cmpne	r1, #0
	strh	r3, [sp, #10]	@ movhi
	mov	ip, ip, lsr #2
	beq	.L362
	add	r8, sp, #8
	orr	ip, ip, #1073741824
	str	ip, [sp, #12]
.L363:
	ubfx	ip, r4, #23, #8
	and	r3, r4, #-2147483648
	mov	r3, r3, lsr #16
	mov	r4, r4, asl #9
	strh	ip, [sp, #16]	@ movhi
	cmp	ip, #255
	cmpne	ip, #0
	strh	r3, [sp, #18]	@ movhi
	mov	r4, r4, lsr #2
	beq	.L364
	add	r7, sp, #16
	orr	r4, r4, #1073741824
	str	r4, [sp, #20]
.L365:
	mov	r1, r8
	mov	r2, r7
	mov	r3, r5
	mov	r0, sp
	bl	vfp_single_add
	mov	r1, sp
	mov	r3, r0
	mov	r2, r5
	mov	r0, r6
	bl	__vfp_single_normaliseround
	add	sp, sp, #24
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L362:
	cmp	r1, #0
	add	r8, sp, #8
	str	ip, [sp, #12]
	bne	.L363
	cmp	ip, #0
	beq	.L363
	mov	r0, r8
	bl	vfp_single_normalise_denormal
	b	.L363
.L364:
	cmp	ip, #0
	add	r7, sp, #16
	str	r4, [sp, #20]
	bne	.L365
	cmp	r4, #0
	beq	.L365
	mov	r0, r7
	bl	vfp_single_normalise_denormal
	b	.L365
	.fnend
	.size	vfp_single_fadd, .-vfp_single_fadd
	.align	2
	.type	vfp_single_fsub, %function
vfp_single_fsub:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r2, r2, #-2147483648
	b	vfp_single_fadd
	.fnend
	.size	vfp_single_fsub, .-vfp_single_fsub
	.align	2
	.type	vfp_single_fmul, %function
vfp_single_fmul:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:vfp_get_float
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movt	ip, #:upper16:vfp_get_float
	.pad #24
	sub	sp, sp, #24
	mov	r6, r0
	mov	r0, r1
	mov	r5, r3
	mov	r4, r2
	blx	ip
	ubfx	r1, r0, #23, #8
	and	r3, r0, #-2147483648
	mov	r3, r3, lsr #16
	mov	ip, r0, asl #9
	strh	r1, [sp, #8]	@ movhi
	cmp	r1, #255
	cmpne	r1, #0
	strh	r3, [sp, #10]	@ movhi
	mov	ip, ip, lsr #2
	beq	.L378
	add	r8, sp, #8
	orr	ip, ip, #1073741824
	str	ip, [sp, #12]
.L379:
	ubfx	ip, r4, #23, #8
	and	r3, r4, #-2147483648
	mov	r3, r3, lsr #16
	mov	r4, r4, asl #9
	strh	ip, [sp, #16]	@ movhi
	cmp	ip, #255
	cmpne	ip, #0
	strh	r3, [sp, #18]	@ movhi
	mov	r4, r4, lsr #2
	beq	.L380
	add	r7, sp, #16
	orr	r4, r4, #1073741824
	str	r4, [sp, #20]
.L381:
	mov	r1, r8
	mov	r2, r7
	mov	r3, r5
	mov	r0, sp
	bl	vfp_single_multiply
	mov	r1, sp
	mov	r3, r0
	mov	r2, r5
	mov	r0, r6
	bl	__vfp_single_normaliseround
	add	sp, sp, #24
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L378:
	cmp	r1, #0
	add	r8, sp, #8
	str	ip, [sp, #12]
	bne	.L379
	cmp	ip, #0
	beq	.L379
	mov	r0, r8
	bl	vfp_single_normalise_denormal
	b	.L379
.L380:
	cmp	ip, #0
	add	r7, sp, #16
	str	r4, [sp, #20]
	bne	.L381
	cmp	r4, #0
	beq	.L381
	mov	r0, r7
	bl	vfp_single_normalise_denormal
	b	.L381
	.fnend
	.size	vfp_single_fmul, .-vfp_single_fmul
	.align	2
	.type	vfp_single_fsito, %function
vfp_single_fsito:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	str	lr, [sp, #-4]!
	.save {lr}
	movlt	r1, #32768
	movge	r1, #0
	.pad #12
	sub	sp, sp, #12
	mov	ip, #157
	cmp	r1, #0
	strh	ip, [sp]	@ movhi
	strh	r1, [sp, #2]	@ movhi
	rsbne	ip, r2, #0
	moveq	ip, r2
	mov	r1, sp
	mov	r2, r3
	mov	r3, #0
	str	ip, [sp, #4]
	bl	__vfp_single_normaliseround
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
	.fnend
	.size	vfp_single_fsito, .-vfp_single_fsito
	.align	2
	.type	vfp_single_fuito, %function
vfp_single_fuito:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	.save {lr}
	mov	ip, #0
	.pad #12
	sub	sp, sp, #12
	mov	lr, #157
	mov	r1, sp
	str	r2, [sp, #4]
	mov	r2, r3
	mov	r3, ip
	strh	ip, [sp, #2]	@ movhi
	strh	lr, [sp]	@ movhi
	bl	__vfp_single_normaliseround
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
	.fnend
	.size	vfp_single_fuito, .-vfp_single_fuito
	.global	__aeabi_uidiv
	.align	2
	.global	vfp_estimate_sqrt_significand
	.type	vfp_estimate_sqrt_significand, %function
vfp_estimate_sqrt_significand:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	and	r3, r1, #-1073741824
	stmfd	sp!, {r4, r5, lr}
	.save {r4, r5, lr}
	cmp	r3, #1073741824
	.pad #12
	sub	sp, sp, #12
	mov	r4, r0
	bne	.L408
.L397:
	mov	r5, r1, asl #1
	movw	r3, #:lower16:.LANCHOR1
	tst	r4, #1
	ubfx	r2, r5, #27, #4
	movt	r3, #:upper16:.LANCHOR1
	mov	r4, r5, lsr #17
	add	r2, r3, r2, asl #1
	beq	.L398
	ldrh	r2, [r2, #16]
	add	r4, r4, #16384
	movw	r3, #:lower16:__aeabi_uidiv
	mov	r0, r5
	movt	r3, #:upper16:__aeabi_uidiv
	rsb	r4, r2, r4
	mov	r1, r4
	mov	r4, r4, asl #15
	blx	r3
	mov	r1, r5, lsr #2
	add	r4, r4, r0, asl #14
	mov	r5, r5, asl #30
.L399:
	mov	r0, r5
@ 311 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpsingle.c" 1
	.ifnc r1,r1 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r4,r4 ; .err ; .endif
	bl	__do_div64
@ 0 "" 2
	add	r0, r2, r4, lsr #1
.L407:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
.L398:
	ldrh	r2, [r2, #48]
	add	r4, r4, #32768
	movw	r3, #:lower16:__aeabi_uidiv
	mov	r0, r5
	movt	r3, #:upper16:__aeabi_uidiv
	rsb	r4, r2, r4
	mov	r1, r4
	blx	r3
	add	r0, r0, r4
	cmp	r0, #131072
	movcc	r4, r0, asl #15
	movcs	r4, #32768
	movtcs	r4, 65535
	cmp	r4, r5
	movls	r0, r5, asr #1
	bls	.L407
	mov	r1, r5, lsr #1
	mov	r5, r5, asl #31
	b	.L399
.L408:
	movw	r0, #:lower16:.LC6
	movw	r3, #:lower16:printk
	str	r1, [sp, #4]
	movt	r0, #:upper16:.LC6
	movt	r3, #:upper16:printk
	blx	r3
	ldr	r1, [sp, #4]
	b	.L397
	.fnend
	.size	vfp_estimate_sqrt_significand, .-vfp_estimate_sqrt_significand
	.align	2
	.type	vfp_single_fsqrt, %function
vfp_single_fsqrt:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	ip, r2, asl #9
	ubfx	lr, r2, #23, #8
	sxth	r1, lr
	cmp	r2, #0
	mov	ip, ip, lsr #2
	mov	r10, r0
	movlt	r0, #32768
	movge	r0, #0
	cmp	r1, #255
	cmpne	r1, #0
	.pad #20
	sub	sp, sp, #20
	orrne	ip, ip, #1073741824
	strh	lr, [sp]	@ movhi
	moveq	r2, #0
	movne	r2, #1
	strh	r0, [sp, #2]	@ movhi
	mov	fp, r3
	strne	ip, [sp, #4]
	beq	.L431
.L411:
	cmp	lr, #0
	beq	.L432
	mov	r6, r0
	cmp	r6, #0
	beq	.L417
.L430:
	movw	r3, #:lower16:.LANCHOR0
	mov	r4, #1
	movt	r3, #:upper16:.LANCHOR0
	ldrh	r0, [r3, #2]
	ldrh	ip, [r3]
	ldr	r2, [r3, #4]
.L413:
	mov	ip, ip, asl #23
	movw	r3, #:lower16:vfp_put_float
	mov	r1, r10
	add	r0, ip, r0, asl #16
	movt	r3, #:upper16:vfp_put_float
	add	r0, r0, r2, lsr #7
	blx	r3
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L431:
	cmp	r1, #255
	str	ip, [sp, #4]
	bne	.L411
	cmp	ip, #0
	bne	.L433
	cmp	r0, #0
	bne	.L430
	mov	r2, r0
	mov	ip, r1
	mov	r4, r2
	b	.L413
.L432:
	cmp	ip, #0
	moveq	r4, ip
	ldreq	r2, [sp, #4]
	beq	.L413
.L415:
	mov	r0, sp
	bl	vfp_single_normalise_denormal
	ldrh	r6, [sp, #2]
	cmp	r6, #0
	bne	.L430
.L417:
	ldrsh	r0, [sp]
	ldr	r1, [sp, #4]
	strh	r6, [sp, #10]	@ movhi
	sub	r3, r0, #127
	mov	r3, r3, asr #1
	add	r3, r3, #127
	strh	r3, [sp, #8]	@ movhi
	bl	vfp_estimate_sqrt_significand
	add	r1, r0, #2
	and	r3, r1, #127
	cmp	r3, #5
	andhi	ip, r1, #1
	orrhi	ip, ip, r1, lsr #1
	bhi	.L419
	cmp	r1, #1
	mvnls	ip, #-2147483648
	bls	.L419
	ldrh	ip, [sp]
	umull	r4, r5, r1, r1
	ldr	lr, [sp, #4]
	mov	r2, r6
	and	ip, ip, #1
	eor	ip, ip, #1
	mov	ip, lr, asl ip
	mov	r3, ip
	str	ip, [sp, #4]
	subs	r4, r2, r4
	sbc	r5, r3, r5
	cmp	r4, #0
	sbcs	r2, r5, #0
	bge	.L426
	add	r0, r0, #1
	mov	r8, #1
	mov	r9, #0
	b	.L422
.L434:
	mov	r0, r3
.L422:
	adds	r6, r0, r0
	mov	r7, #0
	adc	r7, r7, r7
	orr	r6, r6, r8
	adds	r4, r4, r6
	orr	r7, r7, r9
	adc	r5, r5, r7
	sub	r3, r0, #1
	cmp	r4, #0
	sbcs	r2, r5, #0
	blt	.L434
.L420:
	orrs	r3, r4, r5
	orrne	r0, r0, #1
	and	ip, r0, #1
	orr	ip, ip, r0, lsr #1
.L419:
	mov	r0, r10
	mov	r2, fp
	add	r1, sp, #8
	mov	r3, #0
	str	ip, [sp, #12]
	bl	__vfp_single_normaliseround
	mov	r4, r0
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L433:
	add	r0, sp, #8
	mov	r1, sp
	bl	vfp_propagate_nan
	ldrh	ip, [sp, #8]
	mov	r4, r0
	ldr	r2, [sp, #12]
	ldrh	r0, [sp, #10]
	b	.L413
.L426:
	mov	r0, r1
	b	.L420
	.fnend
	.size	vfp_single_fsqrt, .-vfp_single_fsqrt
	.align	2
	.global	vfp_single_cpdo
	.type	vfp_single_cpdo, %function
vfp_single_cpdo:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #64
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movt	r3, 176
	and	r8, r1, #3145728
	mov	r2, #64
	cmp	r8, #3145728
	movt	r2, 176
	and	r3, r0, r3
	movne	r8, #1
	moveq	r8, #2
	cmp	r3, r2
	and	r6, r0, #983040
	andne	r10, r0, #11534336
	ubfx	r3, r0, #7, #1
	movne	r10, r10, lsr #20
	orr	r6, r3, r6, lsr #15
	ldreq	r10, .L453
	ldrne	r3, .L453+4
	andne	r2, r0, #64
	orrne	r10, r10, r2, lsr #4
	.pad #12
	sub	sp, sp, #12
	mov	fp, r1
	addeq	r10, r10, r6, asl #3
	addne	r10, r3, r10, asl #3
	ldr	r3, [r10, #4]
	tst	r3, #2
	andne	r5, r0, #4194304
	ubfxne	r2, r0, #12, #4
	ubfxeq	r5, r0, #22, #1
	andeq	r2, r0, #61440
	orrne	r5, r2, r5, lsr #18
	orreq	r5, r5, r2, lsr #11
	tst	r3, #1
	movne	r3, #0
	strne	r3, [sp, #4]
	bne	.L441
	ands	r3, r5, #24
	andne	r3, r1, #458752
	str	r3, [sp, #4]
.L441:
	ldr	r3, [r10]
	cmp	r3, #0
	mvneq	r0, #0
	beq	.L442
	ubfx	r3, r0, #5, #1
	and	r4, r0, #15
	mov	r7, #0
	orr	r4, r3, r4, asl #1
	mov	r9, r7
	movw	r3, #:lower16:vfp_get_float
	movt	r3, #:upper16:vfp_get_float
	str	r3, [sp]
.L444:
	mov	r0, r4
	ldr	r3, [sp]
	blx	r3
	mov	r1, r6
	mov	r2, r0
	ldr	ip, [r10]
	mov	r0, r5
	mov	r3, fp
	add	r7, r7, #65536
	blx	ip
	add	r3, r6, r8
	and	r6, r6, #24
	and	r3, r3, #7
	add	ip, r4, r8
	add	r6, r3, r6
	ldr	r3, [sp, #4]
	ands	r1, r4, #24
	and	ip, ip, #7
	add	r2, r5, r8
	addne	r4, ip, r1
	cmp	r3, r7
	and	r2, r2, #7
	and	r5, r5, #24
	orr	r9, r9, r0
	add	r5, r2, r5
	bcs	.L444
	mov	r0, r9
.L442:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L454:
	.align	2
.L453:
	.word	.LANCHOR0+8
	.word	.LANCHOR0+264
	.fnend
	.size	vfp_single_cpdo, .-vfp_single_cpdo
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.5738, %object
	.size	__func__.5738, 15
__func__.5738:
	.ascii	"vfp_single_add\000"
	.space	1
	.type	sqrt_oddadjust, %object
	.size	sqrt_oddadjust, 32
sqrt_oddadjust:
	.short	4
	.short	34
	.short	93
	.short	177
	.short	285
	.short	415
	.short	566
	.short	736
	.short	924
	.short	1128
	.short	1349
	.short	1585
	.short	1835
	.short	2098
	.short	2374
	.short	2663
	.type	sqrt_evenadjust, %object
	.size	sqrt_evenadjust, 32
sqrt_evenadjust:
	.short	2605
	.short	2223
	.short	1882
	.short	1577
	.short	1306
	.short	1065
	.short	854
	.short	670
	.short	512
	.short	377
	.short	265
	.short	175
	.short	104
	.short	52
	.short	18
	.short	2
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	vfp_single_default_qnan, %object
	.size	vfp_single_default_qnan, 8
vfp_single_default_qnan:
	.short	255
	.short	0
	.word	536870912
	.type	fops_ext, %object
	.size	fops_ext, 256
fops_ext:
	.word	vfp_single_fcpy
	.word	0
	.word	vfp_single_fabs
	.word	0
	.word	vfp_single_fneg
	.word	0
	.word	vfp_single_fsqrt
	.word	0
	.space	32
	.word	vfp_single_fcmp
	.word	1
	.word	vfp_single_fcmpe
	.word	1
	.word	vfp_single_fcmpz
	.word	1
	.word	vfp_single_fcmpez
	.word	1
	.space	24
	.word	vfp_single_fcvtd
	.word	3
	.word	vfp_single_fuito
	.word	1
	.word	vfp_single_fsito
	.word	1
	.space	48
	.word	vfp_single_ftoui
	.word	1
	.word	vfp_single_ftouiz
	.word	1
	.word	vfp_single_ftosi
	.word	1
	.word	vfp_single_ftosiz
	.word	1
	.space	32
	.type	fops, %object
	.size	fops, 128
fops:
	.word	vfp_single_fmac
	.word	0
	.word	vfp_single_fmsc
	.word	0
	.word	vfp_single_fmul
	.word	0
	.word	vfp_single_fadd
	.word	0
	.word	vfp_single_fnmac
	.word	0
	.word	vfp_single_fnmsc
	.word	0
	.word	vfp_single_fnmul
	.word	0
	.word	vfp_single_fsub
	.word	0
	.word	vfp_single_fdiv
	.word	0
	.space	56
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>VFP: bad FP values in %s\012\000"
	.space	3
.LC1:
	.ascii	"fcvtd\000"
	.space	2
.LC2:
	.ascii	"fnmsc\000"
	.space	2
.LC3:
	.ascii	"fnmac\000"
	.space	2
.LC4:
	.ascii	"fmsc\000"
	.space	3
.LC5:
	.ascii	"fmac\000"
	.space	3
.LC6:
	.ascii	"<4>VFP: estimate_sqrt: invalid significand\012\000"
	.ident	"GCC: (GNU) 4.8"
