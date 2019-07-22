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
	.file	"setup-fimc.c"
	.text
	.align	2
	.global	exynos4_fimc_setup_gpio
	.type	exynos4_fimc_setup_gpio, %function
exynos4_fimc_setup_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	r3, r0, #0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	beq	.L3
	cmp	r3, #1
	bne	.L9
	mvn	r5, #12
	mov	r6, #240
	mov	r0, #234
.L4:
	movw	r4, #:lower16:s3c_gpio_cfgall_range
	mov	r1, #8
	movt	r4, #:upper16:s3c_gpio_cfgall_range
	mov	r2, r5
	mov	r3, #3
	blx	r4
	cmp	r0, #0
	ldmnefd	sp!, {r4, r5, r6, pc}
	mov	r0, r6
	mov	r2, r5
	mov	r1, #5
	mov	r3, #3
	blx	r4
	ldmfd	sp!, {r4, r5, r6, pc}
.L9:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:.LC1
	movw	ip, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:.LC1
	movt	ip, #:upper16:warn_slowpath_fmt
	mov	r1, #35
	blx	ip
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, pc}
.L3:
	mvn	r5, #13
	movw	r6, #283
	movw	r0, #274
	b	.L4
	.fnend
	.size	exynos4_fimc_setup_gpio, .-exynos4_fimc_setup_gpio
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"/media/system1/root/CM14/kernel/samsung/smdk4412/ar"
	.ascii	"ch/arm/mach-exynos/setup-fimc.c\000"
	.space	1
.LC1:
	.ascii	"Wrong camport id: %d\012\000"
	.ident	"GCC: (GNU) 4.8"
