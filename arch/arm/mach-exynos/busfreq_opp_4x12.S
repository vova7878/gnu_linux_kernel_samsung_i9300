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
	.file	"busfreq_opp_4x12.c"
	.text
	.align	2
	.global	exynos4x12_find_busfreq_by_volt
	.type	exynos4x12_find_busfreq_by_volt, %function
exynos4x12_find_busfreq_by_volt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	r2, r0, #0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	beq	.L9
	movw	r0, #:lower16:.LANCHOR1
	mov	r4, #6
	movt	r0, #:upper16:.LANCHOR1
	ldmia	r0, {r5, ip}
	ldr	r6, [r0, #8]
	rsb	r5, r5, r5, asl #3
	mov	r3, r5, asl #2
	add	ip, ip, r3
	add	r3, r6, r3
.L6:
	ldr	r6, [r3, #24]
	sub	ip, ip, #4
	ldr	r5, [ip, #28]
	sub	r3, r3, #4
	cmp	r6, r5
	movcc	r5, r6
	cmp	r2, r5
	bls	.L10
	subs	r4, r4, #1
	bcs	.L6
	movw	r0, #:lower16:.LC1
	movw	r1, #:lower16:.LANCHOR0
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, pc}
.L10:
	ldr	r3, [r0, #12]
	add	r4, r4, r4, asl #1
	mov	r0, #0
	add	r4, r3, r4, asl #3
	ldr	r3, [r4, #4]
	str	r3, [r1]
	ldmfd	sp!, {r4, r5, r6, pc}
.L9:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR0
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	exynos4x12_find_busfreq_by_volt, .-exynos4x12_find_busfreq_by_volt
	.align	2
	.type	exynos4x12_busfreq_cpufreq_transition, %function
exynos4x12_busfreq_cpufreq_transition:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	beq	.L13
	cmp	r1, #1
	bne	.L12
	ldr	r1, [r2, #4]
	movw	r3, #48032
	movt	r3, 13
	cmp	r1, r3
	bls	.L12
	ldr	r2, [r2, #8]
	movw	r3, #16959
	movt	r3, 15
	cmp	r2, r3
	bls	.L15
.L12:
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
.L13:
	ldr	r1, [r2, #8]
	movw	r3, #48032
	movt	r3, 13
	cmp	r1, r3
	bls	.L12
	ldr	r2, [r2, #4]
	movw	r3, #16959
	movt	r3, 15
	cmp	r2, r3
	bhi	.L12
	ldr	r0, [r0, #-200]
	movw	r2, #29088
	movw	r3, #:lower16:dev_lock
	movt	r2, 2
	movt	r3, #:upper16:dev_lock
	mov	r1, r0
	blx	r3
	b	.L12
.L15:
	ldr	r0, [r0, #-200]
	movw	r3, #:lower16:dev_unlock
	movt	r3, #:upper16:dev_unlock
	mov	r1, r0
	blx	r3
	b	.L12
	.fnend
	.size	exynos4x12_busfreq_cpufreq_transition, .-exynos4x12_busfreq_cpufreq_transition
	.align	2
	.global	exynos4x12_target
	.type	exynos4x12_target, %function
exynos4x12_target:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:.LANCHOR1
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movt	r3, #:upper16:.LANCHOR1
	mov	r1, r0, asl #1
	mov	r4, r0
	ldr	r2, [r3, #12]
	add	r0, r1, r0
	mov	r3, #0
	movt	r3, 65041
	mov	ip, r3
	add	r2, r2, r0, asl #3
	ldr	r2, [r2, #16]
	str	r2, [r3, #1280]
.L18:
	ldr	r0, [ip, #1536]
	movw	r3, #4369
	movt	r3, 17
	mov	r2, #0
	movt	r2, 65041
	and	r3, r0, r3
	cmp	r3, #0
	bne	.L18
	movw	r0, #:lower16:.LANCHOR0
	add	r3, r1, r4
	movt	r0, #:upper16:.LANCHOR0
	ldr	r6, [r2, #1284]
	add	r3, r0, r3, asl #3
	mov	ip, r2
	ldr	r7, [r3, #36]
	bic	r6, r6, #28672
	ldr	r5, [r3, #32]
	bic	r6, r6, #127
	ldr	lr, [r3, #40]
	orr	r3, r6, r7, asl #4
	orr	r3, r3, r5
	orr	r3, r3, lr, asl #12
	str	r3, [r2, #1284]
.L20:
	ldr	r2, [ip, #1540]
	movw	r3, #4113
	and	r3, r2, r3
	cmp	r3, #0
	bne	.L20
	add	r3, r4, r4, asl #2
	mov	r2, #49152
	movt	r2, 65040
	add	r3, r0, r3, asl #2
	ldr	ip, [r2, #1296]
	movw	lr, #34831
	ldr	r5, [r3, #200]
	movt	lr, 65416
	ldr	r8, [r3, #204]
	and	lr, ip, lr
	ldr	r7, [r3, #208]
	mov	ip, r2
	ldr	r6, [r3, #212]
	orr	lr, lr, r5, asl #20
	ldr	r5, [r3, #216]
	orr	lr, lr, r8, asl #4
	orr	r3, lr, r7, asl #8
	orr	r3, r3, r6, asl #12
	orr	r3, r3, r5, asl #16
	str	r3, [r2, #1296]
.L22:
	ldr	r2, [ip, #1552]
	movw	r3, #4369
	movt	r3, 1
	and	r3, r2, r3
	cmp	r3, #0
	bne	.L22
	mov	ip, r4, asl #3
	mov	r3, #16384
	movt	r3, 65040
	add	lr, r0, ip
	ldr	r7, [r3, #1280]
	ldr	r6, [lr, #344]
	mov	r2, r3
	ldr	r5, [lr, #340]
	bic	lr, r7, #119
	orr	lr, lr, r6, asl #4
	orr	lr, lr, r5
	str	lr, [r3, #1280]
.L24:
	ldr	r3, [r2, #1536]
	tst	r3, #17
	bne	.L24
	mov	r3, #32768
	add	ip, r0, ip
	movt	r3, 65040
	ldr	r5, [ip, #400]
	ldr	r6, [r3, #1280]
	mov	r2, r3
	ldr	lr, [ip, #396]
	bic	ip, r6, #119
	orr	ip, ip, r5, asl #4
	orr	ip, ip, lr
	str	ip, [r3, #1280]
.L26:
	ldr	r3, [r2, #1536]
	tst	r3, #17
	bne	.L26
	mov	r3, #49152
	add	lr, r1, r4
	movt	r3, 65040
	add	lr, r0, lr, asl #2
	ldr	r2, [r3, #1320]
	mov	ip, r3
	ldr	lr, [lr, #452]
	bic	r2, r2, #7
	orr	r2, r2, lr
	str	r2, [r3, #1320]
.L28:
	ldr	r2, [ip, #1576]
	mov	r3, #49152
	movt	r3, 65040
	tst	r2, #1
	bne	.L28
	add	lr, r1, r4
	ldr	r2, [r3, #1384]
	add	lr, r0, lr, asl #2
	mov	ip, r3
	ldr	lr, [lr, #456]
	bic	r2, r2, #15
	orr	r2, r2, lr
	str	r2, [r3, #1384]
.L30:
	ldr	r2, [ip, #1640]
	mov	r3, #49152
	movt	r3, 65040
	tst	r2, #1
	bne	.L30
	add	r2, r1, r4
	ldr	r1, [r3, #1312]
	add	r2, r0, r2, asl #2
	mov	r0, r3
	ldr	r2, [r2, #460]
	mov	r1, r1, lsr #16
	mov	ip, r2, asl #4
	orr	r1, ip, r1, asl #16
	orr	r1, r1, r2
	orr	r1, r1, r2, asl #8
	orr	r2, r1, r2, asl #12
	str	r2, [r3, #1312]
.L32:
	ldr	r2, [r0, #1640]
	movw	r3, #4369
	and	r3, r2, r3
	cmp	r3, #0
	bne	.L32
	movw	r3, #:lower16:samsung_rev
	movt	r3, #:upper16:samsung_rev
	blx	r3
	cmp	r0, #31
	ldmhifd	sp!, {r4, r5, r6, r7, r8, pc}
	movw	r3, #:lower16:samsung_cpu_id
	movt	r3, #:upper16:samsung_cpu_id
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmn	r3, #465567744
	ldmnefd	sp!, {r4, r5, r6, r7, r8, pc}
	movw	r3, #:lower16:exynos_result_of_asv
	movt	r3, #:upper16:exynos_result_of_asv
	ldr	r3, [r3]
	cmp	r3, #3
	ldmlsfd	sp!, {r4, r5, r6, r7, r8, pc}
	cmp	r4, #6
	mov	r3, #0
	moveq	r2, #136
	movne	r2, #142
	movt	r3, 65048
	movt	r2, 32768
	str	r2, [r3, #1920]
	str	r2, [r3, #1924]
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	exynos4x12_target, .-exynos4x12_target
	.align	2
	.global	exynos4x12_get_table_index
	.type	exynos4x12_get_table_index, %function
exynos4x12_get_table_index:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, #0
	movw	r6, #:lower16:opp_get_freq
	movw	r7, #:lower16:.LANCHOR1
	mov	r8, r0
	mov	r5, r4
	movt	r6, #:upper16:opp_get_freq
	movt	r7, #:upper16:.LANCHOR1
.L37:
	mov	r0, r8
	blx	r6
	ldr	r3, [r7, #12]
	add	r3, r3, r4
	add	r4, r4, #24
	ldr	r3, [r3, #4]
	cmp	r0, r3
	beq	.L36
	add	r5, r5, #1
	cmp	r5, #7
	bne	.L37
.L36:
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	exynos4x12_get_table_index, .-exynos4x12_get_table_index
	.align	2
	.global	exynos4x12_prepare
	.type	exynos4x12_prepare, %function
exynos4x12_prepare:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	sub	sp, sp, #8
	mov	r5, #0
	mov	r4, r0
	add	r1, sp, #8
	mov	r0, #52
	movw	r3, #:lower16:exynos_smc_readsfr
	str	r5, [r1, #-4]!
	movt	r3, #:upper16:exynos_smc_readsfr
	movt	r0, 4192
	blx	r3
	movw	r3, #:lower16:.LANCHOR0
	ldr	ip, [sp, #4]
	movt	r3, #:upper16:.LANCHOR0
	mov	r8, #13
	add	r3, r3, r4, asl #2
	movt	r8, 17432
	movw	r4, #:lower16:exynos_smc
	ldr	r7, [r3, #536]
	movt	r4, #:upper16:exynos_smc
	mov	r1, r8
	mov	r3, r5
	mvn	r0, #100
	movw	r6, #16397
	orr	ip, r7, ip
	movt	r6, 17432
	mov	r2, ip
	str	ip, [sp, #4]
	blx	r4
	mov	r1, r8
	mov	r2, r7
	mov	r3, r5
	mvn	r0, #100
	blx	r4
	mov	r1, r6
	mov	r3, r5
	ldr	r2, [sp, #4]
	mvn	r0, #100
	blx	r4
	mov	r2, r7
	mov	r1, r6
	mov	r3, r5
	mvn	r0, #100
	blx	r4
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	exynos4x12_prepare, .-exynos4x12_prepare
	.align	2
	.global	exynos4x12_post
	.type	exynos4x12_post, %function
exynos4x12_post:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	sub	sp, sp, #8
	mov	r5, #0
	mov	r4, r0
	add	r1, sp, #8
	mov	r0, #52
	movw	r3, #:lower16:exynos_smc_readsfr
	str	r5, [r1, #-4]!
	movt	r3, #:upper16:exynos_smc_readsfr
	movt	r0, 4192
	blx	r3
	movw	r3, #:lower16:.LANCHOR0
	ldr	ip, [sp, #4]
	movt	r3, #:upper16:.LANCHOR0
	mov	r8, #13
	add	r3, r3, r4, asl #2
	movt	r8, 17432
	movw	r4, #:lower16:exynos_smc
	ldr	r7, [r3, #536]
	movt	r4, #:upper16:exynos_smc
	mov	r1, r8
	mov	r3, r5
	mvn	r0, #100
	movw	r6, #16397
	orr	ip, r7, ip
	movt	r6, 17432
	mov	r2, ip
	str	ip, [sp, #4]
	blx	r4
	mov	r1, r8
	mov	r2, r7
	mov	r3, r5
	mvn	r0, #100
	blx	r4
	mov	r1, r6
	mov	r3, r5
	ldr	r2, [sp, #4]
	mvn	r0, #100
	blx	r4
	mov	r2, r7
	mov	r1, r6
	mov	r3, r5
	mvn	r0, #100
	blx	r4
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	exynos4x12_post, .-exynos4x12_post
	.align	2
	.global	exynos4x12_set_qos
	.type	exynos4x12_set_qos, %function
exynos4x12_set_qos:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR1
	str	r4, [sp, #-4]!
	.save {r4}
	movt	r3, #:upper16:.LANCHOR1
	mov	r2, #0
	movt	r2, 65172
	ldr	ip, [r3, #20]
	ldr	r4, [r3, #16]
	movw	r3, #8191
	movt	r3, 65172
	rsb	ip, ip, ip, asl #3
	add	r1, r4, ip, asl #4
	ldr	ip, [r1, r0, asl #4]
	add	r0, r1, r0, asl #4
	str	ip, [r2, #1024]
	ldr	r1, [r0, #4]
	str	r1, [r2, #1028]
	ldr	r2, [r0, #8]
	str	r2, [r3, #-3071]
	ldr	r2, [r0, #12]
	str	r2, [r3, #-3067]
	ldr	r4, [sp], #4
	bx	lr
	.fnend
	.size	exynos4x12_set_qos, .-exynos4x12_set_qos
	.align	2
	.type	exynos4x12_bus_qos_notifiy, %function
exynos4x12_bus_qos_notifiy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r2, [r0, #60]
	ldr	r0, [r0, #-164]
	str	r1, [r3, #20]
	blx	r2
	bl	exynos4x12_set_qos
	mov	r0, #1
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4x12_bus_qos_notifiy, .-exynos4x12_bus_qos_notifiy
	.align	2
	.global	exynos4x12_suspend
	.type	exynos4x12_suspend, %function
exynos4x12_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	exynos4x12_suspend, .-exynos4x12_suspend
	.align	2
	.global	exynos4x12_resume
	.type	exynos4x12_resume, %function
exynos4x12_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR1
	mov	r2, #4096
	movt	r3, #:upper16:.LANCHOR1
	movt	r2, 65041
	ldr	r3, [r3, #24]
	str	r3, [r2, #148]
	bx	lr
	.fnend
	.size	exynos4x12_resume, .-exynos4x12_resume
	.align	2
	.global	exynos4x12_get_int_volt
	.type	exynos4x12_get_int_volt, %function
exynos4x12_get_int_volt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldmia	r3, {r2, r3}
	rsb	r2, r2, r2, asl #3
	add	r2, r3, r2, asl #2
	ldr	r0, [r2, r0, asl #2]
	bx	lr
	.fnend
	.size	exynos4x12_get_int_volt, .-exynos4x12_get_int_volt
	.global	__aeabi_uidiv
	.align	2
	.global	exynos4x12_monitor
	.type	exynos4x12_monitor, %function
exynos4x12_monitor:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r5, #:lower16:opp_get_freq
	mov	r4, r0
	mov	fp, #0
	.pad #20
	sub	sp, sp, #20
	movt	r5, #:upper16:opp_get_freq
	ldr	r0, [r0, #52]
	movw	r7, #19923
	str	fp, [sp, #8]
	movt	r7, 4194
	blx	r5
	mov	r9, r0
	ldr	r0, [r4, #56]
	blx	r5
	mov	r2, r0
	mov	r1, #3
	umull	r3, r2, r7, r2
	movw	r3, #:lower16:ppmu_update
	movt	r3, #:upper16:ppmu_update
	ldr	r0, [r4, #4]
	movw	r10, #:lower16:ppmu_load
	movw	r6, #:lower16:div64_u64
	movt	r10, #:upper16:ppmu_load
	movt	r6, #:upper16:div64_u64
	mov	r2, r2, lsr #6
	str	r2, [sp]
	blx	r3
	umull	r3, r9, r7, r9
	ldmia	r10, {r0, ip}
	mov	r3, fp
	ldr	r2, [sp]
	ldr	r7, [r10, #16]
	mov	r9, r9, lsr #6
	umull	r0, r1, r0, r9
	mla	r1, r9, ip, r1
	blx	r6
	mov	r8, r0
	ldr	r0, [r10, #8]
	ldr	ip, [r10, #12]
	mov	r3, fp
	ldr	r2, [sp]
	movw	r10, #:lower16:.LANCHOR2
	umull	r0, r1, r0, r9
	mla	r1, r9, ip, r1
	blx	r6
	ldr	r3, [r4, #164]
	mov	fp, r0
	cmp	r3, #0
	add	r2, r3, #1
	movteq	r10, #:upper16:.LANCHOR2
	movtne	r10, #:upper16:.LANCHOR2
	ldreq	r1, [r10]
	subne	r0, r3, #1
	ldrne	r1, [r10]
	add	r3, r4, r3, asl #2
	subeq	r0, r1, #1
	add	r0, r0, #36
	cmp	r2, r1
	ldr	r0, [r4, r0, asl #2]
	str	r7, [r3, #144]
	str	r8, [r3, #104]
	str	r0, [sp, #4]
	str	r2, [r4, #164]
	str	fp, [r3, #124]
	bcc	.L51
	cmp	r1, #0
	mov	r3, #0
	str	r3, [r4, #164]
	beq	.L70
.L51:
	mov	r2, #0
	add	r0, r4, r1, asl #2
	mov	ip, r2
	mov	r3, r4
.L53:
	ldr	r9, [r3, #104]
	add	r3, r3, #4
	ldr	lr, [r3, #120]
	cmp	r3, r0
	add	ip, ip, r9
	add	r2, r2, lr
	bne	.L53
.L52:
	cmp	r8, fp
	movw	r3, #:lower16:__aeabi_uidiv
	movtcc	r3, #:upper16:__aeabi_uidiv
	movtcs	r3, #:upper16:__aeabi_uidiv
	movcc	r0, r2
	movcs	r0, ip
	movcc	r8, fp
	movw	r9, #:lower16:.LANCHOR2
	blx	r3
	ldr	r3, [r10, #4]
	mov	fp, r0
	movt	r9, #:upper16:.LANCHOR2
	cmp	r7, r3
	bcs	.L72
.L57:
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r2, [r3, #28]
	cmp	r8, r2
	bcs	.L73
	ldr	r3, [r10, #16]
	cmp	r8, r3
	bcs	.L62
	cmp	fp, r3
	ldrcs	r0, [r4, #52]
	bcc	.L74
.L64:
	blx	r5
	mov	r6, r0
.L61:
	movw	r3, #:lower16:dev_max_freq
	ldr	r0, [r4, #4]
	movt	r3, #:upper16:dev_max_freq
	blx	r3
	cmp	r6, r0
	ldr	r3, [sp, #8]
	bcs	.L66
	cmp	r0, r3
	movcs	r6, r0
	movcc	r6, r3
.L67:
	movw	r3, #:lower16:samsung_rev
	str	r6, [sp, #12]
	movt	r3, #:upper16:samsung_rev
	blx	r3
	cmp	r0, #15
	bls	.L75
.L68:
	movw	r3, #:lower16:opp_find_freq_ceil
	ldr	r0, [r4, #4]
	movt	r3, #:upper16:opp_find_freq_ceil
	add	r1, sp, #12
	blx	r3
	cmn	r0, #4096
	ldrhi	r0, [r4, #56]
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L62:
	cmp	fp, r8
	bls	.L65
	cmp	fp, r2
	movcc	r8, fp
	movcs	r8, r2
.L65:
	ldr	r3, [sp]
	mov	r0, #1000
	mov	r1, #0
	mul	r0, r0, r3
	mov	r3, r1
	mul	r0, r8, r0
	blx	r6
	mov	r6, r0
	b	.L61
.L66:
	cmp	r6, r3
	movcc	r6, r3
	b	.L67
.L75:
	ldr	r0, [r4, #56]
	blx	r5
	str	r0, [sp, #12]
	b	.L68
.L73:
	ldr	r0, [r4, #56]
	blx	r5
	mov	r6, r0
	b	.L61
.L72:
	ldr	r0, [r4, #56]
	blx	r5
	ldr	r3, [r9, #8]
	str	r0, [sp, #8]
	cmp	r7, r3
	bcs	.L57
	ldr	r3, [sp, #4]
	ldr	r2, [r9, #12]
	rsb	r7, r3, r7
	ldr	r3, [r4, #52]
	cmp	r7, r2
	bhi	.L76
.L59:
	mov	r0, r3
	blx	r5
	str	r0, [sp, #8]
	b	.L57
.L70:
	mov	r2, r1
	mov	ip, r1
	b	.L52
.L74:
	movw	r3, #:lower16:step_down
	mov	r0, r4
	movt	r3, #:upper16:step_down
	mov	r1, #1
	blx	r3
	b	.L64
.L76:
	sub	r0, r0, #1
	add	r1, sp, #16
	movw	r3, #:lower16:opp_find_freq_floor
	str	r0, [r1, #-8]!
	movt	r3, #:upper16:opp_find_freq_floor
	ldr	r0, [r4, #4]
	blx	r3
	mov	r3, r0
	b	.L59
	.fnend
	.size	exynos4x12_monitor, .-exynos4x12_monitor
	.align	2
	.global	exynos4x12_init
	.type	exynos4x12_init, %function
exynos4x12_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r4, #:lower16:samsung_cpu_id
	movt	r4, #:upper16:samsung_cpu_id
	movw	r2, #6984
	.pad #16
	sub	sp, sp, #16
	movt	r2, 6
	ldr	r3, [r4]
	mov	ip, #0
	mov	r6, r0
	mov	r7, r1
	stmib	sp, {r2, ip}
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmn	r3, #465567744
	beq	.L123
.L78:
	ldr	r2, .L131
	movw	r4, #:lower16:.LANCHOR1
	movt	r4, #:upper16:.LANCHOR1
	add	r1, r2, #168
	str	r2, [r4, #12]
	str	r1, [r4, #16]
.L80:
	mov	r2, #0
	movt	r2, 17186
	cmp	r3, r2
	ldreq	r3, .L131+4
	beq	.L121
	cmn	r3, #465567744
	bne	.L83
	movw	r3, #:lower16:samsung_rev
	movt	r3, #:upper16:samsung_rev
	blx	r3
	cmp	r0, #31
	bls	.L84
	ldr	r3, .L131+8
	mov	r2, #30
	str	r2, [r4, #28]
	add	r2, r3, #364
	stmib	r4, {r2, r3}
	b	.L82
.L84:
	movw	r3, #:lower16:exynos_armclk_max
	movw	r2, #16960
	movt	r3, #:upper16:exynos_armclk_max
	movt	r2, 15
	ldr	r3, [r3]
	cmp	r3, r2
	ldreq	r3, .L131+12
	ldrne	r3, .L131+16
.L121:
	mov	r2, #30
	str	r2, [r4, #28]
	add	r2, r3, #336
	stmib	r4, {r2, r3}
.L82:
	mov	r2, #4096
	mov	r1, #0
	movt	r2, 65041
	movt	r1, 65041
	ldr	r0, [r2, #148]
	ldr	r3, .L131+20
	orr	r0, r0, #1
	str	r0, [r4, #24]
	add	r8, r3, #168
	str	r0, [r2, #148]
	ldr	r1, [r1, #1280]
	ldr	ip, [r4, #12]
.L88:
	ldr	lr, [r3]
	movw	r2, #34952
	ldr	r0, [r3, #4]
	movt	r2, 65416
	and	r2, r1, r2
	ldr	r1, [r3, #8]
	orr	r2, r2, lr
	ldr	r5, [r3, #12]
	ldr	lr, [r3, #16]
	add	r3, r3, #24
	orr	r2, r2, r0, asl #4
	ldr	r0, [r3, #-4]
	cmp	r3, r8
	orr	r1, r2, r1, asl #8
	add	ip, ip, #24
	orr	r1, r1, r5, asl #12
	orr	r1, r1, lr, asl #16
	orr	r1, r1, r0, asl #20
	str	r1, [ip, #-8]
	bne	.L88
	movw	r3, #:lower16:exynos_result_of_asv
	movw	r0, #:lower16:.LC3
	movt	r3, #:upper16:exynos_result_of_asv
	movw	r8, #:lower16:printk
	ldr	r1, [r3]
	movt	r0, #:upper16:.LC3
	movt	r8, #:upper16:printk
	cmp	r1, #255
	moveq	r3, #0
	strne	r1, [r4]
	moveq	r1, r3
	streq	r3, [r4]
	movw	r3, #:lower16:exynos_special_flag
	movt	r3, #:upper16:exynos_special_flag
	ldr	r3, [r3]
	tst	r3, #1
	movne	r2, #1
	strneb	r2, [r4, #32]
	tst	r3, #2
	movne	r3, #1
	strneb	r3, [r4, #33]
	blx	r8
	ldr	r2, [r4]
	mov	r3, #0
	ldmib	r4, {r1, ip}
	ldr	r0, [r4, #12]
	ldrb	r5, [r4, #32]	@ zero_extendqisi2
	rsb	r2, r2, r2, asl #3
	ldrb	lr, [r4, #33]	@ zero_extendqisi2
	mov	r9, r2, asl #2
	mov	r2, r0
	add	ip, ip, r9
	add	r9, r1, r9
.L97:
	ldr	r1, [ip, r3]
	cmp	r5, #0
	add	r2, r2, #24
	addne	r1, r1, #49920
	addne	r1, r1, #80
	cmp	lr, #0
	str	r1, [r2, #-16]
	ldrne	r1, [r9, r3]
	addne	r1, r1, #24832
	addne	r1, r1, #168
	strne	r1, [r9, r3]
	add	r3, r3, #4
	cmp	r3, #28
	bne	.L97
	movw	r9, #:lower16:opp_add
	mov	r5, #0
	movt	r9, #:upper16:opp_add
	b	.L100
.L125:
	ldr	r0, [r4, #12]
.L100:
	add	r3, r0, r5
	mov	r0, r6
	ldr	r1, [r3, #4]
	add	r5, r5, #24
	ldr	r2, [r3, #8]
	blx	r9
	subs	r10, r0, #0
	bne	.L124
	cmp	r5, #168
	bne	.L125
	movw	r3, #:lower16:samsung_rev
	movt	r3, #:upper16:samsung_rev
	blx	r3
	cmp	r0, #31
	bhi	.L126
.L101:
	ldr	r2, [r4, #12]
	mov	r1, #7
	movw	r3, #:lower16:opp_find_freq_floor
	str	r1, [r7, #80]
	movt	r3, #:upper16:opp_find_freq_floor
	add	r1, sp, #4
	str	r2, [r7, #84]
	mov	r0, r6
	movw	r4, #:lower16:opp_find_freq_ceil
	blx	r3
	movt	r4, #:upper16:opp_find_freq_ceil
	str	r0, [r7, #56]
	add	r1, sp, #8
	mov	r0, r6
	blx	r4
	movw	r1, #:lower16:.LC5
	movw	r3, #:lower16:clk_get
	str	r0, [r7, #60]
	movt	r1, #:upper16:.LC5
	movt	r3, #:upper16:clk_get
	mov	r0, #0
	blx	r3
	cmn	r0, #4096
	mov	r9, r0
	bhi	.L127
	movw	r3, #:lower16:clk_get_rate
	add	r5, sp, #16
	movt	r3, #:upper16:clk_get_rate
	blx	r3
	movw	r2, #19923
	mov	r1, r0
	movt	r2, 4194
	movw	r3, #:lower16:clk_put
	umull	ip, r2, r2, r1
	mov	r0, r9
	movt	r3, #:upper16:clk_put
	mov	r2, r2, lsr #6
	str	r2, [r5, #-4]!
	blx	r3
	mov	r0, r6
	mov	r1, r5
	blx	r4
	str	r0, [r7, #52]
.L103:
	movw	r1, #:lower16:.LC7
	movw	r4, #:lower16:regulator_get
	movt	r1, #:upper16:.LC7
	movt	r4, #:upper16:regulator_get
	mov	r0, #0
	blx	r4
	cmn	r0, #4096
	str	r0, [r7, #64]
	bhi	.L128
	movw	r1, #:lower16:.LC9
	mov	r0, #0
	movt	r1, #:upper16:.LC9
	blx	r4
	cmn	r0, #4096
	str	r0, [r7, #68]
	bhi	.L129
	movw	r2, #:lower16:exynos4x12_busfreq_cpufreq_transition
	mov	r0, r7
	movt	r2, #:upper16:exynos4x12_busfreq_cpufreq_transition
	movw	r3, #:lower16:cpufreq_register_notifier
	str	r2, [r0, #204]!
	movt	r3, #:upper16:cpufreq_register_notifier
	mov	r1, #0
	blx	r3
	cmp	r0, #0
	bne	.L130
.L106:
	movw	r2, #:lower16:exynos4x12_bus_qos_notifiy
	mov	r1, r7
	movt	r2, #:upper16:exynos4x12_bus_qos_notifiy
	movw	r3, #:lower16:pm_qos_add_notifier
	str	r2, [r1, #216]!
	movt	r3, #:upper16:pm_qos_add_notifier
	mov	r0, #6
	blx	r3
	mov	r0, #0
.L86:
	add	sp, sp, #16
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L124:
	movw	r1, #:lower16:.LC4
	movw	r3, #:lower16:dev_err
	mov	r0, r6
	movt	r1, #:upper16:.LC4
	movt	r3, #:upper16:dev_err
	blx	r3
	mov	r0, r10
	add	sp, sp, #16
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L126:
	movw	r1, #47077
	movw	r3, #:lower16:opp_disable
	movt	r3, #:upper16:opp_disable
	movt	r1, 6
	mov	r0, r6
	blx	r3
	movw	r3, #47004
	movt	r3, 6
	str	r3, [sp, #4]
	b	.L101
.L123:
	movw	r3, #:lower16:samsung_rev
	movt	r3, #:upper16:samsung_rev
	blx	r3
	ldr	r3, [r4]
	cmp	r0, #31
	movls	r3, r3, lsr #17
	movls	r3, r3, asl #17
	bls	.L78
	ldr	r2, .L131+24
	movw	r4, #:lower16:.LANCHOR1
	mov	r3, r3, lsr #17
	movt	r4, #:upper16:.LANCHOR1
	add	r1, r2, #168
	mov	r3, r3, asl #17
	str	r1, [r4, #16]
	str	r2, [r4, #12]
	b	.L80
.L129:
	movw	r0, #:lower16:.LC8
	movw	r1, #:lower16:.LC9
	movt	r1, #:upper16:.LC9
	movt	r0, #:upper16:.LC8
	blx	r8
	movw	r3, #:lower16:regulator_put
	ldr	r0, [r7, #64]
	movt	r3, #:upper16:regulator_put
	blx	r3
	mvn	r0, #18
	b	.L86
.L83:
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC2
	movt	r3, #:upper16:printk
	blx	r3
	mvn	r0, #21
	b	.L86
.L128:
	movw	r0, #:lower16:.LC8
	movw	r1, #:lower16:.LC7
	movt	r0, #:upper16:.LC8
	movt	r1, #:upper16:.LC7
	blx	r8
	mvn	r0, #18
	b	.L86
.L127:
	movw	r0, #:lower16:.LC6
	movt	r0, #:upper16:.LC6
	blx	r8
	ldr	r3, [r7, #56]
	str	r3, [r7, #52]
	b	.L103
.L130:
	movw	r0, #:lower16:.LC10
	movt	r0, #:upper16:.LC10
	blx	r8
	b	.L106
.L132:
	.align	2
.L131:
	.word	.LANCHOR2+412
	.word	.LANCHOR2+804
	.word	.LANCHOR2+1476
	.word	.LANCHOR2+2204
	.word	.LANCHOR2+2876
	.word	.LANCHOR0+564
	.word	.LANCHOR2+20
	.fnend
	.size	exynos4x12_init, .-exynos4x12_init
	.global	load_history_size
	.global	dmc_max_threshold
	.global	cpu_slope_size
	.global	max_cpu_threshold
	.global	up_cpu_threshold
	.global	idle_threshold
	.global	ppmu_threshold
	.global	up_threshold
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.19405, %object
	.size	__func__.19405, 32
__func__.19405:
	.ascii	"exynos4x12_find_busfreq_by_volt\000"
	.type	clkdiv_dmc1, %object
	.size	clkdiv_dmc1, 168
clkdiv_dmc1:
	.word	3
	.word	1
	.word	1
	.space	12
	.word	3
	.word	1
	.word	1
	.space	12
	.word	4
	.word	2
	.word	1
	.space	12
	.word	4
	.word	2
	.word	1
	.space	12
	.word	5
	.word	4
	.word	1
	.space	12
	.word	5
	.word	5
	.word	1
	.space	12
	.word	7
	.word	7
	.word	1
	.space	12
	.type	clkdiv_top, %object
	.size	clkdiv_top, 140
clkdiv_top:
	.word	2
	.word	7
	.word	4
	.word	5
	.word	1
	.word	2
	.word	7
	.word	4
	.word	5
	.word	1
	.word	2
	.word	7
	.word	4
	.word	5
	.word	1
	.word	4
	.word	7
	.word	5
	.word	7
	.word	1
	.word	4
	.word	7
	.word	5
	.word	7
	.word	1
	.word	5
	.word	7
	.word	5
	.word	7
	.word	1
	.word	7
	.word	7
	.word	7
	.word	7
	.word	1
	.type	clkdiv_l_bus, %object
	.size	clkdiv_l_bus, 56
clkdiv_l_bus:
	.word	3
	.word	1
	.word	3
	.word	1
	.word	3
	.word	1
	.word	4
	.word	1
	.word	4
	.word	1
	.word	5
	.word	1
	.word	7
	.word	1
	.type	clkdiv_r_bus, %object
	.size	clkdiv_r_bus, 56
clkdiv_r_bus:
	.word	2
	.word	1
	.word	3
	.word	1
	.word	3
	.word	1
	.word	4
	.word	1
	.word	4
	.word	1
	.word	5
	.word	1
	.word	7
	.word	1
	.type	clkdiv_sclkip, %object
	.size	clkdiv_sclkip, 84
clkdiv_sclkip:
	.word	3
	.word	3
	.word	4
	.word	3
	.word	3
	.word	4
	.word	3
	.word	3
	.word	4
	.word	4
	.word	4
	.word	5
	.word	4
	.word	4
	.word	5
	.word	5
	.word	5
	.word	5
	.word	7
	.word	7
	.word	7
	.type	exynos4x12_timingrow, %object
	.size	exynos4x12_timingrow, 28
exynos4x12_timingrow:
	.word	877233809
	.word	877233809
	.word	608732304
	.word	608732304
	.word	357073616
	.word	357073616
	.word	222855696
	.type	clkdiv_dmc0, %object
	.size	clkdiv_dmc0, 168
clkdiv_dmc0:
	.word	3
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	3
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	4
	.word	1
	.word	1
	.word	2
	.word	1
	.word	1
	.word	4
	.word	1
	.word	1
	.word	2
	.word	1
	.word	1
	.word	5
	.word	1
	.word	1
	.word	4
	.word	1
	.word	1
	.word	5
	.word	1
	.word	1
	.word	5
	.word	1
	.word	1
	.word	7
	.word	1
	.word	1
	.word	7
	.word	1
	.word	1
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_exynos4x12_find_busfreq_by_volt, %object
	.size	__kstrtab_exynos4x12_find_busfreq_by_volt, 32
__kstrtab_exynos4x12_find_busfreq_by_volt:
	.ascii	"exynos4x12_find_busfreq_by_volt\000"
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	load_history_size, %object
	.size	load_history_size, 4
load_history_size:
	.word	5
	.type	up_cpu_threshold, %object
	.size	up_cpu_threshold, 4
up_cpu_threshold:
	.word	11
	.type	max_cpu_threshold, %object
	.size	max_cpu_threshold, 4
max_cpu_threshold:
	.word	20
	.type	cpu_slope_size, %object
	.size	cpu_slope_size, 4
cpu_slope_size:
	.word	7
	.type	idle_threshold, %object
	.size	idle_threshold, 4
idle_threshold:
	.word	4
	.type	exynos4_busfreq_table_rev2, %object
	.size	exynos4_busfreq_table_rev2, 168
exynos4_busfreq_table_rev2:
	.word	0
	.word	440293
	.word	1100000
	.word	0
	.word	0
	.word	0
	.word	1
	.word	440220
	.word	1100000
	.word	0
	.word	0
	.word	0
	.word	2
	.word	293220
	.word	1000000
	.word	0
	.word	0
	.word	0
	.word	3
	.word	293176
	.word	1000000
	.word	0
	.word	0
	.word	0
	.word	4
	.word	176176
	.word	950000
	.word	0
	.word	0
	.word	0
	.word	5
	.word	147147
	.word	950000
	.word	0
	.word	0
	.word	0
	.word	6
	.word	110110
	.word	950000
	.word	0
	.word	0
	.word	0
	.type	exynos4_qos_value_rev2, %object
	.size	exynos4_qos_value_rev2, 224
exynos4_qos_value_rev2:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	6
	.word	3
	.word	6
	.word	14
	.word	6
	.word	3
	.word	6
	.word	14
	.word	3
	.word	3
	.word	3
	.word	14
	.word	3
	.word	3
	.word	3
	.word	14
	.word	2
	.word	3
	.word	2
	.word	14
	.word	6
	.word	11
	.word	6
	.word	15
	.word	6
	.word	11
	.word	6
	.word	15
	.word	6
	.word	11
	.word	6
	.word	15
	.word	6
	.word	11
	.word	6
	.word	15
	.word	6
	.word	3
	.word	6
	.word	14
	.word	4
	.word	3
	.word	4
	.word	14
	.word	3
	.word	11
	.word	0
	.word	0
	.type	exynos4_busfreq_table_orig, %object
	.size	exynos4_busfreq_table_orig, 168
exynos4_busfreq_table_orig:
	.word	0
	.word	400266
	.word	1100000
	.word	0
	.word	0
	.word	0
	.word	1
	.word	400200
	.word	1100000
	.word	0
	.word	0
	.word	0
	.word	2
	.word	267200
	.word	1000000
	.word	0
	.word	0
	.word	0
	.word	3
	.word	267160
	.word	1000000
	.word	0
	.word	0
	.word	0
	.word	4
	.word	160160
	.word	950000
	.word	0
	.word	0
	.word	0
	.word	5
	.word	133133
	.word	950000
	.word	0
	.word	0
	.word	0
	.word	6
	.word	100100
	.word	950000
	.word	0
	.word	0
	.word	0
	.type	exynos4_qos_value_orig, %object
	.size	exynos4_qos_value_orig, 224
exynos4_qos_value_orig:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	6
	.word	3
	.word	6
	.word	14
	.word	4
	.word	3
	.word	4
	.word	14
	.word	3
	.word	11
	.word	0
	.word	0
	.word	6
	.word	11
	.word	6
	.word	15
	.word	6
	.word	11
	.word	6
	.word	15
	.word	6
	.word	11
	.word	6
	.word	15
	.word	6
	.word	11
	.word	6
	.word	15
	.word	6
	.word	3
	.word	6
	.word	14
	.word	4
	.word	3
	.word	4
	.word	14
	.word	3
	.word	11
	.word	0
	.word	0
	.type	exynos4212_mif_volt, %object
	.size	exynos4212_mif_volt, 336
exynos4212_mif_volt:
	.word	1012500
	.word	1012500
	.word	962500
	.word	962500
	.word	912500
	.word	912500
	.word	912500
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1050000
	.word	1050000
	.word	1000000
	.word	1000000
	.word	900000
	.word	900000
	.word	900000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	850000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	850000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	850000
	.word	850000
	.word	937500
	.word	937500
	.word	887500
	.word	887500
	.word	887500
	.word	850000
	.word	850000
	.type	exynos4212_int_volt, %object
	.size	exynos4212_int_volt, 336
exynos4212_int_volt:
	.word	1300000
	.word	1250000
	.word	1250000
	.word	950000
	.word	950000
	.word	912500
	.word	887500
	.word	1062500
	.word	1012500
	.word	1012500
	.word	937500
	.word	937500
	.word	900000
	.word	875000
	.word	1050000
	.word	1000000
	.word	1000000
	.word	925000
	.word	925000
	.word	887500
	.word	875000
	.word	1050000
	.word	1000000
	.word	1000000
	.word	912500
	.word	912500
	.word	887500
	.word	875000
	.word	1062500
	.word	1012500
	.word	1012500
	.word	925000
	.word	925000
	.word	900000
	.word	875000
	.word	1050000
	.word	1000000
	.word	1000000
	.word	925000
	.word	925000
	.word	887500
	.word	875000
	.word	1050000
	.word	1000000
	.word	1000000
	.word	912500
	.word	912500
	.word	887500
	.word	875000
	.word	1037500
	.word	987500
	.word	987500
	.word	912500
	.word	912500
	.word	875000
	.word	875000
	.word	1037500
	.word	987500
	.word	987500
	.word	900000
	.word	900000
	.word	875000
	.word	875000
	.word	1037500
	.word	987500
	.word	987500
	.word	900000
	.word	900000
	.word	875000
	.word	875000
	.word	1037500
	.word	987500
	.word	987500
	.word	900000
	.word	900000
	.word	862500
	.word	850000
	.word	1035000
	.word	975000
	.word	975000
	.word	887500
	.word	887500
	.word	850000
	.word	850000
	.type	exynos4412_mif_volt_rev2, %object
	.size	exynos4412_mif_volt_rev2, 364
exynos4412_mif_volt_rev2:
	.word	1100000
	.word	1100000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	950000
	.word	1100000
	.word	1100000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	950000
	.word	1100000
	.word	1100000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	900000
	.word	1100000
	.word	1100000
	.word	1000000
	.word	1000000
	.word	950000
	.word	900000
	.word	900000
	.word	1050000
	.word	1050000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1050000
	.word	1050000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1050000
	.word	1050000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1050000
	.word	1050000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	850000
	.word	1050000
	.word	1050000
	.word	950000
	.word	950000
	.word	900000
	.word	850000
	.word	850000
	.word	1000000
	.word	1000000
	.word	900000
	.word	900000
	.word	850000
	.word	850000
	.word	850000
	.word	1000000
	.word	1000000
	.word	900000
	.word	900000
	.word	850000
	.word	850000
	.word	850000
	.word	1000000
	.word	1000000
	.word	900000
	.word	900000
	.word	850000
	.word	850000
	.word	850000
	.word	950000
	.word	950000
	.word	850000
	.word	850000
	.word	850000
	.word	850000
	.word	850000
	.type	exynos4412_int_volt_rev2, %object
	.size	exynos4412_int_volt_rev2, 364
exynos4412_int_volt_rev2:
	.word	1087500
	.word	1062500
	.word	1062500
	.word	1000000
	.word	1000000
	.word	962500
	.word	950000
	.word	1075000
	.word	1050000
	.word	1050000
	.word	987500
	.word	987500
	.word	950000
	.word	937500
	.word	1062500
	.word	1037500
	.word	1037500
	.word	975000
	.word	975000
	.word	937500
	.word	912500
	.word	1050000
	.word	1037500
	.word	1037500
	.word	975000
	.word	975000
	.word	937500
	.word	900000
	.word	1037500
	.word	1025000
	.word	1025000
	.word	962500
	.word	962500
	.word	925000
	.word	887500
	.word	1025000
	.word	1012500
	.word	1012500
	.word	950000
	.word	950000
	.word	912500
	.word	887500
	.word	1012500
	.word	1000000
	.word	1000000
	.word	937500
	.word	937500
	.word	900000
	.word	887500
	.word	1000000
	.word	987500
	.word	987500
	.word	925000
	.word	925000
	.word	887500
	.word	875000
	.word	1037500
	.word	975000
	.word	975000
	.word	912500
	.word	912500
	.word	875000
	.word	875000
	.word	1025000
	.word	962500
	.word	962500
	.word	900000
	.word	900000
	.word	875000
	.word	875000
	.word	1012500
	.word	937500
	.word	937500
	.word	875000
	.word	875000
	.word	850000
	.word	850000
	.word	1000000
	.word	925000
	.word	925000
	.word	862500
	.word	862500
	.word	850000
	.word	850000
	.word	1000000
	.word	912500
	.word	912500
	.word	850000
	.word	850000
	.word	850000
	.word	850000
	.type	exynos4412_1ghz_mif_volt, %object
	.size	exynos4412_1ghz_mif_volt, 336
exynos4412_1ghz_mif_volt:
	.word	1100000
	.word	1100000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	950000
	.word	1050000
	.word	1050000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	950000
	.word	1050000
	.word	1050000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	950000
	.word	1050000
	.word	1050000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	950000
	.word	1050000
	.word	1050000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1050000
	.word	1050000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1050000
	.word	1050000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1025000
	.word	1025000
	.word	925000
	.word	925000
	.word	925000
	.word	925000
	.word	875000
	.type	exynos4412_1ghz_int_volt, %object
	.size	exynos4412_1ghz_int_volt, 336
exynos4412_1ghz_int_volt:
	.word	0
	.word	1087500
	.word	1087500
	.word	1000000
	.word	1000000
	.word	975000
	.word	950000
	.word	0
	.word	1050000
	.word	1050000
	.word	1000000
	.word	1000000
	.word	975000
	.word	950000
	.word	0
	.word	1050000
	.word	1050000
	.word	1000000
	.word	1000000
	.word	975000
	.word	950000
	.word	0
	.word	1050000
	.word	1050000
	.word	1000000
	.word	1000000
	.word	975000
	.word	950000
	.word	0
	.word	1037500
	.word	1037500
	.word	950000
	.word	950000
	.word	925000
	.word	900000
	.word	0
	.word	1037500
	.word	1037500
	.word	950000
	.word	950000
	.word	925000
	.word	900000
	.word	0
	.word	1037500
	.word	1037500
	.word	950000
	.word	950000
	.word	925000
	.word	900000
	.word	0
	.word	1012500
	.word	1012500
	.word	937500
	.word	937500
	.word	887500
	.word	875000
	.word	0
	.word	1012500
	.word	1012500
	.word	937500
	.word	937500
	.word	887500
	.word	875000
	.word	0
	.word	1012500
	.word	1012500
	.word	937500
	.word	937500
	.word	887500
	.word	875000
	.word	0
	.word	1012500
	.word	1012500
	.word	937500
	.word	937500
	.word	887500
	.word	875000
	.word	0
	.word	1000000
	.word	1000000
	.word	912500
	.word	912500
	.word	875000
	.word	875000
	.type	exynos4412_mif_volt, %object
	.size	exynos4412_mif_volt, 336
exynos4412_mif_volt:
	.word	1100000
	.word	1100000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	950000
	.word	1050000
	.word	1050000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1050000
	.word	1050000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1050000
	.word	1050000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1050000
	.word	1050000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	900000
	.word	1000000
	.word	1000000
	.word	950000
	.word	950000
	.word	900000
	.word	900000
	.word	850000
	.word	1000000
	.word	1000000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	850000
	.word	1000000
	.word	1000000
	.word	900000
	.word	900000
	.word	900000
	.word	900000
	.word	850000
	.type	exynos4412_int_volt, %object
	.size	exynos4412_int_volt, 336
exynos4412_int_volt:
	.word	1112500
	.word	1062500
	.word	1062500
	.word	975000
	.word	975000
	.word	937500
	.word	900000
	.word	1100000
	.word	1050000
	.word	1050000
	.word	962500
	.word	962500
	.word	925000
	.word	887500
	.word	1075000
	.word	1025000
	.word	1025000
	.word	937500
	.word	937500
	.word	912500
	.word	875000
	.word	1062500
	.word	1012500
	.word	1012500
	.word	937500
	.word	937500
	.word	900000
	.word	862500
	.word	1062500
	.word	1012500
	.word	1012500
	.word	925000
	.word	925000
	.word	900000
	.word	862500
	.word	1050000
	.word	1000000
	.word	1000000
	.word	925000
	.word	925000
	.word	887500
	.word	850000
	.word	1050000
	.word	1000000
	.word	1000000
	.word	912500
	.word	912500
	.word	875000
	.word	850000
	.word	1037500
	.word	987500
	.word	987500
	.word	912500
	.word	912500
	.word	862500
	.word	850000
	.word	1037500
	.word	987500
	.word	987500
	.word	900000
	.word	900000
	.word	862500
	.word	850000
	.word	1037500
	.word	987500
	.word	987500
	.word	900000
	.word	900000
	.word	862500
	.word	850000
	.word	1037500
	.word	987500
	.word	987500
	.word	900000
	.word	900000
	.word	862500
	.word	850000
	.word	1025000
	.word	975000
	.word	975000
	.word	887500
	.word	887500
	.word	850000
	.word	850000
	.type	ppmu_threshold, %object
	.size	ppmu_threshold, 4
ppmu_threshold:
	.word	5
	.type	up_threshold, %object
	.size	up_threshold, 4
up_threshold:
	.word	30
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>%s: req_volt has no value.\012\000"
	.space	1
.LC1:
	.ascii	"<3>%s: %u volt can't support\012\000"
	.space	2
.LC2:
	.ascii	"<3>Unsupported model.\012\000"
	.space	1
.LC3:
	.ascii	"<6>DVFS : VDD_INT Voltage table set with %d Group\012"
	.ascii	"\000"
	.space	1
.LC4:
	.ascii	"Fail to add opp entries.\012\000"
	.space	2
.LC5:
	.ascii	"sclk_dmc\000"
	.space	3
.LC6:
	.ascii	"<3>Failed to get sclk_dmc.!\012\000"
	.space	3
.LC7:
	.ascii	"vdd_int\000"
.LC8:
	.ascii	"<3>failed to get resource %s\012\000"
	.space	2
.LC9:
	.ascii	"vdd_mif\000"
.LC10:
	.ascii	"<3>Falied to register cpufreq notifier\012\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	asv_group_index, %object
	.size	asv_group_index, 4
asv_group_index:
	.space	4
	.type	exynos4_int_volt, %object
	.size	exynos4_int_volt, 4
exynos4_int_volt:
	.space	4
	.type	exynos4_mif_volt, %object
	.size	exynos4_mif_volt, 4
exynos4_mif_volt:
	.space	4
	.type	exynos4_busfreq_table, %object
	.size	exynos4_busfreq_table, 4
exynos4_busfreq_table:
	.space	4
	.type	exynos4_qos_value, %object
	.size	exynos4_qos_value, 4
exynos4_qos_value:
	.space	4
	.type	busfreq_qos, %object
	.size	busfreq_qos, 4
busfreq_qos:
	.space	4
	.type	dmc_pause_ctrl, %object
	.size	dmc_pause_ctrl, 4
dmc_pause_ctrl:
	.space	4
	.type	dmc_max_threshold, %object
	.size	dmc_max_threshold, 4
dmc_max_threshold:
	.space	4
	.type	mif_locking, %object
	.size	mif_locking, 1
mif_locking:
	.space	1
	.type	int_locking, %object
	.size	int_locking, 1
int_locking:
	.space	1
	.section	___ksymtab_gpl+exynos4x12_find_busfreq_by_volt,"a",%progbits
	.align	2
	.type	__ksymtab_exynos4x12_find_busfreq_by_volt, %object
	.size	__ksymtab_exynos4x12_find_busfreq_by_volt, 8
__ksymtab_exynos4x12_find_busfreq_by_volt:
	.word	exynos4x12_find_busfreq_by_volt
	.word	__kstrtab_exynos4x12_find_busfreq_by_volt
	.ident	"GCC: (GNU) 4.8"
