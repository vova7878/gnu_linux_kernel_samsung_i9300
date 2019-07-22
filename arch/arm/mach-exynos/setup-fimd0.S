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
	.file	"setup-fimd0.c"
	.text
	.align	2
	.global	exynos4_fimd0_setup_clock
	.type	exynos4_fimd0_setup_clock, %function
exynos4_fimd0_setup_clock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r7, r1
	movw	r5, #:lower16:clk_get
	movw	r1, #:lower16:.LC0
	movt	r5, #:upper16:clk_get
	movt	r1, #:upper16:.LC0
	mov	r6, r2
	blx	r5
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L9
	mov	r1, r7
	mov	r0, #0
	blx	r5
	cmn	r0, #4096
	mov	r7, r0
	bhi	.L12
	movw	r3, #:lower16:clk_set_parent
	mov	r0, r4
	movt	r3, #:upper16:clk_set_parent
	mov	r1, r7
	blx	r3
	cmp	r0, #0
	bne	.L13
	movw	r2, #44416
	cmp	r6, #0
	movt	r2, 2044
	movw	r3, #:lower16:clk_set_rate
	moveq	r6, r2
	movt	r3, #:upper16:clk_set_rate
	mov	r0, r4
	mov	r1, r6
	blx	r3
	subs	r8, r0, #0
	movweq	r5, #:lower16:clk_put
	bne	.L14
.L10:
	mov	r0, r4
	movt	r5, #:upper16:clk_put
	blx	r5
	mov	r0, r7
	blx	r5
.L3:
	mov	r0, r8
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L13:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, [r7, #16]
	ldr	r2, [r4, #16]
	movt	r0, #:upper16:.LC1
	movw	r5, #:lower16:clk_put
	blx	r3
	movt	r5, #:upper16:clk_put
	mov	r0, r4
	blx	r5
	mov	r0, r7
	blx	r5
.L9:
	mov	r8, r4
	b	.L3
.L14:
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	mov	r2, r6
	movt	r3, #:upper16:printk
	ldr	r1, [r4, #16]
	movt	r0, #:upper16:.LC2
	movw	r5, #:lower16:clk_put
	mov	r8, r4
	blx	r3
	b	.L10
.L12:
	movw	r3, #:lower16:clk_put
	mov	r0, r4
	movt	r3, #:upper16:clk_put
	mov	r8, r7
	blx	r3
	b	.L3
	.fnend
	.size	exynos4_fimd0_setup_clock, .-exynos4_fimd0_setup_clock
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"sclk_fimd\000"
	.space	2
.LC1:
	.ascii	"<3>Unable to set parent %s of clock %s.\012\000"
	.space	3
.LC2:
	.ascii	"<3>%s rate change failed: %lu\012\000"
	.ident	"GCC: (GNU) 4.8"
