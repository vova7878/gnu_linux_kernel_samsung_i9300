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
	.file	"setup-c2c.c"
	.text
	.align	2
	.global	exynos_c2c_set_cprst
	.type	exynos_c2c_set_cprst, %function
exynos_c2c_set_cprst:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	exynos_c2c_set_cprst, .-exynos_c2c_set_cprst
	.align	2
	.global	exynos_c2c_clear_cprst
	.type	exynos_c2c_clear_cprst, %function
exynos_c2c_clear_cprst:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	exynos_c2c_clear_cprst, .-exynos_c2c_clear_cprst
	.align	2
	.global	exynos4_c2c_cfg_gpio
	.type	exynos4_c2c_cfg_gpio, %function
exynos4_c2c_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r10, #:lower16:s3c_gpio_cfgall_range
	.pad #20
	sub	sp, sp, #20
	movw	r4, #290
	movw	r7, #:lower16:s5p_gpio_set_drvstr
	movw	r9, #:lower16:s5p_gpio_set_pd_cfg
	stmib	sp, {r0, r1, r2}
	movw	r8, #:lower16:s5p_gpio_set_pd_pull
	movt	r10, #:upper16:s3c_gpio_cfgall_range
	mov	r0, r4
	mov	r1, #8
	mvn	r2, #13
	mov	r3, #0
	movt	r7, #:upper16:s5p_gpio_set_drvstr
	movt	r9, #:upper16:s5p_gpio_set_pd_cfg
	movt	r8, #:upper16:s5p_gpio_set_pd_pull
	blx	r10
