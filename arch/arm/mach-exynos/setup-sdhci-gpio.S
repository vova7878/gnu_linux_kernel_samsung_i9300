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
	.file	"setup-sdhci-gpio.c"
	.text
	.align	2
	.global	exynos4_setup_sdhci0_cfg_gpio
	.type	exynos4_setup_sdhci0_cfg_gpio, %function
exynos4_setup_sdhci0_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r7, #:lower16:s3c_gpio_cfgpin
	mov	r4, r1
	ldr	r8, [r0, #92]
	movt	r7, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #13
	mov	r0, #81
	movw	r6, #:lower16:s3c_gpio_setpull
	blx	r7
	movt	r6, #:upper16:s3c_gpio_setpull
	mov	r1, #0
	movw	r5, #:lower16:s5p_gpio_set_drvstr
	mov	r0, #81
	blx	r6
	movt	r5, #:upper16:s5p_gpio_set_drvstr
	mov	r1, #3
	mov	r0, #81
	blx	r5
	mvn	r1, #13
	mov	r0, #82
	blx	r7
	mov	r1, #0
	mov	r0, #82
	blx	r6
	mov	r0, #82
	mov	r1, #3
	blx	r5
	cmp	r4, #4
	beq	.L3
	cmp	r4, #8
	bne	.L18
	mov	r4, #92
.L6:
	mov	r0, r4
	mvn	r1, #12
	blx	r7
	mov	r0, r4
	mov	r1, #3
	blx	r6
	mov	r0, r4
	mov	r1, #3
	add	r4, r4, #1
	blx	r5
	cmp	r4, #96
	bne	.L6
.L3:
	mov	r4, #84
.L5:
	mov	r0, r4
	mvn	r1, #13
	blx	r7
	mov	r0, r4
	mov	r1, #3
	blx	r6
	mov	r0, r4
	mov	r1, #3
	add	r4, r4, #1
	blx	r5
	cmp	r4, #88
	bne	.L5
.L2:
	ldr	r3, [r8, #8]
	cmp	r3, #0
	ldmnefd	sp!, {r4, r5, r6, r7, r8, pc}
	mvn	r1, #13
	mov	r0, #83
	blx	r7
	mov	r1, #3
	mov	r0, #83
	blx	r6
	mov	r0, r4
	mov	r1, #3
	blx	r5
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L18:
	mov	r4, #83
	b	.L2
	.fnend
	.size	exynos4_setup_sdhci0_cfg_gpio, .-exynos4_setup_sdhci0_cfg_gpio
	.align	2
	.global	exynos4_setup_sdhci1_cfg_gpio
	.type	exynos4_setup_sdhci1_cfg_gpio, %function
exynos4_setup_sdhci1_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r10, #:lower16:s3c_gpio_cfgpin
	ldr	fp, [r0, #92]
	movt	r10, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #13
	mov	r0, #89
	movw	r9, #:lower16:s3c_gpio_setpull
	movw	r8, #:lower16:s5p_gpio_set_drvstr
	blx	r10
	movt	r9, #:upper16:s3c_gpio_setpull
	mov	r1, #0
	mov	r0, #89
	movt	r8, #:upper16:s5p_gpio_set_drvstr
	blx	r9
	mov	r1, #3
	mov	r0, #89
	blx	r8
	mvn	r1, #13
	mov	r0, #90
	blx	r10
	mov	r1, #0
	mov	r0, #90
	blx	r9
	mov	r0, #90
	mov	r1, #3
	mov	r4, #92
	blx	r8
.L21:
	mov	r0, r4
	mvn	r1, #13
	blx	r10
	mov	r0, r4
	mov	r1, #3
	blx	r9
	mov	r0, r4
	mov	r1, #3
	add	r4, r4, #1
	movw	r7, #:lower16:s3c_gpio_cfgpin
	blx	r8
	cmp	r4, #96
	movw	r6, #:lower16:s3c_gpio_setpull
	movw	r5, #:lower16:s5p_gpio_set_drvstr
	movt	r7, #:upper16:s3c_gpio_cfgpin
	movt	r6, #:upper16:s3c_gpio_setpull
	movt	r5, #:upper16:s5p_gpio_set_drvstr
	bne	.L21
	ldr	r3, [fp, #8]
	cmp	r3, #0
	ldmnefd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
	mvn	r1, #13
	mov	r0, #91
	blx	r7
	mov	r1, #3
	mov	r0, #91
	blx	r6
	mov	r0, r4
	mov	r1, #3
	blx	r5
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.fnend
	.size	exynos4_setup_sdhci1_cfg_gpio, .-exynos4_setup_sdhci1_cfg_gpio
	.align	2
	.global	exynos4_setup_sdhci2_cfg_gpio
	.type	exynos4_setup_sdhci2_cfg_gpio, %function
exynos4_setup_sdhci2_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r7, #:lower16:s3c_gpio_cfgpin
	mov	r4, r1
	ldr	r8, [r0, #92]
	movt	r7, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #13
	mov	r0, #97
	movw	r6, #:lower16:s3c_gpio_setpull
	blx	r7
	movt	r6, #:upper16:s3c_gpio_setpull
	mov	r1, #0
	movw	r5, #:lower16:s5p_gpio_set_drvstr
	mov	r0, #97
	blx	r6
	movt	r5, #:upper16:s5p_gpio_set_drvstr
	mov	r1, #3
	mov	r0, #97
	blx	r5
	mvn	r1, #13
	mov	r0, #98
	blx	r7
	mov	r1, #0
	mov	r0, #98
	blx	r6
	mov	r0, #98
	mov	r1, #3
	blx	r5
	cmp	r4, #4
	beq	.L25
	cmp	r4, #8
	bne	.L39
	mov	r4, #108
.L28:
	mov	r0, r4
	mvn	r1, #12
	blx	r7
	mov	r0, r4
	mov	r1, #0
	blx	r6
	mov	r0, r4
	mov	r1, #3
	add	r4, r4, #1
	blx	r5
	cmp	r4, #112
	bne	.L28
.L25:
	mov	r4, #100
.L27:
	mov	r0, r4
	mvn	r1, #13
	blx	r7
	mov	r0, r4
	mov	r1, #0
	blx	r6
	mov	r0, r4
	mov	r1, #3
	add	r4, r4, #1
	blx	r5
	cmp	r4, #104
	bne	.L27
.L24:
	ldr	r8, [r8, #8]
	cmp	r8, #0
	ldmnefd	sp!, {r4, r5, r6, r7, r8, pc}
	mvn	r1, #13
	mov	r0, #99
	blx	r7
	mov	r1, r8
	mov	r0, #99
	blx	r6
	mov	r0, r4
	mov	r1, #2
	blx	r5
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L39:
	mov	r4, #99
	b	.L24
	.fnend
	.size	exynos4_setup_sdhci2_cfg_gpio, .-exynos4_setup_sdhci2_cfg_gpio
	.align	2
	.global	exynos4_setup_sdhci3_cfg_gpio
	.type	exynos4_setup_sdhci3_cfg_gpio, %function
exynos4_setup_sdhci3_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r10, #:lower16:s3c_gpio_cfgpin
	ldr	fp, [r0, #92]
	movt	r10, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #13
	mov	r0, #105
	movw	r9, #:lower16:s3c_gpio_setpull
	movw	r8, #:lower16:s5p_gpio_set_drvstr
	blx	r10
	movt	r9, #:upper16:s3c_gpio_setpull
	mov	r1, #0
	mov	r0, #105
	movt	r8, #:upper16:s5p_gpio_set_drvstr
	blx	r9
	mov	r1, #2
	mov	r0, #105
	blx	r8
	mvn	r1, #13
	mov	r0, #106
	blx	r10
	mov	r1, #0
	mov	r0, #106
	blx	r9
	mov	r0, #106
	mov	r1, #2
	mov	r4, #108
	blx	r8
.L42:
	mov	r0, r4
	mvn	r1, #13
	blx	r10
	mov	r0, r4
	mov	r1, #0
	blx	r9
	mov	r0, r4
	mov	r1, #2
	add	r4, r4, #1
	movw	r7, #:lower16:s3c_gpio_cfgpin
	blx	r8
	cmp	r4, #112
	movw	r6, #:lower16:s3c_gpio_setpull
	movw	r5, #:lower16:s5p_gpio_set_drvstr
	movt	r7, #:upper16:s3c_gpio_cfgpin
	movt	r6, #:upper16:s3c_gpio_setpull
	movt	r5, #:upper16:s5p_gpio_set_drvstr
	bne	.L42
	ldr	r8, [fp, #8]
	cmp	r8, #0
	ldmnefd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
	mvn	r1, #13
	mov	r0, #107
	blx	r7
	mov	r1, r8
	mov	r0, #107
	blx	r6
	mov	r0, r4
	mov	r1, #2
	blx	r5
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.fnend
	.size	exynos4_setup_sdhci3_cfg_gpio, .-exynos4_setup_sdhci3_cfg_gpio
	.ident	"GCC: (GNU) 4.8"
