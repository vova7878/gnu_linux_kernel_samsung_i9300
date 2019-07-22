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
	.file	"board-p4notepq-modems.c"
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
	ldr	r0, [r4, #24]
	movw	r6, #:lower16:gpio_direction_input
	ldr	r7, [r4, #108]
	movt	r6, #:upper16:gpio_direction_input
	blx	r5
	mvn	r1, #0
	ldr	r0, [r4, #192]
	blx	r5
	ldr	r0, [r4, #92]
	blx	r6
	ldr	r3, [r4, #108]
	cmp	r3, #0
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
	ldr	r2, [r4, #20]
	movt	r7, #:upper16:.LANCHOR1
	ldr	r9, [r4, #12]
	ldr	r3, [r4, #4]
	str	r2, [sp, #4]
	ldr	r2, [r4, #92]
	cmp	r9, #0
	ldr	fp, [r4, #16]
	ldr	r8, [r4, #24]
	str	r2, [sp, #8]
	ldr	r2, [r4, #96]
	ldr	r10, [r4, #108]
	str	r2, [sp, #12]
	ldr	r2, [r4, #100]
	str	r2, [sp, #16]
	ldr	r2, [r7]
	str	r2, [sp, #20]
	bne	.L137
	cmp	r3, #0
	movw	r5, #:lower16:gpio_request
	movt	r5, #:upper16:gpio_request
	bne	.L138
.L16:
	cmp	fp, #0
	bne	.L139
.L18:
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L140
.L20:
	cmp	r8, #0
	bne	.L141
.L22:
	cmp	r10, #0
	bne	.L142
.L24:
	ldr	r3, [sp, #8]
	cmp	r3, #0
	bne	.L143
.L26:
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L144
.L28:
	ldr	r3, [sp, #16]
	cmp	r3, #0
	bne	.L145
.L30:
	cmp	r8, #0
	bne	.L146
.L32:
	movw	r1, #:lower16:.LC13
	mov	r0, #13
	movt	r1, #:upper16:.LC13
	blx	r5
	subs	r8, r0, #0
	bne	.L147
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
.L34:
	movw	r1, #:lower16:.LC14
	mov	r0, #14
	movt	r1, #:upper16:.LC14
	blx	r5
	subs	r8, r0, #0
	bne	.L148
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
.L36:
	movw	r1, #:lower16:.LC15
	movw	r0, #270
	movt	r1, #:upper16:.LC15
	blx	r5
	subs	r8, r0, #0
	bne	.L149
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
.L38:
	movw	r1, #:lower16:.LC16
	mov	r0, #276
	movt	r1, #:upper16:.LC16
	blx	r5
	subs	r8, r0, #0
	bne	.L150
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
.L40:
	movw	r0, #:lower16:.LC17
	movw	r9, #:lower16:printk
	movt	r0, #:upper16:.LC17
	movt	r9, #:upper16:printk
	blx	r6
	ldr	r3, [r4, #184]
	ldr	fp, [r4, #188]
	ldr	r8, [r4, #192]
	cmp	r3, #0
	ldr	r10, [r4, #196]
	bne	.L151
.L41:
	cmp	fp, #0
	bne	.L152
.L43:
	cmp	r8, #0
	bne	.L153
.L45:
	cmp	r10, #0
	bne	.L154
.L47:
	cmp	r8, #0
	bne	.L155
.L49:
	ldr	r3, [r7, #4]
	mov	r5, #1
	str	r5, [r7]
	cmp	r3, #0
	bne	.L156
.L50:
	movw	r0, #:lower16:.LC23
	movt	r0, #:upper16:.LC23
	blx	r6
	movw	r3, #:lower16:platform_device_register
	ldr	r0, .L170
	movt	r3, #:upper16:platform_device_register
	blx	r3
	add	sp, sp, #28
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L137:
	movw	r1, #:lower16:.LC1
	movw	r5, #:lower16:gpio_request
	str	r3, [sp]
	movt	r1, #:upper16:.LC1
	movt	r5, #:upper16:gpio_request
	mov	r0, r9
	blx	r5
	subs	r2, r0, #0
	ldr	r3, [sp]
	bne	.L157
.L15:
	movw	r2, #:lower16:s3c_gpio_slp_cfgpin
	str	r3, [sp]
	movt	r2, #:upper16:s3c_gpio_slp_cfgpin
	mov	r1, #1
	mov	r0, r9
	blx	r2
	movw	r2, #:lower16:gpio_direction_output
	mov	r0, r9
	mov	r1, #0
	movt	r2, #:upper16:gpio_direction_output
	blx	r2
	ldr	r3, [sp]
	cmp	r3, #0
	beq	.L16
.L138:
	movw	r1, #:lower16:.LC3
	mov	r0, r3
	str	r3, [sp]
	movt	r1, #:upper16:.LC3
	blx	r5
	subs	r2, r0, #0
	ldr	r3, [sp]
	bne	.L158
.L17:
	movw	r2, #:lower16:gpio_direction_output
	mov	r0, r3
	movt	r2, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r2
	cmp	fp, #0
	beq	.L18
.L139:
	movw	r1, #:lower16:.LC4
	mov	r0, fp
	movt	r1, #:upper16:.LC4
	blx	r5
	subs	r2, r0, #0
	bne	.L159
.L19:
	movw	r3, #:lower16:s3c_gpio_slp_cfgpin
	mov	r1, #1
	movt	r3, #:upper16:s3c_gpio_slp_cfgpin
	mov	r0, fp
	blx	r3
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, fp
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L20
.L140:
	movw	r1, #:lower16:.LC5
	mov	r0, r3
	movt	r1, #:upper16:.LC5
	blx	r5
	subs	r2, r0, #0
	bne	.L160
.L21:
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, #0
	movt	r3, #:upper16:gpio_direction_output
	ldr	r0, [sp, #4]
	blx	r3
	b	.L20
.L155:
	movw	r3, #:lower16:__gpio_to_irq
	mov	r0, r8
	movt	r3, #:upper16:__gpio_to_irq
	blx	r3
	movw	r3, #:lower16:irq_set_irq_type
	mov	r1, #3
	movt	r3, #:upper16:irq_set_irq_type
	blx	r3
	b	.L49
.L154:
	movw	r1, #:lower16:.LC21
	mov	r0, r10
	movt	r1, #:upper16:.LC21
	blx	r5
	subs	r2, r0, #0
	bne	.L161
.L48:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, r10
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	b	.L47
.L153:
	movw	r1, #:lower16:.LC20
	mov	r0, r8
	movt	r1, #:upper16:.LC20
	blx	r5
	subs	r2, r0, #0
	bne	.L162
.L46:
	movw	r3, #:lower16:gpio_direction_input
	mov	r0, r8
	movt	r3, #:upper16:gpio_direction_input
	blx	r3
	b	.L45
.L152:
	movw	r1, #:lower16:.LC19
	mov	r0, fp
	movt	r1, #:upper16:.LC19
	blx	r5
	subs	r2, r0, #0
	bne	.L163
.L44:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, fp
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	b	.L43
.L151:
	movw	r1, #:lower16:.LC18
	mov	r0, r3
	str	r3, [sp]
	movt	r1, #:upper16:.LC18
	blx	r5
	subs	r2, r0, #0
	ldr	r3, [sp]
	bne	.L164
.L42:
	movw	r2, #:lower16:gpio_direction_output
	mov	r0, r3
	movt	r2, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r2
	b	.L41
.L146:
	movw	r3, #:lower16:__gpio_to_irq
	mov	r0, r8
	movt	r3, #:upper16:__gpio_to_irq
	blx	r3
	movw	r3, #:lower16:irq_set_irq_type
	mov	r1, #4
	movt	r3, #:upper16:irq_set_irq_type
	blx	r3
	b	.L32
.L145:
	movw	r1, #:lower16:.LC12
	mov	r0, r3
	movt	r1, #:upper16:.LC12
	blx	r5
	subs	r2, r0, #0
	bne	.L165
.L31:
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, r9
	movt	r3, #:upper16:gpio_direction_output
	mov	r1, #0
	blx	r3
	b	.L30
.L144:
	movw	r1, #:lower16:.LC11
	mov	r0, r3
	movt	r1, #:upper16:.LC11
	blx	r5
	subs	r2, r0, #0
	bne	.L166
.L29:
	movw	r3, #:lower16:gpio_direction_output
	mov	r1, #0
	movt	r3, #:upper16:gpio_direction_output
	ldr	r0, [sp, #12]
	blx	r3
	b	.L28
.L143:
	movw	r1, #:lower16:.LC10
	mov	r0, r3
	movt	r1, #:upper16:.LC10
	blx	r5
	subs	r2, r0, #0
	bne	.L167
.L27:
	movw	r3, #:lower16:gpio_direction_input
	ldr	r0, [sp, #8]
	movt	r3, #:upper16:gpio_direction_input
	blx	r3
	b	.L26
.L142:
	movw	r1, #:lower16:.LC8
	mov	r0, r10
	movt	r1, #:upper16:.LC8
	blx	r5
	subs	r2, r0, #0
	bne	.L168
.L25:
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mov	r0, r10
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mvn	r1, #0
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #0
	mov	r0, r10
	movt	r3, #:upper16:s3c_gpio_setpull
	blx	r3
	movw	r3, #:lower16:__gpio_to_irq
	mov	r0, r10
	movt	r3, #:upper16:__gpio_to_irq
	blx	r3
	movw	r3, #:lower16:irq_set_irq_type
	mov	r1, #3
	movt	r3, #:upper16:irq_set_irq_type
	blx	r3
	b	.L24
.L147:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC13
	mov	r2, r8
	movt	r1, #:upper16:.LC13
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L34
.L141:
	movw	r1, #:lower16:.LC6
	mov	r0, r8
	movt	r1, #:upper16:.LC6
	blx	r5
	subs	r2, r0, #0
	bne	.L169
.L23:
	movw	r3, #:lower16:gpio_direction_input
	mov	r0, r8
	movt	r3, #:upper16:gpio_direction_input
	blx	r3
	movw	r0, #:lower16:.LC7
	ldr	r1, [sp, #20]
	movt	r0, #:upper16:.LC7
	blx	r6
	b	.L22
.L156:
	movw	r0, #:lower16:.LC22
	movw	r1, #:lower16:.LANCHOR2
	movt	r1, #:upper16:.LANCHOR2
	movt	r0, #:upper16:.LC22
	blx	r6
	movw	r3, #:lower16:gpio_direction_output
	ldr	r0, [r4, #188]
	mov	r1, r5
	movt	r3, #:upper16:gpio_direction_output
	blx	r3
	b	.L50
.L149:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC15
	mov	r2, r8
	movt	r1, #:upper16:.LC15
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L38
.L148:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC14
	mov	r2, r8
	movt	r1, #:upper16:.LC14
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L36
.L150:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC16
	mov	r2, r8
	movt	r1, #:upper16:.LC16
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L40
.L163:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC19
	movt	r1, #:upper16:.LC19
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L44
.L158:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC3
	movt	r0, #:upper16:.LC2
	movt	r1, #:upper16:.LC3
	blx	r6
	ldr	r3, [sp]
	b	.L17
.L162:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC20
	movt	r1, #:upper16:.LC20
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L46
.L157:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC1
	movt	r0, #:upper16:.LC2
	movt	r1, #:upper16:.LC1
	blx	r6
	ldr	r3, [sp]
	b	.L15
.L164:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC18
	movt	r0, #:upper16:.LC2
	movt	r1, #:upper16:.LC18
	blx	r9
	ldr	r3, [sp]
	b	.L42
.L165:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC12
	movt	r1, #:upper16:.LC12
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L31
.L166:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC11
	movt	r1, #:upper16:.LC11
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L29
.L167:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC10
	movt	r1, #:upper16:.LC10
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L27
.L168:
	movw	r0, #:lower16:.LC9
	movw	r1, #:lower16:.LC8
	movt	r1, #:upper16:.LC8
	movt	r0, #:upper16:.LC9
	blx	r6
	b	.L25
.L160:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC5
	movt	r1, #:upper16:.LC5
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L21
.L159:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC4
	movt	r1, #:upper16:.LC4
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L19
.L161:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC21
	movt	r1, #:upper16:.LC21
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L48
.L169:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LC6
	movt	r1, #:upper16:.LC6
	movt	r0, #:upper16:.LC2
	blx	r6
	b	.L23
.L171:
	.align	2
.L170:
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
	movw	r0, #:lower16:.LC24
	movw	r6, #:lower16:printk
	movt	r0, #:upper16:.LC24
	movt	r6, #:upper16:printk
	blx	r6
	ldr	r0, [r4, #196]
	blx	r5
	cmp	r0, #0
	bne	.L174
	movw	r5, #:lower16:gpio_direction_output
	movt	r5, #:upper16:gpio_direction_output
.L175:
	ldr	r0, [r4, #196]
	mov	r1, #1
	blx	r5
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L174:
	movw	r0, #:lower16:.LC25
	movw	r5, #:lower16:gpio_direction_output
	movt	r0, #:upper16:.LC25
	movw	r8, #:lower16:__const_udelay
	blx	r6
	movt	r5, #:upper16:gpio_direction_output
	ldr	r0, [r4, #196]
	mov	r1, #0
	movt	r8, #:upper16:__const_udelay
	mov	r7, #10
	blx	r5
.L176:
	movw	r0, #12560
	movt	r0, 4915
	blx	r8
	subs	r7, r7, #1
	bne	.L176
	b	.L175
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
	beq	.L186
	ldr	r0, [r4, #16]
	blx	r5
	cmp	r0, #0
	bne	.L192
.L186:
	mvn	r0, #18
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L192:
	movw	r0, #:lower16:.LC26
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC26
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
.L188:
	movw	r0, #12560
	movt	r0, 4915
	blx	r6
	subs	r5, r5, #1
	bne	.L188
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
	beq	.L197
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r2, #1
	streq	r2, [r3, #4]
	ldmeqfd	sp!, {r4, r5, r6, pc}
	movw	r0, #:lower16:.LC28
	movw	r3, #:lower16:printk
	mov	r1, r5
	ldr	r2, [r6]
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC28
	blx	r3
	movw	r3, #:lower16:gpio_direction_output
	ldr	r0, [r4, #188]
	mov	r1, r5
	movt	r3, #:upper16:gpio_direction_output
	blx	r3
	ldmfd	sp!, {r4, r5, r6, pc}
.L197:
	movw	r0, #:lower16:.LC27
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC27
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
	mov	r8, r0
	movw	r0, #:lower16:.LC29
	mov	r3, r9
	movt	r0, #:upper16:.LC29
	movt	r6, #:upper16:printk
	ldr	r1, .L206
	mov	r2, #220
	blx	r6
	cmp	r8, #0
	ldmeqfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	cmp	r7, #1
	beq	.L200
	cmp	r7, #2
	beq	.L201
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
	movw	r0, #:lower16:.LC30
	mov	r1, r7
	movt	r0, #:upper16:.LC30
	blx	r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L200:
	movw	r3, #:lower16:__gpio_set_value
	mov	r1, r7
	movt	r3, #:upper16:__gpio_set_value
	ldr	r0, [r4, #20]
	blx	r3
	ldr	r0, [r4, #20]
	blx	r5
	mov	r1, r0
	movw	r0, #:lower16:.LC31
	movt	r0, #:upper16:.LC31
	blx	r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L201:
	movw	r3, #:lower16:__gpio_set_value
	ldr	r0, [r4, #20]
	movt	r3, #:upper16:__gpio_set_value
	mov	r1, #1
	blx	r3
	bl	set_slave_wake
	ldr	r0, [r4, #196]
	blx	r5
	mov	r1, r0
	movw	r0, #:lower16:.LC32
	movt	r0, #:upper16:.LC32
	blx	r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L207:
	.align	2
.L206:
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
	ldr	r0, [r2, #24]
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	get_cp_active_state, .-get_cp_active_state
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.14915, %object
	.size	__func__.14915, 26
__func__.14915:
	.ascii	"modem_link_pm_config_gpio\000"
	.space	2
	.type	__func__.14867, %object
	.size	__func__.14867, 20
__func__.14867:
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
	.word	.LC34
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
	.word	.LC35
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
	.word	.LC33
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
	.word	.LC36
	.word	1
	.word	0
	.word	0
	.word	8
	.space	8
	.word	.LC37
	.word	65
	.word	2
	.word	0
	.word	8
	.space	8
	.word	.LC38
	.word	0
	.word	5
	.word	0
	.word	8
	.space	8
	.word	.LC39
	.word	1
	.word	3
	.word	2
	.word	8
	.space	8
	.word	.LC40
	.word	42
	.word	1
	.word	1
	.word	8
	.space	8
	.word	.LC41
	.word	43
	.word	1
	.word	1
	.word	8
	.space	8
	.word	.LC42
	.word	44
	.word	1
	.word	1
	.word	8
	.space	8
	.word	.LC43
	.word	57
	.word	1
	.word	0
	.word	8
	.space	8
	.word	.LC44
	.word	33
	.word	1
	.word	0
	.word	8
	.space	8
	.word	.LC45
	.word	0
	.word	6
	.word	0
	.word	8
	.space	8
	.word	.LC46
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
	.ascii	"SIM_DETECT\000"
	.space	1
.LC9:
	.ascii	"<3>fail to request gpio %s: %d\012\000"
.LC10:
	.ascii	"CP_DUMP_INT\000"
.LC11:
	.ascii	"AP_DUMP_INT\000"
.LC12:
	.ascii	"GPS_UART_SEL\000"
	.space	3
.LC13:
	.ascii	"FLM_RXD\000"
.LC14:
	.ascii	"FLM_TXD\000"
.LC15:
	.ascii	"SUS_REQ\000"
.LC16:
	.ascii	"GPS_CNTL\000"
	.space	3
.LC17:
	.ascii	"<6>mif: umts_modem_cfg_gpio done\012\000"
	.space	2
.LC18:
	.ascii	"LINK_EN\000"
.LC19:
	.ascii	"LINK_ACTIVE\000"
.LC20:
	.ascii	"HOSTWAKE\000"
	.space	3
.LC21:
	.ascii	"SLAVEWAKE\000"
	.space	2
.LC22:
	.ascii	"<3>mif: Active States = 1, %s\012\000"
	.space	1
.LC23:
	.ascii	"<6>mif: modem_link_pm_config_gpio done\012\000"
.LC24:
	.ascii	"<6>[MODEM_IF]Slave Wake\012\000"
	.space	3
.LC25:
	.ascii	"<6>[MODEM_IF]Slave Wake set _-\012\000"
.LC26:
	.ascii	"<6>[MODEM_IF] trying reconnect link\012\000"
	.space	3
.LC27:
	.ascii	"<6>CP not ready, Active State low\012\000"
	.space	1
.LC28:
	.ascii	"<3>mif: Active States =%d, %s\012\000"
	.space	1
.LC29:
	.ascii	"<7>mif: %s: %d: called(%pF): \012\000"
	.space	1
.LC30:
	.ascii	"<6>mif: set hsic lpa enter: active state (%d), pda "
	.ascii	"active (%d)\012\000"
.LC31:
	.ascii	"<6>mif: set hsic lpa wake: pda active (%d)\012\000"
.LC32:
	.ascii	"<6>mif: set hsic lpa phy init: slave wake-up (%d)\012"
	.ascii	"\000"
	.space	1
.LC33:
	.ascii	"modem_if\000"
	.space	3
.LC34:
	.ascii	"xmm6262\000"
.LC35:
	.ascii	"link_pm\000"
.LC36:
	.ascii	"umts_ipc0\000"
	.space	2
.LC37:
	.ascii	"umts_rfs0\000"
	.space	2
.LC38:
	.ascii	"umts_boot0\000"
	.space	1
.LC39:
	.ascii	"multipdp\000"
	.space	3
.LC40:
	.ascii	"rmnet0\000"
	.space	1
.LC41:
	.ascii	"rmnet1\000"
	.space	1
.LC42:
	.ascii	"rmnet2\000"
	.space	1
.LC43:
	.ascii	"umts_router\000"
.LC44:
	.ascii	"umts_csd\000"
	.space	3
.LC45:
	.ascii	"umts_ramdump0\000"
	.space	2
.LC46:
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
