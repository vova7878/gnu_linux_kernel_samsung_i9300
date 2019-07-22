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
	.file	"hotplug.c"
	.text
	.align	2
	.global	platform_cpu_kill
	.type	platform_cpu_kill, %function
platform_cpu_kill:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #1
	bx	lr
	.fnend
	.size	platform_cpu_kill, .-platform_cpu_kill
	.align	2
	.global	platform_cpu_die
	.type	platform_cpu_die, %function
platform_cpu_die:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r1, r0
	mov	r3, #0
@ 32 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/hotplug.c" 1
		mcr	p15, 0, r3, c7, c5, 0
	mcr	p15, 0, r3, c7, c10, 4
	mrc	p15, 0, r2, c1, c0, 1
	bic	r2, r2, #64
	mcr	p15, 0, r2, c1, c0, 1
	mrc	p15, 0, r2, c1, c0, 0
	bic	r2, r2, #4
	mcr	p15, 0, r2, c1, c0, 0

@ 0 "" 2
	mov	r7, r0, asl #7
	mov	r2, #0
	movw	r4, #:lower16:pen_release
	sub	r7, r7, #31719424
	movw	r0, #:lower16:__cpu_logical_map
	sub	r7, r7, #253952
	sub	r5, r1, #1
	mov	r6, r2
	movt	r4, #:upper16:pen_release
	movt	r0, #:upper16:__cpu_logical_map
	b	.L5
.L11:
	add	r2, r2, #1
.L5:
	cmp	r5, #2
	strls	r6, [r7]
@ 104 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/hotplug.c" 1
	.word	0xe320f003

@ 0 "" 2
	ldr	r3, [r4]
	ldr	ip, [r0, r1, asl #2]
	cmp	ip, r3
	bne	.L11
@ 82 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/hotplug.c" 1
	mrc	p15, 0, r3, c1, c0, 0
	orr	r3, r3, #4
	mcr	p15, 0, r3, c1, c0, 0
	mrc	p15, 0, r3, c1, c0, 1
	orr	r3, r3, #64
	mcr	p15, 0, r3, c1, c0, 1

@ 0 "" 2
	cmp	r2, #0
	ldmeqfd	sp!, {r3, r4, r5, r6, r7, pc}
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	platform_cpu_die, .-platform_cpu_die
	.align	2
	.global	platform_cpu_disable
	.type	platform_cpu_disable, %function
platform_cpu_disable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	movne	r0, #0
	mvneq	r0, #0
	bx	lr
	.fnend
	.size	platform_cpu_disable, .-platform_cpu_disable
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<4>CPU%u: %u spurious wakeup calls\012\000"
	.ident	"GCC: (GNU) 4.8"
