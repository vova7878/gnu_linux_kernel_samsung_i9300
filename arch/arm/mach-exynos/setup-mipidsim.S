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
	.file	"setup-mipidsim.c"
	.text
	.align	2
	.global	s5p_dsim_part_reset
	.type	s5p_dsim_part_reset, %function
s5p_dsim_part_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	ldrb	r3, [r0, #53]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2
@ 78 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-mipidsim.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L3
	blx	r3
.L3:
	mov	r3, #0
	mov	r2, #4
	movt	r3, 65048
	str	r2, [r3, #1808]
.L2:
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_dsim_part_reset, .-s5p_dsim_part_reset
	.align	2
	.global	s5p_dsim_init_d_phy
	.type	s5p_dsim_init_d_phy, %function
s5p_dsim_init_d_phy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, 65048
	mov	r5, r1
	ldr	r6, [r3, #1808]
@ 48 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-mipidsim.c" 1
	dsb
@ 0 "" 2
	bic	r6, r6, #1
	orr	r6, r1, r6
@ 50 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-mipidsim.c" 1
	dsb
@ 0 "" 2
	movw	r4, #:lower16:outer_cache
	movt	r4, #:upper16:outer_cache
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L9
	blx	r3
.L9:
	mov	r3, #0
	movt	r3, 65048
	str	r6, [r3, #1808]
	ldr	r3, [r3, #1808]
@ 64 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-mipidsim.c" 1
	dsb
@ 0 "" 2
	bic	r3, r3, #4
	orr	r5, r3, r5, asl #2
@ 66 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-mipidsim.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L10
	blx	r3
.L10:
	mov	r3, #0
	mov	r0, r3
	movt	r3, 65048
	str	r5, [r3, #1808]
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	s5p_dsim_init_d_phy, .-s5p_dsim_init_d_phy
	.ident	"GCC: (GNU) 4.8"
