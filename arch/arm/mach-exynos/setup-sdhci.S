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
	.file	"setup-sdhci.c"
	.text
	.align	2
	.global	exynos4_setup_sdhci_cfg_card
	.type	exynos4_setup_sdhci_cfg_card, %function
exynos4_setup_sdhci_cfg_card:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r1
	ldr	r3, [r5, #128]
	ldr	r1, [r0, #92]
@ 42 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-sdhci.c" 1
	dsb
@ 0 "" 2
	ldr	r1, [r1, #32]
	and	r3, r3, #48
	orr	r3, r3, #-1073741824
	orr	r6, r3, #16640
	cmp	r1, #1073741824
	beq	.L12
.L2:
@ 85 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-sdhci.c" 1
	dsb
@ 0 "" 2
	movw	r4, #:lower16:outer_cache
	movt	r4, #:upper16:outer_cache
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L3
	blx	r3
.L3:
	str	r6, [r5, #128]
@ 86 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-sdhci.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L4
	blx	r3
.L4:
	movw	r3, #32896
	bfi	r3, r3, #16, #16
	str	r3, [r5, #132]
	ldmfd	sp!, {r4, r5, r6, pc}
.L12:
	ldr	r1, [r2]
	movw	r2, #30783
	movt	r2, 381
	cmp	r1, r2
	orrhi	r6, r3, #49408
	b	.L2
	.fnend
	.size	exynos4_setup_sdhci_cfg_card, .-exynos4_setup_sdhci_cfg_card
	.global	exynos4_hsmmc_clksrcs
	.data
	.align	2
	.type	exynos4_hsmmc_clksrcs, %object
	.size	exynos4_hsmmc_clksrcs, 16
exynos4_hsmmc_clksrcs:
	.word	0
	.word	0
	.word	.LC0
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"sclk_mmc\000"
	.ident	"GCC: (GNU) 4.8"