.L5:
	mov	r0, r4
	mov	r1, #0
	blx	r7
	mov	r0, r4
	mov	r1, #2
	blx	r9
	mov	r0, r4
	mov	r1, #1
	blx	r8
	add	r4, r4, #1
	movw	r3, #298
	cmp	r4, r3
	movw	fp, #:lower16:s5p_gpio_set_drvstr
	movw	r6, #:lower16:s5p_gpio_set_pd_cfg
	movw	r5, #:lower16:s5p_gpio_set_pd_pull
	movt	fp, #:upper16:s5p_gpio_set_drvstr
	movt	r6, #:upper16:s5p_gpio_set_pd_cfg
	movt	r5, #:upper16:s5p_gpio_set_pd_pull
	bne	.L5
	ldr	r2, [sp, #4]
	cmp	r2, #2
	beq	.L23
	ldr	r3, [sp, #4]
	cmp	r3, #1
	beq	.L24
.L8:
	mov	r4, #308
	mov	r1, #8
	mov	r0, r4
	mvn	r2, #13
	mov	r3, #0
	blx	r10
.L12:
	mov	r1, #1
	mov	r0, r4
	add	r4, r4, r1
	movw	r5, #:lower16:s5p_gpio_set_drvstr
	blx	r7
	cmp	r4, #316
	movt	r5, #:upper16:s5p_gpio_set_drvstr
	bne	.L12
	ldr	r2, [sp, #8]
	cmp	r2, #2
	beq	.L25
	ldr	r3, [sp, #8]
	cmp	r3, #1
	beq	.L26
.L15:
	mvn	r2, #13
	mov	r3, #0
	mov	r1, #2
	movw	r0, #326
	blx	r10
	mov	r1, #2
	movw	r0, #326
	blx	r9
	mov	r1, #1
	movw	r0, #326
	blx	r8
@ 84 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-c2c.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L18
	blx	r3
.L18:
	ldr	r2, [sp, #12]
	mov	r3, #5
	str	r3, [r2]
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L23:
	movw	r4, #299
	mov	r1, #8
	mov	r0, r4
	mvn	r2, #13
	mov	r3, #0
	movw	r5, #307
	blx	r10
.L9:
	mov	r0, r4
	mov	r1, #0
	blx	r7
	mov	r0, r4
	mov	r1, #2
	blx	r9
	mov	r0, r4
	mov	r1, #1
	add	r4, r4, #1
	blx	r8
	cmp	r4, r5
	bne	.L9
	b	.L8
.L25:
	add	r4, r4, #1
	mov	r1, #8
	mov	r0, r4
	mvn	r2, #13
	mov	r3, #0
	movw	r5, #325
	blx	r10
.L16:
	mov	r1, #1
	mov	r0, r4
	add	r4, r4, r1
	blx	r7
	cmp	r4, r5
	bne	.L16
	b	.L15
.L24:
	mvn	r2, #13
	mov	r3, #0
	mov	r1, #2
	movw	r0, #299
	blx	r10
	mov	r1, #0
	movw	r0, #299
	blx	fp
	mov	r1, #2
	movw	r0, #299
	blx	r6
	movw	r0, #299
	ldr	r1, [sp, #4]
	blx	r5
	mov	r1, #0
	mov	r0, #300
	blx	fp
	mov	r1, #2
	mov	r0, #300
	blx	r6
	mov	r0, #300
	ldr	r1, [sp, #4]
	blx	r5
	b	.L8
.L26:
	mvn	r2, #13
	mov	r3, #0
	mov	r1, #2
	movw	r0, #317
	blx	r10
	movw	r0, #317
	ldr	r1, [sp, #8]
	blx	r5
	movw	r0, #318
	ldr	r1, [sp, #8]
	blx	r5
	b	.L15
	.fnend
	.size	exynos4_c2c_cfg_gpio, .-exynos4_c2c_cfg_gpio
	.align	2
	.global	exynos5_c2c_cfg_gpio
	.type	exynos5_c2c_cfg_gpio, %function
exynos5_c2c_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r10, #:lower16:s3c_gpio_cfgall_range
	.pad #20
	sub	sp, sp, #20
	mov	r4, #254
	movw	r7, #:lower16:s5p_gpio_set_drvstr
	movw	r9, #:lower16:s5p_gpio_set_pd_cfg
	stmib	sp, {r0, r1, r2}
	movw	r8, #:lower16:s5p_gpio_set_pd_pull
	movt	r10, #:upper16:s3c_gpio_cfgall_range
	mov	r0, r4
	mov	r1, #8
	mvn	r2, #13
	mov	r3, #0
	movt	r7, #:upper16:s5p_gpio_set_drvstr
	movt	r9, #:upper16:s5p_gpio_set_pd_cfg
	movt	r8, #:upper16:s5p_gpio_set_pd_pull
	blx	r10
.L29:
	mov	r0, r4
	mov	r1, #0
	blx	r7
	mov	r0, r4
	mov	r1, #2
	blx	r9
	mov	r0, r4
	mov	r1, #1
	blx	r8
	add	r4, r4, #1
	movw	r3, #262
	cmp	r4, r3
	movw	fp, #:lower16:s5p_gpio_set_drvstr
	movw	r6, #:lower16:s5p_gpio_set_pd_cfg
	movw	r5, #:lower16:s5p_gpio_set_pd_pull
	movt	fp, #:upper16:s5p_gpio_set_drvstr
	movt	r6, #:upper16:s5p_gpio_set_pd_cfg
	movt	r5, #:upper16:s5p_gpio_set_pd_pull
	bne	.L29
	ldr	r2, [sp, #4]
	cmp	r2, #2
	beq	.L46
	ldr	r3, [sp, #4]
	cmp	r3, #1
	beq	.L47
.L32:
	mov	r4, #272
	mov	r1, #8
	mov	r0, r4
	mvn	r2, #13
	mov	r3, #0
	blx	r10
.L36:
	mov	r1, #1
	mov	r0, r4
	add	r4, r4, r1
	movw	r5, #:lower16:s5p_gpio_set_drvstr
	blx	r7
	cmp	r4, #280
	movt	r5, #:upper16:s5p_gpio_set_drvstr
	bne	.L36
	ldr	r2, [sp, #8]
	cmp	r2, #2
	beq	.L48
	ldr	r3, [sp, #8]
	cmp	r3, #1
	beq	.L49
.L39:
	mvn	r2, #13
	mov	r3, #0
	mov	r1, #2
	movw	r0, #290
	blx	r10
	mov	r1, #2
	movw	r0, #290
	blx	r9
	mov	r1, #1
	movw	r0, #290
	blx	r8
@ 136 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/setup-c2c.c" 1
	dsb
@ 0 "" 2
	movw	r3, #:lower16:outer_cache
	movt	r3, #:upper16:outer_cache
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L42
	blx	r3
.L42:
	ldr	r2, [sp, #12]
	mov	r3, #5
	str	r3, [r2]
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L46:
	movw	r4, #263
	mov	r1, #8
	mov	r0, r4
	mvn	r2, #13
	mov	r3, #0
	movw	r5, #271
	blx	r10
.L33:
	mov	r0, r4
	mov	r1, #0
	blx	r7
	mov	r0, r4
	mov	r1, #2
	blx	r9
	mov	r0, r4
	mov	r1, #1
	add	r4, r4, #1
	blx	r8
	cmp	r4, r5
	bne	.L33
	b	.L32
.L48:
	add	r4, r4, #1
	mov	r1, #8
	mov	r0, r4
	mvn	r2, #13
	mov	r3, #0
	movw	r5, #289
	blx	r10
.L40:
	mov	r1, #1
	mov	r0, r4
	add	r4, r4, r1
	blx	r7
	cmp	r4, r5
	bne	.L40
	b	.L39
.L47:
	mvn	r2, #13
	mov	r3, #0
	mov	r1, #2
	movw	r0, #263
	blx	r10
	mov	r1, #0
	movw	r0, #263
	blx	fp
	mov	r1, #2
	movw	r0, #263
	blx	r6
	movw	r0, #263
	ldr	r1, [sp, #4]
	blx	r5
	mov	r1, #0
	mov	r0, #264
	blx	fp
	mov	r1, #2
	mov	r0, #264
	blx	r6
	mov	r0, #264
	ldr	r1, [sp, #4]
	blx	r5
	b	.L32
.L49:
	mvn	r2, #13
	mov	r3, #0
	mov	r1, #2
	movw	r0, #281
	blx	r10
	movw	r0, #281
	ldr	r1, [sp, #8]
	blx	r5
	movw	r0, #282
	ldr	r1, [sp, #8]
	blx	r5
	b	.L39
	.fnend
	.size	exynos5_c2c_cfg_gpio, .-exynos5_c2c_cfg_gpio
	.align	2
	.global	exynos_c2c_cfg_gpio
	.type	exynos_c2c_cfg_gpio, %function
exynos_c2c_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:samsung_cpu_id
	mov	r2, #0
	movt	r3, #:upper16:samsung_cpu_id
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L51
	cmn	r3, #465567744
	bxne	lr
.L51:
	mov	r2, #172
	movt	r2, 65068
	b	exynos4_c2c_cfg_gpio
	.fnend
	.size	exynos_c2c_cfg_gpio, .-exynos_c2c_cfg_gpio
	.ident	"GCC: (GNU) 4.8"
