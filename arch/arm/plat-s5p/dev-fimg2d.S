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
	.file	"dev-fimg2d.c"
	.text
	.align	2
	.global	s5p_fimg2d_set_platdata
	.type	s5p_fimg2d_set_platdata, %function
s5p_fimg2d_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r4, #:lower16:.LANCHOR0
	cmp	r0, #0
	movt	r4, #:upper16:.LANCHOR0
	movw	r3, #:lower16:kmemdup
	moveq	r0, r4
	movt	r3, #:upper16:kmemdup
	mov	r1, #20
	mov	r2, #208
	blx	r3
	cmp	r0, #0
	strne	r0, [r4, #116]
	ldmnefd	sp!, {r4, pc}
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	s5p_fimg2d_set_platdata, .-s5p_fimg2d_set_platdata
	.global	s5p_device_fimg2d
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_s5p_device_fimg2d, %object
	.size	__kstrtab_s5p_device_fimg2d, 18
__kstrtab_s5p_device_fimg2d:
	.ascii	"s5p_device_fimg2d\000"
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	default_fimg2d_data, %object
	.size	default_fimg2d_data, 20
default_fimg2d_data:
	.space	4
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	250000000
	.space	4
	.type	s5p_device_fimg2d, %object
	.size	s5p_device_fimg2d, 360
s5p_device_fimg2d:
	.word	.LC4
	.word	-1
	.space	252
	.word	s5p_device_fimg2d_dmamask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	s5p_fimg2d_resource
	.space	8
	.type	s5p_device_fimg2d_dmamask, %object
	.size	s5p_device_fimg2d_dmamask, 8
s5p_device_fimg2d_dmamask:
	.word	-1
	.word	0
	.type	s5p_fimg2d_resource, %object
	.size	s5p_fimg2d_resource, 56
s5p_fimg2d_resource:
	.word	276824064
	.word	276828159
	.space	4
	.word	512
	.space	12
	.word	153
	.word	153
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>no memory for fimg2d platform data\012\000"
	.space	1
.LC1:
	.ascii	"mout_g2d0\000"
	.space	2
.LC2:
	.ascii	"sclk_fimg2d\000"
.LC3:
	.ascii	"fimg2d\000"
	.space	1
.LC4:
	.ascii	"s5p-fimg2d\000"
	.section	___ksymtab+s5p_device_fimg2d,"a",%progbits
	.align	2
	.type	__ksymtab_s5p_device_fimg2d, %object
	.size	__ksymtab_s5p_device_fimg2d, 8
__ksymtab_s5p_device_fimg2d:
	.word	s5p_device_fimg2d
	.word	__kstrtab_s5p_device_fimg2d
	.ident	"GCC: (GNU) 4.8"
