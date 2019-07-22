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
	.file	"setup-fimc0.c"
	.text
	.align	2
	.global	s3c_fimc0_cfg_gpio
	.type	s3c_fimc0_cfg_gpio, %function
s3c_fimc0_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	s3c_fimc0_cfg_gpio, .-s3c_fimc0_cfg_gpio
	.align	2
	.global	s3c_fimc_clk_on
	.type	s3c_fimc_clk_on, %function
s3c_fimc_clk_on:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r7, r1
	add	r5, r0, #8
	movw	r1, #:lower16:.LC0
	movw	r4, #:lower16:clk_get
	mov	r0, r5
	movt	r1, #:upper16:.LC0
	movt	r4, #:upper16:clk_get
	blx	r4
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L7
	movw	r1, #:lower16:.LC2
	mov	r0, r5
	movt	r1, #:upper16:.LC2
	blx	r4
	cmn	r7, #4096
	str	r0, [r7]
	bhi	.L8
	movw	r4, #:lower16:clk_enable
	movt	r4, #:upper16:clk_enable
	blx	r4
	mov	r0, r6
	blx	r4
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L7:
	movw	r1, #:lower16:.LC1
	movw	r3, #:lower16:dev_err
	mov	r0, r5
	movt	r1, #:upper16:.LC1
	movt	r3, #:upper16:dev_err
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L8:
	movw	r1, #:lower16:.LC3
	movw	r3, #:lower16:dev_err
	movt	r1, #:upper16:.LC3
	mov	r0, r5
	movt	r3, #:upper16:dev_err
	blx	r3
	movw	r3, #:lower16:clk_put
	mov	r0, r6
	movt	r3, #:upper16:clk_put
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	s3c_fimc_clk_on, .-s3c_fimc_clk_on
	.align	2
	.global	s3c_fimc_clk_off
	.type	s3c_fimc_clk_off, %function
s3c_fimc_clk_off:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, [r1]
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	mov	r4, r1
	cmp	r0, #0
	beq	.L10
	movw	r3, #:lower16:clk_disable
	movt	r3, #:upper16:clk_disable
	blx	r3
	movw	r3, #:lower16:clk_put
	ldr	r0, [r4]
	movt	r3, #:upper16:clk_put
	blx	r3
	mov	r3, #0
	str	r3, [r4]
.L10:
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	s3c_fimc_clk_off, .-s3c_fimc_clk_off
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"sclk_fimc\000"
	.space	2
.LC1:
	.ascii	"failed to get sclk_fimc_lclk\012\000"
	.space	2
.LC2:
	.ascii	"fimc\000"
	.space	3
.LC3:
	.ascii	"failed to get interface clock\012\000"
	.ident	"GCC: (GNU) 4.8"
