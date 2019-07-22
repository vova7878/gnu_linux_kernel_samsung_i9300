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
	.file	"sec-switch.c"

	.text
	.align	2
	.global	max77693_get_jig_state
	.type	max77693_get_jig_state, %function
max77693_get_jig_state:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r4, #:lower16:.LANCHOR1
	movt	r4, #:upper16:.LANCHOR1
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR0
	movw	r3, #:lower16:printk
	ldrb	r2, [r4]	@ zero_extendqisi2
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	ldrb	r0, [r4]	@ zero_extendqisi2
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	max77693_get_jig_state, .-max77693_get_jig_state
	.align	2
	.global	max77693_set_jig_state
	.type	max77693_set_jig_state, %function
max77693_set_jig_state:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r3, #:lower16:printk
	mov	r4, r0
	movw	r0, #:lower16:.LC0
	mov	r2, r4
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	ldr	r1, .L3
	blx	r3
	adds	r4, r4, #0
	movw	r3, #:lower16:.LANCHOR1
	movne	r4, #1
	movt	r3, #:upper16:.LANCHOR1
	strb	r4, [r3]
	ldmfd	sp!, {r4, pc}
.L4:
	.align	2
.L3:
	.word	.LANCHOR0+24
	.fnend
	.size	max77693_set_jig_state, .-max77693_set_jig_state
	.align	2
	.type	midas_switch_store_vbus, %function
midas_switch_store_vbus:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r3
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #48
	beq	.L6
	cmp	r2, #49
	beq	.L7
	movw	r0, #:lower16:.LC1
	movw	r2, #:lower16:printk
	movt	r0, #:upper16:.LC1
	movt	r2, #:upper16:printk
	ldr	r1, .L22
	blx	r2
.L17:
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, pc}
.L6:
	movw	r0, #:lower16:.LC3
	movw	r5, #:lower16:printk
	mov	r2, #0
	movt	r5, #:upper16:printk
	ldr	r1, .L22
	movt	r0, #:upper16:.LC3
	blx	r5
	movw	r0, #:lower16:.LC4
	ldr	r1, .L22
	movt	r0, #:upper16:.LC4
	blx	r5
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:regulator_get
	movt	r1, #:upper16:.LC5
	movt	r3, #:upper16:regulator_get
	mov	r0, #0
	blx	r3
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L11
	movw	r3, #:lower16:regulator_is_enabled
	movt	r3, #:upper16:regulator_is_enabled
	blx	r3
	cmp	r0, #0
	beq	.L20
.L10:
	movw	r3, #:lower16:regulator_put
	mov	r0, r6
	movt	r3, #:upper16:regulator_put
	blx	r3
	b	.L17
.L7:
	movw	r0, #:lower16:.LC3
	movw	r5, #:lower16:printk
	mov	r2, #1
	movt	r5, #:upper16:printk
	ldr	r1, .L22
	movt	r0, #:upper16:.LC3
	blx	r5
	movw	r0, #:lower16:.LC4
	ldr	r1, .L22
	movt	r0, #:upper16:.LC4
	blx	r5
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:regulator_get
	movt	r1, #:upper16:.LC5
	movt	r3, #:upper16:regulator_get
	mov	r0, #0
	blx	r3
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L11
	movw	r5, #:lower16:regulator_is_enabled
	movt	r5, #:upper16:regulator_is_enabled
	blx	r5
	cmp	r0, #0
	beq	.L9
	movw	r3, #:lower16:regulator_force_disable
	mov	r0, r6
	movt	r3, #:upper16:regulator_force_disable
	blx	r3
.L9:
	mov	r0, r6
	blx	r5
	cmp	r0, #0
	bne	.L10
.L20:
	movw	r3, #:lower16:regulator_enable
	mov	r0, r6
	movt	r3, #:upper16:regulator_enable
	blx	r3
	b	.L10
.L11:
	movw	r0, #:lower16:.LC2
	ldr	r1, .L22
	movt	r0, #:upper16:.LC2
	blx	r5
	b	.L17
.L23:
	.align	2
.L22:
	.word	.LANCHOR0+48
	.fnend
	.size	midas_switch_store_vbus, .-midas_switch_store_vbus
	.align	2
	.global	max77693_muic_set_safeout
	.type	max77693_muic_set_safeout, %function
