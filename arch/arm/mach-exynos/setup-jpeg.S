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
	.file	"setup-jpeg.c"
	.text
	.align	2
	.global	exynos4_jpeg_setup_clock
	.type	exynos4_jpeg_setup_clock, %function
exynos4_jpeg_setup_clock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r10, r1
	movw	r4, #:lower16:clk_get
	movw	r1, #:lower16:.LC0
	movt	r4, #:upper16:clk_get
	movt	r1, #:upper16:.LC0
	mov	r9, r0
	blx	r4
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L14
	movw	r1, #:lower16:.LC2
	mov	r0, r9
	movt	r1, #:upper16:.LC2
	blx	r4
	cmn	r0, #4096
	mov	r7, r0
	bhi	.L15
	movw	r5, #:lower16:clk_set_parent
	mov	r0, r6
	movt	r5, #:upper16:clk_set_parent
	mov	r1, r7
	blx	r5
	cmp	r0, #0
	blt	.L16
	movw	r1, #:lower16:.LC5
	mov	r0, r9
	movt	r1, #:upper16:.LC5
	blx	r4
	cmn	r0, #4096
	mov	r8, r0
	bhi	.L17
	mov	r0, r7
	mov	r1, r8
	blx	r5
	cmp	r0, #0
	blt	.L18
	movw	r3, #:lower16:clk_set_rate
	mov	r1, r10
	movt	r3, #:upper16:clk_set_rate
	mov	r0, r6
	blx	r3
	cmp	r0, #0
	blt	.L19
	movw	r4, #:lower16:clk_put
	mov	r0, r7
	movt	r4, #:upper16:clk_put
	blx	r4
	mov	r0, r8
	blx	r4
	movw	r3, #:lower16:clk_enable
	mov	r0, r6
	movt	r3, #:upper16:clk_enable
	blx	r3
	cmp	r0, #0
	blt	.L20
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L16:
	movw	r1, #:lower16:.LC4
	movw	r3, #:lower16:dev_err
	mov	r0, r9
	movt	r1, #:upper16:.LC4
.L12:
	movw	r4, #:lower16:clk_put
	mov	r8, #0
	movt	r4, #:upper16:clk_put
	movt	r3, #:upper16:dev_err
	blx	r3
.L5:
	mov	r0, r8
	blx	r4
.L3:
	mov	r0, r6
	blx	r4
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L18:
	movw	r1, #:lower16:.LC4
	movw	r3, #:lower16:dev_err
	mov	r0, r9
	movt	r1, #:upper16:.LC4
	movt	r3, #:upper16:dev_err
	movw	r4, #:lower16:clk_put
	blx	r3
	movt	r4, #:upper16:clk_put
	b	.L5
.L19:
	movw	r1, #:lower16:.LC7
	movw	r3, #:lower16:dev_err
	mov	r0, r9
	movt	r1, #:upper16:.LC7
	movt	r3, #:upper16:dev_err
	movw	r4, #:lower16:clk_put
	blx	r3
	movt	r4, #:upper16:clk_put
	b	.L5
.L20:
	movw	r1, #:lower16:.LC8
	movw	r3, #:lower16:dev_err
	mov	r0, r9
	movt	r1, #:upper16:.LC8
	movt	r3, #:upper16:dev_err
	blx	r3
	b	.L5
.L17:
	movw	r1, #:lower16:.LC6
	movw	r3, #:lower16:dev_err
	mov	r0, r9
	movt	r1, #:upper16:.LC6
	movt	r3, #:upper16:dev_err
	movw	r4, #:lower16:clk_put
	blx	r3
	movt	r4, #:upper16:clk_put
	b	.L5
.L15:
	movw	r1, #:lower16:.LC3
	movw	r3, #:lower16:dev_err
	mov	r0, r9
	movt	r1, #:upper16:.LC3
	b	.L12
