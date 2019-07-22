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
	.file	"midas-camera.c"

	.text
	.align	2
	.type	s5k6a3_get_clk_name, %function
s5k6a3_get_clk_name:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r1, #:lower16:system_rev
	movw	r2, #:lower16:.LC1
	movt	r1, #:upper16:system_rev
	movw	r3, #:lower16:.LC0
	ldr	r0, [r1]
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:.LC0
	cmp	r0, #8
	movhi	r0, r2
	movls	r0, r3
	bx	lr
	.fnend
	.size	s5k6a3_get_clk_name, .-s5k6a3_get_clk_name
	.align	2
	.type	s5c73m3_is_vdd_core_set, %function
s5c73m3_is_vdd_core_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldrb	r0, [r3]	@ zero_extendqisi2
	bx	lr
	.fnend
	.size	s5c73m3_is_vdd_core_set, .-s5c73m3_is_vdd_core_set
	.align	2
	.type	s5c73m3_get_i2c_busnum, %function
s5c73m3_get_i2c_busnum:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	s5c73m3_get_i2c_busnum, .-s5c73m3_get_i2c_busnum
	.align	2
	.type	s5c73m3_get_clk_name, %function
s5c73m3_get_clk_name:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r0, #:lower16:.LC0
	movt	r0, #:upper16:.LC0
	bx	lr
	.fnend
	.size	s5c73m3_get_clk_name, .-s5c73m3_get_clk_name
	.align	2
	.type	s5c73m3_set_vdd_core, %function
s5c73m3_set_vdd_core:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	ip, #:lower16:.LANCHOR0
	mov	r4, r0
	movw	lr, #:lower16:.LANCHOR1
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LANCHOR2
	movw	r3, #:lower16:printk
	movt	lr, #:upper16:.LANCHOR1
	movt	ip, #:upper16:.LANCHOR0
	mov	r5, #1
	mov	r2, r4
	movt	r1, #:upper16:.LANCHOR2
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC2
	str	r4, [lr]
	strb	r5, [ip]
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	s5c73m3_set_vdd_core, .-s5c73m3_set_vdd_core
	.align	2
	.type	s5c73m3_gpio_free, %function
s5c73m3_gpio_free:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r4, #:lower16:gpio_free
	movt	r4, #:upper16:gpio_free
	mov	r0, #250
	blx	r4
	mov	r0, #59
	blx	r4
	mov	r0, #251
	blx	r4
	mov	r0, #253
	blx	r4
	mov	r0, #252
	blx	r4
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	s5c73m3_gpio_free, .-s5c73m3_gpio_free
	.align	2
	.type	s5k6a3_gpio_request, %function
s5k6a3_gpio_request:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r1, #:lower16:.LC3
	movw	r4, #:lower16:gpio_request
	movt	r1, #:upper16:.LC3
	movt	r4, #:upper16:gpio_request
	mov	r0, #251
	blx	r4
	subs	r5, r0, #0
	bne	.L17
	movw	r3, #:lower16:system_rev
	movt	r3, #:upper16:system_rev
	ldr	r3, [r3]
	cmp	r3, #8
	movwls	r1, #:lower16:.LC5
	movwhi	r1, #:lower16:.LC6
	movls	r0, #246
	movtls	r1, #:upper16:.LC5
	movhi	r0, #268
	movthi	r1, #:upper16:.LC6
	blx	r4
	cmp	r0, #0
	mov	r5, r0
	bne	.L18
	movw	r1, #:lower16:.LC8
	mov	r0, #264
	movt	r1, #:upper16:.LC8
	blx	r4
	subs	r4, r0, #0
	bne	.L19
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, pc}
.L17:
	movw	r0, #:lower16:.LC4
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC4
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, pc}
.L19:
	movw	r0, #:lower16:.LC9
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC9
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, pc}
.L18:
	movw	r0, #:lower16:.LC7
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC7
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	s5k6a3_gpio_request, .-s5k6a3_gpio_request
	.align	2
	.type	s5c73m3_gpio_request, %function
s5c73m3_gpio_request:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r1, #:lower16:.LC3
	movw	r4, #:lower16:gpio_request
	movt	r1, #:upper16:.LC3
	movt	r4, #:upper16:gpio_request
	mov	r0, #250
	blx	r4
	subs	r5, r0, #0
	bne	.L27
	movw	r1, #:lower16:.LC11
	mov	r0, #59
	movt	r1, #:upper16:.LC11
	blx	r4
	subs	r5, r0, #0
	bne	.L28
	movw	r1, #:lower16:.LC3
	mov	r0, #251
	movt	r1, #:upper16:.LC3
	blx	r4
	subs	r5, r0, #0
	bne	.L29
	movw	r1, #:lower16:.LC3
	mov	r0, #253
	movt	r1, #:upper16:.LC3
	blx	r4
	subs	r5, r0, #0
	bne	.L30
	movw	r1, #:lower16:.LC3
	mov	r0, #252
	movt	r1, #:upper16:.LC3
	blx	r4
	subs	r4, r0, #0
	bne	.L31
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, pc}
.L27:
	movw	r0, #:lower16:.LC10
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC10
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, pc}
.L31:
	movw	r0, #:lower16:.LC14
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC14
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, pc}
.L30:
	movw	r0, #:lower16:.LC13
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC13
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, pc}
.L29:
	movw	r0, #:lower16:.LC4
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC4
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, pc}
.L28:
	movw	r0, #:lower16:.LC12
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC12
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	s5c73m3_gpio_request, .-s5c73m3_gpio_request
	.align	2
	.type	s5c73m3_is_isp_reset, %function
