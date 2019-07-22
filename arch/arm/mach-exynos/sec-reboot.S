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
	.file	"sec-reboot.c"
	.text
	.align	2
	.type	sec_reboot_init, %function
sec_reboot_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r1, #:lower16:pm_power_off
	movw	r0, #:lower16:sec_power_off
	movw	r3, #:lower16:arm_pm_restart
	movw	r2, #:lower16:sec_reboot
	movt	r1, #:upper16:pm_power_off
	movt	r0, #:upper16:sec_power_off
	movt	r3, #:upper16:arm_pm_restart
	movt	r2, #:upper16:sec_reboot
	str	r0, [r1]
	mov	r0, #0
	str	r2, [r3]
	bx	lr
	.fnend
	.size	sec_reboot_init, .-sec_reboot_init
	.align	2
	.type	sec_reboot, %function
sec_reboot:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r2, r0
	.pad #8
	sub	sp, sp, #8
	mov	r5, r1
@ 35 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		cpsid i			@ arch_local_irq_disable
@ 0 "" 2
	movw	r3, #:lower16:.LC0
	cmp	r5, #0
	movw	r0, #:lower16:.LC1
	movw	r1, #:lower16:.LANCHOR0
	movw	r8, #:lower16:printk
	movt	r3, #:upper16:.LC0
	movt	r1, #:upper16:.LANCHOR0
	movne	r3, r5
	movt	r8, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r8
@ 114 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/sec-reboot.c" 1
	dsb
@ 0 "" 2
	movw	r4, #:lower16:outer_cache
	movt	r4, #:upper16:outer_cache
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L4
	blx	r3
