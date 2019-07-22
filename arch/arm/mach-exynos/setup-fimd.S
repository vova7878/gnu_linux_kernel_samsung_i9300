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
	.file	"setup-fimd.c"
	.text
	.align	2
	.global	exynos4_fimd_cfg_gpios
	.type	exynos4_fimd_cfg_gpios, %function
exynos4_fimd_cfg_gpios:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:s3c_gpio_cfgall_range
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movt	ip, #:upper16:s3c_gpio_cfgall_range
	mov	r4, r1
	mov	r7, r3
	mov	r3, #0
	mov	r5, r0
	blx	ip
	cmp	r4, #0
	ldmeqfd	sp!, {r3, r4, r5, r6, r7, pc}
	movw	r6, #:lower16:s5p_gpio_set_drvstr
	movt	r6, #:upper16:s5p_gpio_set_drvstr
.L4:
	mov	r0, r5
	mov	r1, r7
	blx	r6
	subs	r4, r4, #1
	add	r5, r5, #1
	bne	.L4
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	exynos4_fimd_cfg_gpios, .-exynos4_fimd_cfg_gpios
	.align	2
	.global	exynos4_fimd_setup_clock
	.type	exynos4_fimd_setup_clock, %function
exynos4_fimd_setup_clock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r5, #:lower16:clk_get
	movt	r5, #:upper16:clk_get
	mov	r7, r2
	mov	r6, r3
	blx	r5
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L17
	mov	r1, r7
	mov	r0, #0
	blx	r5
	cmn	r0, #4096
	mov	r7, r0
	bhi	.L19
	movw	r3, #:lower16:clk_set_parent
	mov	r0, r4
	movt	r3, #:upper16:clk_set_parent
	mov	r1, r7
	blx	r3
	cmp	r0, #0
	bne	.L20
	movw	r2, #33728
	cmp	r6, #0
	movt	r2, 1327
	movw	r3, #:lower16:clk_set_rate
	moveq	r6, r2
	movt	r3, #:upper16:clk_set_rate
	mov	r0, r4
	mov	r1, r6
	blx	r3
	subs	r8, r0, #0
	movweq	r5, #:lower16:clk_put
	bne	.L21
.L18:
	mov	r0, r4
	movt	r5, #:upper16:clk_put
	blx	r5
	mov	r0, r7
	blx	r5
.L11:
	mov	r0, r8
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L20:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, [r7, #16]
	ldr	r2, [r4, #16]
	movt	r0, #:upper16:.LC0
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	mov	r0, r4
	blx	r5
	mov	r0, r7
	blx	r5
.L17:
	mov	r8, r4
	b	.L11
.L21:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	mov	r2, r6
	movt	r3, #:upper16:printk
	ldr	r1, [r4, #16]
	movt	r0, #:upper16:.LC1
	movw	r5, #:lower16:clk_put
	mov	r8, r4
	blx	r3
	b	.L18
.L19:
	movw	r3, #:lower16:clk_put
	mov	r0, r4
	movt	r3, #:upper16:clk_put
	mov	r8, r7
	blx	r3
	b	.L11
	.fnend
	.size	exynos4_fimd_setup_clock, .-exynos4_fimd_setup_clock
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>Unable to set parent %s of clock %s.\012\000"
	.space	3
.LC1:
	.ascii	"<3>%s rate change failed: %lu\012\000"
	.ident	"GCC: (GNU) 4.8"
