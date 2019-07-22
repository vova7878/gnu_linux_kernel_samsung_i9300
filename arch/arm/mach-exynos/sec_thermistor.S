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
	.file	"sec_thermistor.c"
	.text
	.align	2
	.type	sec_therm_init, %function
sec_therm_init:
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
	.size	sec_therm_init, .-sec_therm_init
	.align	2
	.type	sec_therm_resume, %function
sec_therm_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:dev_get_drvdata
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r3, #:upper16:dev_get_drvdata
	blx	r3
	ldr	r2, [r0, #4]
	movw	r3, #:lower16:msecs_to_jiffies
	mov	r4, r0
	movt	r3, #:upper16:msecs_to_jiffies
	ldr	r0, [r2, #12]
	blx	r3
	movw	r3, #:lower16:schedule_delayed_work
	mov	r1, r0
	movt	r3, #:upper16:schedule_delayed_work
	add	r0, r4, #12
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	sec_therm_resume, .-sec_therm_resume
	.align	2
	.type	sec_therm_suspend, %function
sec_therm_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:dev_get_drvdata
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r3, #:upper16:dev_get_drvdata
	blx	r3
	movw	r3, #:lower16:del_timer_sync
	mov	r1, r0
	movt	r3, #:upper16:del_timer_sync
	add	r0, r0, #28
	add	r4, r1, #12
	blx	r3
	cmp	r0, #0
	beq	.L4
	movw	r3, #:lower16:_clear_bit
	mov	r1, r4
	movt	r3, #:upper16:_clear_bit
	mov	r0, #0
	blx	r3
.L4:
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	sec_therm_suspend, .-sec_therm_suspend
	.align	2
	.type	sec_therm_remove, %function
sec_therm_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:dev_get_drvdata
	add	r0, r0, #8
	movt	r3, #:upper16:dev_get_drvdata
	blx	r3
	subs	r4, r0, #0
	beq	.L10
	mov	r5, r4
	movw	r1, #:lower16:.LANCHOR1
	ldr	r0, [r5], #12
	movw	r3, #:lower16:sysfs_remove_group
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:sysfs_remove_group
	add	r0, r0, #8
	blx	r3
	movw	r3, #:lower16:del_timer_sync
	add	r0, r4, #28
	movt	r3, #:upper16:del_timer_sync
	blx	r3
	cmp	r0, #0
	bne	.L18
.L11:
	movw	r3, #:lower16:s3c_adc_release
	ldr	r0, [r4, #8]
	movt	r3, #:upper16:s3c_adc_release
	blx	r3
	movw	r3, #:lower16:kfree
	mov	r0, r4
	movt	r3, #:upper16:kfree
	blx	r3
.L10:
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
.L18:
	movw	r3, #:lower16:_clear_bit
	mov	r1, r5
	movt	r3, #:upper16:_clear_bit
	mov	r0, #0
	blx	r3
	b	.L11
	.fnend
	.size	sec_therm_remove, .-sec_therm_remove
	.align	2
	.type	sec_therm_show_temp_adc, %function
sec_therm_show_temp_adc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:dev_get_drvdata
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r3, #:upper16:dev_get_drvdata
	mov	r4, r2
	blx	r3
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:sprintf
	ldr	r2, [r0, #60]
	movt	r1, #:upper16:.LC0
	mov	r0, r4
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	sec_therm_show_temp_adc, .-sec_therm_show_temp_adc
	.align	2
	.type	sec_therm_show_temperature, %function
sec_therm_show_temperature:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:dev_get_drvdata
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r3, #:upper16:dev_get_drvdata
	mov	r4, r2
	blx	r3
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:sprintf
	ldr	r2, [r0, #56]
	movt	r1, #:upper16:.LC0
	mov	r0, r4
	movt	r3, #:upper16:sprintf
	blx	r3
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	sec_therm_show_temperature, .-sec_therm_show_temperature
	.align	2
	.type	sec_therm_polling_work, %function
sec_therm_polling_work:
	.fnstart
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r10, #:lower16:__stack_chk_guard
	movt	r10, #:upper16:__stack_chk_guard
	ldr	r2, [r0, #-8]
	mov	fp, #0
	.pad #60
	sub	sp, sp, #60
	ldr	r3, [r10]
	movw	r7, #:lower16:s3c_adc_read
	mov	r5, r0
	mov	r8, fp
	ldr	r9, [r2]
	mov	r6, fp
	str	r3, [sp, #52]
	movt	r7, #:upper16:s3c_adc_read
	mov	r4, #1
	b	.L22
.L27:
	add	r4, r4, #1
.L22:
	ldr	r0, [r5, #-4]
	mov	r1, r9
	blx	r7
	cmp	r0, #0
	blt	.L43
	cmp	r4, #1
	beq	.L25
	cmp	r0, r6
	movgt	r6, r0
	bgt	.L26
	cmp	r8, r0
	movge	r8, r0
.L26:
	cmp	r4, #7
	add	fp, fp, r0
	bne	.L27
	rsb	r6, r6, fp
	movw	r3, #26215
	rsb	r8, r8, r6
	movt	r3, 26214
	smull	r2, r3, r3, r8
	mov	r8, r8, asr #31
	ldr	lr, [r5, #-8]
	rsbs	r8, r8, r3, asr #1
	bmi	.L24
	ldr	r2, [lr, #8]
	cmp	r2, #0
	beq	.L40
	ldr	r1, [lr, #4]
	cmp	r1, #0
	bne	.L44
.L40:
	mov	r3, #300
.L29:
	ldr	r2, [r5, #44]
	cmp	r2, r3
	beq	.L24
	add	r6, sp, #12
	movw	r2, #:lower16:.LC2
	movw	r4, #:lower16:snprintf
	str	r3, [r5, #44]
	str	r8, [r5, #48]
	mov	r0, r6
	movt	r2, #:upper16:.LC2
	movt	r4, #:upper16:snprintf
	mov	r1, #20
	blx	r4
	ldr	r3, [r5, #-8]
	str	r6, [sp, #4]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L36
	ldr	r0, [r5, #44]
	blx	r3
	subs	r3, r0, #0
	blt	.L36
	add	r7, sp, #32
	movw	r2, #:lower16:.LC3
	movt	r2, #:upper16:.LC3
	mov	r1, #20
	mov	r0, r7
	blx	r4
	movw	r4, #:lower16:_dev_info
	movw	r1, #:lower16:.LC4
	mov	r3, r7
	movt	r1, #:upper16:.LC4
	movt	r4, #:upper16:_dev_info
	ldr	r0, [r5, #-12]
	ldr	r2, .L46
	str	r7, [sp, #8]
	blx	r4
	mov	ip, #2
.L35:
	add	r3, sp, #56
	movw	r1, #:lower16:.LC4
	add	ip, r3, ip, asl #2
	mov	lr, #0
	mov	r3, r6
	ldr	r2, .L46
	movt	r1, #:upper16:.LC4
	ldr	r0, [r5, #-12]
	str	lr, [ip, #-52]
	blx	r4
	ldr	r0, [r5, #-12]
	movw	r3, #:lower16:kobject_uevent_env
	movt	r3, #:upper16:kobject_uevent_env
	mov	r1, #2
	add	r2, sp, #4
	add	r0, r0, #8
	blx	r3
	ldr	lr, [r5, #-8]
.L24:
	movw	r3, #:lower16:msecs_to_jiffies
	ldr	r0, [lr, #12]
	movt	r3, #:upper16:msecs_to_jiffies
	blx	r3
	movw	r3, #:lower16:schedule_delayed_work
	mov	r1, r0
	movt	r3, #:upper16:schedule_delayed_work
	mov	r0, r5
	blx	r3
	ldr	r2, [sp, #52]
	ldr	r3, [r10]
	cmp	r2, r3
	bne	.L45
	add	sp, sp, #60
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L43:
	movw	r1, #:lower16:.LC1
	movw	ip, #:lower16:dev_err
	mov	r3, r0
	movt	r1, #:upper16:.LC1
	movt	ip, #:upper16:dev_err
	ldr	r0, [r5, #-12]
	ldr	r2, .L46+4
	blx	ip
	ldr	lr, [r5, #-8]
	b	.L24
.L44:
	subs	r1, r1, #1
	bmi	.L41
	mov	r0, #0
.L33:
	add	r3, r0, r1
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	ldr	ip, [r2, r3, asl #3]
	add	r4, r2, r3, asl #3
	cmp	r8, ip
	subcc	r1, r3, #1
	bcc	.L32
	bls	.L30
	add	r0, r3, #1
.L32:
	cmp	r1, r0
	bge	.L33
.L30:
	ldr	r3, [r4, #4]
	b	.L29
.L36:
	movw	r4, #:lower16:_dev_info
	mov	ip, #1
	movt	r4, #:upper16:_dev_info
	b	.L35
.L41:
	mov	r4, r2
	b	.L30
.L25:
	mov	r8, r0
	add	fp, fp, r0
	mov	r6, r0
	b	.L27
.L45:
	movw	r3, #:lower16:__stack_chk_fail
	movt	r3, #:upper16:__stack_chk_fail
	blx	r3
.L47:
	.align	2
.L46:
	.word	.LANCHOR1+36
	.word	.LANCHOR1+12
	.fnend
	.size	sec_therm_polling_work, .-sec_therm_polling_work
	.align	2
	.type	sec_therm_probe, %function
sec_therm_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r1, #:lower16:.LC5
	add	r6, r0, #8
	movw	r3, #:lower16:_dev_info
	mov	r5, r0
	movt	r3, #:upper16:_dev_info
	mov	r0, r6
	movt	r1, #:upper16:.LC5
	ldr	r2, .L59
	ldr	r7, [r5, #92]
	blx	r3
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L52
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movw	r1, #32976
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #64
	blx	r3
	subs	r4, r0, #0
	beq	.L57
.L49:
	movw	r3, #:lower16:dev_set_drvdata
	mov	r1, r4
	movt	r3, #:upper16:dev_set_drvdata
	mov	r0, r6
	blx	r3
	mov	r1, #0
	movw	ip, #:lower16:s3c_adc_register
	mov	r2, r1
	mov	r3, r1
	mov	r0, r5
	movt	ip, #:upper16:s3c_adc_register
	str	r6, [r4]
	str	r7, [r4, #4]
	blx	ip
	ldr	r2, [r4]
	movw	r1, #:lower16:.LANCHOR1
	movw	r3, #:lower16:sysfs_create_group
	str	r0, [r4, #8]
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:sysfs_create_group
	add	r0, r2, #8
	blx	r3
	subs	r5, r0, #0
	bne	.L58
.L51:
	movw	r2, #:lower16:sec_therm_polling_work
	add	ip, r4, #16
	mov	r1, #0
	mov	r0, #1280
	movt	r2, #:upper16:sec_therm_polling_work
	movw	r3, #:lower16:init_timer_deferrable_key
	str	ip, [r4, #16]
	movt	r3, #:upper16:init_timer_deferrable_key
	str	ip, [r4, #20]
	str	r2, [r4, #24]
	mov	r2, r1
	str	r0, [r4, #12]
	add	r0, r4, #28
	blx	r3
	ldr	r2, [r4, #4]
	movw	r3, #:lower16:msecs_to_jiffies
	movt	r3, #:upper16:msecs_to_jiffies
	ldr	r0, [r2, #12]
	blx	r3
	movw	r3, #:lower16:schedule_delayed_work
	mov	r1, r0
	movt	r3, #:upper16:schedule_delayed_work
	add	r0, r4, #12
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L52:
	mov	r4, #16
	b	.L49
.L58:
	movw	r1, #:lower16:.LC6
	movw	r3, #:lower16:dev_err
	movt	r1, #:upper16:.LC6
	movt	r3, #:upper16:dev_err
	ldr	r0, [r4]
	blx	r3
	b	.L51
.L57:
	mvn	r0, #11
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L60:
	.align	2
.L59:
	.word	.LANCHOR1+68
	.fnend
	.size	sec_therm_probe, .-sec_therm_probe
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	sec_therm_group, %object
	.size	sec_therm_group, 12
sec_therm_group:
	.space	8
	.word	sec_therm_attributes
	.type	__func__.13195, %object
	.size	__func__.13195, 23
__func__.13195:
	.ascii	"sec_therm_get_adc_data\000"
	.space	1
	.type	__func__.13218, %object
	.size	__func__.13218, 29
__func__.13218:
	.ascii	"notify_change_of_temperature\000"
	.space	3
	.type	__func__.13237, %object
	.size	__func__.13237, 16
__func__.13237:
	.ascii	"sec_therm_probe\000"
	.type	sec_thermistor_pm_ops, %object
	.size	sec_thermistor_pm_ops, 68
sec_thermistor_pm_ops:
	.space	8
	.word	sec_therm_suspend
	.word	sec_therm_resume
	.space	52
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_sec_therm_init6, %object
	.size	__initcall_sec_therm_init6, 4
__initcall_sec_therm_init6:
	.word	sec_therm_init
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	sec_thermistor_driver, %object
	.size	sec_thermistor_driver, 80
sec_thermistor_driver:
	.word	sec_therm_probe
	.word	sec_therm_remove
	.space	12
	.word	.LC7
	.space	4
	.word	0
	.space	36
	.word	sec_thermistor_pm_ops
	.space	4
	.space	4
	.type	sec_therm_attributes, %object
	.size	sec_therm_attributes, 12
sec_therm_attributes:
	.word	dev_attr_temperature
	.word	dev_attr_temp_adc
	.word	0
	.type	dev_attr_temp_adc, %object
	.size	dev_attr_temp_adc, 16
dev_attr_temp_adc:
	.word	.LC8
	.short	292
	.space	2
	.word	sec_therm_show_temp_adc
	.word	0
	.type	dev_attr_temperature, %object
	.size	dev_attr_temperature, 16
dev_attr_temperature:
	.word	.LC9
	.short	292
	.space	2
	.word	sec_therm_show_temperature
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d\012\000"
.LC1:
	.ascii	"%s : err(%d) returned, skip read\012\000"
	.space	2
.LC2:
	.ascii	"TEMPERATURE=%d\000"
	.space	1
.LC3:
	.ascii	"SIOP_LEVEL=%d\000"
	.space	2
.LC4:
	.ascii	"%s: uevent: %s\012\000"
.LC5:
	.ascii	"%s: SEC Thermistor Driver Loading\012\000"
	.space	1
.LC6:
	.ascii	"failed to create sysfs attribute group\012\000"
.LC7:
	.ascii	"sec-thermistor\000"
	.space	1
.LC8:
	.ascii	"temp_adc\000"
	.space	3
.LC9:
	.ascii	"temperature\000"
	.ident	"GCC: (GNU) 4.8"
