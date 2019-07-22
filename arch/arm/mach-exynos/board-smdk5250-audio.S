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
	.file	"board-smdk5250-audio.c"
	.text
	.align	2
	.global	exynos5_smdk5250_audio_init
	.type	exynos5_smdk5250_audio_init, %function
exynos5_smdk5250_audio_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:s3c_i2c1_set_platdata
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	mov	r0, #0
	movt	r3, #:upper16:s3c_i2c1_set_platdata
	movw	r4, #:lower16:.LANCHOR0
	blx	r3
	movt	r4, #:upper16:.LANCHOR0
	mov	r0, #1
	movw	r3, #:lower16:i2c_register_board_info
	mov	r1, r4
	mov	r2, r0
	movt	r3, #:upper16:i2c_register_board_info
	blx	r3
	movw	r3, #:lower16:platform_add_devices
	add	r0, r4, #40
	movt	r3, #:upper16:platform_add_devices
	mov	r1, #8
	blx	r3
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	exynos5_smdk5250_audio_init, .-exynos5_smdk5250_audio_init
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	i2c_devs1, %object
	.size	i2c_devs1, 40
i2c_devs1:
	.ascii	"wm8994\000"
	.space	13
	.space	2
	.short	26
	.word	wm8994_platform_data
	.space	12
	.type	smdk5250_audio_devices, %object
	.size	smdk5250_audio_devices, 32
smdk5250_audio_devices:
	.word	s3c_device_i2c1
	.word	exynos_device_i2s0
	.word	exynos_device_srp
	.word	wm8994_fixed_voltage0
	.word	wm8994_fixed_voltage1
	.word	wm8994_fixed_voltage2
	.word	samsung_asoc_dma
	.word	samsung_asoc_idma
	.type	wm8994_platform_data, %object
	.size	wm8994_platform_data, 164
wm8994_platform_data:
	.space	4
	.word	1
	.space	24
	.word	33024
	.word	256
	.word	256
	.word	256
	.word	0
	.word	0
	.word	wm8994_ldo1_data
	.word	0
	.word	0
	.word	wm8994_ldo2_data
	.space	92
	.type	wm8994_ldo2_data, %object
	.size	wm8994_ldo2_data, 116
wm8994_ldo2_data:
	.space	4
	.word	.LC0
	.space	92
	.word	1
	.word	wm8994_dcvdd_supply
	.space	8
	.type	wm8994_ldo1_data, %object
	.size	wm8994_ldo1_data, 116
wm8994_ldo1_data:
	.space	4
	.word	.LC1
	.space	92
	.word	1
	.word	wm8994_avdd1_supply
	.space	8
	.type	wm8994_dcvdd_supply, %object
	.size	wm8994_dcvdd_supply, 12
wm8994_dcvdd_supply:
	.space	4
	.word	.LC2
	.word	.LC0
	.type	wm8994_avdd1_supply, %object
	.size	wm8994_avdd1_supply, 12
wm8994_avdd1_supply:
	.space	4
	.word	.LC2
	.word	.LC1
	.space	4
	.type	wm8994_fixed_voltage2, %object
	.size	wm8994_fixed_voltage2, 360
wm8994_fixed_voltage2:
	.word	.LC3
	.word	2
	.space	84
	.word	wm8994_fixed_voltage2_config
	.space	248
	.space	16
	.type	wm8994_fixed_voltage1, %object
	.size	wm8994_fixed_voltage1, 360
wm8994_fixed_voltage1:
	.word	.LC3
	.word	1
	.space	84
	.word	wm8994_fixed_voltage1_config
	.space	248
	.space	16
	.type	wm8994_fixed_voltage0, %object
	.size	wm8994_fixed_voltage0, 360
wm8994_fixed_voltage0:
	.word	.LC3
	.word	0
	.space	84
	.word	wm8994_fixed_voltage0_config
	.space	248
	.space	16
	.type	wm8994_fixed_voltage2_config, %object
	.size	wm8994_fixed_voltage2_config, 24
wm8994_fixed_voltage2_config:
	.word	.LC4
	.word	3300000
	.word	-22
	.space	8
	.word	wm8994_fixed_voltage2_init_data
	.type	wm8994_fixed_voltage1_config, %object
	.size	wm8994_fixed_voltage1_config, 24
wm8994_fixed_voltage1_config:
	.word	.LC5
	.word	5000000
	.word	-22
	.space	8
	.word	wm8994_fixed_voltage1_init_data
	.type	wm8994_fixed_voltage0_config, %object
	.size	wm8994_fixed_voltage0_config, 24
wm8994_fixed_voltage0_config:
	.word	.LC6
	.word	1800000
	.word	-22
	.space	8
	.word	wm8994_fixed_voltage0_init_data
	.type	wm8994_fixed_voltage2_init_data, %object
	.size	wm8994_fixed_voltage2_init_data, 116
wm8994_fixed_voltage2_init_data:
	.space	4
	.space	92
	.byte	1
	.space	3
	.word	1
	.word	wm8994_fixed_voltage2_supplies
	.space	8
	.type	wm8994_fixed_voltage1_init_data, %object
	.size	wm8994_fixed_voltage1_init_data, 116
wm8994_fixed_voltage1_init_data:
	.space	4
	.space	92
	.byte	1
	.space	3
	.word	2
	.word	wm8994_fixed_voltage1_supplies
	.space	8
	.type	wm8994_fixed_voltage0_init_data, %object
	.size	wm8994_fixed_voltage0_init_data, 116
wm8994_fixed_voltage0_init_data:
	.space	4
	.space	92
	.byte	1
	.space	3
	.word	2
	.word	wm8994_fixed_voltage0_supplies
	.space	8
	.type	wm8994_fixed_voltage2_supplies, %object
	.size	wm8994_fixed_voltage2_supplies, 12
wm8994_fixed_voltage2_supplies:
	.space	4
	.word	.LC2
	.word	.LC7
	.type	wm8994_fixed_voltage1_supplies, %object
	.size	wm8994_fixed_voltage1_supplies, 24
wm8994_fixed_voltage1_supplies:
	.space	4
	.word	.LC2
	.word	.LC8
	.space	4
	.word	.LC2
	.word	.LC9
	.type	wm8994_fixed_voltage0_supplies, %object
	.size	wm8994_fixed_voltage0_supplies, 24
wm8994_fixed_voltage0_supplies:
	.space	4
	.word	.LC2
	.word	.LC10
	.space	4
	.word	.LC2
	.word	.LC11
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"DCVDD\000"
	.space	2
.LC1:
	.ascii	"AVDD1\000"
	.space	2
.LC2:
	.ascii	"1-001a\000"
	.space	1
.LC3:
	.ascii	"reg-fixed-voltage\000"
	.space	2
.LC4:
	.ascii	"VDD_3.3V\000"
	.space	3
.LC5:
	.ascii	"DC_5V\000"
	.space	2
.LC6:
	.ascii	"VDD_1.8V\000"
	.space	3
.LC7:
	.ascii	"DBVDD\000"
	.space	2
.LC8:
	.ascii	"SPKVDD1\000"
.LC9:
	.ascii	"SPKVDD2\000"
.LC10:
	.ascii	"AVDD2\000"
	.space	2
.LC11:
	.ascii	"CPVDD\000"
	.ident	"GCC: (GNU) 4.8"
