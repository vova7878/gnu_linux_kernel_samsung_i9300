	.cpu cortex-a9
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"clock-clksrc.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_setparent_clksrc, %function
s3c_setparent_clksrc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mvn	r2, #0
	ldr	r3, [r0, #68]
	ldrh	ip, [r0, #78]
	ldr	lr, [r3]
	ldrh	r7, [r0, #76]
	rsb	ip, ip, #32
	ldr	r6, [r0, #72]
	lsr	r2, r2, ip
	cmp	lr, #0
	lsl	r4, r2, r7
	ldr	r5, [r6]
	beq	.L7
	ldr	r2, [r3, #4]
	ldr	r3, [r2]
	cmp	r1, r3
	mov	r3, #0
	bne	.L4
	b	.L3
.L6:
	ldr	ip, [r2, #4]!
	cmp	ip, r1
	beq	.L5
.L4:
	add	r3, r3, #1
	cmp	r3, lr
	bne	.L6
.L7:
	mvn	r0, #21
	pop	{r4, r5, r6, r7, pc}
.L5:
	lsl	r3, r3, r7
.L3:
	bic	r2, r5, r4
	str	r1, [r0, #12]
	orr	r3, r2, r3
	mov	r0, #0
	str	r3, [r6]
	pop	{r4, r5, r6, r7, pc}
	.fnend
	.size	s3c_setparent_clksrc, .-s3c_setparent_clksrc
	.global	__aeabi_uidivmod
	.global	__aeabi_uidiv
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_roundrate_clksrc, %function
s3c_roundrate_clksrc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:clk_get_rate
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:clk_get_rate
	mov	r5, r0
	mov	r6, r1
	ldr	r0, [r0, #12]
	blx	r3
	cmp	r0, r6
	mov	r4, r0
	ldrh	r5, [r5, #86]
	bls	.L11
	movw	r3, #:lower16:__aeabi_uidivmod
	mov	r1, r6
	movt	r3, #:upper16:__aeabi_uidivmod
	blx	r3
	cmp	r1, #0
	mov	r3, r0
	mov	r1, #1
	addne	r3, r0, #1
	cmp	r3, #0
	lsl	r1, r1, r5
	moveq	r3, #1
	cmp	r1, r3
	movw	r2, #:lower16:__aeabi_uidiv
	mov	r0, r4
	movge	r1, r3
	movt	r2, #:upper16:__aeabi_uidiv
	blx	r2
	mov	r4, r0
.L11:
	mov	r0, r4
	pop	{r4, r5, r6, pc}
	.fnend
	.size	s3c_roundrate_clksrc, .-s3c_roundrate_clksrc
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_getrate_clksrc, %function
s3c_getrate_clksrc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:clk_get_rate
	push	{r4, lr}
	.save {r4, lr}
	movt	r3, #:upper16:clk_get_rate
	mov	r4, r0
	ldr	r0, [r0, #12]
	blx	r3
	ldr	r1, [r4, #80]
	mvn	r2, #0
	ldrh	ip, [r4, #86]
	movw	r3, #:lower16:__aeabi_uidiv
	ldrh	lr, [r4, #84]
	movt	r3, #:upper16:__aeabi_uidiv
	ldr	r1, [r1]
	rsb	ip, ip, #32
	lsr	r2, r2, ip
	and	r1, r1, r2, lsl lr
	lsr	r1, r1, lr
	add	r1, r1, #1
	blx	r3
	pop	{r4, pc}
	.fnend
	.size	s3c_getrate_clksrc, .-s3c_getrate_clksrc
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_setrate_clksrc, %function
s3c_setrate_clksrc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mvn	r5, #0
	ldrh	r2, [r0, #86]
	movw	r3, #:lower16:clk_round_rate
	movt	r3, #:upper16:clk_round_rate
	mov	r4, r0
	ldrh	ip, [r0, #84]
	rsb	r2, r2, #32
	ldr	r6, [r0, #80]
	lsr	r5, r5, r2
	lsl	r5, r5, ip
	blx	r3
	movw	r3, #:lower16:clk_get_rate
	mov	r7, r0
	movt	r3, #:upper16:clk_get_rate
	ldr	r0, [r4, #12]
	blx	r3
	movw	r3, #:lower16:__aeabi_uidiv
	mov	r1, r7
	movt	r3, #:upper16:__aeabi_uidiv
	blx	r3
	ldrh	r3, [r4, #86]
	mov	r2, #1
	cmp	r0, r2, lsl r3
	ldrhls	r1, [r4, #84]
	subls	r2, r0, #1
	ldrls	r3, [r6]
	movls	r0, #0
	mvnhi	r0, #21
	bicls	r5, r3, r5
	orrls	r5, r5, r2, lsl r1
	strls	r5, [r6]
	pop	{r4, r5, r6, r7, r8, pc}
	.fnend
	.size	s3c_setrate_clksrc, .-s3c_setrate_clksrc
	.align	2
	.global	s3c_set_clksrc
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_set_clksrc, %function
s3c_set_clksrc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	ip, r0
	ldr	lr, [r0, #72]
	.pad #12
	sub	sp, sp, #12
	cmp	lr, #0
	beq	.L36
	ldrh	r2, [r0, #78]
	mvn	r3, #0
	ldr	r4, [lr]
	ldrh	lr, [r0, #76]
	rsb	r2, r2, #32
	lsr	r3, r3, r2
	ldr	r2, [r0, #68]
	and	r4, r4, r3, lsl lr
	ldr	r3, [r2]
	lsr	r4, r4, lr
	cmp	r3, r4
	bcc	.L29
	ldr	r3, [r2, #4]
	ldr	r3, [r3, r4, lsl #2]
	cmp	r3, #0
	beq	.L29
	cmp	r1, #0
	str	r3, [r0, #12]
	bne	.L37
.L25:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L36:
	ldr	r3, [r0, #12]
	cmp	r3, #0
	bne	.L25
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	ldr	r1, [ip, #16]
	movt	r0, #:upper16:.LC0
	movt	r3, #:upper16:printk
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	r3
.L29:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	mov	r2, r4
	ldr	r1, [ip, #16]
	movt	r0, #:upper16:.LC1
	movt	r3, #:upper16:printk
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	r3
.L37:
	ldr	r7, [r3, #16]
	movw	r5, #:lower16:clk_get_rate
	ldr	r6, [r0, #16]
	movt	r5, #:upper16:clk_get_rate
	blx	r5
	movw	r5, #:lower16:printk
	str	r0, [sp]
	movw	r0, #:lower16:.LC2
	mov	r2, r7
	mov	r1, r6
	mov	r3, r4
	movt	r5, #:upper16:printk
	movt	r0, #:upper16:.LC2
	blx	r5
	b	.L25
	.fnend
	.size	s3c_set_clksrc, .-s3c_set_clksrc
	.align	2
	.global	s3c_register_clksrc
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_register_clksrc, %function
s3c_register_clksrc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	subs	r5, r1, #0
	pople	{r4, r5, r6, r7, r8, r9, r10, pc}
	movw	r6, #:lower16:s3c24xx_register_clock
	mov	r4, r0
	ldr	r7, .L61
	movt	r6, #:upper16:s3c24xx_register_clock
	sub	r8, r7, #16
	sub	r9, r7, #32
	b	.L47
.L40:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	beq	.L44
.L43:
	mov	r1, #0
	mov	r0, r4
	bl	s3c_set_clksrc
	mov	r0, r4
	blx	r6
	subs	r3, r0, #0
	blt	.L59
.L46:
	subs	r5, r5, #1
	add	r4, r4, #88
	popeq	{r4, r5, r6, r7, r8, r9, r10, pc}
.L47:
	ldr	r3, [r4, #80]
	cmp	r3, #0
	bne	.L40
	ldr	r3, [r4, #72]
	cmp	r3, #0
	beq	.L60
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L43
.L48:
	str	r9, [r4, #40]
	b	.L43
.L60:
	movw	r1, #:lower16:.LANCHOR0
	movw	r0, #:lower16:.LC3
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC3
	ldr	r2, [r4, #16]
	blx	r3
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L43
	ldr	r3, [r4, #80]
	cmp	r3, #0
	beq	.L48
.L44:
	ldr	r3, [r4, #72]
	cmp	r3, #0
	movne	r3, r7
	moveq	r3, r8
	str	r3, [r4, #40]
	b	.L43
.L59:
	movw	r1, #:lower16:.LANCHOR0
	movw	r0, #:lower16:.LC4
	movw	r10, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR0
	movt	r10, #:upper16:printk
	ldr	r2, [r4, #16]
	movt	r0, #:upper16:.LC4
	blx	r10
	b	.L46
.L62:
	.align	2
.L61:
	.word	.LANCHOR1+32
	.fnend
	.size	s3c_register_clksrc, .-s3c_register_clksrc
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.12408, %object
	.size	__func__.12408, 20
__func__.12408:
	.ascii	"s3c_register_clksrc\000"
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	clksrc_ops_nodiv, %object
	.size	clksrc_ops_nodiv, 16
clksrc_ops_nodiv:
	.space	12
	.word	s3c_setparent_clksrc
	.type	clksrc_ops_nosrc, %object
	.size	clksrc_ops_nosrc, 16
clksrc_ops_nosrc:
	.word	s3c_setrate_clksrc
	.word	s3c_getrate_clksrc
	.word	s3c_roundrate_clksrc
	.space	4
	.type	clksrc_ops, %object
	.size	clksrc_ops, 16
clksrc_ops:
	.word	s3c_setrate_clksrc
	.word	s3c_getrate_clksrc
	.word	s3c_roundrate_clksrc
	.word	s3c_setparent_clksrc
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>%s: no parent clock specified\012\000"
	.space	2
.LC1:
	.ascii	"<3>%s: bad source %d\012\000"
	.space	2
.LC2:
	.ascii	"<6>%s: source is %s (%d), rate is %ld\012\000"
	.space	1
.LC3:
	.ascii	"<3>%s: clock %s has no registers set\012\000"
	.space	2
.LC4:
	.ascii	"<3>%s: failed to register %s (%d)\012\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
