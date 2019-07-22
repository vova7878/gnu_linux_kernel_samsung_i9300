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
	.file	"setup-dp.c"
	.text
	.align	2
	.global	s5p_dp_phy_init
	.type	s5p_dp_phy_init, %function
s5p_dp_phy_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	movt	r3, 65048
	ldr	r2, [r3, #1824]
	orr	r2, r2, #1
	str	r2, [r3, #1824]
	bx	lr
	.fnend
	.size	s5p_dp_phy_init, .-s5p_dp_phy_init
	.align	2
	.global	s5p_dp_phy_exit
	.type	s5p_dp_phy_exit, %function
s5p_dp_phy_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	movt	r3, 65048
	ldr	r2, [r3, #1824]
	bic	r2, r2, #1
	str	r2, [r3, #1824]
	bx	lr
	.fnend
	.size	s5p_dp_phy_exit, .-s5p_dp_phy_exit
	.ident	"GCC: (GNU) 4.8"
