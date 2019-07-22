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
	.file	"mdm2.c"

	.text
	.align	2
	.type	debug_state_changed, %function
debug_state_changed:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	str	r0, [r3]
	bx	lr
	.fnend
	.size	debug_state_changed, .-debug_state_changed
	.align	2
	.type	mdm_modem_probe, %function
mdm_modem_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r1, #:lower16:.LANCHOR1
	mov	r4, r0
	movw	r3, #:lower16:printk
	movw	r0, #:lower16:.LC0
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	movw	r1, #:lower16:.LANCHOR2
	movw	r3, #:lower16:mdm_common_create
	mov	r0, r4
	movt	r1, #:upper16:.LANCHOR2
	movt	r3, #:upper16:mdm_common_create
	blx	r3
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	mdm_modem_probe, .-mdm_modem_probe
	.align	2
	.type	mdm_peripheral_connect, %function
mdm_peripheral_connect:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r3, #:lower16:printk
	mov	r5, r0
	movw	r0, #:lower16:.LC0
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	ldr	r1, .L21
	blx	r3
	cmp	r5, #0
	ldmeqfd	sp!, {r4, r5, r6, pc}
	ldr	r6, [r5, #80]
	cmp	r6, #0
	ldmeqfd	sp!, {r4, r5, r6, pc}
	movw	r4, #:lower16:.LANCHOR2
	movw	r3, #:lower16:mutex_lock
	movt	r4, #:upper16:.LANCHOR2
	movt	r3, #:upper16:mutex_lock
	add	r0, r4, #24
	blx	r3
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bne	.L5
	ldr	r0, [r6, #28]
	cmp	r0, #0
	beq	.L6
	movw	r3, #:lower16:platform_device_add
	movt	r3, #:upper16:platform_device_add
	blx	r3
.L6:
	movw	r3, #:lower16:gpio_direction_output
	ldr	r0, [r5, #20]
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #1
	blx	r3
	ldr	r0, [r6, #32]
	cmp	r0, #0
	beq	.L7
	movw	r3, #:lower16:platform_device_add
	movt	r3, #:upper16:platform_device_add
	blx	r3
.L7:
	mov	r3, #1
	str	r3, [r4, #48]
.L5:
	movw	r3, #:lower16:mutex_unlock
	ldr	r0, .L21+4
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	ldmfd	sp!, {r4, r5, r6, pc}
.L22:
	.align	2
.L21:
	.word	.LANCHOR1+16
	.word	.LANCHOR2+24
	.fnend
	.size	mdm_peripheral_connect, .-mdm_peripheral_connect
	.align	2
	.type	mdm_toggle_soft_reset, %function
mdm_toggle_soft_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:gpio_direction_output
	ldr	r3, [r0, #80]
	mov	r5, r0
	movt	r4, #:upper16:gpio_direction_output
	ldr	r0, [r0, #28]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	moveq	r1, #0
	movne	r1, #1
	movne	r6, #0
	moveq	r6, #1
	blx	r4
	movw	r3, #:lower16:usleep_range
	movw	r0, #5000
	movt	r3, #:upper16:usleep_range
	movw	r1, #10000
	blx	r3
	mov	r1, r6
	ldr	r0, [r5, #28]
	blx	r4
	movw	r3, #:lower16:msleep
	mov	r0, #20
	movt	r3, #:upper16:msleep
	blx	r3
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	mdm_toggle_soft_reset, .-mdm_toggle_soft_reset
	.align	2
	.type	mdm_modem_remove, %function
mdm_modem_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:mdm_common_modem_remove
	movt	r3, #:upper16:mdm_common_modem_remove
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	mdm_modem_remove, .-mdm_modem_remove
	.align	2
	.type	mdm_modem_init, %function
mdm_modem_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:poweroff_charging
	movt	r3, #:upper16:poweroff_charging
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L30
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
.L30:
	movw	r1, #:lower16:mdm_modem_probe
	movw	r3, #:lower16:platform_driver_probe
	movt	r1, #:upper16:mdm_modem_probe
	movt	r3, #:upper16:platform_driver_probe
	ldr	r0, .L31
	blx	r3
	ldmfd	sp!, {r3, pc}
.L32:
	.align	2
.L31:
	.word	.LANCHOR2+52
	.fnend
	.size	mdm_modem_init, .-mdm_modem_init
	.align	2
	.global	mdm_peripheral_disconnect
	.type	mdm_peripheral_disconnect, %function
mdm_peripheral_disconnect:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	movw	r3, #:lower16:printk
	movw	r0, #:lower16:.LC0
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	ldr	r1, .L53
	blx	r3
	cmp	r4, #0
	ldmeqfd	sp!, {r3, r4, r5, pc}
	ldr	r5, [r4, #80]
	cmp	r5, #0
	ldmeqfd	sp!, {r3, r4, r5, pc}
	movw	r4, #:lower16:.LANCHOR2
	movw	r3, #:lower16:mutex_lock
	movt	r4, #:upper16:.LANCHOR2
	movt	r3, #:upper16:mutex_lock
	add	r0, r4, #24
	blx	r3
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L35
	ldr	r0, [r5, #32]
	cmp	r0, #0
	beq	.L36
	movw	r3, #:lower16:platform_device_del
	movt	r3, #:upper16:platform_device_del
	blx	r3
.L36:
	ldr	r0, [r5, #28]
	cmp	r0, #0
	beq	.L37
	movw	r3, #:lower16:platform_device_del
	movt	r3, #:upper16:platform_device_del
	blx	r3
.L37:
	mov	r3, #0
	str	r3, [r4, #48]
.L35:
	movw	r3, #:lower16:mutex_unlock
	ldr	r0, .L53+4
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
.L54:
	.align	2
.L53:
	.word	.LANCHOR1+40
	.word	.LANCHOR2+24
	.fnend
	.size	mdm_peripheral_disconnect, .-mdm_peripheral_disconnect
	.align	2
	.type	mdm_status_changed, %function
mdm_status_changed:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldmeqfd	sp!, {r4, r5, r6, pc}
	bl	mdm_peripheral_disconnect
	mov	r0, r4
	bl	mdm_peripheral_connect
	ldr	r0, [r4, #20]
	cmp	r0, #0
	ldmeqfd	sp!, {r4, r5, r6, pc}
	movw	r3, #:lower16:__gpio_get_value
	movt	r3, #:upper16:__gpio_get_value
	blx	r3
	cmp	r0, #0
	bne	.L59
.L60:
	movw	r3, #:lower16:gpio_direction_output
	ldr	r0, [r4, #20]
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #1
	blx	r3
	ldmfd	sp!, {r4, r5, r6, pc}
.L59:
	movw	r3, #:lower16:__gpio_set_value
	movw	r6, #:lower16:__const_udelay
	movt	r3, #:upper16:__gpio_set_value
	ldr	r0, [r4, #20]
	mov	r1, #0
	movt	r6, #:upper16:__const_udelay
	mov	r5, #5
	blx	r3
.L61:
	movw	r0, #12560
	movt	r0, 4915
	blx	r6
	subs	r5, r5, #1
	bne	.L61
	b	.L60
	.fnend
	.size	mdm_status_changed, .-mdm_status_changed
	.align	2
	.type	mdm_power_down_common, %function
mdm_power_down_common:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, r0
	ldr	r3, [r0, #80]
	movw	r9, #:lower16:printk
	movw	r0, #:lower16:.LC0
	movw	r7, #:lower16:__gpio_get_value
	movw	r8, #:lower16:msleep
	movt	r0, #:upper16:.LC0
	movt	r9, #:upper16:printk
	ldr	r1, .L75
	movt	r7, #:upper16:__gpio_get_value
	movt	r8, #:upper16:msleep
	mov	r5, #20
	ldr	r10, [r3, #8]
	blx	r9
.L71:
	ldr	r0, [r6, #8]
	movw	r4, #:lower16:msleep
	blx	r7
	cmp	r0, #0
	movt	r4, #:upper16:msleep
	mov	r0, #100
	beq	.L69
	blx	r8
	subs	r5, r5, #1
	bne	.L71
	movw	r0, #:lower16:.LC1
	ldr	r1, .L75
	movt	r0, #:upper16:.LC1
	blx	r9
	adds	r1, r10, #0
	movw	r3, #:lower16:gpio_direction_output
	movne	r1, #1
	movt	r3, #:upper16:gpio_direction_output
	ldr	r0, [r6, #28]
	blx	r3
	mov	r0, #4000
	blx	r4
.L69:
	mov	r0, r6
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	b	mdm_peripheral_disconnect
.L76:
	.align	2
.L75:
	.word	.LANCHOR1+68
	.fnend
	.size	mdm_power_down_common, .-mdm_power_down_common
	.align	2
	.type	normal_boot_done, %function
normal_boot_done:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r3, #:lower16:printk
	mov	r4, r0
	movw	r0, #:lower16:.LC2
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC2
	ldr	r1, .L78
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r4, lr}
	b	mdm_peripheral_disconnect
.L79:
	.align	2
.L78:
	.word	.LANCHOR1+92
	.fnend
	.size	normal_boot_done, .-normal_boot_done
	.align	2
	.type	mdm_power_on_common, %function
mdm_power_on_common:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	mov	r5, r0
	ldr	r0, [r0, #20]
	ldr	r3, [r4, #4]
	cmp	r0, #0
	add	r3, r3, #1
	str	r3, [r4, #4]
	moveq	r7, r3
	bne	.L108
.L81:
	ldr	r2, [r5, #80]
	ldr	r2, [r2, #12]
	cmp	r2, #0
	beq	.L82
	cmp	r7, #2
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, pc}
.L82:
	cmp	r7, #1
	beq	.L109
	movw	r0, #:lower16:.LC4
	movw	r3, #:lower16:printk
	ldr	r1, .L112
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC4
	blx	r3
	mov	r3, #0
	mov	r0, r5
	strb	r3, [r5, #86]
	bl	mdm_peripheral_disconnect
	mov	r0, r5
	bl	mdm_toggle_soft_reset
	ldr	r0, [r5, #36]
	cmp	r0, #0
	beq	.L90
	movw	r6, #:lower16:__gpio_get_value
	movw	r7, #:lower16:usleep_range
	movt	r6, #:upper16:__gpio_get_value
	movt	r7, #:upper16:usleep_range
	mov	r4, #20
	b	.L91
.L110:
	ldr	r0, [r5, #36]
.L91:
	blx	r6
	cmp	r0, #0
	movw	r0, #5000
	mov	r1, r0
	bne	.L90
	blx	r7
	subs	r4, r4, #1
	bne	.L110
.L90:
	mov	r0, r5
	bl	mdm_peripheral_connect
	movw	r3, #:lower16:msleep
	mov	r0, #200
	movt	r3, #:upper16:msleep
	blx	r3
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L108:
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, #0
	movt	r3, #:upper16:gpio_direction_output
	blx	r3
	ldr	r7, [r4, #4]
	b	.L81
.L109:
	mov	r6, #0
	movw	r0, #:lower16:.LC3
	movw	r2, #:lower16:printk
	ldr	r1, .L112+4
	movt	r2, #:upper16:printk
	strb	r6, [r5, #86]
	movt	r0, #:upper16:.LC3
	movw	r4, #:lower16:gpio_direction_output
	blx	r2
	movt	r4, #:upper16:gpio_direction_output
	mov	r1, r6
	ldr	r0, [r5, #20]
	blx	r4
	mov	r0, r5
	bl	mdm_peripheral_disconnect
	mov	r0, r5
	bl	mdm_toggle_soft_reset
	ldr	r0, [r5, #24]
	cmp	r0, r6
	bne	.L107
	movw	r8, #:lower16:msleep
	movt	r8, #:upper16:msleep
.L85:
	movw	r7, #:lower16:usleep_range
	movw	r0, #10000
	movw	r1, #15000
	movt	r7, #:upper16:usleep_range
	blx	r7
	ldr	r0, [r5, #12]
	mov	r1, #1
	blx	r4
	ldr	r0, [r5, #36]
	cmp	r0, #0
	beq	.L87
	movw	r6, #:lower16:__gpio_get_value
	mov	r4, #20
	movt	r6, #:upper16:__gpio_get_value
	b	.L88
.L111:
	ldr	r0, [r5, #36]
.L88:
	blx	r6
	cmp	r0, #0
	movw	r0, #5000
	mov	r1, r0
	bne	.L87
	blx	r7
	subs	r4, r4, #1
	bne	.L111
.L87:
	mov	r0, r5
	bl	mdm_peripheral_connect
	mov	r0, #200
	blx	r8
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L107:
	mov	r1, r7
	movw	r8, #:lower16:msleep
	blx	r4
	movt	r8, #:upper16:msleep
	mov	r0, #1000
	blx	r8
	mov	r1, r6
	ldr	r0, [r5, #24]
	blx	r4
	b	.L85
.L113:
	.align	2
.L112:
	.word	.LANCHOR1+136
	.word	.LANCHOR1+112
	.fnend
	.size	mdm_power_on_common, .-mdm_power_on_common
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.18547, %object
	.size	__func__.18547, 16
__func__.18547:
	.ascii	"mdm_modem_probe\000"
	.type	__func__.18482, %object
	.size	__func__.18482, 23
__func__.18482:
	.ascii	"mdm_peripheral_connect\000"
	.space	1
	.type	__func__.18488, %object
	.size	__func__.18488, 26
__func__.18488:
	.ascii	"mdm_peripheral_disconnect\000"
	.space	2
	.type	__func__.18500, %object
	.size	__func__.18500, 22
__func__.18500:
	.ascii	"mdm_power_down_common\000"
	.space	2
	.type	__func__.18530, %object
	.size	__func__.18530, 17
__func__.18530:
	.ascii	"normal_boot_done\000"
	.space	3
	.type	__func__.18509, %object
	.size	__func__.18509, 22
__func__.18509:
	.ascii	"mdm_do_first_power_on\000"
	.space	2
	.type	__func__.18519, %object
	.size	__func__.18519, 21
__func__.18519:
	.ascii	"mdm_do_soft_power_on\000"
	.section	__modver,"a",%progbits
	.align	2
	.type	__modver_attr, %object
	.size	__modver_attr, 4
__modver_attr:
	.word	___modver_attr
	.section	.initcall7.init,"aw",%progbits
	.align	2
	.type	__initcall_mdm_modem_init7, %object
	.size	__initcall_mdm_modem_init7, 4
__initcall_mdm_modem_init7:
	.word	mdm_modem_init
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	mdm_cb, %object
	.size	mdm_cb, 24
mdm_cb:
	.word	mdm_power_on_common
	.word	mdm_power_on_common
	.word	normal_boot_done
	.word	mdm_power_down_common
	.word	debug_state_changed
	.word	mdm_status_changed
	.type	hsic_status_lock, %object
	.size	hsic_status_lock, 24
hsic_status_lock:
	.word	1
	.word	0
	.space	4
	.word	hsic_status_lock+12
	.word	hsic_status_lock+12
	.space	4
	.type	hsic_peripheral_status, %object
	.size	hsic_peripheral_status, 4
hsic_peripheral_status:
	.word	1
	.type	mdm_modem_driver, %object
	.size	mdm_modem_driver, 80
mdm_modem_driver:
	.space	4
	.word	mdm_modem_remove
	.space	12
	.word	.LC8
	.space	4
	.word	0
	.space	44
	.space	4
	.type	___modver_attr, %object
	.size	___modver_attr, 36
___modver_attr:
	.word	.LC5
	.short	292
	.space	2
	.word	__modver_version_show
	.space	16
	.word	.LC6
	.word	.LC7
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>%s\012\000"
	.space	1
.LC1:
	.ascii	"<3>%s: MDM2AP_STATUS never went low. Doing a hard r"
	.ascii	"eset\012\000"
	.space	3
.LC2:
	.ascii	"<3>%s\012\000"
	.space	1
.LC3:
	.ascii	"<3>%s: Powering on modem for the first time\012\000"
	.space	3
.LC4:
	.ascii	"<3>%s: soft resetting mdm modem\012\000"
	.space	3
.LC5:
	.ascii	"version\000"
.LC6:
	.ascii	"mdm2\000"
	.space	3
.LC7:
	.ascii	"2.0\000"
.LC8:
	.ascii	"mdm2_modem\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	mdm_debug_on, %object
	.size	mdm_debug_on, 4
mdm_debug_on:
	.space	4
	.type	power_on_count, %object
	.size	power_on_count, 4
power_on_count:
	.space	4
	.ident	"GCC: (GNU) 4.8"
