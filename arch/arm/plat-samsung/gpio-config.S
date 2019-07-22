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
	.file	"gpio-config.c"
	.text
	.align	2
	.global	s3c_gpio_cfgpin
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_cfgpin, %function
s3c_gpio_cfgpin:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #328
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	bhi	.L4
	movw	r3, #:lower16:s3c_gpios
	movt	r3, #:upper16:s3c_gpios
	ldr	r5, [r3, r0, lsl #2]
	cmp	r5, #0
	beq	.L4
	mov	r6, r1
	ldr	r1, [r5, #48]
	add	r7, r5, #88
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	mov	r4, r0
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	mov	r0, r7
	sub	r4, r4, r1
	blx	r3
	ldr	r3, [r5, #64]
	mov	r1, r4
	mov	r8, r0
	mov	r2, r6
	mov	r0, r5
	ldr	r3, [r3, #16]
	blx	r3
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r4, r0
	mov	r1, r8
	mov	r0, r7
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
.L1:
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, pc}
.L4:
	mvn	r4, #21
	b	.L1
	.fnend
	.size	s3c_gpio_cfgpin, .-s3c_gpio_cfgpin
	.align	2
	.global	s3c_gpio_cfgpin_range
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_cfgpin_range, %function
s3c_gpio_cfgpin_range:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #0
	beq	.L16
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	mov	r6, r2
	add	r5, r0, r1
.L10:
	mov	r0, r4
	mov	r1, r6
	bl	s3c_gpio_cfgpin
	cmp	r0, #0
	add	r4, r4, #1
	popne	{r4, r5, r6, pc}
	cmp	r5, r4
	bne	.L10
	mov	r0, #0
	pop	{r4, r5, r6, pc}
.L16:
	mov	r0, #0
	bx	lr
	.fnend
	.size	s3c_gpio_cfgpin_range, .-s3c_gpio_cfgpin_range
	.align	2
	.global	s3c_gpio_setpull
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_setpull, %function
s3c_gpio_setpull:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #328
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	bhi	.L23
	movw	r3, #:lower16:s3c_gpios
	movt	r3, #:upper16:s3c_gpios
	ldr	r5, [r3, r0, lsl #2]
	cmp	r5, #0
	beq	.L23
	mov	r6, r1
	ldr	r1, [r5, #48]
	add	r7, r5, #88
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	mov	r4, r0
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	mov	r0, r7
	sub	r4, r4, r1
	blx	r3
	ldr	r3, [r5, #64]
	mov	r1, r4
	mov	r8, r0
	mov	r2, r6
	mov	r0, r5
	ldr	r3, [r3, #8]
	blx	r3
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r4, r0
	mov	r1, r8
	mov	r0, r7
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
.L20:
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, pc}
.L23:
	mvn	r4, #21
	b	.L20
	.fnend
	.size	s3c_gpio_setpull, .-s3c_gpio_setpull
	.align	2
	.global	s3c_gpio_cfgall_range
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_cfgall_range, %function
s3c_gpio_cfgall_range:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #0
	beq	.L34
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	mov	r6, r2
	mov	r7, r3
	add	r5, r0, r1
.L28:
	mov	r1, r7
	mov	r0, r4
	bl	s3c_gpio_setpull
	mov	r0, r4
	mov	r1, r6
	bl	s3c_gpio_cfgpin
	cmp	r0, #0
	add	r4, r4, #1
	popne	{r4, r5, r6, r7, r8, pc}
	cmp	r5, r4
	bne	.L28
	mov	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
.L34:
	mov	r0, #0
	bx	lr
	.fnend
	.size	s3c_gpio_cfgall_range, .-s3c_gpio_cfgall_range
	.align	2
	.global	s5p_gpio_set_drvstr
	.syntax unified
	.arm
	.fpu softvfp
	.type	s5p_gpio_set_drvstr, %function
s5p_gpio_set_drvstr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #328
	bhi	.L41
	movw	r2, #:lower16:s3c_gpios
	mov	r3, r0
	movt	r2, #:upper16:s3c_gpios
	ldr	r0, [r2, r0, lsl #2]
	cmp	r0, #0
	beq	.L41
	push	{r4, lr}
	.save {r4, lr}
	mov	lr, #3
	ldr	ip, [r0, #72]
	ldr	r4, [r0, #48]
	mov	r0, #0
	ldr	r2, [ip, #12]
	sub	r3, r3, r4
	lsl	r3, r3, #1
	bic	r2, r2, lr, lsl r3
	orr	r3, r2, r1, lsl r3
	str	r3, [ip, #12]
	pop	{r4, pc}
.L41:
	mvn	r0, #21
	bx	lr
	.fnend
	.size	s5p_gpio_set_drvstr, .-s5p_gpio_set_drvstr
	.align	2
	.global	s5p_gpio_set_pd_cfg
	.syntax unified
	.arm
	.fpu softvfp
	.type	s5p_gpio_set_pd_cfg, %function
s5p_gpio_set_pd_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #328
	bhi	.L49
	movw	r2, #:lower16:s3c_gpios
	mov	r3, r0
	movt	r2, #:upper16:s3c_gpios
	ldr	r0, [r2, r0, lsl #2]
	cmp	r0, #0
	beq	.L49
	push	{r4, lr}
	.save {r4, lr}
	mov	lr, #3
	ldr	ip, [r0, #72]
	ldr	r4, [r0, #48]
	mov	r0, #0
	ldr	r2, [ip, #16]
	sub	r3, r3, r4
	lsl	r3, r3, #1
	bic	r2, r2, lr, lsl r3
	orr	r3, r2, r1, lsl r3
	str	r3, [ip, #16]
	pop	{r4, pc}
.L49:
	mvn	r0, #21
	bx	lr
	.fnend
	.size	s5p_gpio_set_pd_cfg, .-s5p_gpio_set_pd_cfg
	.align	2
	.global	s5p_gpio_set_pd_pull
	.syntax unified
	.arm
	.fpu softvfp
	.type	s5p_gpio_set_pd_pull, %function
s5p_gpio_set_pd_pull:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #328
	bhi	.L57
	movw	r2, #:lower16:s3c_gpios
	mov	r3, r0
	movt	r2, #:upper16:s3c_gpios
	ldr	r0, [r2, r0, lsl #2]
	cmp	r0, #0
	beq	.L57
	push	{r4, lr}
	.save {r4, lr}
	mov	lr, #3
	ldr	ip, [r0, #72]
	ldr	r4, [r0, #48]
	mov	r0, #0
	ldr	r2, [ip, #20]
	sub	r3, r3, r4
	lsl	r3, r3, #1
	bic	r2, r2, lr, lsl r3
	orr	r3, r2, r1, lsl r3
	str	r3, [ip, #20]
	pop	{r4, pc}
.L57:
	mvn	r0, #21
	bx	lr
	.fnend
	.size	s5p_gpio_set_pd_pull, .-s5p_gpio_set_pd_pull
	.align	2
	.global	s3c_gpio_getcfg
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_getcfg, %function
s3c_gpio_getcfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #328
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movhi	r4, #0
	bhi	.L62
	movw	r3, #:lower16:s3c_gpios
	movt	r3, #:upper16:s3c_gpios
	ldr	r4, [r3, r0, lsl #2]
	cmp	r4, #0
	beq	.L62
	ldr	r1, [r4, #48]
	add	r6, r4, #88
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	mov	r5, r0
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	mov	r0, r6
	sub	r5, r5, r1
	blx	r3
	ldr	r3, [r4, #64]
	mov	r7, r0
	mov	r1, r5
	mov	r0, r4
	ldr	r3, [r3, #12]
	blx	r3
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r4, r0
	mov	r1, r7
	mov	r0, r6
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
.L62:
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, pc}
	.fnend
	.size	s3c_gpio_getcfg, .-s3c_gpio_getcfg
	.align	2
	.global	s3c_gpio_getpull
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_getpull, %function
s3c_gpio_getpull:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #328
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movhi	r4, #0
	bhi	.L67
	movw	r3, #:lower16:s3c_gpios
	movt	r3, #:upper16:s3c_gpios
	ldr	r4, [r3, r0, lsl #2]
	cmp	r4, #0
	beq	.L67
	ldr	r1, [r4, #48]
	add	r6, r4, #88
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	mov	r5, r0
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	mov	r0, r6
	sub	r5, r5, r1
	blx	r3
	ldr	r3, [r4, #64]
	mov	r7, r0
	mov	r1, r5
	mov	r0, r4
	ldr	r3, [r3, #4]
	blx	r3
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r4, r0
	mov	r1, r7
	mov	r0, r6
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	blx	r3
.L67:
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, pc}
	.fnend
	.size	s3c_gpio_getpull, .-s3c_gpio_getpull
	.align	2
	.global	s5p_gpio_get_drvstr
	.syntax unified
	.arm
	.fpu softvfp
	.type	s5p_gpio_get_drvstr, %function
s5p_gpio_get_drvstr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #328
	bhi	.L75
	movw	r3, #:lower16:s3c_gpios
	movt	r3, #:upper16:s3c_gpios
	ldr	r3, [r3, r0, lsl #2]
	cmp	r3, #0
	beq	.L75
	ldr	r1, [r3, #72]
	ldr	r2, [r3, #48]
	ldr	r3, [r1, #12]
	sub	r0, r0, r2
	lsl	r0, r0, #1
	lsr	r0, r3, r0
	and	r0, r0, #3
	bx	lr
.L75:
	mvn	r0, #21
	bx	lr
	.fnend
	.size	s5p_gpio_get_drvstr, .-s5p_gpio_get_drvstr
	.align	2
	.global	s5p_gpio_get_pd_cfg
	.syntax unified
	.arm
	.fpu softvfp
	.type	s5p_gpio_get_pd_cfg, %function
s5p_gpio_get_pd_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #328
	bhi	.L79
	movw	r3, #:lower16:s3c_gpios
	movt	r3, #:upper16:s3c_gpios
	ldr	r3, [r3, r0, lsl #2]
	cmp	r3, #0
	beq	.L79
	ldr	r1, [r3, #72]
	ldr	r2, [r3, #48]
	ldr	r3, [r1, #16]
	sub	r0, r0, r2
	lsl	r0, r0, #1
	lsr	r0, r3, r0
	and	r0, r0, #3
	bx	lr
.L79:
	mvn	r0, #21
	bx	lr
	.fnend
	.size	s5p_gpio_get_pd_cfg, .-s5p_gpio_get_pd_cfg
	.align	2
	.global	s5p_gpio_get_pd_pull
	.syntax unified
	.arm
	.fpu softvfp
	.type	s5p_gpio_get_pd_pull, %function
s5p_gpio_get_pd_pull:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #328
	bhi	.L83
	movw	r3, #:lower16:s3c_gpios
	movt	r3, #:upper16:s3c_gpios
	ldr	r3, [r3, r0, lsl #2]
	cmp	r3, #0
	beq	.L83
	ldr	r1, [r3, #72]
	ldr	r2, [r3, #48]
	ldr	r3, [r1, #20]
	sub	r0, r0, r2
	lsl	r0, r0, #1
	lsr	r0, r3, r0
	and	r0, r0, #3
	bx	lr
.L83:
	mvn	r0, #21
	bx	lr
	.fnend
	.size	s5p_gpio_get_pd_pull, .-s5p_gpio_get_pd_pull
	.align	2
	.global	s3c_gpio_setcfg_s3c24xx_a
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_setcfg_s3c24xx_a, %function
s3c_gpio_setcfg_s3c24xx_a:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	bic	r3, r2, #15
	ldr	ip, [r0, #72]
	cmn	r3, #16
	beq	.L91
.L85:
	str	lr, [sp, #-4]!
	.save {lr}
	mov	lr, #1
	ldr	r3, [ip]
	mov	r0, #0
	bic	r1, r3, lr, lsl r1
	orr	r2, r2, r1
	str	r2, [ip]
	ldr	pc, [sp], #4
.L91:
	and	r2, r2, #15
	sub	r2, r2, #1
	cmp	r2, #1
	lslls	r2, r2, r1
	bls	.L85
.L87:
	mvn	r0, #21
	bx	lr
	.fnend
	.size	s3c_gpio_setcfg_s3c24xx_a, .-s3c_gpio_setcfg_s3c24xx_a
	.align	2
	.global	s3c_gpio_getcfg_s3c24xx_a
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_getcfg_s3c24xx_a, %function
s3c_gpio_getcfg_s3c24xx_a:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #72]
	ldr	r0, [r3]
	lsr	r0, r0, r1
	and	r0, r0, #1
	add	r0, r0, #1
	mvn	r0, r0, lsl #28
	mvn	r0, r0, lsr #28
	bx	lr
	.fnend
	.size	s3c_gpio_getcfg_s3c24xx_a, .-s3c_gpio_getcfg_s3c24xx_a
	.align	2
	.global	s3c_gpio_setcfg_s3c24xx
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_setcfg_s3c24xx, %function
s3c_gpio_setcfg_s3c24xx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	bic	r3, r2, #15
	ldr	ip, [r0, #72]
	cmn	r3, #16
	lsl	r1, r1, #1
	beq	.L100
.L94:
	str	lr, [sp, #-4]!
	.save {lr}
	mov	lr, #3
	ldr	r3, [ip]
	mov	r0, #0
	bic	r1, r3, lr, lsl r1
	orr	r2, r2, r1
	str	r2, [ip]
	ldr	pc, [sp], #4
.L100:
	and	r2, r2, #15
	cmp	r2, #3
	lslls	r2, r2, r1
	bls	.L94
.L96:
	mvn	r0, #21
	bx	lr
	.fnend
	.size	s3c_gpio_setcfg_s3c24xx, .-s3c_gpio_setcfg_s3c24xx
	.align	2
	.global	s3c_gpio_getcfg_s3c24xx
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_getcfg_s3c24xx, %function
s3c_gpio_getcfg_s3c24xx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #72]
	lsl	r1, r1, #1
	ldr	r0, [r3]
	lsr	r0, r0, r1
	and	r0, r0, #3
	mvn	r0, r0, lsl #28
	mvn	r0, r0, lsr #28
	bx	lr
	.fnend
	.size	s3c_gpio_getcfg_s3c24xx, .-s3c_gpio_getcfg_s3c24xx
	.align	2
	.global	s3c_gpio_setcfg_s3c64xx_4bit
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_setcfg_s3c64xx_4bit, %function
s3c_gpio_setcfg_s3c64xx_4bit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #7
	and	r1, r1, #7
	str	lr, [sp, #-4]!
	.save {lr}
	lsl	r1, r1, #2
	ldr	ip, [r0, #72]
	bhi	.L103
	ldrh	r3, [r0, #52]
	cmp	r3, #8
	subhi	ip, ip, #4
.L103:
	bic	r3, r2, #15
	mov	lr, #15
	cmn	r3, #16
	ldr	r3, [ip]
	andeq	r2, r2, #15
	mov	r0, #0
	lsleq	r2, r2, r1
	bic	r1, r3, lr, lsl r1
	orr	r2, r2, r1
	str	r2, [ip]
	ldr	pc, [sp], #4
	.fnend
	.size	s3c_gpio_setcfg_s3c64xx_4bit, .-s3c_gpio_setcfg_s3c64xx_4bit
	.align	2
	.global	s3c_gpio_getcfg_s3c64xx_4bit
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_getcfg_s3c64xx_4bit, %function
s3c_gpio_getcfg_s3c64xx_4bit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #7
	and	r1, r1, #7
	lsl	r1, r1, #2
	ldr	r3, [r0, #72]
	bhi	.L107
	ldrh	r2, [r0, #52]
	cmp	r2, #8
	subhi	r3, r3, #4
.L107:
	ldr	r0, [r3]
	lsr	r0, r0, r1
	mvn	r0, r0, lsl #28
	mvn	r0, r0, lsr #28
	bx	lr
	.fnend
	.size	s3c_gpio_getcfg_s3c64xx_4bit, .-s3c_gpio_getcfg_s3c64xx_4bit
	.align	2
	.global	s3c_gpio_setpull_updown
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_setpull_updown, %function
s3c_gpio_setpull_updown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	.save {lr}
	lsl	r1, r1, #1
	ldr	ip, [r0, #72]
	mov	lr, #3
	mov	r0, #0
	ldr	r3, [ip, #8]
	bic	r3, r3, lr, lsl r1
	orr	r2, r3, r2, lsl r1
	str	r2, [ip, #8]
	ldr	pc, [sp], #4
	.fnend
	.size	s3c_gpio_setpull_updown, .-s3c_gpio_setpull_updown
	.align	2
	.global	s3c_gpio_getpull_updown
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_getpull_updown, %function
s3c_gpio_getpull_updown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #72]
	lsl	r1, r1, #1
	ldr	r0, [r3, #8]
	lsr	r0, r0, r1
	and	r0, r0, #3
	bx	lr
	.fnend
	.size	s3c_gpio_getpull_updown, .-s3c_gpio_getpull_updown
	.section	___ksymtab+s3c_gpio_cfgpin,"a",%progbits
	.align	2
	.type	__ksymtab_s3c_gpio_cfgpin, %object
	.size	__ksymtab_s3c_gpio_cfgpin, 8
__ksymtab_s3c_gpio_cfgpin:
	.word	s3c_gpio_cfgpin
	.word	__kstrtab_s3c_gpio_cfgpin
	.section	___ksymtab+s3c_gpio_getcfg,"a",%progbits
	.align	2
	.type	__ksymtab_s3c_gpio_getcfg, %object
	.size	__ksymtab_s3c_gpio_getcfg, 8
__ksymtab_s3c_gpio_getcfg:
	.word	s3c_gpio_getcfg
	.word	__kstrtab_s3c_gpio_getcfg
	.section	___ksymtab+s3c_gpio_getpull,"a",%progbits
	.align	2
	.type	__ksymtab_s3c_gpio_getpull, %object
	.size	__ksymtab_s3c_gpio_getpull, 8
__ksymtab_s3c_gpio_getpull:
	.word	s3c_gpio_getpull
	.word	__kstrtab_s3c_gpio_getpull
	.section	___ksymtab+s3c_gpio_setpull,"a",%progbits
	.align	2
	.type	__ksymtab_s3c_gpio_setpull, %object
	.size	__ksymtab_s3c_gpio_setpull, 8
__ksymtab_s3c_gpio_setpull:
	.word	s3c_gpio_setpull
	.word	__kstrtab_s3c_gpio_setpull
	.section	___ksymtab+s5p_gpio_get_drvstr,"a",%progbits
	.align	2
	.type	__ksymtab_s5p_gpio_get_drvstr, %object
	.size	__ksymtab_s5p_gpio_get_drvstr, 8
__ksymtab_s5p_gpio_get_drvstr:
	.word	s5p_gpio_get_drvstr
	.word	__kstrtab_s5p_gpio_get_drvstr
	.section	___ksymtab+s5p_gpio_get_pd_cfg,"a",%progbits
	.align	2
	.type	__ksymtab_s5p_gpio_get_pd_cfg, %object
	.size	__ksymtab_s5p_gpio_get_pd_cfg, 8
__ksymtab_s5p_gpio_get_pd_cfg:
	.word	s5p_gpio_get_pd_cfg
	.word	__kstrtab_s5p_gpio_get_pd_cfg
	.section	___ksymtab+s5p_gpio_get_pd_pull,"a",%progbits
	.align	2
	.type	__ksymtab_s5p_gpio_get_pd_pull, %object
	.size	__ksymtab_s5p_gpio_get_pd_pull, 8
__ksymtab_s5p_gpio_get_pd_pull:
	.word	s5p_gpio_get_pd_pull
	.word	__kstrtab_s5p_gpio_get_pd_pull
	.section	___ksymtab+s5p_gpio_set_drvstr,"a",%progbits
	.align	2
	.type	__ksymtab_s5p_gpio_set_drvstr, %object
	.size	__ksymtab_s5p_gpio_set_drvstr, 8
__ksymtab_s5p_gpio_set_drvstr:
	.word	s5p_gpio_set_drvstr
	.word	__kstrtab_s5p_gpio_set_drvstr
	.section	___ksymtab+s5p_gpio_set_pd_cfg,"a",%progbits
	.align	2
	.type	__ksymtab_s5p_gpio_set_pd_cfg, %object
	.size	__ksymtab_s5p_gpio_set_pd_cfg, 8
__ksymtab_s5p_gpio_set_pd_cfg:
	.word	s5p_gpio_set_pd_cfg
	.word	__kstrtab_s5p_gpio_set_pd_cfg
	.section	___ksymtab+s5p_gpio_set_pd_pull,"a",%progbits
	.align	2
	.type	__ksymtab_s5p_gpio_set_pd_pull, %object
	.size	__ksymtab_s5p_gpio_set_pd_pull, 8
__ksymtab_s5p_gpio_set_pd_pull:
	.word	s5p_gpio_set_pd_pull
	.word	__kstrtab_s5p_gpio_set_pd_pull
	.section	___ksymtab_gpl+s3c_gpio_cfgall_range,"a",%progbits
	.align	2
	.type	__ksymtab_s3c_gpio_cfgall_range, %object
	.size	__ksymtab_s3c_gpio_cfgall_range, 8
__ksymtab_s3c_gpio_cfgall_range:
	.word	s3c_gpio_cfgall_range
	.word	__kstrtab_s3c_gpio_cfgall_range
	.section	___ksymtab_gpl+s3c_gpio_cfgpin_range,"a",%progbits
	.align	2
	.type	__ksymtab_s3c_gpio_cfgpin_range, %object
	.size	__ksymtab_s3c_gpio_cfgpin_range, 8
__ksymtab_s3c_gpio_cfgpin_range:
	.word	s3c_gpio_cfgpin_range
	.word	__kstrtab_s3c_gpio_cfgpin_range
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_s5p_gpio_set_pd_pull, %object
	.size	__kstrtab_s5p_gpio_set_pd_pull, 21
__kstrtab_s5p_gpio_set_pd_pull:
	.ascii	"s5p_gpio_set_pd_pull\000"
	.type	__kstrtab_s5p_gpio_get_pd_pull, %object
	.size	__kstrtab_s5p_gpio_get_pd_pull, 21
__kstrtab_s5p_gpio_get_pd_pull:
	.ascii	"s5p_gpio_get_pd_pull\000"
	.type	__kstrtab_s5p_gpio_set_pd_cfg, %object
	.size	__kstrtab_s5p_gpio_set_pd_cfg, 20
__kstrtab_s5p_gpio_set_pd_cfg:
	.ascii	"s5p_gpio_set_pd_cfg\000"
	.type	__kstrtab_s5p_gpio_get_pd_cfg, %object
	.size	__kstrtab_s5p_gpio_get_pd_cfg, 20
__kstrtab_s5p_gpio_get_pd_cfg:
	.ascii	"s5p_gpio_get_pd_cfg\000"
	.type	__kstrtab_s5p_gpio_set_drvstr, %object
	.size	__kstrtab_s5p_gpio_set_drvstr, 20
__kstrtab_s5p_gpio_set_drvstr:
	.ascii	"s5p_gpio_set_drvstr\000"
	.type	__kstrtab_s5p_gpio_get_drvstr, %object
	.size	__kstrtab_s5p_gpio_get_drvstr, 20
__kstrtab_s5p_gpio_get_drvstr:
	.ascii	"s5p_gpio_get_drvstr\000"
	.type	__kstrtab_s3c_gpio_getpull, %object
	.size	__kstrtab_s3c_gpio_getpull, 17
__kstrtab_s3c_gpio_getpull:
	.ascii	"s3c_gpio_getpull\000"
	.type	__kstrtab_s3c_gpio_setpull, %object
	.size	__kstrtab_s3c_gpio_setpull, 17
__kstrtab_s3c_gpio_setpull:
	.ascii	"s3c_gpio_setpull\000"
	.type	__kstrtab_s3c_gpio_getcfg, %object
	.size	__kstrtab_s3c_gpio_getcfg, 16
__kstrtab_s3c_gpio_getcfg:
	.ascii	"s3c_gpio_getcfg\000"
	.type	__kstrtab_s3c_gpio_cfgall_range, %object
	.size	__kstrtab_s3c_gpio_cfgall_range, 22
__kstrtab_s3c_gpio_cfgall_range:
	.ascii	"s3c_gpio_cfgall_range\000"
	.type	__kstrtab_s3c_gpio_cfgpin_range, %object
	.size	__kstrtab_s3c_gpio_cfgpin_range, 22
__kstrtab_s3c_gpio_cfgpin_range:
	.ascii	"s3c_gpio_cfgpin_range\000"
	.type	__kstrtab_s3c_gpio_cfgpin, %object
	.size	__kstrtab_s3c_gpio_cfgpin, 16
__kstrtab_s3c_gpio_cfgpin:
	.ascii	"s3c_gpio_cfgpin\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