max77693_muic_set_safeout:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r4, r0
	movw	r3, #:lower16:printk
	movw	r0, #:lower16:.LC6
	mov	r1, r4
	movt	r0, #:upper16:.LC6
	movt	r3, #:upper16:printk
	blx	r3
	cmp	r4, #1
	movw	r1, #:lower16:.LC5
	movw	r4, #:lower16:regulator_get
	movt	r1, #:upper16:.LC5
	movt	r4, #:upper16:regulator_get
	mov	r0, #0
	beq	.L39
	blx	r4
	cmn	r0, #4096
	mov	r7, r0
	bhi	.L29
	movw	r6, #:lower16:regulator_is_enabled
	movt	r6, #:upper16:regulator_is_enabled
	blx	r6
	cmp	r0, #0
	beq	.L40
.L31:
	movw	r5, #:lower16:regulator_put
	mov	r0, r7
	movt	r5, #:upper16:regulator_put
	blx	r5
	movw	r1, #:lower16:.LC7
	mov	r0, #0
	movt	r1, #:upper16:.LC7
	blx	r4
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L29
	blx	r6
	cmp	r0, #0
	bne	.L41
.L32:
	mov	r0, r4
	blx	r5
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L39:
	blx	r4
	cmn	r0, #4096
	mov	r7, r0
	bhi	.L29
	movw	r6, #:lower16:regulator_is_enabled
	movt	r6, #:upper16:regulator_is_enabled
	blx	r6
	cmp	r0, #0
	bne	.L42
.L28:
	movw	r5, #:lower16:regulator_put
	mov	r0, r7
	movt	r5, #:upper16:regulator_put
	blx	r5
	movw	r1, #:lower16:.LC7
	mov	r0, #0
	movt	r1, #:upper16:.LC7
	blx	r4
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L29
	blx	r6
	cmp	r0, #0
	bne	.L32
	movw	r3, #:lower16:regulator_enable
	mov	r0, r4
	movt	r3, #:upper16:regulator_enable
	blx	r3
	b	.L32
.L40:
	movw	r3, #:lower16:regulator_enable
	mov	r0, r7
	movt	r3, #:upper16:regulator_enable
	blx	r3
	b	.L31
.L41:
	movw	r3, #:lower16:regulator_force_disable
	mov	r0, r4
	movt	r3, #:upper16:regulator_force_disable
	blx	r3
	b	.L32
.L42:
	movw	r3, #:lower16:regulator_force_disable
	mov	r0, r7
	movt	r3, #:upper16:regulator_force_disable
	blx	r3
	b	.L28
.L29:
	mvn	r0, #18
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	max77693_muic_set_safeout, .-max77693_muic_set_safeout
	.align	2
	.global	max77693_muic_usb_cb
	.type	max77693_muic_usb_cb, %function
max77693_muic_usb_cb:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:dev_get_drvdata
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:dev_get_drvdata
	mov	r4, r0
	movw	r5, #:lower16:printk
	ldr	r0, .L71
	movt	r5, #:upper16:printk
	blx	r3
	mov	r6, r0
	movw	r0, #:lower16:.LC8
	mov	r1, r4
	movt	r0, #:upper16:.LC8
	blx	r5
	cmp	r6, #0
	beq	.L44
	cmp	r4, #0
	beq	.L46
	cmp	r4, #1
	bne	.L70
	movw	r0, #:lower16:.LC10
	mov	r1, r4
	movt	r0, #:upper16:.LC10
.L69:
	blx	r5
	ldr	r3, [r6]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L50
	mov	r0, r6
	mov	r1, r4
	blx	r3
.L50:
	cmp	r4, #2
	cmpne	r4, #4
	ldmnefd	sp!, {r4, r5, r6, pc}
	movw	r4, #:lower16:__pm_runtime_idle
	mov	r1, #4
	movt	r4, #:upper16:__pm_runtime_idle
	ldr	r0, .L71+4
	blx	r4
	mov	r1, #4
	ldr	r0, .L71+8
	blx	r4
	ldmfd	sp!, {r4, r5, r6, pc}
.L70:
	movw	r0, #:lower16:.LC11
	mov	r1, r4
	movt	r0, #:upper16:.LC11
	blx	r5