.L4:
	mov	r3, #0
	movw	r2, #22136
	cmp	r5, #0
	movt	r3, 65048
	movt	r2, 4660
	str	r2, [r3, #2056]
	beq	.L27
	movw	r1, #:lower16:.LC2
	movw	r6, #:lower16:strcmp
	movt	r1, #:upper16:.LC2
	movt	r6, #:upper16:strcmp
	mov	r0, r5
	blx	r6
	cmp	r0, #0
	bne	.L8
@ 121 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/sec-reboot.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L9
	blx	r3
.L9:
	mov	r3, #0
	movw	r2, #22133
	movt	r3, 65048
	movt	r2, 4660
	str	r2, [r3, #2060]
.L7:
	movw	r3, #:lower16:cpu_cache
	movt	r3, #:upper16:cpu_cache
	ldr	r3, [r3, #4]
	blx	r3
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L30
	blx	r3
.L30:
	mov	r0, #0
	movw	r3, #:lower16:arch_reset
	mov	r1, r0
	movt	r3, #:upper16:arch_reset
	blx	r3
	movw	r0, #:lower16:.LC12
	movw	r1, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LC12
	movt	r1, #:upper16:.LANCHOR0
	blx	r8
.L31:
	b	.L31
.L8:
	movw	r1, #:lower16:.LC3
	mov	r0, r5
	movt	r1, #:upper16:.LC3
	blx	r6
	cmp	r0, #0
	bne	.L11
@ 124 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/sec-reboot.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L12
	blx	r3
.L12:
	mov	r3, #0
	movw	r2, #22134
	movt	r3, 65048
	movt	r2, 4660
	str	r2, [r3, #2060]
	b	.L7
.L11:
	movw	r1, #:lower16:.LC4
	mov	r0, r5
	movt	r1, #:upper16:.LC4
	blx	r6
	cmp	r0, #0
	bne	.L13
@ 127 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/sec-reboot.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L14
	blx	r3
.L14:
	mov	r3, #0
	movw	r2, #22132
	movt	r3, 65048
	movt	r2, 4660
	str	r2, [r3, #2060]
	b	.L7
.L13:
	movw	r1, #:lower16:.LC5
	mov	r0, r5
	movt	r1, #:upper16:.LC5
	blx	r6
	cmp	r0, #0
	beq	.L80
	movw	r1, #:lower16:.LC6
	mov	r0, r5
	movt	r1, #:upper16:.LC6
	blx	r6
	cmp	r0, #0
	bne	.L17
.L80:
@ 133 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/sec-reboot.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L18
	blx	r3
.L18:
	mov	r3, #0
	movw	r2, #22129
	movt	r3, 65048
	movt	r2, 4660
	str	r2, [r3, #2060]
	b	.L7
.L27:
@ 156 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/sec-reboot.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L29
	blx	r3
.L29:
	mov	r3, #0
	movw	r2, #22128
	movt	r3, 65048
	movt	r2, 4660
	str	r2, [r3, #2060]
	b	.L7
.L17:
	movw	r1, #:lower16:.LC7
	mov	r0, r5
	movt	r1, #:upper16:.LC7
	blx	r6
	cmp	r0, #0
	bne	.L19
@ 139 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/sec-reboot.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L20
	blx	r3
.L20:
	mov	r3, #0
	movw	r2, #22130
	movt	r3, 65048
	movt	r2, 4660
	str	r2, [r3, #2060]
	b	.L7
.L19:
	movw	r1, #:lower16:.LC8
	movw	r7, #:lower16:strncmp
	movt	r1, #:upper16:.LC8
	movt	r7, #:upper16:strncmp
	mov	r0, r5
	mov	r2, #5
	blx	r7
	subs	r1, r0, #0
	beq	.L76
	movw	r6, #:lower16:_kstrtoul
	add	r10, r5, #5
	movt	r6, #:upper16:_kstrtoul
	add	r9, sp, #4
.L21:
	movw	r1, #:lower16:.LC9
	mov	r0, r5
	movt	r1, #:upper16:.LC9
	mov	r2, #5
	blx	r7
	subs	r1, r0, #0
	beq	.L83
.L23:
	movw	r1, #:lower16:.LC10
	mov	r0, r5
	movt	r1, #:upper16:.LC10
	mov	r2, #3
	blx	r7
	subs	r1, r0, #0
	beq	.L84
.L25:
	movw	r1, #:lower16:.LC11
	mov	r0, r5
	movt	r1, #:upper16:.LC11
	mov	r2, #9
	blx	r7
	cmp	r0, #0
	bne	.L27
@ 154 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/sec-reboot.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L28
	blx	r3
.L28:
	mov	r3, #0
	mov	r2, r3
	movt	r3, 65048
	str	r2, [r3, #2060]
	b	.L7
.L84:
	mov	r2, r9
	add	r0, r5, #3
	blx	r6
	cmp	r0, #0
	bne	.L25
@ 151 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/sec-reboot.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L26
	blx	r3
.L26:
	ldr	r2, [sp, #4]
	mov	r3, #0
	movt	r3, 65048
	orr	r2, r2, #-1426063360
	orr	r2, r2, #13565952
	str	r2, [r3, #2060]
	b	.L7
.L83:
	mov	r0, r10
	mov	r2, r9
	blx	r6
	cmp	r0, #0
	bne	.L23
@ 147 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/sec-reboot.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L24
	blx	r3
.L24:
	ldr	r2, [sp, #4]
	mov	r3, #0
	movt	r3, 65048
	orr	r2, r2, #-1426063360
	orr	r2, r2, #13500416
	str	r2, [r3, #2060]
	b	.L7
.L76:
	add	r9, sp, #4
	add	r10, r5, #5
	movw	r6, #:lower16:_kstrtoul
	mov	r0, r10
	mov	r2, r9
	movt	r6, #:upper16:_kstrtoul
	blx	r6
	cmp	r0, #0
	bne	.L21
@ 143 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/sec-reboot.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L22
	blx	r3
.L22:
	ldr	r2, [sp, #4]
	mov	r3, #0
	movt	r3, 65048
	orr	r2, r2, #-1426063360
	orr	r2, r2, #13434880
	str	r2, [r3, #2060]
	b	.L7
	.fnend
	.size	sec_reboot, .-sec_reboot
	.align	2
	.type	sec_power_off, %function
sec_power_off:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
@ 35 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		cpsid i			@ arch_local_irq_disable
@ 0 "" 2
	movw	r9, #:lower16:is_cable_attached
	movw	r0, #:lower16:.LC13
	movt	r9, #:upper16:is_cable_attached
	movw	r6, #:lower16:printk
	ldrb	r2, [r9]	@ zero_extendqisi2
	movt	r0, #:upper16:.LC13
	movt	r6, #:upper16:printk
	ldr	r1, .L109
	blx	r6
	ldrb	r2, [r9]	@ zero_extendqisi2
	movw	r7, #:lower16:outer_cache
	movw	fp, #:lower16:__gpio_get_value
	movw	r5, #:lower16:__const_udelay
	movw	r10, #16383
	movt	r7, #:upper16:outer_cache
	cmp	r2, #0
	movt	fp, #:upper16:__gpio_get_value
	movt	r5, #:upper16:__const_udelay
	movt	r10, 65048
	mov	r8, #0
	bne	.L97
.L108:
	cmp	r8, #4
	bgt	.L86
	mov	r0, #215
	blx	fp
	cmp	r0, #0
	bne	.L107
	movw	r0, #:lower16:.LC17
	ldr	r1, .L109
	movt	r0, #:upper16:.LC17
	blx	r6
.L93:
	mov	r4, #1000
.L96:
	movw	r0, #12560
	movt	r0, 4915
	blx	r5
	subs	r4, r4, #1
	bne	.L96
	ldrb	r2, [r9]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L108
.L97:
	mov	r2, #1
.L86:
	movw	r0, #:lower16:.LC14
	mov	r3, r8
	ldr	r1, .L109
	movt	r0, #:upper16:.LC14
	blx	r6
@ 33 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/sec-reboot.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r7, #28]
	cmp	r3, #0
	beq	.L88
	blx	r3
.L88:
	mov	r2, #0
	movw	r3, #:lower16:cpu_cache
	movt	r2, 65048
	mov	r1, #0
	movt	r3, #:upper16:cpu_cache
	str	r1, [r2, #2056]
	ldr	r3, [r3, #4]
	blx	r3
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L89
	blx	r3
.L89:
	mov	r0, #0
	movw	r3, #:lower16:arch_reset
	mov	r1, r0
	movt	r3, #:upper16:arch_reset
	blx	r3
	movw	r0, #:lower16:.LC12
	ldr	r1, .L109
	movt	r0, #:upper16:.LC12
	blx	r6
.L90:
	b	.L90
.L107:
	movw	r0, #:lower16:.LC15
	ldr	r1, .L109
	movt	r0, #:upper16:.LC15
	blx	r6
@ 51 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/sec-reboot.c" 1
	dsb
@ 0 "" 2
	ldr	r3, [r7, #28]
	cmp	r3, #0
	beq	.L92
	blx	r3
.L92:
	ldr	r3, [r10, #-3315]
@ 51 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/sec-reboot.c" 1
	dsb
@ 0 "" 2
	movw	r0, #:lower16:.LC16
	bic	r3, r3, #256
	add	r8, r8, #1
	str	r3, [r10, #-3315]
	mov	r2, r8
	ldr	r1, .L109
	movt	r0, #:upper16:.LC16
	blx	r6
	b	.L93
.L110:
	.align	2
.L109:
	.word	.LANCHOR0+12
	.fnend
	.size	sec_power_off, .-sec_power_off
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.12731, %object
	.size	__func__.12731, 11
__func__.12731:
	.ascii	"sec_reboot\000"
	.space	1
	.type	__func__.12716, %object
	.size	__func__.12716, 14
__func__.12716:
	.ascii	"sec_power_off\000"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"(null)\000"
	.space	1
.LC1:
	.ascii	"<0>%s (%d, %s)\012\000"
.LC2:
	.ascii	"fota\000"
	.space	3
.LC3:
	.ascii	"fota_bl\000"
.LC4:
	.ascii	"recovery\000"
	.space	3
.LC5:
	.ascii	"bootloader\000"
	.space	1
.LC6:
	.ascii	"download\000"
	.space	3
.LC7:
	.ascii	"upload\000"
	.space	1
.LC8:
	.ascii	"debug\000"
	.space	2
.LC9:
	.ascii	"swsel\000"
	.space	2
.LC10:
	.ascii	"sud\000"
.LC11:
	.ascii	"emergency\000"
	.space	2
.LC12:
	.ascii	"<0>%s: waiting for reboot\012\000"
	.space	1
.LC13:
	.ascii	"<0>%s : cable state=%d\012\000"
.LC14:
	.ascii	"<0>%s: charger connected(%d) or poweroff failed(%d)"
	.ascii	", reboot!\012\000"
	.space	2
.LC15:
	.ascii	"<0>%s: set PS_HOLD low\012\000"
.LC16:
	.ascii	"<0>%s: Should not reach here! (poweroff_try:%d)\012"
	.ascii	"\000"
	.space	3
.LC17:
	.ascii	"<6>%s: PowerButton is not released.\012\000"
	.section	.initcall4.init,"aw",%progbits
	.align	2
	.type	__initcall_sec_reboot_init4, %object
	.size	__initcall_sec_reboot_init4, 4
__initcall_sec_reboot_init4:
	.word	sec_reboot_init
	.ident	"GCC: (GNU) 4.8"
