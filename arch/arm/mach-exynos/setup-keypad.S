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
	.file	"setup-keypad.c"
	.text
	.align	2
	.global	samsung_keypad_cfg_gpio
	.type	samsung_keypad_cfg_gpio, %function
samsung_keypad_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #8
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	mov	r6, r1
	movw	r4, #:lower16:s3c_gpio_cfgall_range
	bhi	.L5
	mov	r1, r0
	movt	r4, #:upper16:s3c_gpio_cfgall_range
	mov	r0, #208
	mvn	r2, #12
	mov	r3, #3
	blx	r4
.L3:
	mov	r1, r6
	mvn	r2, #12
	mov	r3, #0
	mov	r0, #199
	blx	r4
	ldmfd	sp!, {r4, r5, r6, pc}
.L5:
	movt	r4, #:upper16:s3c_gpio_cfgall_range
	mov	r1, #8
	mvn	r2, #12
	mov	r3, #3
	mov	r0, #208
	blx	r4
	sub	r1, r5, #8
	mvn	r2, #12
	mov	r3, #3
	mov	r0, #217
	blx	r4
	b	.L3
	.fnend
	.size	samsung_keypad_cfg_gpio, .-samsung_keypad_cfg_gpio
	.ident	"GCC: (GNU) 4.8"
