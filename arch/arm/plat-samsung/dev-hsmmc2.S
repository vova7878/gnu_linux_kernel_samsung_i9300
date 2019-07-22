	.cpu cortex-a9
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"dev-hsmmc2.c"
	.text
	.align	2
	.global	s3c_sdhci2_set_platdata
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_sdhci2_set_platdata, %function
s3c_sdhci2_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r5, #:lower16:.LANCHOR0
	ldr	r1, [r0, #36]
	movt	r5, #:upper16:.LANCHOR0
	mov	r4, r0
	ldr	r3, [r0, #40]
	ldr	r2, [r0, #8]
	str	r1, [r5, #36]
	str	r3, [r5, #40]
	ldr	r3, [r0, #24]
	str	r2, [r5, #8]
	str	r3, [r5, #24]
	ldr	r0, [r0, #24]
	cmp	r0, #0
	bne	.L32
.L2:
	ldrb	r2, [r4, #28]	@ zero_extendqisi2
	ldr	r3, [r4, #32]
	strb	r2, [r5, #28]
	str	r3, [r5, #32]
	ldr	r3, [r4, #20]
	cmp	r3, #0
	strne	r3, [r5, #20]
	ldr	r3, [r4]
	cmp	r3, #0
	strne	r3, [r5]
	ldr	r3, [r4, #44]
	cmp	r3, #0
	strne	r3, [r5, #44]
	ldr	r3, [r4, #48]
	cmp	r3, #0
	strne	r3, [r5, #48]
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ldrne	r2, [r5, #4]
	orrne	r3, r2, r3
	strne	r3, [r5, #4]
	ldr	r3, [r4, #12]
	cmp	r3, #0
	strne	r3, [r5, #12]
	pop	{r4, r5, r6, pc}
.L32:
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #0
	movt	r3, #:upper16:s3c_gpio_setpull
	blx	r3
	b	.L2
	.fnend
	.size	s3c_sdhci2_set_platdata, .-s3c_sdhci2_set_platdata
	.global	s3c_device_hsmmc2
	.global	s3c_hsmmc2_def_platdata
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	s3c_hsmmc2_def_platdata, %object
	.size	s3c_hsmmc2_def_platdata, 52
s3c_hsmmc2_def_platdata:
	.word	4
	.word	7
	.space	4
	.word	0
	.space	36
	.space	4
	.type	s3c_device_hsmmc2, %object
	.size	s3c_device_hsmmc2, 360
s3c_device_hsmmc2:
	.word	.LC0
	.word	2
	.space	84
	.word	s3c_hsmmc2_def_platdata
	.space	164
	.word	s3c_device_hsmmc2_dmamask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	s3c_hsmmc2_resource
	.space	8
	.type	s3c_device_hsmmc2_dmamask, %object
	.size	s3c_device_hsmmc2_dmamask, 8
s3c_device_hsmmc2_dmamask:
	.word	-1
	.word	0
	.type	s3c_hsmmc2_resource, %object
	.size	s3c_hsmmc2_resource, 56
s3c_hsmmc2_resource:
	.word	307429376
	.word	307433471
	.space	4
	.word	512
	.space	12
	.word	139
	.word	139
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s3c-sdhci\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
