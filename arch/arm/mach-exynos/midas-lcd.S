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
	.file	"midas-lcd.c"
	.text
	.align	2
	.type	s5p_dsim_mipi_power_control, %function
s5p_dsim_mipi_power_control:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	s5p_dsim_mipi_power_control, .-s5p_dsim_mipi_power_control
	.align	2
	.type	lcdtype_setup, %function
lcdtype_setup:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	.save {lr}
	.pad #12
	sub	sp, sp, #12
	add	r2, sp, #8
	movw	r1, #:lower16:.LANCHOR0
	movw	r3, #:lower16:get_option
	movt	r1, #:upper16:.LANCHOR0
	str	r0, [r2, #-4]!
	movt	r3, #:upper16:get_option
	mov	r0, r2
	blx	r3
	mov	r0, #1
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
	.fnend
	.size	lcdtype_setup, .-lcdtype_setup
	.align	2
	.type	lcd_power_on, %function
lcd_power_on:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r0, #:lower16:.LC0
	mov	r6, r1
	movw	r5, #:lower16:printk
	movw	r1, #:lower16:.LANCHOR1
	mov	r2, r6
	movt	r1, #:upper16:.LANCHOR1
	movt	r0, #:upper16:.LC0
	movt	r5, #:upper16:printk
	movw	r4, #:lower16:gpio_request
	blx	r5
	movw	r1, #:lower16:.LC1
	movt	r4, #:upper16:gpio_request
	movt	r1, #:upper16:.LC1
	mov	r0, #66
	blx	r4
	cmp	r0, #0
	bne	.L16
	movw	r1, #:lower16:.LC3
	mov	r0, #26
	movt	r1, #:upper16:.LC3
	blx	r4
	subs	r4, r0, #0
	bne	.L17
	cmp	r6, #0
	bne	.L18
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:regulator_get
	movt	r1, #:upper16:.LC5
	movt	r3, #:upper16:regulator_get
	blx	r3
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L9
	movw	r3, #:lower16:regulator_is_enabled
	movt	r3, #:upper16:regulator_is_enabled
	blx	r3
	cmp	r0, #0
	bne	.L19
.L11:
	movw	r3, #:lower16:regulator_put
	mov	r0, r4
	movt	r3, #:upper16:regulator_put
	movw	r4, #:lower16:__gpio_set_value
	blx	r3
	movt	r4, #:upper16:__gpio_set_value
	mov	r0, #26
	mov	r1, #0
	blx	r4
	mov	r0, #66
	mov	r1, #0
	blx	r4
.L9:
	movw	r4, #:lower16:gpio_free
	mov	r0, #66
	movt	r4, #:upper16:gpio_free
	blx	r4
	mov	r0, #26
	blx	r4
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L18:
	movw	r3, #:lower16:__gpio_set_value
	mov	r0, #26
	movt	r3, #:upper16:__gpio_set_value
	mov	r1, #1
	blx	r3
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:regulator_get
	mov	r0, r4
	movt	r1, #:upper16:.LC5
	movt	r3, #:upper16:regulator_get
	blx	r3
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L9
	movw	r3, #:lower16:regulator_enable
	movt	r3, #:upper16:regulator_enable
	blx	r3
	movw	r3, #:lower16:regulator_put
	mov	r0, r4
	movt	r3, #:upper16:regulator_put
	blx	r3
	b	.L9
.L19:
	movw	r3, #:lower16:regulator_force_disable
	mov	r0, r4
	movt	r3, #:upper16:regulator_force_disable
	blx	r3
	b	.L11
.L16:
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	blx	r5
	mvn	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L17:
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	blx	r5
	mvn	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	lcd_power_on, .-lcd_power_on
	.align	2
	.type	reset_lcd, %function
reset_lcd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:.LC1
	movw	r3, #:lower16:gpio_request
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r1, #:upper16:.LC1
	movt	r3, #:upper16:gpio_request
	mov	r0, #66
	blx	r3
	subs	r6, r0, #0
	bne	.L23
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, #1
	movt	r3, #:upper16:gpio_direction_output
	mov	r0, #66
	blx	r3
	movw	r4, #:lower16:usleep_range
	movw	r0, #5000
	movt	r4, #:upper16:usleep_range
	mov	r1, r0
	movw	r5, #:lower16:__gpio_set_value
	blx	r4
	movt	r5, #:upper16:__gpio_set_value
	mov	r1, r6
	mov	r0, #66
	blx	r5
	movw	r0, #5000
	mov	r1, r0
	blx	r4
	mov	r0, #66
	mov	r1, #1
	blx	r5
	movw	r0, #5000
	mov	r1, r0
	blx	r4
	movw	r3, #:lower16:gpio_free
	mov	r0, #66
	movt	r3, #:upper16:gpio_free
	blx	r3
	mov	r0, r6
	ldmfd	sp!, {r4, r5, r6, pc}
.L23:
	movw	r0, #:lower16:.LC6
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC6
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	reset_lcd, .-reset_lcd
	.align	2
	.global	mipi_fb_init
	.type	mipi_fb_init, %function
mipi_fb_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r6, #:lower16:s3c_gpio_cfgpin
	movt	r6, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #14
	mov	r0, #66
	movw	r5, #:lower16:s3c_gpio_setpull
	blx	r6
	movt	r5, #:upper16:s3c_gpio_setpull
	mov	r1, #0
	mov	r0, #66
	movw	r4, #:lower16:.LANCHOR2
	blx	r5
	mvn	r1, #14
	mov	r0, #26
	blx	r6
	mov	r1, #0
	mov	r0, #26
	blx	r5
	movt	r4, #:upper16:.LANCHOR2
	movw	r0, #:lower16:.LC7
	movw	r3, #:lower16:printk
	ldr	r2, [r4], #88
	movt	r3, #:upper16:printk
	ldr	r1, .L25
	movt	r0, #:upper16:.LC7
	mov	r5, #1
	blx	r3
	movw	r0, #:lower16:s5p_device_dsim
	movw	r2, #:lower16:s5p_dsim_mipi_power_control
	movt	r0, #:upper16:s5p_device_dsim
	movt	r2, #:upper16:s5p_dsim_mipi_power_control
	ldr	r3, [r0, #92]
	mov	r7, #3
	mov	r6, #125
	movw	ip, #:lower16:reset_lcd
	movw	r1, #:lower16:lcd_power_on
	movt	ip, #:upper16:reset_lcd
	ldr	lr, [r3, #80]
	movt	r1, #:upper16:lcd_power_on
	str	r2, [r3, #84]
	movw	r2, #:lower16:platform_device_register
	str	r5, [r3, #72]
	movt	r2, #:upper16:platform_device_register
	str	r4, [lr, #16]
	ldr	r4, [r3, #76]
	strb	r7, [r4, #16]
	ldr	r4, [r3, #76]
	strh	r6, [r4, #18]	@ movhi
	ldr	r3, [r3, #76]
	strb	r5, [r3, #20]
	ldr	r3, [lr, #20]
	str	ip, [r3, #12]
	str	r1, [r3, #16]
	blx	r2
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L26:
	.align	2
.L25:
	.word	.LANCHOR1+16
	.fnend
	.size	mipi_fb_init, .-mipi_fb_init
	.global	mdnie_device
	.global	lcdtype
	.global	fb_platform_data
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.23970, %object
	.size	__func__.23970, 13
__func__.23970:
	.ascii	"lcd_power_on\000"
	.space	3
	.type	__func__.23985, %object
	.size	__func__.23985, 13
__func__.23985:
	.ascii	"mipi_fb_init\000"
	.type	__setup_str_lcdtype_setup, %object
	.size	__setup_str_lcdtype_setup, 9
__setup_str_lcdtype_setup:
	.ascii	"lcdtype=\000"
	.data
	.align	3
	.set	.LANCHOR2,. + 0
	.type	fb_platform_data, %object
	.size	fb_platform_data, 88
fb_platform_data:
	.word	112
	.ascii	"fimd\000"
	.space	11
	.word	5
	.space	20
	.word	2
	.word	16842752
	.word	s6e8aa0
	.space	32
	.type	s6e8aa0, %object
	.size	s6e8aa0, 128
s6e8aa0:
	.word	.LC9
	.word	720
	.word	1280
	.word	60
	.word	106
	.word	24
	.word	60
	.word	40
	.space	4
	.word	5
	.word	5
	.word	5
	.word	13
	.word	1
	.word	1
	.word	1
	.word	2
	.word	11
	.word	2
	.space	12
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.space	8
	.type	mdnie_device, %object
	.size	mdnie_device, 360
mdnie_device:
	.word	.LC8
	.word	-1
	.word	exynos4_device_pd+728
	.space	80
	.word	mdnie_data
	.space	248
	.space	16
	.type	mdnie_data, %object
	.size	mdnie_data, 8
mdnie_data:
	.word	-1
	.space	4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>%s : enable=%d\012\000"
	.space	1
.LC1:
	.ascii	"MLCD_RST\000"
	.space	3
.LC2:
	.ascii	"<3>failed to request GPY4[5] for MLCD_RST control\012"
	.ascii	"\000"
	.space	1
.LC3:
	.ascii	"LCD_EN\000"
	.space	1
.LC4:
	.ascii	"<3>failed to request GPM4[4] for LCD_2.2V_EN contro"
	.ascii	"l\012\000"
	.space	2
.LC5:
	.ascii	"vlcd_3.3v\000"
	.space	2
.LC6:
	.ascii	"<3>failed to request GPY4(5) for lcd reset control\012"
	.ascii	"\000"
.LC7:
	.ascii	"<6>%s :: fb_platform_data.hw_ver = 0x%x\012\000"
	.space	3
.LC8:
	.ascii	"mdnie\000"
	.space	2
.LC9:
	.ascii	"s6e8aa0\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	lcdtype, %object
	.size	lcdtype, 4
lcdtype:
	.space	4
	.section	.init.setup,"aw",%progbits
	.align	2
	.type	__setup_lcdtype_setup, %object
	.size	__setup_lcdtype_setup, 12
__setup_lcdtype_setup:
	.word	__setup_str_lcdtype_setup
	.word	lcdtype_setup
	.word	0
	.ident	"GCC: (GNU) 4.8"
