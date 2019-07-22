	.cpu cortex-a9
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"pwm.c"
	.text
	.align	2
	.global	pwm_request
	.syntax unified
	.arm
	.fpu softvfp
	.type	pwm_request, %function
pwm_request:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	movw	r3, #:lower16:mutex_lock
	mov	r5, r0
	movt	r3, #:upper16:mutex_lock
	mov	r0, r4
	mov	r6, r1
	blx	r3
	mov	r0, r4
	ldr	r4, [r0, #24]!
	cmp	r4, r0
	beq	.L7
	ldrb	r3, [r4, #35]	@ zero_extendqisi2
	cmp	r5, r3
	bne	.L4
	b	.L3
.L5:
	ldrb	r3, [r4, #35]	@ zero_extendqisi2
	cmp	r3, r5
	beq	.L3
.L4:
	ldr	r4, [r4]
	cmp	r4, r0
	bne	.L5
.L7:
	mvn	r4, #1
.L2:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.L3:
	ldrb	r3, [r4, #34]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #1
	streq	r6, [r4, #20]
	strbeq	r3, [r4, #34]
	beq	.L2
.L11:
	mvn	r4, #15
	b	.L2
	.fnend
	.size	pwm_request, .-pwm_request
	.align	2
	.global	pwm_free
	.syntax unified
	.arm
	.fpu softvfp
	.type	pwm_free, %function
pwm_free:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	movw	r3, #:lower16:mutex_lock
	mov	r4, r0
	movw	r0, #:lower16:.LANCHOR0
	movt	r3, #:upper16:mutex_lock
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldrb	r3, [r4, #34]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L13
	sub	r3, r3, #1
	mov	r2, #0
	strb	r3, [r4, #34]
	str	r2, [r4, #20]
.L14:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:mutex_unlock
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:mutex_unlock
	pop	{r4, lr}
	bx	r3	@ indirect register sibling call
.L13:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	ldrb	r1, [r4, #35]	@ zero_extendqisi2
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	b	.L14
	.fnend
	.size	pwm_free, .-pwm_free
	.align	2
	.global	pwm_enable
	.syntax unified
	.arm
	.fpu softvfp
	.type	pwm_enable, %function
pwm_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	mov	r4, r0
	movw	r0, #:lower16:.LANCHOR1
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	movt	r0, #:upper16:.LANCHOR1
	blx	r3
	ldrb	r3, [r4, #33]	@ zero_extendqisi2
	mov	r5, r0
	cmp	r3, #0
	bne	.L17
	movw	r6, #:lower16:clk_enable
	ldr	r0, [r4, #16]
	movt	r6, #:upper16:clk_enable
	blx	r6
	ldr	r0, [r4, #12]
	blx	r6
	mov	r3, #0
	ldrb	r0, [r4, #32]	@ zero_extendqisi2
	movt	r3, 64560
	mov	r1, #1
	ldr	r2, [r3, #8]
	orr	r2, r2, r1, lsl r0
	str	r2, [r3, #8]
	strb	r1, [r4, #33]
.L17:
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r1, r5
	movt	r0, #:upper16:.LANCHOR1
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
	mov	r0, #0
	pop	{r4, r5, r6, pc}
	.fnend
	.size	pwm_enable, .-pwm_enable
	.align	2
	.global	pwm_disable
	.syntax unified
	.arm
	.fpu softvfp
	.type	pwm_disable, %function
pwm_disable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	mov	r4, r0
	movw	r0, #:lower16:.LANCHOR1
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	movt	r0, #:upper16:.LANCHOR1
	blx	r3
	ldrb	r3, [r4, #33]	@ zero_extendqisi2
	mov	r5, r0
	cmp	r3, #0
	beq	.L20
	mov	r3, #0
	ldrb	r1, [r4, #32]	@ zero_extendqisi2
	movt	r3, 64560
	mov	r0, #1
	ldr	r2, [r3, #8]
	movw	r6, #:lower16:clk_disable
	movt	r6, #:upper16:clk_disable
	bic	r2, r2, r0, lsl r1
	str	r2, [r3, #8]
	ldr	r0, [r4, #16]
	blx	r6
	ldr	r0, [r4, #12]
	blx	r6
	mov	r3, #0
	strb	r3, [r4, #33]
.L20:
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r1, r5
	movt	r0, #:upper16:.LANCHOR1
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	pop	{r4, r5, r6, lr}
	bx	r3	@ indirect register sibling call
	.fnend
	.size	pwm_disable, .-pwm_disable
	.global	__aeabi_uidiv
	.align	2
	.global	pwm_config
	.syntax unified
	.arm
	.fpu softvfp
	.type	pwm_config, %function
pwm_config:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r3, #51712
	movt	r3, 15258
	cmp	r1, r3
	cmpls	r2, r3
	bhi	.L36
	cmp	r2, r1
	blt	.L37
	ldr	ip, [r0, #24]
	cmp	r2, ip
	bne	.L27
	ldr	ip, [r0, #28]
	cmp	r1, ip
	beq	.L41
.L27:
	movw	r6, #:lower16:clk_enable
	mov	r4, r0
	movt	r6, #:upper16:clk_enable
	ldr	r0, [r0, #16]
	mov	r5, r2
	mov	r7, r1
	blx	r6
	ldr	r0, [r4, #12]
	blx	r6
	ldrb	r3, [r4, #35]	@ zero_extendqisi2
	ldr	r2, [r4, #24]
	add	r3, r3, r3, lsl #1
	cmp	r5, r2
	lsl	r3, r3, #2
	add	r2, r3, #16
	add	r3, r3, #-268435444
	sub	r2, r2, #63963136
	add	r3, r3, #204472320
	ldr	r2, [r2]
	ldr	r6, [r3]
	beq	.L28
	movw	r6, #:lower16:clk_get_parent
	ldr	r0, [r4, #16]
	movt	r6, #:upper16:clk_get_parent
	blx	r6
	ldr	r3, [r4, #12]
	cmp	r3, r0
	beq	.L42
	movw	r3, #:lower16:clk_get_rate
	ldr	r0, [r4, #16]
	movt	r3, #:upper16:clk_get_rate
	movw	r8, #:lower16:__aeabi_uidiv
	blx	r3
	movt	r8, #:upper16:__aeabi_uidiv
	mov	r6, r0
.L33:
	mov	r0, #51712
	mov	r1, r6
	str	r5, [r4, #24]
	movt	r0, 15258
	blx	r8
	mov	r1, r0
	mov	r9, r0
	mov	r0, r5
	blx	r8
	mov	r6, r0
.L34:
	mov	r1, r9
	mov	r0, r7
	blx	r8
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	sub	r5, r6, r0
	movw	r0, #:lower16:.LANCHOR1
	cmp	r6, r5
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	movt	r0, #:upper16:.LANCHOR1
	subeq	r5, r6, #1
	blx	r3
	ldrb	ip, [r4, #35]	@ zero_extendqisi2
	mov	r2, #16
	mov	r3, #12
	bic	r5, r5, r5, asr #31
	mov	lr, #1
	mov	r1, r0
	movw	r0, #:lower16:.LANCHOR1
	smlabb	r3, r3, ip, r2
	mov	ip, #0
	movt	ip, 64560
	movt	r0, #:upper16:.LANCHOR1
	sub	r3, r3, #63963136
	str	r5, [r3]
	movw	r5, #:lower16:_raw_spin_unlock_irqrestore
	ldrb	r2, [r4, #35]	@ zero_extendqisi2
	movt	r5, #:upper16:_raw_spin_unlock_irqrestore
	add	r2, r2, lr
	add	r2, r2, r2, lsl lr
	lsl	r2, r2, #2
	sub	r2, r2, #63963136
	str	r6, [r2]
	movw	r6, #:lower16:clk_disable
	ldrb	r2, [r4, #32]	@ zero_extendqisi2
	movt	r6, #:upper16:clk_disable
	add	r3, r2, lr
	add	r7, r2, #2
	lsl	r3, lr, r3
	add	r2, r2, #3
	orr	r3, r3, lr, lsl r7
	ldr	r7, [ip, #8]
	orr	r3, r3, r7
	orr	r3, r3, lr, lsl r2
	str	r3, [ip, #8]
	ldrb	r2, [r4, #32]	@ zero_extendqisi2
	add	r2, r2, lr
	bic	r3, r3, lr, lsl r2
	str	r3, [ip, #8]
	blx	r5
	ldr	r0, [r4, #16]
	blx	r6
	ldr	r0, [r4, #12]
	blx	r6
.L41:
	mov	r0, #0
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L28:
	movw	r3, #:lower16:clk_get_rate
	ldr	r0, [r4, #16]
	movt	r3, #:upper16:clk_get_rate
	movw	r8, #:lower16:__aeabi_uidiv
	blx	r3
	mov	r1, r0
	mov	r0, #51712
	movt	r8, #:upper16:__aeabi_uidiv
	movt	r0, 15258
	blx	r8
	mov	r9, r0
	b	.L34
.L42:
	blx	r6
	movw	r3, #:lower16:clk_get_rate
	movw	r8, #:lower16:__aeabi_uidiv
	movt	r3, #:upper16:clk_get_rate
	movt	r8, #:upper16:__aeabi_uidiv
	blx	r3
	mov	r6, r0
	mov	r0, #51712
	movt	r0, 15258
	mov	r1, r5
	blx	r8
	mov	r10, #4
	mov	fp, r0
	mov	r9, #2
.L32:
	lsl	r1, r9, #16
	mov	r0, r6
	blx	r8
	cmp	fp, r0
	bhi	.L43
	subs	r10, r10, #1
	lsl	r9, r9, #1
	bne	.L32
	lsr	r6, r6, #4
.L31:
	movw	r3, #:lower16:clk_set_rate
	ldr	r0, [r4, #12]
	movt	r3, #:upper16:clk_set_rate
	mov	r1, r6
	blx	r3
	b	.L33
.L43:
	mov	r0, r6
	mov	r1, r9
	blx	r8
	mov	r6, r0
	b	.L31
.L36:
	mvn	r0, #33
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L37:
	mvn	r0, #21
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.fnend
	.size	pwm_config, .-pwm_config
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_pwm_resume, %function
s3c_pwm_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:dev_get_drvdata
	push	{r4, lr}
	.save {r4, lr}
	movt	r3, #:upper16:dev_get_drvdata
	add	r0, r0, #8
	blx	r3
	movw	r3, #:lower16:clk_enable
	mov	r4, r0
	movt	r3, #:upper16:clk_enable
	ldr	r0, [r0, #16]
	blx	r3
	ldr	r1, [r4, #36]
	mov	r2, #0
	movt	r2, 64560
	movw	r3, #:lower16:clk_disable
	movt	r3, #:upper16:clk_disable
	str	r1, [r2]
	ldr	r0, [r4, #16]
	blx	r3
	mov	r0, #0
	pop	{r4, pc}
	.fnend
	.size	s3c_pwm_resume, .-s3c_pwm_resume
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_pwm_suspend, %function
s3c_pwm_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:dev_get_drvdata
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:dev_get_drvdata
	add	r0, r0, #8
	mov	r5, #0
	blx	r3
	movw	r3, #:lower16:clk_enable
	mov	r4, r0
	str	r5, [r0, #24]
	movt	r3, #:upper16:clk_enable
	str	r5, [r0, #28]
	ldr	r0, [r0, #16]
	blx	r3
	mov	r2, r5
	movw	r3, #:lower16:clk_disable
	movt	r2, 64560
	ldr	r0, [r4, #16]
	ldr	r2, [r2]
	movt	r3, #:upper16:clk_disable
	str	r2, [r4, #36]
	blx	r3
	mov	r0, r5
	pop	{r4, r5, r6, pc}
	.fnend
	.size	s3c_pwm_suspend, .-s3c_pwm_suspend
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_pwm_remove, %function
s3c_pwm_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:dev_get_drvdata
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:dev_get_drvdata
	add	r0, r0, #8
	movw	r4, #:lower16:clk_put
	blx	r3
	movt	r4, #:upper16:clk_put
	mov	r5, r0
	ldr	r0, [r0, #12]
	blx	r4
	ldr	r0, [r5, #16]
	blx	r4
	movw	r3, #:lower16:kfree
	mov	r0, r5
	movt	r3, #:upper16:kfree
	blx	r3
	mov	r0, #0
	pop	{r4, r5, r6, pc}
	.fnend
	.size	s3c_pwm_remove, .-s3c_pwm_remove
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_pwm_probe, %function
s3c_pwm_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r0
	ldr	r4, [r0, #92]
	add	r6, r0, #8
	.pad #12
	sub	sp, sp, #12
	ldr	r5, [r0, #4]
	ldr	r0, [r4]
	cmp	r0, #328
	bls	.L68
.L51:
	cmp	r5, #4
	beq	.L69
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L61
	movw	r3, #:lower16:kmem_cache_alloc_trace
	mov	r2, #40
	movt	r3, #:upper16:kmem_cache_alloc_trace
	movw	r1, #32976
	blx	r3
	subs	r4, r0, #0
	beq	.L70
.L55:
	cmp	r5, #0
	strb	r5, [r4, #35]
	addne	r5, r5, #1
	str	r7, [r4, #8]
	lslne	r5, r5, #2
	movw	r1, #:lower16:.LC6
	movw	r7, #:lower16:clk_get
	uxtbne	r5, r5
	movt	r1, #:upper16:.LC6
	movt	r7, #:upper16:clk_get
	strb	r5, [r4, #32]
	mov	r0, r6
	blx	r7
	cmn	r0, #4096
	str	r0, [r4, #16]
	bhi	.L71
	movw	r1, #:lower16:.LC8
	mov	r0, r6
	movt	r1, #:upper16:.LC8
	blx	r7
	cmn	r0, #4096
	str	r0, [r4, #12]
	bhi	.L72
	movw	r5, #:lower16:.LANCHOR0
	mvn	r2, #0
	movt	r5, #:upper16:.LANCHOR0
	movw	r3, #:lower16:mutex_lock
	mov	r0, r5
	str	r2, [r4, #28]
	str	r2, [r4, #24]
	movt	r3, #:upper16:mutex_lock
	blx	r3
	ldr	r2, [r5, #28]
	add	r1, r5, #24
	movw	r3, #:lower16:mutex_unlock
	str	r4, [r5, #28]
	movt	r3, #:upper16:mutex_unlock
	mov	r0, r5
	stm	r4, {r1, r2}
	movw	r5, #:lower16:clk_get_rate
	str	r4, [r2]
	movt	r5, #:upper16:clk_get_rate
	blx	r3
	ldr	r0, [r4, #16]
	mov	r7, #0
	blx	r5
	mov	r8, r0
	ldr	r0, [r4, #12]
	blx	r5
	movw	r2, #:lower16:clk_get_parent
	mov	r9, r0
	movt	r2, #:upper16:clk_get_parent
	ldr	r0, [r4, #16]
	blx	r2
	ldr	r3, [r4, #12]
	movw	r1, #:lower16:.LC1
	ldrb	lr, [r4, #32]	@ zero_extendqisi2
	movw	ip, #:lower16:.LC2
	movt	r1, #:upper16:.LC1
	movt	ip, #:upper16:.LC2
	cmp	r3, r0
	movw	r5, #:lower16:_dev_info
	moveq	r0, r1
	movne	r0, ip
	movw	r1, #:lower16:.LC10
	mov	r3, r9
	stm	sp, {r0, lr}
	movt	r1, #:upper16:.LC10
	mov	r2, r8
	movt	r5, #:upper16:_dev_info
	mov	r0, r6
	blx	r5
	movw	r3, #:lower16:dev_set_drvdata
	mov	r1, r4
	mov	r0, r6
	movt	r3, #:upper16:dev_set_drvdata
	blx	r3
.L50:
	mov	r0, r7
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L72:
	movw	r1, #:lower16:.LC9
	movw	r3, #:lower16:dev_err
	movt	r3, #:upper16:dev_err
	mov	r0, r6
	movt	r1, #:upper16:.LC9
	blx	r3
	movw	r3, #:lower16:clk_put
	ldr	r0, [r4, #16]
	movt	r3, #:upper16:clk_put
	ldr	r7, [r4, #12]
	blx	r3
.L58:
	movw	r3, #:lower16:kfree
	mov	r0, r4
	movt	r3, #:upper16:kfree
	blx	r3
	mov	r0, r7
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L61:
	mov	r4, #16
	b	.L55
.L68:
	movw	r3, #:lower16:gpio_request
	ldr	r1, [r4, #4]
	movt	r3, #:upper16:gpio_request
	blx	r3
	cmp	r0, #0
	bne	.L73
.L52:
	movw	r3, #:lower16:s3c_gpio_cfgpin
	ldr	r1, [r4, #8]
	movt	r3, #:upper16:s3c_gpio_cfgpin
	ldr	r0, [r4]
	blx	r3
	movw	r3, #:lower16:gpio_free
	ldr	r0, [r4]
	movt	r3, #:upper16:gpio_free
	blx	r3
	b	.L51
.L71:
	movw	r1, #:lower16:.LC7
	movw	r3, #:lower16:dev_err
	mov	r0, r6
	movt	r1, #:upper16:.LC7
	movt	r3, #:upper16:dev_err
	blx	r3
	ldr	r7, [r4, #16]
	b	.L58
.L69:
	movw	r1, #:lower16:.LC4
	movw	r3, #:lower16:dev_err
	mov	r0, r6
	movt	r1, #:upper16:.LC4
	movt	r3, #:upper16:dev_err
	mvn	r7, #5
	blx	r3
	b	.L50
.L70:
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:dev_err
	mov	r0, r6
	movt	r1, #:upper16:.LC5
	movt	r3, #:upper16:dev_err
	mvn	r7, #11
	blx	r3
	b	.L50
.L73:
	movw	r0, #:lower16:.LC3
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC3
	blx	r3
	b	.L52
	.fnend
	.size	s3c_pwm_probe, .-s3c_pwm_probe
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pwm_init, %function
pwm_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r1, #:lower16:.LC11
	movw	r5, #:lower16:clk_get
	movt	r1, #:upper16:.LC11
	movt	r5, #:upper16:clk_get
	mov	r0, #0
	movw	r4, #:lower16:.LANCHOR1
	blx	r5
	movt	r4, #:upper16:.LANCHOR1
	movw	r1, #:lower16:.LC12
	str	r0, [r4, #8]
	movt	r1, #:upper16:.LC12
	mov	r0, #0
	blx	r5
	ldr	r3, [r4, #8]
	str	r0, [r4, #12]
	cmn	r3, #4096
	bhi	.L75
	cmn	r0, #4096
	bhi	.L75
	movw	r3, #:lower16:platform_driver_register
	ldr	r0, .L83
	movt	r3, #:upper16:platform_driver_register
	blx	r3
	subs	r4, r0, #0
	bne	.L82
.L74:
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.L75:
	movw	r1, #:lower16:.LANCHOR2
	movw	r0, #:lower16:.LC13
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR2
	movt	r3, #:upper16:printk
	mvn	r4, #21
	movt	r0, #:upper16:.LC13
	blx	r3
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.L82:
	movw	r1, #:lower16:.LANCHOR2
	movw	r0, #:lower16:.LC14
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR2
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC14
	blx	r3
	b	.L74
.L84:
	.align	2
.L83:
	.word	.LANCHOR0+32
	.fnend
	.size	pwm_init, .-pwm_init
	.align	2
	.global	to_pwm_pdata
	.syntax unified
	.arm
	.fpu softvfp
	.type	to_pwm_pdata, %function
to_pwm_pdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #84]
	bx	lr
	.fnend
	.size	to_pwm_pdata, .-to_pwm_pdata
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.13925, %object
	.size	__func__.13925, 9
__func__.13925:
	.ascii	"pwm_init\000"
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	pwm_lock, %object
	.size	pwm_lock, 24
pwm_lock:
	.word	1
	.word	0
	.space	4
	.word	pwm_lock+12
	.word	pwm_lock+12
	.space	4
	.type	pwm_list, %object
	.size	pwm_list, 8
pwm_list:
	.word	pwm_list
	.word	pwm_list
	.type	s3c_pwm_driver, %object
	.size	s3c_pwm_driver, 80
s3c_pwm_driver:
	.word	s3c_pwm_probe
	.word	s3c_pwm_remove
	.space	4
	.word	s3c_pwm_suspend
	.word	s3c_pwm_resume
	.word	.LC15
	.space	4
	.word	0
	.space	44
	.space	4
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	pwm_spin_lock, %object
	.size	pwm_spin_lock, 8
pwm_spin_lock:
	.space	8
	.type	clk_scaler, %object
	.size	clk_scaler, 8
clk_scaler:
	.space	8
	.section	.initcall3.init,"aw",%progbits
	.align	2
	.type	__initcall_pwm_init3, %object
	.size	__initcall_pwm_init3, 4
__initcall_pwm_init3:
	.word	pwm_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>PWM%d device already freed\012\000"
	.space	1
.LC1:
	.ascii	"div\000"
.LC2:
	.ascii	"ext\000"
.LC3:
	.ascii	"<3>failed to get GPIO for PWM0\012\000"
.LC4:
	.ascii	"TIMER4 is currently not supported\012\000"
	.space	1
.LC5:
	.ascii	"failed to allocate pwm_device\012\000"
	.space	1
.LC6:
	.ascii	"pwm-tin\000"
.LC7:
	.ascii	"failed to get pwm tin clk\012\000"
	.space	1
.LC8:
	.ascii	"pwm-tdiv\000"
	.space	3
.LC9:
	.ascii	"failed to get pwm tdiv clk\012\000"
.LC10:
	.ascii	"tin at %lu, tdiv at %lu, tin=%sclk, base %d\012\000"
	.space	3
.LC11:
	.ascii	"pwm-scaler0\000"
.LC12:
	.ascii	"pwm-scaler1\000"
.LC13:
	.ascii	"<3>%s: failed to get scaler clocks\012\000"
.LC14:
	.ascii	"<3>%s: failed to add pwm driver\012\000"
	.space	3
.LC15:
	.ascii	"s3c24xx-pwm\000"
	.section	___ksymtab+pwm_config,"a",%progbits
	.align	2
	.type	__ksymtab_pwm_config, %object
	.size	__ksymtab_pwm_config, 8
__ksymtab_pwm_config:
	.word	pwm_config
	.word	__kstrtab_pwm_config
	.section	___ksymtab+pwm_disable,"a",%progbits
	.align	2
	.type	__ksymtab_pwm_disable, %object
	.size	__ksymtab_pwm_disable, 8
__ksymtab_pwm_disable:
	.word	pwm_disable
	.word	__kstrtab_pwm_disable
	.section	___ksymtab+pwm_enable,"a",%progbits
	.align	2
	.type	__ksymtab_pwm_enable, %object
	.size	__ksymtab_pwm_enable, 8
__ksymtab_pwm_enable:
	.word	pwm_enable
	.word	__kstrtab_pwm_enable
	.section	___ksymtab+pwm_free,"a",%progbits
	.align	2
	.type	__ksymtab_pwm_free, %object
	.size	__ksymtab_pwm_free, 8
__ksymtab_pwm_free:
	.word	pwm_free
	.word	__kstrtab_pwm_free
	.section	___ksymtab+pwm_request,"a",%progbits
	.align	2
	.type	__ksymtab_pwm_request, %object
	.size	__ksymtab_pwm_request, 8
__ksymtab_pwm_request:
	.word	pwm_request
	.word	__kstrtab_pwm_request
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_pwm_config, %object
	.size	__kstrtab_pwm_config, 11
__kstrtab_pwm_config:
	.ascii	"pwm_config\000"
	.type	__kstrtab_pwm_disable, %object
	.size	__kstrtab_pwm_disable, 12
__kstrtab_pwm_disable:
	.ascii	"pwm_disable\000"
	.type	__kstrtab_pwm_enable, %object
	.size	__kstrtab_pwm_enable, 11
__kstrtab_pwm_enable:
	.ascii	"pwm_enable\000"
	.type	__kstrtab_pwm_free, %object
	.size	__kstrtab_pwm_free, 9
__kstrtab_pwm_free:
	.ascii	"pwm_free\000"
	.type	__kstrtab_pwm_request, %object
	.size	__kstrtab_pwm_request, 12
__kstrtab_pwm_request:
	.ascii	"pwm_request\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
