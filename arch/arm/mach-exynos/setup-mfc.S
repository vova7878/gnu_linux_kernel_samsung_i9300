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
	.file	"setup-mfc.c"
	.text
	.align	2
	.global	exynos4_mfc_setup_clock
	.type	exynos4_mfc_setup_clock, %function
exynos4_mfc_setup_clock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	mov	r0, #0
	movt	r3, #:upper16:.LANCHOR0
	str	r1, [r3]
	bx	lr
	.fnend
	.size	exynos4_mfc_setup_clock, .-exynos4_mfc_setup_clock
	.align	2
	.global	s5p_mfc_set_platdata
	.type	s5p_mfc_set_platdata, %function
s5p_mfc_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:.LANCHOR1
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	r1, #:upper16:.LANCHOR1
	cmp	r0, #0
	movw	r2, #:lower16:s5p_device_mfc
	movw	r3, #:lower16:s3c_set_platdata
	moveq	r0, r1
	movt	r2, #:upper16:s5p_device_mfc
	movt	r3, #:upper16:s3c_set_platdata
	mov	r1, #4
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_mfc_set_platdata, .-s5p_mfc_set_platdata
	.align	2
	.global	s5p_mfc_setname
	.type	s5p_mfc_setname, %function
s5p_mfc_setname:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r1, [r0]
	bx	lr
	.fnend
	.size	s5p_mfc_setname, .-s5p_mfc_setname
	.global	mfc_clk_rate
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	default_mfc_pd, %object
	.size	default_mfc_pd, 4
default_mfc_pd:
	.word	200000000
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	mfc_clk_rate, %object
	.size	mfc_clk_rate, 4
mfc_clk_rate:
	.space	4
	.ident	"GCC: (GNU) 4.8"
