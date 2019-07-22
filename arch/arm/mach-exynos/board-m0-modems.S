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
	.file	"board-m0-modems.c"
	.text
	.align	2
	.type	umts_link_ldo_enble, %function
umts_link_ldo_enble:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	umts_link_ldo_enble, .-umts_link_ldo_enble
	.align	2
	.type	xmm_gpio_revers_bias_restore, %function
xmm_gpio_revers_bias_restore:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	movw	r5, #:lower16:s3c_gpio_cfgpin
	movt	r5, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #0
	ldr	r7, [r4, #108]
	movw	r6, #:lower16:gpio_direction_input
	ldr	r0, [r4, #24]
	movt	r6, #:upper16:gpio_direction_input
	blx	r5
	mvn	r1, #0
	ldr	r0, [r4, #192]
	blx	r5
	ldr	r0, [r4, #92]
	blx	r6
	cmp	r7, #0
	ldmeqfd	sp!, {r3, r4, r5, r6, r7, pc}
	mov	r0, r7
	movw	r4, #:lower16:__gpio_to_irq
	blx	r6
	mov	r0, r7
	mvn	r1, #0
	blx	r5
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #0
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, r7
	blx	r3
	movt	r4, #:upper16:__gpio_to_irq
	mov	r0, r7
	blx	r4
	movw	r3, #:lower16:irq_set_irq_type
	mov	r1, #3
	movt	r3, #:upper16:irq_set_irq_type
	blx	r3
	mov	r0, r7
	blx	r4
	movw	r3, #:lower16:irq_set_irq_wake
	mov	r1, #1
	movt	r3, #:upper16:irq_set_irq_wake
	blx	r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	xmm_gpio_revers_bias_restore, .-xmm_gpio_revers_bias_restore
	.align	2
	.type	xmm_gpio_revers_bias_clear, %function
xmm_gpio_revers_bias_clear:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	movw	r5, #:lower16:gpio_direction_output
	movt	r5, #:upper16:gpio_direction_output
	mov	r1, #0
	ldr	r0, [r4, #20]
	blx	r5
	mov	r1, #0
	ldr	r0, [r4, #24]
	blx	r5
	mov	r1, #0
	ldr	r0, [r4, #92]
	blx	r5
	mov	r1, #0
	ldr	r0, [r4, #188]
	blx	r5
	mov	r1, #0
	ldr	r0, [r4, #192]
	blx	r5
	ldr	r0, [r4, #196]
	mov	r1, #0
	blx	r5
	ldr	r0, [r4, #108]
	cmp	r0, #0
	beq	.L9
	mov	r1, #0
	blx	r5
.L9:
	movw	r3, #:lower16:msleep
	mov	r0, #20
	movt	r3, #:upper16:msleep
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	xmm_gpio_revers_bias_clear, .-xmm_gpio_revers_bias_clear
	.align	2
	.type	init_modem, %function
init_modem:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:system_rev
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movt	r3, #:upper16:system_rev
	movw	r0, #:lower16:.LC0
	movw	r6, #:lower16:printk
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	ldr	r1, [r3]
	.pad #20
	sub	sp, sp, #20
	movt	r0, #:upper16:.LC0
	movt	r6, #:upper16:printk
	blx	r6
	ldr	r2, [r4, #92]
	ldr	r8, [r4, #12]
	ldr	r3, [r4, #4]
	str	r2, [sp, #4]
	ldr	r2, [r4, #96]
	cmp	r8, #0
	ldr	r10, [r4, #16]
	ldr	fp, [r4, #20]
	str	r2, [sp, #8]
	ldr	r2, [r4, #100]
	ldr	r7, [r4, #24]
	ldr	r9, [r4, #108]
	str	r2, [sp, #12]
	bne	.L132
	movw	r5, #:lower16:gpio_request
	movt	r5, #:upper16:gpio_request
.L14:
	cmp	r3, #0
	bne	.L133
.L16:
	cmp	r10, #0
	bne	.L134
.L18:
	cmp	fp, #0
	bne	.L135
.L20:
	cmp	r7, #0
	bne	.L136
.L22:
	cmp	r9, #0
	bne	.L137
.L24:
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L138
.L26:
	ldr	r3, [sp, #8]
	cmp	r3, #0
	bne	.L139
.L28:
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L140
.L30:
	cmp	r7, #0
	bne	.L141
.L32:
	movw	r1, #:lower16:.LC12
	movw	r0, #270
	movt	r1, #:upper16:.LC12
	blx	r5
	subs	r7, r0, #0
	bne	.L142
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, r7
	movt	r3, #:upper16:gpio_direction_output
	movw	r0, #270
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, r7
	movt	r3, #:upper16:s3c_gpio_setpull
	movw	r0, #270
	blx	r3
.L34:
	movw	r0, #:lower16:.LC13
	movw	r8, #:lower16:printk
	movt	r0, #:upper16:.LC13
	movt	r8, #:upper16:printk
	blx	r6
	ldr	fp, [r4, #184]
	ldr	r10, [r4, #188]
	ldr	r7, [r4, #192]
	cmp	fp, #0
	ldr	r9, [r4, #196]
	bne	.L143
.L35:
	cmp	r10, #0
	bne	.L144
.L37:
	cmp	r7, #0
	bne	.L145
.L39:
	cmp	r9, #0
	bne	.L146
.L41:
	cmp	r7, #0
	beq	.L43
	movw	r3, #:lower16:__gpio_to_irq
	mov	r0, r7
	movt	r3, #:upper16:__gpio_to_irq
	blx	r3
	movw	r3, #:lower16:irq_set_irq_type
	mov	r1, #3
	movt	r3, #:upper16:irq_set_irq_type
	blx	r3
.L43:
	movw	r3, #:lower16:.LANCHOR1
	movw	r0, #:lower16:.LC18
	movt	r3, #:upper16:.LANCHOR1
	mov	r2, #1
	movt	r0, #:upper16:.LC18
	str	r2, [r3]
	blx	r6
	ldr	r2, [r4, #108]
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	cmp	r2, #0
	add	r0, r4, #248
	movne	r2, #0
	strneb	r2, [r3, #165]
	movw	r3, #:lower16:platform_device_register
	movt	r3, #:upper16:platform_device_register
	blx	r3
	subs	r5, r0, #0
	blt	.L147
.L45:
	mov	r0, r5
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L146:
	movw	r1, #:lower16:.LC17
	mov	r0, r9
	movt	r1, #:upper16:.LC17
	blx	r5
	subs	r2, r0, #0
	bne	.L148
.L42:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, r9
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	b	.L41
.L145:
	movw	r1, #:lower16:.LC16
	mov	r0, r7
	movt	r1, #:upper16:.LC16
	blx	r5
	subs	r2, r0, #0
	bne	.L149
.L40:
	movw	r3, #:lower16:gpio_direction_input
	mov	r0, r7
	movt	r3, #:upper16:gpio_direction_input
	blx	r3
	b	.L39
.L144:
	movw	r1, #:lower16:.LC15
	mov	r0, r10
	movt	r1, #:upper16:.LC15
	blx	r5
	subs	r2, r0, #0
	bne	.L150
.L38:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, r10
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	b	.L37
.L143:
	movw	r1, #:lower16:.LC14
	mov	r0, fp
	movt	r1, #:upper16:.LC14
	blx	r5
	subs	r2, r0, #0
	bne	.L151
.L36:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, fp
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	b	.L35
.L141:
	movw	r3, #:lower16:__gpio_to_irq
	mov	r0, r7
	movt	r3, #:upper16:__gpio_to_irq
	blx	r3
	movw	r3, #:lower16:irq_set_irq_type
	mov	r1, #4
	movt	r3, #:upper16:irq_set_irq_type
	blx	r3
	b	.L32
.L140:
	movw	r1, #:lower16:.LC11
	mov	r0, r3
	movt	r1, #:upper16:.LC11
	blx	r5
	subs	r2, r0, #0
	bne	.L152
.L31:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, r8
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	b	.L30
.L139:
	movw	r1, #:lower16:.LC10
	mov	r0, r3
	movt	r1, #:upper16:.LC10
	blx	r5
	subs	r2, r0, #0
	bne	.L153
.L29:
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, #0
	movt	r3, #:upper16:gpio_direction_output
	ldr	r0, [sp, #8]
	blx	r3
	b	.L28
.L138:
	movw	r1, #:lower16:.LC9
	mov	r0, r3
	movt	r1, #:upper16:.LC9
	blx	r5
	subs	r2, r0, #0
	bne	.L154
.L27:
	movw	r3, #:lower16:gpio_direction_input
	ldr	r0, [sp, #4]
	movt	r3, #:upper16:gpio_direction_input
	blx	r3
	b	.L26
.L137:
	movw	r1, #:lower16:.LC7
	mov	r0, r9
	movt	r1, #:upper16:.LC7
	blx	r5
	subs	r2, r0, #0
	bne	.L155
.L25:
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mov	r0, r9
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #0
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #1
	mov	r0, r9
	movt	r3, #:upper16:s3c_gpio_setpull
	blx	r3
	movw	r3, #:lower16:__gpio_to_irq
	mov	r0, r9
	movt	r3, #:upper16:__gpio_to_irq
	blx	r3
	movw	r3, #:lower16:irq_set_irq_type
	mov	r1, #3
	movt	r3, #:upper16:irq_set_irq_type
	blx	r3
	b	.L24
.L136:
	movw	r1, #:lower16:.LC6
	mov	r0, r7
	movt	r1, #:upper16:.LC6
	blx	r5
	subs	r2, r0, #0
	bne	.L156
.L23:
	movw	r3, #:lower16:gpio_direction_input
	mov	r0, r7
	movt	r3, #:upper16:gpio_direction_input
	blx	r3
	b	.L22
.L135:
	movw	r1, #:lower16:.LC5
	mov	r0, fp
	movt	r1, #:upper16:.LC5
	blx	r5
	subs	r2, r0, #0
	bne	.L157
.L21:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, fp
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	b	.L20
.L134:
	movw	r1, #:lower16:.LC4
	mov	r0, r10
	movt	r1, #:upper16:.LC4
	blx	r5
	subs	r2, r0, #0
	bne	.L158
.L19:
	movw	r3, #:lower16:s3c_gpio_slp_cfgpin
	mov	r0, r10
	movt	r3, #:upper16:s3c_gpio_slp_cfgpin
	mov	r1, #1
	blx	r3
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, r10
	mov	r1, #0
	movt	r3, #:upper16:gpio_direction_output
	blx	r3
	b	.L18
.L133:
	movw	r1, #:lower16:.LC3
	mov	r0, r3
	str	r3, [sp]
	movt	r1, #:upper16:.LC3
	blx	r5
	subs	r2, r0, #0
	ldr	r3, [sp]
	bne	.L159
.L17:
	movw	r2, #:lower16:gpio_direction_output
	mov	r0, r3
	movt	r2, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r2
	b	.L16
.L132:
	movw	r1, #:lower16:.LC1
	movw	r5, #:lower16:gpio_request
	str	r3, [sp]
	movt	r1, #:upper16:.LC1
	movt	r5, #:upper16:gpio_request
	mov	r0, r8
	blx	r5
	subs	r2, r0, #0
	ldr	r3, [sp]
	bne	.L160
.L15:
	movw	r2, #:lower16:s3c_gpio_slp_cfgpin
	str	r3, [sp]
	movt	r2, #:upper16:s3c_gpio_slp_cfgpin
	mov	r1, #1
	mov	r0, r8
	blx	r2
	movw	r2, #:lower16:gpio_direction_output
	mov	r0, r8
	mov	r1, #0
	movt	r2, #:upper16:gpio_direction_output
	blx	r2
	ldr	r3, [sp]
	b	.L14
.L147:
	movw	r0, #:lower16:.LC19
	ldr	r1, [r4, #248]
	movt	r0, #:upper16:.LC19
	blx	r6
	b	.L45
.L142:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC12
	mov	r2, r7
	movt	r1, #:upper16:.LC12
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L34
.L148:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC17
	movt	r1, #:upper16:.LC17
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L42
.L153:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC10
	movt	r1, #:upper16:.LC10
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L29
.L154:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC9
	movt	r1, #:upper16:.LC9
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L27
.L149:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC16
	movt	r1, #:upper16:.LC16
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L40
.L150:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC15
	movt	r1, #:upper16:.LC15
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L38
.L151:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC14
	movt	r1, #:upper16:.LC14
	movt	r0, #:upper16:.LC2
	blx	r8
	b	.L36
.L152:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC11
	movt	r1, #:upper16:.LC11
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L31
.L157:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC5
	movt	r1, #:upper16:.LC5
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L21
.L158:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC4
	movt	r1, #:upper16:.LC4
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L19
.L159:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC3
	movt	r0, #:upper16:.LC2
	movt	r1, #:upper16:.LC3
	blx	r6
	ldr	r3, [sp]
	b	.L17
.L160:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC1
	movt	r0, #:upper16:.LC2
	movt	r1, #:upper16:.LC1
	blx	r6
	ldr	r3, [sp]
	b	.L15
.L155:
	movw	r0, #:lower16:.LC8
	movw	r1, #:lower16:.LC7
	movt	r1, #:upper16:.LC7
	movt	r0, #:upper16:.LC8
	blx	r6
	b	.L25
.L156:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC6
	movt	r1, #:upper16:.LC6
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L23
	.fnend
	.size	init_modem, .-init_modem
	.align	2
	.global	set_slave_wake
	.type	set_slave_wake, %function
set_slave_wake:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r5, #:lower16:__gpio_get_value
	movt	r4, #:upper16:.LANCHOR0
	movt	r5, #:upper16:__gpio_get_value
	ldr	r0, [r4, #192]
	blx	r5
	cmp	r0, #0
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, pc}
	movw	r0, #:lower16:.LC20
	movw	r6, #:lower16:printk
	movt	r0, #:upper16:.LC20
	movt	r6, #:upper16:printk
	blx	r6
	ldr	r0, [r4, #196]
	blx	r5
	cmp	r0, #0
	bne	.L163
	movw	r5, #:lower16:gpio_direction_output
	movt	r5, #:upper16:gpio_direction_output
.L164:
	ldr	r0, [r4, #196]
	mov	r1, #1
	blx	r5
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L163:
	movw	r0, #:lower16:.LC21
	movw	r5, #:lower16:gpio_direction_output
	movt	r0, #:upper16:.LC21
	movw	r8, #:lower16:__const_udelay
	blx	r6
	movt	r5, #:upper16:gpio_direction_output
	ldr	r0, [r4, #196]
	mov	r1, #0
	movt	r8, #:upper16:__const_udelay
	mov	r7, #10
	blx	r5
.L165:
	movw	r0, #12560
	movt	r0, 4915
	blx	r8
	subs	r7, r7, #1
	bne	.L165
	b	.L164
	.fnend
	.size	set_slave_wake, .-set_slave_wake
	.align	2
	.type	umts_link_reconnect, %function
umts_link_reconnect:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r5, #:lower16:__gpio_get_value
	movt	r4, #:upper16:.LANCHOR0
	movt	r5, #:upper16:__gpio_get_value
	ldr	r0, [r4, #24]
	blx	r5
	cmp	r0, #0
	beq	.L175
	ldr	r0, [r4, #16]
	blx	r5
	cmp	r0, #0
	bne	.L181
.L175:
	mvn	r0, #18
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L181:
	movw	r0, #:lower16:.LC22
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC22
	movt	r3, #:upper16:printk
	movw	r7, #:lower16:__gpio_set_value
	movw	r6, #:lower16:__const_udelay
	blx	r3
	movt	r7, #:upper16:__gpio_set_value
	ldr	r0, [r4, #188]
	mov	r1, #0
	movt	r6, #:upper16:__const_udelay
	mov	r5, #10
	blx	r7
.L177:
	movw	r0, #12560
	movt	r0, 4915
	blx	r6
	subs	r5, r5, #1
	bne	.L177
	bl	set_slave_wake
	ldr	r0, [r4, #188]
	mov	r1, #1
	blx	r7
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	umts_link_reconnect, .-umts_link_reconnect
	.align	2
	.global	set_host_states
	.type	set_host_states, %function
set_host_states:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r3, #:lower16:__gpio_get_value
	movt	r4, #:upper16:.LANCHOR0
	mov	r6, r0
	movt	r3, #:upper16:__gpio_get_value
	ldr	r0, [r4, #16]
	mov	r5, r1
	blx	r3
	cmp	r0, #0
	beq	.L188
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r3, [r3]
	cmp	r3, #0
	ldmeqfd	sp!, {r4, r5, r6, pc}
	movw	r0, #:lower16:.LC24
	movw	r3, #:lower16:printk
	mov	r1, r5
	ldr	r2, [r6]
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC24
	blx	r3
	movw	r3, #:lower16:gpio_direction_output
	ldr	r0, [r4, #188]
	mov	r1, r5
	movt	r3, #:upper16:gpio_direction_output
	blx	r3
	ldmfd	sp!, {r4, r5, r6, pc}
.L188:
	movw	r0, #:lower16:.LC23
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC23
	blx	r3
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	set_host_states, .-set_host_states
	.align	2
	.global	set_hsic_lpa_states
	.type	set_hsic_lpa_states, %function
set_hsic_lpa_states:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r5, #:lower16:__gpio_get_value
	movt	r4, #:upper16:.LANCHOR0
	mov	r7, r0
	movt	r5, #:upper16:__gpio_get_value
	ldr	r0, [r4, #16]
	mov	r9, lr
	movw	r6, #:lower16:printk
	blx	r5
	movw	r1, #:lower16:.LANCHOR2
	mov	r8, r0
	movw	r0, #:lower16:.LC25
	mov	r3, r9
	movt	r0, #:upper16:.LC25
	movt	r1, #:upper16:.LANCHOR2
	movt	r6, #:upper16:printk
	mov	r2, #300
	blx	r6
	cmp	r8, #0
	ldmeqfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	cmp	r7, #1
	beq	.L191
	cmp	r7, #2
	beq	.L192
	cmp	r7, #0
	ldmnefd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	movw	r8, #:lower16:__gpio_set_value
	ldr	r0, [r4, #188]
	movt	r8, #:upper16:__gpio_set_value
	mov	r1, r7
	blx	r8
	mov	r1, r7
	ldr	r0, [r4, #20]
	blx	r8
	ldr	r0, [r4, #188]
	blx	r5
	mov	r7, r0
	ldr	r0, [r4, #20]
	blx	r5
	mov	r2, r0
	movw	r0, #:lower16:.LC26
	mov	r1, r7
	movt	r0, #:upper16:.LC26
	blx	r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L191:
	movw	r3, #:lower16:__gpio_set_value
	mov	r1, r7
	movt	r3, #:upper16:__gpio_set_value
	ldr	r0, [r4, #20]
	blx	r3
	ldr	r0, [r4, #20]
	blx	r5
	mov	r1, r0
	movw	r0, #:lower16:.LC27
	movt	r0, #:upper16:.LC27
	blx	r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L192:
	movw	r3, #:lower16:__gpio_set_value
	ldr	r0, [r4, #20]
	movt	r3, #:upper16:__gpio_set_value
	mov	r1, #1
	blx	r3
	bl	set_slave_wake
	ldr	r0, [r4, #196]
	blx	r5
	mov	r1, r0
	movw	r0, #:lower16:.LC28
	movt	r0, #:upper16:.LC28
	blx	r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	.fnend
	.size	set_hsic_lpa_states, .-set_hsic_lpa_states
	.align	2
	.global	get_cp_active_state
	.type	get_cp_active_state, %function
get_cp_active_state:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r2, #:lower16:.LANCHOR0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	r2, #:upper16:.LANCHOR0
	movw	r3, #:lower16:__gpio_get_value
	movt	r3, #:upper16:__gpio_get_value
	ldr	r0, [r2, #24]
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	get_cp_active_state, .-get_cp_active_state
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.22434, %object
	.size	__func__.22434, 20
__func__.22434:
	.ascii	"set_hsic_lpa_states\000"
	.section	.initcall7.init,"aw",%progbits
	.align	2
	.type	__initcall_init_modem7, %object
	.size	__initcall_init_modem7, 4
__initcall_init_modem7:
	.word	init_modem
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	umts_modem_data, %object
	.size	umts_modem_data, 176
umts_modem_data:
	.word	.LC30
	.word	131
	.space	4
	.word	275
	.word	219
	.word	62
	.word	205
	.space	64
	.word	201
	.word	235
	.word	0
	.word	0
	.space	16
	.word	0
	.word	1
	.word	8
	.space	16
	.word	11
	.word	umts_io_devices
	.word	modem_link_pm_data
	.byte	0
	.space	3
	.word	xmm_gpio_revers_bias_clear
	.word	xmm_gpio_revers_bias_restore
	.type	modem_link_pm_data, %object
	.size	modem_link_pm_data, 72
modem_link_pm_data:
	.word	.LC31
	.word	umts_link_ldo_enble
	.word	0
	.word	57
	.word	200
	.word	199
	.word	umts_link_reconnect
	.space	40
	.word	0
	.type	umts_modem, %object
	.size	umts_modem, 360
umts_modem:
	.word	.LC29
	.word	1
	.space	84
	.word	umts_modem_data
	.space	248
	.space	16
	.type	umts_io_devices, %object
	.size	umts_io_devices, 308
umts_io_devices:
	.word	.LC32
	.word	1
	.word	0
	.word	0
	.word	8
	.space	8
	.word	.LC33
	.word	65
	.word	2
	.word	0
	.word	8
	.space	8
	.word	.LC34
	.word	0
	.word	5
	.word	0
	.word	8
	.space	8
	.word	.LC35
	.word	1
	.word	3
	.word	2
	.word	8
	.space	8
	.word	.LC36
	.word	42
	.word	1
	.word	1
	.word	8
	.space	8
	.word	.LC37
	.word	43
	.word	1
	.word	1
	.word	8
	.space	8
	.word	.LC38
	.word	44
	.word	1
	.word	1
	.word	8
	.space	8
	.word	.LC39
	.word	57
	.word	1
	.word	0
	.word	8
	.space	8
	.word	.LC40
	.word	33
	.word	1
	.word	0
	.word	8
	.space	8
	.word	.LC41
	.word	0
	.word	6
	.word	0
	.word	8
	.space	8
	.word	.LC42
	.word	63
	.word	1
	.word	0
	.word	8
	.space	8
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>mif: init_modem, system_rev = %d\012\000"
	.space	3
.LC1:
	.ascii	"RESET_REQ_N\000"
.LC2:
	.ascii	"<3>mif: fail to request gpio %s : %d\012\000"
	.space	2
.LC3:
	.ascii	"CP_ON\000"
	.space	2
.LC4:
	.ascii	"CP_RST\000"
	.space	1
.LC5:
	.ascii	"PDA_ACTIVE\000"
	.space	1
.LC6:
	.ascii	"PHONE_ACTIVE\000"
	.space	3
.LC7:
	.ascii	"SIM_DETECT\000"
	.space	1
.LC8:
	.ascii	"<3>fail to request gpio %s: %d\012\000"
.LC9:
	.ascii	"CP_DUMP_INT\000"
.LC10:
	.ascii	"AP_DUMP_INT\000"
.LC11:
	.ascii	"GPS_UART_SEL\000"
	.space	3
.LC12:
	.ascii	"SUS_REQ\000"
.LC13:
	.ascii	"<6>mif: umts_modem_cfg_gpio done\012\000"
	.space	2
.LC14:
	.ascii	"LINK_EN\000"
.LC15:
	.ascii	"LINK_ACTIVE\000"
.LC16:
	.ascii	"HOSTWAKE\000"
	.space	3
.LC17:
	.ascii	"SLAVEWAKE\000"
	.space	2
.LC18:
	.ascii	"<6>mif: modem_link_pm_config_gpio done\012\000"
.LC19:
	.ascii	"<3>(%s) register fail\012\000"
	.space	1
.LC20:
	.ascii	"<6>[MODEM_IF]Slave Wake\012\000"
	.space	3
.LC21:
	.ascii	"<6>[MODEM_IF]Slave Wake set _-\012\000"
.LC22:
	.ascii	"<6>[MODEM_IF] trying reconnect link\012\000"
	.space	3
.LC23:
	.ascii	"<6>CP not ready, Active State low\012\000"
	.space	1
.LC24:
	.ascii	"<3>mif: Active States =%d, %s\012\000"
	.space	1
.LC25:
	.ascii	"<7>mif: %s: %d: called(%pF): \012\000"
	.space	1
.LC26:
	.ascii	"<6>mif: set hsic lpa enter: active state (%d), pda "
	.ascii	"active (%d)\012\000"
.LC27:
	.ascii	"<6>mif: set hsic lpa wake: pda active (%d)\012\000"
.LC28:
	.ascii	"<6>mif: set hsic lpa phy init: slave wake-up (%d)\012"
	.ascii	"\000"
	.space	1
.LC29:
	.ascii	"modem_if\000"
	.space	3
.LC30:
	.ascii	"xmm6262\000"
.LC31:
	.ascii	"link_pm\000"
.LC32:
	.ascii	"umts_ipc0\000"
	.space	2
.LC33:
	.ascii	"umts_rfs0\000"
	.space	2
.LC34:
	.ascii	"umts_boot0\000"
	.space	1
.LC35:
	.ascii	"multipdp\000"
	.space	3
.LC36:
	.ascii	"rmnet0\000"
	.space	1
.LC37:
	.ascii	"rmnet1\000"
	.space	1
.LC38:
	.ascii	"rmnet2\000"
	.space	1
.LC39:
	.ascii	"umts_router\000"
.LC40:
	.ascii	"umts_csd\000"
	.space	3
.LC41:
	.ascii	"umts_ramdump0\000"
	.space	2
.LC42:
	.ascii	"umts_loopback0\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	active_ctl, %object
	.size	active_ctl, 8
active_ctl:
	.space	8
	.ident	"GCC: (GNU) 4.8"