.L14:
	movw	r1, #:lower16:.LC1
	movw	r3, #:lower16:dev_err
	mov	r0, r9
	movt	r1, #:upper16:.LC1
	movt	r3, #:upper16:dev_err
	movw	r4, #:lower16:clk_put
	blx	r3
	movt	r4, #:upper16:clk_put
	b	.L3
	.fnend
	.size	exynos4_jpeg_setup_clock, .-exynos4_jpeg_setup_clock
	.align	2
	.global	exynos5_jpeg_setup_clock
	.type	exynos5_jpeg_setup_clock, %function
exynos5_jpeg_setup_clock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r1
	movw	r6, #:lower16:clk_get
	movw	r1, #:lower16:.LC9
	movt	r6, #:upper16:clk_get
	movt	r1, #:upper16:.LC9
	mov	r9, r0
	blx	r6
	cmn	r0, #4096
	mov	r7, r0
	movhi	r6, r0
	bhi	.L23
	movw	r4, #:lower16:samsung_rev
	movt	r4, #:upper16:samsung_rev
	blx	r4
	cmp	r0, #15
	movls	r8, #0
	bhi	.L29
.L24:
	movw	r2, #53632
	cmp	r5, #0
	movt	r2, 2288
	movw	r3, #:lower16:clk_set_rate
	moveq	r5, r2
	movt	r3, #:upper16:clk_set_rate
	mov	r0, r7
	mov	r1, r5
	blx	r3
	subs	r6, r0, #0
	bne	.L30
	movw	r5, #:lower16:clk_put
	mov	r0, r7
	movt	r5, #:upper16:clk_put
	blx	r5
	blx	r4
	cmp	r0, #15
	bls	.L23
	mov	r0, r8
	blx	r5
.L23:
	mov	r0, r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L29:
	movw	r1, #:lower16:.LC5
	mov	r0, r9
	movt	r1, #:upper16:.LC5
	blx	r6
	movw	r3, #:lower16:clk_set_parent
	mov	r8, r0
	mov	r1, r8
	mov	r0, r7
	movt	r3, #:upper16:clk_set_parent
	blx	r3
	cmp	r0, #0
	bge	.L24
	movw	r1, #:lower16:.LC4
	movw	r3, #:lower16:dev_err
	mov	r0, r9
	movt	r1, #:upper16:.LC4
	movt	r3, #:upper16:dev_err
	mvn	r6, #21
	blx	r3
	movw	r3, #:lower16:clk_put
	mov	r0, r8
	movt	r3, #:upper16:clk_put
	blx	r3
	b	.L23
.L30:
	movw	r0, #:lower16:.LC10
	movw	r3, #:lower16:printk
	mov	r2, r5
	movt	r3, #:upper16:printk
	ldr	r1, [r7, #16]
	movt	r0, #:upper16:.LC10
	blx	r3
	movw	r3, #:lower16:clk_put
	mov	r0, r7
	movt	r3, #:upper16:clk_put
	mov	r6, r7
	blx	r3
	b	.L23
	.fnend
	.size	exynos5_jpeg_setup_clock, .-exynos5_jpeg_setup_clock
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"aclk_clk_jpeg\000"
	.space	2
.LC1:
	.ascii	"failed to get aclk for jpeg\012\000"
	.space	3
.LC2:
	.ascii	"mout_jpeg0\000"
	.space	1
.LC3:
	.ascii	"failed to get mout_jpeg0 for jpeg\012\000"
	.space	1
.LC4:
	.ascii	"failed to clk_set_parent for jpeg\012\000"
	.space	1
.LC5:
	.ascii	"mout_mpll_user\000"
	.space	1
.LC6:
	.ascii	"failed to get mout_mpll for jpeg\012\000"
	.space	2
.LC7:
	.ascii	"failed to clk_set_rate of sclk for jpeg\012\000"
	.space	3
.LC8:
	.ascii	"failed to clk_enable of aclk for jpeg\012\000"
	.space	1
.LC9:
	.ascii	"sclk_jpeg\000"
	.space	2
.LC10:
	.ascii	"<3>%s rate change failed: %lu\012\000"
	.ident	"GCC: (GNU) 4.8"
