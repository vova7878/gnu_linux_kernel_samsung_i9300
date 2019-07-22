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
	.file	"setup-fb-s5p.c"
	.text
	.align	2
	.global	s3cfb_set_display_path
	.type	s3cfb_set_display_path, %function
s3cfb_set_display_path:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	movt	r3, 64528
	ldr	r2, [r3, #528]
	bic	r2, r2, #15360
	bic	r2, r2, #2
	orr	r2, r2, #1
	str	r2, [r3, #528]
	bx	lr
	.fnend
	.size	s3cfb_set_display_path, .-s3cfb_set_display_path
	.align	2
	.global	s3cfb_cfg_gpio
	.type	s3cfb_cfg_gpio, %function
s3cfb_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	s3cfb_cfg_gpio, .-s3cfb_cfg_gpio
	.align	2
	.global	s3cfb_backlight_on
	.type	s3cfb_backlight_on, %function
s3cfb_backlight_on:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	s3cfb_backlight_on, .-s3cfb_backlight_on
	.align	2
	.global	s3cfb_backlight_off
	.type	s3cfb_backlight_off, %function
s3cfb_backlight_off:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	s3cfb_backlight_off, .-s3cfb_backlight_off
	.align	2
	.global	s3cfb_lcd_on
	.type	s3cfb_lcd_on, %function
s3cfb_lcd_on:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	s3cfb_lcd_on, .-s3cfb_lcd_on
	.align	2
	.global	s3cfb_lcd_off
	.type	s3cfb_lcd_off, %function
s3cfb_lcd_off:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	s3cfb_lcd_off, .-s3cfb_lcd_off
	.align	2
	.global	s3cfb_mipi_clk_enable
	.type	s3cfb_mipi_clk_enable, %function
s3cfb_mipi_clk_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:clk_get
	mov	r5, r0
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:clk_get
	mov	r0, #0
	blx	r3
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L13
	cmp	r5, #0
	bne	.L14
	movw	r3, #:lower16:clk_disable
	movt	r3, #:upper16:clk_disable
	blx	r3
.L11:
	movw	r3, #:lower16:clk_put
	mov	r0, r4
	movt	r3, #:upper16:clk_put
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
.L14:
	movw	r3, #:lower16:clk_enable
	movt	r3, #:upper16:clk_enable
	blx	r3
	b	.L11
.L13:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	movw	r3, #:lower16:clk_put
	mov	r0, r4
	movt	r3, #:upper16:clk_put
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	s3cfb_mipi_clk_enable, .-s3cfb_mipi_clk_enable
	.align	2
	.global	s3cfb_mdnie_clk_on
	.type	s3cfb_mdnie_clk_on, %function
s3cfb_mdnie_clk_on:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	movw	r1, #:lower16:.LC2
	movw	r4, #:lower16:clk_get
	mov	r8, r0
	movt	r1, #:upper16:.LC2
	movt	r4, #:upper16:clk_get
	mov	r0, #0
	blx	r4
	cmn	r0, #4096
	mov	r9, r0
	bhi	.L24
	movw	r6, #:lower16:clk_enable
	movw	r5, #:lower16:clk_put
	movt	r6, #:upper16:clk_enable
	movt	r5, #:upper16:clk_put
	blx	r6
	mov	r0, r9
	blx	r5
	movw	r1, #:lower16:.LC4
	mov	r0, #0
	movt	r1, #:upper16:.LC4
	blx	r4
	cmn	r0, #4096
	mov	r7, r0
	bhi	.L25
	movw	r1, #:lower16:.LC6
	mov	r0, #0
	movt	r1, #:upper16:.LC6
	blx	r4
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L26
	movw	r3, #:lower16:clk_set_parent
	mov	r1, r4
	mov	r0, r7
	movt	r3, #:upper16:clk_set_parent
	blx	r3
	cmp	r8, #0
	mov	r1, #2048
	movw	r3, #:lower16:clk_set_rate
	movt	r1, 12207
	movt	r3, #:upper16:clk_set_rate
	movne	r1, r8
	mov	r0, r7
	blx	r3
	mov	r0, r4
	blx	r5
	mov	r0, r7
	blx	r6
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L24:
	movw	r5, #:lower16:clk_put
	movw	r0, #:lower16:.LC3
	movw	r3, #:lower16:printk
	movt	r5, #:upper16:clk_put
	movt	r0, #:upper16:.LC3
	movt	r3, #:upper16:printk
	blx	r3
.L17:
	mov	r0, r9
	blx	r5
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L26:
	movw	r0, #:lower16:.LC7
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC7
	movt	r3, #:upper16:printk
	blx	r3
.L19:
	mov	r0, r7
	blx	r5
	b	.L17
.L25:
	movw	r0, #:lower16:.LC5
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC5
	blx	r3
	mov	r0, #0
	blx	r5
	b	.L19
	.fnend
	.size	s3cfb_mdnie_clk_on, .-s3cfb_mdnie_clk_on
	.align	2
	.global	s3cfb_mdnie_pwm_clk_on
	.type	s3cfb_mdnie_pwm_clk_on, %function
s3cfb_mdnie_pwm_clk_on:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r1, #:lower16:.LC8
	movw	r4, #:lower16:clk_get
	movt	r1, #:upper16:.LC8
	movt	r4, #:upper16:clk_get
	mov	r0, #0
	blx	r4
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L34
	movw	r1, #:lower16:.LC10
	mov	r0, #0
	movt	r1, #:upper16:.LC10
	blx	r4
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L35
	movw	r1, #:lower16:.LC6
	mov	r0, #0
	movt	r1, #:upper16:.LC6
	blx	r4
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L36
	movw	r3, #:lower16:clk_set_parent
	mov	r1, r4
	mov	r0, r5
	movt	r3, #:upper16:clk_set_parent
	blx	r3
	movw	r1, #24928
	movw	r3, #:lower16:clk_set_rate
	mov	r0, r5
	movt	r1, 877
	movt	r3, #:upper16:clk_set_rate
	blx	r3
	movw	r0, #:lower16:.LC12
	movw	r1, #24928
	movw	r3, #:lower16:printk
	movt	r1, 877
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC12
	blx	r3
	movw	r3, #:lower16:clk_put
	mov	r0, r4
	movt	r3, #:upper16:clk_put
	blx	r3
	movw	r3, #:lower16:clk_enable
	mov	r0, r5
	movt	r3, #:upper16:clk_enable
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L34:
	movw	r7, #:lower16:clk_put
	movw	r0, #:lower16:.LC9
	movw	r3, #:lower16:printk
	movt	r7, #:upper16:clk_put
	movt	r0, #:upper16:.LC9
	movt	r3, #:upper16:printk
	blx	r3
.L29:
	mov	r0, r5
	blx	r7
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L36:
	movw	r0, #:lower16:.LC7
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC7
	movt	r3, #:upper16:printk
	movw	r7, #:lower16:clk_put
	blx	r3
	movt	r7, #:upper16:clk_put
	mov	r0, r4
	blx	r7
.L31:
	mov	r0, r6
	blx	r7
	b	.L29
.L35:
	movw	r0, #:lower16:.LC11
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC11
	movt	r3, #:upper16:printk
	movw	r7, #:lower16:clk_put
	blx	r3
	movt	r7, #:upper16:clk_put
	b	.L31
	.fnend
	.size	s3cfb_mdnie_pwm_clk_on, .-s3cfb_mdnie_pwm_clk_on
	.global	__aeabi_uidiv
	.global	__aeabi_uidivmod
	.align	2
	.global	get_clk_rate
	.type	get_clk_rate, %function
get_clk_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r3, #:lower16:clk_get_rate
	ldr	r2, [r0, #92]
	movt	r3, #:upper16:clk_get_rate
	.pad #12
	sub	sp, sp, #12
	mov	r10, r0
	mov	r0, r1
	movw	r7, #:lower16:__aeabi_uidiv
	ldr	r4, [r2, #52]
	movt	r7, #:upper16:__aeabi_uidiv
	blx	r3
	mov	r5, r0
	ldr	r1, [r4, #36]
	ldr	fp, [r4, #40]
	ldr	r2, [r4, #44]
	ldr	r3, [r4, #4]
	ldr	r6, [r4, #24]
	add	fp, fp, r1
	add	fp, fp, r2
	ldr	r1, [r4, #48]
	ldr	r8, [r4, #56]
	add	fp, fp, r3
	ldr	r2, [r4, #64]
	ldr	r3, [r4, #8]
	mul	r6, r6, fp
	add	r8, r8, r1
	add	r8, r8, r2
	add	r8, r8, r3
	mul	r6, r8, r6
	cmp	r6, #0
	moveq	r6, r0
	add	r0, r0, r6, lsr #1
	mov	r1, r6
	blx	r7
	ldr	r3, [r4, #28]
	mov	r9, r0
	cmp	r3, #0
	moveq	r4, r0
	beq	.L39
	mul	fp, r3, fp
	mul	r1, fp, r8
	add	r0, r5, r1, lsr #1
	blx	r7
	movw	r3, #:lower16:gcd
	mov	r1, r0
	movt	r3, #:upper16:gcd
	mov	r0, r9
	blx	r3
	mov	r1, r0
	mov	r0, r9
	blx	r7
	mov	r4, r0
.L39:
	cmp	r4, #0
	add	r10, r10, #8
	beq	.L57
	cmp	r4, #16
	bhi	.L43
.L44:
	mov	r1, r4
	mov	r0, r5
	blx	r7
	movw	r8, #:lower16:__aeabi_uidivmod
	mov	r7, r0
	mov	r1, r7
	mov	r0, r5
	movt	r8, #:upper16:__aeabi_uidivmod
	movw	fp, #:lower16:__aeabi_uidiv
	blx	r8
	cmp	r1, #0
	movt	fp, #:upper16:__aeabi_uidiv
	beq	.L42
	cmp	r4, #1
	beq	.L58
	sub	r4, r4, #1
	mov	r0, r5
	mov	r1, r4
	blx	fp
	mov	r7, r0
	mov	r0, r5
	mov	r1, r7
	blx	r8
	cmp	r1, #0
	subeq	r7, r7, #1
.L42:
	movw	r1, #:lower16:.LC15
	movw	ip, #:lower16:_dev_info
	str	r4, [sp]
	mov	r0, r10
	str	r7, [sp, #4]
	mov	r2, r6
	mov	r3, r9
	movt	r1, #:upper16:.LC15
	movt	ip, #:upper16:_dev_info
	blx	ip
	mov	r0, r7
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L57:
	movw	r1, #:lower16:.LC13
	movw	r3, #:lower16:dev_err
	mov	r2, r4
	mov	r0, r10
	movt	r1, #:upper16:.LC13
	movt	r3, #:upper16:dev_err
	blx	r3
.L41:
	mov	r7, r5
	mov	r4, #1
	b	.L42
.L43:
	movw	r1, #:lower16:.LC14
	movw	r3, #:lower16:dev_err
	mov	r0, r10
	movt	r1, #:upper16:.LC14
	movt	r3, #:upper16:dev_err
	mov	r2, r4
	blx	r3
.L46:
	tst	r4, #1
	beq	.L45
	add	r4, r4, #1
	cmp	r4, #2
	bhi	.L46
	mov	r4, #0
.L45:
	mov	r4, r4, lsr #1
	cmp	r4, #16
	movcs	r4, #16
	b	.L44
.L58:
	mov	r5, r7
	b	.L41
	.fnend
	.size	get_clk_rate, .-get_clk_rate
	.align	2
	.global	s3cfb_clk_on
	.type	s3cfb_clk_on, %function
s3cfb_clk_on:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	sub	sp, sp, #12
	ldr	r3, [r0, #92]
	add	r7, r0, #8
	movw	r5, #:lower16:clk_get
	mov	r9, r0
	str	r1, [sp, #4]
	movw	r1, #:lower16:.LC16
	mov	r0, r7
	movt	r1, #:upper16:.LC16
	movt	r5, #:upper16:clk_get
	ldr	fp, [r3, #52]
	blx	r5
	cmn	r0, #4096
	mov	r10, r0
	bhi	.L75
	movw	r8, #:lower16:clk_enable
	movt	r8, #:upper16:clk_enable
	blx	r8
	cmp	r0, #0
	blt	.L76
	movw	r6, #:lower16:clk_put
	mov	r0, r10
	movt	r6, #:upper16:clk_put
	blx	r6
	movw	r1, #:lower16:.LC19
	mov	r0, r7
	movt	r1, #:upper16:.LC19
	blx	r5
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L77
	movw	r1, #:lower16:.LC6
	mov	r0, r7
	movt	r1, #:upper16:.LC6
	blx	r5
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L78
	movw	r3, #:lower16:clk_set_parent
	mov	r0, r4
	movt	r3, #:upper16:clk_set_parent
	mov	r1, r5
	blx	r3
	cmp	r0, #0
	blt	.L79
	ldr	r3, [fp, #32]
	cmp	r3, #0
	movne	r9, r3
	beq	.L80
.L70:
	movw	r3, #:lower16:clk_set_rate
	mov	r0, r4
	movt	r3, #:upper16:clk_set_rate
	mov	r1, r9
	blx	r3
	cmp	r0, #0
	blt	.L81
	mov	r0, r5
	blx	r6
	mov	r0, r4
	blx	r8
	cmp	r0, #0
	blt	.L82
	ldr	r3, [sp, #4]
	mov	r0, #1
	str	r4, [r3]
	bl	s3cfb_mipi_clk_enable
	mov	r0, r9
	bl	s3cfb_mdnie_clk_on
	ldr	r3, [r4, #80]
	mov	r0, r4
	movw	r2, #:lower16:clk_get_rate
	movt	r2, #:upper16:clk_get_rate
	ldr	r4, [r3]
	blx	r2
	movw	r1, #:lower16:.LC25
	movw	ip, #:lower16:_dev_info
	mov	r2, r0
	mov	r3, r4
	mov	r0, r7
	movt	r1, #:upper16:.LC25
	movt	ip, #:upper16:_dev_info
	blx	ip
	mov	r0, #0
.L73:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L80:
	mov	r0, r9
	mov	r1, r5
	bl	get_clk_rate
	subs	r9, r0, #0
	moveq	r3, #2048
	movne	r3, r9
	movteq	r3, 12207
	moveq	r9, r3
	str	r3, [fp, #32]
	b	.L70
.L76:
	movw	r6, #:lower16:clk_put
	movw	r1, #:lower16:.LC18
	movw	r3, #:lower16:dev_err
	movt	r6, #:upper16:clk_put
	mov	r0, r7
	movt	r1, #:upper16:.LC18
	movt	r3, #:upper16:dev_err
	blx	r3
.L61:
	mov	r0, r10
	blx	r6
	mvn	r0, #21
	b	.L73
.L81:
	movw	r1, #:lower16:.LC23
	movw	r3, #:lower16:dev_err
	mov	r0, r7
	movt	r1, #:upper16:.LC23
	movt	r3, #:upper16:dev_err
	blx	r3
.L66:
	mov	r0, r5
	blx	r6
.L64:
	mov	r0, r4
	blx	r6
	b	.L61
.L82:
	movw	r1, #:lower16:.LC24
	movw	r3, #:lower16:dev_err
	mov	r0, r7
	movt	r1, #:upper16:.LC24
	movt	r3, #:upper16:dev_err
	blx	r3
	b	.L66
.L79:
	movw	r1, #:lower16:.LC22
	movw	r3, #:lower16:dev_err
	mov	r0, r7
	movt	r1, #:upper16:.LC22
	movt	r3, #:upper16:dev_err
	blx	r3
	b	.L66
.L75:
	movw	r1, #:lower16:.LC17
	movw	r3, #:lower16:dev_err
	mov	r0, r7
	movt	r1, #:upper16:.LC17
	movt	r3, #:upper16:dev_err
	movw	r6, #:lower16:clk_put
	blx	r3
	movt	r6, #:upper16:clk_put
	b	.L61
.L78:
	movw	r1, #:lower16:.LC21
	movw	r3, #:lower16:dev_err
	mov	r0, r7
	movt	r1, #:upper16:.LC21
	movt	r3, #:upper16:dev_err
	blx	r3
	b	.L66
.L77:
	movw	r1, #:lower16:.LC20
	movw	r3, #:lower16:dev_err
	mov	r0, r7
	movt	r1, #:upper16:.LC20
	movt	r3, #:upper16:dev_err
	blx	r3
	b	.L64
	.fnend
	.size	s3cfb_clk_on, .-s3cfb_clk_on
	.align	2
	.global	s3cfb_mdnie_clk_off
	.type	s3cfb_mdnie_clk_off, %function
s3cfb_mdnie_clk_off:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r1, #:lower16:.LC2
	movw	r4, #:lower16:clk_get
	movt	r1, #:upper16:.LC2
	movt	r4, #:upper16:clk_get
	mov	r0, #0
	blx	r4
	cmn	r0, #4096
	mov	r7, r0
	bhi	.L87
	movw	r6, #:lower16:clk_disable
	movw	r5, #:lower16:clk_put
	movt	r6, #:upper16:clk_disable
	movt	r5, #:upper16:clk_put
	blx	r6
	mov	r0, r7
	blx	r5
	movw	r1, #:lower16:.LC4
	mov	r0, #0
	movt	r1, #:upper16:.LC4
	blx	r4
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L88
.L86:
	mov	r0, r4
	blx	r6
	mov	r0, r4
	blx	r5
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L87:
	movw	r0, #:lower16:.LC26
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC26
	blx	r3
	movw	r3, #:lower16:clk_put
	mov	r0, r7
	movt	r3, #:upper16:clk_put
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L88:
	movw	r0, #:lower16:.LC5
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC5
	blx	r3
	b	.L86
	.fnend
	.size	s3cfb_mdnie_clk_off, .-s3cfb_mdnie_clk_off
	.align	2
	.global	s3cfb_mdnie_pwm_clk_off
	.type	s3cfb_mdnie_pwm_clk_off, %function
s3cfb_mdnie_pwm_clk_off:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:.LC8
	movw	r3, #:lower16:clk_get
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r1, #:upper16:.LC8
	movt	r3, #:upper16:clk_get
	mov	r0, #0
	blx	r3
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L91
.L90:
	movw	r3, #:lower16:clk_disable
	mov	r0, r4
	movt	r3, #:upper16:clk_disable
	blx	r3
	movw	r3, #:lower16:clk_put
	mov	r0, r4
	movt	r3, #:upper16:clk_put
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
.L91:
	movw	r0, #:lower16:.LC9
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC9
	blx	r3
	b	.L90
	.fnend
	.size	s3cfb_mdnie_pwm_clk_off, .-s3cfb_mdnie_pwm_clk_off
	.align	2
	.global	s3cfb_clk_off
	.type	s3cfb_clk_off, %function
s3cfb_clk_off:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r6, r1
	movw	r3, #:lower16:clk_get
	movw	r1, #:lower16:.LC16
	add	r0, r0, #8
	movt	r1, #:upper16:.LC16
	movt	r3, #:upper16:clk_get
	blx	r3
	cmn	r0, #4096
	mov	r7, r0
	bhi	.L95
	movw	r5, #:lower16:clk_disable
	movw	r4, #:lower16:clk_put
	movt	r5, #:upper16:clk_disable
	movt	r4, #:upper16:clk_put
	blx	r5
	mov	r0, r7
	mov	r7, #0
	blx	r4
	ldr	r0, [r6]
	blx	r5
	ldr	r0, [r6]
	blx	r4
	str	r7, [r6]
	mov	r0, r7
	bl	s3cfb_mipi_clk_enable
	bl	s3cfb_mdnie_clk_off
	bl	s3cfb_mdnie_pwm_clk_off
	mov	r0, r7
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L95:
	movw	r0, #:lower16:.LC26
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC26
	blx	r3
	movw	r3, #:lower16:clk_put
	mov	r0, r7
	movt	r3, #:upper16:clk_put
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	s3cfb_clk_off, .-s3cfb_clk_off
	.align	2
	.global	s3cfb_get_clk_name
	.type	s3cfb_get_clk_name, %function
s3cfb_get_clk_name:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LC19
	mov	r2, r0
	movt	r3, #:upper16:.LC19
	ldmia	r3!, {r0, r1}
	ldrh	r3, [r3]	@ unaligned
	str	r0, [r2]	@ unaligned
	str	r1, [r2, #4]	@ unaligned
	strh	r3, [r2, #8]	@ unaligned
	bx	lr
	.fnend
	.size	s3cfb_get_clk_name, .-s3cfb_get_clk_name
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"dsim0\000"
	.space	2
.LC1:
	.ascii	"<3>failed to get ip clk for dsim0\012\000"
	.space	1
.LC2:
	.ascii	"mdnie0\000"
	.space	1
.LC3:
	.ascii	"<3>failed to get ip clk for mdnie0\012\000"
.LC4:
	.ascii	"sclk_mdnie\000"
	.space	1
.LC5:
	.ascii	"<3>failed to get sclk for mdnie\012\000"
	.space	3
.LC6:
	.ascii	"mout_mpll_user\000"
	.space	1
.LC7:
	.ascii	"<3>failed to get mout_mpll\012\000"
.LC8:
	.ascii	"sclk_mdnie_pwm\000"
	.space	1
.LC9:
	.ascii	"<3>failed to get sclk for mdnie_pwm\012\000"
	.space	3
.LC10:
	.ascii	"sclk_mdnie_pwm_pre\000"
	.space	1
.LC11:
	.ascii	"<3>failed to get sclk for mdnie_pwm_pre\012\000"
	.space	3
.LC12:
	.ascii	"<6>set mdnie_pwm sclk rate to %d\012\000"
	.space	2
.LC13:
	.ascii	"div(%d) should be non-zero\012\000"
.LC14:
	.ascii	"div(%d) max should be 16\012\000"
	.space	2
.LC15:
	.ascii	"vclk=%d, div=%d(%d), rate=%d\012\000"
	.space	2
.LC16:
	.ascii	"lcd\000"
.LC17:
	.ascii	"failed to get operation clk for fimd\012\000"
	.space	2
.LC18:
	.ascii	"failed to clk_enable of lcd clk for fimd\012\000"
	.space	2
.LC19:
	.ascii	"sclk_fimd\000"
	.space	2
.LC20:
	.ascii	"failed to get sclk for fimd\012\000"
	.space	3
.LC21:
	.ascii	"failed to get mout_mpll for fimd\012\000"
	.space	2
.LC22:
	.ascii	"failed to clk_set_parent for fimd\012\000"
	.space	1
.LC23:
	.ascii	"failed to clk_set_rate of sclk for fimd\012\000"
	.space	3
.LC24:
	.ascii	"failed to clk_enable of sclk for fimd\012\000"
	.space	1
.LC25:
	.ascii	"fimd sclk rate %ld, clkdiv 0x%x\012\000"
	.space	3
.LC26:
	.ascii	"<3>failed to get ip clk for fimd0\012\000"
	.ident	"GCC: (GNU) 4.8"
