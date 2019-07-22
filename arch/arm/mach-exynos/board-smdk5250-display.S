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
	.file	"board-smdk5250-display.c"
	.text
	.align	2
	.type	exynos_fimd_gpio_setup_24bpp, %function
exynos_fimd_gpio_setup_24bpp:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	movt	r3, 64528
	ldr	r2, [r3, #532]
	orr	r2, r2, #32768
	str	r2, [r3, #532]
	bx	lr
	.fnend
	.size	exynos_fimd_gpio_setup_24bpp, .-exynos_fimd_gpio_setup_24bpp
	.align	2
	.global	exynos5_smdk5250_display_init
	.type	exynos5_smdk5250_display_init, %function
exynos5_smdk5250_display_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L3
	movw	r1, #:lower16:.LC0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r4, #:lower16:s5p_device_fimd1
	movt	r4, #:upper16:s5p_device_fimd1
	movw	r3, #:lower16:dev_set_name
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:dev_set_name
	str	r2, [r4, #8]!
	mov	r0, r4
	blx	r3
	movw	r8, #:lower16:.LC2
	movw	r0, #:lower16:.LC1
	movt	r8, #:upper16:.LC2
	movt	r0, #:upper16:.LC1
	movw	r7, #:lower16:clk_add_alias
	movw	r6, #:lower16:.LC3
	movt	r6, #:upper16:.LC3
	mov	r3, r4
	mov	r1, r8
	movt	r7, #:upper16:clk_add_alias
	mov	r2, r0
	movw	r5, #:lower16:.LANCHOR1
	blx	r7
	mov	r1, r8
	mov	r3, r4
	mov	r2, r6
	mov	r0, r6
	blx	r7
	movw	r0, #:lower16:.LC4
	movw	r1, #:lower16:.LANCHOR0
	movw	r3, #:lower16:printk
	mov	r2, #1
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC4
	movt	r5, #:upper16:.LANCHOR1
	blx	r3
	movw	r3, #:lower16:s5p_fimd1_set_platdata
	mov	r0, r5
	movt	r3, #:upper16:s5p_fimd1_set_platdata
	blx	r3
	movw	r3, #:lower16:samsung_bl_set
	add	r0, r5, #36
	add	r1, r5, #44
	movt	r3, #:upper16:samsung_bl_set
	blx	r3
	movw	r3, #:lower16:platform_add_devices
	add	r0, r5, #84
	movt	r3, #:upper16:platform_add_devices
	mov	r1, #1
	blx	r3
	movw	r2, #:lower16:.LC5
	mov	r3, #2048
	movw	ip, #:lower16:exynos4_fimd_setup_clock
	mov	r0, r4
	mov	r1, r6
	movt	r2, #:upper16:.LC5
	movt	r3, 12207
	movt	ip, #:upper16:exynos4_fimd_setup_clock
	blx	ip
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L4:
	.align	2
.L3:
	.word	exynos5_device_pd+3968
	.fnend
	.size	exynos5_smdk5250_display_init, .-exynos5_smdk5250_display_init
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.23294, %object
	.size	__func__.23294, 15
__func__.23294:
	.ascii	"s5p_fb_setname\000"
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	smdk5250_lcd1_pdata, %object
	.size	smdk5250_lcd1_pdata, 36
smdk5250_lcd1_pdata:
	.word	exynos_fimd_gpio_setup_24bpp
	.space	20
	.word	2
	.word	0
	.space	4
	.type	smdk5250_bl_gpio_info, %object
	.size	smdk5250_bl_gpio_info, 8
smdk5250_bl_gpio_info:
	.word	37
	.word	-14
	.type	smdk5250_bl_data, %object
	.size	smdk5250_bl_data, 40
smdk5250_bl_data:
	.word	0
	.space	12
	.word	30000
	.space	20
	.type	smdk5250_display_devices, %object
	.size	smdk5250_display_devices, 4
smdk5250_display_devices:
	.word	s5p_device_fimd1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s3cfb.1\000"
.LC1:
	.ascii	"lcd\000"
.LC2:
	.ascii	"exynos5-fb.1\000"
	.space	3
.LC3:
	.ascii	"sclk_fimd\000"
	.space	2
.LC4:
	.ascii	"<3>%s: invalid device id(%d)\012\000"
	.space	2
.LC5:
	.ascii	"mout_mpll_user\000"
	.ident	"GCC: (GNU) 4.8"
