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
	.file	"grande-jack.c"
	.text
	.align	2
	.type	sec_set_jack_micbias, %function
sec_set_jack_micbias:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:__gpio_set_value
	mov	r1, r0
	movt	r3, #:upper16:__gpio_set_value
	mov	r0, #63
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	sec_set_jack_micbias, .-sec_set_jack_micbias
	.align	2
	.global	grande_jack_init
	.type	grande_jack_init, %function
grande_jack_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:gpio_request
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:gpio_request
	mov	r0, #63
	blx	r3
	subs	r4, r0, #0
	bne	.L6
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, #1
	movt	r3, #:upper16:gpio_direction_output
	mov	r0, #63
	blx	r3
	movw	r3, #:lower16:__gpio_set_value
	mov	r1, r4
	movt	r3, #:upper16:__gpio_set_value
	mov	r0, #63
	blx	r3
	movw	r3, #:lower16:gpio_free
	mov	r0, #63
	movt	r3, #:upper16:gpio_free
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:platform_device_register
	movt	r3, #:upper16:platform_device_register
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldmfd	sp!, {r4, pc}
.L6:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	grande_jack_init, .-grande_jack_init
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	sec_device_jack, %object
	.size	sec_device_jack, 360
sec_device_jack:
	.word	.LC2
	.word	1
	.space	84
	.word	sec_jack_data
	.space	248
	.space	16
	.type	sec_jack_data, %object
	.size	sec_jack_data, 36
sec_jack_data:
	.space	4
	.word	sec_set_jack_micbias
	.space	28
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"EAR MIC\000"
.LC1:
	.ascii	"<3><3>GPIO_MIC_BIAS_EN GPIO set error!\012\000"
.LC2:
	.ascii	"sec_jack\000"
	.ident	"GCC: (GNU) 4.8"
