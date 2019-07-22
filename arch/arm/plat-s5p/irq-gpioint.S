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
	.file	"irq-gpioint.c"
	.text
	.align	2
	.type	s5p_gpioint_set_type, %function
s5p_gpioint_set_type:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	movw	r3, #:lower16:irq_to_desc
	ldr	r4, [r0, #28]
	mov	r7, r1
	movt	r3, #:upper16:irq_to_desc
	.pad #12
	sub	sp, sp, #12
	ldr	r2, [r0]
	mov	r5, r0
	ldr	r9, [r4, #12]
	mov	r0, r2
	rsb	r2, r9, r2
	mov	r9, r2, asl #2
	blx	r3
	sub	r3, r7, #1
	mov	r8, r0
	ldr	r6, [r4, #44]
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L2
.L4:
	.word	.L3
	.word	.L5
	.word	.L6
	.word	.L7
	.word	.L2
	.word	.L2
	.word	.L2
	.word	.L8
.L8:
	mov	r1, #0
.L9:
	ldr	r3, [r4, #24]
	mov	r2, #7
	bic	r9, r3, r2, asl r9
	orr	r9, r9, r1
	str	r9, [r4, #24]
@ 81 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/irq-gpioint.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L11
	blx	r3
.L11:
	ldr	r2, [r4, #8]
	movw	r0, #:lower16:.LC1
	ldr	r3, [r4, #168]
	movw	r1, #:lower16:.LANCHOR0
	ldr	lr, [r4, #24]
	movw	ip, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR0
	movt	ip, #:upper16:printk
	movt	r0, #:upper16:.LC1
	str	lr, [r2, r3]
	ldr	lr, [r5]
	ldr	r4, [r6, #76]
	ldr	r3, [r6]
	mov	r2, lr
	rsb	lr, r4, lr
	str	lr, [sp]
	blx	ip
	ldr	r0, [r5]
	movw	r3, #:lower16:s3c_gpio_cfgpin
	ldr	ip, [r6, #48]
	movt	r3, #:upper16:s3c_gpio_cfgpin
	ldr	r2, [r6, #76]
	mvn	r1, #0
	add	r0, ip, r0
	rsb	r0, r2, r0
	blx	r3
	ands	r0, r7, #3
	movwne	r3, #:lower16:handle_edge_irq
	movweq	r3, #:lower16:handle_level_irq
	movtne	r3, #:upper16:handle_edge_irq
	movteq	r3, #:upper16:handle_level_irq
	movne	r0, #0
	str	r3, [r8, #44]
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L3:
	mov	r1, #3
	mov	r1, r1, asl r9
	b	.L9
.L5:
	mov	r1, #2
	mov	r1, r1, asl r9
	b	.L9
.L6:
	mov	r1, #4
	mov	r1, r1, asl r9
	b	.L9
.L7:
	mov	r1, #1
	mov	r1, r1, asl r9
	b	.L9
.L2:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	mvn	r0, #21
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
	.fnend
	.size	s5p_gpioint_set_type, .-s5p_gpioint_set_type
	.align	2
	.type	s5p_gpioint_handler, %function
s5p_gpioint_handler:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r4, #:lower16:irq_get_irq_data
	.pad #20
	sub	sp, sp, #20
	movt	r4, #:upper16:irq_get_irq_data
	str	r1, [sp, #8]
	str	r0, [sp, #12]
	blx	r4
	cmp	r0, #0
	ldrne	r7, [r0, #24]
	moveq	r7, r0
	ldr	r0, [sp, #12]
	blx	r4
	cmp	r0, #0
	ldrne	r0, [r0, #16]
	str	r0, [sp, #4]
	ldr	r1, [sp, #4]
	ldr	r3, [r1, #36]
	cmp	r3, #0
	beq	.L57
.L21:
	ldr	r2, [r7, #12]
	mov	fp, #0
	cmp	r2, #0
	ble	.L24
	movw	r8, #:lower16:samsung_cpu_id
	movw	r4, #:lower16:generic_handle_irq
	mov	r3, fp
	mov	r5, fp
	movt	r8, #:upper16:samsung_cpu_id
	movt	r4, #:upper16:generic_handle_irq
	mov	r6, #1
	movt	r3, 17186
	str	r3, [sp]
.L30:
	ldr	r3, [r7, #20]
	ldr	r10, [r3, r5, asl #2]
	cmp	r10, #0
	beq	.L26
	ldr	r3, [r8]
	ldr	r1, [sp]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r1
	beq	.L27
	cmn	r3, #465567744
	movne	r3, r5, asl #2
	beq	.L27
.L34:
	ldr	r0, [r10, #72]
	bic	r0, r0, #4080
	bic	r0, r0, #15
	add	r0, r3, r0
	ldr	r3, [r0, #2560]
	cmp	r3, #0
	beq	.L26
	ldr	r0, [r0, #2304]
	bics	r9, r3, r0
	beq	.L26
.L29:
	ldr	r0, [r10, #76]
	add	fp, fp, #1
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r2, r9
@ 0 "" 2
	rsb	r2, r2, #31
	bic	r9, r9, r6, asl r2
	add	r0, r2, r0
	blx	r4
	cmp	r9, #0
	bne	.L29
	ldr	r2, [r7, #12]
.L26:
	add	r5, r5, #1
	cmp	r2, r5
	bgt	.L30
.L24:
	ldr	r2, [sp, #4]
	ldr	r0, [sp, #8]
	ldr	r3, [r2, #36]
	cmp	r3, #0
	ldreq	r1, [sp, #4]
	ldreq	r3, [r1, #32]
	blx	r3
	cmp	fp, #0
	bne	.L17
	ldr	r2, [sp, #8]
	movw	r3, #:lower16:_raw_spin_lock
	movt	r3, #:upper16:_raw_spin_lock
	add	r4, r2, #88
	mov	r0, r4
	blx	r3
	movw	r3, #:lower16:handle_bad_irq
	ldr	r0, [sp, #12]
	movt	r3, #:upper16:handle_bad_irq
	ldr	r1, [sp, #8]
	blx	r3
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r4
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
.L17:
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L27:
	ldr	r3, [r10, #84]
	b	.L34
.L57:
	ldr	r3, [r1, #28]
	cmp	r3, #0
	beq	.L22
.L55:
	ldr	r0, [sp, #8]
	blx	r3
	b	.L21
.L22:
	ldr	r2, [sp, #4]
	ldr	r0, [sp, #8]
	ldr	r3, [r2, #24]
	blx	r3
	ldr	r1, [sp, #4]
	ldr	r3, [r1, #20]
	cmp	r3, #0
	bne	.L55
	b	.L21
	.fnend
	.size	s5p_gpioint_handler, .-s5p_gpioint_handler
	.align	2
	.global	s5p_register_gpio_interrupt
	.type	s5p_register_gpio_interrupt, %function
s5p_register_gpio_interrupt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #328
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #8
	sub	sp, sp, #8
	bhi	.L83
	movw	r3, #:lower16:s3c_gpios
	movt	r3, #:upper16:s3c_gpios
	ldr	r6, [r3, r0, asl #2]
	cmp	r6, #0
	beq	.L83
	ldr	r3, [r6, #76]
	ldr	r7, [r6, #48]
	ldr	r5, [r6, #80]
	cmp	r3, #0
	rsb	r7, r7, r0
	addne	r0, r7, r3
	beq	.L84
.L81:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L84:
	movw	r8, #:lower16:.LANCHOR1
	movt	r8, #:upper16:.LANCHOR1
	ldr	r0, [r8]
	cmp	r0, #4
	bgt	.L85
	movw	r2, #:lower16:.LANCHOR2
	movt	r2, #:upper16:.LANCHOR2
	ldr	r4, [r2]
	cmp	r4, r2
	beq	.L63
.L66:
	ldr	r3, [r4, #8]
	cmp	r5, r3
	blt	.L64
	ldr	r1, [r4, #12]
	add	r3, r3, r1
	cmp	r5, r3
	blt	.L65
.L64:
	ldr	r4, [r4]
	cmp	r4, r2
	bne	.L66
.L63:
	movw	r0, #:lower16:.LC2
	movw	r2, #:lower16:.LC8
	movw	r3, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC2
	movt	r2, #:upper16:.LC8
	movt	r3, #:upper16:warn_slowpath_fmt
	mov	r1, #155
	blx	r3
.L83:
	mvn	r0, #21
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L65:
	ldr	r9, [r4, #24]
	cmp	r9, #0
	movne	r3, r0
	beq	.L86
.L72:
	add	r2, r3, #48
	add	r3, r3, #1
	mov	r2, r2, asl #3
	str	r3, [r8]
	movw	lr, #:lower16:handle_level_irq
	str	r2, [r6, #76]
	movt	lr, #:upper16:handle_level_irq
	ldr	r9, [r4, #8]
	movw	r0, #:lower16:.LC5
	ldr	r2, [r4, #20]
	movw	ip, #:lower16:irq_alloc_generic_chip
	movt	r0, #:upper16:.LC5
	movt	ip, #:upper16:irq_alloc_generic_chip
	rsb	r4, r9, r5
	mov	r1, #1
	str	r6, [r2, r4, asl #2]
	ldr	r3, [r6, #72]
	ldr	r2, [r6, #76]
	str	lr, [sp]
	bic	r3, r3, #4080
	bic	r3, r3, #15
	blx	ip
	cmp	r0, #0
	beq	.L87
	movw	r3, #:lower16:samsung_cpu_id
	mov	r4, #0
	movt	r3, #:upper16:samsung_cpu_id
	movt	r4, 17186
	ldr	r8, [r3]
	movw	lr, #:lower16:irq_gc_ack_set_bit
	movw	ip, #:lower16:irq_gc_mask_set_bit
	movw	r1, #:lower16:irq_gc_mask_clr_bit
	movw	r2, #:lower16:irq_gc_mask_and_ack_set
	movw	r3, #:lower16:s5p_gpioint_set_type
	movt	lr, #:upper16:irq_gc_ack_set_bit
	movt	ip, #:upper16:irq_gc_mask_set_bit
	mov	r8, r8, lsr #17
	movt	r1, #:upper16:irq_gc_mask_clr_bit
	movt	r2, #:upper16:irq_gc_mask_and_ack_set
	str	r6, [r0, #44]
	mov	r8, r8, asl #17
	movt	r3, #:upper16:s5p_gpioint_set_type
	str	lr, [r0, #76]
	cmp	r8, r4
	str	ip, [r0, #80]
	str	r1, [r0, #88]
	str	r2, [r0, #72]
	str	r3, [r0, #104]
	beq	.L68
	cmn	r8, #465567744
	beq	.L68
	ldr	r3, [r6, #80]
	mov	r3, r3, asl #2
	add	r3, r3, #2560
	str	r3, [r0, #160]
	ldr	r3, [r6, #80]
	mov	r3, r3, asl #2
	add	r3, r3, #2304
	str	r3, [r0, #156]
	ldr	r3, [r6, #80]
	mov	r3, r3, asl #2
	add	r3, r3, #1792
	str	r3, [r0, #168]
.L73:
	ldrh	r3, [r6, #52]
	mvn	r1, #0
	mov	r2, #0
	movw	ip, #:lower16:irq_setup_generic_chip
	movt	ip, #:upper16:irq_setup_generic_chip
	str	r2, [sp]
	cmp	r3, #31
	mov	r2, #1
	mvnls	r1, r1, asl r3
	mov	r3, #3072
	blx	ip
	movw	r2, #:lower16:samsung_gpiolib_to_irq
	movw	r0, #:lower16:.LC7
	movt	r2, #:upper16:samsung_gpiolib_to_irq
	movw	r3, #:lower16:printk
	mov	r1, r5
	str	r2, [r6, #40]
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC7
	blx	r3
	ldr	r0, [r6, #76]
	add	r0, r7, r0
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L68:
	ldr	r3, [r6, #84]
	add	r3, r3, #2560
	str	r3, [r0, #160]
	ldr	r3, [r6, #84]
	add	r3, r3, #2304
	str	r3, [r0, #156]
	ldr	r3, [r6, #84]
	add	r3, r3, #1792
	str	r3, [r0, #168]
	b	.L73
.L86:
	movw	r2, #:lower16:__kmalloc
	mov	r0, r1, asl #2
	movt	r2, #:upper16:__kmalloc
	movw	r1, #32976
	blx	r2
	cmp	r0, #0
	str	r0, [r4, #20]
	mvneq	r0, #11
	beq	.L81
	movw	r10, #:lower16:s5p_gpioint_handler
	movw	ip, #:lower16:__irq_set_handler
	movt	r10, #:upper16:s5p_gpioint_handler
	movt	ip, #:upper16:__irq_set_handler
	mov	r2, #1
	mov	r3, r9
	mov	r1, r10
	ldr	r0, [r4, #16]
	blx	ip
	movw	r3, #:lower16:irq_set_handler_data
	mov	r1, r4
	movt	r3, #:upper16:irq_set_handler_data
	ldr	r0, [r4, #16]
	blx	r3
	movw	r0, #:lower16:.LC4
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	str	r10, [r4, #24]
	movt	r0, #:upper16:.LC4
	ldr	r1, [r4, #16]
	blx	r3
	ldr	r3, [r8]
	b	.L72
.L85:
	movw	r0, #:lower16:.LC2
	movw	r2, #:lower16:.LC3
	movw	r3, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC2
	movt	r2, #:upper16:.LC3
	movt	r3, #:upper16:warn_slowpath_fmt
	mov	r1, #144
	blx	r3
	mvn	r0, #11
	b	.L81
.L87:
	movw	r0, #:lower16:.LC2
	movw	r2, #:lower16:.LC6
	movw	r3, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC2
	movt	r2, #:upper16:.LC6
	movt	r3, #:upper16:warn_slowpath_fmt
	mov	r1, #186
	blx	r3
	mvn	r0, #11
	b	.L81
	.fnend
	.size	s5p_register_gpio_interrupt, .-s5p_register_gpio_interrupt
	.align	2
	.global	s5p_register_gpioint_bank
	.type	s5p_register_gpioint_bank, %function
s5p_register_gpioint_bank:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:kmalloc_caches
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:kmalloc_caches
	mov	r4, r0
	mov	r6, r1
	mov	r5, r2
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L91
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movw	r1, #32976
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #28
	blx	r3
	subs	r3, r0, #0
	beq	.L93
.L89:
	movw	ip, #:lower16:.LANCHOR2
	str	r6, [r3, #8]
	movt	ip, #:upper16:.LANCHOR2
	str	r5, [r3, #12]
	ldr	r2, [ip, #4]
	mov	r0, #0
	str	r3, [ip, #4]
	str	r4, [r3, #16]
	str	r2, [r3, #4]
	str	ip, [r3]
	str	r3, [r2]
	ldmfd	sp!, {r4, r5, r6, pc}
.L91:
	mov	r3, #16
	b	.L89
.L93:
	mvn	r0, #11
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	s5p_register_gpioint_bank, .-s5p_register_gpioint_bank
	.global	banks
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.12191, %object
	.size	__func__.12191, 21
__func__.12191:
	.ascii	"s5p_gpioint_set_type\000"
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	banks, %object
	.size	banks, 8
banks:
	.word	banks
	.word	banks
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<4>No irq type\012\000"
.LC1:
	.ascii	"<6>%s irq:%d is at %s(%d)\012\000"
	.space	1
.LC2:
	.ascii	"/media/system1/root/CM14/kernel/samsung/smdk4412/ar"
	.ascii	"ch/arm/plat-s5p/irq-gpioint.c\000"
	.space	3
.LC3:
	.ascii	"used_gpioint_groups >= S5P_GPIOINT_GROUP_COUNT\012\000"
.LC4:
	.ascii	"<6>Registered chained gpio int handler for interrup"
	.ascii	"t %d.\012\000"
	.space	2
.LC5:
	.ascii	"s5p_gpioint\000"
.LC6:
	.ascii	"irq_alloc_generic_chip failed\012\000"
	.space	1
.LC7:
	.ascii	"<6>Registered interrupt support for gpio group %d.\012"
	.ascii	"\000"
.LC8:
	.ascii	"bank not found\012\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	used_gpioint_groups.12216, %object
	.size	used_gpioint_groups.12216, 4
used_gpioint_groups.12216:
	.space	4
	.ident	"GCC: (GNU) 4.8"
