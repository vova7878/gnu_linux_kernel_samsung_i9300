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
	.file	"dev-tv.c"
	.text
	.align	2
	.type	s5p_hdmi_cfg_hpd, %function
s5p_hdmi_cfg_hpd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	s5p_hdmi_cfg_hpd, .-s5p_hdmi_cfg_hpd
	.align	2
	.type	s5p_hdmi_get_hpd, %function
s5p_hdmi_get_hpd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	s5p_hdmi_get_hpd, .-s5p_hdmi_get_hpd
	.align	2
	.global	s5p_hdmi_set_platdata
	.type	s5p_hdmi_set_platdata, %function
s5p_hdmi_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r2, #:lower16:.LANCHOR0
	movw	r3, #:lower16:s3c_set_platdata
	movt	r2, #:upper16:.LANCHOR0
	movt	r3, #:upper16:s3c_set_platdata
	mov	r1, #12
	blx	r3
	cmp	r0, #0
	ldmeqfd	sp!, {r3, pc}
	ldr	r3, [r0, #4]
	cmp	r3, #0
	movweq	r3, #:lower16:s5p_hdmi_cfg_hpd
	movteq	r3, #:upper16:s5p_hdmi_cfg_hpd
	streq	r3, [r0, #4]
	ldr	r3, [r0, #8]
	cmp	r3, #0
	movweq	r3, #:lower16:s5p_hdmi_get_hpd
	movteq	r3, #:upper16:s5p_hdmi_get_hpd
	streq	r3, [r0, #8]
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_hdmi_set_platdata, .-s5p_hdmi_set_platdata
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
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	str	r0, [r3, #452]
	ldmfd	sp!, {r3, pc}
.L13:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_hdmi_cec_set_platdata, .-s5p_hdmi_cec_set_platdata
	.global	s5p_device_cec
	.global	s5p_device_sdo
	.global	s5p_device_mixer
	.global	s5p_device_hdmi
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.16264, %object
	.size	__func__.16264, 26
__func__.16264:
	.ascii	"s5p_hdmi_cec_set_platdata\000"
	.section	___ksymtab+s5p_device_cec,"a",%progbits
	.align	2
	.type	__ksymtab_s5p_device_cec, %object
	.size	__ksymtab_s5p_device_cec, 8
__ksymtab_s5p_device_cec:
	.word	s5p_device_cec
	.word	__kstrtab_s5p_device_cec
	.section	___ksymtab+s5p_device_sdo,"a",%progbits
	.align	2
	.type	__ksymtab_s5p_device_sdo, %object
	.size	__ksymtab_s5p_device_sdo, 8
__ksymtab_s5p_device_sdo:
	.word	s5p_device_sdo
	.word	__kstrtab_s5p_device_sdo
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_s5p_device_cec, %object
	.size	__kstrtab_s5p_device_cec, 15
__kstrtab_s5p_device_cec:
	.ascii	"s5p_device_cec\000"
	.type	__kstrtab_s5p_device_sdo, %object
	.size	__kstrtab_s5p_device_sdo, 15
__kstrtab_s5p_device_sdo:
	.ascii	"s5p_device_sdo\000"
	.type	__kstrtab_s5p_device_mixer, %object
	.size	__kstrtab_s5p_device_mixer, 17
__kstrtab_s5p_device_mixer:
	.ascii	"s5p_device_mixer\000"
	.type	__kstrtab_s5p_device_hdmi, %object
	.size	__kstrtab_s5p_device_hdmi, 16
__kstrtab_s5p_device_hdmi:
	.ascii	"s5p_device_hdmi\000"
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	s5p_device_hdmi, %object
	.size	s5p_device_hdmi, 360
s5p_device_hdmi:
	.word	.LC7
	.word	-1
	.space	336
	.word	3
	.word	s5p_hdmi_resources
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
	.type	s5p_device_sdo, %object
	.size	s5p_device_sdo, 360
s5p_device_sdo:
	.word	.LC2
	.word	-1
	.space	252
	.word	s5p_device_sdo+264
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	s5p_sdo_resources
	.space	8
	.type	s5p_sdo_resources, %object
	.size	s5p_sdo_resources, 56
s5p_sdo_resources:
	.word	314703872
	.word	314769407
	.space	4
	.word	512
	.space	12
	.word	159
	.word	159
	.space	4
	.word	1024
	.space	12
	.type	s5p_device_mixer, %object
	.size	s5p_device_mixer, 360
s5p_device_mixer:
	.word	.LC3
	.word	-1
	.space	252
	.word	s5p_device_mixer+264
	.word	-1
	.word	0
	.space	72
	.word	3
	.word	s5p_mixer_resources
	.space	8
	.type	s5p_mixer_resources, %object
	.size	s5p_mixer_resources, 84
s5p_mixer_resources:
	.word	314638336
	.word	314703871
	.word	.LC4
	.word	512
	.space	12
	.word	314572800
	.word	314638335
	.word	.LC5
	.word	512
	.space	12
	.word	155
	.word	155
	.word	.LC6
	.word	1024
	.space	12
	.type	s5p_hdmi_resources, %object
	.size	s5p_hdmi_resources, 84
s5p_hdmi_resources:
	.word	315621376
	.word	316669951
	.space	4
	.word	512
	.space	12
	.word	383
	.word	383
	.word	.LC8
	.word	1024
	.space	12
	.word	156
	.word	156
	.word	.LC9
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
	.ascii	"s5p-sdo\000"
.LC3:
	.ascii	"s5p-mixer\000"
	.space	2
.LC4:
	.ascii	"mxr\000"
.LC5:
	.ascii	"vp\000"
	.space	1
.LC6:
	.ascii	"irq\000"
.LC7:
	.ascii	"s5p-hdmi\000"
	.space	3
.LC8:
	.ascii	"external_irq\000"
	.space	3
.LC9:
	.ascii	"internal_irq\000"
	.section	___ksymtab+s5p_device_mixer,"a",%progbits
	.align	2
	.type	__ksymtab_s5p_device_mixer, %object
	.size	__ksymtab_s5p_device_mixer, 8
__ksymtab_s5p_device_mixer:
	.word	s5p_device_mixer
	.word	__kstrtab_s5p_device_mixer
	.section	___ksymtab+s5p_device_hdmi,"a",%progbits
	.align	2
	.type	__ksymtab_s5p_device_hdmi, %object
	.size	__ksymtab_s5p_device_hdmi, 8
__ksymtab_s5p_device_hdmi:
	.word	s5p_device_hdmi
	.word	__kstrtab_s5p_device_hdmi
	.ident	"GCC: (GNU) 4.8"
