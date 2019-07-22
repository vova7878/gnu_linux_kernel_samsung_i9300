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
	.file	"midas-nfc.c"
	.text
	.align	2
	.type	midas_nfc_init, %function
midas_nfc_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r8, #:lower16:s3c_gpio_cfgpin
	movw	r7, #:lower16:s3c_gpio_setpull
	movw	r10, #:lower16:printk
	movw	r9, #:lower16:__gpio_set_value
	.pad #8
	sub	sp, sp, #8
	movt	r4, #:upper16:.LANCHOR0
	movt	r8, #:upper16:s3c_gpio_cfgpin
	movt	r7, #:upper16:s3c_gpio_setpull
	movt	r10, #:upper16:printk
	movt	r9, #:upper16:__gpio_set_value
	mov	r6, #0
.L6:
	ldr	r1, [r4, #4]
	ldr	r5, [r4]
	mvn	r1, r1, asl #28
	mov	r0, r5
	mvn	r1, r1, lsr #28
	blx	r8
	subs	r3, r0, #0
	blt	.L19
.L2:
	mov	r0, r5
	ldr	r1, [r4, #12]
	blx	r7
	subs	r3, r0, #0
	blt	.L20
.L3:
	ldr	r1, [r4, #8]
	add	r6, r6, #1
	mov	r0, r5
	add	r4, r4, #16
	cmp	r1, #2
	beq	.L4
	blx	r9
.L4:
	cmp	r6, #3
	bne	.L6
	movw	r4, #:lower16:system_rev
	movw	r3, #:lower16:i2c_get_adapter
	movt	r4, #:upper16:system_rev
	movt	r3, #:upper16:i2c_get_adapter
	ldr	r5, [r4]
	cmp	r5, #3
	movne	r5, #5
	moveq	r5, #12
	mov	r0, r5
	blx	r3
	subs	r6, r0, #0
	beq	.L8
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:i2c_new_device
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:i2c_new_device
	blx	r3
	cmp	r0, #0
	beq	.L21
	movw	r1, #:lower16:.LC3
	movw	r3, #:lower16:.LANCHOR1
	movw	ip, #:lower16:_dev_info
	add	r0, r0, #32
	movt	r1, #:upper16:.LC3
	movt	r3, #:upper16:.LANCHOR1
	movt	ip, #:upper16:_dev_info
	ldr	r2, .L22
	blx	ip
.L10:
	movw	r3, #:lower16:i2c_put_adapter
	mov	r0, r6
	movt	r3, #:upper16:i2c_put_adapter
	blx	r3
	mov	r0, #0
.L11:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L21:
	movw	r1, #:lower16:.LC2
	movw	r3, #:lower16:.LANCHOR1
	movw	ip, #:lower16:dev_err
	str	r5, [sp]
	movt	r1, #:upper16:.LC2
	movt	r3, #:upper16:.LANCHOR1
	movt	ip, #:upper16:dev_err
	add	r0, r6, #48
	ldr	r2, .L22
	blx	ip
	b	.L10
.L19:
	movw	r0, #:lower16:.LC0
	ldr	r1, .L22+4
	mov	r2, r6
	movt	r0, #:upper16:.LC0
	blx	r10
	b	.L2
.L20:
	movw	r0, #:lower16:.LC1
	ldr	r1, .L22+4
	mov	r2, r6
	movt	r0, #:upper16:.LC1
	blx	r10
	b	.L3
.L8:
	movw	r0, #:lower16:.LC4
	movw	r6, #:lower16:printk
	mov	r2, r5
	movt	r6, #:upper16:printk
	ldr	r1, .L22
	movt	r0, #:upper16:.LC4
	blx	r6
	ldr	r2, [r4]
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	ldr	r1, .L22+8
	mvn	r3, #18
	cmp	r2, #3
	movne	r2, #5
	moveq	r2, #12
	blx	r6
	mvn	r0, #18
	b	.L11
.L23:
	.align	2
.L22:
	.word	.LANCHOR0+64
	.word	.LANCHOR0+48
	.word	.LANCHOR0+80
	.fnend
	.size	midas_nfc_init, .-midas_nfc_init
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	nfc_gpio_table, %object
	.size	nfc_gpio_table, 48
nfc_gpio_table:
	.word	206
	.word	-16
	.word	2
	.word	1
	.word	132
	.word	-15
	.word	0
	.word	0
	.word	133
	.word	-15
	.word	0
	.word	0
	.type	__func__.16660, %object
	.size	__func__.16660, 15
__func__.16660:
	.ascii	"nfc_setup_gpio\000"
	.space	1
	.type	__func__.16644, %object
	.size	__func__.16644, 16
__func__.16644:
	.ascii	"i2c_add_devices\000"
	.type	__func__.16670, %object
	.size	__func__.16670, 15
__func__.16670:
	.ascii	"midas_nfc_init\000"
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_midas_nfc_init6, %object
	.size	__initcall_midas_nfc_init6, 4
__initcall_midas_nfc_init6:
	.word	midas_nfc_init
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	i2c_dev_pn65n, %object
	.size	i2c_dev_pn65n, 40
i2c_dev_pn65n:
	.ascii	"pn65n\000"
	.space	14
	.space	2
	.short	43
	.word	pn65n_pdata
	.space	8
	.word	367
	.type	pn65n_pdata, %object
	.size	pn65n_pdata, 12
pn65n_pdata:
	.word	206
	.word	132
	.word	133
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>%s, s3c_gpio_cfgpin gpio(%d) fail(err = %d)\012\000"
.LC1:
	.ascii	"<3>%s, s3c_gpio_setpull gpio(%d) fail(err = %d)\012"
	.ascii	"\000"
	.space	3
.LC2:
	.ascii	"%s - added %s at bus i2c bus %d failed\012\000"
.LC3:
	.ascii	"%s - added %s successfully\012\000"
.LC4:
	.ascii	"<3>%s: ERROR i2c bus %d not found\012\000"
	.space	1
.LC5:
	.ascii	"<3>%s, i2c%d adding i2c fail(err=%d)\012\000"
	.ident	"GCC: (GNU) 4.8"
