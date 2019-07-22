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
	.file	"u1_regulator_consumer.c"
	.text
	.align	2
	.type	regulator_consumer_init, %function
regulator_consumer_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:platform_driver_register
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:platform_driver_register
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	regulator_consumer_init, .-regulator_consumer_init
	.align	2
	.type	regulator_consumer_probe, %function
regulator_consumer_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	regulator_consumer_probe, .-regulator_consumer_probe
	.align	2
	.type	u1_enable_regulator_for_usb_mipi, %function
u1_enable_regulator_for_usb_mipi:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	movw	r1, #:lower16:.LC1
	movw	r4, #:lower16:regulator_get
	mov	r9, r0
	movt	r1, #:upper16:.LC1
	movt	r4, #:upper16:regulator_get
	mov	r0, #0
	blx	r4
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L18
	movw	r1, #:lower16:.LC3
	mov	r0, #0
	movt	r1, #:upper16:.LC3
	blx	r4
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L19
	movw	r1, #:lower16:.LC4
	mov	r0, #0
	movt	r1, #:upper16:.LC4
	blx	r4
	cmn	r0, #4096
	mov	r7, r0
	bhi	.L20
	movw	r1, #:lower16:.LC6
	mov	r0, #0
	movt	r1, #:upper16:.LC6
	blx	r4
	cmn	r0, #4096
	mov	r8, r0
	bhi	.L21
	cmp	r9, #0
	bne	.L22
	movw	r0, #:lower16:.LC8
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L26
	movt	r0, #:upper16:.LC8
	movw	r4, #:lower16:regulator_force_disable
	blx	r3
	movt	r4, #:upper16:regulator_force_disable
	mov	r0, r8
	blx	r4
	mov	r0, r6
	blx	r4
	mov	r0, r7
	blx	r4
	mov	r0, r5
	blx	r4
.L16:
	movw	r4, #:lower16:regulator_put
	mov	r0, r8
	movt	r4, #:upper16:regulator_put
	mov	r9, #0
	blx	r4
.L11:
	mov	r0, r7
	blx	r4
.L9:
	mov	r0, r6
	blx	r4
.L7:
	mov	r0, r5
	blx	r4
.L5:
	mov	r0, r9
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L22:
	movw	r0, #:lower16:.LC7
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L26
	movt	r0, #:upper16:.LC7
	movw	r4, #:lower16:regulator_is_enabled
	blx	r3
	movt	r4, #:upper16:regulator_is_enabled
	mov	r0, r5
	blx	r4
	cmp	r0, #0
	beq	.L23
.L13:
	mov	r0, r7
	blx	r4
	cmp	r0, #0
	beq	.L24
.L14:
	mov	r0, r6
	blx	r4
	cmp	r0, #0
	beq	.L25
.L15:
	mov	r0, r8
	blx	r4
	cmp	r0, #0
	bne	.L16
	movw	r3, #:lower16:regulator_enable
	mov	r0, r8
	movt	r3, #:upper16:regulator_enable
	blx	r3
	b	.L16
.L25:
	movw	r3, #:lower16:regulator_enable
	mov	r0, r6
	movt	r3, #:upper16:regulator_enable
	blx	r3
	b	.L15
.L24:
	movw	r3, #:lower16:regulator_enable
	mov	r0, r7
	movt	r3, #:upper16:regulator_enable
	blx	r3
	b	.L14
.L23:
	movw	r3, #:lower16:regulator_enable
	mov	r0, r5
	movt	r3, #:upper16:regulator_enable
	blx	r3
	b	.L13
.L18:
	movw	r0, #:lower16:.LC2
	movw	r2, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:printk
	ldr	r1, .L26
	movt	r0, #:upper16:.LC2
	mvn	r9, #18
	blx	r3
	b	.L5
.L21:
	movw	r0, #:lower16:.LC2
	movw	r2, #:lower16:.LC6
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC2
	movt	r2, #:upper16:.LC6
	movt	r3, #:upper16:printk
	ldr	r1, .L26
	movw	r4, #:lower16:regulator_put
	blx	r3
	movt	r4, #:upper16:regulator_put
	mvn	r9, #18
	b	.L11
.L20:
	movw	r0, #:lower16:.LC2
	movw	r2, #:lower16:.LC5
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC2
	movt	r2, #:upper16:.LC5
	movt	r3, #:upper16:printk
	ldr	r1, .L26
	movw	r4, #:lower16:regulator_put
	blx	r3
	movt	r4, #:upper16:regulator_put
	mvn	r9, #18
	b	.L9
.L19:
	movw	r0, #:lower16:.LC2
	movw	r2, #:lower16:.LC3
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC2
	movt	r2, #:upper16:.LC3
	movt	r3, #:upper16:printk
	ldr	r1, .L26
	movw	r4, #:lower16:regulator_put
	blx	r3
	movt	r4, #:upper16:regulator_put
	mvn	r9, #18
	b	.L7
.L27:
	.align	2
.L26:
	.word	.LANCHOR1+28
	.fnend
	.size	u1_enable_regulator_for_usb_mipi, .-u1_enable_regulator_for_usb_mipi
	.align	2
	.type	regulator_consumer_resume, %function
regulator_consumer_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r0, #1
	bl	u1_enable_regulator_for_usb_mipi
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	regulator_consumer_resume, .-regulator_consumer_resume
	.align	2
	.type	regulator_consumer_suspend, %function
regulator_consumer_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r0, #0
	bl	u1_enable_regulator_for_usb_mipi
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	regulator_consumer_suspend, .-regulator_consumer_suspend
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.19586, %object
	.size	__func__.19586, 25
__func__.19586:
	.ascii	"regulator_consumer_probe\000"
	.space	3
	.type	__func__.19578, %object
	.size	__func__.19578, 33
__func__.19578:
	.ascii	"u1_enable_regulator_for_usb_mipi\000"
	.space	3
	.type	regulator_consumer_pm_ops, %object
	.size	regulator_consumer_pm_ops, 68
regulator_consumer_pm_ops:
	.space	8
	.word	regulator_consumer_suspend
	.word	regulator_consumer_resume
	.space	52
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_regulator_consumer_init6, %object
	.size	__initcall_regulator_consumer_init6, 4
__initcall_regulator_consumer_init6:
	.word	regulator_consumer_init
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	regulator_consumer_driver, %object
	.size	regulator_consumer_driver, 80
regulator_consumer_driver:
	.word	regulator_consumer_probe
	.space	16
	.word	.LC9
	.space	4
	.word	0
	.space	36
	.word	regulator_consumer_pm_ops
	.space	4
	.space	4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>%s: loading u1-regulator-consumer\012\000"
	.space	2
.LC1:
	.ascii	"vmipi_1.1v\000"
	.space	1
.LC2:
	.ascii	"<3>%s: failed to get %s\012\000"
	.space	3
.LC3:
	.ascii	"vmipi_1.8v\000"
	.space	1
.LC4:
	.ascii	"vhsic\000"
	.space	2
.LC5:
	.ascii	"vhsic 1.2v\000"
	.space	1
.LC6:
	.ascii	"vusb_3.3v\000"
	.space	2
.LC7:
	.ascii	"<6>%s: enable LDOs\012\000"
.LC8:
	.ascii	"<6>%s: disable LDOs\012\000"
	.space	3
.LC9:
	.ascii	"u1-regulator-consumer\000"
	.ident	"GCC: (GNU) 4.8"