s5c73m3_is_isp_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:.LC11
	movw	r3, #:lower16:gpio_request
	stmfd	sp!, {r4, r5, lr}
	.save {r4, r5, lr}
	movt	r1, #:upper16:.LC11
	.pad #12
	sub	sp, sp, #12
	movt	r3, #:upper16:gpio_request
	mov	r0, #59
	blx	r3
	subs	r1, r0, #0
	bne	.L37
	movw	r4, #:lower16:gpio_direction_output
	mov	r0, #59
	movt	r4, #:upper16:gpio_direction_output
	blx	r4
	subs	r5, r0, #0
	blt	.L38
	movw	r0, #9956
	movw	r5, #:lower16:__const_udelay
	movt	r0, 49
	movt	r5, #:upper16:__const_udelay
	blx	r5
	mov	r0, #59
	mov	r1, #1
	blx	r4
	subs	r4, r0, #0
	blt	.L39
	movw	r0, #9956
	movt	r0, 49
	blx	r5
	movw	r3, #:lower16:gpio_free
	mov	r0, #59
	movt	r3, #:upper16:gpio_free
	blx	r3
	mov	r0, r4
.L34:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
.L37:
	movw	r0, #:lower16:.LC12
	movw	r3, #:lower16:printk
	str	r1, [sp, #4]
	movt	r0, #:upper16:.LC12
	movt	r3, #:upper16:printk
	blx	r3
	ldr	r1, [sp, #4]
	mov	r0, r1
	b	.L34
.L39:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC16
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC15
	movt	r1, #:upper16:.LC16
	movt	r3, #:upper16:printk
	mov	r2, r4
	blx	r3
	mov	r0, r4
	b	.L34
.L38:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC16
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC15
	movt	r1, #:upper16:.LC16
	movt	r3, #:upper16:printk
	mov	r2, r5
	blx	r3
	mov	r0, r5
	b	.L34
	.fnend
	.size	s5c73m3_is_isp_reset, .-s5c73m3_is_isp_reset
	.align	2
	.type	camera_class_init, %function
camera_class_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	movw	r1, #:lower16:.LC17
	movw	r3, #:lower16:__class_create
	add	r2, r4, #4
	movt	r1, #:upper16:.LC17
	movt	r3, #:upper16:__class_create
	mov	r0, #0
	blx	r3
	cmn	r0, #4096
	str	r0, [r4, #4]
	bhi	.L43
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
.L43:
	movw	r0, #:lower16:.LC18
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC18
	blx	r3
	ldr	r0, [r4, #4]
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	camera_class_init, .-camera_class_init
	.align	2
	.global	s3c_csis_power
	.type	s3c_csis_power, %function
s3c_csis_power:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	beq	.L45
	movw	r1, #:lower16:.LC19
	movw	r4, #:lower16:regulator_get
	movt	r1, #:upper16:.LC19
	movt	r4, #:upper16:regulator_get
	mov	r0, #0
	blx	r4
	cmn	r0, #4096
	mov	r7, r0
	bhi	.L63
	movw	r6, #:lower16:regulator_enable
	movw	r5, #:lower16:regulator_put
	movt	r6, #:upper16:regulator_enable
	movt	r5, #:upper16:regulator_put
	blx	r6
	mov	r0, r7
	blx	r5
	movw	r1, #:lower16:.LC20
	mov	r0, #0
	movt	r1, #:upper16:.LC20
	blx	r4
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L63
	blx	r6
	mov	r0, r4
	blx	r5
	movw	r0, #:lower16:.LC21
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L65
	movt	r0, #:upper16:.LC21
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L45:
	movw	r1, #:lower16:.LC20
	movw	r4, #:lower16:regulator_get
	movt	r1, #:upper16:.LC20
	movt	r4, #:upper16:regulator_get
	blx	r4
	cmn	r0, #4096
	mov	r8, r0
	bhi	.L63
	movw	r6, #:lower16:regulator_is_enabled
	movt	r6, #:upper16:regulator_is_enabled
	blx	r6
	cmp	r0, #0
	bne	.L61
	movw	r7, #:lower16:printk
	movt	r7, #:upper16:printk
.L48:
	movw	r5, #:lower16:regulator_put
	mov	r0, r8
	movt	r5, #:upper16:regulator_put
	blx	r5
	movw	r1, #:lower16:.LC19
	mov	r0, #0
	movt	r1, #:upper16:.LC19
	blx	r4
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L46
	blx	r6
	cmp	r0, #0
	bne	.L64
.L49:
	mov	r0, r4
	blx	r5
	movw	r0, #:lower16:.LC24
	ldr	r1, .L65
	movt	r0, #:upper16:.LC24
	blx	r7
.L47:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L63:
	movw	r7, #:lower16:printk
	movt	r7, #:upper16:printk
.L46:
	movw	r0, #:lower16:.LC25
	ldr	r1, .L65
	movt	r0, #:upper16:.LC25
	blx	r7
	b	.L47
.L61:
	movw	r0, #:lower16:.LC22
	movw	r7, #:lower16:printk
	movt	r7, #:upper16:printk
	ldr	r1, .L65
	movt	r0, #:upper16:.LC22
	blx	r7
	movw	r3, #:lower16:regulator_disable
	mov	r0, r8
	movt	r3, #:upper16:regulator_disable
	blx	r3
	b	.L48
.L64:
	movw	r0, #:lower16:.LC23
	ldr	r1, .L65
	movt	r0, #:upper16:.LC23
	blx	r7
	movw	r3, #:lower16:regulator_disable
	mov	r0, r4
	movt	r3, #:upper16:regulator_disable
	blx	r3
	b	.L49
.L66:
	.align	2
.L65:
	.word	.LANCHOR2+24
	.fnend
	.size	s3c_csis_power, .-s3c_csis_power
	.align	2
	.type	s5k6a3_power, %function
s5k6a3_power:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	subs	r7, r0, #0
	movw	r6, #:lower16:printk
	movw	r0, #:lower16:.LC26
	movt	r0, #:upper16:.LC26
	movt	r6, #:upper16:printk
	beq	.L68
	ldr	r1, .L101
	movw	r4, #:lower16:gpio_direction_output
	blx	r6
	bl	s5k6a3_gpio_request
	movt	r4, #:upper16:gpio_direction_output
	mov	r0, #251
	mov	r1, #1
	blx	r4
	subs	r8, r0, #0
	blt	.L93
	movw	r0, #34024
	movw	r3, #:lower16:__const_udelay
	movw	r5, #:lower16:system_rev
	movt	r3, #:upper16:__const_udelay
	movt	r0, 491
	movt	r5, #:upper16:system_rev
	blx	r3
	ldr	r3, [r5]
	cmp	r3, #8
	movw	r3, #:lower16:s3c_gpio_cfgpin
	bhi	.L71
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #13
	mov	r0, #246
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #0
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r8, r0
	mov	r0, #246
	blx	r3
	movw	r3, #:lower16:s5p_gpio_set_drvstr
	mov	r0, #246
	movt	r3, #:upper16:s5p_gpio_set_drvstr
	mov	r1, #2
	blx	r3
.L72:
	cmp	r8, #0
	blt	.L94
	mov	r0, #264
	mov	r1, #1
	blx	r4
	subs	r8, r0, #0
	blt	.L95
	movw	r1, #:lower16:.LC30
	movw	r3, #:lower16:regulator_get
	movt	r1, #:upper16:.LC30
	movt	r3, #:upper16:regulator_get
	mov	r0, #0
	blx	r3
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L90
	movw	r3, #:lower16:regulator_enable
	movt	r3, #:upper16:regulator_enable
	blx	r3
	movw	r3, #:lower16:regulator_put
	mov	r8, r0
	movt	r3, #:upper16:regulator_put
	mov	r0, r4
	blx	r3
	cmp	r8, #0
	blt	.L96
	movw	r4, #:lower16:gpio_free
	mov	r0, #251
	movt	r4, #:upper16:gpio_free
	blx	r4
	mov	r0, #264
	blx	r4
	ldr	r3, [r5]
	cmp	r3, #8
	movls	r0, #246
	movhi	r0, #268
	blx	r4
	cmp	r8, #0
	bne	.L78
	mov	r0, r7
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	s3c_csis_power
.L68:
	ldr	r1, .L101+4
	movw	r4, #:lower16:gpio_direction_output
	blx	r6
	bl	s5k6a3_gpio_request
	movt	r4, #:upper16:gpio_direction_output
	mov	r0, #264
	mov	r1, r7
	blx	r4
	subs	r2, r0, #0
	blt	.L97
	movw	r1, #:lower16:.LC30
	movw	r3, #:lower16:regulator_get
	movt	r1, #:upper16:.LC30
	movt	r3, #:upper16:regulator_get
	mov	r0, r7
	blx	r3
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L79
	movw	r3, #:lower16:regulator_is_enabled
	movt	r3, #:upper16:regulator_is_enabled
	blx	r3
	cmp	r0, #0
	bne	.L98
	movw	r3, #:lower16:regulator_put
	mov	r0, r5
	movt	r3, #:upper16:regulator_put
	blx	r3
.L84:
	mov	r0, #251
	mov	r1, #0
	blx	r4
	subs	r2, r0, #0
	blt	.L99
	movw	r0, #39048
	movw	r3, #:lower16:__const_udelay
	movw	r5, #:lower16:system_rev
	movt	r3, #:upper16:__const_udelay
	movt	r0, 2457
	movt	r5, #:upper16:system_rev
	blx	r3
	ldr	r3, [r5]
	cmp	r3, #8
	movw	r3, #:lower16:s3c_gpio_cfgpin
	bhi	.L86
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #15
	mov	r0, #246
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r4, r0
	mov	r1, #1
	mov	r0, #246
	movt	r3, #:upper16:s3c_gpio_setpull
	blx	r3
.L87:
	cmp	r4, #0
	blt	.L100
.L88:
	movw	r4, #:lower16:gpio_free
	mov	r0, #251
	movt	r4, #:upper16:gpio_free
	blx	r4
	mov	r0, #264
	blx	r4
	ldr	r3, [r5]
	cmp	r3, #8
	movls	r0, #246
	movhi	r0, #268
	blx	r4
.L79:
	mov	r0, r7
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	s3c_csis_power
.L71:
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #12
	mov	r0, #268
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r8, r0
	mov	r1, #0
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #268
	blx	r3
	movw	r3, #:lower16:s5p_gpio_set_drvstr
	mov	r1, #2
	movt	r3, #:upper16:s5p_gpio_set_drvstr
	mov	r0, #268
	blx	r3
	b	.L72
.L86:
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #15
	mov	r0, #268
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r4, r0
	mov	r1, #1
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #268
	blx	r3
	b	.L87
.L98:
	movw	r3, #:lower16:regulator_force_disable
	mov	r0, r5
	movt	r3, #:upper16:regulator_force_disable
	blx	r3
	movw	r3, #:lower16:regulator_put
	mov	r8, r0
	movt	r3, #:upper16:regulator_put
	mov	r0, r5
	blx	r3
	cmp	r8, #0
	bge	.L84
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC33
	mov	r2, r8
	movt	r1, #:upper16:.LC33
	movt	r0, #:upper16:.LC15
	blx	r6
	b	.L84
.L97:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC29
	movt	r1, #:upper16:.LC29
	movt	r0, #:upper16:.LC15
	blx	r6
	b	.L79
.L93:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC27
	movt	r0, #:upper16:.LC15
	movt	r1, #:upper16:.LC27
	mov	r2, r8
	blx	r6
.L78:
.L80:
	movw	r0, #:lower16:.LC32
	ldr	r1, .L101+8
	movt	r0, #:upper16:.LC32
	blx	r6
	mov	r0, r8
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L94:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC28
	movt	r1, #:upper16:.LC28
	mov	r2, r8
	movt	r0, #:upper16:.LC15
	blx	r6
	b	.L78
.L95:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC29
	movt	r1, #:upper16:.LC29
	mov	r2, r8
	movt	r0, #:upper16:.LC15
	blx	r6
	b	.L78
.L90:
	mvn	r8, #18
	b	.L78
.L96:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC31
	movt	r1, #:upper16:.LC31
	mov	r2, r8
	movt	r0, #:upper16:.LC15
	blx	r6
	b	.L78
.L100:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC28
	mov	r2, r4
	movt	r1, #:upper16:.LC28
	movt	r0, #:upper16:.LC15
	blx	r6
	b	.L88
.L99:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC27
	movt	r1, #:upper16:.LC27
	movt	r0, #:upper16:.LC15
	blx	r6
	b	.L79
.L102:
	.align	2
.L101:
	.word	.LANCHOR2+40
	.word	.LANCHOR2+72
	.word	.LANCHOR2+56
	.fnend
	.size	s5k6a3_power, .-s5k6a3_power
	.align	2
	.type	s5c73m3_power, %function
s5c73m3_power:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	cmp	r0, #0
	.pad #20
	sub	sp, sp, #20
	movw	r8, #:lower16:printk
	movt	r8, #:upper16:printk
	str	r0, [sp, #8]
	movw	r0, #:lower16:.LC26
	movt	r0, #:upper16:.LC26
	beq	.L104
	ldr	r1, .L191
	blx	r8
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldrb	r4, [r3]	@ zero_extendqisi2
	cmp	r4, #0
	movwne	r10, #:lower16:.LANCHOR1
	movtne	r10, #:upper16:.LANCHOR1
	beq	.L166
.L105:
	movw	r0, #:lower16:.LC39
	ldr	r1, [r10]
	movt	r0, #:upper16:.LC39
	movw	r6, #:lower16:gpio_direction_output
	blx	r8
	bl	s5c73m3_gpio_request
	movt	r6, #:upper16:gpio_direction_output
	mov	r0, #252
	mov	r1, #1
	movw	r10, #:lower16:.LANCHOR1
	blx	r6
	subs	fp, r0, #0
	movw	r4, #:lower16:printk
	movt	r10, #:upper16:.LANCHOR1
	movt	r4, #:upper16:printk
	blt	.L167
	movw	r1, #:lower16:.LC41
	movw	r7, #:lower16:regulator_get
	movt	r1, #:upper16:.LC41
	movt	r7, #:upper16:regulator_get
	mov	r0, #0
	blx	r7
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L118
	ldr	r1, [r10]
	movw	r2, #:lower16:regulator_enable
	movt	r2, #:upper16:regulator_enable
	movw	r3, #:lower16:regulator_set_voltage
	movt	r3, #:upper16:regulator_set_voltage
	str	r2, [sp, #12]
	mov	r2, r1
	movw	r10, #:lower16:regulator_put
	blx	r3
	mov	r0, r5
	ldr	r3, [sp, #12]
	blx	r3
	movt	r10, #:upper16:regulator_put
	mov	fp, r0
	mov	r0, r5
	blx	r10
	cmp	fp, #0
	blt	.L168
	mov	r0, #251
	mov	r1, #1
	blx	r6
	subs	fp, r0, #0
	blt	.L169
	movw	r1, #:lower16:.LC44
	mov	r0, #0
	movt	r1, #:upper16:.LC44
	blx	r7
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L118
	ldr	r3, [sp, #12]
	blx	r3
	mov	fp, r0
	mov	r0, r5
	blx	r10
	cmp	fp, #0
	movwge	r5, #:lower16:__const_udelay
	movge	r4, #5
	movtge	r5, #:upper16:__const_udelay
	blt	.L170
.L123:
	movw	r0, #12560
	movw	r9, #:lower16:__const_udelay
	movt	r0, 4915
	movt	r9, #:upper16:__const_udelay
	blx	r5
	subs	r4, r4, #1
	bne	.L123
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mov	r0, #246
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #13
	blx	r3
	subs	fp, r0, #0
	blt	.L171
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, r4
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #246
	blx	r3
	movw	r3, #:lower16:s5p_gpio_set_drvstr
	mov	r1, #1
	movt	r3, #:upper16:s5p_gpio_set_drvstr
	mov	r0, #246
	blx	r3
	mov	r0, #253
	mov	r1, #1
	blx	r6
	subs	fp, r0, #0
	blt	.L172
	movw	r0, #25120
	movw	ip, #:lower16:regulator_get
	movt	ip, #:upper16:regulator_get
	movt	r0, 9830
	str	ip, [sp, #4]
	blx	r9
	movw	r1, #:lower16:.LC47
	mov	r0, r4
	movt	r1, #:upper16:.LC47
	blx	r7
	cmn	r0, #4096
	mov	r7, r0
	bhi	.L118
	ldr	r3, [sp, #12]
	blx	r3
	mov	fp, r0
	mov	r0, r7
	blx	r10
	cmp	fp, #0
	movw	r10, #:lower16:regulator_enable
	movw	r7, #:lower16:regulator_put
	movt	r10, #:upper16:regulator_enable
	movt	r7, #:upper16:regulator_put
	ldr	ip, [sp, #4]
	blt	.L173
	movw	r1, #:lower16:.LC49
	mov	r0, r4
	movt	r1, #:upper16:.LC49
	blx	ip
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L118
	blx	r10
	mov	fp, r0
	mov	r0, r4
	blx	r7
	cmp	fp, #0
	movge	r7, #5
	blt	.L174
.L129:
	movw	r0, #12560
	movw	r4, #:lower16:__const_udelay
	movt	r0, 4915
	movt	r4, #:upper16:__const_udelay
	blx	r5
	subs	r7, r7, #1
	bne	.L129
	mov	r0, #250
	mov	r1, #1
	blx	r6
	subs	fp, r0, #0
	movw	r5, #:lower16:gpio_direction_output
	movt	r5, #:upper16:gpio_direction_output
	blt	.L175
	movw	r0, #34024
	movt	r0, 491
	blx	r4
	mov	r0, #59
	mov	r1, #1
	blx	r5
	subs	fp, r0, #0
	blt	.L176
	movw	r0, #9956
	movt	r0, 49
	blx	r4
	bl	s5c73m3_gpio_free
	cmp	fp, #0
	bne	.L155
.L133:
	ldr	r0, [sp, #8]
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	s3c_csis_power
.L104:
	ldr	r1, .L191+4
	movw	r6, #:lower16:gpio_direction_output
	blx	r8
	bl	s5c73m3_gpio_request
	movt	r6, #:upper16:gpio_direction_output
	mov	r0, #250
	ldr	r1, [sp, #8]
	blx	r6
	subs	r2, r0, #0
	blt	.L177
	movw	r0, #54420
	movw	r5, #:lower16:__const_udelay
	movt	r0, 9
	movt	r5, #:upper16:__const_udelay
	blx	r5
	mov	r0, #59
	ldr	r1, [sp, #8]
	blx	r6
	subs	r2, r0, #0
	blt	.L178
	mov	r0, #253
	ldr	r1, [sp, #8]
	blx	r6
	subs	fp, r0, #0
	blt	.L179
	movw	r1, #:lower16:.LC49
	movw	r7, #:lower16:regulator_get
	movt	r1, #:upper16:.LC49
	movt	r7, #:upper16:regulator_get
	ldr	r0, [sp, #8]
	blx	r7
	cmn	r0, #4096
	bhi	.L133
	movw	r4, #:lower16:regulator_is_enabled
	str	r0, [sp, #4]
	movt	r4, #:upper16:regulator_is_enabled
	blx	r4
	cmp	r0, #0
	ldr	r3, [sp, #4]
	bne	.L180
	movw	r10, #:lower16:regulator_put
	mov	r0, r3
	movt	r10, #:upper16:regulator_put
	blx	r10
.L139:
	movw	r0, #9956
	movt	r0, 49
	blx	r5
	movw	r1, #:lower16:.LC47
	mov	r0, #0
	movt	r1, #:upper16:.LC47
	blx	r7
	cmn	r0, #4096
	bhi	.L133
	str	r0, [sp, #4]
	blx	r4
	cmp	r0, #0
	ldr	r3, [sp, #4]
	bne	.L181
.L140:
	mov	r0, r3
	blx	r10
	cmp	fp, #0
	blt	.L182
.L141:
	movw	r1, #:lower16:.LC44
	mov	r0, #0
	movt	r1, #:upper16:.LC44
	blx	r7
	cmn	r0, #4096
	bhi	.L133
	str	r0, [sp, #4]
	blx	r4
	cmp	r0, #0
	ldr	r3, [sp, #4]
	bne	.L183
.L142:
	mov	r0, r3
	blx	r10
	cmp	fp, #0
	blt	.L184
.L143:
	movw	r0, #39048
	movt	r0, 2457
	blx	r5
	mov	r0, #251
	mov	r1, #0
	blx	r6
	subs	r2, r0, #0
	blt	.L185
	movw	r1, #:lower16:.LC41
	mov	r0, #0
	movt	r1, #:upper16:.LC41
	blx	r7
	cmn	r0, #4096
	mov	r7, r0
	bhi	.L133
	blx	r4
	cmp	r0, #0
	bne	.L186
	mov	r0, r7
	blx	r10
.L146:
	mov	r0, #252
	mov	r1, #0
	blx	r6
	subs	r2, r0, #0
	movge	r4, #30
	blt	.L187
.L149:
	movw	r0, #12560
	movt	r0, 4915
	blx	r5
	subs	r4, r4, #1
	bne	.L149
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #15
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mov	r0, #246
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r4, r0
	mov	r1, #1
	mov	r0, #246
	movt	r3, #:upper16:s3c_gpio_setpull
	blx	r3
	cmp	r4, #0
	blt	.L188
.L150:
	bl	s5c73m3_gpio_free
	ldr	r0, [sp, #8]
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	s3c_csis_power
.L166:
	mov	r2, sp
	movw	r0, #:lower16:.LC34
	bic	ip, r2, #8128
	movw	r3, #:lower16:filp_open
	bic	ip, ip, #63
	movt	r0, #:upper16:.LC34
	ldr	r6, [ip, #8]
	movt	r3, #:upper16:filp_open
	mov	r1, r4
	mov	r2, r4
	str	r4, [ip, #8]
	blx	r3
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L189
	movw	r3, #:lower16:vmalloc
	mov	r0, #10
	movt	r3, #:upper16:vmalloc
	blx	r3
	subs	r7, r0, #0
	beq	.L190
	movw	ip, #:lower16:vfs_read
	mov	r1, r7
	mov	r0, r5
	movt	ip, #:upper16:vfs_read
	mov	r2, #10
	add	r3, r5, #40
	blx	ip
	cmp	r0, #10
	mov	r1, r0
	bne	.L109
	ldrb	r3, [r7]	@ zero_extendqisi2
	sub	r2, r3, #48
	uxtb	r2, r2
	cmp	r2, #9
	movls	r2, r7
	bhi	.L165
.L113:
	add	r4, r4, r4, asl #2
	add	r4, r3, r4, asl #1
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	sub	r4, r4, #48
	sub	ip, r3, #48
	uxtb	ip, ip
	cmp	ip, #9
	bls	.L113
	mov	r2, #1424
	movw	r3, #16960
	movt	r2, 16
	movt	r3, 15
	cmp	r4, r3
	cmpne	r4, r2
	beq	.L114
	movw	r2, #35888
	movw	r3, #51424
	movt	r2, 17
	movt	r3, 16
	cmp	r4, r3
	cmpne	r4, r2
	beq	.L114
.L165:
	movw	r10, #:lower16:.LANCHOR1
	movt	r10, #:upper16:.LANCHOR1
.L111:
	movw	r3, #:lower16:vfree
	mov	r0, r7
	movt	r3, #:upper16:vfree
	blx	r3
.L108:
	cmp	r5, #0
	beq	.L115
	mov	r3, sp
	mov	r0, r5
	bic	r2, r3, #8128
	movw	r3, #:lower16:filp_close
	bic	r2, r2, #63
	movt	r3, #:upper16:filp_close
	ldr	r2, [r2, #12]
	ldr	r1, [r2, #620]
	blx	r3
.L115:
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	str	r6, [r3, #8]
	b	.L105
.L180:
	movw	r2, #:lower16:regulator_force_disable
	mov	r0, r3
	movt	r2, #:upper16:regulator_force_disable
	movw	r10, #:lower16:regulator_put
	blx	r2
	ldr	r3, [sp, #4]
	mov	fp, r0
	movt	r10, #:upper16:regulator_put
	mov	r0, r3
	blx	r10
	cmp	fp, #0
	bge	.L139
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC52
	movt	r1, #:upper16:.LC52
	mov	r2, fp
	movt	r0, #:upper16:.LC15
	blx	r8
	b	.L139
.L186:
	movw	r3, #:lower16:regulator_force_disable
	mov	r0, r7
	movt	r3, #:upper16:regulator_force_disable
	blx	r3
	mov	r4, r0
	mov	r0, r7
	blx	r10
	cmp	r4, #0
	bge	.L146
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC55
	mov	r2, r4
	movt	r1, #:upper16:.LC55
	movt	r0, #:upper16:.LC15
	blx	r8
	b	.L146
.L183:
	movw	r2, #:lower16:regulator_force_disable
	mov	r0, r3
	movt	r2, #:upper16:regulator_force_disable
	blx	r2
	mov	fp, r0
	ldr	r3, [sp, #4]
	b	.L142
.L181:
	movw	r2, #:lower16:regulator_force_disable
	mov	r0, r3
	movt	r2, #:upper16:regulator_force_disable
	blx	r2
	mov	fp, r0
	ldr	r3, [sp, #4]
	b	.L140
.L189:
	movw	r0, #:lower16:.LC35
	mov	r1, r5
	movt	r0, #:upper16:.LC35
	movw	r10, #:lower16:.LANCHOR1
	blx	r8
	mov	r2, sp
	movt	r10, #:upper16:.LANCHOR1
	bic	r3, r2, #8128
	bic	r3, r3, #63
	str	r6, [r3, #8]
	b	.L105
.L167:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC40
	movt	r0, #:upper16:.LC15
	movt	r1, #:upper16:.LC40
	mov	r2, fp
	blx	r4
.L155:
	mov	r0, fp
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L187:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC56
	movt	r1, #:upper16:.LC56
	movt	r0, #:upper16:.LC15
	blx	r8
	b	.L133
.L171:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC28
	movt	r1, #:upper16:.LC28
	mov	r2, fp
	movt	r0, #:upper16:.LC15
	blx	r8
	b	.L155
.L172:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC46
	movt	r1, #:upper16:.LC46
	mov	r2, fp
	movt	r0, #:upper16:.LC15
	blx	r8
	b	.L155
.L175:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC51
	movt	r1, #:upper16:.LC51
	mov	r2, fp
	movt	r0, #:upper16:.LC15
	blx	r8
	b	.L155
.L176:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC16
	movt	r1, #:upper16:.LC16
	mov	r2, fp
	movt	r0, #:upper16:.LC15
	blx	r8
	b	.L155
.L173:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC48
	movt	r1, #:upper16:.LC48
	mov	r2, fp
	movt	r0, #:upper16:.LC15
	blx	r8
	b	.L155
.L174:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC50
	movt	r1, #:upper16:.LC50
	mov	r2, fp
	movt	r0, #:upper16:.LC15
	blx	r8
	b	.L155
.L188:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC28
	mov	r2, r4
	movt	r1, #:upper16:.LC28
	movt	r0, #:upper16:.LC15
	blx	r8
	b	.L150
.L185:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC27
	movt	r1, #:upper16:.LC27
	movt	r0, #:upper16:.LC15
	blx	r8
	b	.L133
.L170:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC45
	movt	r1, #:upper16:.LC45
	mov	r2, fp
	movt	r0, #:upper16:.LC15
	blx	r4
	b	.L155
.L179:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC46
	mov	r2, fp
	movt	r1, #:upper16:.LC46
	movt	r0, #:upper16:.LC15
	blx	r8
	b	.L133
.L178:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC16
	movt	r1, #:upper16:.LC16
	movt	r0, #:upper16:.LC15
	blx	r8
	b	.L133
.L182:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC53
	movt	r1, #:upper16:.LC53
	mov	r2, fp
	movt	r0, #:upper16:.LC15
	blx	r8
	b	.L141
.L184:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC54
	mov	r2, fp
	movt	r1, #:upper16:.LC54
	movt	r0, #:upper16:.LC15
	blx	r8
	b	.L143
.L177:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC51
	movt	r1, #:upper16:.LC51
	movt	r0, #:upper16:.LC15
	blx	r8
	b	.L133
.L169:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC43
	movt	r1, #:upper16:.LC43
	mov	r2, fp
	movt	r0, #:upper16:.LC15
	blx	r4
	b	.L155
.L168:
	movw	r0, #:lower16:.LC15
	movw	r1, #:lower16:.LC42
	movt	r1, #:upper16:.LC42
	mov	r2, fp
	movt	r0, #:upper16:.LC15
	blx	r4
	b	.L155
.L118:
.L132:
	mvn	fp, #18
	b	.L155
.L114:
	movw	r0, #:lower16:.LC38
	movw	r10, #:lower16:.LANCHOR1
	movt	r0, #:upper16:.LC38
	mov	r1, r4
	movt	r10, #:upper16:.LANCHOR1
	blx	r8
	str	r4, [r10]
	b	.L111
.L109:
	movw	r0, #:lower16:.LC37
	movw	r10, #:lower16:.LANCHOR1
	movt	r0, #:upper16:.LC37
	movt	r10, #:upper16:.LANCHOR1
	blx	r8
	b	.L111
.L190:
	movw	r0, #:lower16:.LC36
	movw	r10, #:lower16:.LANCHOR1
	movt	r0, #:upper16:.LC36
	movt	r10, #:upper16:.LANCHOR1
	blx	r8
	b	.L108
.L192:
	.align	2
.L191:
	.word	.LANCHOR2+92
	.word	.LANCHOR2+112
	.fnend
	.size	s5c73m3_power, .-s5c73m3_power
	.align	2
	.global	midas_camera_init
	.type	midas_camera_init, %function
midas_camera_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	movw	r7, #:lower16:.LANCHOR1
	movt	r7, #:upper16:.LANCHOR1
	movw	r3, #:lower16:s3c_fimc0_set_platdata
	add	r6, r7, #4
	movt	r3, #:upper16:s3c_fimc0_set_platdata
	mov	r0, r6
	ldr	r4, .L194
	blx	r3
	movw	r3, #:lower16:s3c_fimc1_set_platdata
	mov	r0, r6
	movt	r3, #:upper16:s3c_fimc1_set_platdata
	movw	r8, #:lower16:s3c_device_fimc0
	blx	r3
	movw	r3, #:lower16:s3c_fimc2_set_platdata
	mov	r0, #0
	movt	r3, #:upper16:s3c_fimc2_set_platdata
	movt	r8, #:upper16:s3c_device_fimc0
	blx	r3
	movw	r3, #:lower16:s3c_fimc3_set_platdata
	mov	r0, #0
	movt	r3, #:upper16:s3c_fimc3_set_platdata
	movw	r5, #:lower16:exynos_flite1_default_data
	blx	r3
	movw	lr, #:lower16:s3c_device_fimc1
	movw	ip, #:lower16:s3c_device_fimc2
	movw	r1, #:lower16:s3c_device_fimc3
	movw	r2, #:lower16:secmem
	movw	r3, #:lower16:s3c_csis0_set_platdata
	movt	lr, #:upper16:s3c_device_fimc1
	movt	ip, #:upper16:s3c_device_fimc2
	movt	r1, #:upper16:s3c_device_fimc3
	movt	r2, #:upper16:secmem
	movt	r3, #:upper16:s3c_csis0_set_platdata
	mov	r0, #0
	str	r4, [lr, #8]
	str	r4, [ip, #8]
	movw	r6, #:lower16:s3c_set_platdata
	str	r4, [r1, #8]
	movt	r5, #:upper16:exynos_flite1_default_data
	str	r4, [r2, #20]
	movt	r6, #:upper16:s3c_set_platdata
	str	r4, [r8, #8]
	movw	r8, #:lower16:s3c_device_csis0
	blx	r3
	movw	r3, #:lower16:s3c_csis1_set_platdata
	mov	r0, #0
	movt	r3, #:upper16:s3c_csis1_set_platdata
	add	r7, r7, #56
	blx	r3
	movw	r3, #:lower16:exynos_flite0_default_data
	movw	lr, #:lower16:s3c_device_csis1
	movt	r3, #:upper16:exynos_flite0_default_data
	movw	r2, #:lower16:exynos_device_flite0
	mov	ip, #0
	movt	lr, #:upper16:s3c_device_csis1
	mov	r9, #1
	movt	r8, #:upper16:s3c_device_csis0
	mov	r0, r3
	movt	r2, #:upper16:exynos_device_flite0
	mov	r1, #32
	str	r7, [r5]
	str	r9, [r5, #28]
	str	r4, [r8, #8]
	str	r4, [lr, #8]
	str	ip, [r5, #24]
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	blx	r6
	movw	r2, #:lower16:exynos_device_flite1
	mov	r0, r5
	mov	r1, #32
	movt	r2, #:upper16:exynos_device_flite1
	blx	r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L195:
	.align	2
.L194:
	.word	exynos4_device_pd+1808
	.fnend
	.size	midas_camera_init, .-midas_camera_init
	.global	camera_class
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.26639, %object
	.size	__func__.26639, 21
__func__.26639:
	.ascii	"s5c73m3_set_vdd_core\000"
	.space	3
	.type	__func__.26606, %object
	.size	__func__.26606, 15
__func__.26606:
	.ascii	"s3c_csis_power\000"
	.space	1
	.type	__func__.26616, %object
	.size	__func__.26616, 16
__func__.26616:
	.ascii	"s5k6a3_power_on\000"
	.type	__func__.26627, %object
	.size	__func__.26627, 13
__func__.26627:
	.ascii	"s5k6a3_power\000"
	.space	3
	.type	__func__.26622, %object
	.size	__func__.26622, 18
__func__.26622:
	.ascii	"s5k6a3_power_down\000"
	.space	2
	.type	__func__.26673, %object
	.size	__func__.26673, 17
__func__.26673:
	.ascii	"s5c73m3_power_on\000"
	.space	3
	.type	__func__.26687, %object
	.size	__func__.26687, 19
__func__.26687:
	.ascii	"s5c73m3_power_down\000"
	.section	.initcall4.init,"aw",%progbits
	.align	2
	.type	__initcall_camera_class_init4, %object
	.size	__initcall_camera_class_init4, 4
__initcall_camera_class_init4:
	.word	camera_class_init
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	vddCore, %object
	.size	vddCore, 4
vddCore:
	.word	1150000
	.type	fimc_plat, %object
	.size	fimc_plat, 52
fimc_plat:
	.word	3
	.word	s5c73m3
	.word	s5k6a3
	.word	s5k6a3_fd
	.space	16
	.word	81
	.space	16
	.type	s5k6a3, %object
	.size	s5k6a3, 160
s5k6a3:
	.word	3
	.word	1
	.word	43
	.word	0
	.word	1498831189
	.space	16
	.ascii	"xusbxti\000"
	.space	8
	.space	16
	.word	s5k6a3_get_clk_name
	.word	24000000
	.space	4
	.word	1920
	.word	1920
	.word	1080
	.word	0
	.word	0
	.word	1920
	.word	1080
	.word	1
	.word	18
	.word	24
	.space	16
	.word	0
	.space	4
	.word	s5k6a3_power
	.word	1
	.byte	1
	.space	3
	.word	102
	.type	s5c73m3, %object
	.size	s5c73m3, 160
s5c73m3:
	.word	2
	.word	1
	.word	30
	.word	0
	.word	1498831189
	.space	4
	.word	s5c73m3_get_i2c_busnum
	.word	s5c73m3_i2c_info
	.space	4
	.ascii	"xusbxti\000"
	.space	8
	.space	16
	.word	s5c73m3_get_clk_name
	.word	24000000
	.space	4
	.word	1920
	.word	640
	.word	480
	.word	0
	.word	0
	.word	640
	.word	480
	.word	4
	.word	12
	.word	32
	.word	1
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	s5c73m3_power
	.space	12
	.type	s5c73m3_i2c_info, %object
	.size	s5c73m3_i2c_info, 40
s5c73m3_i2c_info:
	.ascii	"S5C73M3\000"
	.space	12
	.space	2
	.short	60
	.word	s5c73m3_plat
	.space	12
	.type	s5c73m3_plat, %object
	.size	s5c73m3_plat, 36
s5c73m3_plat:
	.word	640
	.word	480
	.word	1498831189
	.word	24000000
	.word	1
	.word	s5c73m3_set_vdd_core
	.word	s5c73m3_is_vdd_core_set
	.word	s5c73m3_is_isp_reset
	.word	s5c73m3_power
	.type	s5k6a3_fd, %object
	.size	s5k6a3_fd, 160
s5k6a3_fd:
	.word	3
	.word	1
	.word	43
	.word	0
	.word	1498831189
	.space	16
	.ascii	"xusbxti\000"
	.space	8
	.space	16
	.word	s5k6a3_get_clk_name
	.word	24000000
	.space	4
	.word	1920
	.word	1920
	.word	1080
	.word	0
	.word	0
	.word	1920
	.word	1080
	.word	1
	.word	18
	.word	24
	.space	16
	.word	0
	.space	4
	.word	s5k6a3_power
	.word	1
	.byte	1
	.space	3
	.word	200
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"sclk_cam0\000"
	.space	2
.LC1:
	.ascii	"sclk_cam1\000"
	.space	2
.LC2:
	.ascii	"<3>%s : %d\012\000"
.LC3:
	.ascii	"GPM0\000"
	.space	3
.LC4:
	.ascii	"<3>fail to request gpio(GPIO_CAM_IO_EN)\012\000"
	.space	3
.LC5:
	.ascii	"GPJ1\000"
	.space	3
.LC6:
	.ascii	"GPM2\000"
	.space	3
.LC7:
	.ascii	"<3>fail to request gpio(GPIO_VTCAM_MCLK)\012\000"
	.space	2
.LC8:
	.ascii	"GPM1\000"
	.space	3
.LC9:
	.ascii	"<3>fail to request gpio(GPIO_CAM_VT_nRST)\012\000"
	.space	1
.LC10:
	.ascii	"<3>faile to request gpio(GPIO_ISP_STANDBY)\012\000"
.LC11:
	.ascii	"GPF1\000"
	.space	3
.LC12:
	.ascii	"<3>faile to request gpio(GPIO_ISP_RESET)\012\000"
	.space	2
.LC13:
	.ascii	"<3>faile to request gpio(GPIO_CAM_AF_EN)\012\000"
	.space	2
.LC14:
	.ascii	"<3>fail to request gpio(GPIO_ISP_CORE_EN)\012\000"
	.space	1
.LC15:
	.ascii	"<3>\012fail to %s: err = %d\012\000"
	.space	2
.LC16:
	.ascii	"output GPIO_ISP_RESET\000"
	.space	2
.LC17:
	.ascii	"camera\000"
	.space	1
.LC18:
	.ascii	"<3>Failed to create class(camera)!\012\000"
.LC19:
	.ascii	"vmipi_1.0v\000"
	.space	1
.LC20:
	.ascii	"vmipi_1.8v\000"
	.space	1
.LC21:
	.ascii	"<4>%s: vmipi_1.0v and vmipi_1.8v were ON\012\000"
	.space	2
.LC22:
	.ascii	"<4>%s: vmipi_1.8v is on. so OFF\012\000"
	.space	3
.LC23:
	.ascii	"<4>%s: vmipi_1.1v is on. so OFF\012\000"
	.space	3
.LC24:
	.ascii	"<4>%s: vmipi_1.0v and vmipi_1.8v were OFF\012\000"
	.space	1
.LC25:
	.ascii	"<3>%s: ERROR: failed to check mipi-power\012\000"
	.space	2
.LC26:
	.ascii	"<7>%s: in\012\000"
	.space	1
.LC27:
	.ascii	"output GPIO_CAM_IO_EN\000"
	.space	2
.LC28:
	.ascii	"cfg mclk\000"
	.space	3
.LC29:
	.ascii	"output GPIO_CAM_VT_nRST\000"
.LC30:
	.ascii	"vt_cam_1.8v\000"
.LC31:
	.ascii	"enable vt_cam_1.8v\000"
	.space	1
.LC32:
	.ascii	"<3>%s: power-on fail\012\000"
	.space	2
.LC33:
	.ascii	"disable vt_cam_1.8v\000"
.LC34:
	.ascii	"/data/ISP_CV\000"
	.space	3
.LC35:
	.ascii	"<3>failed open file. :: %ld\012\000"
	.space	3
.LC36:
	.ascii	"<3>failed to allocate memory\012\000"
	.space	2
.LC37:
	.ascii	"<3>failed to read file, %d Bytes\012\000"
	.space	2
.LC38:
	.ascii	"<3>@@@@ Voltage = %d\000"
	.space	3
.LC39:
	.ascii	"<7>s5c73m3 vddCore : %d\012\000"
	.space	3
.LC40:
	.ascii	"output GPIO_ISP_CORE_EN\000"
.LC41:
	.ascii	"cam_isp_core_1.2v\000"
	.space	2
.LC42:
	.ascii	"enable cam_isp_core_1.2v\000"
	.space	3
.LC43:
	.ascii	"output IO_EN\000"
	.space	3
.LC44:
	.ascii	"cam_sensor_core_1.2v\000"
	.space	3
.LC45:
	.ascii	"enable cam_sensor_core_1.2v\000"
.LC46:
	.ascii	"output GPIO_CAM_AF_EN\000"
	.space	2
.LC47:
	.ascii	"cam_isp_sensor_1.8v\000"
.LC48:
	.ascii	"enable cam_isp_sensor_1.8v\000"
	.space	1
.LC49:
	.ascii	"cam_isp_mipi_1.2v\000"
	.space	2
.LC50:
	.ascii	"enable cam_isp_mipi_1.2v\000"
	.space	3
.LC51:
	.ascii	"output GPIO_ISP_STANDBY\000"
.LC52:
	.ascii	"disable cam_isp_mipi_1.2v\000"
	.space	2
.LC53:
	.ascii	"disable cam_isp_sensor_1.8v\000"
.LC54:
	.ascii	"disable cam_sensor_core_1.2v\000"
	.space	3
.LC55:
	.ascii	"disable cam_isp_core_1.2v\000"
	.space	2
.LC56:
	.ascii	"output GPIO_CAM_ISP_CORE_EN\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	isVddCoreSet, %object
	.size	isVddCoreSet, 1
isVddCoreSet:
	.space	1
	.space	3
	.type	__key.26597, %object
	.size	__key.26597, 0
__key.26597:
	.type	camera_class, %object
	.size	camera_class, 4
camera_class:
	.space	4
	.ident	"GCC: (GNU) 4.8"
