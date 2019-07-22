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
	.file	"midas-sound.c"
	.text
	.align	2
	.type	fmradio_power, %function
fmradio_power:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r5, #:lower16:.LANCHOR0
	movw	r4, #:lower16:__gpio_set_value
	movt	r5, #:upper16:.LANCHOR0
	mov	r6, r0
	movt	r4, #:upper16:__gpio_set_value
	ldr	r0, [r5]
	mov	r1, #1
	blx	r4
	cmp	r6, #0
	beq	.L2
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:gpio_request
	mov	r0, #202
	blx	r3
	subs	r7, r0, #0
	bne	.L6
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, #1
	movt	r3, #:upper16:gpio_direction_output
	mov	r0, #202
	blx	r3
	ldr	r0, [r5, #8]
	mov	r1, r7
	blx	r4
	movw	r6, #:lower16:usleep_range
	mov	r1, r7
	mov	r0, #202
	movt	r6, #:upper16:usleep_range
	blx	r4
	mov	r0, #5
	mov	r1, #10
	blx	r6
	ldr	r0, [r5, #8]
	mov	r1, #1
	blx	r4
	mov	r0, #10
	mov	r1, #15
	blx	r6
	mov	r0, #202
	mov	r1, #1
	blx	r4
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #0
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mov	r0, #202
	blx	r3
	movw	r3, #:lower16:gpio_free
	mov	r0, #202
	movt	r3, #:upper16:gpio_free
	blx	r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L2:
	ldr	r0, [r5, #8]
	mov	r1, r6
	blx	r4
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L6:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	fmradio_power, .-fmradio_power
	.align	2
	.global	midas_snd_set_mclk
	.type	midas_snd_set_mclk, %function
midas_snd_set_mclk:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_lock
	mov	r5, r0
	movt	r3, #:upper16:_raw_spin_lock
	add	r0, r4, #12
	mov	r6, r1
	blx	r3
	cmp	r5, #0
	strb	r5, [r4, #20]
	ldr	r3, [r4, #24]
	beq	.L8
	cmp	r3, #0
	add	r3, r3, #1
	str	r3, [r4, #24]
	beq	.L9
	cmp	r6, #0
	beq	.L22
.L9:
	movw	r0, #:lower16:.LC2
	movw	r5, #:lower16:printk
	movt	r0, #:upper16:.LC2
	movt	r5, #:upper16:printk
	blx	r5
	movw	r3, #:lower16:exynos4_pmu_xclkout_set
	movw	r7, #:lower16:__const_udelay
	movt	r3, #:upper16:exynos4_pmu_xclkout_set
	ldrb	r0, [r4, #20]	@ zero_extendqisi2
	mov	r1, #9
	mov	r6, #10
	movt	r7, #:upper16:__const_udelay
	blx	r3
.L12:
	movw	r0, #12560
	movt	r0, 4915
	blx	r7
	subs	r6, r6, #1
	bne	.L12
	b	.L10
.L8:
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #24]
	ble	.L13
	cmp	r6, #0
	bne	.L13
.L22:
	movw	r5, #:lower16:printk
	movt	r5, #:upper16:printk
.L10:
	movw	r3, #:lower16:_raw_spin_unlock
	ldr	r0, .L23
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	movw	r0, #:lower16:.LC4
	ldrb	r1, [r4, #20]	@ zero_extendqisi2
	ldr	r2, [r4, #24]
	movt	r0, #:upper16:.LC4
	blx	r5
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L13:
	movw	r0, #:lower16:.LC3
	movw	r5, #:lower16:printk
	movt	r0, #:upper16:.LC3
	movt	r5, #:upper16:printk
	blx	r5
	movw	r3, #:lower16:exynos4_pmu_xclkout_set
	ldrb	r0, [r4, #20]	@ zero_extendqisi2
	movt	r3, #:upper16:exynos4_pmu_xclkout_set
	mov	r1, #9
	blx	r3
	mov	r3, #0
	str	r3, [r4, #24]
	b	.L10
.L24:
	.align	2
.L23:
	.word	.LANCHOR0+12
	.fnend
	.size	midas_snd_set_mclk, .-midas_snd_set_mclk
	.align	2
	.global	midas_snd_get_mclk
	.type	midas_snd_get_mclk, %function
midas_snd_get_mclk:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldrb	r0, [r3, #20]	@ zero_extendqisi2
	bx	lr
	.fnend
	.size	midas_snd_get_mclk, .-midas_snd_get_mclk
	.align	2
	.global	midas_sound_init
	.type	midas_sound_init, %function
midas_sound_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r0, #:lower16:.LC5
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:printk
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC5
	movw	r4, #:lower16:.LANCHOR0
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	movt	r4, #:upper16:.LANCHOR0
	mov	ip, #116
	mov	r2, #32
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #202
	mov	r1, #3
	str	ip, [r4]
	str	r2, [r4, #8]
	blx	r3
	ldr	r0, [r4, #8]
	cmp	r0, #328
	bhi	.L27
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:gpio_request
	blx	r3
	movw	r3, #:lower16:gpio_direction_output
	ldr	r0, [r4, #8]
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
.L27:
	movw	r0, #:lower16:.LANCHOR2
	movw	r3, #:lower16:platform_add_devices
	movt	r3, #:upper16:platform_add_devices
	movt	r0, #:upper16:.LANCHOR2
	mov	r1, #1
	blx	r3
	movw	r3, #:lower16:system_rev
	movt	r3, #:upper16:system_rev
	ldr	r3, [r3]
	cmp	r3, #3
	movweq	r4, #:lower16:i2c_register_board_info
	movteq	r4, #:upper16:i2c_register_board_info
	beq	.L28
	movw	r3, #:lower16:s3c_i2c4_set_platdata
	mov	r0, #0
	movt	r3, #:upper16:s3c_i2c4_set_platdata
	movw	r4, #:lower16:i2c_register_board_info
	blx	r3
	movt	r4, #:upper16:i2c_register_board_info
	mov	r0, #4
	ldr	r1, .L32
	mov	r2, #1
	blx	r4
.L28:
	ldr	r1, .L32+4
	mov	r2, #1
	mov	r0, #19
	blx	r4
	ldmfd	sp!, {r4, pc}
.L33:
	.align	2
.L32:
	.word	.LANCHOR2+4
	.word	.LANCHOR2+44
	.fnend
	.size	midas_sound_init, .-midas_sound_init
	.global	s3c_device_i2c19
	.global	vbatt_device
	.global	si47xx_data
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.20940, %object
	.size	__func__.20940, 17
__func__.20940:
	.ascii	"midas_sound_init\000"
	.data
	.align	3
	.set	.LANCHOR2,. + 0
	.type	midas_sound_devices, %object
	.size	midas_sound_devices, 4
midas_sound_devices:
	.word	s3c_device_i2c19
	.type	i2c_wm1811, %object
	.size	i2c_wm1811, 40
i2c_wm1811:
	.ascii	"wm1811\000"
	.space	13
	.space	2
	.short	26
	.word	wm1811_pdata
	.space	8
	.word	382
	.type	i2c_devs19_emul, %object
	.size	i2c_devs19_emul, 40
i2c_devs19_emul:
	.ascii	"Si47xx\000"
	.space	13
	.space	2
	.short	17
	.word	si47xx_pdata
	.space	8
	.word	363
	.space	4
	.type	s3c_device_i2c19, %object
	.size	s3c_device_i2c19, 360
s3c_device_i2c19:
	.word	.LC6
	.word	19
	.space	84
	.word	gpio_i2c_data19
	.space	248
	.space	16
	.type	gpio_i2c_data19, %object
	.size	gpio_i2c_data19, 20
gpio_i2c_data19:
	.word	138
	.word	137
	.space	12
	.type	si47xx_pdata, %object
	.size	si47xx_pdata, 36
si47xx_pdata:
	.short	0
	.short	19
	.short	22
	.short	25
	.short	28
	.short	31
	.short	34
	.short	37
	.short	40
	.short	43
	.short	46
	.short	49
	.short	52
	.short	55
	.short	58
	.short	61
	.word	fmradio_power
	.type	wm1811_pdata, %object
	.size	wm1811_pdata, 164
wm1811_pdata:
	.space	4
	.word	3
	.space	24
	.word	32768
	.word	65536
	.word	65536
	.word	65536
	.word	238
	.space	4
	.word	wm1811_ldo1_initdata
	.space	8
	.word	wm1811_ldo2_initdata
	.word	469
	.word	1
	.word	drc_value
	.space	48
	.byte	4
	.space	7
	.byte	64
	.space	3
	.word	47
	.word	39
	.short	255
	.byte	1
	.space	1
	.word	30000
	.space	4
	.type	drc_value, %object
	.size	drc_value, 16
drc_value:
	.word	.LC7
	.short	155
	.short	2116
	.short	232
	.short	528
	.short	0
	.space	2
	.type	wm1811_ldo2_initdata, %object
	.size	wm1811_ldo2_initdata, 116
wm1811_ldo2_initdata:
	.space	4
	.word	.LC8
	.space	88
	.byte	1
	.space	3
	.word	1
	.word	wm1811_ldo2_supplies
	.space	8
	.type	wm1811_ldo2_supplies, %object
	.size	wm1811_ldo2_supplies, 12
wm1811_ldo2_supplies:
	.space	4
	.word	0
	.word	.LC9
	.type	wm1811_ldo1_initdata, %object
	.size	wm1811_ldo1_initdata, 116
wm1811_ldo1_initdata:
	.space	4
	.word	.LC10
	.space	24
	.word	8
	.space	64
	.word	1
	.word	wm1811_ldo1_supplies
	.space	8
	.type	wm1811_ldo1_supplies, %object
	.size	wm1811_ldo1_supplies, 12
wm1811_ldo1_supplies:
	.space	4
	.word	0
	.word	.LC11
	.space	4
	.type	vbatt_device, %object
	.size	vbatt_device, 360
vbatt_device:
	.word	.LC12
	.word	-1
	.space	84
	.word	vbatt_config
	.space	248
	.space	16
	.type	vbatt_config, %object
	.size	vbatt_config, 24
vbatt_config:
	.word	.LC13
	.word	5000000
	.word	-22
	.space	8
	.word	vbatt_initdata
	.type	vbatt_initdata, %object
	.size	vbatt_initdata, 116
vbatt_initdata:
	.space	4
	.space	92
	.byte	1
	.space	3
	.word	3
	.word	vbatt_supplies
	.space	8
	.type	vbatt_supplies, %object
	.size	vbatt_supplies, 36
vbatt_supplies:
	.space	4
	.word	0
	.word	.LC14
	.space	4
	.word	0
	.word	.LC15
	.space	4
	.word	0
	.word	.LC16
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"GPC1\000"
	.space	3
.LC1:
	.ascii	"<3><3>GPIO_FM_INT GPIO set error!\012\000"
	.space	1
.LC2:
	.ascii	"<6>Sound: enabled mclk\012\000"
.LC3:
	.ascii	"<6>Sound: disabled mclk\012\000"
	.space	3
.LC4:
	.ascii	"<6>Sound: state: %d, use_cnt: %d\012\000"
	.space	2
.LC5:
	.ascii	"<6>Sound: start %s\012\000"
.LC6:
	.ascii	"i2c-gpio\000"
	.space	3
.LC7:
	.ascii	"voice call DRC\000"
	.space	1
.LC8:
	.ascii	"WM1811 LDO2\000"
.LC9:
	.ascii	"DCVDD\000"
	.space	2
.LC10:
	.ascii	"WM1811 LDO1\000"
.LC11:
	.ascii	"AVDD1\000"
	.space	2
.LC12:
	.ascii	"reg-fixed-voltage\000"
	.space	2
.LC13:
	.ascii	"VBATT\000"
	.space	2
.LC14:
	.ascii	"LDO1VDD\000"
.LC15:
	.ascii	"SPKVDD1\000"
.LC16:
	.ascii	"SPKVDD2\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	si47xx_data, %object
	.size	si47xx_data, 12
si47xx_data:
	.space	12
	.type	midas_snd_spinlock, %object
	.size	midas_snd_spinlock, 8
midas_snd_spinlock:
	.space	8
	.type	midas_snd_mclk_enabled, %object
	.size	midas_snd_mclk_enabled, 1
midas_snd_mclk_enabled:
	.space	1
	.space	3
	.type	use_cnt.20894, %object
	.size	use_cnt.20894, 4
use_cnt.20894:
	.space	4
	.ident	"GCC: (GNU) 4.8"
