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
	.file	"vfpmodule.c"
	.text
	.align	2
	.type	vfp_enable, %function
vfp_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ 73 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cp15.h" 1
	mrc p15, 0, r3, c1, c0, 2 @ get copro access
@ 0 "" 2
	orr	r3, r3, #15728640
@ 80 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cp15.h" 1
	mcr p15, 0, r3, c1, c0, 2 @ set copro access
@ 0 "" 2
@ 82 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cp15.h" 1
	isb
@ 0 "" 2
	bx	lr
	.fnend
	.size	vfp_enable, .-vfp_enable
	.align	2
	.type	vfp_pm_resume, %function
vfp_pm_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ 73 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cp15.h" 1
	mrc p15, 0, r3, c1, c0, 2 @ get copro access
@ 0 "" 2
	orr	r3, r3, #15728640
@ 80 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cp15.h" 1
	mcr p15, 0, r3, c1, c0, 2 @ set copro access
@ 0 "" 2
@ 82 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cp15.h" 1
	isb
@ 0 "" 2
@ 475 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mrc p10, 7, r3, cr8, cr0, 0 @ fmrx	r3, FPEXC
@ 0 "" 2
	bic	r3, r3, #1073741824
@ 475 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mcr p10, 7, r3, cr8, cr0, 0 @ fmxr	FPEXC, r3
@ 0 "" 2
	bx	lr
	.fnend
	.size	vfp_pm_resume, .-vfp_pm_resume
	.align	2
	.type	vfp_emulate_instruction, %function
vfp_emulate_instruction:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	and	r2, r0, #251658240
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	cmp	r2, #234881024
	beq	.L9
.L7:
	mvn	r0, #256
	ldmfd	sp!, {r3, pc}
.L9:
	tst	r0, #16
	bne	.L7
	and	r3, r0, #3840
	cmp	r3, #2560
	movweq	r3, #:lower16:vfp_single_cpdo
	movwne	r3, #:lower16:vfp_double_cpdo
	movteq	r3, #:upper16:vfp_single_cpdo
	movtne	r3, #:upper16:vfp_double_cpdo
	blx	r3
	bic	r0, r0, #256
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	vfp_emulate_instruction, .-vfp_emulate_instruction
	.align	2
	.type	vfp_raise_sigfpe, %function
