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
	.file	"midas-leds.c"
	.text
	.align	2
	.global	plat_leds_init
	.type	plat_leds_init, %function
plat_leds_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:i2c_get_adapter
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	mov	r0, #21
	.pad #8
	sub	sp, sp, #8
	movt	r3, #:upper16:i2c_get_adapter
	blx	r3
	subs	r4, r0, #0
	beq	.L2
	movw	r1, #:lower16:.LANCHOR0
	movw	r3, #:lower16:i2c_new_device
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:i2c_new_device
	blx	r3
	cmp	r0, #0
	beq	.L7
	movw	r1, #:lower16:.LC1
	movw	r2, #:lower16:.LANCHOR1
	movw	r3, #:lower16:.LANCHOR0
	movw	ip, #:lower16:_dev_info
	add	r0, r0, #32
	movt	r1, #:upper16:.LC1
	movt	r2, #:upper16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR0
	movt	ip, #:upper16:_dev_info
	blx	ip
.L4:
	movw	r3, #:lower16:i2c_put_adapter
	mov	r0, r4
	movt	r3, #:upper16:i2c_put_adapter
	blx	r3
.L5:
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, pc}
.L7:
	mov	r0, #21
	movw	r1, #:lower16:.LC0
	movw	r2, #:lower16:.LANCHOR1
	movw	r3, #:lower16:.LANCHOR0
	movw	ip, #:lower16:dev_err
	str	r0, [sp]
	movt	r1, #:upper16:.LC0
	movt	r2, #:upper16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR0
	movt	ip, #:upper16:dev_err
	add	r0, r4, #48
	blx	ip
	b	.L4
.L2:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	mov	r2, #21
	movt	r0, #:upper16:.LC2
	blx	r3
	b	.L5
	.fnend
	.size	plat_leds_init, .-plat_leds_init
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.16603, %object
	.size	__func__.16603, 16
__func__.16603:
	.ascii	"i2c_add_devices\000"
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_plat_leds_init6, %object
	.size	__initcall_plat_leds_init6, 4
__initcall_plat_leds_init6:
	.word	plat_leds_init
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	i2c_devs21_emul, %object
	.size	i2c_devs21_emul, 40
i2c_devs21_emul:
	.ascii	"lp5521\000"
	.space	13
	.space	2
	.short	50
	.word	lp5521_pdata
	.space	12
	.type	lp5521_pdata, %object
	.size	lp5521_pdata, 36
lp5521_pdata:
	.word	lp5521_led_config
	.byte	3
	.byte	1
	.space	18
	.byte	105
	.space	3
	.word	board_led_patterns
	.word	6
	.type	board_led_patterns, %object
	.size	board_led_patterns, 96
board_led_patterns:
	.word	mode_charging
	.space	8
	.byte	2
	.space	3
	.word	mode_charging_err
	.space	8
	.byte	8
	.space	3
	.space	8
	.word	mode_missed_noti
	.space	2
	.byte	10
	.space	1
	.word	mode_low_batt
	.space	8
	.byte	10
	.space	3
	.space	4
	.word	mode_full_chg
	.space	5
	.byte	2
	.space	2
	.space	4
	.word	mode_poweron_green
	.word	mode_poweron_blue
	.space	1
	.byte	22
	.byte	22
	.space	1
	.type	mode_poweron_blue, %object
	.size	mode_poweron_blue, 22
mode_poweron_blue:
	.byte	64
	.byte	0
	.byte	5
	.byte	126
	.byte	5
	.byte	126
	.byte	64
	.byte	-1
	.byte	85
	.byte	0
	.byte	5
	.byte	-2
	.byte	-31
	.byte	0
	.byte	5
	.byte	-2
	.byte	64
	.byte	0
	.byte	85
	.byte	0
	.byte	-31
	.byte	0
	.space	2
	.type	mode_poweron_green, %object
	.size	mode_poweron_green, 22
mode_poweron_green:
	.byte	64
	.byte	0
	.byte	10
	.byte	69
	.byte	10
	.byte	69
	.byte	64
	.byte	-116
	.byte	85
	.byte	0
	.byte	10
	.byte	-59
	.byte	-32
	.byte	8
	.byte	10
	.byte	-59
	.byte	64
	.byte	0
	.byte	85
	.byte	0
	.byte	-32
	.byte	8
	.space	2
	.type	mode_full_chg, %object
	.size	mode_full_chg, 2
mode_full_chg:
	.byte	64
	.byte	-1
	.space	2
	.type	mode_low_batt, %object
	.size	mode_low_batt, 10
mode_low_batt:
	.byte	64
	.byte	0
	.byte	96
	.byte	0
	.byte	-92
	.byte	-95
	.byte	64
	.byte	-1
	.byte	96
	.byte	0
	.space	2
	.type	mode_missed_noti, %object
	.size	mode_missed_noti, 10
mode_missed_noti:
	.byte	64
	.byte	0
	.byte	96
	.byte	0
	.byte	-92
	.byte	-95
	.byte	64
	.byte	-1
	.byte	96
	.byte	0
	.space	2
	.type	mode_charging_err, %object
	.size	mode_charging_err, 8
mode_charging_err:
	.byte	64
	.byte	0
	.byte	96
	.byte	0
	.byte	64
	.byte	-1
	.byte	96
	.byte	0
	.type	mode_charging, %object
	.size	mode_charging, 2
mode_charging:
	.byte	64
	.byte	-1
	.space	2
	.type	lp5521_led_config, %object
	.size	lp5521_led_config, 24
lp5521_led_config:
	.word	.LC3
	.byte	0
	.byte	20
	.byte	20
	.space	1
	.word	.LC4
	.byte	1
	.byte	20
	.byte	20
	.space	1
	.word	.LC5
	.byte	2
	.byte	20
	.byte	20
	.space	1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%s - added %s at bus i2c bus %d failed\012\000"
.LC1:
	.ascii	"%s - added %s successfully\012\000"
.LC2:
	.ascii	"<3>%s: ERROR i2c bus %d not found\012\000"
	.space	1
.LC3:
	.ascii	"led_r\000"
	.space	2
.LC4:
	.ascii	"led_g\000"
	.space	2
.LC5:
	.ascii	"led_b\000"
	.ident	"GCC: (GNU) 4.8"
