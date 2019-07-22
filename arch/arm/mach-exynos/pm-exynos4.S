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
	.file	"pm-exynos4.c"
	.text
	.align	2
	.type	exynos4_pm_add, %function
exynos4_pm_add:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	.save {r4}
	movw	r0, #:lower16:pm_cpu_prep
	movw	r4, #:lower16:exynos4_cpu_prepare
	movw	r1, #:lower16:pm_cpu_sleep
	movw	ip, #:lower16:exynos4_cpu_suspend
	movw	r3, #:lower16:pm_prepare
	movw	r2, #:lower16:exynos4_pm_prepare
	movt	r0, #:upper16:pm_cpu_prep
	movt	r4, #:upper16:exynos4_cpu_prepare
	movt	r1, #:upper16:pm_cpu_sleep
	movt	ip, #:upper16:exynos4_cpu_suspend
	movt	r3, #:upper16:pm_prepare
	movt	r2, #:upper16:exynos4_pm_prepare
	str	r4, [r0]
	str	ip, [r1]
	mov	r0, #0
	str	r2, [r3]
	ldr	r4, [sp], #4
	bx	lr
	.fnend
	.size	exynos4_pm_add, .-exynos4_pm_add
	.align	2
	.global	exynos4_cpu_suspend
	.type	exynos4_cpu_suspend, %function
