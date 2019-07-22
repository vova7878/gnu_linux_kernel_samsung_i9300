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
	.file	"setup-csis.c"
	.text
	.align	2
	.global	s3c_csis0_cfg_gpio
	.type	s3c_csis0_cfg_gpio, %function
s3c_csis0_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	s3c_csis0_cfg_gpio, .-s3c_csis0_cfg_gpio
	.align	2
	.global	s3c_csis1_cfg_gpio
	.type	s3c_csis1_cfg_gpio, %function
s3c_csis1_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	s3c_csis1_cfg_gpio, .-s3c_csis1_cfg_gpio
	.align	2
	.global	s3c_csis0_cfg_phy_global
	.type	s3c_csis0_cfg_phy_global, %function
s3c_csis0_cfg_phy_global:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	mov	r3, #0
	movt	r3, 65048
	bne	.L9
	ldr	r3, [r3, #1808]
	tst	r3, #4
	bicne	r2, r3, #2
	biceq	r2, r3, #3
	mov	r3, #0
	movt	r3, 65048
	str	r2, [r3, #1808]
	bx	lr
.L9:
	ldr	r2, [r3, #1808]
	orr	r2, r2, #2
	str	r2, [r3, #1808]
	ldr	r2, [r3, #1808]
	orr	r2, r2, #1
	str	r2, [r3, #1808]
	bx	lr
	.fnend
	.size	s3c_csis0_cfg_phy_global, .-s3c_csis0_cfg_phy_global
	.align	2
	.global	s3c_csis1_cfg_phy_global
	.type	s3c_csis1_cfg_phy_global, %function
s3c_csis1_cfg_phy_global:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	mov	r3, #0
	movt	r3, 65048
	bne	.L15
	ldr	r3, [r3, #1812]
	tst	r3, #4
	bicne	r2, r3, #2
	biceq	r2, r3, #3
	mov	r3, #0
	movt	r3, 65048
	str	r2, [r3, #1812]
	bx	lr
.L15:
	ldr	r2, [r3, #1812]
	orr	r2, r2, #2
	str	r2, [r3, #1812]
	ldr	r2, [r3, #1812]
	orr	r2, r2, #1
	str	r2, [r3, #1812]
	bx	lr
	.fnend
	.size	s3c_csis1_cfg_phy_global, .-s3c_csis1_cfg_phy_global
	.align	2
	.global	s3c_csis_clk_on
	.type	s3c_csis_clk_on, %function
s3c_csis_clk_on:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r4, #:lower16:clk_get
	ldr	r7, [r0, #92]
	add	r6, r0, #8
	mov	r9, r1
	mov	r0, r6
	movt	r4, #:upper16:clk_get
	ldr	r1, [r7]
	blx	r4
	cmn	r0, #4096
	mov	r8, r0
	bhi	.L25
	mov	r0, r6
	ldr	r1, [r7, #4]
	blx	r4
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L26
	movw	r3, #:lower16:clk_set_parent
	mov	r1, r8
	movt	r3, #:upper16:clk_set_parent
	blx	r3
	cmp	r0, #0
	bne	.L27
	movw	r3, #:lower16:clk_set_rate
	mov	r0, r5
	movt	r3, #:upper16:clk_set_rate
	ldr	r1, [r7, #8]
	blx	r3
	subs	r10, r0, #0
	bne	.L28
	movw	r1, #:lower16:.LC4
	mov	r0, r6
	movt	r1, #:upper16:.LC4
	blx	r4
	cmn	r0, #4096
	str	r0, [r9]
	bhi	.L29
	movw	r4, #:lower16:clk_enable
	movt	r4, #:upper16:clk_enable
	blx	r4
	mov	r0, r5
	blx	r4
.L18:
	mov	r0, r10
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L27:
	movw	r1, #:lower16:.LC2
	movw	ip, #:lower16:dev_err
	mov	r0, r6
	movt	r1, #:upper16:.LC2
	movt	ip, #:upper16:dev_err
	ldr	r2, [r8, #16]
	ldr	r3, [r5, #16]
	blx	ip
.L22:
	movw	r4, #:lower16:clk_put
	mov	r0, r5
	movt	r4, #:upper16:clk_put
	blx	r4
.L20:
	mov	r0, r8
	mvn	r10, #21
	blx	r4
	b	.L18
.L28:
	movw	r1, #:lower16:.LC3
	movw	ip, #:lower16:dev_err
	mov	r0, r6
	ldr	r3, [r7, #8]
	movt	r1, #:upper16:.LC3
	movt	ip, #:upper16:dev_err
	ldr	r2, [r5, #16]
	blx	ip
	b	.L22
.L29:
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:dev_err
	mov	r0, r6
	movt	r1, #:upper16:.LC5
	movt	r3, #:upper16:dev_err
	blx	r3
	b	.L22
.L26:
	movw	r1, #:lower16:.LC1
	movw	r3, #:lower16:dev_err
	mov	r0, r6
	movt	r1, #:upper16:.LC1
	movt	r3, #:upper16:dev_err
	movw	r4, #:lower16:clk_put
	blx	r3
	movt	r4, #:upper16:clk_put
	b	.L20
.L25:
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:dev_err
	mov	r0, r6
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:dev_err
	mvn	r10, #21
	blx	r3
	b	.L18
	.fnend
	.size	s3c_csis_clk_on, .-s3c_csis_clk_on
	.align	2
	.global	s3c_csis_clk_off
	.type	s3c_csis_clk_off, %function
s3c_csis_clk_off:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:clk_disable
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	ldr	r0, [r1]
	movt	r3, #:upper16:clk_disable
	mov	r4, r1
	blx	r3
	movw	r3, #:lower16:clk_put
	ldr	r0, [r4]
	movt	r3, #:upper16:clk_put
	blx	r3
	mov	r0, #0
	str	r0, [r4]
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	s3c_csis_clk_off, .-s3c_csis_clk_off
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"failed to get mout_mpll\012\000"
	.space	3
.LC1:
	.ascii	"failed to get sclk_csis\012\000"
	.space	3
.LC2:
	.ascii	"Unable to set parent %s of clock %s.\012\000"
	.space	2
.LC3:
	.ascii	"%s rate change failed: %lu\012\000"
.LC4:
	.ascii	"csis\000"
	.space	3
.LC5:
	.ascii	"failed to get csis clock\012\000"
	.ident	"GCC: (GNU) 4.8"
