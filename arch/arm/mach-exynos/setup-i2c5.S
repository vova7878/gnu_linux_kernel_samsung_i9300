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
	.file	"setup-i2c5.c"
	.text
	.align	2
	.global	s3c_i2c5_cfg_gpio
	.type	s3c_i2c5_cfg_gpio, %function
s3c_i2c5_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:samsung_cpu_id
	movt	r3, #:upper16:samsung_cpu_id
	mov	r2, #0
	movt	r2, 17186
	movw	ip, #:lower16:s3c_gpio_cfgall_range
	ldr	r3, [r3]
	movt	ip, #:upper16:s3c_gpio_cfgall_range
	mov	r1, #2
	mov	r0, #18
	mov	r3, r3, lsr #17
	cmp	r2, r3, asl #17
	mvn	r2, #12
	moveq	r3, #0
	movne	r3, #3
	blx	ip
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s3c_i2c5_cfg_gpio, .-s3c_i2c5_cfg_gpio
	.ident	"GCC: (GNU) 4.8"
