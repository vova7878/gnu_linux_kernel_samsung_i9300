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
	.file	"midas-sensor.c"
	.text
	.align	2
	.type	axes_pxpypz_s16, %function
axes_pxpypz_s16:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	axes_pxpypz_s16, .-axes_pxpypz_s16
	.align	2
	.type	axes_pynxpz_s16, %function
axes_pynxpz_s16:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r0]
	ldrh	r2, [r1]
	rsb	r3, r3, #0
	strh	r2, [r0]	@ movhi
	strh	r3, [r1]	@ movhi
	bx	lr
	.fnend
	.size	axes_pynxpz_s16, .-axes_pynxpz_s16
	.align	2
	.type	axes_nxnypz_s16, %function
axes_nxnypz_s16:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r0]
	rsb	r3, r3, #0
	strh	r3, [r0]	@ movhi
	ldrh	r3, [r1]
	rsb	r3, r3, #0
	strh	r3, [r1]	@ movhi
	bx	lr
	.fnend
	.size	axes_nxnypz_s16, .-axes_nxnypz_s16
	.align	2
	.type	axes_nypxpz_s16, %function
axes_nypxpz_s16:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r2, [r1]
	ldrh	r3, [r0]
	rsb	r2, r2, #0
	strh	r2, [r0]	@ movhi
	strh	r3, [r1]	@ movhi
	bx	lr
	.fnend
	.size	axes_nypxpz_s16, .-axes_nypxpz_s16
	.align	2
	.type	axes_nxpynz_s16, %function
axes_nxpynz_s16:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r0]
	rsb	r3, r3, #0
	strh	r3, [r0]	@ movhi
	ldrh	r3, [r2]
	rsb	r3, r3, #0
	strh	r3, [r2]	@ movhi
	bx	lr
	.fnend
	.size	axes_nxpynz_s16, .-axes_nxpynz_s16
	.align	2
	.type	axes_pypxnz_s16, %function
axes_pypxnz_s16:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r0]
	ldrh	ip, [r1]
	strh	ip, [r0]	@ movhi
	strh	r3, [r1]	@ movhi
	ldrh	r3, [r2]
	rsb	r3, r3, #0
	strh	r3, [r2]	@ movhi
	bx	lr
	.fnend
	.size	axes_pypxnz_s16, .-axes_pypxnz_s16
	.align	2
	.type	axes_pxnynz_s16, %function
axes_pxnynz_s16:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r1]
	rsb	r3, r3, #0
	strh	r3, [r1]	@ movhi
	ldrh	r3, [r2]
	rsb	r3, r3, #0
	strh	r3, [r2]	@ movhi
	bx	lr
	.fnend
	.size	axes_pxnynz_s16, .-axes_pxnynz_s16
	.align	2
	.type	axes_nynxnz_s16, %function
axes_nynxnz_s16:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r1]
	ldrh	ip, [r0]
	rsb	r3, r3, #0
	rsb	ip, ip, #0
	strh	r3, [r0]	@ movhi
	strh	ip, [r1]	@ movhi
	ldrh	r3, [r2]
	rsb	r3, r3, #0
	strh	r3, [r2]	@ movhi
	bx	lr
	.fnend
	.size	axes_nynxnz_s16, .-axes_nynxnz_s16
	.align	2
	.type	axes_pxpynz_s16, %function
axes_pxpynz_s16:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r2]
	rsb	r3, r3, #0
	strh	r3, [r2]	@ movhi
	bx	lr
	.fnend
	.size	axes_pxpynz_s16, .-axes_pxpynz_s16
	.align	2
	.type	axes_pynxnz_s16, %function
axes_pynxnz_s16:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r0]
	ldrh	ip, [r1]
	rsb	r3, r3, #0
	strh	ip, [r0]	@ movhi
	strh	r3, [r1]	@ movhi
	ldrh	r3, [r2]
	rsb	r3, r3, #0
	strh	r3, [r2]	@ movhi
	bx	lr
	.fnend
	.size	axes_pynxnz_s16, .-axes_pynxnz_s16
	.align	2
	.type	axes_nxnynz_s16, %function
axes_nxnynz_s16:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r0]
	rsb	r3, r3, #0
	strh	r3, [r0]	@ movhi
	ldrh	r3, [r1]
	rsb	r3, r3, #0
	strh	r3, [r1]	@ movhi
	ldrh	r3, [r2]
	rsb	r3, r3, #0
	strh	r3, [r2]	@ movhi
	bx	lr
	.fnend
	.size	axes_nxnynz_s16, .-axes_nxnynz_s16
	.align	2
	.type	axes_nypxnz_s16, %function
