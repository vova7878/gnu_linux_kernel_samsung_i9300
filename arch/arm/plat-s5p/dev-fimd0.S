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
	.file	"dev-fimd0.c"
	.text
	.align	2
	.global	s5p_fimd0_set_platdata
	.type	s5p_fimd0_set_platdata, %function
s5p_fimd0_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r2, #:lower16:.LANCHOR0
	movw	r3, #:lower16:s3c_set_platdata
	movt	r2, #:upper16:.LANCHOR0
	movt	r3, #:upper16:s3c_set_platdata
	mov	r1, #36
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_fimd0_set_platdata, .-s5p_fimd0_set_platdata
	.global	s5p_device_fimd0
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	s5p_device_fimd0, %object
	.size	s5p_device_fimd0, 360
s5p_device_fimd0:
	.word	.LC0
	.word	0
	.space	252
	.word	fimd0_dmamask
	.word	-1
	.word	0
	.space	72
	.word	4
	.word	s5p_fimd0_resource
	.space	8
	.type	fimd0_dmamask, %object
	.size	fimd0_dmamask, 8
fimd0_dmamask:
	.word	-1
	.word	0
	.type	s5p_fimd0_resource, %object
	.size	s5p_fimd0_resource, 112
s5p_fimd0_resource:
	.word	297795584
	.word	297828351
	.space	4
	.word	512
	.space	12
	.word	281
	.word	281
	.space	4
	.word	1024
	.space	12
	.word	280
	.word	280
	.space	4
	.word	1024
	.space	12
	.word	282
	.word	282
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s5p-fb\000"
	.ident	"GCC: (GNU) 4.8"
