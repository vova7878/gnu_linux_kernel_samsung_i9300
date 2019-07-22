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
	.file	"dev-i2c-hdmiphy.c"
	.text
	.align	2
	.global	s5p_i2c_hdmiphy_set_platdata
	.type	s5p_i2c_hdmiphy_set_platdata, %function
s5p_i2c_hdmiphy_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movweq	r3, #:lower16:default_i2c_data
	moveq	r2, #8
	movteq	r3, #:upper16:default_i2c_data
	mov	r1, #24
	streq	r2, [r3]
	moveq	r0, r3
	movw	r2, #:lower16:.LANCHOR0
	movw	r3, #:lower16:s3c_set_platdata
	movt	r2, #:upper16:.LANCHOR0
	movt	r3, #:upper16:s3c_set_platdata
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_i2c_hdmiphy_set_platdata, .-s5p_i2c_hdmiphy_set_platdata
	.global	s5p_device_i2c_hdmiphy
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_s5p_i2c_hdmiphy_set_platdata, %object
	.size	__kstrtab_s5p_i2c_hdmiphy_set_platdata, 29
__kstrtab_s5p_i2c_hdmiphy_set_platdata:
	.ascii	"s5p_i2c_hdmiphy_set_platdata\000"
	.type	__kstrtab_s5p_device_i2c_hdmiphy, %object
	.size	__kstrtab_s5p_device_i2c_hdmiphy, 23
__kstrtab_s5p_device_i2c_hdmiphy:
	.ascii	"s5p_device_i2c_hdmiphy\000"
	.section	___ksymtab+s5p_i2c_hdmiphy_set_platdata,"a",%progbits
	.align	2
	.type	__ksymtab_s5p_i2c_hdmiphy_set_platdata, %object
	.size	__ksymtab_s5p_i2c_hdmiphy_set_platdata, 8
__ksymtab_s5p_i2c_hdmiphy_set_platdata:
	.word	s5p_i2c_hdmiphy_set_platdata
	.word	__kstrtab_s5p_i2c_hdmiphy_set_platdata
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	s5p_device_i2c_hdmiphy, %object
	.size	s5p_device_i2c_hdmiphy, 360
s5p_device_i2c_hdmiphy:
	.word	.LC0
	.word	-1
	.space	336
	.word	2
	.word	s5p_i2c_resource
	.space	8
	.type	s5p_i2c_resource, %object
	.size	s5p_i2c_resource, 56
s5p_i2c_resource:
	.word	328073216
	.word	328077311
	.space	4
	.word	512
	.space	12
	.word	157
	.word	157
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"s3c2440-hdmiphy-i2c\000"
	.section	___ksymtab+s5p_device_i2c_hdmiphy,"a",%progbits
	.align	2
	.type	__ksymtab_s5p_device_i2c_hdmiphy, %object
	.size	__ksymtab_s5p_device_i2c_hdmiphy, 8
__ksymtab_s5p_device_i2c_hdmiphy:
	.word	s5p_device_i2c_hdmiphy
	.word	__kstrtab_s5p_device_i2c_hdmiphy
	.ident	"GCC: (GNU) 4.8"
