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
	.file	"mach-armlex4210.c"

	.text
	.align	2
	.type	armlex4210_machine_init, %function
armlex4210_machine_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, 65100
	movw	r1, #7313
	movw	r4, #:lower16:.LANCHOR0
	movt	r1, 4358
	ldr	ip, [r3]
	movt	r4, #:upper16:.LANCHOR0
	movw	r2, #:lower16:s3c_sdhci0_set_platdata
	mov	r0, r4
	movt	r2, #:upper16:s3c_sdhci0_set_platdata
	movw	r6, #:lower16:s3c_gpio_cfgpin
	bic	ip, ip, #240
	movt	r6, #:upper16:s3c_gpio_cfgpin
	orr	ip, ip, #176
	movw	r5, #:lower16:s3c_gpio_setpull
	str	ip, [r3]
	movt	r5, #:upper16:s3c_gpio_setpull
	str	r1, [r3, #8]
	blx	r2
	movw	r3, #:lower16:s3c_sdhci2_set_platdata
	add	r0, r4, #52
	movt	r3, #:upper16:s3c_sdhci2_set_platdata
	blx	r3
	movw	r3, #:lower16:s3c_sdhci3_set_platdata
	add	r0, r4, #104
	movt	r3, #:upper16:s3c_sdhci3_set_platdata
	blx	r3
	mvn	r1, #0
	mov	r0, #208
	blx	r6
	mov	r1, #3
	mov	r0, #208
	blx	r5
	mvn	r1, #0
	mov	r0, #205
	blx	r6
	mov	r1, #3
	mov	r0, #205
	blx	r5
	mvn	r1, #0
	mov	r0, #204
	blx	r6
	mov	r1, #3
	mov	r0, #204
	blx	r5
	movw	r3, #:lower16:platform_add_devices
	add	r0, r4, #156
	movt	r3, #:upper16:platform_add_devices
	mov	r1, #8
	blx	r3
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	armlex4210_machine_init, .-armlex4210_machine_init
	.align	2
	.type	armlex4210_map_io, %function
armlex4210_map_io:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r0, #0
	movw	r3, #:lower16:s5p_init_io
	mov	r1, r0
	mov	r2, #-33554432
	movt	r3, #:upper16:s5p_init_io
	blx	r3
	mov	r0, #13824
	movw	r3, #:lower16:s3c24xx_init_clocks
	movt	r0, 366
	movt	r3, #:upper16:s3c24xx_init_clocks
	blx	r3
	movw	r3, #:lower16:s3c24xx_init_uarts
	ldr	r0, .L3
	movt	r3, #:upper16:s3c24xx_init_uarts
	mov	r1, #4
	blx	r3
	ldmfd	sp!, {r3, pc}
.L4:
	.align	2
.L3:
	.word	.LANCHOR0+188
	.fnend
	.size	armlex4210_map_io, .-armlex4210_map_io
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	armlex4210_hsmmc0_pdata, %object
	.size	armlex4210_hsmmc0_pdata, 52
armlex4210_hsmmc0_pdata:
	.space	8
	.word	4
	.word	1
	.space	36
	.type	armlex4210_hsmmc2_pdata, %object
	.size	armlex4210_hsmmc2_pdata, 52
armlex4210_hsmmc2_pdata:
	.word	4
	.space	4
	.word	2
	.word	1
	.space	8
	.word	213
	.byte	1
	.space	23
	.type	armlex4210_hsmmc3_pdata, %object
	.size	armlex4210_hsmmc3_pdata, 52
armlex4210_hsmmc3_pdata:
	.word	4
	.space	4
	.word	4
	.word	1
	.space	36
	.type	armlex4210_devices, %object
	.size	armlex4210_devices, 32
armlex4210_devices:
	.word	s3c_device_hsmmc0
	.word	s3c_device_hsmmc2
	.word	s3c_device_hsmmc3
	.word	s3c_device_rtc
	.word	s3c_device_wdt
	.word	samsung_asoc_dma
	.word	armlex4210_smsc911x
	.word	exynos4_device_ahci
	.type	armlex4210_uartcfgs, %object
	.size	armlex4210_uartcfgs, 160
armlex4210_uartcfgs:
	.byte	0
	.space	1
	.short	0
	.space	8
	.word	965
	.word	3
	.word	273
	.space	16
	.byte	1
	.space	1
	.short	0
	.space	8
	.word	965
	.word	3
	.word	273
	.space	16
	.byte	2
	.space	1
	.short	0
	.space	8
	.word	965
	.word	3
	.word	273
	.space	16
	.byte	3
	.space	1
	.short	0
	.space	8
	.word	965
	.word	3
	.word	273
	.space	16
	.space	4
	.type	armlex4210_smsc911x, %object
	.size	armlex4210_smsc911x, 360
armlex4210_smsc911x:
	.word	.LC1
	.word	-1
	.space	84
	.word	smsc9215_config
	.space	248
	.word	2
	.word	armlex4210_smsc911x_resources
	.space	8
	.type	smsc9215_config, %object
	.size	smsc9215_config, 28
smsc9215_config:
	.word	1
	.word	1
	.word	5
	.space	4
	.word	1
	.byte	0
	.byte	-128
	.byte	0
	.byte	35
	.byte	69
	.byte	103
	.space	2
	.type	armlex4210_smsc911x_resources, %object
	.size	armlex4210_smsc911x_resources, 56
armlex4210_smsc911x_resources:
	.word	117440512
	.word	117506047
	.space	4
	.word	512
	.space	12
	.word	379
	.word	379
	.space	4
	.word	1028
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"ARMLEX4210\000"
	.space	1
.LC1:
	.ascii	"smsc911x\000"
	.section	.arch.info.init,"a",%progbits
	.align	2
	.type	__mach_desc_ARMLEX4210, %object
	.size	__mach_desc_ARMLEX4210, 68
__mach_desc_ARMLEX4210:
	.word	3361
	.word	.LC0
	.word	1073742080
	.space	28
	.word	armlex4210_map_io
	.space	4
	.word	exynos4_init_irq
	.word	exynos4_timer
	.word	armlex4210_machine_init
	.word	gic_handle_irq
	.space	4
	.ident	"GCC: (GNU) 4.8"
