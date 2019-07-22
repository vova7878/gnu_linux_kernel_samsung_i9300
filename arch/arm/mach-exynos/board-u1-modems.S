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
	.file	"board-u1-modems.c"
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	movw	r7, #:lower16:s3c_gpio_cfgpin
	.pad #12
	sub	sp, sp, #12
	movt	r7, #:upper16:s3c_gpio_cfgpin
	ldr	r2, [r4, #164]
	mvn	r1, #0
	ldr	r3, [r4, #180]
	movw	fp, #:lower16:gpio_direction_output
	ldr	r5, [r4, #16]
	movt	fp, #:upper16:gpio_direction_output
	ldr	r0, [r4, #96]
	movw	r10, #:lower16:s3c_gpio_setpull
	str	r3, [sp, #4]
	movt	r10, #:upper16:s3c_gpio_setpull
	str	r2, [sp]
	movw	r6, #:lower16:__gpio_to_irq
	blx	r7
	mov	r1, #0
	mov	r0, r5
	blx	fp
	mvn	r1, #0
	mov	r0, r5
	blx	r7
	mov	r1, #0
	mov	r0, r5
	blx	r10
	movt	r6, #:upper16:__gpio_to_irq
	mov	r0, r5
	movw	r9, #:lower16:irq_set_irq_type
	movw	r8, #:lower16:irq_set_irq_wake
	blx	r6
	movt	r9, #:upper16:irq_set_irq_type
	mov	r1, #3
	blx	r9
	mov	r0, r5
	movt	r8, #:upper16:irq_set_irq_wake
	blx	r6
	mov	r1, #1
	blx	r8
	ldr	r2, [sp]
	mov	r0, r2
	movw	r2, #:lower16:gpio_direction_input
	movt	r2, #:upper16:gpio_direction_input
	blx	r2
	ldr	r2, [r4, #180]
	cmp	r2, #0
	beq	.L2
	mov	r1, #0
	ldr	r0, [sp, #4]
	blx	fp
	mvn	r1, #0
	ldr	r0, [sp, #4]
	blx	r7
	mov	r1, #0
	ldr	r0, [sp, #4]
	blx	r10
	ldr	r0, [sp, #4]
	blx	r6
	mov	r1, #3
	blx	r9
	ldr	r0, [sp, #4]
	blx	r6
	mov	r1, #1
	blx	r8
.L2:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
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
	ldr	r0, [r4, #84]
	blx	r5
	mov	r1, #0
	ldr	r0, [r4, #96]
	blx	r5
	mov	r1, #0
	ldr	r0, [r4, #12]
	blx	r5
	mov	r1, #0
	ldr	r0, [r4, #20]
	blx	r5
	mov	r1, #0
	ldr	r0, [r4, #16]
	blx	r5
	ldr	r0, [r4, #164]
	mov	r1, #0
	blx	r5
	ldr	r0, [r4, #180]
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
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r0, #:lower16:.LC0
	movw	r5, #:lower16:printk
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	.pad #20
	sub	sp, sp, #20
	movt	r0, #:upper16:.LC0
	movt	r5, #:upper16:printk
	blx	r5
	ldr	r2, [r4, #172]
	ldr	r8, [r4, #84]
	ldr	r3, [r4, #76]
	str	r2, [sp, #8]
	ldr	r2, [r4, #248]
	cmp	r8, #0
	ldr	r9, [r4, #88]
	ldr	fp, [r4, #92]
	ldr	r7, [r4, #96]
	ldr	r10, [r4, #164]
	ldr	r6, [r4, #180]
	str	r2, [sp, #12]
	bne	.L122
.L14:
	cmp	r3, #0
	bne	.L123
.L16:
	cmp	r9, #0
	bne	.L124
.L18:
	cmp	fp, #0
	bne	.L125
.L20:
	cmp	r7, #0
	bne	.L126
.L22:
	cmp	r10, #0
	bne	.L127
.L24:
	ldr	r3, [sp, #8]
	cmp	r3, #0
	bne	.L128
.L26:
	cmp	r7, #0
	bne	.L129
.L28:
	cmp	r6, #0
	bne	.L130
.L29:
	movw	r0, #:lower16:.LC12
	movw	r7, #:lower16:printk
	movt	r0, #:upper16:.LC12
	movt	r7, #:upper16:printk
	blx	r5
	ldr	r10, [r4, #8]
	ldr	r9, [r4, #12]
	ldr	r6, [r4, #16]
	cmp	r10, #0
	ldr	r8, [r4, #20]
	bne	.L131
.L31:
	cmp	r9, #0
	bne	.L132
.L33:
	cmp	r6, #0
	bne	.L133
.L35:
	cmp	r8, #0
	bne	.L134
.L37:
	cmp	r6, #0
	bne	.L135
.L39:
	movw	r3, #:lower16:.LANCHOR1
	mov	r6, #1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r2, [r3, #4]
	str	r6, [r3]
	cmp	r2, #0
	bne	.L136
.L40:
	movw	r0, #:lower16:.LC18
	movt	r0, #:upper16:.LC18
	blx	r5
	movw	r3, #:lower16:platform_device_register
	ldr	r0, .L149
	movt	r3, #:upper16:platform_device_register
	blx	r3
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L130:
	movw	r1, #:lower16:.LC10
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC10
	movt	r3, #:upper16:gpio_request
	mov	r0, r6
	blx	r3
	subs	r2, r0, #0
	bne	.L137
.L30:
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mov	r0, r6
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #0
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #0
	mov	r0, r6
	movt	r3, #:upper16:s3c_gpio_setpull
	blx	r3
	movw	r3, #:lower16:__gpio_to_irq
	mov	r0, r6
	movt	r3, #:upper16:__gpio_to_irq
	blx	r3
	movw	r3, #:lower16:irq_set_irq_type
	mov	r1, #3
	movt	r3, #:upper16:irq_set_irq_type
	blx	r3
	b	.L29
.L129:
	movw	r3, #:lower16:__gpio_to_irq
	mov	r0, r7
	movt	r3, #:upper16:__gpio_to_irq
	blx	r3
	movw	r3, #:lower16:irq_set_irq_type
	mov	r1, #4
	movt	r3, #:upper16:irq_set_irq_type
	blx	r3
	b	.L28
.L128:
	movw	r1, #:lower16:.LC9
	movw	r3, #:lower16:gpio_request
	ldr	r0, [sp, #8]
	movt	r1, #:upper16:.LC9
	movt	r3, #:upper16:gpio_request
	blx	r3
	subs	r2, r0, #0
	bne	.L138
.L27:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, r8
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	b	.L26
.L127:
	movw	r1, #:lower16:.LC8
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC8
	movt	r3, #:upper16:gpio_request
	mov	r0, r10
	blx	r3
	subs	r2, r0, #0
	bne	.L139
.L25:
	movw	r3, #:lower16:gpio_direction_input
	mov	r0, r10
	movt	r3, #:upper16:gpio_direction_input
	blx	r3
	b	.L24
.L125:
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC5
	movt	r3, #:upper16:gpio_request
	mov	r0, fp
	blx	r3
	subs	r2, r0, #0
	bne	.L140
.L21:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, fp
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	b	.L20
.L124:
	movw	r1, #:lower16:.LC4
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC4
	movt	r3, #:upper16:gpio_request
	mov	r0, r9
	blx	r3
	subs	r2, r0, #0
	bne	.L141
.L19:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, r9
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r0, r9
	mov	r1, #0
	movt	r3, #:upper16:s3c_gpio_setpull
	blx	r3
	b	.L18
.L123:
	movw	r1, #:lower16:.LC3
	movw	r2, #:lower16:gpio_request
	movt	r2, #:upper16:gpio_request
	mov	r0, r3
	str	r3, [sp, #4]
	movt	r1, #:upper16:.LC3
	blx	r2
	subs	r2, r0, #0
	ldr	r3, [sp, #4]
	bne	.L142
.L17:
	movw	r2, #:lower16:gpio_direction_output
	mov	r0, r3
	movt	r2, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r2
	b	.L16
.L122:
	movw	r1, #:lower16:.LC1
	movw	r2, #:lower16:gpio_request
	movt	r2, #:upper16:gpio_request
	str	r3, [sp, #4]
	movt	r1, #:upper16:.LC1
	mov	r0, r8
	blx	r2
	subs	r2, r0, #0
	ldr	r3, [sp, #4]
	bne	.L143
.L15:
	movw	r2, #:lower16:gpio_direction_output
	str	r3, [sp, #4]
	mov	r0, r8
	movt	r2, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r2
	ldr	r3, [sp, #4]
	b	.L14
.L135:
	movw	r3, #:lower16:__gpio_to_irq
	mov	r0, r6
	movt	r3, #:upper16:__gpio_to_irq
	blx	r3
	movw	r3, #:lower16:irq_set_irq_type
	mov	r1, #3
	movt	r3, #:upper16:irq_set_irq_type
	blx	r3
	b	.L39
.L134:
	movw	r1, #:lower16:.LC16
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC16
	movt	r3, #:upper16:gpio_request
	mov	r0, r8
	blx	r3
	subs	r2, r0, #0
	bne	.L144
.L38:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, r8
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r0, r8
	mov	r1, #0
	movt	r3, #:upper16:s3c_gpio_setpull
	blx	r3
	b	.L37
.L133:
	movw	r1, #:lower16:.LC15
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC15
	movt	r3, #:upper16:gpio_request
	mov	r0, r6
	blx	r3
	subs	r2, r0, #0
	bne	.L145
.L36:
	movw	r3, #:lower16:gpio_direction_input
	mov	r0, r6
	movt	r3, #:upper16:gpio_direction_input
	blx	r3
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mov	r0, r6
	mvn	r1, #0
	movt	r3, #:upper16:s3c_gpio_cfgpin
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r0, r6
	mov	r1, #0
	movt	r3, #:upper16:s3c_gpio_setpull
	blx	r3
	b	.L35
.L132:
	movw	r1, #:lower16:.LC14
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC14
	movt	r3, #:upper16:gpio_request
	mov	r0, r9
	blx	r3
	subs	r2, r0, #0
	bne	.L146
.L34:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, r9
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	b	.L33
.L131:
	movw	r1, #:lower16:.LC13
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC13
	movt	r3, #:upper16:gpio_request
	mov	r0, r10
	blx	r3
	subs	r2, r0, #0
	bne	.L147
.L32:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, r10
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	b	.L31
.L126:
	movw	r1, #:lower16:.LC6
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC6
	movt	r3, #:upper16:gpio_request
	mov	r0, r7
	blx	r3
	subs	r2, r0, #0
	bne	.L148
.L23:
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mov	r0, r7
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #0
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r0, r7
	mov	r1, #0
	movt	r3, #:upper16:s3c_gpio_setpull
	blx	r3
	movw	r0, #:lower16:.LC7
	ldr	r1, [sp, #12]
	movt	r0, #:upper16:.LC7
	blx	r5
	b	.L22
.L136:
	movw	r0, #:lower16:.LC17
	movw	r1, #:lower16:.LANCHOR2
	movt	r1, #:upper16:.LANCHOR2
	movt	r0, #:upper16:.LC17
	blx	r5
	movw	r3, #:lower16:gpio_direction_output
	ldr	r0, [r4, #12]
	mov	r1, r6
	movt	r3, #:upper16:gpio_direction_output
	blx	r3
	b	.L40
.L137:
	movw	r0, #:lower16:.LC11
	movw	r1, #:lower16:.LC10
	movt	r1, #:upper16:.LC10
	movt	r0, #:upper16:.LC11
	blx	r5
	b	.L30
.L138:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC9
	movt	r1, #:upper16:.LC9
	movt	r0, #:upper16:.LC2
	blx	r5
	b	.L27
.L139:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC8
	movt	r1, #:upper16:.LC8
	movt	r0, #:upper16:.LC2
	blx	r5
	b	.L25
.L140:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC5
	movt	r1, #:upper16:.LC5
	movt	r0, #:upper16:.LC2
	blx	r5
	b	.L21
.L141:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC4
	movt	r1, #:upper16:.LC4
	movt	r0, #:upper16:.LC2
	blx	r5
	b	.L19
.L142:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC3
	movt	r0, #:upper16:.LC2
	movt	r1, #:upper16:.LC3
	blx	r5
	ldr	r3, [sp, #4]
	b	.L17
.L143:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC1
	movt	r0, #:upper16:.LC2
	movt	r1, #:upper16:.LC1
	blx	r5
	ldr	r3, [sp, #4]
	b	.L15
.L144:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC16
	movt	r1, #:upper16:.LC16
	movt	r0, #:upper16:.LC2
	blx	r5
	b	.L38
.L145:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC15
	movt	r1, #:upper16:.LC15
	movt	r0, #:upper16:.LC2
	blx	r5
	b	.L36
.L146:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC14
	movt	r1, #:upper16:.LC14
	movt	r0, #:upper16:.LC2
	blx	r5
	b	.L34
.L147:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC13
	movt	r1, #:upper16:.LC13
	movt	r0, #:upper16:.LC2
	blx	r7
	b	.L32
.L148:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC6
	movt	r1, #:upper16:.LC6
	movt	r0, #:upper16:.LC2
	blx	r5
	b	.L23
.L150:
	.align	2
.L149:
	.word	.LANCHOR0+304
	.fnend
	.size	init_modem, .-init_modem
	.align	2
	.global	set_slave_wake
	.type	set_slave_wake, %function
set_slave_wake:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r5, #:lower16:__gpio_get_value
	movt	r4, #:upper16:.LANCHOR0
	movt	r5, #:upper16:__gpio_get_value
	ldr	r0, [r4, #16]
	blx	r5
	cmp	r0, #0
	ldmeqfd	sp!, {r3, r4, r5, r6, r7, pc}
	movw	r0, #:lower16:.LC19
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC19
	blx	r3
	ldr	r0, [r4, #20]
	blx	r5
	cmp	r0, #0
	bne	.L153
	movw	r5, #:lower16:gpio_direction_output
	movt	r5, #:upper16:gpio_direction_output
.L154:
	ldr	r0, [r4, #20]
	mov	r1, #1
	blx	r5
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L153:
	movw	r5, #:lower16:gpio_direction_output
	movw	r7, #:lower16:__const_udelay
	movt	r5, #:upper16:gpio_direction_output
	ldr	r0, [r4, #20]
	mov	r1, #0
	movt	r7, #:upper16:__const_udelay
	mov	r6, #10
	blx	r5
.L155:
	movw	r0, #12560
	movt	r0, 4915
	blx	r7
	subs	r6, r6, #1
	bne	.L155
	b	.L154
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
	ldr	r0, [r4, #96]
	blx	r5
	cmp	r0, #0
	beq	.L165
	ldr	r0, [r4, #88]
	blx	r5
	cmp	r0, #0
	bne	.L171
.L165:
	mvn	r0, #18
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L171:
	movw	r0, #:lower16:.LC20
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC20
	movt	r3, #:upper16:printk
	movw	r7, #:lower16:__gpio_set_value
	movw	r6, #:lower16:__const_udelay
	blx	r3
	movt	r7, #:upper16:__gpio_set_value
	ldr	r0, [r4, #12]
	mov	r1, #0
	movt	r6, #:upper16:__const_udelay
	mov	r5, #10
	blx	r7
.L167:
	movw	r0, #12560
	movt	r0, 4915
	blx	r6
	subs	r5, r5, #1
	bne	.L167
	bl	set_slave_wake
	ldr	r0, [r4, #12]
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
	ldr	r0, [r4, #88]
	mov	r5, r1
	blx	r3
	cmp	r0, #0
	beq	.L176
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r2, #1
	streq	r2, [r3, #4]
	ldmeqfd	sp!, {r4, r5, r6, pc}
	movw	r0, #:lower16:.LC22
	movw	r3, #:lower16:printk
	mov	r1, r5
	ldr	r2, [r6]
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC22
	blx	r3
	movw	r3, #:lower16:gpio_direction_output
	ldr	r0, [r4, #12]
	mov	r1, r5
	movt	r3, #:upper16:gpio_direction_output
	blx	r3
	ldmfd	sp!, {r4, r5, r6, pc}
.L176:
	movw	r0, #:lower16:.LC21
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC21
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
	ldr	r0, [r4, #88]
	mov	r9, lr
	movw	r6, #:lower16:printk
	blx	r5
	mov	r8, r0
	movw	r0, #:lower16:.LC23
	mov	r3, r9
	movt	r0, #:upper16:.LC23
	movt	r6, #:upper16:printk
	ldr	r1, .L185
	movw	r2, #279
	blx	r6
	cmp	r8, #0
	ldmeqfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	cmp	r7, #1
	beq	.L179
	cmp	r7, #2
	beq	.L180
	cmp	r7, #0
	ldmnefd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	movw	r8, #:lower16:__gpio_set_value
	ldr	r0, [r4, #12]
	movt	r8, #:upper16:__gpio_set_value
	mov	r1, r7
	blx	r8
	mov	r1, r7
	ldr	r0, [r4, #92]
	blx	r8
	ldr	r0, [r4, #12]
	blx	r5
	mov	r7, r0
	ldr	r0, [r4, #92]
	blx	r5
	mov	r2, r0
	movw	r0, #:lower16:.LC24
	mov	r1, r7
	movt	r0, #:upper16:.LC24
	blx	r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L179:
	movw	r3, #:lower16:__gpio_set_value
	mov	r1, r7
	movt	r3, #:upper16:__gpio_set_value
	ldr	r0, [r4, #92]
	blx	r3
	ldr	r0, [r4, #92]
	blx	r5
	mov	r1, r0
	movw	r0, #:lower16:.LC25
	movt	r0, #:upper16:.LC25
	blx	r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L180:
	movw	r3, #:lower16:__gpio_set_value
	ldr	r0, [r4, #92]
	movt	r3, #:upper16:__gpio_set_value
	mov	r1, #1
	blx	r3
	bl	set_slave_wake
	ldr	r0, [r4, #20]
	blx	r5
	mov	r1, r0
	movw	r0, #:lower16:.LC26
	movt	r0, #:upper16:.LC26
	blx	r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L186:
	.align	2
.L185:
	.word	.LANCHOR2+28
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
	ldr	r0, [r2, #96]
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	get_cp_active_state, .-get_cp_active_state
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.21342, %object
	.size	__func__.21342, 26
__func__.21342:
	.ascii	"modem_link_pm_config_gpio\000"
	.space	2
	.type	__func__.21302, %object
	.size	__func__.21302, 20
__func__.21302:
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
	.type	modem_link_pm_data, %object
	.size	modem_link_pm_data, 72
modem_link_pm_data:
	.word	.LC29
	.word	umts_link_ldo_enble
	.word	0
	.word	57
	.word	200
	.word	199
	.word	umts_link_reconnect
	.space	44
	.type	umts_modem_data, %object
	.size	umts_modem_data, 176
umts_modem_data:
	.word	.LC28
	.word	131
	.space	4
	.word	275
	.word	219
	.word	62
	.word	205
	.space	64
	.word	201
	.space	4
	.word	0
	.word	0
	.space	16
	.word	0
	.word	0
	.word	8
	.space	16
	.word	11
	.word	umts_io_devices
	.word	modem_link_pm_data
	.byte	0
	.space	3
	.word	xmm_gpio_revers_bias_clear
	.word	xmm_gpio_revers_bias_restore
	.type	umts_modem_res, %object
	.size	umts_modem_res, 56
umts_modem_res:
	.word	94
	.word	94
	.word	.LC30
	.word	1024
	.space	12
	.word	89
	.word	89
	.word	.LC31
	.word	1024
	.space	12
	.type	umts_modem, %object
	.size	umts_modem, 360
umts_modem:
	.word	.LC27
	.word	-1
	.space	84
	.word	umts_modem_data
	.space	248
	.word	2
	.word	umts_modem_res
	.space	8
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
	.ascii	"<6>[MODEM_IF] init_modem\012\000"
	.space	2
.LC1:
	.ascii	"RESET_REQ_N\000"
.LC2:
	.ascii	"<3>fail to request gpio %s : %d\012\000"
	.space	3
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
	.ascii	"<3>check phone active = %d\012\000"
.LC8:
	.ascii	"CP_DUMP_INT\000"
.LC9:
	.ascii	"GPS_UART_SEL\000"
	.space	3
.LC10:
	.ascii	"SIM_DETECT\000"
	.space	1
.LC11:
	.ascii	"<3>fail to request gpio %s: %d\012\000"
.LC12:
	.ascii	"<6>umts_modem_cfg_gpio done\012\000"
	.space	3
.LC13:
	.ascii	"LINK_EN\000"
.LC14:
	.ascii	"LINK_ACTIVE\000"
.LC15:
	.ascii	"HOSTWAKE\000"
	.space	3
.LC16:
	.ascii	"SLAVEWAKE\000"
	.space	2
.LC17:
	.ascii	"<3> [MODEM_IF] Active States = 1, %s\012\000"
	.space	2
.LC18:
	.ascii	"<6>modem_link_pm_config_gpio done\012\000"
	.space	1
.LC19:
	.ascii	"<6>[MODEM_IF]Slave Wake\012\000"
	.space	3
.LC20:
	.ascii	"<6>[MODEM_IF] trying reconnect link\012\000"
	.space	3
.LC21:
	.ascii	"<6>CP not ready, Active State low\012\000"
	.space	1
.LC22:
	.ascii	"<3>[MODEM_IF]Active States =%d, %s\012\000"
.LC23:
	.ascii	"<7>mif: %s: %d: called(%pF): \012\000"
	.space	1
.LC24:
	.ascii	"<6>mif: set hsic lpa enter: active state (%d), pda "
	.ascii	"active (%d)\012\000"
.LC25:
	.ascii	"<6>mif: set hsic lpa wake: pda active (%d)\012\000"
.LC26:
	.ascii	"<6>mif: set hsic lpa phy init: slave wake-up (%d)\012"
	.ascii	"\000"
	.space	1
.LC27:
	.ascii	"modem_if\000"
	.space	3
.LC28:
	.ascii	"xmm6260\000"
.LC29:
	.ascii	"link_pm\000"
.LC30:
	.ascii	"umts_phone_active\000"
	.space	2
.LC31:
	.ascii	"link_pm_hostwake\000"
	.space	3
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
