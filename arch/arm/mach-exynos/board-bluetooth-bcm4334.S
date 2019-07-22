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
	.file	"board-bluetooth-bcm4334.c"
	.text
	.align	2
	.type	bcm4334_bluetooth_init, %function
bcm4334_bluetooth_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:platform_driver_register
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:platform_driver_register
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	bcm4334_bluetooth_init, .-bcm4334_bluetooth_init
	.align	2
	.type	bcm4334_bluetooth_remove, %function
bcm4334_bluetooth_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	movw	r2, #:lower16:rfkill_unregister
	movt	r2, #:upper16:rfkill_unregister
	mov	r5, r3
	ldr	r0, [r3]
	movw	r4, #:lower16:gpio_free
	blx	r2
	movw	r3, #:lower16:rfkill_destroy
	ldr	r0, [r5], #80
	movt	r3, #:upper16:rfkill_destroy
	movt	r4, #:upper16:gpio_free
	blx	r3
	mov	r0, #119
	blx	r4
	mov	r0, #218
	blx	r4
	mov	r0, #214
	blx	r4
	movw	r3, #:lower16:wake_lock_destroy
	mov	r0, r5
	movt	r3, #:upper16:wake_lock_destroy
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	bcm4334_bluetooth_remove, .-bcm4334_bluetooth_remove
	.align	2
	.type	enter_lpm, %function
