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
	.file	"setup-gsc.c"

	.text
	.align	2
	.global	exynos5_gsc_set_pdev_name
	.type	exynos5_gsc_set_pdev_name, %function
exynos5_gsc_set_pdev_name:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L1
.L4:
	.word	.L3
	.word	.L5
	.word	.L6
	.word	.L7
.L7:
	movw	r3, #:lower16:exynos5_device_gsc3
	movt	r3, #:upper16:exynos5_device_gsc3
	str	r1, [r3]
.L1:
	bx	lr
.L6:
	movw	r3, #:lower16:exynos5_device_gsc2
	movt	r3, #:upper16:exynos5_device_gsc2
	str	r1, [r3]
	bx	lr
.L5:
	movw	r3, #:lower16:exynos5_device_gsc1
	movt	r3, #:upper16:exynos5_device_gsc1
	str	r1, [r3]
	bx	lr
.L3:
	movw	r3, #:lower16:exynos5_device_gsc0
	movt	r3, #:upper16:exynos5_device_gsc0
	str	r1, [r3]
	bx	lr
	.fnend
	.size	exynos5_gsc_set_pdev_name, .-exynos5_gsc_set_pdev_name
	.align	2
	.global	exynos5_gsc_set_parent_clock
	.type	exynos5_gsc_set_parent_clock, %function
exynos5_gsc_set_parent_clock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r4, #:lower16:clk_get
	mov	r6, r0
	mov	r8, r1
	movt	r4, #:upper16:clk_get
	mov	r1, r0
	mov	r0, #0
	blx	r4
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L14
	mov	r0, #0
	mov	r1, r8
	blx	r4
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L15
	movw	r3, #:lower16:clk_set_parent
	mov	r0, r5
	movt	r3, #:upper16:clk_set_parent
	mov	r1, r6
	blx	r3
	subs	r7, r0, #0
	bne	.L16
	movw	r4, #:lower16:clk_put
	mov	r0, r5
	movt	r4, #:upper16:clk_put
	blx	r4
	mov	r0, r6
	blx	r4
.L11:
	mov	r0, r7
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L14:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	mov	r1, r6
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	mov	r7, r5
	blx	r3
	b	.L11
.L16:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, [r6, #16]
	ldr	r2, [r5, #16]
	movt	r0, #:upper16:.LC1
	movw	r4, #:lower16:clk_put
	mov	r7, r5
	blx	r3
	movt	r4, #:upper16:clk_put
	mov	r0, r5
	blx	r4
	mov	r0, r6
	blx	r4
	b	.L11
.L15:
	movw	r3, #:lower16:clk_put
	mov	r0, r5
	movt	r3, #:upper16:clk_put
	mov	r7, r6
	blx	r3
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	mov	r1, r8
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	b	.L11
	.fnend
	.size	exynos5_gsc_set_parent_clock, .-exynos5_gsc_set_parent_clock
	.align	2
	.global	exynos5_gsc_set_clock_rate
	.type	exynos5_gsc_set_clock_rate, %function
exynos5_gsc_set_clock_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:clk_get
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:clk_get
	mov	r6, r0
	mov	r4, r1
	mov	r1, r0
	mov	r0, #0
	blx	r3
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L23
	mov	r2, #14720
	cmp	r4, #0
	movt	r2, 4730
	movw	r3, #:lower16:clk_set_rate
	moveq	r4, r2
	movt	r3, #:upper16:clk_set_rate
	mov	r1, r4
	blx	r3
	subs	r6, r0, #0
	bne	.L24
	movw	r3, #:lower16:clk_put
	mov	r0, r5
	movt	r3, #:upper16:clk_put
	blx	r3
.L19:
	mov	r0, r6
	ldmfd	sp!, {r4, r5, r6, pc}
.L23:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	mov	r1, r6
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	mov	r6, r5
	blx	r3
	b	.L19
.L24:
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	mov	r2, r4
	movt	r3, #:upper16:printk
	ldr	r1, [r5, #16]
	movt	r0, #:upper16:.LC2
	blx	r3
	movw	r3, #:lower16:clk_put
	mov	r0, r5
	movt	r3, #:upper16:clk_put
	mov	r6, r5
	blx	r3
	b	.L19
	.fnend
	.size	exynos5_gsc_set_clock_rate, .-exynos5_gsc_set_clock_rate
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>failed to get %s clock.\012\000"
.LC1:
	.ascii	"<3>Unable to set parent %s of clock %s.\012\000"
	.space	3
.LC2:
	.ascii	"<3>%s rate change failed: %lu\012\000"
	.ident	"GCC: (GNU) 4.8"
