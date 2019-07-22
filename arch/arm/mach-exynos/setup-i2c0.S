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
	.file	"setup-i2c0.c"
	.text
	.align	2
	.global	s3c_i2c0_cfg_gpio
	.type	s3c_i2c0_cfg_gpio, %function
s3c_i2c0_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:s3c_gpio_cfgall_range
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	ip, #:upper16:s3c_gpio_cfgall_range
	mov	r1, #2
	mvn	r2, #13
	mov	r3, #3
	mov	r0, #42
	blx	ip
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s3c_i2c0_cfg_gpio, .-s3c_i2c0_cfg_gpio
	.ident	"GCC: (GNU) 4.8"
