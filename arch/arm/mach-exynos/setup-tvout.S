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
	.file	"setup-tvout.c"
	.text
	.align	2
	.global	s5p_int_src_hdmi_hpd
	.type	s5p_int_src_hdmi_hpd, %function
s5p_int_src_hdmi_hpd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR0
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #12
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mov	r0, #224
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #1
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #224
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_int_src_hdmi_hpd, .-s5p_int_src_hdmi_hpd
	.align	2
	.global	s5p_int_src_ext_hpd
	.type	s5p_int_src_ext_hpd, %function
s5p_int_src_ext_hpd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	ldr	r1, .L3
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #0
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mov	r0, #224
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #1
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #224
	blx	r3
	ldmfd	sp!, {r3, pc}
.L4:
	.align	2
.L3:
	.word	.LANCHOR0+24
	.fnend
	.size	s5p_int_src_ext_hpd, .-s5p_int_src_ext_hpd
	.align	2
	.global	s5p_hpd_read_gpio
	.type	s5p_hpd_read_gpio, %function
s5p_hpd_read_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:__gpio_get_value
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r3, #:upper16:__gpio_get_value
	mov	r0, #224
	blx	r3
	movw	r3, #:lower16:printk
	mov	r4, r0
	movw	r0, #:lower16:.LC1
	mov	r2, r4
	movt	r3, #:upper16:printk
	ldr	r1, .L6
	movt	r0, #:upper16:.LC1
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r4, pc}
.L7:
	.align	2
.L6:
	.word	.LANCHOR0+44
	.fnend
	.size	s5p_hpd_read_gpio, .-s5p_hpd_read_gpio
	.align	2
	.global	s5p_v4l2_hpd_read_gpio
	.type	s5p_v4l2_hpd_read_gpio, %function
s5p_v4l2_hpd_read_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:__gpio_get_value
	movt	r3, #:upper16:__gpio_get_value
	mov	r0, #224
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_v4l2_hpd_read_gpio, .-s5p_v4l2_hpd_read_gpio
	.align	2
	.global	s5p_v4l2_int_src_hdmi_hpd
	.type	s5p_v4l2_int_src_hdmi_hpd, %function
s5p_v4l2_int_src_hdmi_hpd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:s3c_gpio_cfgpin
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #12
	mov	r0, #224
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #1
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #224
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_v4l2_int_src_hdmi_hpd, .-s5p_v4l2_int_src_hdmi_hpd
	.align	2
	.global	s5p_v4l2_int_src_ext_hpd
	.type	s5p_v4l2_int_src_ext_hpd, %function
s5p_v4l2_int_src_ext_hpd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:s3c_gpio_cfgpin
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #0
	mov	r0, #224
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #1
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #224
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_v4l2_int_src_ext_hpd, .-s5p_v4l2_int_src_ext_hpd
	.align	2
	.global	s5p_cec_cfg_gpio
	.type	s5p_cec_cfg_gpio, %function
s5p_cec_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	s5p_cec_cfg_gpio, .-s5p_cec_cfg_gpio
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.14000, %object
	.size	__func__.14000, 21
__func__.14000:
	.ascii	"s5p_int_src_hdmi_hpd\000"
	.space	3
	.type	__func__.14004, %object
	.size	__func__.14004, 20
__func__.14004:
	.ascii	"s5p_int_src_ext_hpd\000"
	.type	__func__.14009, %object
	.size	__func__.14009, 18
__func__.14009:
	.ascii	"s5p_hpd_read_gpio\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>%s()\012\000"
	.space	3
.LC1:
	.ascii	"<6>%s(%d)\012\000"
	.ident	"GCC: (GNU) 4.8"
