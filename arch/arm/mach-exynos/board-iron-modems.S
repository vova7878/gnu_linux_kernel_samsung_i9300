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
	.file	"board-iron-modems.c"
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
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	movw	r5, #:lower16:s3c_gpio_cfgpin
	movt	r5, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #0
	ldr	r0, [r4, #24]
	blx	r5
	ldr	r0, [r4, #192]
	mvn	r1, #0
	blx	r5
	movw	r3, #:lower16:gpio_direction_input
	ldr	r0, [r4, #92]
	movt	r3, #:upper16:gpio_direction_input
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
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
	movw	r5, #:lower16:.LANCHOR0
	movt	r5, #:upper16:.LANCHOR0
	movw	r4, #:lower16:gpio_direction_output
	movt	r4, #:upper16:gpio_direction_output
	mov	r1, #0
	ldr	r0, [r5, #20]
	blx	r4
	ldr	r0, [r5, #24]
	mov	r1, #0
	blx	r4
	ldr	r0, [r5, #92]
	mov	r1, #0
	blx	r4
	ldr	r0, [r5, #188]
	mov	r1, #0
	blx	r4
	ldr	r0, [r5, #192]
	mov	r1, #0
	blx	r4
	ldr	r0, [r5, #196]
	mov	r1, #0
	blx	r4
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
	@ args = 0, pretend = 0, frame = 24
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
	.pad #28
	sub	sp, sp, #28
	movt	r0, #:upper16:.LC0
	movt	r6, #:upper16:printk
	movw	r7, #:lower16:.LANCHOR1
	blx	r6
	ldr	r2, [r4, #92]
	movt	r7, #:upper16:.LANCHOR1
	ldr	r9, [r4, #12]
	ldr	r3, [r4, #4]
	str	r2, [sp, #8]
	ldr	r2, [r4, #96]
	cmp	r9, #0
	ldr	r10, [r4, #16]
	ldr	fp, [r4, #20]
	str	r2, [sp, #12]
	ldr	r2, [r4, #100]
	ldr	r8, [r4, #24]
	str	r2, [sp, #16]
	ldr	r2, [r7]
	str	r2, [sp, #20]
	bne	.L116
	movw	r5, #:lower16:gpio_request
	movt	r5, #:upper16:gpio_request
.L5:
	cmp	r3, #0
	bne	.L118
.L7:
	cmp	r10, #0
	bne	.L119
.L9:
	cmp	fp, #0
	bne	.L120
.L11:
	cmp	r8, #0
	bne	.L121
.L13:
	ldr	r3, [sp, #8]
	cmp	r3, #0
	bne	.L122
.L15:
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L123
.L17:
	ldr	r3, [sp, #16]
	cmp	r3, #0
	bne	.L124
.L19:
	cmp	r8, #0
	bne	.L125
.L21:
	movw	r1, #:lower16:.LC11
	mov	r0, #13
	movt	r1, #:upper16:.LC11
	blx	r5
	subs	r8, r0, #0
	bne	.L126
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, r8
	movt	r3, #:upper16:gpio_direction_output
	mov	r0, #13
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, r8
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #13
	blx	r3
.L23:
	movw	r1, #:lower16:.LC12
	mov	r0, #14
	movt	r1, #:upper16:.LC12
	blx	r5
	subs	r8, r0, #0
	bne	.L127
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, r8
	movt	r3, #:upper16:gpio_direction_output
	mov	r0, #14
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, r8
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #14
	blx	r3
.L25:
	movw	r1, #:lower16:.LC13
	movw	r0, #270
	movt	r1, #:upper16:.LC13
	blx	r5
	subs	r8, r0, #0
	bne	.L128
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, r8
	movt	r3, #:upper16:gpio_direction_output
	movw	r0, #270
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, r8
	movt	r3, #:upper16:s3c_gpio_setpull
	movw	r0, #270
	blx	r3
.L27:
	movw	r1, #:lower16:.LC14
	mov	r0, #276
	movt	r1, #:upper16:.LC14
	blx	r5
	subs	r8, r0, #0
	bne	.L129
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, r8
	movt	r3, #:upper16:gpio_direction_output
	mov	r0, #276
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, r8
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #276
	blx	r3
.L29:
	movw	r0, #:lower16:.LC15
	movw	r9, #:lower16:printk
	movt	r0, #:upper16:.LC15
	movt	r9, #:upper16:printk
	blx	r6
	ldr	fp, [r4, #184]
	ldr	r10, [r4, #188]
	ldr	r8, [r4, #192]
	cmp	fp, #0
	ldr	r4, [r4, #196]
	bne	.L130
.L30:
	cmp	r10, #0
	bne	.L131
.L32:
	cmp	r8, #0
	bne	.L132
.L34:
	cmp	r4, #0
	bne	.L133
.L36:
	cmp	r8, #0
	beq	.L38
	movw	r3, #:lower16:__gpio_to_irq
	mov	r0, r8
	movt	r3, #:upper16:__gpio_to_irq
	blx	r3
	movw	r3, #:lower16:irq_set_irq_type
	mov	r1, #3
	movt	r3, #:upper16:irq_set_irq_type
	blx	r3
.L38:
	movw	r0, #:lower16:.LC20
	mov	r3, #1
	movt	r0, #:upper16:.LC20
	str	r3, [r7]
	blx	r6
	movw	r3, #:lower16:platform_device_register
	ldr	r0, .L146
	movt	r3, #:upper16:platform_device_register
	blx	r3
	add	sp, sp, #28
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L133:
	movw	r1, #:lower16:.LC19
	mov	r0, r4
	movt	r1, #:upper16:.LC19
	blx	r5
	subs	r2, r0, #0
	bne	.L134
.L37:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, r4
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	b	.L36
.L132:
	movw	r1, #:lower16:.LC18
	mov	r0, r8
	movt	r1, #:upper16:.LC18
	blx	r5
	subs	r2, r0, #0
	bne	.L135
.L35:
	movw	r3, #:lower16:gpio_direction_input
	mov	r0, r8
	movt	r3, #:upper16:gpio_direction_input
	blx	r3
	b	.L34
.L131:
	movw	r1, #:lower16:.LC17
	mov	r0, r10
	movt	r1, #:upper16:.LC17
	blx	r5
	subs	r2, r0, #0
	bne	.L136
.L33:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, r10
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	b	.L32
.L130:
	movw	r1, #:lower16:.LC16
	mov	r0, fp
	movt	r1, #:upper16:.LC16
	blx	r5
	subs	r2, r0, #0
	bne	.L137
.L31:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, fp
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	b	.L30
.L125:
	movw	r3, #:lower16:__gpio_to_irq
	mov	r0, r8
	movt	r3, #:upper16:__gpio_to_irq
	blx	r3
	movw	r3, #:lower16:irq_set_irq_type
	mov	r1, #4
	movt	r3, #:upper16:irq_set_irq_type
	blx	r3
	b	.L21
.L124:
	movw	r1, #:lower16:.LC10
	mov	r0, r3
	movt	r1, #:upper16:.LC10
	blx	r5
	subs	r2, r0, #0
	bne	.L138
.L20:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, r9
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	b	.L19
.L123:
	movw	r1, #:lower16:.LC9
	mov	r0, r3
	movt	r1, #:upper16:.LC9
	blx	r5
	subs	r2, r0, #0
	bne	.L139
.L18:
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, #0
	movt	r3, #:upper16:gpio_direction_output
	ldr	r0, [sp, #12]
	blx	r3
	b	.L17
.L122:
	movw	r1, #:lower16:.LC8
	mov	r0, r3
	movt	r1, #:upper16:.LC8
	blx	r5
	subs	r2, r0, #0
	bne	.L140
.L16:
	movw	r3, #:lower16:gpio_direction_input
	ldr	r0, [sp, #8]
	movt	r3, #:upper16:gpio_direction_input
	blx	r3
	b	.L15
.L120:
	movw	r1, #:lower16:.LC5
	mov	r0, fp
	movt	r1, #:upper16:.LC5
	blx	r5
	subs	r2, r0, #0
	bne	.L141
.L12:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, fp
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	b	.L11
.L119:
	movw	r1, #:lower16:.LC4
	mov	r0, r10
	movt	r1, #:upper16:.LC4
	blx	r5
	subs	r2, r0, #0
	bne	.L142
.L10:
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
	b	.L9
.L118:
	movw	r1, #:lower16:.LC3
	mov	r0, r3
	movt	r1, #:upper16:.LC3
	str	r3, [sp, #4]
	blx	r5
	subs	r2, r0, #0
	ldr	r3, [sp, #4]
	bne	.L143
.L8:
	movw	r2, #:lower16:gpio_direction_output
	mov	r0, r3
	movt	r2, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r2
	b	.L7
.L116:
	movw	r1, #:lower16:.LC1
	movw	r5, #:lower16:gpio_request
	movt	r1, #:upper16:.LC1
	movt	r5, #:upper16:gpio_request
	mov	r0, r9
	str	r3, [sp, #4]
	blx	r5
	subs	r2, r0, #0
	ldr	r3, [sp, #4]
	bne	.L144
.L6:
	movw	r2, #:lower16:s3c_gpio_slp_cfgpin
	str	r3, [sp, #4]
	movt	r2, #:upper16:s3c_gpio_slp_cfgpin
	mov	r1, #1
	mov	r0, r9
	blx	r2
	movw	r2, #:lower16:gpio_direction_output
	mov	r0, r9
	mov	r1, #0
	movt	r2, #:upper16:gpio_direction_output
	blx	r2
	ldr	r3, [sp, #4]
	b	.L5
.L121:
	movw	r1, #:lower16:.LC6
	mov	r0, r8
	movt	r1, #:upper16:.LC6
	blx	r5
	subs	r2, r0, #0
	bne	.L145
.L14:
	movw	r3, #:lower16:gpio_direction_input
	mov	r0, r8
	movt	r3, #:upper16:gpio_direction_input
	blx	r3
	movw	r0, #:lower16:.LC7
	ldr	r1, [sp, #20]
	movt	r0, #:upper16:.LC7
	blx	r6
	b	.L13
.L129:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC14
	mov	r2, r8
	movt	r1, #:upper16:.LC14
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L29
.L128:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC13
	mov	r2, r8
	movt	r1, #:upper16:.LC13
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L27
.L127:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC12
	mov	r2, r8
	movt	r1, #:upper16:.LC12
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L25
.L126:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC11
	mov	r2, r8
	movt	r1, #:upper16:.LC11
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L23
.L137:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC16
	movt	r1, #:upper16:.LC16
	movt	r0, #:upper16:.LC2
	blx	r9
	b	.L31
.L138:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC10
	movt	r1, #:upper16:.LC10
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L20
.L139:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC9
	movt	r1, #:upper16:.LC9
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L18
.L140:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC8
	movt	r1, #:upper16:.LC8
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L16
.L134:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC19
	movt	r1, #:upper16:.LC19
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L37
.L135:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC18
	movt	r1, #:upper16:.LC18
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L35
.L136:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC17
	movt	r1, #:upper16:.LC17
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L33
.L141:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC5
	movt	r1, #:upper16:.LC5
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L12
.L142:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC4
	movt	r1, #:upper16:.LC4
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L10
.L143:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC3
	movt	r0, #:upper16:.LC2
	movt	r1, #:upper16:.LC3
	blx	r6
	ldr	r3, [sp, #4]
	b	.L8
.L144:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC1
	movt	r0, #:upper16:.LC2
	movt	r1, #:upper16:.LC1
	blx	r6
	ldr	r3, [sp, #4]
	b	.L6
.L145:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC6
	movt	r1, #:upper16:.LC6
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L14
.L147:
	.align	2
.L146:
	.word	.LANCHOR0+248
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
	movw	r0, #:lower16:.LC21
	movw	r6, #:lower16:printk
	movt	r0, #:upper16:.LC21
	movt	r6, #:upper16:printk
	blx	r6
	ldr	r0, [r4, #196]
	blx	r5
	cmp	r0, #0
	bne	.L150
	movw	r5, #:lower16:gpio_direction_output
	movt	r5, #:upper16:gpio_direction_output
.L151:
	ldr	r0, [r4, #196]
	mov	r1, #1
	blx	r5
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L150:
	movw	r0, #:lower16:.LC22
	movw	r5, #:lower16:gpio_direction_output
	movt	r0, #:upper16:.LC22
	movw	r8, #:lower16:__const_udelay
	blx	r6
	movt	r5, #:upper16:gpio_direction_output
	ldr	r0, [r4, #196]
	mov	r1, #0
	movt	r8, #:upper16:__const_udelay
	mov	r7, #10
	blx	r5
.L152:
	movw	r0, #12560
	movt	r0, 4915
	blx	r8
	subs	r7, r7, #1
	bne	.L152
	b	.L151
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
	beq	.L162
	ldr	r0, [r4, #16]
	blx	r5
	cmp	r0, #0
	bne	.L168
.L162:
	mvn	r0, #18
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L168:
	movw	r0, #:lower16:.LC23
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC23
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
.L164:
	movw	r0, #12560
	movt	r0, 4915
	blx	r6
	subs	r5, r5, #1
	bne	.L164
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
	beq	.L175
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r3, [r3]
	cmp	r3, #0
	ldmeqfd	sp!, {r4, r5, r6, pc}
	movw	r0, #:lower16:.LC25
	movw	r3, #:lower16:printk
	mov	r1, r5
	ldr	r2, [r6]
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC25
	blx	r3
	movw	r3, #:lower16:gpio_direction_output
	ldr	r0, [r4, #188]
	mov	r1, r5
	movt	r3, #:upper16:gpio_direction_output
	blx	r3
	ldmfd	sp!, {r4, r5, r6, pc}
.L175:
	movw	r0, #:lower16:.LC24
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC24
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
	movw	r0, #:lower16:.LC26
	mov	r3, r9
	movt	r0, #:upper16:.LC26
	movt	r1, #:upper16:.LANCHOR2
	movt	r6, #:upper16:printk
	movw	r2, #371
	blx	r6
	cmp	r8, #0
	ldmeqfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	cmp	r7, #1
	beq	.L178
	cmp	r7, #2
	beq	.L179
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
	movw	r0, #:lower16:.LC27
	mov	r1, r7
	movt	r0, #:upper16:.LC27
	blx	r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L178:
	movw	r3, #:lower16:__gpio_set_value
	mov	r1, r7
	movt	r3, #:upper16:__gpio_set_value
	ldr	r0, [r4, #20]
	blx	r3
	ldr	r0, [r4, #20]
	blx	r5
	mov	r1, r0
	movw	r0, #:lower16:.LC28
	movt	r0, #:upper16:.LC28
	blx	r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L179:
	movw	r3, #:lower16:__gpio_set_value
	ldr	r0, [r4, #20]
	movt	r3, #:upper16:__gpio_set_value
	mov	r1, #1
	blx	r3
	bl	set_slave_wake
	ldr	r0, [r4, #196]
	blx	r5
	mov	r1, r0
	movw	r0, #:lower16:.LC29
	movt	r0, #:upper16:.LC29
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
	.type	__func__.14279, %object
	.size	__func__.14279, 20
__func__.14279:
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
	.word	.LC31
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
	.word	.LC32
	.word	umts_link_ldo_enble
	.word	0
	.word	57
	.word	200
	.word	199
	.word	umts_link_reconnect
	.space	44
	.type	umts_modem, %object
	.size	umts_modem, 360
umts_modem:
	.word	.LC30
	.word	-1
	.space	84
	.word	umts_modem_data
	.space	248
	.word	0
	.word	umts_modem_res
	.space	8
	.type	umts_io_devices, %object
	.size	umts_io_devices, 308
umts_io_devices:
	.word	.LC33
	.word	1
	.word	0
	.word	0
	.word	8
	.space	8
	.word	.LC34
	.word	65
	.word	2
	.word	0
	.word	8
	.space	8
	.word	.LC35
	.word	0
	.word	5
	.word	0
	.word	8
	.space	8
	.word	.LC36
	.word	1
	.word	3
	.word	2
	.word	8
	.space	8
	.word	.LC37
	.word	42
	.word	1
	.word	1
	.word	8
	.space	8
	.word	.LC38
	.word	43
	.word	1
	.word	1
	.word	8
	.space	8
	.word	.LC39
	.word	44
	.word	1
	.word	1
	.word	8
	.space	8
	.word	.LC40
	.word	57
	.word	1
	.word	0
	.word	8
	.space	8
	.word	.LC41
	.word	33
	.word	1
	.word	0
	.word	8
	.space	8
	.word	.LC42
	.word	0
	.word	6
	.word	0
	.word	8
	.space	8
	.word	.LC43
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
	.ascii	"<3>mif: check phone active = %d\012\000"
	.space	3
.LC8:
	.ascii	"CP_DUMP_INT\000"
.LC9:
	.ascii	"AP_DUMP_INT\000"
.LC10:
	.ascii	"GPS_UART_SEL\000"
	.space	3
.LC11:
	.ascii	"FLM_RXD\000"
.LC12:
	.ascii	"FLM_TXD\000"
.LC13:
	.ascii	"SUS_REQ\000"
.LC14:
	.ascii	"GPS_CNTL\000"
	.space	3
.LC15:
	.ascii	"<6>mif: umts_modem_cfg_gpio done\012\000"
	.space	2
.LC16:
	.ascii	"LINK_EN\000"
.LC17:
	.ascii	"LINK_ACTIVE\000"
.LC18:
	.ascii	"HOSTWAKE\000"
	.space	3
.LC19:
	.ascii	"SLAVEWAKE\000"
	.space	2
.LC20:
	.ascii	"<6>mif: modem_link_pm_config_gpio done\012\000"
.LC21:
	.ascii	"<6>[MODEM_IF]Slave Wake\012\000"
	.space	3
.LC22:
	.ascii	"<6>[MODEM_IF]Slave Wake set _-\012\000"
.LC23:
	.ascii	"<6>[MODEM_IF] trying reconnect link\012\000"
	.space	3
.LC24:
	.ascii	"<6>CP not ready, Active State low\012\000"
	.space	1
.LC25:
	.ascii	"<3>mif: Active States =%d, %s\012\000"
	.space	1
.LC26:
	.ascii	"<7>mif: %s: %d: called(%pF): \012\000"
	.space	1
.LC27:
	.ascii	"<6>mif: set hsic lpa enter: active state (%d), pda "
	.ascii	"active (%d)\012\000"
.LC28:
	.ascii	"<6>mif: set hsic lpa wake: pda active (%d)\012\000"
.LC29:
	.ascii	"<6>mif: set hsic lpa phy init: slave wake-up (%d)\012"
	.ascii	"\000"
	.space	1
.LC30:
	.ascii	"modem_if\000"
	.space	3
.LC31:
	.ascii	"xmm6262\000"
.LC32:
	.ascii	"link_pm\000"
.LC33:
	.ascii	"umts_ipc0\000"
	.space	2
.LC34:
	.ascii	"umts_rfs0\000"
	.space	2
.LC35:
	.ascii	"umts_boot0\000"
	.space	1
.LC36:
	.ascii	"multipdp\000"
	.space	3
.LC37:
	.ascii	"rmnet0\000"
	.space	1
.LC38:
	.ascii	"rmnet1\000"
	.space	1
.LC39:
	.ascii	"rmnet2\000"
	.space	1
.LC40:
	.ascii	"umts_router\000"
.LC41:
	.ascii	"umts_csd\000"
	.space	3
.LC42:
	.ascii	"umts_ramdump0\000"
	.space	2
.LC43:
	.ascii	"umts_loopback0\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	umts_modem_res, %object
	.size	umts_modem_res, 0
umts_modem_res:
	.type	active_ctl, %object
	.size	active_ctl, 8
active_ctl:
	.space	8
	.ident	"GCC: (GNU) 4.8"
