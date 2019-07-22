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
	.file	"exynos4-smc.c"
	.text
	.align	2
	.global	exynos_smc
	.type	exynos_smc, %function
exynos_smc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ 12 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/exynos4-smc.c" 1
	smc	0

@ 0 "" 2
	bx	lr
	.fnend
	.size	exynos_smc, .-exynos_smc
	.align	2
	.global	exynos_smc_readsfr
	.type	exynos_smc_readsfr, %function
exynos_smc_readsfr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, r0, lsr #2
	mov	r2, #0
	mov	ip, r1
	mov	r3, r2
	orr	r1, r0, #-1073741824
	mvn	r0, #100
@ 30 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/exynos4-smc.c" 1
	smc	0

@ 0 "" 2
	cmn	r0, #101
	beq	.L8
	cmp	r0, #0
	streq	r2, [ip]
	bx	lr
.L8:
	cmp	r1, #0
	bne	.L5
	str	r2, [ip]
	mov	r0, r1
	bx	lr
.L5:
	mov	r0, r1
	bx	lr
	.fnend
	.size	exynos_smc_readsfr, .-exynos_smc_readsfr
	.ident	"GCC: (GNU) 4.8"
