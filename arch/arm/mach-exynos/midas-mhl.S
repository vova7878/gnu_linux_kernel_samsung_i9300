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
	.file	"midas-mhl.c"
	.text
	.align	2
	.type	sii9234_reset, %function
sii9234_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR0
	movw	r3, #:lower16:printk
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	movw	r4, #:lower16:__gpio_set_value
	blx	r3
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #14
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mov	r0, #78
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #0
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #78
	blx	r3
	movt	r4, #:upper16:__gpio_set_value
	mov	r0, #78
	mov	r1, #0
	blx	r4
	movw	r3, #:lower16:usleep_range
	movw	r0, #10000
	movt	r3, #:upper16:usleep_range
	movw	r1, #20000
	blx	r3
	mov	r0, #78
	mov	r1, #1
	blx	r4
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	sii9234_reset, .-sii9234_reset
	.align	2
	.type	sii9234_cfg_gpio, %function
sii9234_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movt	r3, #:upper16:printk
	ldr	r1, .L3
	movt	r0, #:upper16:.LC0
	movw	r5, #:lower16:s3c_gpio_cfgpin
	movw	r4, #:lower16:s3c_gpio_setpull
	blx	r3
	movt	r5, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #15
	mov	r0, #51
	movt	r4, #:upper16:s3c_gpio_setpull
	blx	r5
	mov	r1, #0
	mov	r0, #51
	blx	r4
	mvn	r1, #14
	mov	r0, #53
	blx	r5
	mov	r1, #0
	mov	r0, #53
	blx	r4
	movw	r8, #:lower16:__gpio_to_irq
	mvn	r1, #15
	mov	r0, #247
	movt	r8, #:upper16:__gpio_to_irq
	blx	r5
	movw	r7, #:lower16:irq_set_irq_type
	mov	r0, #247
	blx	r8
	movt	r7, #:upper16:irq_set_irq_type
	mov	r1, #1
	blx	r7
	mov	r1, #1
	mov	r0, #247
	blx	r4
	movw	r1, #:lower16:.LC1
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC1
	movt	r3, #:upper16:gpio_request
	mov	r0, #79
	movw	r6, #:lower16:__gpio_set_value
	blx	r3
	movw	r3, #:lower16:s5p_register_gpio_interrupt
	mov	r0, #79
	movt	r3, #:upper16:s5p_register_gpio_interrupt
	movt	r6, #:upper16:__gpio_set_value
	blx	r3
	mov	r1, #1
	mov	r0, #79
	blx	r4
	mov	r0, #79
	blx	r8
	mov	r1, #1
	blx	r7
	mvn	r1, #0
	mov	r0, #79
	blx	r5
	mvn	r1, #14
	mov	r0, #117
	blx	r5
	mov	r0, #117
	mov	r1, #0
	blx	r6
	mov	r1, #0
	mov	r0, #117
	blx	r4
	mvn	r1, #14
	mov	r0, #78
	blx	r5
	mov	r1, #0
	mov	r0, #78
	blx	r4
	mov	r0, #78
	mov	r1, #0
	blx	r6
	mvn	r1, #14
	mov	r0, #116
	blx	r5
	mov	r1, #0
	mov	r0, #116
	blx	r4
	mov	r0, #116
	mov	r1, #0
	blx	r6
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L4:
	.align	2
.L3:
	.word	.LANCHOR0+16
	.fnend
	.size	sii9234_cfg_gpio, .-sii9234_cfg_gpio
	.align	2
	.type	midas_mhl_init, %function
