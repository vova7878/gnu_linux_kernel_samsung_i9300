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
	.file	"setup-hdmi.c"
	.text
	.align	2
	.global	s5p_hdmi_cfg_hpd
	.type	s5p_hdmi_cfg_hpd, %function
s5p_hdmi_cfg_hpd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mvnne	r1, #12
	mvneq	r1, #0
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
	.size	s5p_hdmi_cfg_hpd, .-s5p_hdmi_cfg_hpd
	.align	2
	.global	s5p_hdmi_get_hpd
	.type	s5p_hdmi_get_hpd, %function
s5p_hdmi_get_hpd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:__gpio_get_value
	movt	r3, #:upper16:__gpio_get_value
	mov	r0, #224
	blx	r3
	adds	r0, r0, #0
	movne	r0, #1
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_hdmi_get_hpd, .-s5p_hdmi_get_hpd
	.ident	"GCC: (GNU) 4.8"
