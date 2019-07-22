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
	.file	"dev-mshc.c"
	.text
	.align	2
	.global	s3c_mshci_set_platdata
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_mshci_set_platdata, %function
s3c_mshci_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, [r0, #40]
	movw	r3, #:lower16:.LANCHOR0
	ldr	r2, [r0, #44]
	movt	r3, #:upper16:.LANCHOR0
	str	lr, [sp, #-4]!
	.save {lr}
	ldr	lr, [r0, #12]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	ldr	ip, [r0, #24]
	ldrb	r1, [r0, #36]	@ zero_extendqisi2
	ldrb	r2, [r0, #37]	@ zero_extendqisi2
	str	ip, [r3, #24]
	strb	r1, [r3, #36]
	ldr	ip, [r0, #20]
	strb	r2, [r3, #37]
	ldr	r2, [r0, #32]
	ldr	r1, [r0, #28]
	str	lr, [r3, #12]
	cmp	r2, #0
	str	ip, [r3, #20]
	moveq	r2, #32
	str	r1, [r3, #28]
	str	r2, [r3, #32]
	ldr	r2, [r0]
	cmp	r2, #0
	strne	r2, [r3]
	ldr	r2, [r0, #4]
	cmp	r2, #0
	ldrne	r1, [r3, #4]
	orrne	r2, r1, r2
	strne	r2, [r3, #4]
	ldr	r2, [r0, #8]
	cmp	r2, #0
	ldrne	r1, [r3, #8]
	orrne	r2, r1, r2
	strne	r2, [r3, #8]
	ldr	r2, [r0, #48]
	cmp	r2, #0
	strne	r2, [r3, #48]
	ldr	r2, [r0, #64]
	cmp	r2, #0
	strne	r2, [r3, #64]
	ldr	r2, [r0, #52]
	cmp	r2, #0
	strne	r2, [r3, #52]
	ldr	r2, [r0, #56]
	cmp	r2, #0
	strne	r2, [r3, #56]
	ldr	pc, [sp], #4
	.fnend
	.size	s3c_mshci_set_platdata, .-s3c_mshci_set_platdata
	.global	s3c_device_mshci
	.global	s3c_mshci_def_platdata
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	s3c_mshci_def_platdata, %object
	.size	s3c_mshci_def_platdata, 72
s3c_mshci_def_platdata:
	.word	4
	.word	7
	.space	64
	.type	s3c_device_mshci, %object
	.size	s3c_device_mshci, 360
s3c_device_mshci:
	.word	.LC0
	.word	-1
	.space	84
	.word	s3c_mshci_def_platdata
	.space	164
	.word	s3c_device_hsmmc_dmamask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	s3c_mshci_resource
	.space	8
	.type	s3c_device_hsmmc_dmamask, %object
	.size	s3c_device_hsmmc_dmamask, 8
s3c_device_hsmmc_dmamask:
	.word	-1
	.word	0
	.type	s3c_mshci_resource, %object
	.size	s3c_mshci_resource, 56
s3c_mshci_resource:
	.word	307560448
	.word	307564543
	.space	4
	.word	512
	.space	12
	.word	141
	.word	141
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"dw_mmc\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