vfp_raise_sigfpe:
	.fnstart
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r3, #:lower16:__memzero
	.pad #128
	sub	sp, sp, #128
	mov	r4, r0
	mov	r5, r1
	mov	r0, sp
	movt	r3, #:upper16:__memzero
	mov	r1, #128
	blx	r3
	mov	r3, sp
	ldr	r6, [r5, #60]
	bic	r2, r3, #8128
	mov	lr, #0
	bic	r2, r2, #63
	mov	ip, #8
	ldr	r0, [r2, #12]
	mov	r5, #6
	sub	r6, r6, #4
	movw	r3, #:lower16:send_sig_info
	mov	r1, sp
	movt	r3, #:upper16:send_sig_info
	str	lr, [r0, #612]
	mov	r0, ip
	ldr	lr, [r2, #12]
	str	r6, [sp, #12]
	str	r4, [sp, #8]
	str	r5, [lr, #608]
	ldr	r2, [r2, #12]
	str	ip, [sp]
	blx	r3
	add	sp, sp, #128
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	vfp_raise_sigfpe, .-vfp_raise_sigfpe
	.align	2
	.type	vfp_pm_suspend, %function
vfp_pm_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r3, sp
@ 446 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mrc p10, 7, r4, cr8, cr0, 0 @ fmrx	r4, FPEXC
@ 0 "" 2
	tst	r4, #1073741824
	bic	r5, r3, #8128
	bic	r5, r5, #63
	bne	.L16
.L12:
	ldr	r1, [r5, #16]
	movw	r3, #:lower16:.LANCHOR1
	mov	r2, #0
	movt	r3, #:upper16:.LANCHOR1
	mov	r0, r2
	str	r2, [r3, r1, asl #2]
	ldmfd	sp!, {r3, r4, r5, pc}
.L16:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR0
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	movw	r3, #:lower16:vfp_save_state
	mov	r1, r4
	add	r0, r5, #424
	movt	r3, #:upper16:vfp_save_state
	blx	r3
	bic	r4, r4, #1073741824
@ 454 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mcr p10, 7, r4, cr8, cr0, 0 @ fmxr	FPEXC, r4
@ 0 "" 2
	b	.L12
	.fnend
	.size	vfp_pm_suspend, .-vfp_pm_suspend
	.align	2
	.type	vfp_init, %function
vfp_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:cpu_architecture
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movt	r3, #:upper16:cpu_architecture
	.pad #8
	sub	sp, sp, #8
	blx	r3
	cmp	r0, #7
	bls	.L18
@ 73 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cp15.h" 1
	mrc p15, 0, r3, c1, c0, 2 @ get copro access
@ 0 "" 2
	orr	r3, r3, #15728640
@ 80 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cp15.h" 1
	mcr p15, 0, r3, c1, c0, 2 @ set copro access
@ 0 "" 2
@ 82 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cp15.h" 1
	isb
@ 0 "" 2
.L18:
	movw	r3, #:lower16:.LANCHOR2
	movw	r2, #:lower16:vfp_testing_entry
	movt	r3, #:upper16:.LANCHOR2
	movt	r2, #:upper16:vfp_testing_entry
	str	r2, [r3]
@ 563 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mrc p10, 7, r4, cr0, cr0, 0 @ fmrx	r4, FPSID
@ 0 "" 2
	movw	r5, #:lower16:.LANCHOR2
	movw	r3, #:lower16:vfp_null_entry
	movw	r0, #:lower16:.LC1
	movw	r7, #:lower16:printk
	movw	r6, #:lower16:.LANCHOR1
	movt	r3, #:upper16:vfp_null_entry
	movt	r5, #:upper16:.LANCHOR2
	movt	r0, #:upper16:.LC1
	movt	r7, #:upper16:printk
	movt	r6, #:upper16:.LANCHOR1
	str	r3, [r5]
	blx	r7
	ldr	r3, [r6, #16]
	cmp	r3, #0
	bne	.L27
	ands	r8, r4, #1048576
	bne	.L28
	movw	r3, #:lower16:register_cpu_notifier
	add	r0, r5, #4
	movt	r3, #:upper16:register_cpu_notifier
	blx	r3
	movw	r0, #:lower16:vfp_enable
	movw	r3, #:lower16:smp_call_function
	mov	r1, r8
	movt	r3, #:upper16:smp_call_function
	mov	r2, #1
	movt	r0, #:upper16:vfp_enable
	blx	r3
	ubfx	ip, r4, #16, #4
	ubfx	r2, r4, #4, #4
	and	r3, r4, #15
	movw	r0, #:lower16:.LC4
	str	r2, [sp]
	mov	r1, r4, lsr #24
	mov	r2, ip
	str	r3, [sp, #4]
	movt	r0, #:upper16:.LC4
	ubfx	r3, r4, #8, #8
	str	ip, [r6, #16]
	blx	r7
	movw	r2, #:lower16:vfp_support_entry
	mov	r1, r5
	movt	r2, #:upper16:vfp_support_entry
	movw	r0, #:lower16:thread_notify_head
	movw	r3, #:lower16:atomic_notifier_chain_register
	str	r2, [r1], #16
	movt	r3, #:upper16:atomic_notifier_chain_register
	movt	r0, #:upper16:thread_notify_head
	blx	r3
	movw	r3, #:lower16:register_syscore_ops
	add	r0, r5, #28
	movt	r3, #:upper16:register_syscore_ops
	blx	r3
	movw	r3, #:lower16:elf_hwcap
	ldr	r1, [r6, #16]
	movt	r3, #:upper16:elf_hwcap
	ldr	r2, [r3]
	cmp	r1, #1
	orr	r1, r2, #64
	str	r1, [r3]
	bls	.L22
@ 604 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mrc p10, 7, r1, cr7, cr0, 0 @ fmrx	r1, MVFR0
@ 0 "" 2
	and	r1, r1, #15
	cmp	r1, #1
	orreq	r2, r2, #24576
	orrne	r2, r2, #532480
	orr	r2, r2, #64
	str	r2, [r3]
.L22:
@ 61 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cputype.h" 1
	mrc	p15, 0, r2, c0, c0, 0
@ 0 "" 2
	and	r2, r2, #983040
	cmp	r2, #983040
	beq	.L29
.L20:
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L29:
	mov	r2, #65280
	mov	r1, #4352
	movt	r2, 15
	movt	r1, 1
@ 618 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mrc p10, 7, r0, cr6, cr0, 0 @ fmrx	r0, MVFR1
@ 0 "" 2
	and	r2, r0, r2
	mov	r0, #0
	cmp	r2, r1
	ldreq	r2, [r3]
	orreq	r2, r2, #4096
	streq	r2, [r3]
@ 622 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mrc p10, 7, r2, cr6, cr0, 0 @ fmrx	r2, MVFR1
@ 0 "" 2
	and	r2, r2, #-268435456
	cmp	r2, #268435456
	ldreq	r2, [r3]
	orreq	r2, r2, #65536
	streq	r2, [r3]
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L28:
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	blx	r7
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L27:
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	blx	r7
	b	.L20
	.fnend
	.size	vfp_init, .-vfp_init
	.align	2
	.type	vfp_hotplug, %function
vfp_hotplug:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bic	r1, r1, #16
	cmp	r1, #8
	bne	.L31
	mov	r1, sp
	bic	r3, r1, #8128
	bic	r3, r3, #63
	ldr	r1, [r3, #696]
	cmp	r2, r1
	beq	.L34
.L32:
	mov	r2, #4
	str	r2, [r3, #696]
.L33:
	mov	r0, #1
	bx	lr
.L31:
	cmp	r1, #10
	bne	.L33
@ 73 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cp15.h" 1
	mrc p15, 0, r3, c1, c0, 2 @ get copro access
@ 0 "" 2
	orr	r3, r3, #15728640
@ 80 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cp15.h" 1
	mcr p15, 0, r3, c1, c0, 2 @ set copro access
@ 0 "" 2
@ 82 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/cp15.h" 1
	isb
@ 0 "" 2
	mov	r0, #1
	bx	lr
.L34:
	movw	r1, #:lower16:.LANCHOR1
	add	r0, r3, #424
	movt	r1, #:upper16:.LANCHOR1
	ldr	ip, [r1, r2, asl #2]
	cmp	ip, r0
	bne	.L32
@ 77 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mrc p10, 7, r0, cr8, cr0, 0 @ fmrx	r0, FPEXC
@ 0 "" 2
	bic	r0, r0, #1073741824
@ 77 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mcr p10, 7, r0, cr8, cr0, 0 @ fmxr	FPEXC, r0
@ 0 "" 2
	mov	r0, #0
	str	r0, [r1, r2, asl #2]
	b	.L32
	.fnend
	.size	vfp_hotplug, .-vfp_hotplug
	.align	2
	.type	vfp_raise_exceptions, %function
vfp_raise_exceptions:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	ip, #256
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	cmp	r0, ip
	.pad #12
	sub	sp, sp, #12
	mov	r7, r1
	mov	r8, r3
	beq	.L69
	tst	r0, #-268435456
	bicne	r2, r2, #-268435456
	orr	r2, r2, r0
@ 273 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mcr p10, 7, r2, cr1, cr0, 0 @ fmxr	FPSCR, r2
@ 0 "" 2
	ands	ip, r0, #2
	beq	.L40
	ands	ip, r2, #512
	movne	ip, #3
	bfine	ip, ip, #16, #16
.L40:
	tst	r0, #16
	beq	.L41
	mov	r3, #6
	tst	r2, #4096
	movt	r3, 3
	movne	ip, r3
.L41:
	tst	r0, #8
	beq	.L42
	mov	r3, #5
	tst	r2, #2048
	movt	r3, 3
	movne	ip, r3
.L42:
	tst	r0, #4
	beq	.L43
	mov	r3, #4
	tst	r2, #1024
	movt	r3, 3
	movne	ip, r3
.L43:
	tst	r0, #1
	beq	.L44
	tst	r2, #256
	beq	.L44
	mov	r0, #7
	movt	r0, 3
.L45:
	mov	r1, r8
.L68:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	b	vfp_raise_sigfpe
.L44:
	cmp	ip, #0
	movne	r0, ip
	bne	.L45
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L69:
	movw	r0, #:lower16:.LC5
	movw	r1, #:lower16:.LC6
	movw	r9, #:lower16:printk
	movt	r1, #:upper16:.LC6
	movt	r0, #:upper16:.LC5
	movt	r9, #:upper16:printk
	blx	r9
	movw	r0, #:lower16:.LC7
	movw	r6, #:lower16:vfp_get_float
	mov	r3, r7
	movt	r0, #:upper16:.LC7
@ 242 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mrc p10, 7, r1, cr8, cr0, 0 @ fmrx	r1, FPEXC
@ 0 "" 2
@ 242 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mrc p10, 7, r2, cr1, cr0, 0 @ fmrx	r2, FPSCR
@ 0 "" 2
	mov	r5, #1
	movt	r6, #:upper16:vfp_get_float
	mov	r4, #0
	blx	r9
.L38:
	mov	r0, r4
	blx	r6
	mov	r7, r0
	mov	r0, r5
	blx	r6
	str	r0, [sp]
	movw	r0, #:lower16:.LC8
	mov	r1, r4
	mov	r3, r5
	mov	r2, r7
	movt	r0, #:upper16:.LC8
	add	r4, r4, #2
	add	r5, r5, #2
	blx	r9
	cmp	r4, #32
	bne	.L38
	mov	r1, r8
	mov	r0, #0
	b	.L68
	.fnend
	.size	vfp_raise_exceptions, .-vfp_raise_exceptions
	.align	2
	.global	VFP_bounce
	.type	VFP_bounce, %function
VFP_bounce:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	bic	r3, r1, #-1207959552
	mov	r4, r1
	mov	r6, r0
	mov	r5, r2
	bic	r3, r3, #159
@ 350 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mcr p10, 7, r3, cr8, cr0, 0 @ fmxr	FPEXC, r3
@ 0 "" 2
@ 352 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mrc p10, 7, r3, cr0, cr0, 0 @ fmrx	r3, FPSID
@ 0 "" 2
	and	r3, r3, #983040
@ 353 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mrc p10, 7, r7, cr1, cr0, 0 @ fmrx	r7, FPSCR
@ 0 "" 2
	cmp	r3, #65536
	beq	.L91
.L71:
	cmp	r4, #0
	blt	.L92
	tst	r4, #536870912
	beq	.L93
.L74:
	tst	r4, #-2013265920
	mov	r0, r6
	addne	r3, r4, #256
	bicne	r1, r7, #458752
	andne	r3, r3, #1792
	moveq	r1, r7
	orrne	r1, r1, r3, asl #8
	mov	r2, r5
	bl	vfp_emulate_instruction
	cmp	r0, #0
	bne	.L94
	and	r4, r4, #-1879048192
	cmp	r4, #-1879048192
	beq	.L95
.L75:
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3]
	tst	r3, #2
	ldmeqfd	sp!, {r3, r4, r5, r6, r7, pc}
	movw	r3, #:lower16:preempt_schedule
	movt	r3, #:upper16:preempt_schedule
	blx	r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L91:
	tst	r7, #4096
	beq	.L71
.L72:
	mov	r0, r6
	mov	r1, r7
	mov	r2, r5
	bl	vfp_emulate_instruction
	cmp	r0, #0
	beq	.L75
	mov	r1, r6
	mov	r2, r7
	mov	r3, r5
	bl	vfp_raise_exceptions
	b	.L75
.L92:
	ldr	r3, [r5, #60]
@ 372 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mrc p10, 7, r6, cr9, cr0, 0 @ fmrx	r6, FPINST
@ 0 "" 2
	sub	r3, r3, #4
	str	r3, [r5, #60]
	b	.L74
.L94:
	mov	r1, r6
	mov	r2, r7
	mov	r3, r5
	and	r4, r4, #-1879048192
	bl	vfp_raise_exceptions
	cmp	r4, #-1879048192
	bne	.L75
.L95:
@ 420 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mrc p10, 7, r6, cr10, cr0, 0 @ fmrx	r6, FPINST2
@ 0 "" 2
	b	.L72
.L93:
	mov	r1, r6
	mov	r2, r7
	mov	r3, r5
	mvn	r0, #256
	bl	vfp_raise_exceptions
	b	.L75
	.fnend
	.size	VFP_bounce, .-VFP_bounce
	.align	2
	.global	vfp_sync_hwstate
	.type	vfp_sync_hwstate, %function
vfp_sync_hwstate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	r2, [r3, #4]
	mov	r2, sp
	bic	r3, r2, #8128
	ldr	r2, [r0, #696]
	bic	r3, r3, #63
	ldr	r3, [r3, #16]
	cmp	r3, r2
	beq	.L102
.L97:
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3]
	tst	r3, #2
	ldmeqfd	sp!, {r4, pc}
	movw	r3, #:lower16:preempt_schedule
	movt	r3, #:upper16:preempt_schedule
	blx	r3
	ldmfd	sp!, {r4, pc}
.L102:
	movw	r2, #:lower16:.LANCHOR1
	add	r1, r0, #424
	movt	r2, #:upper16:.LANCHOR1
	ldr	r0, [r2, r3, asl #2]
	cmp	r0, r1
	bne	.L97
@ 501 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mrc p10, 7, r4, cr8, cr0, 0 @ fmrx	r4, FPEXC
@ 0 "" 2
	orr	r1, r4, #1073741824
@ 506 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mcr p10, 7, r1, cr8, cr0, 0 @ fmxr	FPEXC, r1
@ 0 "" 2
	movw	r3, #:lower16:vfp_save_state
	movt	r3, #:upper16:vfp_save_state
	blx	r3
@ 508 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mcr p10, 7, r4, cr8, cr0, 0 @ fmxr	FPEXC, r4
@ 0 "" 2
	b	.L97
	.fnend
	.size	vfp_sync_hwstate, .-vfp_sync_hwstate
	.align	2
	.type	vfp_notifier, %function
vfp_notifier:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	.save {r4, r5, lr}
	mov	r4, r2
	.pad #12
	sub	sp, sp, #12
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L104
.L106:
	.word	.L105
	.word	.L107
	.word	.L108
	.word	.L109
.L109:
	mov	r3, sp
	bic	r5, r3, #8128
	bic	r5, r5, #63
	mov	r0, r5
	bl	vfp_sync_hwstate
	movw	r3, #:lower16:memcpy
	add	r1, r5, #424
	movt	r3, #:upper16:memcpy
	add	r0, r4, #424
	mov	r2, #280
	blx	r3
	mov	r3, #4
	str	r3, [r4, #696]
.L104:
	mov	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
.L108:
@ 171 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mrc p10, 7, r5, cr8, cr0, 0 @ fmrx	r5, FPEXC
@ 0 "" 2
	tst	r5, #1073741824
	ldr	r2, [r2, #16]
	beq	.L110
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r0, [r3, r2, asl #2]
	cmp	r0, #0
	beq	.L110
	movw	r3, #:lower16:vfp_save_state
	mov	r1, r5
	movt	r3, #:upper16:vfp_save_state
	blx	r3
.L110:
	bic	r5, r5, #1073741824
@ 189 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mcr p10, 7, r5, cr8, cr0, 0 @ fmxr	FPEXC, r5
@ 0 "" 2
	mov	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
.L107:
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	r2, [r3, #4]
	mov	r3, sp
	add	r4, r4, #424
	bic	r2, r3, #8128
	movw	r3, #:lower16:.LANCHOR1
	bic	r2, r2, #63
	movt	r3, #:upper16:.LANCHOR1
	ldr	r2, [r2, #16]
	ldr	r1, [r3, r2, asl #2]
	cmp	r1, r4
	moveq	r1, #0
	streq	r1, [r3, r2, asl #2]
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L104
	movw	r3, #:lower16:preempt_schedule
	movt	r3, #:upper16:preempt_schedule
	blx	r3
	b	.L104
.L105:
	mov	r2, sp
	add	r0, r4, #424
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	r2, [r3, #4]
	mov	r3, sp
	bic	r2, r3, #8128
	movw	r3, #:lower16:.LANCHOR1
	bic	r2, r2, #63
	movt	r3, #:upper16:.LANCHOR1
	ldr	r2, [r2, #16]
	ldr	r1, [r3, r2, asl #2]
	cmp	r0, r1
	moveq	r1, #0
	streq	r1, [r3, r2, asl #2]
@ 104 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mrc p10, 7, r3, cr8, cr0, 0 @ fmrx	r3, FPEXC
@ 0 "" 2
	bic	r3, r3, #1073741824
@ 104 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mcr p10, 7, r3, cr8, cr0, 0 @ fmxr	FPEXC, r3
@ 0 "" 2
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3]
	tst	r3, #2
	bne	.L126
.L112:
	movw	r3, #:lower16:__memzero
	mov	r1, #280
	movt	r3, #:upper16:__memzero
	blx	r3
	mov	r1, #1073741824
	mov	r2, #0
	mov	r3, #4
	mov	r0, #0
	str	r1, [r4, #680]
	str	r2, [r4, #684]
	str	r3, [r4, #696]
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
.L126:
	movw	r3, #:lower16:preempt_schedule
	str	r0, [sp, #4]
	movt	r3, #:upper16:preempt_schedule
	blx	r3
	ldr	r0, [sp, #4]
	b	.L112
	.fnend
	.size	vfp_notifier, .-vfp_notifier
	.align	2
	.global	vfp_flush_hwstate
	.type	vfp_flush_hwstate, %function
vfp_flush_hwstate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	r2, [r3, #4]
	mov	r2, sp
	bic	r3, r2, #8128
	ldr	r2, [r0, #696]
	bic	r3, r3, #63
	ldr	r3, [r3, #16]
	cmp	r3, r2
	beq	.L133
.L128:
	mov	r3, #4
	str	r3, [r0, #696]
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3]
	tst	r3, #2
	ldmeqfd	sp!, {r3, pc}
	movw	r3, #:lower16:preempt_schedule
	movt	r3, #:upper16:preempt_schedule
	blx	r3
	ldmfd	sp!, {r3, pc}
.L133:
	movw	r2, #:lower16:.LANCHOR1
	add	r1, r0, #424
	movt	r2, #:upper16:.LANCHOR1
	ldr	ip, [r2, r3, asl #2]
	cmp	ip, r1
	bne	.L128
@ 77 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mrc p10, 7, r1, cr8, cr0, 0 @ fmrx	r1, FPEXC
@ 0 "" 2
	bic	r1, r1, #1073741824
@ 77 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/vfp/vfpmodule.c" 1
	mcr p10, 7, r1, cr8, cr0, 0 @ fmxr	FPEXC, r1
@ 0 "" 2
	mov	r1, #0
	str	r1, [r2, r3, asl #2]
	b	.L128
	.fnend
	.size	vfp_flush_hwstate, .-vfp_flush_hwstate
	.global	vfp_current_hw_state
	.global	VFP_arch
	.global	vfp_vector
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.16277, %object
	.size	__func__.16277, 15
__func__.16277:
	.ascii	"vfp_pm_suspend\000"
	.section	.initcall7.init,"aw",%progbits
	.align	2
	.type	__initcall_vfp_init7, %object
	.size	__initcall_vfp_init7, 4
__initcall_vfp_init7:
	.word	vfp_init
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	vfp_vector, %object
	.size	vfp_vector, 4
vfp_vector:
	.word	vfp_null_entry
	.type	vfp_hotplug_nb.16314, %object
	.size	vfp_hotplug_nb.16314, 12
vfp_hotplug_nb.16314:
	.word	vfp_hotplug
	.space	4
	.word	0
	.type	vfp_notifier_block, %object
	.size	vfp_notifier_block, 12
vfp_notifier_block:
	.word	vfp_notifier
	.space	8
	.type	vfp_pm_syscore_ops, %object
	.size	vfp_pm_syscore_ops, 20
vfp_pm_syscore_ops:
	.space	8
	.word	vfp_pm_suspend
	.word	vfp_pm_resume
	.space	4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<7>%s: saving vfp state\012\000"
	.space	3
.LC1:
	.ascii	"<6>VFP support v0.3: \000"
	.space	2
.LC2:
	.ascii	"not present\012\000"
	.space	3
.LC3:
	.ascii	"no double precision support\012\000"
	.space	3
.LC4:
	.ascii	"implementor %02x architecture %d part %02x variant "
	.ascii	"%x rev %x\012\000"
	.space	2
.LC5:
	.ascii	"<3>VFP: Error: %s\012\000"
	.space	1
.LC6:
	.ascii	"unhandled bounce\000"
	.space	3
.LC7:
	.ascii	"<3>VFP: EXC 0x%08x SCR 0x%08x INST 0x%08x\012\000"
	.space	1
.LC8:
	.ascii	"<3>VFP: s%2u: 0x%08x s%2u: 0x%08x\012\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	vfp_current_hw_state, %object
	.size	vfp_current_hw_state, 16
vfp_current_hw_state:
	.space	16
	.type	VFP_arch, %object
	.size	VFP_arch, 4
VFP_arch:
	.space	4
	.ident	"GCC: (GNU) 4.8"
