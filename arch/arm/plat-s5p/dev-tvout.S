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
	.file	"dev-tvout.c"
	.text
	.align	2
	.global	s5p_hdmi_hpd_set_platdata
	.type	s5p_hdmi_hpd_set_platdata, %function
s5p_hdmi_hpd_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:kmemdup
	mov	r1, #12
	movt	r3, #:upper16:kmemdup
	mov	r2, #208
	blx	r3
	cmp	r0, #0
	beq	.L8
	ldr	r3, [r0, #4]
	cmp	r3, #0
	movweq	r3, #:lower16:s5p_int_src_ext_hpd
	movteq	r3, #:upper16:s5p_int_src_ext_hpd
	streq	r3, [r0, #4]
	ldr	r3, [r0]
	cmp	r3, #0
	movweq	r3, #:lower16:s5p_int_src_hdmi_hpd
	movteq	r3, #:upper16:s5p_int_src_hdmi_hpd
	streq	r3, [r0]
	ldr	r3, [r0, #8]
	cmp	r3, #0
	movweq	r3, #:lower16:s5p_hpd_read_gpio
	movteq	r3, #:upper16:s5p_hpd_read_gpio
	streq	r3, [r0, #8]
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	str	r0, [r3, #92]
	ldmfd	sp!, {r3, pc}
.L8:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR0
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_hdmi_hpd_set_platdata, .-s5p_hdmi_hpd_set_platdata
	.align	2
	.global	s5p_hdmi_cec_set_platdata
	.type	s5p_hdmi_cec_set_platdata, %function
s5p_hdmi_cec_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:kmemdup
	mov	r1, #4
	movt	r3, #:upper16:kmemdup
	mov	r2, #208
	blx	r3
	cmp	r0, #0
	beq	.L13
	ldr	r3, [r0]
	cmp	r3, #0
	movweq	r3, #:lower16:s5p_cec_cfg_gpio
	movteq	r3, #:upper16:s5p_cec_cfg_gpio
	streq	r3, [r0]
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	str	r0, [r3, #452]
	ldmfd	sp!, {r3, pc}
.L13:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L14
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r3, pc}
.L15:
	.align	2
.L14:
	.word	.LANCHOR0+28
	.fnend
	.size	s5p_hdmi_cec_set_platdata, .-s5p_hdmi_cec_set_platdata
	.global	s5p_device_cec
	.global	s5p_device_hpd
	.global	s5p_device_tvout
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.16559, %object
	.size	__func__.16559, 26
__func__.16559:
	.ascii	"s5p_hdmi_hpd_set_platdata\000"
	.space	2
	.type	__func__.16572, %object
	.size	__func__.16572, 26
__func__.16572:
	.ascii	"s5p_hdmi_cec_set_platdata\000"
	.section	___ksymtab+s5p_device_cec,"a",%progbits
	.align	2
	.type	__ksymtab_s5p_device_cec, %object
	.size	__ksymtab_s5p_device_cec, 8
__ksymtab_s5p_device_cec:
	.word	s5p_device_cec
	.word	__kstrtab_s5p_device_cec
	.section	___ksymtab+s5p_device_tvout,"a",%progbits
	.align	2
	.type	__ksymtab_s5p_device_tvout, %object
	.size	__ksymtab_s5p_device_tvout, 8
__ksymtab_s5p_device_tvout:
	.word	s5p_device_tvout
	.word	__kstrtab_s5p_device_tvout
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_s5p_device_cec, %object
	.size	__kstrtab_s5p_device_cec, 15
__kstrtab_s5p_device_cec:
	.ascii	"s5p_device_cec\000"
	.type	__kstrtab_s5p_device_hpd, %object
	.size	__kstrtab_s5p_device_hpd, 15
__kstrtab_s5p_device_hpd:
	.ascii	"s5p_device_hpd\000"
	.type	__kstrtab_s5p_device_tvout, %object
	.size	__kstrtab_s5p_device_tvout, 17
__kstrtab_s5p_device_tvout:
	.ascii	"s5p_device_tvout\000"
	.data
	.align	3
	.set	.LANCHOR1,. + 0
	.type	s5p_device_hpd, %object
	.size	s5p_device_hpd, 360
s5p_device_hpd:
	.word	.LC2
	.word	-1
	.space	336
	.word	1
	.word	s5p_hpd_resources
	.space	8
	.type	s5p_device_cec, %object
	.size	s5p_device_cec, 360
s5p_device_cec:
	.word	.LC1
	.word	-1
	.space	336
	.word	2
	.word	s5p_cec_resources
	.space	8
	.type	s5p_cec_resources, %object
	.size	s5p_cec_resources, 56
s5p_cec_resources:
	.word	269156352
	.word	269160447
	.space	4
	.word	512
	.space	12
	.word	178
	.word	178
	.space	4
	.word	1024
	.space	12
	.type	s5p_hpd_resources, %object
	.size	s5p_hpd_resources, 28
s5p_hpd_resources:
	.word	383
	.word	383
	.space	4
	.word	1024
	.space	12
	.space	4
	.type	s5p_device_tvout, %object
	.size	s5p_device_tvout, 360
s5p_device_tvout:
	.word	.LC3
	.word	-1
	.space	336
	.word	8
	.word	s5p_tvout_resources
	.space	8
	.type	s5p_tvout_resources, %object
	.size	s5p_tvout_resources, 224
s5p_tvout_resources:
	.word	314703872
	.word	314769407
	.word	.LC4
	.word	512
	.space	12
	.word	314572800
	.word	314638335
	.word	.LC5
	.word	512
	.space	12
	.word	314638336
	.word	314703871
	.word	.LC6
	.word	512
	.space	12
	.word	315621376
	.word	316669951
	.word	.LC7
	.word	512
	.space	12
	.word	328073216
	.word	328074239
	.word	.LC8
	.word	512
	.space	12
	.word	155
	.word	155
	.word	.LC6
	.word	1024
	.space	12
	.word	156
	.word	156
	.word	.LC7
	.word	1024
	.space	12
	.word	159
	.word	159
	.word	.LC4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>%s: no memory for platform data\012\000"
.LC1:
	.ascii	"s5p-tvout-cec\000"
	.space	2
.LC2:
	.ascii	"s5p-tvout-hpd\000"
	.space	2
.LC3:
	.ascii	"s5p-tvout\000"
	.space	2
.LC4:
	.ascii	"s5p-sdo\000"
.LC5:
	.ascii	"s5p-vp\000"
	.space	1
.LC6:
	.ascii	"s5p-mixer\000"
	.space	2
.LC7:
	.ascii	"s5p-hdmi\000"
	.space	3
.LC8:
	.ascii	"s5p-i2c-hdmi-phy\000"
	.section	___ksymtab+s5p_device_hpd,"a",%progbits
	.align	2
	.type	__ksymtab_s5p_device_hpd, %object
	.size	__ksymtab_s5p_device_hpd, 8
__ksymtab_s5p_device_hpd:
	.word	s5p_device_hpd
	.word	__kstrtab_s5p_device_hpd
	.ident	"GCC: (GNU) 4.8"