.L44:
	cmp	r4, #3
	cmpne	r4, #5
	bne	.L50
	movw	r4, #:lower16:__pm_runtime_resume
	mov	r1, #4
	movt	r4, #:upper16:__pm_runtime_resume
	ldr	r0, .L71+8
	blx	r4
	mov	r1, #4
	ldr	r0, .L71+4
	blx	r4
	ldmfd	sp!, {r4, r5, r6, pc}
.L46:
	movw	r0, #:lower16:.LC9
	mov	r1, r4
	movt	r0, #:upper16:.LC9
	b	.L69
.L72:
	.align	2
.L71:
	.word	s3c_device_usbgadget+8
	.word	s5p_device_ohci+8
	.word	s5p_device_ehci+8
	.fnend
	.size	max77693_muic_usb_cb, .-max77693_muic_usb_cb
	.align	2
	.global	max77693_muic_is_mhl_attached
	.type	max77693_muic_is_mhl_attached, %function
max77693_muic_is_mhl_attached:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:max77693_muic_get_status1_adc1k_value
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r3, #:upper16:max77693_muic_get_status1_adc1k_value
	blx	r3
	movw	r3, #:lower16:printk
	mov	r4, r0
	movw	r0, #:lower16:.LC12
	mov	r2, r4
	movt	r3, #:upper16:printk
	ldr	r1, .L74
	movt	r0, #:upper16:.LC12
	blx	r3
	adds	r0, r4, #0
	movne	r0, #1
	ldmfd	sp!, {r4, pc}
.L75:
	.align	2
.L74:
	.word	.LANCHOR0+72
	.fnend
	.size	max77693_muic_is_mhl_attached, .-max77693_muic_is_mhl_attached
	.align	2
	.global	max77693_muic_dock_cb
	.type	max77693_muic_dock_cb, %function
max77693_muic_dock_cb:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r1, #:lower16:.LC14
	mov	r4, r0
	movw	ip, #:lower16:printk
	movw	r0, #:lower16:.LC13
	mov	r3, r4
	movt	r1, #:upper16:.LC14
	movt	ip, #:upper16:printk
	ldr	r2, .L77
	movt	r0, #:upper16:.LC13
	blx	ip
	movw	r0, #:lower16:.LANCHOR2
	movw	r2, #:lower16:switch_set_state
	mov	r1, r4
	movt	r0, #:upper16:.LANCHOR2
	movt	r2, #:upper16:switch_set_state
	blx	r2
	ldmfd	sp!, {r4, pc}
.L78:
	.align	2
.L77:
	.word	.LANCHOR0+104
	.fnend
	.size	max77693_muic_dock_cb, .-max77693_muic_dock_cb
	.align	2
	.global	max77693_muic_init_cb
	.type	max77693_muic_init_cb, %function
max77693_muic_init_cb:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r0, #:lower16:.LANCHOR2
	movw	r3, #:lower16:switch_dev_register
	movt	r0, #:upper16:.LANCHOR2
	movt	r3, #:upper16:switch_dev_register
	movw	r4, #:lower16:printk
	blx	r3
	mov	r5, r0
	movw	r0, #:lower16:.LC15
	mov	r1, r5
	movt	r0, #:upper16:.LC15
	movt	r4, #:upper16:printk
	blx	r4
	cmp	r5, #0
	ldmgefd	sp!, {r3, r4, r5, pc}
	movw	r0, #:lower16:.LC16
	mov	r1, r5
	movt	r0, #:upper16:.LC16
	blx	r4
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	max77693_muic_init_cb, .-max77693_muic_init_cb
	.align	2
	.global	max77693_muic_cfg_uart_gpio
	.type	max77693_muic_cfg_uart_gpio, %function
max77693_muic_cfg_uart_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r4, #:lower16:__gpio_get_value
	movt	r4, #:upper16:__gpio_get_value
	ldr	r6, .L82
	mov	r0, #68
	movw	r5, #:lower16:printk
	blx	r4
	mov	r7, r0
	mov	r0, #235
	blx	r4
	mov	r3, r0
	movw	r0, #:lower16:.LC17
	mov	r2, r7
	mov	r1, r6
	movt	r5, #:upper16:printk
	movt	r0, #:upper16:.LC17
	blx	r5
	mov	r0, #68
	blx	r4
	adds	r4, r0, #0
	movw	r1, #:lower16:.LC19
	movne	r4, #1
	movw	r0, #:lower16:.LC18
	mov	r2, r6
	mov	r3, r4
	movt	r1, #:upper16:.LC19
	movt	r0, #:upper16:.LC18
	blx	r5
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L83:
	.align	2