axes_nypxnz_s16:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r1]
	ldrh	ip, [r0]
	rsb	r3, r3, #0
	strh	r3, [r0]	@ movhi
	strh	ip, [r1]	@ movhi
	ldrh	r3, [r2]
	rsb	r3, r3, #0
	strh	r3, [r2]	@ movhi
	bx	lr
	.fnend
	.size	axes_nypxnz_s16, .-axes_nypxnz_s16
	.align	2
	.type	axes_nxpypz_s16, %function
axes_nxpypz_s16:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r0]
	rsb	r3, r3, #0
	strh	r3, [r0]	@ movhi
	bx	lr
	.fnend
	.size	axes_nxpypz_s16, .-axes_nxpypz_s16
	.align	2
	.type	axes_pypxpz_s16, %function
axes_pypxpz_s16:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r0]
	ldrh	r2, [r1]
	strh	r2, [r0]	@ movhi
	strh	r3, [r1]	@ movhi
	bx	lr
	.fnend
	.size	axes_pypxpz_s16, .-axes_pypxpz_s16
	.align	2
	.type	axes_pxnypz_s16, %function
axes_pxnypz_s16:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r1]
	rsb	r3, r3, #0
	strh	r3, [r1]	@ movhi
	bx	lr
	.fnend
	.size	axes_pxnypz_s16, .-axes_pxnypz_s16
	.align	2
	.type	axes_nynxpz_s16, %function
axes_nynxpz_s16:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r2, [r1]
	ldrh	r3, [r0]
	rsb	r2, r2, #0
	rsb	r3, r3, #0
	strh	r2, [r0]	@ movhi
	strh	r3, [r1]	@ movhi
	bx	lr
	.fnend
	.size	axes_nynxpz_s16, .-axes_nynxpz_s16
	.align	2
	.type	stm_get_position, %function
stm_get_position:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:system_rev
	movt	r3, #:upper16:system_rev
	ldr	r3, [r3]
	cmp	r3, #3
	cmpne	r3, #0
	bne	.L22
	mov	r0, #6
	bx	lr
.L22:
	sub	r2, r3, #4
	sub	r3, r3, #1
	cmp	r3, #1
	cmphi	r2, #1
	movhi	r0, #2
	movls	r0, #0
	bx	lr
	.fnend
	.size	stm_get_position, .-stm_get_position
	.align	2
	.type	cm36651_get_threshold, %function
cm36651_get_threshold:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #15
	bx	lr
	.fnend
	.size	cm36651_get_threshold, .-cm36651_get_threshold
	.align	2
	.type	proximity_leda_on, %function
proximity_leda_on:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:__gpio_set_value
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	mov	r1, r0
	mov	r4, r0
	movt	r3, #:upper16:__gpio_set_value
	mov	r0, #239
	blx	r3
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR0
	movw	r3, #:lower16:printk
	mov	r2, r4
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	proximity_leda_on, .-proximity_leda_on
	.align	2
	.type	midas_sensor_init, %function
