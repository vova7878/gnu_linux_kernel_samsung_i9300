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
	.file	"board-grande-sound.c"
	.text
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
	mov	r0, r4
	mov	r6, r1
	blx	r3
	cmp	r5, #0
	strb	r5, [r4, #8]
	ldr	r3, [r4, #12]
	beq	.L2
	cmp	r3, #0
	add	r3, r3, #1
	str	r3, [r4, #12]
	beq	.L3
	cmp	r6, #0
	beq	.L16
.L3:
	movw	r0, #:lower16:.LC0
	movw	r5, #:lower16:printk
	movt	r0, #:upper16:.LC0
	movt	r5, #:upper16:printk
	blx	r5
	movw	r3, #:lower16:exynos4_pmu_xclkout_set
	movw	r7, #:lower16:__const_udelay
	movt	r3, #:upper16:exynos4_pmu_xclkout_set
	ldrb	r0, [r4, #8]	@ zero_extendqisi2
	mov	r1, #9
	mov	r6, #10
	movt	r7, #:upper16:__const_udelay
	blx	r3
.L6:
	movw	r0, #12560
	movt	r0, 4915
	blx	r7
	subs	r6, r6, #1
	bne	.L6
	b	.L4
.L2:
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #12]
	ble	.L7
	cmp	r6, #0
	bne	.L7
.L16:
	movw	r5, #:lower16:printk
	movt	r5, #:upper16:printk
.L4:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	movw	r0, #:lower16:.LC2
	ldrb	r1, [r4, #8]	@ zero_extendqisi2
	ldr	r2, [r4, #12]
	movt	r0, #:upper16:.LC2
	blx	r5
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L7:
	movw	r0, #:lower16:.LC1
	movw	r5, #:lower16:printk
	movt	r0, #:upper16:.LC1
	movt	r5, #:upper16:printk
	blx	r5
	movw	r3, #:lower16:exynos4_pmu_xclkout_set
	ldrb	r0, [r4, #8]	@ zero_extendqisi2
	movt	r3, #:upper16:exynos4_pmu_xclkout_set
	mov	r1, #9
	blx	r3
	mov	r3, #0
	str	r3, [r4, #12]
	b	.L4
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
	ldrb	r0, [r3, #8]	@ zero_extendqisi2
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
	movw	r0, #:lower16:.LC3
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:printk
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC3
	movw	r4, #:lower16:.LANCHOR2
	blx	r3
	movw	r3, #:lower16:platform_add_devices
	mov	r1, #0
	movt	r3, #:upper16:platform_add_devices
	ldr	r0, .L20
	blx	r3
	movt	r4, #:upper16:.LANCHOR2
	mov	r2, #0
	movw	r3, #:lower16:s3c_i2c4_set_platdata
	mov	r0, r2
	str	r2, [r4, #36]
	movt	r3, #:upper16:s3c_i2c4_set_platdata
	blx	r3
	movw	r3, #:lower16:i2c_register_board_info
	mov	r1, r4
	movt	r3, #:upper16:i2c_register_board_info
	mov	r2, #1
	mov	r0, #4
	blx	r3
	ldmfd	sp!, {r4, pc}
.L21:
	.align	2
.L20:
	.word	.LANCHOR0+16
	.fnend
	.size	midas_sound_init, .-midas_sound_init
	.global	vbatt_device
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.20681, %object
	.size	__func__.20681, 17
__func__.20681:
	.ascii	"midas_sound_init\000"
	.data
	.align	3
	.set	.LANCHOR2,. + 0
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
	.word	47
	.short	255
	.byte	1
	.space	1
	.word	30000
	.space	4
	.type	drc_value, %object
	.size	drc_value, 16
drc_value:
	.word	.LC4
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
	.word	.LC5
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
	.word	.LC6
	.type	wm1811_ldo1_initdata, %object
	.size	wm1811_ldo1_initdata, 116
wm1811_ldo1_initdata:
	.space	4
	.word	.LC7
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
	.word	.LC8
	.space	4
	.type	vbatt_device, %object
	.size	vbatt_device, 360
vbatt_device:
	.word	.LC9
	.word	-1
	.space	84
	.word	vbatt_config
	.space	248
	.space	16
	.type	vbatt_config, %object
	.size	vbatt_config, 24
vbatt_config:
	.word	.LC10
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
	.word	.LC11
	.space	4
	.word	0
	.word	.LC12
	.space	4
	.word	0
	.word	.LC13
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>Sound: enabled mclk\012\000"
.LC1:
	.ascii	"<6>Sound: disabled mclk\012\000"
	.space	3
.LC2:
	.ascii	"<6>Sound: state: %d, use_cnt: %d\012\000"
	.space	2
.LC3:
	.ascii	"<6>Sound: start %s\012\000"
.LC4:
	.ascii	"voice call DRC\000"
	.space	1
.LC5:
	.ascii	"WM1811 LDO2\000"
.LC6:
	.ascii	"DCVDD\000"
	.space	2
.LC7:
	.ascii	"WM1811 LDO1\000"
.LC8:
	.ascii	"AVDD1\000"
	.space	2
.LC9:
	.ascii	"reg-fixed-voltage\000"
	.space	2
.LC10:
	.ascii	"VBATT\000"
	.space	2
.LC11:
	.ascii	"LDO1VDD\000"
.LC12:
	.ascii	"SPKVDD1\000"
.LC13:
	.ascii	"SPKVDD2\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	midas_snd_spinlock, %object
	.size	midas_snd_spinlock, 8
midas_snd_spinlock:
	.space	8
	.type	midas_snd_mclk_enabled, %object
	.size	midas_snd_mclk_enabled, 1
midas_snd_mclk_enabled:
	.space	1
	.space	3
	.type	use_cnt.20646, %object
	.size	use_cnt.20646, 4
use_cnt.20646:
	.space	4
	.type	midas_sound_devices, %object
	.size	midas_sound_devices, 0
midas_sound_devices:
	.ident	"GCC: (GNU) 4.8"
