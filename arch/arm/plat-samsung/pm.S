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
	.file	"pm.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_pm_prepare, %function
s3c_pm_prepare:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L7
	push	{r4, lr}
	.save {r4, lr}
	blx	r3
	mov	r0, #0
	pop	{r4, pc}
.L7:
	mov	r0, #0
	bx	lr
	.fnend
	.size	s3c_pm_prepare, .-s3c_pm_prepare
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_pm_finish, %function
s3c_pm_finish:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bxeq	lr
	bx	r3	@ indirect register sibling call
	.fnend
	.size	s3c_pm_finish, .-s3c_pm_finish
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_pm_enter, %function
s3c_pm_enter:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	.pad #8
	sub	sp, sp, #8
	ldr	r3, [r4, #8]
	cmp	r3, #0
	beq	.L14
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L14
	movw	r3, #:lower16:s3c_irqwake_intallow
	movw	r6, #:lower16:.LANCHOR2
	movt	r3, #:upper16:s3c_irqwake_intallow
	movt	r6, #:upper16:.LANCHOR2
	ldr	r3, [r3]
	ldr	r2, [r6]
	bics	r3, r3, r2
	beq	.L33
.L17:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L18
	blx	r3
	subs	r2, r0, #0
	bne	.L34
.L18:
	movw	r3, #:lower16:s3c_pm_save_gpios
	movw	r5, #:lower16:printk
	movt	r3, #:upper16:s3c_pm_save_gpios
	movt	r5, #:upper16:printk
	blx	r3
	movw	r3, #:lower16:s3c_pm_save_core
	movt	r3, #:upper16:s3c_pm_save_core
	blx	r3
	movw	r3, #:lower16:s3c_pm_configure_extint
	movt	r3, #:upper16:s3c_pm_configure_extint
	blx	r3
	ldr	r2, [r6]
	mov	r3, #0
	movt	r3, 65048
	bic	r2, r2, #-67108864
	str	r2, [r3, #1544]
	ldr	r2, [r6, #4]
	str	r2, [r3, #1540]
	ldr	r3, [r4, #8]
	blx	r3
	movw	r3, #:lower16:cpu_cache
	movt	r3, #:upper16:cpu_cache
	ldr	r3, [r3, #4]
	blx	r3
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	blx	r5
	mov	r3, #8192
	movw	r0, #:lower16:.LC5
	movt	r3, 65048
	movt	r0, #:upper16:.LC5
	ldr	r1, [r3, #132]
	ldr	r2, [r3, #260]
	ldr	r3, [r3, #388]
	blx	r5
	movw	r3, #:lower16:s3c_cpu_save
	mov	r1, #-2147483648
	movt	r3, #:upper16:s3c_cpu_save
	mov	r0, #0
	blx	r3
	movw	r3, #:lower16:cpu_init
	movt	r3, #:upper16:cpu_init
	blx	r3
	movw	r3, #:lower16:s3c_pm_restore_core
	movt	r3, #:upper16:s3c_pm_restore_core
	blx	r3
	movw	r3, #:lower16:s3c_pm_restore_gpios
	movt	r3, #:upper16:s3c_pm_restore_gpios
	blx	r3
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L19
	blx	r3
.L19:
	mov	r3, #0
	movw	r0, #:lower16:.LC6
	movt	r3, 65048
	movt	r0, #:upper16:.LC6
	ldr	r1, [r3, #1536]
	blx	r5
	mov	ip, #0
	movw	r0, #:lower16:.LC7
	movt	ip, 65060
	movt	r0, #:upper16:.LC7
	ldr	r1, [ip, #3904]
	ldr	r2, [ip, #3908]
	ldr	r3, [ip, #3912]
	ldr	ip, [ip, #3916]
	str	ip, [sp]
	blx	r5
	mov	r0, #0
.L13:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L33:
	movw	r3, #:lower16:s3c_irqwake_eintallow
	ldr	r2, [r6, #4]
	movt	r3, #:upper16:s3c_irqwake_eintallow
	ldr	r3, [r3]
	bics	r3, r3, r2
	bne	.L17
	movw	r1, #:lower16:.LANCHOR1
	movw	r0, #:lower16:.LC1
	movw	r4, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r4, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r4
	movw	r1, #:lower16:.LANCHOR1
	movw	r0, #:lower16:.LC2
	movt	r1, #:upper16:.LANCHOR1
	movt	r0, #:upper16:.LC2
	blx	r4
	mvn	r0, #21
	b	.L13
.L34:
	movw	r1, #:lower16:.LANCHOR1
	movw	r0, #:lower16:.LC3
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r0, #:upper16:.LC3
	movt	r3, #:upper16:printk
	blx	r3
	mvn	r0, #15
	b	.L13
.L14:
	movw	r1, #:lower16:.LANCHOR1
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR1
	movt	r0, #:upper16:.LC0
	movt	r3, #:upper16:printk
	blx	r3
	mvn	r0, #21
	b	.L13
	.fnend
	.size	s3c_pm_enter, .-s3c_pm_enter
	.align	2
	.global	s3c_irqext_wake
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_irqext_wake, %function
s3c_irqext_wake:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r3, #:lower16:s3c_irqwake_eintallow
	ldr	r2, [r0]
	movt	r3, #:upper16:s3c_irqwake_eintallow
	mov	r4, #1
	ldr	r3, [r3]
	sub	r0, r2, #352
	lsl	r4, r4, r0
	tst	r4, r3
	bne	.L42
	mvn	r0, #1
	pop	{r4, r5, r6, pc}
.L42:
	cmp	r1, #0
	mov	r5, r1
	beq	.L43
	movw	r1, #:lower16:.LC8
	movw	r0, #:lower16:.LC9
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LC8
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC9
	blx	r3
	movw	r3, #:lower16:.LANCHOR2
	mov	r0, #0
	movt	r3, #:upper16:.LANCHOR2
	ldr	r2, [r3, #4]
	bic	r4, r2, r4
	str	r4, [r3, #4]
	pop	{r4, r5, r6, pc}
.L43:
	movw	r1, #:lower16:.LC10
	movw	r0, #:lower16:.LC9
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LC10
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC9
	blx	r3
	movw	r3, #:lower16:.LANCHOR2
	mov	r0, r5
	movt	r3, #:upper16:.LANCHOR2
	ldr	r2, [r3, #4]
	orr	r4, r2, r4
	str	r4, [r3, #4]
	pop	{r4, r5, r6, pc}
	.fnend
	.size	s3c_irqext_wake, .-s3c_irqext_wake
	.align	2
	.global	s3c_pm_do_save
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_pm_do_save, %function
s3c_pm_do_save:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #0
	bxle	lr
	add	r0, r0, #8
.L46:
	ldr	r3, [r0, #-8]
	subs	r1, r1, #1
	add	r0, r0, #8
	ldr	r3, [r3]
	str	r3, [r0, #-12]
	bne	.L46
	bx	lr
	.fnend
	.size	s3c_pm_do_save, .-s3c_pm_do_save
	.align	2
	.global	s3c_pm_do_restore
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_pm_do_restore, %function
s3c_pm_do_restore:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #0
	bxle	lr
	add	r0, r0, #8
.L50:
	ldr	r3, [r0, #-8]
	subs	r1, r1, #1
	ldr	r2, [r0, #-4]
	add	r0, r0, #8
	ldr	ip, [r3]
	str	r2, [r3]
	bne	.L50
	bx	lr
	.fnend
	.size	s3c_pm_do_restore, .-s3c_pm_do_restore
	.align	2
	.global	s3c_pm_do_restore_core
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_pm_do_restore_core, %function
s3c_pm_do_restore_core:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	s3c_pm_do_restore
	.fnend
	.size	s3c_pm_do_restore_core, .-s3c_pm_do_restore_core
	.align	2
	.global	s3c_pm_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_pm_init, %function
s3c_pm_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r0, #:lower16:.LC11
	movw	r3, #:lower16:printk
	push	{r4, lr}
	.save {r4, lr}
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC11
	blx	r3
	movw	r3, #:lower16:suspend_set_ops
	ldr	r0, .L55
	movt	r3, #:upper16:suspend_set_ops
	blx	r3
	mov	r0, #0
	pop	{r4, pc}
.L56:
	.align	2
.L55:
	.word	.LANCHOR1+16
	.fnend
	.size	s3c_pm_init, .-s3c_pm_init
	.global	pm_check_eint_pend
	.global	pm_finish
	.global	pm_prepare
	.global	pm_cpu_restore
	.global	pm_cpu_sleep
	.global	pm_cpu_prep
	.global	s3c_irqwake_eintmask
	.global	s3c_irqwake_intmask
	.global	pm_uart_udivslot
	.global	s3c_pm_flags
	.global	s3c_suspend_wakeup_stat
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.25501, %object
	.size	__func__.25501, 13
__func__.25501:
	.ascii	"s3c_pm_enter\000"
	.space	3
	.type	s3c_pm_ops, %object
	.size	s3c_pm_ops, 40
s3c_pm_ops:
	.word	suspend_valid_only_mem
	.space	4
	.word	s3c_pm_prepare
	.space	4
	.word	s3c_pm_enter
	.space	4
	.word	s3c_pm_finish
	.space	12
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	s3c_irqwake_intmask, %object
	.size	s3c_irqwake_intmask, 4
s3c_irqwake_intmask:
	.word	-1
	.type	s3c_irqwake_eintmask, %object
	.size	s3c_irqwake_eintmask, 4
s3c_irqwake_eintmask:
	.word	-1
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	pm_prepare, %object
	.size	pm_prepare, 4
pm_prepare:
	.space	4
	.type	pm_finish, %object
	.size	pm_finish, 4
pm_finish:
	.space	4
	.type	pm_cpu_prep, %object
	.size	pm_cpu_prep, 4
pm_cpu_prep:
	.space	4
	.type	pm_cpu_sleep, %object
	.size	pm_cpu_sleep, 4
pm_cpu_sleep:
	.space	4
	.type	pm_check_eint_pend, %object
	.size	pm_check_eint_pend, 4
pm_check_eint_pend:
	.space	4
	.type	pm_cpu_restore, %object
	.size	pm_cpu_restore, 4
pm_cpu_restore:
	.space	4
	.type	pm_uart_udivslot, %object
	.size	pm_uart_udivslot, 1
pm_uart_udivslot:
	.space	1
	.space	3
	.type	s3c_pm_flags, %object
	.size	s3c_pm_flags, 4
s3c_pm_flags:
	.space	4
	.type	s3c_suspend_wakeup_stat, %object
	.size	s3c_suspend_wakeup_stat, 4
s3c_suspend_wakeup_stat:
	.space	4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>%s: error: no cpu sleep function\012\000"
	.space	3
.LC1:
	.ascii	"<3>%s: No wake-up sources!\012\000"
.LC2:
	.ascii	"<3>%s: Aborting sleep\012\000"
	.space	1
.LC3:
	.ascii	"<4>%s: Aborting sleep, EINT PENDING(0x%08x)\012\000"
	.space	3
.LC4:
	.ascii	"<1>PM: SLEEP\012\000"
	.space	2
.LC5:
	.ascii	"<1>ARM_COREx_STATUS CORE1[0x%08x], CORE2[0x%08x], C"
	.ascii	"ORE3[0x%08x]\012\000"
	.space	3
.LC6:
	.ascii	"<6>WAKEUP_STAT: 0x%x\012\000"
	.space	2
.LC7:
	.ascii	"<6>WAKEUP_INTx_PEND: 0x%x, 0x%x, 0x%x, 0x%x\012\000"
	.space	3
.LC8:
	.ascii	"enabled\000"
.LC9:
	.ascii	"<6>wake %s for irq %d\012\000"
	.space	1
.LC10:
	.ascii	"disabled\000"
	.space	3
.LC11:
	.ascii	"<6>S3C Power Management, Copyright 2004 Simtec Elec"
	.ascii	"tronics\012\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
