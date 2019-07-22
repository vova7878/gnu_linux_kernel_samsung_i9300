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
	.file	"board-smdk5250-input.c"
	.text
	.align	2
	.global	exynos5_smdk5250_input_init
	.type	exynos5_smdk5250_input_init, %function
exynos5_smdk5250_input_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:s3c_i2c7_set_platdata
	mov	r0, #0
	movt	r3, #:upper16:s3c_i2c7_set_platdata
	blx	r3
	movw	r1, #:lower16:.LANCHOR0
	movw	r3, #:lower16:i2c_register_board_info
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:i2c_register_board_info
	mov	r2, #1
	mov	r0, #7
	blx	r3
	movw	r2, #:lower16:.LC0
	movw	r3, #:lower16:gpio_request_one
	mov	r1, #0
	movt	r2, #:upper16:.LC0
	movt	r3, #:upper16:gpio_request_one
	mov	r0, #161
	blx	r3
	subs	r1, r0, #0
	bne	.L5
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r0, #161
	movt	r3, #:upper16:s3c_gpio_setpull
	blx	r3
	movw	r3, #:lower16:gpio_free
	mov	r0, #161
	movt	r3, #:upper16:gpio_free
	blx	r3
.L3:
	movw	r3, #:lower16:platform_add_devices
	mov	r1, #2
	movt	r3, #:upper16:platform_add_devices
	ldr	r0, .L6
	blx	r3
	ldmfd	sp!, {r3, pc}
.L5:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	b	.L3
.L7:
	.align	2
.L6:
	.word	.LANCHOR0+40
	.fnend
	.size	exynos5_smdk5250_input_init, .-exynos5_smdk5250_input_init
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	i2c_devs7, %object
	.size	i2c_devs7, 40
i2c_devs7:
	.ascii	"egalax_i2c\000"
	.space	9
	.space	2
	.short	4
	.word	exynos5_egalax_data
	.space	8
	.word	377
	.type	smdk5250_input_devices, %object
	.size	smdk5250_input_devices, 8
smdk5250_input_devices:
	.word	s3c_device_i2c7
	.word	smdk5250_input_device
	.type	exynos5_egalax_data, %object
	.size	exynos5_egalax_data, 12
exynos5_egalax_data:
	.word	189
	.space	8
	.space	4
	.type	smdk5250_input_device, %object
	.size	smdk5250_input_device, 360
smdk5250_input_device:
	.word	.LC2
	.word	0
	.space	84
	.word	smdk5250_input_data
	.space	248
	.space	16
	.type	smdk5250_input_data, %object
	.size	smdk5250_input_data, 16
smdk5250_input_data:
	.space	4
	.word	smdk5250_input_info
	.word	1
	.space	4
	.word	.LC3
	.word	0
	.type	smdk5250_input_info, %object
	.size	smdk5250_input_info, 4
smdk5250_input_info:
	.word	smdk5250_keypad_key_info
	.space	4
	.type	smdk5250_keypad_key_info, %object
	.size	smdk5250_keypad_key_info, 48
smdk5250_keypad_key_info:
	.word	gpio_event_input_func
	.space	4
	.byte	1
	.space	3
	.space	4
	.word	5000000
	.word	0
	.space	10
	.short	1
	.word	smdk5250_keypad_key_map
	.word	1
	.space	4
	.type	smdk5250_keypad_key_map, %object
	.size	smdk5250_keypad_key_map, 4
smdk5250_keypad_key_map:
	.byte	161
	.byte	0
	.byte	116
	.byte	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"GPX0\000"
	.space	3
.LC1:
	.ascii	"<3>failed to request GPX0 for suspend/resume contro"
	.ascii	"l\012\000"
	.space	2
.LC2:
	.ascii	"gpio-event\000"
	.space	1
.LC3:
	.ascii	"smdk5250-keypad\000"
	.ident	"GCC: (GNU) 4.8"
