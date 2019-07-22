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
	.file	"gsd4t.c"
	.text
	.align	2
	.type	gsd4t_resume, %function
gsd4t_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	gsd4t_resume, .-gsd4t_resume
	.align	2
	.type	gsd4t_init, %function
gsd4t_init:
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
	.size	gsd4t_init, .-gsd4t_init
	.align	2
	.type	gsd4t_suspend, %function
gsd4t_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:dev_get_drvdata
	movt	r3, #:upper16:dev_get_drvdata
	add	r0, r0, #8
	blx	r3
	ldrb	r1, [r0, #8]	@ zero_extendqisi2
	movw	r3, #:lower16:s5p_gpio_set_pd_cfg
	ldr	r2, [r0]
	movt	r3, #:upper16:s5p_gpio_set_pd_cfg
	cmp	r1, #0
	ldr	r0, [r2, #4]
	movne	r1, #1
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	gsd4t_suspend, .-gsd4t_suspend
	.align	2
	.type	gsd4t_remove, %function
gsd4t_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	add	r9, r0, #8
	movw	r3, #:lower16:dev_get_drvdata
	mov	r0, r9
	movt	r3, #:upper16:dev_get_drvdata
	blx	r3
	ldrb	r3, [r0, #8]	@ zero_extendqisi2
	mov	r4, r0
	ldr	r5, [r0]
	cmp	r3, #0
	beq	.L7
	movw	r3, #:lower16:rfkill_init_sw_state
	ldr	r0, [r0, #4]
	movt	r3, #:upper16:rfkill_init_sw_state
	mov	r1, #1
	blx	r3
.L7:
	movw	r3, #:lower16:rfkill_unregister
	ldr	r0, [r4, #4]
	movt	r3, #:upper16:rfkill_unregister
	movw	r6, #:lower16:gpio_unexport
	blx	r3
	movw	r3, #:lower16:rfkill_destroy
	ldr	r0, [r4, #4]
	movt	r3, #:upper16:rfkill_destroy
	movt	r6, #:upper16:gpio_unexport
	blx	r3
	ldr	r0, [r5]
	movw	r8, #:lower16:gpio_free
	blx	r6
	ldr	r0, [r5, #4]
	movt	r8, #:upper16:gpio_free
	blx	r6
	ldr	r0, [r5, #8]
	movw	r7, #:lower16:regulator_put
	blx	r6
	ldr	r0, [r5]
	movt	r7, #:upper16:regulator_put
	blx	r8
	ldr	r0, [r5, #4]
	blx	r8
	ldr	r0, [r4, #12]
	blx	r7
	ldr	r0, [r4, #16]
	blx	r7
	movw	r3, #:lower16:kfree
	mov	r0, r4
	movt	r3, #:upper16:kfree
	blx	r3
	movw	r3, #:lower16:dev_set_drvdata
	mov	r0, r9
	mov	r1, #0
	movt	r3, #:upper16:dev_set_drvdata
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
	.fnend
	.size	gsd4t_remove, .-gsd4t_remove
	.align	2
	.type	gsd4t_set_block, %function
gsd4t_set_block:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	ldr	r5, [r0]
	bne	.L13
	ldrb	r6, [r0, #8]	@ zero_extendqisi2
	cmp	r6, #0
	beq	.L18
.L14:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L13:
	ldrb	r3, [r0, #8]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L14
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	movw	r3, #:lower16:__gpio_set_value
	ldr	r0, [r5, #4]
	movt	r3, #:upper16:__gpio_set_value
	mov	r1, #0
	movw	r5, #:lower16:regulator_disable
	blx	r3
	movt	r5, #:upper16:regulator_disable
	ldr	r0, [r4, #12]
	blx	r5
	ldr	r0, [r4, #16]
	blx	r5
	mov	r3, #0
	strb	r3, [r4, #8]
	b	.L14
.L18:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	movw	r8, #:lower16:regulator_enable
	movw	r7, #:lower16:__gpio_set_value
	blx	r3
	movt	r8, #:upper16:regulator_enable
	ldr	r0, [r4, #12]
	blx	r8
	ldr	r0, [r4, #16]
	movt	r7, #:upper16:__gpio_set_value
	blx	r8
	ldr	r0, [r5, #4]
	mov	r1, #1
	blx	r7
	ldr	r0, [r5]
	mov	r1, r6
	blx	r7
	mov	r3, #1
	strb	r3, [r4, #8]
	b	.L14
	.fnend
	.size	gsd4t_set_block, .-gsd4t_set_block
	.align	2
	.type	gsd4t_probe, %function
gsd4t_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, r0
	ldr	r4, [r0, #92]
	.pad #20
	sub	sp, sp, #20
	cmp	r4, #0
	beq	.L52
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L41
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movw	r1, #32976
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #20
	blx	r3
	subs	r6, r0, #0
	beq	.L53
.L22:
	str	r4, [r6]
	ldr	r5, [r4, #4]
	cmp	r5, #328
	bls	.L54
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:dev_err
	add	r0, r7, #8
	movt	r1, #:upper16:.LC5
	movt	r3, #:upper16:dev_err
	mvn	r8, #21
	blx	r3
.L26:
	movw	r3, #:lower16:kfree
	mov	r0, r6
	movt	r3, #:upper16:kfree
	blx	r3
	mov	r0, r8
.L47:
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L54:
	movw	r3, #:lower16:gpio_request
	movw	r1, #:lower16:.LC3
	movt	r3, #:upper16:gpio_request
	movt	r1, #:upper16:.LC3
	str	r3, [sp, #12]
	mov	r0, r5
	movw	fp, #:lower16:s3c_gpio_cfgpin
	movw	r10, #:lower16:gpio_direction_output
	blx	r3
	movt	fp, #:upper16:s3c_gpio_cfgpin
	mov	r0, r5
	mvn	r1, #14
	movw	r9, #:lower16:gpio_export
	blx	fp
	movt	r10, #:upper16:gpio_direction_output
	mov	r0, r5
	mov	r1, #0
	movt	r9, #:upper16:gpio_export
	blx	r10
	mov	r0, r5
	mov	r1, #1
	blx	r9
	add	r7, r7, #8
	movw	r8, #:lower16:gpio_export_link
	movw	r1, #:lower16:.LC4
	mov	r2, r5
	mov	r0, r7
	movt	r1, #:upper16:.LC4
	movt	r8, #:upper16:gpio_export_link
	blx	r8
	ldr	r5, [r4]
	ldr	r3, [sp, #12]
	cmp	r5, #328
	bhi	.L55
	movw	r1, #:lower16:.LC6
	str	r3, [sp, #12]
	mov	r0, r5
	movt	r1, #:upper16:.LC6
	blx	r3
	mov	r0, r5
	mvn	r1, #14
	blx	fp
	mov	r0, r5
	mov	r1, #0
	blx	r10
	mov	r0, r5
	mov	r1, #1
	blx	r9
	movw	r1, #:lower16:.LC7
	mov	r2, r5
	mov	r0, r7
	movt	r1, #:upper16:.LC7
	blx	r8
	ldr	r5, [r4, #8]
	ldr	r3, [sp, #12]
	cmp	r5, #328
	bls	.L56
.L28:
	ldr	r0, [r4, #12]
	cmp	r0, #328
	bls	.L57
.L30:
	movw	r1, #:lower16:.LC11
	movw	r5, #:lower16:regulator_get
	movt	r1, #:upper16:.LC11
	movt	r5, #:upper16:regulator_get
	mov	r0, r7
	blx	r5
	cmp	r0, #0
	str	r0, [r6, #16]
	beq	.L31
	cmn	r0, #4096
	bhi	.L31
	movw	r1, #:lower16:.LC14
	mov	r0, r7
	movt	r1, #:upper16:.LC14
	blx	r5
	cmp	r0, #0
	str	r0, [r6, #12]
	beq	.L33
	cmn	r0, #4096
	bhi	.L33
	movw	r0, #:lower16:.LC16
	movw	r3, #:lower16:.LANCHOR1
	movw	ip, #:lower16:rfkill_alloc
	str	r6, [sp]
	movt	r0, #:upper16:.LC16
	movt	r3, #:upper16:.LANCHOR1
	movt	ip, #:upper16:rfkill_alloc
	mov	r1, r7
	mov	r2, #6
	blx	ip
	cmp	r0, #0
	str	r0, [r6, #4]
	beq	.L58
	movw	r3, #:lower16:rfkill_init_sw_state
	mov	r1, #1
	movt	r3, #:upper16:rfkill_init_sw_state
	blx	r3
	mov	r2, #0
	movw	r3, #:lower16:rfkill_register
	strb	r2, [r6, #8]
	movt	r3, #:upper16:rfkill_register
	ldr	r0, [r6, #4]
	blx	r3
	subs	r8, r0, #0
	beq	.L59
.L35:
	movw	r3, #:lower16:rfkill_destroy
	ldr	r0, [r6, #4]
	movt	r3, #:upper16:rfkill_destroy
	blx	r3
.L36:
	movw	r5, #:lower16:regulator_put
	ldr	r0, [r6, #12]
	movt	r5, #:upper16:regulator_put
	blx	r5
.L37:
	ldr	r0, [r6, #16]
	blx	r5
.L38:
	movw	r5, #:lower16:gpio_unexport
	ldr	r0, [r4, #8]
	movt	r5, #:upper16:gpio_unexport
	blx	r5
	ldr	r0, [r4]
	blx	r5
	b	.L29
.L41:
	mov	r6, #16
	b	.L22
.L55:
	movw	r5, #:lower16:gpio_unexport
	movw	r1, #:lower16:.LC8
	movw	r3, #:lower16:dev_err
	movt	r5, #:upper16:gpio_unexport
	mvn	r8, #21
	mov	r0, r7
	movt	r1, #:upper16:.LC8
	movt	r3, #:upper16:dev_err
	blx	r3
.L29:
	ldr	r0, [r4, #4]
	blx	r5
	b	.L26
.L57:
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r1, #3
	movt	r3, #:upper16:s3c_gpio_setpull
	blx	r3
	b	.L30
.L56:
	movw	r1, #:lower16:.LC9
	mov	r0, r5
	movt	r1, #:upper16:.LC9
	blx	r3
	mov	r0, r5
	mvn	r1, #14
	blx	fp
	mov	r0, r5
	mov	r1, #0
	blx	r10
	mov	r0, r5
	mov	r1, #1
	blx	r9
	movw	r1, #:lower16:.LC10
	mov	r0, r7
	mov	r2, r5
	movt	r1, #:upper16:.LC10
	blx	r8
	b	.L28
.L33:
	movw	r1, #:lower16:.LC15
	movw	r3, #:lower16:dev_err
	mov	r0, r7
	movt	r1, #:upper16:.LC15
	movt	r3, #:upper16:dev_err
	movw	r5, #:lower16:regulator_put
	blx	r3
	movt	r5, #:upper16:regulator_put
	mvn	r8, #21
	b	.L37
.L59:
	movw	r3, #:lower16:dev_set_drvdata
	mov	r1, r6
	movt	r3, #:upper16:dev_set_drvdata
	mov	r0, r7
	blx	r3
	movw	r1, #:lower16:.LC12
	movw	r3, #:lower16:_dev_info
	mov	r0, r7
	movt	r1, #:upper16:.LC12
	movt	r3, #:upper16:_dev_info
	blx	r3
	mov	r0, r8
	b	.L47
.L31:
	movw	r1, #:lower16:.LC13
	movw	r3, #:lower16:dev_err
	mov	r0, r7
	movt	r1, #:upper16:.LC13
	movt	r3, #:upper16:dev_err
	mvn	r8, #21
	blx	r3
	b	.L38
.L58:
	mvn	r8, #11
	b	.L36
.L53:
	mvn	r0, #11
	b	.L47
.L52:
	movw	r1, #:lower16:.LC2
	movw	r3, #:lower16:dev_err
	add	r0, r0, #8
	movt	r1, #:upper16:.LC2
	movt	r3, #:upper16:dev_err
	blx	r3
	mvn	r0, #21
	b	.L47
	.fnend
	.size	gsd4t_probe, .-gsd4t_probe
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	gsd4t_rfkill_ops, %object
	.size	gsd4t_rfkill_ops, 12
gsd4t_rfkill_ops:
	.space	8
	.word	gsd4t_set_block
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_gsd4t_init6, %object
	.size	__initcall_gsd4t_init6, 4
__initcall_gsd4t_init6:
	.word	gsd4t_init
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	gsd4t_driver, %object
	.size	gsd4t_driver, 80
gsd4t_driver:
	.word	gsd4t_probe
	.word	gsd4t_remove
	.space	4
	.word	gsd4t_suspend
	.word	gsd4t_resume
	.word	.LC16
	.space	52
	.space	4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>gsd4t on\012\000"
	.space	3
.LC1:
	.ascii	"<6>gsd4t off\012\000"
	.space	2
.LC2:
	.ascii	"No platform data.\012\000"
	.space	1
.LC3:
	.ascii	"GPS_nRST\000"
	.space	3
.LC4:
	.ascii	"reset\000"
	.space	2
.LC5:
	.ascii	"Invalid nRST pin\012\000"
	.space	2
.LC6:
	.ascii	"GPS_EN\000"
	.space	1
.LC7:
	.ascii	"onoff\000"
	.space	2
.LC8:
	.ascii	"Invalid GPS_EN pin\012\000"
.LC9:
	.ascii	"AP_AGPS_TSYNC\000"
	.space	2
.LC10:
	.ascii	"tsync\000"
	.space	2
.LC11:
	.ascii	"gps_clk\000"
.LC12:
	.ascii	"ready\012\000"
	.space	1
.LC13:
	.ascii	"gps_clk regulator_get error\012\000"
	.space	3
.LC14:
	.ascii	"v_gps_1.8v\000"
	.space	1
.LC15:
	.ascii	"vdd_18 regulator_get error\012\000"
.LC16:
	.ascii	"gsd4t\000"
	.ident	"GCC: (GNU) 4.8"