exynos4_cpu_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r3, #0
	movt	r3, 65048
	ldr	r3, [r3, #36]
	cmp	r3, #0
	beq	.L3
	mov	r3, #0
	movw	r2, #61166
	movt	r3, 65041
	movt	r2, 65520
	ldr	r1, [r3, #2304]
	bic	r1, r1, #131072
	orr	r1, r1, #16
	str	r1, [r3, #2304]
	ldr	r1, [r3, #1284]
	orr	r1, r1, #3840
	str	r1, [r3, #1284]
	ldr	r1, [r3, #512]
	and	r2, r1, r2
	orr	r2, r2, #397312
	str	r2, [r3, #512]
.L3:
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L4
	blx	r3
.L4:
	mov	r1, #0
	movw	ip, #:lower16:exynos_smc
	mov	r2, r1
	mov	r3, r1
	movt	ip, #:upper16:exynos_smc
	mvn	r0, #2
	blx	ip
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_cpu_suspend, .-exynos4_cpu_suspend
	.align	2
	.type	exynos4_pm_drvinit, %function
exynos4_pm_drvinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:s3c_pm_init
	movt	r3, #:upper16:s3c_pm_init
	blx	r3
	mov	r2, #0
	movw	ip, #16383
	movt	r2, 65048
	movt	ip, 65048
	ldr	r1, [r2, #1544]
	mov	lr, #0
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:subsys_interface_register
	movt	r3, #:upper16:subsys_interface_register
	movt	r0, #:upper16:.LANCHOR0
	orr	r1, r1, #65280
	orr	r1, r1, #62
	str	r1, [r2, #1544]
	str	lr, [ip, #-3039]
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_pm_drvinit, .-exynos4_pm_drvinit
	.align	2
	.type	exynos4_pm_prepare, %function
exynos4_pm_prepare:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:regulator_suspend_prepare
	movt	r3, #:upper16:regulator_suspend_prepare
	mov	r0, #3
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_pm_prepare, .-exynos4_pm_prepare
	.align	2
	.type	exynos4_cpu_prepare, %function
exynos4_cpu_prepare:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L15
	blx	r3
.L15:
	movw	r3, #:lower16:exynos4_sys_powerdown_conf
	mov	r0, #2
	movt	r3, #:upper16:exynos4_sys_powerdown_conf
	blx	r3
	mov	r3, #0
	movw	r1, #2989
	movt	r3, 65089
	movw	r2, #:lower16:s3c_cpu_resume
	str	r1, [r3, #12]
	movt	r2, #:upper16:s3c_cpu_resume
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r2, r2, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	str	r2, [r3, #8]
@ 382 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cacheflush.h" 1
	mrc p15, 0, r2, c1, c0, 1

@ 0 "" 2
	movw	ip, #:lower16:exynos_smc
	bic	r2, r2, #8
	movt	ip, #:upper16:exynos_smc
	movw	r1, #1025
	mov	r3, #0
	mvn	r0, #100
	blx	ip
	movw	r3, #:lower16:s3c_pm_do_restore_core
	ldr	r0, .L19
	movt	r3, #:upper16:s3c_pm_do_restore_core
	mov	r1, #9
	blx	r3
	ldmfd	sp!, {r3, pc}
.L20:
	.align	2
.L19:
	.word	.LANCHOR0+24
	.fnend
	.size	exynos4_cpu_prepare, .-exynos4_cpu_prepare
	.align	2
	.type	exynos4_pm_syscore_init, %function
exynos4_pm_syscore_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:register_syscore_ops
	ldr	r0, .L22
	movt	r3, #:upper16:register_syscore_ops
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
.L23:
	.align	2
.L22:
	.word	.LANCHOR0+96
	.fnend
	.size	exynos4_pm_syscore_init, .-exynos4_pm_syscore_init
	.align	2
	.type	exynos4_pm_resume, %function
exynos4_pm_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r4, #0
	movt	r4, 65048
	ldr	r3, [r4, #512]
	tst	r3, #65536
	bne	.L25
	orr	r3, r3, #65536
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR2
	movw	r8, #:lower16:printk
	movw	r9, #:lower16:exynos_smc
	str	r3, [r4, #512]
	movt	r0, #:upper16:.LC0
	movt	r1, #:upper16:.LANCHOR2
	movt	r8, #:upper16:printk
	movt	r9, #:upper16:exynos_smc
	blx	r8
.L30:
	movw	r3, #:lower16:cpu_possible_mask
	movw	r5, #8200
	movt	r3, #:upper16:cpu_possible_mask
	movw	r6, #:lower16:__sw_hweight32
	ldr	r7, [r3]
	movt	r5, 65048
	movt	r6, #:upper16:__sw_hweight32
	mov	r4, #0
	b	.L26
.L31:
	ldr	r3, [r5]
	orr	r3, r3, #4096
	str	r3, [r5], #128
.L26:
	ldr	r0, [r7]
	and	r0, r0, #15
	blx	r6
	cmp	r4, r0
	add	r4, r4, #1
	bcc	.L31
@ 382 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cacheflush.h" 1
	mrc p15, 0, r2, c1, c0, 1

@ 0 "" 2
	mov	r3, #0
	orr	r2, r2, #8
	movw	r1, #1025
	mvn	r0, #100
	blx	r9
	movw	r0, #:lower16:.LC1
	movw	r1, #:lower16:.LANCHOR2
	mov	r2, #620
	movt	r0, #:upper16:.LC1
	movt	r1, #:upper16:.LANCHOR2
	blx	r8
	mov	r3, #0
	mov	r2, r3
	movt	r3, 65089
	str	r2, [r3, #12]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L25:
	movw	r3, #16383
	movw	r5, #:lower16:.LANCHOR0
	movt	r3, 65048
	mov	r2, #268435456
	movt	r5, #:upper16:.LANCHOR0
	movw	r6, #:lower16:s3c_pm_do_restore
	str	r2, [r3, #-4055]
	add	r0, r5, #116
	str	r2, [r3, #-3831]
	movt	r6, #:upper16:s3c_pm_do_restore
	str	r2, [r3, #-3799]
	mov	r1, #36
	str	r2, [r3, #-3767]
	movw	r8, #:lower16:printk
	str	r2, [r3, #-3735]
	movt	r8, #:upper16:printk
	str	r2, [r3, #-3703]
	str	r2, [r3, #-3671]
	blx	r6
	add	r0, r5, #404
	mov	r1, #31
	blx	r6
	movw	r0, #:lower16:.LC1
	movw	r1, #:lower16:.LANCHOR2
	movt	r0, #:upper16:.LC1
	movt	r1, #:upper16:.LANCHOR2
	movw	r2, #546
	blx	r8
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L32
	mov	r3, #0
	movt	r3, 65041
	ldr	r2, [r3, #2304]
	bic	r2, r2, #16
	str	r2, [r3, #2304]
.L28:
	mov	r4, #0
	movw	r3, #:lower16:s3c_suspend_wakeup_stat
	movt	r4, 65048
	movw	r0, #:lower16:.LC1
	ldr	ip, [r4, #1536]
	movw	r1, #:lower16:.LANCHOR2
	movt	r3, #:upper16:s3c_suspend_wakeup_stat
	movt	r0, #:upper16:.LC1
	movt	r1, #:upper16:.LANCHOR2
	movw	r2, #562
	str	ip, [r3]
	blx	r8
	ldr	r3, [r4, #1536]
	cmp	r3, #0
	bne	.L29
	movw	r3, #:lower16:samsung_cpu_id
	movt	r3, #:upper16:samsung_cpu_id
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmn	r3, #465567744
	bne	.L29
	mov	r3, #0
	mov	r2, #8192
	movt	r3, 65060
	mov	r0, #1
	ldr	ip, [r3, #3904]
	movt	r2, 65048
	mov	r1, #1
	movt	r0, 257
	str	ip, [r3, #3904]
	ldr	ip, [r3, #3908]
	str	ip, [r3, #3908]
	ldr	ip, [r3, #3912]
	str	ip, [r3, #3912]
	ldr	ip, [r3, #3916]
	str	ip, [r3, #3916]
	str	r0, [r2, #8]
	str	r1, [r2, #136]
	str	r1, [r2, #264]
	str	r1, [r2, #392]
.L29:
	mov	r0, #0
	movw	r3, #:lower16:scu_enable
	movt	r3, #:upper16:scu_enable
	movt	r0, 65152
	blx	r3
	movw	r0, #:lower16:.LC1
	movw	r1, #:lower16:.LANCHOR2
	movt	r1, #:upper16:.LANCHOR2
	movw	r2, #577
	movt	r0, #:upper16:.LC1
	movw	r9, #:lower16:exynos_smc
	blx	r8
	movt	r9, #:upper16:exynos_smc
	ldr	r3, [r5, #1560]
	ldr	r1, [r5, #1544]
	mvn	r0, #21
	ldr	r2, [r5, #1552]
	blx	r9
	movw	r0, #:lower16:.LC1
	movw	r1, #:lower16:.LANCHOR2
	movt	r1, #:upper16:.LANCHOR2
	mov	r2, #588
	movt	r0, #:upper16:.LC1
	blx	r8
	mov	r2, #1
	movw	r3, #65535
	movt	r3, 49664
	movt	r2, 31815
	mov	r1, #3
	mvn	r0, #22
	blx	r9
	movw	r0, #:lower16:.LC1
	movw	r1, #:lower16:.LANCHOR2
	movt	r1, #:upper16:.LANCHOR2
	movw	r2, #594
	movt	r0, #:upper16:.LC1
	blx	r8
	mov	r1, #0
	mvn	r0, #23
	mov	r3, r1
	mov	r2, r1
	blx	r9
	movw	r0, #:lower16:.LC1
	movw	r1, #:lower16:.LANCHOR2
	movt	r1, #:upper16:.LANCHOR2
	movw	r2, #598
	movt	r0, #:upper16:.LC1
	blx	r8
	mov	r2, #0
	mov	r1, #1
	mov	r3, r2
	mvn	r0, #20
	blx	r9
	movw	r0, #:lower16:.LC1
	movw	r1, #:lower16:.LANCHOR2
	movt	r1, #:upper16:.LANCHOR2
	movw	r2, #609
	movt	r0, #:upper16:.LC1
	blx	r8
	b	.L30
.L32:
	movw	r3, #:lower16:s3c_pm_do_restore_core
	add	r0, r5, #652
	movt	r3, #:upper16:s3c_pm_do_restore_core
	mov	r1, #111
	blx	r3
	b	.L28
	.fnend
	.size	exynos4_pm_resume, .-exynos4_pm_resume
	.align	2
	.type	exynos4_pm_suspend, %function
exynos4_pm_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r3, #0
	movt	r3, 65048
	movw	r4, #:lower16:s3c_pm_do_save
	ldr	r3, [r3, #36]
	cmp	r3, #0
	movtne	r4, #:upper16:s3c_pm_do_save
	beq	.L43
.L34:
	ldr	r0, .L44
	mov	r1, #36
	blx	r4
	ldr	r0, .L44+4
	mov	r1, #31
	blx	r4
	mov	r1, #5
	ldr	r0, .L44+8
	blx	r4
	mov	r3, #0
	movw	r2, #:lower16:cpu_possible_mask
	movt	r3, 65048
	movt	r2, #:upper16:cpu_possible_mask
	ldr	r1, [r3, #512]
	movw	r5, #8200
	movw	r6, #:lower16:__sw_hweight32
	ldr	r7, [r2]
	movt	r5, 65048
	movt	r6, #:upper16:__sw_hweight32
	bic	r2, r1, #65536
	mov	r4, #0
	str	r2, [r3, #512]
	b	.L35
.L36:
	ldr	r3, [r5]
	bic	r3, r3, #4096
	str	r3, [r5], #128
.L35:
	ldr	r0, [r7]
	and	r0, r0, #15
	blx	r6
	cmp	r4, r0
	add	r4, r4, #1
	bcc	.L36
	mov	r3, #0
	mov	r2, r3
	movt	r3, 65048
	movt	r2, 257
	str	r2, [r3, #520]
	ldr	r2, [r3, #36]
	cmp	r2, #0
	beq	.L37
	ldr	r2, [r3, #1576]
	bic	r2, r2, #1048576
	str	r2, [r3, #1576]
	ldr	r2, [r3, #576]
	bic	r2, r2, #65536
	str	r2, [r3, #576]
.L37:
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L43:
	ldr	r0, .L44+12
	movt	r4, #:upper16:s3c_pm_do_save
	mov	r1, #111
	blx	r4
	b	.L34
.L45:
	.align	2
.L44:
	.word	.LANCHOR0+116
	.word	.LANCHOR0+404
	.word	.LANCHOR0+1540
	.word	.LANCHOR0+652
	.fnend
	.size	exynos4_pm_suspend, .-exynos4_pm_suspend
	.global	exynos4_sleep_gpio_table_set
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.21377, %object
	.size	__func__.21377, 18
__func__.21377:
	.ascii	"exynos4_pm_resume\000"
	.section	.initcall3.init,"aw",%progbits
	.align	2
	.type	__initcall_exynos4_pm_syscore_init3, %object
	.size	__initcall_exynos4_pm_syscore_init3, 4
__initcall_exynos4_pm_syscore_init3:
	.word	exynos4_pm_syscore_init
	.type	__initcall_exynos4_pm_drvinit3, %object
	.size	__initcall_exynos4_pm_drvinit3, 4
__initcall_exynos4_pm_drvinit3:
	.word	exynos4_pm_drvinit
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	exynos4_pm_interface, %object
	.size	exynos4_pm_interface, 24
exynos4_pm_interface:
	.word	.LC2
	.word	exynos4_subsys
	.space	8
	.word	exynos4_pm_add
	.space	4
	.type	exynos4_set_clksrc, %object
	.size	exynos4_set_clksrc, 72
exynos4_set_clksrc:
	.word	-32455920
	.word	1
	.word	-32455904
	.word	286331153
	.word	-32455900
	.word	273
	.word	-32455884
	.word	4369
	.word	-32455876
	.word	1
	.word	-32455872
	.word	16847121
	.word	-32455856
	.word	17895697
	.word	-32455852
	.word	17891601
	.word	-32439552
	.word	65536
	.type	exynos4_pm_syscore_ops, %object
	.size	exynos4_pm_syscore_ops, 20
exynos4_pm_syscore_ops:
	.space	8
	.word	exynos4_pm_suspend
	.word	exynos4_pm_resume
	.space	4
	.type	exynos4_regs_save, %object
	.size	exynos4_regs_save, 288
exynos4_regs_save:
	.word	-31455488
	.space	4
	.word	-31455484
	.space	4
	.word	-31455480
	.space	4
	.word	-31455476
	.space	4
	.word	-31455472
	.space	4
	.word	-31455468
	.space	4
	.word	-31455464
	.space	4
	.word	-31455440
	.space	4
	.word	-31455436
	.space	4
	.word	-31455432
	.space	4
	.word	-31455428
	.space	4
	.word	-31454976
	.space	4
	.word	-31454972
	.space	4
	.word	-31454968
	.space	4
	.word	-31454964
	.space	4
	.word	-31454960
	.space	4
	.word	-31454956
	.space	4
	.word	-31454952
	.space	4
	.word	-31454928
	.space	4
	.word	-31454924
	.space	4
	.word	-31454920
	.space	4
	.word	-31454916
	.space	4
	.word	-31193336
	.space	4
	.word	-31193332
	.space	4
	.word	-31193328
	.space	4
	.word	-31193324
	.space	4
	.word	-31193320
	.space	4
	.word	-31193316
	.space	4
	.word	-31193312
	.space	4
	.word	-31192824
	.space	4
	.word	-31192820
	.space	4
	.word	-31192816
	.space	4
	.word	-31192812
	.space	4
	.word	-31192808
	.space	4
	.word	-31192804
	.space	4
	.word	-31192800
	.space	4
	.type	exynos4x12_regs_save, %object
	.size	exynos4x12_regs_save, 248
exynos4x12_regs_save:
	.word	-28573696
	.space	4
	.word	-28573692
	.space	4
	.word	-28573688
	.space	4
	.word	-28573684
	.space	4
	.word	-28573680
	.space	4
	.word	-31455424
	.space	4
	.word	-31455420
	.space	4
	.word	-31454912
	.space	4
	.word	-31454908
	.space	4
	.word	-31193308
	.space	4
	.word	-31193304
	.space	4
	.word	-31193300
	.space	4
	.word	-31193296
	.space	4
	.word	-31193292
	.space	4
	.word	-31192796
	.space	4
	.word	-31192792
	.space	4
	.word	-31192788
	.space	4
	.word	-31192784
	.space	4
	.word	-31192780
	.space	4
	.word	-30931200
	.space	4
	.word	-30930688
	.space	4
	.word	-30669056
	.space	4
	.word	-30669052
	.space	4
	.word	-30669048
	.space	4
	.word	-30669044
	.space	4
	.word	-30669040
	.space	4
	.word	-30668544
	.space	4
	.word	-30668540
	.space	4
	.word	-30668536
	.space	4
	.word	-30668532
	.space	4
	.word	-30668528
	.space	4
	.type	exynos4_core_save, %object
	.size	exynos4_core_save, 888
exynos4_core_save:
	.word	-25100288
	.space	4
	.word	-25100284
	.space	4
	.word	-25100280
	.space	4
	.word	-25034752
	.space	4
	.word	-25034748
	.space	4
	.word	-25034496
	.space	4
	.word	-25034492
	.space	4
	.word	-25034488
	.space	4
	.word	-25033984
	.space	4
	.word	-25033980
	.space	4
	.word	-25033976
	.space	4
	.word	-25033728
	.space	4
	.word	-25033724
	.space	4
	.word	-25033720
	.space	4
	.word	-25033716
	.space	4
	.word	-25033712
	.space	4
	.word	-25033708
	.space	4
	.word	-25033704
	.space	4
	.word	-25033700
	.space	4
	.word	-25033696
	.space	4
	.word	-25033692
	.space	4
	.word	-25033688
	.space	4
	.word	-25033684
	.space	4
	.word	-25033680
	.space	4
	.word	-25033676
	.space	4
	.word	-25033672
	.space	4
	.word	-25033668
	.space	4
	.word	-25033664
	.space	4
	.word	-25033660
	.space	4
	.word	-25033656
	.space	4
	.word	-25033652
	.space	4
	.word	-25033648
	.space	4
	.word	-25033644
	.space	4
	.word	-25033640
	.space	4
	.word	-25033636
	.space	4
	.word	-25033632
	.space	4
	.word	-25033628
	.space	4
	.word	-25033624
	.space	4
	.word	-25033620
	.space	4
	.word	-25033616
	.space	4
	.word	-25033612
	.space	4
	.word	-25033608
	.space	4
	.word	-25033604
	.space	4
	.word	-25033600
	.space	4
	.word	-25033596
	.space	4
	.word	-25033592
	.space	4
	.word	-25033588
	.space	4
	.word	-25033584
	.space	4
	.word	-25033580
	.space	4
	.word	-25033576
	.space	4
	.word	-25033572
	.space	4
	.word	-25032704
	.space	4
	.word	-25032700
	.space	4
	.word	-25032696
	.space	4
	.word	-25032692
	.space	4
	.word	-25032688
	.space	4
	.word	-25032684
	.space	4
	.word	-25032680
	.space	4
	.word	-25032676
	.space	4
	.word	-25032672
	.space	4
	.word	-25032668
	.space	4
	.word	-25032664
	.space	4
	.word	-25032660
	.space	4
	.word	-25032656
	.space	4
	.word	-25032652
	.space	4
	.word	-25032648
	.space	4
	.word	-25032644
	.space	4
	.word	-25032640
	.space	4
	.word	-25032636
	.space	4
	.word	-25032632
	.space	4
	.word	-25032628
	.space	4
	.word	-25032624
	.space	4
	.word	-25032620
	.space	4
	.word	-25032616
	.space	4
	.word	-25032612
	.space	4
	.word	-25032608
	.space	4
	.word	-25032604
	.space	4
	.word	-25032600
	.space	4
	.word	-25032596
	.space	4
	.word	-25032592
	.space	4
	.word	-25032588
	.space	4
	.word	-25032584
	.space	4
	.word	-25032580
	.space	4
	.word	-25032576
	.space	4
	.word	-25032572
	.space	4
	.word	-25032568
	.space	4
	.word	-25032564
	.space	4
	.word	-25032560
	.space	4
	.word	-25032556
	.space	4
	.word	-25032552
	.space	4
	.word	-25032548
	.space	4
	.word	-25031680
	.space	4
	.word	-25031676
	.space	4
	.word	-25031672
	.space	4
	.word	-25031668
	.space	4
	.word	-25031664
	.space	4
	.word	-25031660
	.space	4
	.word	-25031656
	.space	4
	.word	-25031652
	.space	4
	.word	-25031648
	.space	4
	.word	-25031644
	.space	4
	.word	-26214400
	.space	4
	.word	-26214384
	.space	4
	.word	-26214368
	.space	4
	.word	-26214352
	.space	4
	.word	-26214336
	.space	4
	.word	-26214320
	.space	4
	.word	-26214304
	.space	4
	.word	-26214288
	.space	4
	.word	-26214272
	.space	4
	.word	-26214256
	.space	4
	.type	exynos4_l2cc_save, %object
	.size	exynos4_l2cc_save, 40
exynos4_l2cc_save:
	.word	-27262712
	.space	4
	.word	-27262708
	.space	4
	.word	-27259040
	.space	4
	.word	-27259008
	.space	4
	.word	-27262716
	.space	4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>%s: early_wakeup\012\000"
	.space	3
.LC1:
	.ascii	"<7>%s:%d\012\000"
	.space	2
.LC2:
	.ascii	"exynos4_pm\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	exynos4_sleep_gpio_table_set, %object
	.size	exynos4_sleep_gpio_table_set, 4
exynos4_sleep_gpio_table_set:
	.space	4
	.ident	"GCC: (GNU) 4.8"
