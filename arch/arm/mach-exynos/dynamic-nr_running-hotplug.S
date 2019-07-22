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
	.file	"dynamic-nr_running-hotplug.c"
	.text
	.align	2
	.type	exynos4_integrated_dvfs_hotplug_init, %function
exynos4_integrated_dvfs_hotplug_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r2, #:lower16:cpufreq_frequency_get_table
	mov	r3, #0
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
	mov	r5, r0
	bhi	.L2
	ldr	r3, [r0, #4]
	cmn	r3, #2
	beq	.L7
	ldr	r2, [r4, #40]
	ldr	r1, [r4, #44]
.L8:
	cmn	r3, #1
	beq	.L5
	cmp	r2, r3
	movcc	r2, r3
	bcc	.L5
	cmp	r1, r3
	movcs	r1, r3
.L5:
	add	r0, r0, #8
	ldr	r3, [r0, #4]
	cmn	r3, #2
	bne	.L8
	str	r2, [r4, #40]
	str	r1, [r4, #44]
.L7:
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:register_pm_notifier
	movt	r3, #:upper16:register_pm_notifier
	movt	r0, #:upper16:.LANCHOR1
	blx	r3
	movw	r3, #:lower16:cpufreq_register_notifier
	mov	r1, #0
	movt	r3, #:upper16:cpufreq_register_notifier
	ldr	r0, .L14
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
.L2:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR2
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR2
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, pc}
.L15:
	.align	2
.L14:
	.word	.LANCHOR1+12
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
	beq	.L18
	cmp	r1, #6
	beq	.L18
	cmp	r1, #3
	beq	.L26
	mov	r0, #0
	bx	lr
.L26:
	movw	r3, #:lower16:.LANCHOR0
	mov	r2, #0
	movt	r3, #:upper16:.LANCHOR0
	mov	r0, #0
	str	r2, [r3, #36]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	bx	lr
.L18:
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
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	beq	.L52
.L29:
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L52:
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L29
	ldr	r2, [r4]
	mov	r3, #13568
	movt	r3, 12
	movw	r5, #:lower16:nr_running
	str	r3, [r4, #48]
	movt	r5, #:upper16:nr_running
	add	r3, r2, #1
	str	r3, [r4]
	blx	r5
	cmp	r0, #1
	bls	.L53
	blx	r5
	cmp	r0, #1
	bls	.L33
	blx	r5
	cmp	r0, #2
	bls	.L54
.L33:
	blx	r5
	cmp	r0, #2
	movw	r3, #:lower16:nr_running
	movt	r3, #:upper16:nr_running
	bls	.L34
	blx	r3
	cmp	r0, #3
	bhi	.L34
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
	b	.L32
.L53:
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
.L32:
	movw	r6, #:lower16:samsung_cpu_id
	movt	r6, #:upper16:samsung_cpu_id
	ldr	r3, [r6]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmn	r3, #465567744
	movw	r3, #:lower16:cpu_online_mask
	movt	r3, #:upper16:cpu_online_mask
	ldr	r7, [r3]
	beq	.L55
	ldr	r8, [r7]
	ubfx	r8, r8, #1, #1
	cmp	r8, #0
	bne	.L39
	ldr	r3, [r4, #12]
	movw	r9, #:lower16:.LANCHOR0
	movt	r9, #:upper16:.LANCHOR0
	cmp	r3, #7
	bhi	.L56
.L39:
	ldr	r0, [r7]
	ubfx	r0, r0, #1, #1
	cmp	r0, #1
	bne	.L29
	ldr	r3, [r4, #24]
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	cmp	r3, #7
	bls	.L29
	movw	r3, #:lower16:cpu_down
	movt	r3, #:upper16:cpu_down
	blx	r3
	mov	r3, #0
	str	r3, [r4, #24]
	b	.L29
.L54:
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
	b	.L32
.L56:
	movw	r3, #:lower16:cpu_up
	mov	r0, #1
	movt	r3, #:upper16:cpu_up
	blx	r3
	str	r8, [r9, #12]
.L37:
	ldr	r3, [r6]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmn	r3, #465567744
	bne	.L39
	ldr	r6, [r7]
	ubfx	r6, r6, #1, #1
	cmp	r6, #1
	beq	.L57
.L40:
	ldr	r3, [r7]
	tst	r3, #4
	bne	.L58
.L41:
	ldr	r3, [r7]
	tst	r3, #8
	beq	.L29
	blx	r5
	cmp	r0, #1
	bhi	.L29
	ldr	r3, [r4, #24]
	cmp	r3, #7
	bls	.L29
	movw	r3, #:lower16:cpu_down
	mov	r0, #3
	movt	r3, #:upper16:cpu_down
	blx	r3
	b	.L29
.L55:
	ldr	r3, [r7]
	tst	r3, #8
	beq	.L59
.L36:
	ldr	r3, [r7]
	tst	r3, #4
	beq	.L60
.L38:
	ldr	r3, [r7]
	tst	r3, #2
	bne	.L37
	blx	r5
	cmp	r0, #3
	bls	.L37
	ldr	r3, [r4, #20]
	cmp	r3, #7
	bls	.L37
	movw	r3, #:lower16:cpu_up
	mov	r0, #1
	movt	r3, #:upper16:cpu_up
	blx	r3
	b	.L37
.L34:
	blx	r5
	cmp	r0, #3
	bls	.L32
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
	b	.L32
.L59:
	blx	r5
	cmp	r0, #1
	bls	.L36
	ldr	r3, [r4, #12]
	cmp	r3, #3
	bls	.L37
	movw	r3, #:lower16:cpu_up
	mov	r0, #3
	movt	r3, #:upper16:cpu_up
	blx	r3
	b	.L37
.L60:
	blx	r5
	cmp	r0, #2
	bls	.L38
	ldr	r3, [r4, #16]
	cmp	r3, #3
	bls	.L37
	movw	r3, #:lower16:cpu_up
	mov	r0, #2
	movt	r3, #:upper16:cpu_up
	blx	r3
	b	.L37
.L57:
	blx	r5
	cmp	r0, #3
	bhi	.L40
	ldr	r3, [r4, #32]
	cmp	r3, #7
	bls	.L29
	movw	r3, #:lower16:cpu_down
	mov	r0, r6
	movt	r3, #:upper16:cpu_down
	blx	r3
	b	.L29
.L58:
	blx	r5
	cmp	r0, #2
	bhi	.L41
	ldr	r3, [r4, #28]
	cmp	r3, #7
	bls	.L29
	movw	r3, #:lower16:cpu_down
	mov	r0, #2
	movt	r3, #:upper16:cpu_down
	blx	r3
	b	.L29
	.fnend
	.size	hotplug_cpufreq_transition, .-hotplug_cpufreq_transition
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.19564, %object
	.size	__func__.19564, 37
__func__.19564:
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
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	total_num_target_freq, %object
	.size	total_num_target_freq, 4
total_num_target_freq:
	.space	4
	.type	ctn_highestlevel_cnt, %object
	.size	ctn_highestlevel_cnt, 4
ctn_highestlevel_cnt:
	.space	4
	.type	ctn_lowestlevel_cnt, %object
	.size	ctn_lowestlevel_cnt, 4
ctn_lowestlevel_cnt:
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
	.type	freq_min, %object
	.size	freq_min, 4
freq_min:
	.space	4
	.type	freq_in_trg, %object
	.size	freq_in_trg, 4
freq_in_trg:
	.space	4
	.ident	"GCC: (GNU) 4.8"
