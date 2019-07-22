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
	.file	"irq-eint.c"
	.text
	.align	2
	.type	exynos_irq_eint_mask, %function
exynos_irq_eint_mask:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_lock
	mov	r5, r0
	movt	r3, #:upper16:_raw_spin_lock
	mov	r0, r4
	blx	r3
	ldr	ip, [r5]
	mov	r2, #3840
	movt	r2, 65060
	mov	r5, #1
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r4
	sub	r1, ip, #352
	and	ip, ip, #7
	mov	r1, r1, lsr #3
	movt	r3, #:upper16:_raw_spin_unlock
	ldr	lr, [r2, r1, asl #2]
	orr	ip, lr, r5, asl ip
	str	ip, [r2, r1, asl #2]
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	exynos_irq_eint_mask, .-exynos_irq_eint_mask
	.align	2
	.type	exynos_irq_eint_ack, %function
exynos_irq_eint_ack:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0]
	mov	r0, #1
	mov	r3, #3904
	movt	r3, 65060
	sub	r1, r2, #352
	and	r2, r2, #7
	mov	r1, r1, lsr #3
	mov	r2, r0, asl r2
	str	r2, [r3, r1, asl #2]
	bx	lr
	.fnend
	.size	exynos_irq_eint_ack, .-exynos_irq_eint_ack
	.align	2
	.type	exynos_irq_eint0_15, %function
exynos_irq_eint0_15:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r4, #:lower16:irq_get_irq_data
	movt	r4, #:upper16:irq_get_irq_data
	mov	r5, r1
	mov	r7, r0
	blx	r4
	cmp	r0, #0
	ldrne	r6, [r0, #24]
	moveq	r6, r0
	mov	r0, r7
	blx	r4
	cmp	r0, #0
	ldrne	r4, [r0, #16]
	moveq	r4, r0
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L20
.L7:
	movw	r3, #:lower16:generic_handle_irq
	ldr	r0, [r6]
	movt	r3, #:upper16:generic_handle_irq
	blx	r3
	ldr	r3, [r4, #36]
	mov	r0, r5
	cmp	r3, #0
	ldreq	r3, [r4, #32]
	blx	r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L20:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L8
.L17:
	mov	r0, r5
	blx	r3
	b	.L7
.L8:
	ldr	r3, [r4, #24]
	mov	r0, r5
	blx	r3
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L17
	b	.L7
	.fnend
	.size	exynos_irq_eint0_15, .-exynos_irq_eint0_15
	.align	2
	.type	exynos_irq_eint_unmask, %function
exynos_irq_eint_unmask:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_lock
	mov	r5, r0
	movt	r3, #:upper16:_raw_spin_lock
	mov	r0, r4
	blx	r3
	ldr	ip, [r5]
	mov	r2, #3840
	movt	r2, 65060
	mov	r5, #1
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r4
	sub	r1, ip, #352
	and	ip, ip, #7
	mov	r1, r1, lsr #3
	movt	r3, #:upper16:_raw_spin_unlock
	ldr	lr, [r2, r1, asl #2]
	bic	ip, lr, r5, asl ip
	str	ip, [r2, r1, asl #2]
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	exynos_irq_eint_unmask, .-exynos_irq_eint_unmask
	.align	2
	.type	exynos_irq_eint_maskack, %function
exynos_irq_eint_maskack:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_lock
	mov	r6, r0
	movt	r3, #:upper16:_raw_spin_lock
	mov	r0, r4
	mov	r5, #1
	blx	r3
	ldr	ip, [r6]
	mov	r2, #3840
	movt	r2, 65060
	movw	r3, #:lower16:_raw_spin_unlock
	movt	r3, #:upper16:_raw_spin_unlock
	mov	r0, r4
	sub	r1, ip, #352
	and	ip, ip, #7
	mov	r1, r1, lsr #3
	ldr	lr, [r2, r1, asl #2]
	orr	ip, lr, r5, asl ip
	str	ip, [r2, r1, asl #2]
	blx	r3
	ldr	r2, [r6]
	mov	r3, #3904
	movt	r3, 65060
	and	r1, r2, #7
	sub	r2, r2, #352
	mov	r5, r5, asl r1
	mov	r2, r2, lsr #3
	str	r5, [r3, r2, asl #2]
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	exynos_irq_eint_maskack, .-exynos_irq_eint_maskack
	.align	2
	.type	exynos_irq_demux_eint16_31, %function
exynos_irq_demux_eint16_31:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r3, #:lower16:irq_get_irq_data
	movt	r3, #:upper16:irq_get_irq_data
	mov	r8, r1
	mov	r9, r0
	blx	r3
	cmp	r0, #0
	ldrne	r7, [r0, #16]
	moveq	r7, r0
	ldr	r3, [r7, #36]
	cmp	r3, #0
	beq	.L50
.L26:
	mov	r3, #0
	movt	r3, 65060
	ldr	r4, [r3, #3912]
	ldr	r3, [r3, #3848]
	uxtb	r4, r4
	bics	r4, r4, r3
	beq	.L37
	movw	r5, #:lower16:generic_handle_irq
	mov	r6, #0
	movt	r5, #:upper16:generic_handle_irq
	mov	r10, #1
.L30:
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r0, r4
@ 0 "" 2
	rsb	r0, r0, #31
	add	r6, r6, #1
	bic	r4, r4, r10, asl r0
	add	r0, r0, #368
	blx	r5
	cmp	r4, #0
	bne	.L30
.L29:
	mov	r3, #0
	movt	r3, 65060
	ldr	r4, [r3, #3916]
	ldr	r3, [r3, #3852]
	uxtb	r4, r4
	bics	r4, r4, r3
	beq	.L38
	movw	r5, #:lower16:generic_handle_irq
	mov	fp, #0
	movt	r5, #:upper16:generic_handle_irq
	mov	r10, #1
.L32:
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r3, r4
@ 0 "" 2
	rsb	r0, r3, #31
	add	fp, fp, #1
	bic	r4, r4, r10, asl r0
	add	r0, r0, #376
	blx	r5
	cmp	r4, #0
	bne	.L32
.L31:
	ldr	r3, [r7, #36]
	mov	r0, r8
	cmp	r3, #0
	ldreq	r3, [r7, #32]
	blx	r3
	orrs	fp, fp, r6
	ldmnefd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
	add	r4, r8, #88
	movw	r3, #:lower16:_raw_spin_lock
	mov	r0, r4
	movt	r3, #:upper16:_raw_spin_lock
	blx	r3
	movw	r3, #:lower16:handle_bad_irq
	mov	r0, r9
	mov	r1, r8
	movt	r3, #:upper16:handle_bad_irq
	blx	r3
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r4
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L50:
	ldr	r3, [r7, #28]
	cmp	r3, #0
	beq	.L27
.L48:
	mov	r0, r8
	blx	r3
	b	.L26
.L37:
	mov	r6, r4
	b	.L29
.L38:
	mov	fp, r4
	b	.L31
.L27:
	ldr	r3, [r7, #24]
	mov	r0, r8
	blx	r3
	ldr	r3, [r7, #20]
	cmp	r3, #0
	bne	.L48
	b	.L26
	.fnend
	.size	exynos_irq_demux_eint16_31, .-exynos_irq_demux_eint16_31
	.align	2
	.type	exynos_irq_eint_set_type, %function
exynos_irq_eint_set_type:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r3, #:lower16:irq_to_desc
	ldr	r5, [r0]
	mov	r6, r0
	mov	r4, r1
	movt	r3, #:upper16:irq_to_desc
	mov	r0, r5
	sub	r5, r5, #352
	blx	r3
	mov	r7, r0
	cmp	r4, #8
	ldrls	pc, [pc, r4, asl #2]
	b	.L52
.L54:
	.word	.L53
	.word	.L55
	.word	.L56
	.word	.L57
	.word	.L58
	.word	.L52
	.word	.L52
	.word	.L52
	.word	.L59
.L59:
	and	r9, r5, #7
	mov	r8, #0
	mov	r10, r9, asl #2
.L60:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_lock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_lock
	blx	r3
	ldr	r1, [r6]
	mov	r2, #3584
	movt	r2, 65060
	mov	lr, #7
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_unlock
	sub	r1, r1, #352
	movt	r0, #:upper16:.LANCHOR0
	mov	r1, r1, lsr #3
	movt	r3, #:upper16:_raw_spin_unlock
	ldr	ip, [r2, r1, asl #2]
	bic	r10, ip, lr, asl r10
	orr	r8, r10, r8
	str	r8, [r2, r1, asl #2]
	blx	r3
	cmp	r5, #31
	ldrls	pc, [pc, r5, asl #2]
	b	.L62
.L64:
	.word	.L63
	.word	.L63
	.word	.L63
	.word	.L63
	.word	.L63
	.word	.L63
	.word	.L63
	.word	.L63
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L66
	.word	.L66
	.word	.L66
	.word	.L66
	.word	.L66
	.word	.L66
	.word	.L66
	.word	.L66
	.word	.L67
	.word	.L67
	.word	.L67
	.word	.L67
	.word	.L67
	.word	.L67
	.word	.L67
	.word	.L67
.L67:
	movw	r3, #:lower16:s3c_gpio_cfgpin
	add	r0, r9, #217
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #0
	blx	r3
.L68:
	ands	r0, r4, #3
	movwne	r3, #:lower16:handle_edge_irq
	movweq	r3, #:lower16:handle_level_irq
	movtne	r3, #:upper16:handle_edge_irq
	movteq	r3, #:upper16:handle_level_irq
	movne	r0, #0
	str	r3, [r7, #44]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L66:
	movw	r3, #:lower16:s3c_gpio_cfgpin
	add	r0, r9, #208
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #0
	blx	r3
	b	.L68
.L65:
	movw	r3, #:lower16:s3c_gpio_cfgpin
	add	r0, r9, #199
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #0
	blx	r3
	b	.L68
.L63:
	movw	r3, #:lower16:s3c_gpio_cfgpin
	add	r0, r9, #190
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #0
	blx	r3
	b	.L68
.L53:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC0
	movt	r3, #:upper16:printk
	and	r9, r5, #7
	mov	r8, #0
	blx	r3
	mov	r10, r9, asl #2
	b	.L60
.L55:
	and	r9, r5, #7
	mov	r8, #3
	mov	r10, r9, asl #2
	mov	r8, r8, asl r10
	b	.L60
.L56:
	mov	r8, #2
	and	r9, r5, #7
	mov	r10, r9, asl r8
	mov	r8, r8, asl r10
	b	.L60
.L57:
	and	r9, r5, #7
	mov	r8, #4
	mov	r10, r9, asl #2
	mov	r8, r8, asl r10
	b	.L60
.L58:
	and	r9, r5, #7
	mov	r8, #1
	mov	r10, r9, asl #2
	mov	r8, r8, asl r10
	b	.L60
.L52:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	mov	r1, r4
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L62:
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	mov	r1, r5
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC2
	blx	r3
	b	.L68
	.fnend
	.size	exynos_irq_eint_set_type, .-exynos_irq_eint_set_type
	.align	2
	.global	exynos_init_irq_eint
	.type	exynos_init_irq_eint, %function
exynos_init_irq_eint:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	movw	r6, #:lower16:irq_set_chip_and_handler_name
	movw	r5, #:lower16:set_irq_flags
	movt	r6, #:upper16:irq_set_chip_and_handler_name
	movt	r5, #:upper16:set_irq_flags
	mov	r4, #352
.L72:
	movw	r1, #:lower16:.LANCHOR1
	movw	r2, #:lower16:handle_level_irq
	mov	r0, r4
	movt	r1, #:upper16:.LANCHOR1
	movt	r2, #:upper16:handle_level_irq
	mov	r3, #0
	blx	r6
	mov	r0, r4
	mov	r1, #1
	add	r4, r4, #1
	blx	r5
	cmp	r4, #384
	bne	.L72
	movw	r1, #:lower16:exynos_irq_demux_eint16_31
	movw	r8, #:lower16:__irq_set_handler
	movw	r9, #:lower16:irq_set_handler_data
	movt	r1, #:upper16:exynos_irq_demux_eint16_31
	movt	r8, #:upper16:__irq_set_handler
	mov	r0, #96
	mov	r2, #1
	mov	r3, #0
	ldr	r5, .L75
	movt	r9, #:upper16:irq_set_handler_data
	ldr	r7, .L75+4
	mov	r4, #352
	blx	r8
.L74:
	ldr	r6, [r7, #4]!
	str	r4, [r5, #4]!
	mov	r1, r5
	add	r4, r4, #1
	mov	r0, r6
	blx	r9
	movw	r1, #:lower16:exynos_irq_eint0_15
	mov	r0, r6
	mov	r2, #1
	movt	r1, #:upper16:exynos_irq_eint0_15
	mov	r3, #0
	blx	r8
	cmp	r4, #368
	bne	.L74
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L76:
	.align	2
.L75:
	.word	.LANCHOR0+4
	.word	.LANCHOR2-4
	.fnend
	.size	exynos_init_irq_eint, .-exynos_init_irq_eint
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	eint0_15_src_int, %object
	.size	eint0_15_src_int, 64
eint0_15_src_int:
	.word	80
	.word	81
	.word	82
	.word	83
	.word	84
	.word	85
	.word	86
	.word	87
	.word	88
	.word	89
	.word	90
	.word	91
	.word	92
	.word	93
	.word	94
	.word	95
	.section	.initcall3.init,"aw",%progbits
	.align	2
	.type	__initcall_exynos_init_irq_eint3, %object
	.size	__initcall_exynos_init_irq_eint3, 4
__initcall_exynos_init_irq_eint3:
	.word	exynos_init_irq_eint
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	exynos_irq_eint, %object
	.size	exynos_irq_eint, 92
exynos_irq_eint:
	.word	.LC3
	.space	12
	.word	exynos_irq_eint_maskack
	.word	exynos_irq_eint_ack
	.word	exynos_irq_eint_mask
	.word	exynos_irq_eint_maskack
	.word	exynos_irq_eint_unmask
	.space	12
	.word	exynos_irq_eint_set_type
	.word	s3c_irqext_wake
	.space	36
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<7>None irq type\012\000"
	.space	2
.LC1:
	.ascii	"<3>No such irq type %d\000"
	.space	1
.LC2:
	.ascii	"<3>No such irq number %d\000"
	.space	3
.LC3:
	.ascii	"exynos-eint\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	eint_lock, %object
	.size	eint_lock, 8
eint_lock:
	.space	8
	.type	eint0_15_data, %object
	.size	eint0_15_data, 64
eint0_15_data:
	.space	64
	.ident	"GCC: (GNU) 4.8"
