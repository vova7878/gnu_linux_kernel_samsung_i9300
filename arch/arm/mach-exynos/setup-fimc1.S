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
	.file	"setup-fimc1.c"
	.text
	.align	2
	.global	s3c_fimc1_cfg_gpio
	.type	s3c_fimc1_cfg_gpio, %function
s3c_fimc1_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	s3c_fimc1_cfg_gpio, .-s3c_fimc1_cfg_gpio
	.ident	"GCC: (GNU) 4.8"
