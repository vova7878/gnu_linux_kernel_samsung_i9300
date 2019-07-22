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
	.file	"bcm47511.c"
	.text
	.align	2
	.type	bcm47511_resume, %function
bcm47511_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	bcm47511_resume, .-bcm47511_resume
	.align	2
	.type	bcm47511_init, %function
bcm47511_init:
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
	.size	bcm47511_init, .-bcm47511_init
	.align	2
	.type	bcm47511_suspend, %function
bcm47511_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:dev_get_drvdata
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	add	r0, r0, #8
	movt	r3, #:upper16:dev_get_drvdata
	blx	r3
	ldrb	r5, [r0, #8]	@ zero_extendqisi2
	ldr	r4, [r0]
	cmp	r5, #0
	beq	.L4
	movw	r5, #:lower16:s5p_gpio_set_pd_cfg
	mov	r1, #1
	movt	r5, #:upper16:s5p_gpio_set_pd_cfg
	ldr	r0, [r4]
	blx	r5
	ldr	r0, [r4, #4]
	mov	r1, #1
	blx	r5
	ldr	r0, [r4, #12]
	cmp	r0, #328
	bls	.L9
.L6:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L4:
	movw	r6, #:lower16:s5p_gpio_set_pd_cfg
	mov	r1, r5
	movt	r6, #:upper16:s5p_gpio_set_pd_cfg
	ldr	r0, [r4]
	blx	r6
	ldr	r0, [r4, #4]
	mov	r1, r5
	blx	r6
	ldr	r0, [r4, #12]
	cmp	r0, #328
	bhi	.L6
	mov	r1, r5
	blx	r6
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L9:
	mov	r1, #1
	blx	r5
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	bcm47511_suspend, .-bcm47511_suspend
	.align	2
	.type	bcm47511_remove, %function
bcm47511_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	add	r7, r0, #8
	movw	r3, #:lower16:dev_get_drvdata
	mov	r0, r7
	movt	r3, #:upper16:dev_get_drvdata
	movw	r5, #:lower16:gpio_free
	blx	r3
	movw	r3, #:lower16:rfkill_unregister
	ldr	r6, [r0]
	mov	r4, r0
	movt	r3, #:upper16:rfkill_unregister
	ldr	r0, [r0, #4]
	movt	r5, #:upper16:gpio_free
	blx	r3
	movw	r3, #:lower16:rfkill_destroy
	ldr	r0, [r4, #4]
	movt	r3, #:upper16:rfkill_destroy
	blx	r3
	ldr	r0, [r6]
	blx	r5
	ldr	r0, [r6, #4]
	blx	r5
	movw	r3, #:lower16:kfree
	mov	r0, r4
	movt	r3, #:upper16:kfree
	blx	r3
	movw	r3, #:lower16:dev_set_drvdata
	mov	r0, r7
	mov	r1, #0
	movt	r3, #:upper16:dev_set_drvdata
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	bcm47511_remove, .-bcm47511_remove
	.align	2
	.type	bcm47511_probe, %function
bcm47511_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r6, r0
	ldr	r5, [r0, #92]
	.pad #12
	sub	sp, sp, #12
	cmp	r5, #0
	beq	.L35
	ldr	r3, [r5, #16]
	cmp	r3, #0
	beq	.L36
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L26
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movw	r1, #32976
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #16
	blx	r3
	subs	r4, r0, #0
	beq	.L37
	str	r5, [r4]
	ldr	r7, [r5]
	cmp	r7, #328
	bls	.L38
.L16:
	ldr	r7, [r5, #4]
	cmp	r7, #328
	bls	.L39
.L17:
	ldr	r0, [r5, #8]
	cmp	r0, #328
	bls	.L40
.L18:
	ldr	r7, [r5, #12]
	cmp	r7, #328
	bls	.L41
.L19:
	add	r6, r6, #8
	movw	r0, #:lower16:.LC5
	movw	r3, #:lower16:.LANCHOR1
	movw	ip, #:lower16:rfkill_alloc
	str	r4, [sp]
	mov	r1, r6
	movt	r0, #:upper16:.LC5
	movt	r3, #:upper16:.LANCHOR1
	movt	ip, #:upper16:rfkill_alloc
	mov	r2, #6
	blx	ip
	cmp	r0, #0
	str	r0, [r4, #4]
	beq	.L28
	movw	r3, #:lower16:regulator_get
	ldr	r1, [r5, #16]
	movt	r3, #:upper16:regulator_get
	mov	r0, r6
	blx	r3
	cmp	r0, #0
	mov	r2, r0
	str	r0, [r4, #12]
	beq	.L21
	cmn	r0, #4096
	bhi	.L21
	mov	r5, #0
	movw	r3, #:lower16:rfkill_init_sw_state
	strb	r5, [r4, #9]
	movt	r3, #:upper16:rfkill_init_sw_state
	ldr	r0, [r4, #4]
	mov	r1, #1
	blx	r3
	movw	r3, #:lower16:rfkill_register
	strb	r5, [r4, #8]
	movt	r3, #:upper16:rfkill_register
	ldr	r0, [r4, #4]
	blx	r3
	subs	r5, r0, #0
	beq	.L42
.L23:
	movw	r3, #:lower16:rfkill_destroy
	ldr	r0, [r4, #4]
	movt	r3, #:upper16:rfkill_destroy
	blx	r3
.L20:
.L24:
	movw	r3, #:lower16:kfree
	mov	r0, r4
	movt	r3, #:upper16:kfree
	blx	r3
	mov	r0, r5
.L32:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L26:
	mov	r4, #16
	str	r5, [r4]
	ldr	r7, [r5]
	cmp	r7, #328
	bhi	.L16
.L38:
	movw	r1, #:lower16:.LC2
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC2
	movt	r3, #:upper16:gpio_request
	mov	r0, r7
	blx	r3
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, r7
	mov	r1, #0
	movt	r3, #:upper16:gpio_direction_output
	blx	r3
	ldr	r7, [r5, #4]
	cmp	r7, #328
	bhi	.L17
.L39:
	movw	r1, #:lower16:.LC3
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC3
	movt	r3, #:upper16:gpio_request
	mov	r0, r7
	blx	r3
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, r7
	mov	r1, #1
	movt	r3, #:upper16:gpio_direction_output
	blx	r3
	ldr	r0, [r5, #8]
	cmp	r0, #328
	bhi	.L18
.L40:
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #3
	movt	r3, #:upper16:s3c_gpio_setpull
	blx	r3
	ldr	r7, [r5, #12]
	cmp	r7, #328
	bhi	.L19
.L41:
	movw	r1, #:lower16:.LC4
	movw	r3, #:lower16:gpio_request
	movt	r1, #:upper16:.LC4
	movt	r3, #:upper16:gpio_request
	mov	r0, r7
	blx	r3
	movw	r3, #:lower16:gpio_direction_output
	mov	r0, r7
	mov	r1, #0
	movt	r3, #:upper16:gpio_direction_output
	blx	r3
	b	.L19
.L42:
	movw	r3, #:lower16:dev_set_drvdata
	mov	r1, r4
	movt	r3, #:upper16:dev_set_drvdata
	mov	r0, r6
	blx	r3
	movw	r1, #:lower16:.LC6
	movw	r3, #:lower16:_dev_info
	mov	r0, r6
	movt	r1, #:upper16:.LC6
	movt	r3, #:upper16:_dev_info
	blx	r3
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L28:
	mvn	r5, #11
	b	.L24
.L21:
	movw	r1, #:lower16:.LC7
	movw	r3, #:lower16:dev_err
	mov	r0, r6
	movt	r1, #:upper16:.LC7
	movt	r3, #:upper16:dev_err
	mov	r5, #0
	blx	r3
	b	.L24
.L37:
	mvn	r0, #11
	b	.L32
.L35:
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:dev_err
	add	r0, r0, #8
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:dev_err
	blx	r3
	mvn	r0, #21
	b	.L32
.L36:
	movw	r1, #:lower16:.LC1
	movw	r3, #:lower16:dev_err
	add	r0, r0, #8
	movt	r1, #:upper16:.LC1
	movt	r3, #:upper16:dev_err
	blx	r3
	mvn	r0, #21
	b	.L32
	.fnend
	.size	bcm47511_probe, .-bcm47511_probe
	.align	2
	.type	bcm47511_set_block, %function
bcm47511_set_block:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	beq	.L60
	movw	r0, #:lower16:.LC9
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L65
	movt	r0, #:upper16:.LC9
	movw	r5, #:lower16:__gpio_set_value
	blx	r3
	ldr	r6, [r4]
	movt	r5, #:upper16:__gpio_set_value
	mov	r1, #0
	ldr	r0, [r6]
	blx	r5
	ldr	r0, [r6, #12]
	cmp	r0, #328
	bls	.L61
.L49:
	ldr	r0, [r4, #12]
	cmp	r0, #0
	beq	.L50
	ldrb	r3, [r4, #9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L62
.L50:
	mov	r3, #0
	mov	r0, #0
	strb	r3, [r4, #8]
	ldmfd	sp!, {r4, r5, r6, pc}
.L62:
	movw	r3, #:lower16:regulator_disable
	movt	r3, #:upper16:regulator_disable
	blx	r3
	mov	r3, #0
	strb	r3, [r4, #9]
	b	.L50
.L60:
	movw	r0, #:lower16:.LC8
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC8
	movt	r3, #:upper16:printk
	ldr	r1, .L65
	blx	r3
	ldr	r0, [r4, #12]
	ldr	r6, [r4]
	cmp	r0, #0
	beq	.L45
	ldrb	r3, [r4, #9]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L63
.L45:
	movw	r5, #:lower16:__gpio_set_value
	ldr	r0, [r6]
	movt	r5, #:upper16:__gpio_set_value
	mov	r1, #1
	blx	r5
	ldr	r0, [r6, #4]
	cmp	r0, #328
	bls	.L64
.L46:
	ldr	r0, [r6, #12]
	cmp	r0, #328
	bhi	.L47
	mov	r1, #1
	blx	r5
.L47:
	mov	r3, #1
	mov	r0, #0
	strb	r3, [r4, #8]
	ldmfd	sp!, {r4, r5, r6, pc}
.L61:
	mov	r1, #0
	blx	r5
	b	.L49
.L64:
	mov	r1, #1
	blx	r5
	b	.L46
.L63:
	movw	r3, #:lower16:regulator_enable
	movt	r3, #:upper16:regulator_enable
	blx	r3
	mov	r3, #1
	strb	r3, [r4, #9]
	b	.L45
.L66:
	.align	2
.L65:
	.word	.LANCHOR1+12
	.fnend
	.size	bcm47511_set_block, .-bcm47511_set_block
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	bcm47511_rfkill_ops, %object
	.size	bcm47511_rfkill_ops, 12
bcm47511_rfkill_ops:
	.space	8
	.word	bcm47511_set_block
	.type	__func__.20388, %object
	.size	__func__.20388, 19
__func__.20388:
	.ascii	"bcm47511_set_block\000"
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_bcm47511_init6, %object
	.size	__initcall_bcm47511_init6, 4
__initcall_bcm47511_init6:
	.word	bcm47511_init
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	bcm47511_driver, %object
	.size	bcm47511_driver, 80
bcm47511_driver:
	.word	bcm47511_probe
	.word	bcm47511_remove
	.space	4
	.word	bcm47511_suspend
	.word	bcm47511_resume
	.word	.LC5
	.space	52
	.space	4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"No plat data.\012\000"
	.space	1
.LC1:
	.ascii	"No 32KHz clock id.\012\000"
.LC2:
	.ascii	"GPS_EN\000"
	.space	1
.LC3:
	.ascii	"GPS_nRST\000"
	.space	3
.LC4:
	.ascii	"GPS_CNTL\000"
	.space	3
.LC5:
	.ascii	"bcm47511\000"
	.space	3
.LC6:
	.ascii	"ready\012\000"
	.space	1
.LC7:
	.ascii	"regulator_get error (%ld)\012\000"
	.space	1
.LC8:
	.ascii	"<6>%s : Enable GPS chip\012\000"
	.space	3
.LC9:
	.ascii	"<6>%s : Disable GPS chip\012\000"
	.ident	"GCC: (GNU) 4.8"