.L82:
	.word	.LANCHOR0+128
	.fnend
	.size	max77693_muic_cfg_uart_gpio, .-max77693_muic_cfg_uart_gpio
	.align	2
	.type	midas_switch_show_vbus, %function
midas_switch_show_vbus:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:regulator_get
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r1, #:upper16:.LC5
	movt	r3, #:upper16:regulator_get
	mov	r0, #0
	mov	r4, r2
	blx	r3
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L89
	movw	r3, #:lower16:regulator_is_enabled
	movt	r3, #:upper16:regulator_is_enabled
	blx	r3
	cmp	r0, #0
	bne	.L90
	movw	ip, #:lower16:.LC22
	mov	r6, #17
	movt	ip, #:upper16:.LC22
	ldmia	ip!, {r0, r1, r2, r3}
	ldrh	ip, [ip]	@ unaligned
	str	r0, [r4]	@ unaligned
	str	r1, [r4, #4]	@ unaligned
	strh	ip, [r4, #16]	@ unaligned
	str	r2, [r4, #8]	@ unaligned
	str	r3, [r4, #12]	@ unaligned
.L88:
	movw	r3, #:lower16:regulator_put
	mov	r0, r5
	movt	r3, #:upper16:regulator_put
	blx	r3
	mov	r3, r6
.L86:
	mov	r0, r3
	ldmfd	sp!, {r4, r5, r6, pc}
.L90:
	movw	ip, #:lower16:.LC21
	mov	r6, #16
	movt	ip, #:upper16:.LC21
	ldmia	ip!, {r0, r1, r2, r3}
	ldrb	ip, [ip]	@ zero_extendqisi2
	str	r0, [r4]	@ unaligned
	str	r1, [r4, #4]	@ unaligned
	strb	ip, [r4, #16]
	str	r2, [r4, #8]	@ unaligned
	str	r3, [r4, #12]	@ unaligned
	b	.L88
.L89:
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L91
	movt	r0, #:upper16:.LC2
	blx	r3
	movw	r2, #:lower16:.LC20
	mov	r3, #8
	movt	r2, #:upper16:.LC20
	ldmia	r2!, {r0, r1}
	ldrb	r2, [r2]	@ zero_extendqisi2
	str	r0, [r4]	@ unaligned
	str	r1, [r4, #4]	@ unaligned
	strb	r2, [r4, #8]
	b	.L86
.L92:
	.align	2
.L91:
	.word	.LANCHOR0+156
	.fnend
	.size	midas_switch_show_vbus, .-midas_switch_show_vbus
	.align	2
	.global	max77693_muic_charger_cb
	.type	max77693_muic_charger_cb, %function
max77693_muic_charger_cb:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	movw	r4, #:lower16:printk
	movw	r0, #:lower16:.LC0
	mov	r2, r5
	movt	r0, #:upper16:.LC0
	movt	r4, #:upper16:printk
	ldr	r1, .L102
	blx	r4
	cmp	r5, #16
	ldrls	pc, [pc, r5, asl #2]
	b	.L94
.L96:
	.word	.L95
	.word	.L98
	.word	.L95
	.word	.L98
	.word	.L98
	.word	.L98
	.word	.L95
	.word	.L98
	.word	.L94
	.word	.L98
	.word	.L98
	.word	.L95
	.word	.L98
	.word	.L98
	.word	.L94
	.word	.L94
	.word	.L98
.L98:
	mov	r2, #1
	movw	r3, #:lower16:.LANCHOR1
	mov	r0, r2
	movt	r3, #:upper16:.LANCHOR1
	strb	r2, [r3, #1]
.L100:
	movw	r3, #:lower16:tsp_charger_infom
	movt	r3, #:upper16:tsp_charger_infom
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
.L95:
	movw	r3, #:lower16:.LANCHOR1
	mov	r2, #0
	movt	r3, #:upper16:.LANCHOR1
	mov	r0, r2
	strb	r2, [r3, #1]
	b	.L100
.L94:
	movw	r0, #:lower16:.LC23
	mov	r2, r5
	ldr	r1, .L102
	movt	r0, #:upper16:.LC23
	blx	r4
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, pc}
.L103:
	.align	2
.L102:
	.word	.LANCHOR0+180
	.fnend
	.size	max77693_muic_charger_cb, .-max77693_muic_charger_cb
	.align	2
	.global	max77693_muic_mhl_cb
	.type	max77693_muic_mhl_cb, %function
max77693_muic_mhl_cb:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	movw	r4, #:lower16:printk
	movw	r0, #:lower16:.LC24
	mov	r1, r5
	movt	r0, #:upper16:.LC24
	movt	r4, #:upper16:printk
	blx	r4
	cmp	r5, #1
	beq	.L107
	movw	r0, #:lower16:.LC26
	movt	r0, #:upper16:.LC26
	blx	r4
	movw	r3, #:lower16:mhl_onoff_ex
	mov	r0, #0
	movt	r3, #:upper16:mhl_onoff_ex
	blx	r3
	movw	r3, #:lower16:sii9234_wake_unlock
	movt	r3, #:upper16:sii9234_wake_unlock
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
.L107:
	movw	r0, #:lower16:.LC25
	movt	r0, #:upper16:.LC25
	blx	r4
	movw	r3, #:lower16:sii9234_wake_lock
	movt	r3, #:upper16:sii9234_wake_lock
	blx	r3
	movw	r3, #:lower16:mhl_onoff_ex
	mov	r0, r5
	movt	r3, #:upper16:mhl_onoff_ex
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	max77693_muic_mhl_cb, .-max77693_muic_mhl_cb
	.align	2
	.global	max77693_muic_jig_uart_cb
	.type	max77693_muic_jig_uart_cb, %function
max77693_muic_jig_uart_cb:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	movw	r4, #:lower16:printk
	movw	r0, #:lower16:.LC27
	mov	r2, r5
	movt	r0, #:upper16:.LC27
	movt	r4, #:upper16:printk
	ldr	r1, .L114
	blx	r4
	cmp	r5, #0
	beq	.L110
	cmp	r5, #1
	bne	.L113
.L110:
	movw	r3, #:lower16:__gpio_set_value
	mov	r1, r5
	movt	r3, #:upper16:__gpio_set_value
	mov	r0, #68
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
.L113:
	movw	r0, #:lower16:.LC28
	ldr	r1, .L114
	movt	r0, #:upper16:.LC28
	blx	r4
	ldmfd	sp!, {r3, r4, r5, pc}
.L115:
	.align	2
.L114:
	.word	.LANCHOR0+208
	.fnend
	.size	max77693_muic_jig_uart_cb, .-max77693_muic_jig_uart_cb
	.align	2
	.type	midas_sec_switch_init, %function
midas_sec_switch_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r2, #:lower16:sec_class
	movw	r3, #:lower16:.LC29
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	mov	r1, #0
	.pad #8
	sub	sp, sp, #8
	movt	r2, #:upper16:sec_class
	movt	r3, #:upper16:.LC29
	movw	ip, #:lower16:device_create
	ldr	r0, [r2]
	movt	ip, #:upper16:device_create
	str	r3, [sp]
	mov	r2, r1
	mov	r3, r1
	blx	ip
	movw	r3, #:lower16:.LANCHOR1
	cmn	r0, #4096
	movt	r3, #:upper16:.LANCHOR1
	str	r0, [r3, #4]
	bhi	.L120
	movw	r3, #:lower16:device_create_file
	ldr	r1, .L122
	movt	r3, #:upper16:device_create_file
	blx	r3
	subs	r4, r0, #0
	moveq	r0, r4
	bne	.L121
.L118:
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, pc}
.L120:
	movw	r0, #:lower16:.LC30
	movw	r1, #:lower16:.LC19
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC30
	movt	r1, #:upper16:.LC19
	movt	r3, #:upper16:printk
	ldr	r2, .L122+4
	blx	r3
	mvn	r0, #18
	b	.L118
.L121:
	movw	r0, #:lower16:.LC31
	movw	r1, #:lower16:.LC19
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC31
	movt	r1, #:upper16:.LC19
	movt	r3, #:upper16:printk
	ldr	r2, .L122+4
	blx	r3
	mov	r0, r4
	b	.L118
.L123:
	.align	2
.L122:
	.word	.LANCHOR2+24
	.word	.LANCHOR0+236
	.fnend
	.size	midas_sec_switch_init, .-midas_sec_switch_init
	.global	max77693_muic
	.global	dev_attr_disable_vbus
	.global	is_jig_attached
	.global	is_cable_attached
	.global	switch_dev
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.28450, %object
	.size	__func__.28450, 23
__func__.28450:
	.ascii	"max77693_get_jig_state\000"
	.space	1
	.type	__func__.28457, %object
	.size	__func__.28457, 23
__func__.28457:
	.ascii	"max77693_set_jig_state\000"
	.space	1
	.type	__func__.28420, %object
	.size	__func__.28420, 24
__func__.28420:
	.ascii	"midas_switch_store_vbus\000"
	.type	__func__.28477, %object
	.size	__func__.28477, 30
__func__.28477:
	.ascii	"max77693_muic_is_mhl_attached\000"
	.space	2
	.type	__func__.28481, %object
	.size	__func__.28481, 22
__func__.28481:
	.ascii	"max77693_muic_dock_cb\000"
	.space	2
	.type	__func__.28491, %object
	.size	__func__.28491, 28
__func__.28491:
	.ascii	"max77693_muic_cfg_uart_gpio\000"
	.type	__func__.28409, %object
	.size	__func__.28409, 23
__func__.28409:
	.ascii	"midas_switch_show_vbus\000"
	.space	1
	.type	__func__.28430, %object
	.size	__func__.28430, 25
__func__.28430:
	.ascii	"max77693_muic_charger_cb\000"
	.space	3
	.type	__func__.28495, %object
	.size	__func__.28495, 26
__func__.28495:
	.ascii	"max77693_muic_jig_uart_cb\000"
	.space	2
	.type	__func__.28426, %object
	.size	__func__.28426, 22
__func__.28426:
	.ascii	"midas_sec_switch_init\000"
	.section	___ksymtab+max77693_get_jig_state,"a",%progbits
	.align	2
	.type	__ksymtab_max77693_get_jig_state, %object
	.size	__ksymtab_max77693_get_jig_state, 8
__ksymtab_max77693_get_jig_state:
	.word	max77693_get_jig_state
	.word	__kstrtab_max77693_get_jig_state
	.section	___ksymtab+max77693_muic_usb_cb,"a",%progbits
	.align	2
	.type	__ksymtab_max77693_muic_usb_cb, %object
	.size	__ksymtab_max77693_muic_usb_cb, 8
__ksymtab_max77693_muic_usb_cb:
	.word	max77693_muic_usb_cb
	.word	__kstrtab_max77693_muic_usb_cb
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_midas_sec_switch_init6, %object
	.size	__initcall_midas_sec_switch_init6, 4
__initcall_midas_sec_switch_init6:
	.word	midas_sec_switch_init
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	switch_dock, %object
	.size	switch_dock, 24
switch_dock:
	.word	.LC33
	.space	20
	.type	dev_attr_disable_vbus, %object
	.size	dev_attr_disable_vbus, 16
dev_attr_disable_vbus:
	.word	.LC32
	.short	436
	.space	2
	.word	midas_switch_show_vbus
	.word	midas_switch_store_vbus
	.type	max77693_muic, %object
	.size	max77693_muic, 60
max77693_muic:
	.word	max77693_muic_usb_cb
	.space	4
	.word	max77693_muic_charger_cb
	.word	max77693_muic_dock_cb
	.word	max77693_muic_mhl_cb
	.word	max77693_muic_init_cb
	.word	max77693_muic_set_safeout
	.word	max77693_muic_is_mhl_attached
	.word	max77693_muic_cfg_uart_gpio
	.word	max77693_muic_jig_uart_cb
	.word	0
	.word	235
	.space	8
	.word	max77693_set_jig_state
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>%s: %d\012\000"
	.space	1
.LC1:
	.ascii	"<4>%s: Wrong command\012\000"
	.space	2
.LC2:
	.ascii	"<4>%s: fail to get regulator\012\000"
	.space	2
.LC3:
	.ascii	"<6>%s: disable=%d\012\000"
	.space	1
.LC4:
	.ascii	"<3>%s: fail to change mode!!!\012\000"
	.space	1
.LC5:
	.ascii	"safeout1\000"
	.space	3
.LC6:
	.ascii	"<6>MUIC safeout path=%d\012\000"
	.space	3
.LC7:
	.ascii	"safeout2\000"
	.space	3
.LC8:
	.ascii	"<6>MUIC usb_cb:%d\012\000"
	.space	1
.LC9:
	.ascii	"<6>usb: muic: USB_CABLE_DETACHED(%d)\012\000"
	.space	2
.LC10:
	.ascii	"<6>usb: muic: USB_CABLE_ATTACHED(%d)\012\000"
	.space	2
.LC11:
	.ascii	"<6>usb: muic: invalid mode%d\012\000"
	.space	2
.LC12:
	.ascii	"<6>%s(1): %d\012\000"
	.space	2
.LC13:
	.ascii	"<6>%s:%s= MUIC dock type=%d\012\000"
	.space	3
.LC14:
	.ascii	"sec-switch.c\000"
	.space	3
.LC15:
	.ascii	"<6>MUIC ret=%d\012\000"
.LC16:
	.ascii	"<3>Failed to register dock switch. %d\012\000"
	.space	1
.LC17:
	.ascii	"<6>## MUIC func : %s ! please  path: (uart:%d - usb"
	.ascii	":%d)\012\000"
	.space	3
.LC18:
	.ascii	"<6>##MUIC [ %s ]- func : %s! path:%d\012\000"
	.space	2
.LC19:
	.ascii	"/media/system1/root/CM14/kernel/samsung/smdk4412/ar"
	.ascii	"ch/arm/mach-exynos/sec-switch.c\000"
	.space	1
.LC20:
	.ascii	"UNKNOWN\012\000"
	.space	3
.LC21:
	.ascii	"VBUS is enabled\012\000"
	.space	3
.LC22:
	.ascii	"VBUS is disabled\012\000"
	.space	2
.LC23:
	.ascii	"<3>%s: invalid type:%d\012\000"
.LC24:
	.ascii	"<6>MUIC attached:%d\012\000"
	.space	3
.LC25:
	.ascii	"<6>MHL Attached !!\012\000"
.LC26:
	.ascii	"<6>MHL Detached !!\012\000"
.LC27:
	.ascii	"<6>func:%s : (path=%d\012\000"
	.space	1
.LC28:
	.ascii	"<6>func %s: invalid value!!\012\000"
	.space	3
.LC29:
	.ascii	"switch\000"
	.space	1
.LC30:
	.ascii	"<3>%s:%s= Failed to create device(switch)!\012\000"
.LC31:
	.ascii	"<3>%s:%s= Failed to create device file(disable_vbus"
	.ascii	")!\012\000"
	.space	1
.LC32:
	.ascii	"disable_vbus\000"
	.space	3
.LC33:
	.ascii	"dock\000"
	.section	___ksymtab+switch_dev,"a",%progbits
	.align	2
	.type	__ksymtab_switch_dev, %object
	.size	__ksymtab_switch_dev, 8
__ksymtab_switch_dev:
	.word	switch_dev
	.word	__kstrtab_switch_dev
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	is_jig_attached, %object
	.size	is_jig_attached, 1
is_jig_attached:
	.space	1
	.type	is_cable_attached, %object
	.size	is_cable_attached, 1
is_cable_attached:
	.space	1
	.space	2
	.type	switch_dev, %object
	.size	switch_dev, 4
switch_dev:
	.space	4
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_max77693_muic_usb_cb, %object
	.size	__kstrtab_max77693_muic_usb_cb, 21
__kstrtab_max77693_muic_usb_cb:
	.ascii	"max77693_muic_usb_cb\000"
	.type	__kstrtab_max77693_get_jig_state, %object
	.size	__kstrtab_max77693_get_jig_state, 23
__kstrtab_max77693_get_jig_state:
	.ascii	"max77693_get_jig_state\000"
	.type	__kstrtab_switch_dev, %object
	.size	__kstrtab_switch_dev, 11
__kstrtab_switch_dev:
	.ascii	"switch_dev\000"
	.ident	"GCC: (GNU) 4.8"
