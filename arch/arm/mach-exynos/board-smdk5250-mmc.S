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
	.file	"board-smdk5250-mmc.c"

	.text
	.align	2
	.global	exynos5_smdk5250_mmc_init
	.type	exynos5_smdk5250_mmc_init, %function
exynos5_smdk5250_mmc_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	movw	r3, #:lower16:s3c_sdhci2_set_platdata
	mov	r0, r4
	movt	r3, #:upper16:s3c_sdhci2_set_platdata
	blx	r3
	movw	r3, #:lower16:s3c_sdhci3_set_platdata
	add	r0, r4, #52
	movt	r3, #:upper16:s3c_sdhci3_set_platdata
	blx	r3
	movw	r3, #:lower16:platform_add_devices
	add	r0, r4, #104
	movt	r3, #:upper16:platform_add_devices
	mov	r1, #2
	blx	r3
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	exynos5_smdk5250_mmc_init, .-exynos5_smdk5250_mmc_init
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	smdk5250_hsmmc2_pdata, %object
	.size	smdk5250_hsmmc2_pdata, 52
smdk5250_hsmmc2_pdata:
	.space	8
	.word	0
	.word	1
	.space	36
	.type	smdk5250_hsmmc3_pdata, %object
	.size	smdk5250_hsmmc3_pdata, 52
smdk5250_hsmmc3_pdata:
	.space	8
	.word	0
	.word	1
	.space	36
	.type	smdk5250_mmc_devices, %object
	.size	smdk5250_mmc_devices, 8
smdk5250_mmc_devices:
	.word	s3c_device_hsmmc2
	.word	s3c_device_hsmmc3
	.ident	"GCC: (GNU) 4.8"
