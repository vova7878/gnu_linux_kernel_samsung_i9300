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
	.file	"dev-hsmmc1.c"
	.text
	.align	2
	.global	s3c_sdhci1_set_platdata
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_sdhci1_set_platdata, %function
s3c_sdhci1_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, [r0, #36]
	movw	r3, #:lower16:.LANCHOR0
	ldr	r2, [r0, #40]
	movt	r3, #:upper16:.LANCHOR0
	str	lr, [sp, #-4]!
	.save {lr}
	ldr	lr, [r0, #8]
	str	r1, [r3, #36]
	str	r2, [r3, #40]
	ldrb	r1, [r0, #28]	@ zero_extendqisi2
	ldr	ip, [r0, #24]
	ldr	r2, [r0, #32]
	strb	r1, [r3, #28]
	str	ip, [r3, #24]
	str	r2, [r3, #32]
	str	lr, [r3, #8]
	ldr	r2, [r0]
	cmp	r2, #0
	strne	r2, [r3]
	ldr	r2, [r0, #44]
	cmp	r2, #0
	strne	r2, [r3, #44]
	ldr	r2, [r0, #48]
	cmp	r2, #0
	strne	r2, [r3, #48]
	ldr	r2, [r0, #4]
	cmp	r2, #0
	ldrne	r1, [r3, #4]
	orrne	r2, r1, r2
	strne	r2, [r3, #4]
	ldr	r2, [r0, #12]
	cmp	r2, #0
	strne	r2, [r3, #12]
	ldr	pc, [sp], #4
	.fnend
	.size	s3c_sdhci1_set_platdata, .-s3c_sdhci1_set_platdata
	.global	s3c_device_hsmmc1
	.global	s3c_hsmmc1_def_platdata
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	s3c_hsmmc1_def_platdata, %object
	.size	s3c_hsmmc1_def_platdata, 52
s3c_hsmmc1_def_platdata:
	.word	4
	.word	7
	.space	4
	.word	0
	.space	36
	.space	4
	.type	s3c_device_hsmmc1, %object
	.size	s3c_device_hsmmc1, 360
s3c_device_hsmmc1:
	.word	.LC0
	.word	1
	.space	84
	.word	s3c_hsmmc1_def_platdata
	.space	164
	.word	s3c_device_hsmmc1_dmamask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	s3c_hsmmc1_resource
	.space	8
	.type	s3c_device_hsmmc1_dmamask, %object
	.size	s3c_device_hsmmc1_dmamask, 8
s3c_device_hsmmc1_dmamask:
	.word	-1
	.word	0
	.type	s3c_hsmmc1_resource, %object
	.size	s3c_hsmmc1_resource, 56
s3c_hsmmc1_resource:
	.word	307363840
	.word	307367935
	.space	4
	.word	512
	.space	12
	.word	138
	.word	138
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s3c-sdhci\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
