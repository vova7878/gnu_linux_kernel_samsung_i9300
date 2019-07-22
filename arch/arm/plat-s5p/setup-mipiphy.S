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
	.file	"setup-mipiphy.c"
	.text
	.align	2
	.type	__s5p_mipi_phy_control, %function
__s5p_mipi_phy_control:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r1
	mov	r6, r2
	beq	.L8
	ldr	r4, [r0, #4]
	cmn	r4, #1
	beq	.L7
	cmp	r4, #1
	bhi	.L8
	add	r4, r4, #452
	mov	r4, r4, asl #2
	sub	r4, r4, #31981568
.L3:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	blx	r3
	cmp	r5, #0
	mov	r1, r0
	ldr	ip, [r4]
	bne	.L10
	mvn	r6, r6
	and	ip, ip, r6
	and	r6, r6, #6
	tst	r6, ip
	str	ip, [r4]
	biceq	ip, ip, #1
.L5:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	str	ip, [r4]
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L10:
	orr	ip, ip, r6
	str	ip, [r4]
	orr	ip, ip, #1
	b	.L5
.L7:
	mov	r4, #1808
	movt	r4, 65048
	b	.L3
.L8:
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	__s5p_mipi_phy_control, .-__s5p_mipi_phy_control
	.align	2
	.global	s5p_csis_phy_enable
	.type	s5p_csis_phy_enable, %function
s5p_csis_phy_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #2
	b	__s5p_mipi_phy_control
	.fnend
	.size	s5p_csis_phy_enable, .-s5p_csis_phy_enable
	.align	2
	.global	s5p_dsim_phy_enable
	.type	s5p_dsim_phy_enable, %function
s5p_dsim_phy_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #4
	b	__s5p_mipi_phy_control
	.fnend
	.size	s5p_dsim_phy_enable, .-s5p_dsim_phy_enable
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	lock.13024, %object
	.size	lock.13024, 8
lock.13024:
	.space	8
	.ident	"GCC: (GNU) 4.8"
