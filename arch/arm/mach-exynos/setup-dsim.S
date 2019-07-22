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
	.file	"setup-dsim.c"
	.text
	.align	2
	.type	s5p_dsim_enable_d_phy, %function
s5p_dsim_enable_d_phy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r3, 65048
	ldr	r4, [r3, #1808]
@ 31 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-dsim.c" 1
	dsb
@ 0 "" 2
	cmp	r0, #0
	orrne	r4, r4, #1
	bne	.L3
	tst	r4, #2
	biceq	r4, r4, #1
.L3:
@ 36 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-dsim.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L4
	blx	r3
.L4:
	mov	r3, #0
	movt	r3, 65048
	str	r4, [r3, #1808]
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	s5p_dsim_enable_d_phy, .-s5p_dsim_enable_d_phy
	.align	2
	.global	s5p_dsim_enable_clk
	.type	s5p_dsim_enable_clk, %function
s5p_dsim_enable_clk:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	beq	.L10
	movw	r3, #:lower16:clk_enable
	movt	r3, #:upper16:clk_enable
	blx	r3
	cmp	r0, #0
	ldmgefd	sp!, {r3, pc}
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r3, pc}
.L10:
	movw	r3, #:lower16:clk_disable
	movt	r3, #:upper16:clk_disable
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_dsim_enable_clk, .-s5p_dsim_enable_clk
	.align	2
	.global	s5p_dsim_part_reset
	.type	s5p_dsim_part_reset, %function
s5p_dsim_part_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
@ 63 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-dsim.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L13
	blx	r3
.L13:
	mov	r3, #0
	mov	r2, #4
	movt	r3, 65048
	str	r2, [r3, #1808]
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
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	mov	r0, #1
	bl	s5p_dsim_enable_d_phy
	mov	r3, #0
	movt	r3, 65048
	ldr	r4, [r3, #1808]
@ 43 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-dsim.c" 1
	dsb
@ 0 "" 2
	orr	r4, r4, #4
@ 45 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-dsim.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L18
	blx	r3
.L18:
	mov	r3, #0
	movt	r3, 65048
	str	r4, [r3, #1808]
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	s5p_dsim_init_d_phy, .-s5p_dsim_init_d_phy
	.align	2
	.global	s5p_dsim_exit_d_phy
	.type	s5p_dsim_exit_d_phy, %function
s5p_dsim_exit_d_phy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r3, 65048
	ldr	r4, [r3, #1808]
@ 43 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-dsim.c" 1
	dsb
@ 0 "" 2
	bic	r4, r4, #4
@ 45 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-dsim.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L23
	blx	r3
.L23:
	mov	r3, #0
	mov	r0, r3
	movt	r3, 65048
	str	r4, [r3, #1808]
	ldmfd	sp!, {r4, lr}
	b	s5p_dsim_enable_d_phy
	.fnend
	.size	s5p_dsim_exit_d_phy, .-s5p_dsim_exit_d_phy
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"failed to clk_enable of dsim\012\000"
	.ident	"GCC: (GNU) 4.8"
