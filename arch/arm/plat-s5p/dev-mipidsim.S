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
	.file	"dev-mipidsim.c"
	.text
	.align	2
	.global	s5p_dsim_set_platdata
	.type	s5p_dsim_set_platdata, %function
s5p_dsim_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r2, #:lower16:.LANCHOR0
	movw	r3, #:lower16:s3c_set_platdata
	movt	r2, #:upper16:.LANCHOR0
	movt	r3, #:upper16:s3c_set_platdata
	mov	r1, #48
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_dsim_set_platdata, .-s5p_dsim_set_platdata
	.global	s5p_device_mipi_dsim
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	s5p_device_mipi_dsim, %object
	.size	s5p_device_mipi_dsim, 360
s5p_device_mipi_dsim:
	.word	.LC0
	.word	-1
	.space	84
	.word	0
	.space	248
	.word	2
	.word	s5p_dsim_resource
	.space	8
	.type	s5p_dsim_resource, %object
	.size	s5p_dsim_resource, 56
s5p_dsim_resource:
	.word	298319872
	.word	298385407
	.space	4
	.word	512
	.space	12
	.word	143
	.word	143
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s5p-mipi-dsim\000"
	.ident	"GCC: (GNU) 4.8"
