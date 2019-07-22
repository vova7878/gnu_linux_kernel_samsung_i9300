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
	.file	"dynamic-dvfs-nr_running-hotplug.c"
	.text
	.align	2
	.type	exynos4_integrated_dvfs_hotplug_init, %function
exynos4_integrated_dvfs_hotplug_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r2, #:lower16:cpufreq_frequency_get_table
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	mov	r1, #1
	mov	r0, r3
	movt	r2, #:upper16:cpufreq_frequency_get_table
	str	r1, [r4, #36]
	str	r3, [r4]
	str	r3, [r4, #4]
	str	r3, [r4, #8]
	str	r3, [r4, #12]
	str	r3, [r4, #16]
	str	r3, [r4, #20]
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	str	r3, [r4, #32]
	blx	r2
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L2
	ldr	r1, [r0, #4]
	cmn	r1, #2
	beq	.L15
	movw	r5, #:lower16:.LANCHOR1
	ldr	r2, [r4, #40]
	movt	r5, #:upper16:.LANCHOR1
	ldr	r3, [r5]
	mov	ip, r2
	mov	lr, r3
.L8:
	cmn	r1, #1
	beq	.L6
	cmp	r1, r2
	movhi	ip, r1
	movhi	r2, ip
	bhi	.L6
	cmp	r1, r3
	movcc	lr, r1
	movcc	r3, lr
.L6:
	add	r0, r0, #8
	ldr	r1, [r0, #4]
	cmn	r1, #2
	bne	.L8
	str	ip, [r4, #40]
	str	lr, [r5]
.L4:
	movw	r0, #:lower16:.LC1
	movw	r1, #:lower16:.LANCHOR2
	movw	ip, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR2
	movt	ip, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	ip
	movw	r3, #:lower16:register_pm_notifier
	ldr	r0, .L16
	movt	r3, #:upper16:register_pm_notifier
	blx	r3
	movw	r3, #:lower16:cpufreq_register_notifier
	mov	r1, #0
	movt	r3, #:upper16:cpufreq_register_notifier
	ldr	r0, .L16+4
	blx	r3
	ldmfd	sp!, {r4, r5, r6, pc}
.L15:
	movw	r3, #:lower16:.LANCHOR1
	ldr	r2, [r4, #40]
	movt	r3, #:upper16:.LANCHOR1
	ldr	r3, [r3]
	b	.L4
.L2:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR2
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR2
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	mov	r0, r6
	ldmfd	sp!, {r4, r5, r6, pc}
.L17:
	.align	2
.L16:
	.word	.LANCHOR1+4
	.word	.LANCHOR1+16
	.fnend
	.size	exynos4_integrated_dvfs_hotplug_init, .-exynos4_integrated_dvfs_hotplug_init
	.align	2
	.type	hotplug_pm_transition, %function
hotplug_pm_transition:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #4
	beq	.L20
	cmp	r1, #6
	beq	.L20
	cmp	r1, #3
	beq	.L28
	mov	r0, #0
	bx	lr
.L28:
	movw	r3, #:lower16:.LANCHOR0
	mov	r2, #0
	movt	r3, #:upper16:.LANCHOR0
	mov	r0, #0
	str	r2, [r3, #36]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	bx	lr
.L20:
	movw	r3, #:lower16:.LANCHOR0
	mov	r2, #1
	movt	r3, #:upper16:.LANCHOR0
	mov	r0, #0
	str	r2, [r3, #36]
	bx	lr
	.fnend
	.size	hotplug_pm_transition, .-hotplug_pm_transition
	.align	2
	.type	hotplug_cpufreq_transition, %function
hotplug_cpufreq_transition:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #1
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	beq	.L66
.L31:
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L66:
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L31
	movw	r3, #:lower16:.LANCHOR1
	ldr	r0, [r4]
	movt	r3, #:upper16:.LANCHOR1
	mov	r1, #13568
	ldr	r3, [r3]
	movw	r5, #:lower16:nr_running
	add	r0, r0, #1
	movt	r1, 12
	movt	r5, #:upper16:nr_running
	str	r0, [r4]
	str	r3, [r4, #48]
	str	r1, [r4, #44]
	ldmib	r2, {r7, r8}
	blx	r5
	cmp	r0, #1
	bls	.L67
	blx	r5
	cmp	r0, #1
	bls	.L35
	blx	r5
	cmp	r0, #2
	bls	.L68
.L35:
	blx	r5
	cmp	r0, #2
	movw	r3, #:lower16:nr_running
	movt	r3, #:upper16:nr_running
	bls	.L36
	blx	r3
	cmp	r0, #3
	bhi	.L36
	ldr	r0, [r4, #12]
	mov	r3, #0
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #32]
	add	r0, r0, #1
	str	r3, [r4, #20]
	add	r1, r1, #1
	str	r0, [r4, #12]
	add	r2, r2, #1
	str	r1, [r4, #16]
	str	r2, [r4, #32]
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	b	.L34
.L67:
	ldr	r0, [r4, #24]
	mov	r3, #0
	ldr	r1, [r4, #28]
	ldr	r2, [r4, #32]
	add	r0, r0, #1
	str	r3, [r4, #12]
	add	r1, r1, #1
	str	r0, [r4, #24]
	add	r2, r2, #1
	str	r1, [r4, #28]
	str	r2, [r4, #32]
	str	r3, [r4, #16]
	str	r3, [r4, #20]
.L34:
	ldr	r2, [r4, #44]
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	cmp	r7, r2
	bcc	.L37
	cmp	r8, r2
	bcs	.L69
.L37:
	mov	r3, #0
	str	r3, [r4, #4]
.L38:
	ldr	r1, [r4, #48]
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	cmp	r7, r1
	bhi	.L39
	cmp	r8, r1
	bls	.L70
.L39:
	mov	r3, #0
	str	r3, [r4, #8]
.L40:
	movw	r6, #:lower16:samsung_cpu_id
	movt	r6, #:upper16:samsung_cpu_id
	ldr	r3, [r6]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmn	r3, #465567744
	movw	r3, #:lower16:cpu_online_mask
	movt	r3, #:upper16:cpu_online_mask
	ldr	r9, [r3]
	ldr	r10, [r9]
	beq	.L71
	ubfx	r10, r10, #1, #1
	cmp	r10, #0
	bne	.L45
	cmp	r7, r2
	bcc	.L45
	cmp	r8, r2
	bcc	.L45
	ldr	r3, [r4, #12]
	movw	fp, #:lower16:.LANCHOR0
	movt	fp, #:upper16:.LANCHOR0
	cmp	r3, #7
	bls	.L45
	ldr	r3, [fp, #4]
	cmp	r3, #4
	bls	.L45
	movw	r3, #:lower16:cpu_up
	mov	r0, #1
	movt	r3, #:upper16:cpu_up
	blx	r3
	str	r10, [fp, #12]
	str	r10, [fp, #4]
.L43:
	ldr	r3, [r6]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmn	r3, #465567744
	bne	.L45
	ldr	r6, [r9]
	ubfx	r6, r6, #1, #1
	cmp	r6, #1
	beq	.L72
.L46:
	ldr	r3, [r9]
	tst	r3, #4
	bne	.L73
.L47:
	ldr	r3, [r9]
	tst	r3, #8
	beq	.L31
	blx	r5
	cmp	r0, #1
	bhi	.L31
	ldr	r3, [r4, #48]
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	cmp	r7, r3
	bhi	.L31
	cmp	r8, r3
	bhi	.L31
	ldr	r3, [r4, #24]
	cmp	r3, #7
	bls	.L31
	ldr	r3, [r4, #8]
	cmp	r3, #4
	bls	.L31
	movw	r3, #:lower16:cpu_down
	mov	r0, #3
	movt	r3, #:upper16:cpu_down
	blx	r3
	mov	r3, #0
	str	r3, [r4, #8]
	b	.L31
.L45:
	ldr	r0, [r9]
	ubfx	r0, r0, #1, #1
	cmp	r0, #1
	bne	.L31
	ldr	r3, [r4, #48]
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	cmp	r7, r3
	bhi	.L31
	cmp	r8, r3
	bhi	.L31
	ldr	r3, [r4, #24]
	cmp	r3, #7
	bls	.L31
	ldr	r3, [r4, #8]
	cmp	r3, #4
	bls	.L31
	movw	r3, #:lower16:cpu_down
	movt	r3, #:upper16:cpu_down
	blx	r3
	mov	r3, #0
	str	r3, [r4, #24]
	str	r3, [r4, #8]
	b	.L31
.L70:
	ldr	r1, [r3, #8]
	add	r1, r1, #1
	str	r1, [r3, #8]
	b	.L40
.L69:
	ldr	r1, [r3, #4]
	add	r1, r1, #1
	str	r1, [r3, #4]
	b	.L38
.L68:
	ldr	r0, [r4, #12]
	mov	r3, #0
	ldr	r1, [r4, #28]
	ldr	r2, [r4, #32]
	add	r0, r0, #1
	str	r3, [r4, #16]
	add	r1, r1, #1
	str	r0, [r4, #12]
	add	r2, r2, #1
	str	r1, [r4, #28]
	str	r2, [r4, #32]
	str	r3, [r4, #20]
	str	r3, [r4, #24]
	b	.L34
.L71:
	ubfx	r10, r10, #3, #1
	cmp	r10, #0
	beq	.L74
.L42:
	ldr	r10, [r9]
	ubfx	r10, r10, #2, #1
	cmp	r10, #0
	beq	.L75
.L44:
	ldr	r10, [r9]
	ubfx	r10, r10, #1, #1
	cmp	r10, #0
	bne	.L43
	blx	r5
	cmp	r0, #3
	bls	.L43
	ldr	r3, [r4, #44]
	movw	fp, #:lower16:.LANCHOR0
	movt	fp, #:upper16:.LANCHOR0
	cmp	r7, r3
	bcc	.L43
	cmp	r8, r3
	bcc	.L43
	ldr	r3, [fp, #20]
	cmp	r3, #7
	bls	.L43
	ldr	r3, [fp, #4]
	cmp	r3, #4
	bls	.L43
	movw	r3, #:lower16:cpu_up
	mov	r0, #1
	movt	r3, #:upper16:cpu_up
	blx	r3
	str	r10, [fp, #4]
	b	.L43
.L36:
	blx	r5
	cmp	r0, #3
	bls	.L34
	ldr	r0, [r4, #12]
	mov	r3, #0
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #20]
	add	r0, r0, #1
	str	r3, [r4, #24]
	add	r1, r1, #1
	str	r0, [r4, #12]
	add	r2, r2, #1
	str	r1, [r4, #16]
	str	r2, [r4, #20]
	str	r3, [r4, #28]
	str	r3, [r4, #32]
	b	.L34
.L74:
	blx	r5
	cmp	r0, #1
	bls	.L42
	ldr	r3, [r4, #44]
	movw	fp, #:lower16:.LANCHOR0
	movt	fp, #:upper16:.LANCHOR0
	cmp	r7, r3
	bcc	.L42
	cmp	r8, r3
	bcc	.L42
	ldr	r3, [fp, #12]
	cmp	r3, #3
	bls	.L43
	ldr	r3, [fp, #4]
	cmp	r3, #4
	bls	.L43
	movw	r3, #:lower16:cpu_up
	mov	r0, #3
	movt	r3, #:upper16:cpu_up
	blx	r3
	str	r10, [fp, #4]
	b	.L43
.L75:
	blx	r5
	cmp	r0, #2
	bls	.L44
	ldr	r3, [r4, #44]
	movw	fp, #:lower16:.LANCHOR0
	movt	fp, #:upper16:.LANCHOR0
	cmp	r7, r3
	bcc	.L44
	cmp	r8, r3
	bcc	.L44
	ldr	r3, [fp, #16]
	cmp	r3, #3
	bls	.L43
	ldr	r3, [fp, #4]
	cmp	r3, #4
	bls	.L43
	movw	r3, #:lower16:cpu_up
	mov	r0, #2
	movt	r3, #:upper16:cpu_up
	blx	r3
	str	r10, [fp, #4]
	b	.L43
.L72:
	blx	r5
	cmp	r0, #3
	bhi	.L46
	ldr	r3, [r4, #48]
	movw	r10, #:lower16:.LANCHOR0
	movt	r10, #:upper16:.LANCHOR0
	cmp	r7, r3
	bhi	.L46
	cmp	r8, r3
	bhi	.L46
	ldr	r3, [r10, #32]
	cmp	r3, #7
	bls	.L31
	ldr	r3, [r10, #8]
	cmp	r3, #4
	bls	.L31
	movw	r3, #:lower16:cpu_down
	mov	r0, r6
	movt	r3, #:upper16:cpu_down
	blx	r3
	mov	r3, #0
	str	r3, [r10, #8]
	b	.L31
.L73:
	blx	r5
	cmp	r0, #2
	bhi	.L47
	ldr	r3, [r4, #48]
	movw	r6, #:lower16:.LANCHOR0
	movt	r6, #:upper16:.LANCHOR0
	cmp	r7, r3
	bhi	.L47
	cmp	r8, r3
	bhi	.L47
	ldr	r3, [r6, #28]
	cmp	r3, #7
	bls	.L31
	ldr	r3, [r6, #8]
	cmp	r3, #4
	bls	.L31
	movw	r3, #:lower16:cpu_down
	mov	r0, #2
	movt	r3, #:upper16:cpu_down
	blx	r3
	mov	r3, #0
	str	r3, [r6, #8]
	b	.L31
	.fnend
	.size	hotplug_cpufreq_transition, .-hotplug_cpufreq_transition
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.19707, %object
	.size	__func__.19707, 37
__func__.19707:
	.ascii	"exynos4_integrated_dvfs_hotplug_init\000"
	.section	.initcall7.init,"aw",%progbits
	.align	2
	.type	__initcall_exynos4_integrated_dvfs_hotplug_init7, %object
	.size	__initcall_exynos4_integrated_dvfs_hotplug_init7, 4
__initcall_exynos4_integrated_dvfs_hotplug_init7:
	.word	exynos4_integrated_dvfs_hotplug_init
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	freq_min, %object
	.size	freq_min, 4
freq_min:
	.word	-1
	.type	pm_hotplug, %object
	.size	pm_hotplug, 12
pm_hotplug:
	.word	hotplug_pm_transition
	.space	8
	.type	dvfs_hotplug, %object
	.size	dvfs_hotplug, 12
dvfs_hotplug:
	.word	hotplug_cpufreq_transition
	.space	8
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>%s: Check loading cpufreq before\012\000"
	.space	3
.LC1:
	.ascii	"<6>%s, max(%d),min(%d)\012\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	total_num_target_freq, %object
	.size	total_num_target_freq, 4
total_num_target_freq:
	.space	4
	.type	ctn_freq_in_trg_cnt, %object
	.size	ctn_freq_in_trg_cnt, 4
ctn_freq_in_trg_cnt:
	.space	4
	.type	ctn_freq_out_trg_cnt, %object
	.size	ctn_freq_out_trg_cnt, 4
ctn_freq_out_trg_cnt:
	.space	4
	.type	ctn_nr_running_over2, %object
	.size	ctn_nr_running_over2, 4
ctn_nr_running_over2:
	.space	4
	.type	ctn_nr_running_over3, %object
	.size	ctn_nr_running_over3, 4
ctn_nr_running_over3:
	.space	4
	.type	ctn_nr_running_over4, %object
	.size	ctn_nr_running_over4, 4
ctn_nr_running_over4:
	.space	4
	.type	ctn_nr_running_under2, %object
	.size	ctn_nr_running_under2, 4
ctn_nr_running_under2:
	.space	4
	.type	ctn_nr_running_under3, %object
	.size	ctn_nr_running_under3, 4
ctn_nr_running_under3:
	.space	4
	.type	ctn_nr_running_under4, %object
	.size	ctn_nr_running_under4, 4
ctn_nr_running_under4:
	.space	4
	.type	can_hotplug, %object
	.size	can_hotplug, 4
can_hotplug:
	.space	4
	.type	freq_max, %object
	.size	freq_max, 4
freq_max:
	.space	4
	.type	freq_in_trg, %object
	.size	freq_in_trg, 4
freq_in_trg:
	.space	4
	.type	freq_out_trg, %object
	.size	freq_out_trg, 4
freq_out_trg:
	.space	4
	.ident	"GCC: (GNU) 4.8"