midas_sensor_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r1, #:lower16:.LC1
	movw	r5, #:lower16:gpio_request
	movt	r1, #:upper16:.LC1
	.pad #28
	sub	sp, sp, #28
	movt	r5, #:upper16:gpio_request
	mov	r0, #190
	movw	r4, #:lower16:printk
	blx	r5
	mov	r6, r0
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	movt	r4, #:upper16:printk
	ldr	r1, .L70
	blx	r4
	cmp	r6, #0
	bne	.L59
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #15
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mov	r0, #190
	blx	r3
	movw	r3, #:lower16:__gpio_set_value
	mov	r0, #190
	movt	r3, #:upper16:__gpio_set_value
	mov	r1, #2
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, r6
	movt	r3, #:upper16:s3c_gpio_setpull
	mov	r0, #190
	blx	r3
	movw	r3, #:lower16:s5p_gpio_set_drvstr
	mov	r1, r6
	movt	r3, #:upper16:s5p_gpio_set_drvstr
	mov	r0, #190
	blx	r3
	movw	r3, #:lower16:__gpio_to_irq
	mov	r0, #190
	movt	r3, #:upper16:__gpio_to_irq
	blx	r3
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	str	r0, [r3, #36]
.L28:
	movw	r1, #:lower16:.LC5
	mov	r0, #50
	movt	r1, #:upper16:.LC5
	movw	r6, #:lower16:gpio_request
	blx	r5
	mov	r10, r0
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	ldr	r1, .L70+4
	blx	r4
	cmp	r10, #0
	movw	r7, #:lower16:printk
	movt	r6, #:upper16:gpio_request
	movt	r7, #:upper16:printk
	bne	.L60
	movw	r1, #:lower16:.LC7
	mov	r0, #126
	movt	r1, #:upper16:.LC7
	blx	r6
	subs	r10, r0, #0
	bne	.L61
	movw	r9, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #15
	movt	r9, #:upper16:s3c_gpio_cfgpin
	mov	r0, #50
	movw	r8, #:lower16:__gpio_set_value
	movw	r6, #:lower16:s3c_gpio_setpull
	blx	r9
	movt	r8, #:upper16:__gpio_set_value
	mov	r0, #50
	mov	r1, #2
	movt	r6, #:upper16:s3c_gpio_setpull
	blx	r8
	movw	r7, #:lower16:s5p_gpio_set_drvstr
	mov	r1, #1
	mov	r0, #50
	movt	r7, #:upper16:s5p_gpio_set_drvstr
	blx	r6
	mov	r1, r10
	mov	r0, #50
	blx	r7
	movw	r3, #:lower16:.LANCHOR1
	mvn	r2, #0
	movt	r3, #:upper16:.LANCHOR1
	mvn	r1, #14
	str	r2, [r3, #76]
	mov	r0, #126
	blx	r9
	mov	r0, #126
	mov	r1, r10
	blx	r8
	mov	r1, #1
	mov	r0, #126
	blx	r6
	mov	r1, r10
	mov	r0, #126
	blx	r7
.L33:
	movw	r8, #:lower16:i2c_get_adapter
	mov	r0, #1
	movt	r8, #:upper16:i2c_get_adapter
	blx	r8
	subs	r10, r0, #0
	beq	.L62
	movw	r9, #:lower16:.LANCHOR1
	movw	r6, #:lower16:i2c_new_device
	movt	r9, #:upper16:.LANCHOR1
	movt	r6, #:upper16:i2c_new_device
	mov	r1, r9
	blx	r6
	cmp	r0, #0
	beq	.L63
	movw	r1, #:lower16:.LC13
	movw	ip, #:lower16:_dev_info
	add	r0, r0, #32
	movt	r1, #:upper16:.LC13
	movt	ip, #:upper16:_dev_info
	ldr	r2, .L70+8
	mov	r3, r9
	blx	ip
.L36:
	mov	r0, r10
	ldr	r1, .L70+12
	blx	r6
	cmp	r0, #0
	beq	.L37
	movw	r1, #:lower16:.LC13
	movw	ip, #:lower16:_dev_info
	add	r0, r0, #32
	movt	r1, #:upper16:.LC13
	movt	ip, #:upper16:_dev_info
	ldr	r2, .L70+8
	ldr	r3, .L70+12
	blx	ip
.L38:
	movw	r7, #:lower16:i2c_put_adapter
	mov	r0, r10
	movw	r3, #:lower16:printk
	movt	r7, #:upper16:i2c_put_adapter
	str	r3, [sp, #20]
	blx	r7
	ldr	r3, [sp, #20]
	movw	r1, #:lower16:.LC14
	movt	r1, #:upper16:.LC14
	mov	r0, #239
	movt	r3, #:upper16:printk
	str	r3, [sp, #20]
	blx	r5
	mov	r10, r0
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	ldr	r1, .L70+16
	blx	r4
	cmp	r10, #0
	bne	.L64
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mvn	r1, #14
	movt	r3, #:upper16:s3c_gpio_cfgpin
	mov	r0, #239
	str	r3, [sp, #12]
	movw	r3, #:lower16:__gpio_set_value
	str	r3, [sp, #16]
	movw	fp, #:lower16:s3c_gpio_setpull
	ldr	r3, [sp, #12]
	movt	fp, #:upper16:s3c_gpio_setpull
	blx	r3
	ldr	r3, [sp, #16]
	mov	r1, r10
	mov	r0, #239
	movt	r3, #:upper16:__gpio_set_value
	str	r3, [sp, #16]
	blx	r3
	mov	r1, r10
	mov	r0, #239
	blx	fp
	mov	r0, #9
	blx	r8
	subs	r10, r0, #0
	beq	.L40
	ldr	r1, .L70+20
	blx	r6
	cmp	r0, #0
	beq	.L65
	movw	r1, #:lower16:.LC13
	movw	ip, #:lower16:_dev_info
	add	r0, r0, #32
	movt	r1, #:upper16:.LC13
	movt	ip, #:upper16:_dev_info
	ldr	r2, .L70+8
	ldr	r3, .L70+20
	blx	ip
.L42:
	mov	r0, r10
	movw	r10, #:lower16:printk
	blx	r7
	movw	r1, #:lower16:.LC17
	mov	r0, #241
	movt	r1, #:upper16:.LC17
	movt	r10, #:upper16:printk
	blx	r5
	mov	r3, r0
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	ldr	r1, .L70+24
	str	r3, [sp, #8]
	blx	r4
	ldr	r3, [sp, #8]
	cmp	r3, #0
	bne	.L66
	movw	r3, #:lower16:s5p_register_gpio_interrupt
	mov	r0, #241
	movt	r3, #:upper16:s5p_register_gpio_interrupt
	blx	r3
	mov	r1, #1
	mov	r0, #241
	blx	fp
	mvn	r1, #0
	ldr	r3, [sp, #12]
	mov	r0, #241
	blx	r3
	movw	r3, #:lower16:__gpio_to_irq
	mov	r0, #241
	movt	r3, #:upper16:__gpio_to_irq
	blx	r3
	str	r0, [r9, #156]
.L46:
	mov	r0, #10
	blx	r8
	subs	r9, r0, #0
	beq	.L47
	ldr	r1, .L70+28
	blx	r6
	cmp	r0, #0
	beq	.L67
	movw	r1, #:lower16:.LC13
	movw	ip, #:lower16:_dev_info
	add	r0, r0, #32
	movt	r1, #:upper16:.LC13
	movt	ip, #:upper16:_dev_info
	ldr	r2, .L70+8
	ldr	r3, .L70+28
	blx	ip
.L49:
	mov	r0, r9
	movw	r9, #:lower16:printk
	blx	r7
	movw	r1, #:lower16:.LC21
	mov	r0, #52
	movt	r1, #:upper16:.LC21
	movt	r9, #:upper16:printk
	blx	r5
	mov	r5, r0
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	ldr	r1, .L70+32
	blx	r4
	cmp	r5, #0
	bne	.L68
	mvn	r1, #15
	ldr	r3, [sp, #12]
	mov	r0, #52
	blx	r3
	mov	r0, #52
	ldr	r3, [sp, #16]
	mov	r1, #2
	blx	r3
	mov	r1, r5
	mov	r0, #52
	blx	fp
	movw	r3, #:lower16:s5p_gpio_set_drvstr
	mov	r1, r5
	movt	r3, #:upper16:s5p_gpio_set_drvstr
	mov	r0, #52
	blx	r3
.L53:
	mov	r0, #11
	blx	r8
	subs	r5, r0, #0
	beq	.L54
	ldr	r1, .L70+36
	blx	r6
	cmp	r0, #0
	beq	.L69
	movw	r1, #:lower16:.LC13
	movw	ip, #:lower16:_dev_info
	add	r0, r0, #32
	movt	r1, #:upper16:.LC13
	movt	ip, #:upper16:_dev_info
	ldr	r2, .L70+8
	ldr	r3, .L70+36
	blx	ip
.L56:
	mov	r0, r5
	mov	r10, #0
	blx	r7
.L29:
	mov	r0, r10
	add	sp, sp, #28
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L63:
	mov	r3, #1
	movw	r1, #:lower16:.LC12
	movw	ip, #:lower16:dev_err
	str	r3, [sp]
	movt	r1, #:upper16:.LC12
	movt	ip, #:upper16:dev_err
	add	r0, r10, #48
	ldr	r2, .L70+8
	mov	r3, r9
	blx	ip
	b	.L36
.L37:
	mov	r3, #1
	movw	r1, #:lower16:.LC12
	movw	ip, #:lower16:dev_err
	str	r3, [sp]
	movt	r1, #:upper16:.LC12
	movt	ip, #:upper16:dev_err
	add	r0, r10, #48
	ldr	r2, .L70+8
	ldr	r3, .L70+12
	blx	ip
	b	.L38
.L65:
	mov	r3, #9
	movw	r1, #:lower16:.LC12
	movw	ip, #:lower16:dev_err
	str	r3, [sp]
	movt	r1, #:upper16:.LC12
	movt	ip, #:upper16:dev_err
	add	r0, r10, #48
	ldr	r2, .L70+8
	ldr	r3, .L70+20
	blx	ip
	b	.L42
.L67:
	mov	r3, #10
	movw	r1, #:lower16:.LC12
	movw	ip, #:lower16:dev_err
	str	r3, [sp]
	movt	r1, #:upper16:.LC12
	movt	ip, #:upper16:dev_err
	add	r0, r9, #48
	ldr	r2, .L70+8
	ldr	r3, .L70+28
	blx	ip
	b	.L49
.L69:
	mov	r3, #11
	movw	r1, #:lower16:.LC12
	movw	ip, #:lower16:dev_err
	str	r3, [sp]
	movt	r1, #:upper16:.LC12
	movt	ip, #:upper16:dev_err
	add	r0, r5, #48
	ldr	r2, .L70+8
	ldr	r3, .L70+36
	blx	ip
	b	.L56
.L61:
	movw	r0, #:lower16:.LC8
	ldr	r1, .L70+4
	movt	r0, #:upper16:.LC8
	mov	r2, r10
	blx	r7
.L31:
	cmp	r10, #0
	bge	.L33
	movw	r0, #:lower16:.LC9
	ldr	r1, .L70+40
	mov	r2, r10
	movt	r0, #:upper16:.LC9
	blx	r4
	b	.L29
.L47:
	movw	r0, #:lower16:.LC10
	ldr	r1, .L70+8
	mov	r2, #10
	movt	r0, #:upper16:.LC10
	blx	r4
	movw	r0, #:lower16:.LC22
	ldr	r1, .L70+40
	movt	r0, #:upper16:.LC22
	mvn	r2, #18
	blx	r4
	mvn	r10, #18
	b	.L29
.L66:
	movw	r0, #:lower16:.LC19
	mov	r2, r3
	str	r3, [sp, #8]
	movt	r0, #:upper16:.LC19
	ldr	r1, .L70+24
	blx	r10
	ldr	r3, [sp, #8]
	cmp	r3, #0
	bge	.L46
	movw	r0, #:lower16:.LC20
	mov	r2, r3
	str	r3, [sp, #8]
	movt	r0, #:upper16:.LC20
	ldr	r1, .L70+40
	blx	r10
	ldr	r3, [sp, #8]
	mov	r10, r3
	b	.L29
.L68:
	movw	r0, #:lower16:.LC23
	ldr	r1, .L70+32
	movt	r0, #:upper16:.LC23
	mov	r2, r5
	blx	r9
	cmp	r5, #0
	bge	.L53
	movw	r0, #:lower16:.LC24
	ldr	r1, .L70+40
	movt	r0, #:upper16:.LC24
	mov	r2, r5
	blx	r9
	mov	r10, r5
	b	.L29
.L54:
	movw	r0, #:lower16:.LC10
	ldr	r1, .L70+8
	mov	r2, #11
	movt	r0, #:upper16:.LC10
	blx	r4
	mvn	r10, #18
	movw	r0, #:lower16:.LC11
	ldr	r1, .L70+40
	mov	r2, r10
	movt	r0, #:upper16:.LC11
	blx	r4
	b	.L29
.L60:
	movw	r0, #:lower16:.LC6
	ldr	r1, .L70+4
	mov	r2, r10
	movt	r0, #:upper16:.LC6
	blx	r7
	b	.L31
.L59:
	movw	r0, #:lower16:.LC3
	ldr	r1, .L70
	movt	r0, #:upper16:.LC3
	mov	r2, r6
	blx	r4
	cmp	r6, #0
	bge	.L28
	movw	r0, #:lower16:.LC4
	ldr	r1, .L70+40
	movt	r0, #:upper16:.LC4
	mov	r2, r6
	blx	r4
	mov	r10, r6
	b	.L29
.L64:
	movw	r0, #:lower16:.LC15
	mov	r2, r10
	ldr	r1, .L70+16
	movt	r0, #:upper16:.LC15
	ldr	r3, [sp, #20]
	blx	r3
	movw	r0, #:lower16:.LC16
	ldr	r1, .L70+40
	mov	r2, r10
	ldr	r3, [sp, #20]
	movt	r0, #:upper16:.LC16
	blx	r3
	b	.L29
.L40:
	movw	r0, #:lower16:.LC10
	ldr	r1, .L70+8
	mov	r2, #9
	ldr	r3, [sp, #20]
	movt	r0, #:upper16:.LC10
	mvn	r10, #18
	blx	r3
	movw	r0, #:lower16:.LC18
	ldr	r1, .L70+40
	movt	r0, #:upper16:.LC18
	mvn	r2, #18
	ldr	r3, [sp, #20]
	blx	r3
	b	.L29
.L62:
	movw	r0, #:lower16:.LC10
	ldr	r1, .L70+8
	mov	r2, #1
	movt	r0, #:upper16:.LC10
	blx	r4
	movw	r0, #:lower16:.LC11
	ldr	r1, .L70+40
	movt	r0, #:upper16:.LC11
	mvn	r2, #18
	blx	r4
	mvn	r10, #18
	b	.L29
.L71:
	.align	2
.L70:
	.word	.LANCHOR0+20
	.word	.LANCHOR0+56
	.word	.LANCHOR0+72
	.word	.LANCHOR1+40
	.word	.LANCHOR0+88
	.word	.LANCHOR1+80
	.word	.LANCHOR0+108
	.word	.LANCHOR1+120
	.word	.LANCHOR0+128
	.word	.LANCHOR1+160
	.word	.LANCHOR0+36
	.fnend
	.size	midas_sensor_init, .-midas_sensor_init
	.align	2
	.global	select_func_s16
	.type	select_func_s16, %function
select_func_s16:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	cmp	r0, #15
	ldrls	pc, [pc, r0, asl #2]
	b	.L73
.L75:
	.word	.L73
	.word	.L76
	.word	.L77
	.word	.L78
	.word	.L79
	.word	.L80
	.word	.L81
	.word	.L82
	.word	.L83
	.word	.L84
	.word	.L85
	.word	.L86
	.word	.L87
	.word	.L88
	.word	.L89
	.word	.L90
.L73:
	movw	r0, #:lower16:.LC25
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L92
	movt	r0, #:upper16:.LC25
	blx	r3
	movw	r0, #:lower16:axes_pxpypz_s16
	movt	r0, #:upper16:axes_pxpypz_s16
	ldmfd	sp!, {r3, pc}
.L90:
	movw	r0, #:lower16:.LC40
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L92
	movt	r0, #:upper16:.LC40
	blx	r3
	movw	r0, #:lower16:axes_nynxpz_s16
	movt	r0, #:upper16:axes_nynxpz_s16
	ldmfd	sp!, {r3, pc}
.L76:
	movw	r0, #:lower16:.LC26
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L92
	movt	r0, #:upper16:.LC26
	blx	r3
	movw	r0, #:lower16:axes_pynxpz_s16
	movt	r0, #:upper16:axes_pynxpz_s16
	ldmfd	sp!, {r3, pc}
.L77:
	movw	r0, #:lower16:.LC27
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L92
	movt	r0, #:upper16:.LC27
	blx	r3
	movw	r0, #:lower16:axes_nxnypz_s16
	movt	r0, #:upper16:axes_nxnypz_s16
	ldmfd	sp!, {r3, pc}
.L78:
	movw	r0, #:lower16:.LC28
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L92
	movt	r0, #:upper16:.LC28
	blx	r3
	movw	r0, #:lower16:axes_nypxpz_s16
	movt	r0, #:upper16:axes_nypxpz_s16
	ldmfd	sp!, {r3, pc}
.L79:
	movw	r0, #:lower16:.LC29
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L92
	movt	r0, #:upper16:.LC29
	blx	r3
	movw	r0, #:lower16:axes_nxpynz_s16
	movt	r0, #:upper16:axes_nxpynz_s16
	ldmfd	sp!, {r3, pc}
.L80:
	movw	r0, #:lower16:.LC30
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L92
	movt	r0, #:upper16:.LC30
	blx	r3
	movw	r0, #:lower16:axes_pypxnz_s16
	movt	r0, #:upper16:axes_pypxnz_s16
	ldmfd	sp!, {r3, pc}
.L81:
	movw	r0, #:lower16:.LC31
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L92
	movt	r0, #:upper16:.LC31
	blx	r3
	movw	r0, #:lower16:axes_pxnynz_s16
	movt	r0, #:upper16:axes_pxnynz_s16
	ldmfd	sp!, {r3, pc}
.L82:
	movw	r0, #:lower16:.LC32
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L92
	movt	r0, #:upper16:.LC32
	blx	r3
	movw	r0, #:lower16:axes_nynxnz_s16
	movt	r0, #:upper16:axes_nynxnz_s16
	ldmfd	sp!, {r3, pc}
.L83:
	movw	r0, #:lower16:.LC33
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L92
	movt	r0, #:upper16:.LC33
	blx	r3
	movw	r0, #:lower16:axes_pxpynz_s16
	movt	r0, #:upper16:axes_pxpynz_s16
	ldmfd	sp!, {r3, pc}
.L84:
	movw	r0, #:lower16:.LC34
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L92
	movt	r0, #:upper16:.LC34
	blx	r3
	movw	r0, #:lower16:axes_pynxnz_s16
	movt	r0, #:upper16:axes_pynxnz_s16
	ldmfd	sp!, {r3, pc}
.L85:
	movw	r0, #:lower16:.LC35
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L92
	movt	r0, #:upper16:.LC35
	blx	r3
	movw	r0, #:lower16:axes_nxnynz_s16
	movt	r0, #:upper16:axes_nxnynz_s16
	ldmfd	sp!, {r3, pc}
.L86:
	movw	r0, #:lower16:.LC36
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L92
	movt	r0, #:upper16:.LC36
	blx	r3
	movw	r0, #:lower16:axes_nypxnz_s16
	movt	r0, #:upper16:axes_nypxnz_s16
	ldmfd	sp!, {r3, pc}
.L87:
	movw	r0, #:lower16:.LC37
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L92
	movt	r0, #:upper16:.LC37
	blx	r3
	movw	r0, #:lower16:axes_nxpypz_s16
	movt	r0, #:upper16:axes_nxpypz_s16
	ldmfd	sp!, {r3, pc}
.L88:
	movw	r0, #:lower16:.LC38
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L92
	movt	r0, #:upper16:.LC38
	blx	r3
	movw	r0, #:lower16:axes_pypxpz_s16
	movt	r0, #:upper16:axes_pypxpz_s16
	ldmfd	sp!, {r3, pc}
.L89:
	movw	r0, #:lower16:.LC39
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L92
	movt	r0, #:upper16:.LC39
	blx	r3
	movw	r0, #:lower16:axes_pxnypz_s16
	movt	r0, #:upper16:axes_pxnypz_s16
	ldmfd	sp!, {r3, pc}
.L93:
	.align	2
.L92:
	.word	.LANCHOR0+148
	.fnend
	.size	select_func_s16, .-select_func_s16
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.17220, %object
	.size	__func__.17220, 18
__func__.17220:
	.ascii	"proximity_leda_on\000"
	.space	2
	.type	__func__.17211, %object
	.size	__func__.17211, 16
__func__.17211:
	.ascii	"accel_gpio_init\000"
	.type	__func__.17250, %object
	.size	__func__.17250, 18
__func__.17250:
	.ascii	"midas_sensor_init\000"
	.space	2
	.type	__func__.17216, %object
	.size	__func__.17216, 15
__func__.17216:
	.ascii	"gyro_gpio_init\000"
	.space	1
	.type	__func__.17193, %object
	.size	__func__.17193, 16
__func__.17193:
	.ascii	"i2c_add_devices\000"
	.type	__func__.17225, %object
	.size	__func__.17225, 18
__func__.17225:
	.ascii	"optical_gpio_init\000"
	.space	2
	.type	__func__.17238, %object
	.size	__func__.17238, 18
__func__.17238:
	.ascii	"ak8975c_gpio_init\000"
	.space	2
	.type	__func__.17243, %object
	.size	__func__.17243, 17
__func__.17243:
	.ascii	"lps331_gpio_init\000"
	.space	3
	.type	__func__.16912, %object
	.size	__func__.16912, 16
__func__.16912:
	.ascii	"select_func_s16\000"
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_midas_sensor_init6, %object
	.size	__initcall_midas_sensor_init6, 4
__initcall_midas_sensor_init6:
	.word	midas_sensor_init
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	i2c_devs1, %object
	.size	i2c_devs1, 80
i2c_devs1:
	.ascii	"lsm330dlc_accel\000"
	.space	4
	.space	2
	.short	25
	.word	accel_pdata
	.space	12
	.ascii	"lsm330dlc_gyro\000"
	.space	5
	.space	2
	.short	107
	.word	gyro_pdata
	.space	12
	.type	i2c_devs9_emul, %object
	.size	i2c_devs9_emul, 40
i2c_devs9_emul:
	.ascii	"cm36651\000"
	.space	12
	.space	2
	.short	24
	.word	cm36651_pdata
	.space	12
	.type	i2c_devs10_emul, %object
	.size	i2c_devs10_emul, 40
i2c_devs10_emul:
	.ascii	"ak8975\000"
	.space	13
	.space	2
	.short	12
	.word	akm8975_pdata
	.space	12
	.type	i2c_devs11_emul, %object
	.size	i2c_devs11_emul, 40
i2c_devs11_emul:
	.ascii	"lps331ap\000"
	.space	11
	.space	2
	.short	93
	.word	lps331ap_pdata
	.space	12
	.type	lps331ap_pdata, %object
	.size	lps331ap_pdata, 4
lps331ap_pdata:
	.word	52
	.type	akm8975_pdata, %object
	.size	akm8975_pdata, 4
akm8975_pdata:
	.word	241
	.type	cm36651_pdata, %object
	.size	cm36651_pdata, 12
cm36651_pdata:
	.word	proximity_leda_on
	.word	cm36651_get_threshold
	.word	192
	.type	gyro_pdata, %object
	.size	gyro_pdata, 8
gyro_pdata:
	.word	stm_get_position
	.byte	1
	.space	3
	.type	accel_pdata, %object
	.size	accel_pdata, 8
accel_pdata:
	.word	stm_get_position
	.byte	1
	.space	3
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>%s, onoff = %d\012\000"
	.space	1
.LC1:
	.ascii	"accelerometer_irq\000"
	.space	2
.LC2:
	.ascii	"<6>%s\012\000"
	.space	1
.LC3:
	.ascii	"<3>%s, Failed to request gpio accelerometer_irq(%d)"
	.ascii	"\012\000"
	.space	3
.LC4:
	.ascii	"<3>%s, accel_gpio_init fail(err=%d)\012\000"
	.space	3
.LC5:
	.ascii	"stm_gyro_irq\000"
	.space	3
.LC6:
	.ascii	"<3>%s, Failed to request gpio stm_gyro_irq(%d)\012\000"
.LC7:
	.ascii	"stm_gyro_data_enable\000"
	.space	3
.LC8:
	.ascii	"<3>%s, Failed to request gpio stm_gyro_data_enable("
	.ascii	"%d)\012\000"
.LC9:
	.ascii	"<3>%s, gyro_gpio_init(err=%d)\012\000"
	.space	1
.LC10:
	.ascii	"<3>%s: ERROR i2c bus %d not found\012\000"
	.space	1
.LC11:
	.ascii	"<3>%s, i2c1 adding i2c fail(err=%d)\012\000"
	.space	3
.LC12:
	.ascii	"%s - added %s at bus i2c bus %d failed\012\000"
.LC13:
	.ascii	"%s - added %s successfully\012\000"
.LC14:
	.ascii	"optical_power_supply_on\000"
.LC15:
	.ascii	"<3>%s, Failed to request gpio optical power supply("
	.ascii	"%d)\012\000"
.LC16:
	.ascii	"<3>%s, optical_gpio_init(err=%d)\012\000"
	.space	2
.LC17:
	.ascii	"gpio_akm_int\000"
	.space	3
.LC18:
	.ascii	"<3>%s, i2c9 adding i2c fail(err=%d)\012\000"
	.space	3
.LC19:
	.ascii	"<3>%s, Failed to request gpio akm_int.(%d)\012\000"
.LC20:
	.ascii	"<3>%s, ak8975c_gpio_init fail(err=%d)\012\000"
	.space	1
.LC21:
	.ascii	"lps331_irq\000"
	.space	1
.LC22:
	.ascii	"<3>%s, i2c10 adding i2c fail(err=%d)\012\000"
	.space	2
.LC23:
	.ascii	"<3>%s, Failed to request gpio lps331_irq(%d)\012\000"
	.space	2
.LC24:
	.ascii	"<3>%s, lps331_gpio_init fail(err=%d)\012\000"
	.space	2
.LC25:
	.ascii	"<6>%s, AXES_PXPYPZ\012\000"
.LC26:
	.ascii	"<6>%s, AXES_PYNXPZ\012\000"
.LC27:
	.ascii	"<6>%s, AXES_NXNYPZ\012\000"
.LC28:
	.ascii	"<6>%s, AXES_NYPXPZ\012\000"
.LC29:
	.ascii	"<6>%s, AXES_NXPYNZ\012\000"
.LC30:
	.ascii	"<6>%s, AXES_PYPXNZ\012\000"
.LC31:
	.ascii	"<6>%s, AXES_PXNYNZ\012\000"
.LC32:
	.ascii	"<6>%s, AXES_NYNXNZ\012\000"
.LC33:
	.ascii	"<6>%s, AXES_PXPYNZ\012\000"
.LC34:
	.ascii	"<6>%s, AXES_PYNXNZ\012\000"
.LC35:
	.ascii	"<6>%s, AXES_NXNYNZ\012\000"
.LC36:
	.ascii	"<6>%s, AXES_NYPXNZ\012\000"
.LC37:
	.ascii	"<6>%s, AXES_NXPYPZ\012\000"
.LC38:
	.ascii	"<6>%s, AXES_PYPXPZ\012\000"
.LC39:
	.ascii	"<6>%s, AXES_PXNYPZ\012\000"
.LC40:
	.ascii	"<6>%s, AXES_NYNXPZ\012\000"
	.ident	"GCC: (GNU) 4.8"