midas_mhl_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r8, #:lower16:i2c_get_adapter
	.pad #20
	sub	sp, sp, #20
	mov	r0, #15
	movt	r8, #:upper16:i2c_get_adapter
	blx	r8
	subs	r5, r0, #0
	beq	.L18
	movw	r7, #:lower16:.LANCHOR1
	movw	r4, #:lower16:i2c_new_device
	movt	r7, #:upper16:.LANCHOR1
	movw	r10, #:lower16:dev_err
	movw	r6, #:lower16:_dev_info
	mov	fp, r7
	add	r9, r7, #160
	movt	r4, #:upper16:i2c_new_device
	movt	r10, #:upper16:dev_err
	movt	r6, #:upper16:_dev_info
	add	r3, r5, #48
	str	r3, [sp, #12]
.L11:
	mov	r1, fp
	mov	r0, r5
	blx	r4
	cmp	r0, #0
	movw	r1, #:lower16:.LC4
	ldr	r2, .L20
	movt	r1, #:upper16:.LC4
	mov	r3, fp
	add	r0, r0, #32
	beq	.L8
	blx	r6
.L9:
	add	fp, fp, #40
	cmp	fp, r9
	bne	.L11
	movw	r6, #:lower16:i2c_put_adapter
	mov	r0, r5
	movt	r6, #:upper16:i2c_put_adapter
	blx	r6
	movw	r3, #:lower16:system_rev
	movt	r3, #:upper16:system_rev
	ldr	r5, [r3]
	cmp	r5, #3
	movne	r5, #5
	moveq	r5, #16
	mov	r0, r5
	str	r5, [r7, #164]
	blx	r8
	subs	r7, r0, #0
	beq	.L13
	ldr	r1, .L20+4
	blx	r4
	cmp	r0, #0
	beq	.L19
	movw	r1, #:lower16:.LC4
	movw	ip, #:lower16:_dev_info
	add	r0, r0, #32
	movt	r1, #:upper16:.LC4
	movt	ip, #:upper16:_dev_info
	ldr	r2, .L20
	ldr	r3, .L20+4
	blx	ip
.L15:
	mov	r0, r7
	blx	r6
	mov	r0, #0
.L7:
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L8:
	mov	r3, #15
	movw	r1, #:lower16:.LC5
	str	r3, [sp]
	movt	r1, #:upper16:.LC5
	ldr	r2, .L20
	mov	r3, fp
	ldr	r0, [sp, #12]
	blx	r10
	b	.L9
.L19:
	movw	r1, #:lower16:.LC5
	movw	ip, #:lower16:dev_err
	str	r5, [sp]
	movt	r1, #:upper16:.LC5
	movt	ip, #:upper16:dev_err
	add	r0, r7, #48
	ldr	r2, .L20
	ldr	r3, .L20+4
	blx	ip
	b	.L15
.L18:
	movw	r0, #:lower16:.LC2
	movw	r4, #:lower16:printk
	movt	r4, #:upper16:printk
	ldr	r1, .L20
	mov	r2, #15
	movt	r0, #:upper16:.LC2
	blx	r4
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	blx	r4
	mvn	r0, #18
	b	.L7
.L13:
	movw	r0, #:lower16:.LC2
	movw	r4, #:lower16:printk
	mov	r2, r5
	movt	r4, #:upper16:printk
	ldr	r1, .L20
	movt	r0, #:upper16:.LC2
	blx	r4
	movw	r0, #:lower16:.LC6
	movt	r0, #:upper16:.LC6
	blx	r4
	mvn	r0, #18
	b	.L7
.L21:
	.align	2
.L20:
	.word	.LANCHOR0+36
	.word	.LANCHOR1+212
	.fnend
	.size	midas_mhl_init, .-midas_mhl_init
	.align	2
	.type	sii9234_power_onoff, %function
sii9234_power_onoff:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	movw	r3, #:lower16:printk
	movw	r0, #:lower16:.LC7
	mov	r2, r4
	movt	r0, #:upper16:.LC7
	movt	r3, #:upper16:printk
	ldr	r1, .L26
	blx	r3
	cmp	r4, #0
	bne	.L25
	movw	r5, #:lower16:__gpio_set_value
	mov	r1, r4
	movt	r5, #:upper16:__gpio_set_value
	mov	r0, #78
	blx	r5
	movw	r3, #:lower16:usleep_range
	movw	r0, #10000
	movt	r3, #:upper16:usleep_range
	movw	r1, #20000
	blx	r3
	mov	r0, #78
	mov	r1, #1
	blx	r5
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #1
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #224
	blx	r3
	mov	r1, r4
	mov	r0, #117
	blx	r5
	mov	r1, r4
	mov	r0, #78
	blx	r5
	ldmfd	sp!, {r3, r4, r5, pc}
.L25:
	movw	r4, #:lower16:s3c_gpio_setpull
	mov	r1, #0
	movt	r4, #:upper16:s3c_gpio_setpull
	mov	r0, #224
	blx	r4
	movw	r3, #:lower16:__gpio_set_value
	mov	r0, #117
	movt	r3, #:upper16:__gpio_set_value
	mov	r1, #1
	blx	r3
	mov	r1, #1
	mov	r0, #53
	blx	r4
	mov	r1, #0
	mov	r0, #53
	blx	r4
	ldmfd	sp!, {r3, r4, r5, pc}
.L27:
	.align	2
.L26:
	.word	.LANCHOR0+52
	.fnend
	.size	sii9234_power_onoff, .-sii9234_power_onoff
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.18253, %object
	.size	__func__.18253, 14
__func__.18253:
	.ascii	"sii9234_reset\000"
	.space	2
	.type	__func__.18232, %object
	.size	__func__.18232, 17
__func__.18232:
	.ascii	"sii9234_cfg_gpio\000"
	.space	3
	.type	__func__.18207, %object
	.size	__func__.18207, 16
__func__.18207:
	.ascii	"i2c_add_devices\000"
	.type	__func__.18236, %object
	.size	__func__.18236, 20
__func__.18236:
	.ascii	"sii9234_power_onoff\000"
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_midas_mhl_init6, %object
	.size	__initcall_midas_mhl_init6, 4
__initcall_midas_mhl_init6:
	.word	midas_mhl_init
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	i2c_devs_sii9234, %object
	.size	i2c_devs_sii9234, 160
i2c_devs_sii9234:
	.ascii	"sii9234_mhl_tx\000"
	.space	5
	.space	2
	.short	57
	.word	sii9234_pdata
	.space	12
	.ascii	"sii9234_tpi\000"
	.space	8
	.space	2
	.short	61
	.word	sii9234_pdata
	.space	12
	.ascii	"sii9234_hdmi_rx\000"
	.space	4
	.space	2
	.short	73
	.word	sii9234_pdata
	.space	12
	.ascii	"sii9234_cbus\000"
	.space	7
	.space	2
	.short	100
	.word	sii9234_pdata
	.space	12
	.type	sii9234_pdata, %object
	.size	sii9234_pdata, 52
sii9234_pdata:
	.space	8
	.word	sii9234_cfg_gpio
	.word	0
	.word	sii9234_power_onoff
	.word	sii9234_reset
	.word	0
	.word	0
	.space	20
	.type	i2c_dev_hdmi_ddc, %object
	.size	i2c_dev_hdmi_ddc, 40
i2c_dev_hdmi_ddc:
	.ascii	"s5p_ddc\000"
	.space	12
	.space	2
	.short	58
	.space	16
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>%s()\012\000"
	.space	3
.LC1:
	.ascii	"MHL_INT\000"
.LC2:
	.ascii	"<3>%s: ERROR i2c bus %d not found\012\000"
	.space	1
.LC3:
	.ascii	"<3>[MHL] adding i2c fail - nodevice\012\000"
	.space	3
.LC4:
	.ascii	"%s - added %s successfully\012\000"
.LC5:
	.ascii	"%s - added %s at bus i2c bus %d failed\012\000"
.LC6:
	.ascii	"<3>[MHL] adding ddc fail - nodevice\012\000"
	.space	3
.LC7:
	.ascii	"<6>%s(%d)\012\000"
	.ident	"GCC: (GNU) 4.8"