enter_lpm:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR1
	movt	r4, #:upper16:.LANCHOR1
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	mov	r5, #0
	ldr	r0, [r4, #72]
	blx	r3
	movw	r3, #:lower16:wake_unlock
	mov	r6, r0
	movt	r3, #:upper16:wake_unlock
	add	r0, r4, #80
	str	r5, [r4, #256]
	blx	r3
	movw	r3, #:lower16:__gpio_set_value
	mov	r1, r5
	movt	r3, #:upper16:__gpio_set_value
	mov	r0, #218
	blx	r3
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	ldr	r0, [r4, #72]
	mov	r1, r6
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	enter_lpm, .-enter_lpm
	.align	2
	.type	host_wake_isr, %function
host_wake_isr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:__gpio_get_value
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:__gpio_get_value
	mov	r4, r0
	mov	r0, #214
	blx	r3
	mov	r5, r0
	movw	r3, #:lower16:irq_set_irq_type
	cmp	r5, #0
	mov	r0, r4
	movw	r4, #:lower16:.LANCHOR1
	moveq	r1, #4
	movne	r1, #8
	movt	r4, #:upper16:.LANCHOR1
	movt	r3, #:upper16:irq_set_irq_type
	blx	r3
	ldr	r0, [r4, #72]
	cmp	r0, #0
	streq	r5, [r4, #8]
	beq	.L7
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	blx	r3
	ldr	r3, [r4, #8]
	mov	r6, r0
	cmp	r5, r3
	beq	.L8
	cmp	r5, #0
	mov	r3, #1
	str	r5, [r4, #8]
	str	r3, [r4, #256]
	bne	.L12
	movw	r3, #:lower16:wake_lock_timeout
	add	r0, r4, #80
	movt	r3, #:upper16:wake_lock_timeout
	mov	r1, #150
	blx	r3
.L8:
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	ldr	r0, [r4, #72]
	mov	r1, r6
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
.L7:
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, pc}
.L12:
	movw	r3, #:lower16:wake_lock
	add	r0, r4, #80
	movt	r3, #:upper16:wake_lock
	blx	r3
	b	.L8
	.fnend
	.size	host_wake_isr, .-host_wake_isr
	.align	2
	.type	bcm4334_bluetooth_probe, %function
bcm4334_bluetooth_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r1, #:lower16:.LC0
	movw	r4, #:lower16:gpio_request
	.pad #8
	sub	sp, sp, #8
	mov	r7, r0
	movt	r1, #:upper16:.LC0
	movt	r4, #:upper16:gpio_request
	mov	r0, #119
	blx	r4
	subs	r3, r0, #0
	bne	.L27
	movw	r1, #:lower16:.LC2
	mov	r0, #218
	movt	r1, #:upper16:.LC2
	blx	r4
	subs	r5, r0, #0
	bne	.L28
	movw	r1, #:lower16:.LC4
	mov	r0, #214
	movt	r1, #:upper16:.LC4
	blx	r4
	subs	r4, r0, #0
	bne	.L29
	movw	r3, #:lower16:gpio_direction_input
	mov	r0, #214
	movt	r3, #:upper16:gpio_direction_input
	movw	r5, #:lower16:gpio_direction_output
	blx	r3
	movt	r5, #:upper16:gpio_direction_output
	mov	r1, r4
	mov	r0, #218
	movw	r6, #:lower16:.LANCHOR1
	blx	r5
	mov	r1, r4
	mov	r0, #119
	blx	r5
	movw	r0, #:lower16:.LC6
	movw	r3, #:lower16:.LANCHOR2
	movw	ip, #:lower16:rfkill_alloc
	str	r4, [sp]
	add	r1, r7, #8
	movt	r0, #:upper16:.LC6
	movt	r3, #:upper16:.LANCHOR2
	movt	ip, #:upper16:rfkill_alloc
	mov	r2, #2
	movt	r6, #:upper16:.LANCHOR1
	blx	ip
	cmp	r0, #0
	str	r0, [r6]
	beq	.L30
	movw	r3, #:lower16:rfkill_init_sw_state
	mov	r1, r4
	movt	r3, #:upper16:rfkill_init_sw_state
	blx	r3
	movw	r3, #:lower16:rfkill_register
	ldr	r0, [r6]
	movt	r3, #:upper16:rfkill_register
	blx	r3
	subs	r7, r0, #0
	bne	.L31
	movw	r3, #:lower16:rfkill_set_sw_state
	mov	r1, #1
	movt	r3, #:upper16:rfkill_set_sw_state
	ldr	r0, [r6]
	blx	r3
	mov	r1, #1
	movw	r3, #:lower16:hrtimer_init
	mov	r2, r1
	movt	r3, #:upper16:hrtimer_init
	add	r0, r6, #16
	mov	r4, #51712
	blx	r3
	movw	r2, #:lower16:.LC9
	add	r3, r6, #152
	movt	r2, #:upper16:.LC9
	movt	r4, 15258
	ldmia	r2, {r0, r1, r2}
	mov	r5, #0
	movw	lr, #:lower16:enter_lpm
	movw	ip, #:lower16:wake_lock_init
	movt	lr, #:upper16:enter_lpm
	movt	ip, #:upper16:wake_lock_init
	strd	r4, [r6, #64]
	stmia	r3!, {r0, r1}
	mov	r1, r7
	mov	r8, r2, lsr #16
	strh	r2, [r3], #2	@ movhi
	mov	r0, r3
	str	lr, [r6, #48]
	sub	r2, r3, #10
	strb	r8, [r0], #-82
	str	r7, [r6, #8]
	str	r7, [r6, #256]
	blx	ip
	movw	r3, #:lower16:.LC10
	movw	r1, #:lower16:host_wake_isr
	movt	r3, #:upper16:.LC10
	movw	ip, #:lower16:request_threaded_irq
	str	r3, [sp]
	mov	r2, r7
	str	r7, [sp, #4]
	movt	r1, #:upper16:host_wake_isr
	movt	ip, #:upper16:request_threaded_irq
	movw	r0, #374
	mov	r3, #4
	blx	ip
	subs	r4, r0, #0
	bne	.L32
	movw	r3, #:lower16:irq_set_irq_wake
	movw	r0, #374
	movt	r3, #:upper16:irq_set_irq_wake
	mov	r1, #1
	blx	r3
	cmp	r0, #0
	bne	.L33
.L23:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L27:
	movw	r0, #:lower16:.LC1
	movw	r2, #:lower16:printk
	movt	r2, #:upper16:printk
	movt	r0, #:upper16:.LC1
	mov	r4, r3
	blx	r2
	b	.L23
.L33:
	movw	r0, #:lower16:.LC12
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC12
	movt	r3, #:upper16:printk
	blx	r3
.L21:
	movw	r3, #:lower16:rfkill_unregister
	ldr	r0, [r6]
	movt	r3, #:upper16:rfkill_unregister
	movw	r5, #:lower16:gpio_free
	blx	r3
	movw	r3, #:lower16:rfkill_destroy
	ldr	r0, [r6]
	movt	r3, #:upper16:rfkill_destroy
	movt	r5, #:upper16:gpio_free
	blx	r3
	mov	r4, #0
	mov	r0, #214
.L26:
	blx	r5
	mov	r0, #218
	blx	r5
	mov	r0, #119
	blx	r5
	b	.L23
.L32:
	movw	r0, #:lower16:.LC11
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC11
	blx	r3
	b	.L21
.L31:
	movw	r0, #:lower16:.LC8
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC8
	blx	r3
	movw	r3, #:lower16:rfkill_destroy
	ldr	r0, [r6]
	movt	r3, #:upper16:rfkill_destroy
	movw	r5, #:lower16:gpio_free
	blx	r3
	movt	r5, #:upper16:gpio_free
	mov	r0, #214
	blx	r5
	mov	r0, #218
	mvn	r4, #0
	blx	r5
	mov	r0, #119
	blx	r5
	b	.L23
.L30:
	movw	r0, #:lower16:.LC7
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC7
	movt	r3, #:upper16:printk
	movw	r5, #:lower16:gpio_free
	mvn	r4, #11
	blx	r3
	movt	r5, #:upper16:gpio_free
	mov	r0, #214
	b	.L26
.L29:
	movw	r0, #:lower16:.LC5
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC5
	movw	r5, #:lower16:gpio_free
	blx	r3
	movt	r5, #:upper16:gpio_free
	mov	r0, #218
	blx	r5
	mov	r0, #119
	blx	r5
	b	.L23
.L28:
	movw	r0, #:lower16:.LC3
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC3
	blx	r3
	movw	r3, #:lower16:gpio_free
	mov	r0, #119
	movt	r3, #:upper16:gpio_free
	mov	r4, r5
	blx	r3
	b	.L23
	.fnend
	.size	bcm4334_bluetooth_probe, .-bcm4334_bluetooth_probe
	.align	2
	.global	bt_uart_rts_ctrl
	.type	bt_uart_rts_ctrl, %function
bt_uart_rts_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:__gpio_get_value
	mov	r4, r0
	movt	r3, #:upper16:__gpio_get_value
	mov	r0, #119
	blx	r3
	cmp	r0, #0
	ldmeqfd	sp!, {r3, r4, r5, pc}
	cmp	r4, #0
	bne	.L40
	movw	r5, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #14
	movt	r5, #:upper16:s3c_gpio_cfgpin
	mov	r0, #3
	blx	r5
	movw	r3, #:lower16:__gpio_set_value
	mov	r1, r4
	movt	r3, #:upper16:__gpio_set_value
	mov	r0, #3
	blx	r3
	mvn	r1, #13
	mov	r0, #3
	blx	r5
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, r4
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #3
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
.L40:
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #14
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mov	r0, #3
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #0
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #3
	blx	r3
	movw	r3, #:lower16:__gpio_set_value
	mov	r0, #3
	movt	r3, #:upper16:__gpio_set_value
	mov	r1, #1
	blx	r3
	movw	r3, #:lower16:s3c_gpio_slp_cfgpin
	mov	r1, #0
	movt	r3, #:upper16:s3c_gpio_slp_cfgpin
	mov	r0, #3
	blx	r3
	movw	r3, #:lower16:s3c_gpio_slp_setpull_updown
	mov	r1, #0
	movt	r3, #:upper16:s3c_gpio_slp_setpull_updown
	mov	r0, #3
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	bt_uart_rts_ctrl, .-bt_uart_rts_ctrl
	.align	2
	.global	bcm_bt_lpm_exit_lpm_locked
	.type	bcm_bt_lpm_exit_lpm_locked, %function
bcm_bt_lpm_exit_lpm_locked:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR1
	movt	r4, #:upper16:.LANCHOR1
	movw	r3, #:lower16:hrtimer_try_to_cancel
	add	r6, r4, #16
	movt	r3, #:upper16:hrtimer_try_to_cancel
	str	r0, [r4, #72]
	.pad #8
	sub	sp, sp, #8
	mov	r0, r6
	mov	r5, #1
	blx	r3
	movw	r3, #:lower16:__gpio_set_value
	mov	r1, r5
	movt	r3, #:upper16:__gpio_set_value
	mov	r0, #218
	str	r5, [r4, #256]
	blx	r3
	movw	ip, #:lower16:hrtimer_start
	ldrd	r2, [r4, #64]
	str	r5, [sp]
	mov	r0, r6
	movt	ip, #:upper16:hrtimer_start
	blx	ip
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	bcm_bt_lpm_exit_lpm_locked, .-bcm_bt_lpm_exit_lpm_locked
	.align	2
	.global	bt_config_gpio_table
	.type	bt_config_gpio_table, %function
bt_config_gpio_table:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	subs	r9, r0, #0
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
	movw	r8, #:lower16:s3c_gpio_cfgpin
	movw	r7, #:lower16:s3c_gpio_setpull
	movw	r10, #:lower16:__gpio_set_value
	mov	r4, r1
	movt	r8, #:upper16:s3c_gpio_cfgpin
	movt	r7, #:upper16:s3c_gpio_setpull
	movt	r10, #:upper16:__gpio_set_value
	mov	r6, #0
.L46:
	ldr	r1, [r4, #4]
	add	r6, r6, #1
	ldr	r5, [r4]
	add	r4, r4, #16
	mvn	r1, r1, asl #28
	mov	r0, r5
	mvn	r1, r1, lsr #28
	blx	r8
	ldr	r1, [r4, #-4]
	mov	r0, r5
	blx	r7
	ldr	r1, [r4, #-8]
	mov	r0, r5
	cmp	r1, #2
	beq	.L44
	blx	r10
.L44:
	cmp	r6, r9
	bne	.L46
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
	.fnend
	.size	bt_config_gpio_table, .-bt_config_gpio_table
	.align	2
	.type	bcm4334_bt_rfkill_set_power, %function
bcm4334_bt_rfkill_set_power:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	beq	.L53
	movw	r0, #:lower16:.LC14
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC14
	blx	r3
	mov	ip, #0
	movw	r2, #:lower16:.LANCHOR1
	movw	r3, #:lower16:__gpio_set_value
	movt	r2, #:upper16:.LANCHOR1
	mov	r1, ip
	movt	r3, #:upper16:__gpio_set_value
	mov	r0, #119
	str	ip, [r2, #256]
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
.L53:
	movw	r0, #:lower16:.LC13
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC13
	blx	r3
	mov	r0, #4
	ldr	r1, .L54
	bl	bt_config_gpio_table
	movw	r3, #:lower16:__gpio_set_value
	mov	r1, #1
	mov	r0, #119
	movt	r3, #:upper16:__gpio_set_value
	blx	r3
	movw	r3, #:lower16:msleep
	mov	r0, #50
	movt	r3, #:upper16:msleep
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
.L55:
	.align	2
.L54:
	.word	.LANCHOR0+80
	.fnend
	.size	bcm4334_bt_rfkill_set_power, .-bcm4334_bt_rfkill_set_power
	.global	bt_is_running
	.global	bt_lpm
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	bcm4334_bt_rfkill_ops, %object
	.size	bcm4334_bt_rfkill_ops, 12
bcm4334_bt_rfkill_ops:
	.space	8
	.word	bcm4334_bt_rfkill_set_power
	.section	___ksymtab+bt_uart_rts_ctrl,"a",%progbits
	.align	2
	.type	__ksymtab_bt_uart_rts_ctrl, %object
	.size	__ksymtab_bt_uart_rts_ctrl, 8
__ksymtab_bt_uart_rts_ctrl:
	.word	bt_uart_rts_ctrl
	.word	__kstrtab_bt_uart_rts_ctrl
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_bcm_bt_lpm_exit_lpm_locked, %object
	.size	__kstrtab_bcm_bt_lpm_exit_lpm_locked, 27
__kstrtab_bcm_bt_lpm_exit_lpm_locked:
	.ascii	"bcm_bt_lpm_exit_lpm_locked\000"
	.type	__kstrtab_bt_uart_rts_ctrl, %object
	.size	__kstrtab_bt_uart_rts_ctrl, 17
__kstrtab_bt_uart_rts_ctrl:
	.ascii	"bt_uart_rts_ctrl\000"
	.type	__kstrtab_bt_is_running, %object
	.size	__kstrtab_bt_is_running, 14
__kstrtab_bt_is_running:
	.ascii	"bt_is_running\000"
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_bcm4334_bluetooth_init6, %object
	.size	__initcall_bcm4334_bluetooth_init6, 4
__initcall_bcm4334_bluetooth_init6:
	.word	bcm4334_bluetooth_init
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	bcm4334_bluetooth_platform_driver, %object
	.size	bcm4334_bluetooth_platform_driver, 80
bcm4334_bluetooth_platform_driver:
	.word	bcm4334_bluetooth_probe
	.word	bcm4334_bluetooth_remove
	.space	12
	.word	.LC15
	.space	4
	.word	0
	.space	44
	.space	4
	.type	bt_uart_on_table, %object
	.size	bt_uart_on_table, 64
bt_uart_on_table:
	.word	0
	.word	2
	.word	2
	.word	0
	.word	1
	.word	2
	.word	2
	.word	0
	.word	2
	.word	2
	.word	2
	.word	0
	.word	3
	.word	2
	.word	2
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"bcm4334_bten_gpio\000"
	.space	2
.LC1:
	.ascii	"<3>[BT] GPIO_BT_EN request failed.\012\000"
.LC2:
	.ascii	"bcm4334_btwake_gpio\000"
.LC3:
	.ascii	"<3>[BT] GPIO_BT_WAKE request failed.\012\000"
	.space	2
.LC4:
	.ascii	"bcm4334_bthostwake_gpio\000"
.LC5:
	.ascii	"<3>[BT] GPIO_BT_HOST_WAKE request failed.\012\000"
	.space	1
.LC6:
	.ascii	"bcm4334 Bluetooth\000"
	.space	2
.LC7:
	.ascii	"<3>[BT] bt_rfkill alloc failed.\012\000"
	.space	3
.LC8:
	.ascii	"<3>[BT] bt_rfkill register failed.\012\000"
.LC9:
	.ascii	"BTLowPower\000"
	.space	1
.LC10:
	.ascii	"bt host_wake\000"
	.space	3
.LC11:
	.ascii	"<3>[BT] Request_host wake irq failed.\012\000"
	.space	1
.LC12:
	.ascii	"<3>[BT] Set_irq_wake failed.\012\000"
	.space	2
.LC13:
	.ascii	"<6>[BT] Bluetooth Power On.\012\000"
	.space	3
.LC14:
	.ascii	"<6>[BT] Bluetooth Power Off.\012\000"
	.space	2
.LC15:
	.ascii	"bcm4334_bluetooth\000"
	.section	___ksymtab+bt_is_running,"a",%progbits
	.align	2
	.type	__ksymtab_bt_is_running, %object
	.size	__ksymtab_bt_is_running, 8
__ksymtab_bt_is_running:
	.word	bt_is_running
	.word	__kstrtab_bt_is_running
	.bss
	.align	3
	.set	.LANCHOR1,. + 0
	.type	bt_rfkill, %object
	.size	bt_rfkill, 4
bt_rfkill:
	.space	4
	.space	4
	.type	bt_lpm, %object
	.size	bt_lpm, 248
bt_lpm:
	.space	248
	.type	bt_is_running, %object
	.size	bt_is_running, 4
bt_is_running:
	.space	4
	.section	___ksymtab+bcm_bt_lpm_exit_lpm_locked,"a",%progbits
	.align	2
	.type	__ksymtab_bcm_bt_lpm_exit_lpm_locked, %object
	.size	__ksymtab_bcm_bt_lpm_exit_lpm_locked, 8
__ksymtab_bcm_bt_lpm_exit_lpm_locked:
	.word	bcm_bt_lpm_exit_lpm_locked
	.word	__kstrtab_bcm_bt_lpm_exit_lpm_locked
	.ident	"GCC: (GNU) 4.8"
