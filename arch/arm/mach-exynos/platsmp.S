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
	.file	"platsmp.c"

	.text
	.align	2
	.type	write_pen_release, %function
write_pen_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:.LANCHOR0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r3, #:upper16:.LANCHOR0
	str	r0, [r3]
@ 65 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/platsmp.c" 1
	dmb
@ 0 "" 2
	movw	r3, #:lower16:cpu_cache
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	movt	r3, #:upper16:cpu_cache
	ldr	r3, [r3, #28]
	mov	r0, r4
	mov	r1, #4
	blx	r3
	movw	r3, #:lower16:outer_cache
	add	r1, r4, #4
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #4]
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r1, r1, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r0, r4, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	cmp	r3, #0
	ldmeqfd	sp!, {r4, pc}
	blx	r3
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	write_pen_release, .-write_pen_release
	.align	2
	.global	platform_secondary_init
	.type	platform_secondary_init, %function
platform_secondary_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:samsung_cpu_id
	movt	r3, #:upper16:samsung_cpu_id
	mov	r2, #0
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L8
	cmn	r3, #465567744
	beq	.L8
.L9:
	movw	r3, #:lower16:gic_secondary_init
	mov	r0, #0
	movt	r3, #:upper16:gic_secondary_init
	blx	r3
	mvn	r0, #0
	bl	write_pen_release
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:_raw_spin_lock
	movt	r0, #:upper16:.LANCHOR1
	movt	r3, #:upper16:_raw_spin_lock
	blx	r3
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:_raw_spin_unlock
	movt	r0, #:upper16:.LANCHOR1
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	ldmfd	sp!, {r3, pc}
.L8:
@ 382 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cacheflush.h" 1
	mrc p15, 0, r2, c1, c0, 1

@ 0 "" 2
	movw	ip, #:lower16:exynos_smc
	orr	r2, r2, #8
	movt	ip, #:upper16:exynos_smc
	movw	r1, #1025
	mov	r3, #0
	mvn	r0, #100
	blx	ip
	b	.L9
	.fnend
	.size	platform_secondary_init, .-platform_secondary_init
	.align	2
	.global	boot_secondary
	.type	boot_secondary, %function
boot_secondary:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r10, #:lower16:.LANCHOR1
	movt	r10, #:upper16:.LANCHOR1
	mov	fp, r0, asl #3
	movw	r3, #:lower16:_raw_spin_lock
	movt	r3, #:upper16:_raw_spin_lock
	.pad #12
	sub	sp, sp, #12
	mov	r4, r0
	mov	r0, r10
	blx	r3
	add	r3, r10, fp
	ldr	r6, [r3, #8]
	ldr	r3, [r6]
	tst	r3, #3
	bne	.L11
	movw	r7, #:lower16:__const_udelay
	mov	r5, #10
	movt	r7, #:upper16:__const_udelay
	mov	r3, #3
	str	r3, [r6]
.L13:
	ldr	r3, [r6, #4]
	movw	r0, #12560
	movt	r0, 4915
	and	r3, r3, #3
	cmp	r3, #3
	beq	.L11
	blx	r7
	subs	r5, r5, #1
	bne	.L13
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	mov	r1, r4
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:_raw_spin_unlock
	movt	r0, #:upper16:.LANCHOR1
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	mvn	r0, #109
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L11:
	movw	r3, #:lower16:__cpu_logical_map
	movw	r5, #:lower16:jiffies
	movt	r3, #:upper16:__cpu_logical_map
	movt	r5, #:upper16:jiffies
	ldr	r0, [r3, r4, asl #2]
	bl	write_pen_release
	ldr	r2, [r5]
	ldr	r3, [r5]
	add	r2, r2, #300
	rsb	r3, r2, r3
	str	r2, [sp, #4]
	cmp	r3, #0
	movwge	r6, #:lower16:.LANCHOR0
	movtge	r6, #:upper16:.LANCHOR0
	bge	.L20
	movw	r2, #:lower16:__const_udelay
	movw	r3, #:lower16:exynos_secondary_startup
	movw	r8, #:lower16:samsung_cpu_id
	movw	r9, #:lower16:exynos_smc
	movw	r7, #:lower16:smp_send_reschedule
	movw	r6, #:lower16:.LANCHOR0
	movt	r2, #:upper16:__const_udelay
	add	r10, r10, fp
	movt	r3, #:upper16:exynos_secondary_startup
	movt	r8, #:upper16:samsung_cpu_id
	movt	r9, #:upper16:exynos_smc
	movt	r7, #:upper16:smp_send_reschedule
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	fp, r3, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	movt	r6, #:upper16:.LANCHOR0
	str	r2, [sp]
	b	.L21
.L16:
	ldr	r2, [sp]
	blx	r2
	ldr	r3, [r5]
	ldr	r2, [sp, #4]
	rsb	r3, r2, r3
	cmp	r3, #0
	bge	.L20
.L21:
@ 183 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/platsmp.c" 1
	dmb
@ 0 "" 2
	ldr	ip, [r10, #12]
	mov	r1, #0
	mov	r3, r1
	mov	r2, r1
	mvn	r0, #3
	str	fp, [ip]
	ldr	ip, [r8]
	mov	ip, ip, lsr #17
	mov	ip, ip, asl #17
	cmn	ip, #465567744
	moveq	r1, r4
	blx	r9
	mov	r0, r4
	blx	r7
	ldr	r3, [r6]
	movw	r0, #9956
	movt	r0, 49
	cmn	r3, #1
	bne	.L16
.L20:
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:_raw_spin_unlock
	movt	r0, #:upper16:.LANCHOR1
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	ldr	r3, [r6]
	cmn	r3, #1
	mvnne	r0, #37
	moveq	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.fnend
	.size	boot_secondary, .-boot_secondary
	.align	2
	.global	smp_init_cpus
	.type	smp_init_cpus, %function
smp_init_cpus:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	movw	r3, #:lower16:scu_get_core_count
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r0, 65152
	movt	r3, #:upper16:scu_get_core_count
	blx	r3
	cmp	r0, #4
	mov	r5, r0
	bhi	.L35
	cmp	r0, #0
	beq	.L33
.L32:
	movw	r6, #:lower16:set_cpu_possible
	mov	r4, #0
	movt	r6, #:upper16:set_cpu_possible
.L31:
	mov	r1, #1
	mov	r0, r4
	add	r4, r4, r1
	blx	r6
	cmp	r5, r4
	bhi	.L31
.L33:
	movw	r0, #:lower16:gic_raise_softirq
	movw	r3, #:lower16:set_smp_cross_call
	movt	r0, #:upper16:gic_raise_softirq
	movt	r3, #:upper16:set_smp_cross_call
	blx	r3
	ldmfd	sp!, {r4, r5, r6, pc}
.L35:
	mov	r1, r0
	mov	r5, #4
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	mov	r2, r5
	movt	r0, #:upper16:.LC1
	blx	r3
	b	.L32
	.fnend
	.size	smp_init_cpus, .-smp_init_cpus
	.align	2
	.global	platform_smp_prepare_cpus
	.type	platform_smp_prepare_cpus, %function
platform_smp_prepare_cpus:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	subs	r5, r0, #0
	mov	r0, #0
	beq	.L37
	movw	r6, #:lower16:set_cpu_present
	mov	r4, r0
	movt	r6, #:upper16:set_cpu_present
.L39:
	add	r4, r4, #1
	mov	r1, #1
	blx	r6
	cmp	r4, r5
	mov	r0, r4
	bne	.L39
	mov	r0, #0
	movw	r3, #:lower16:scu_enable
	movt	r0, 65152
	movt	r3, #:upper16:scu_enable
	blx	r3
	cmp	r5, #1
	ldmlsfd	sp!, {r4, r5, r6, pc}
	movw	r3, #:lower16:samsung_cpu_id
	mov	r0, #8320
	movt	r3, #:upper16:samsung_cpu_id
	movt	r0, 65048
	ldr	r2, [r3]
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	str	r0, [r3, #16]
	mov	r2, r2, lsr #17
	mov	r2, r2, asl #17
	cmn	r2, #465567744
	moveq	r1, #32
	movne	r1, #28
	movt	r1, 65089
	cmp	r5, #2
	str	r1, [r3, #20]
	movw	r1, #:lower16:.LANCHOR1
	movt	r1, #:upper16:.LANCHOR1
	ldmlsfd	sp!, {r4, r5, r6, pc}
	cmn	r2, #465567744
	moveq	r0, #36
	movne	r0, #28
	movt	r0, 65089
	cmp	r5, #3
	str	r0, [r1, #28]
	mov	r0, #8448
	movt	r0, 65048
	movw	r1, #:lower16:.LANCHOR1
	str	r0, [r3, #24]
	movt	r1, #:upper16:.LANCHOR1
	ldmlsfd	sp!, {r4, r5, r6, pc}
	cmn	r2, #465567744
	movne	r2, #28
	moveq	r2, #40
	movt	r2, 65089
	str	r2, [r1, #36]
	mov	r2, #8576
	movt	r2, 65048
	str	r2, [r3, #32]
	ldmfd	sp!, {r4, r5, r6, pc}
.L37:
	movw	r3, #:lower16:scu_enable
	movt	r0, 65152
	movt	r3, #:upper16:scu_enable
	blx	r3
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	platform_smp_prepare_cpus, .-platform_smp_prepare_cpus
	.global	pen_release
	.global	cpu_boot_info
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	pen_release, %object
	.size	pen_release, 4
pen_release:
	.word	-1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>cpu%d power up failed\000"
	.space	3
.LC1:
	.ascii	"<4>EXYNOS: no. of cores (%d) greater than configure"
	.ascii	"d maximum of %d - clipping\012\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	boot_lock, %object
	.size	boot_lock, 8
boot_lock:
	.space	8
	.type	cpu_boot_info, %object
	.size	cpu_boot_info, 32
cpu_boot_info:
	.space	32
	.ident	"GCC: (GNU) 4.8"
