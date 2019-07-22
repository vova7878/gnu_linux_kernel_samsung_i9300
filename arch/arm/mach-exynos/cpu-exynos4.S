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
	.file	"cpu-exynos4.c"
	.text
	.align	2
	.type	exynos4_core_init, %function
exynos4_core_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:subsys_system_register
	mov	r1, #0
	movt	r3, #:upper16:subsys_system_register
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_core_init, .-exynos4_core_init
	.align	2
	.type	exynos4_l2x0_cache_init, %function
exynos4_l2x0_cache_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:samsung_cpu_id
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r3, #:upper16:samsung_cpu_id
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmn	r3, #465567744
	movne	r3, #805306375
	beq	.L7
.L3:
	movw	r4, #:lower16:exynos_smc
	mov	r1, #272
	movt	r4, #:upper16:exynos_smc
	mov	r2, #288
	mvn	r0, #21
	blx	r4
	mov	r2, #1
	movw	r3, #65535
	movt	r2, 31815
	movt	r3, 49664
	mov	r1, #3
	mvn	r0, #22
	blx	r4
	mov	r1, #0
	mvn	r0, #23
	mov	r2, r1
	mov	r3, r1
	blx	r4
	mov	r2, #0
	mov	r1, #1
	mov	r3, r2
	mvn	r0, #20
	blx	r4
	mov	r0, #0
	mov	r1, #1
	movw	r2, #65535
	movw	r3, #:lower16:l2x0_init
	movt	r0, 65120
	movt	r1, 31815
	movt	r2, 49664
	movt	r3, #:upper16:l2x0_init
	blx	r3
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
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
.L7:
	movw	r3, #:lower16:samsung_rev
	movt	r3, #:upper16:samsung_rev
	blx	r3
	mov	r3, #7
	cmp	r0, #15
	movt	r3, 28928
	movls	r3, #805306375
	b	.L3
	.fnend
	.size	exynos4_l2x0_cache_init, .-exynos4_l2x0_cache_init
	.align	2
	.type	exynos4_sw_reset, %function
exynos4_sw_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r5, #:lower16:__const_udelay
	mov	r7, #0
	movt	r5, #:upper16:__const_udelay
	movt	r7, 65048
	mov	r6, #3
	mov	r8, #1
.L12:
	mov	r4, #500
	str	r8, [r7, #1024]
.L10:
	movw	r0, #12560
	movt	r0, 4915
	blx	r5
	subs	r4, r4, #1
	bne	.L10
	subs	r6, r6, #1
	bne	.L12
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	exynos4_sw_reset, .-exynos4_sw_reset
	.align	2
	.type	exynos4_idle, %function
exynos4_idle:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3]
	tst	r3, #2
	bne	.L14
	movw	r3, #:lower16:processor
	movt	r3, #:upper16:processor
	ldr	r3, [r3, #20]
	blx	r3
.L14:
@ 26 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/irqflags.h" 1
		cpsie i			@ arch_local_irq_enable
@ 0 "" 2
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_idle, .-exynos4_idle
	.align	2
	.global	exynos4_map_io
	.type	exynos4_map_io, %function
exynos4_map_io:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r5, #:lower16:.LANCHOR0
	movt	r5, #:upper16:.LANCHOR0
	movw	r4, #:lower16:iotable_init
	movt	r4, #:upper16:iotable_init
	add	r0, r5, #64
	mov	r1, #21
	movw	fp, #:lower16:exynos4_setup_sdhci3_cfg_gpio
	blx	r4
	add	r0, r5, #400
	mov	r1, #4
	blx	r4
	movw	r1, #:lower16:s3c_hsmmc2_def_platdata
	movw	r4, #:lower16:exynos4_setup_sdhci2_cfg_gpio
	movt	r1, #:upper16:s3c_hsmmc2_def_platdata
	movt	r4, #:upper16:exynos4_setup_sdhci2_cfg_gpio
	str	r4, [r1, #44]
	movw	ip, #:lower16:exynos4_hsmmc_clksrcs
	movw	r0, #:lower16:exynos4_setup_sdhci_cfg_card
	movw	r2, #:lower16:s3c_hsmmc3_def_platdata
	movw	r3, #:lower16:s3c_mshci_def_platdata
	movw	r10, #:lower16:exynos4_mshci_clksrcs
	movw	r9, #:lower16:exynos4_setup_mshci_cfg_gpio
	movw	r8, #:lower16:exynos4_setup_mshci_cfg_card
	movw	r7, #:lower16:exynos4_setup_mshci_cfg_ddr
	movw	r6, #:lower16:exynos4_setup_mshci_init_card
	movw	r5, #:lower16:exynos4_setup_mshci_set_power
	movw	lr, #:lower16:exynos4_setup_mshci_shutdown
	movw	r4, #:lower16:exynos4_i2sv3_setup_resource
	movt	r3, #:upper16:s3c_mshci_def_platdata
	movt	r2, #:upper16:s3c_hsmmc3_def_platdata
	movt	ip, #:upper16:exynos4_hsmmc_clksrcs
	movt	r0, #:upper16:exynos4_setup_sdhci_cfg_card
	movt	r5, #:upper16:exynos4_setup_mshci_set_power
	movt	lr, #:upper16:exynos4_setup_mshci_shutdown
	movt	r4, #:upper16:exynos4_i2sv3_setup_resource
	movt	fp, #:upper16:exynos4_setup_sdhci3_cfg_gpio
	movt	r10, #:upper16:exynos4_mshci_clksrcs
	movt	r9, #:upper16:exynos4_setup_mshci_cfg_gpio
	movt	r8, #:upper16:exynos4_setup_mshci_cfg_card
	movt	r7, #:upper16:exynos4_setup_mshci_cfg_ddr
	movt	r6, #:upper16:exynos4_setup_mshci_init_card
	str	ip, [r1, #16]
	str	r0, [r1, #48]
	str	ip, [r2, #16]
	str	r0, [r2, #48]
	str	r5, [r3, #60]
	movw	r5, #:lower16:.LC0
	str	fp, [r2, #44]
	movt	r5, #:upper16:.LC0
	str	r10, [r3, #16]
	str	r9, [r3, #48]
	str	r8, [r3, #64]
	str	r7, [r3, #52]
	str	r6, [r3, #56]
	str	lr, [r3, #68]
	blx	r4
	movw	r4, #:lower16:s3c_device_rtc
	movw	r0, #:lower16:s3c_device_adc
	movw	ip, #:lower16:.LC1
	movw	r1, #:lower16:s3c_device_i2c0
	movw	r3, #:lower16:.LC2
	movw	r2, #:lower16:s3c_device_i2c1
	movt	r3, #:upper16:.LC2
	movt	r4, #:upper16:s3c_device_rtc
	movt	r0, #:upper16:s3c_device_adc
	movt	ip, #:upper16:.LC1
	movt	r1, #:upper16:s3c_device_i2c0
	movt	r2, #:upper16:s3c_device_i2c1
	str	r5, [r4]
	str	ip, [r0]
	str	r3, [r1]
	str	r3, [r2]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.fnend
	.size	exynos4_map_io, .-exynos4_map_io
	.align	2
	.global	exynos4_init_clocks
	.type	exynos4_init_clocks, %function
exynos4_init_clocks:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r1, #:lower16:.LANCHOR1
	mov	r4, r0
	movw	r3, #:lower16:printk
	movw	r0, #:lower16:.LC3
	movt	r1, #:upper16:.LANCHOR1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC3
	blx	r3
	movw	r3, #:lower16:s3c24xx_register_baseclocks
	mov	r0, r4
	movt	r3, #:upper16:s3c24xx_register_baseclocks
	blx	r3
	movw	r3, #:lower16:exynos4212_register_clocks
	movt	r3, #:upper16:exynos4212_register_clocks
	blx	r3
	movw	r3, #:lower16:s5p_register_clocks
	mov	r0, r4
	movt	r3, #:upper16:s5p_register_clocks
	blx	r3
	movw	r3, #:lower16:exynos4_register_clocks
	movt	r3, #:upper16:exynos4_register_clocks
	blx	r3
	movw	r3, #:lower16:exynos4_setup_clocks
	movt	r3, #:upper16:exynos4_setup_clocks
	blx	r3
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	exynos4_init_clocks, .-exynos4_init_clocks
	.align	2
	.global	exynos4_init_irq
	.type	exynos4_init_irq, %function
exynos4_init_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r10, #:lower16:samsung_cpu_id
	movt	r10, #:upper16:samsung_cpu_id
	mov	r1, #0
	movt	r1, 58432
	mov	r4, #0
	ldr	r5, [r10]
	movw	lr, #:lower16:.LANCHOR2
	.pad #8
	sub	sp, sp, #8
	movt	lr, #:upper16:.LANCHOR2
	mov	r2, r4
	mov	r3, r4
	movw	ip, #:lower16:gic_init_bases
	str	r4, [sp, #4]
	mov	r5, r5, lsr #17
	movt	r2, 65154
	movt	r3, 65153
	cmp	r1, r5, asl #17
	mov	r0, r4
	movt	ip, #:upper16:gic_init_bases
	movne	r5, #32768
	moveq	r5, #16384
	mov	r1, #60
	str	r5, [sp]
	movw	r9, #:lower16:combiner_init
	str	r5, [lr]
	movw	r8, #:lower16:combiner_cascade_irq
	blx	ip
	movt	r9, #:upper16:combiner_init
	movw	r3, #:lower16:gic_arch_extn
	movw	r2, #:lower16:s3c_irq_wake
	movt	r8, #:upper16:combiner_cascade_irq
	mov	r5, #192
	movt	r3, #:upper16:gic_arch_extn
	movt	r2, #:upper16:s3c_irq_wake
	str	r2, [r3, #52]
.L20:
	mov	r1, r4, asr #2
	mov	r2, r5
	mov	r0, r4
	mov	r1, r1, asl #4
	movw	r7, #:lower16:combiner_init
	movw	r6, #:lower16:combiner_cascade_irq
	sub	r1, r1, #26214400
	add	r5, r5, #8
	blx	r9
	mov	r0, r4
	add	r1, r4, #64
	add	r4, r4, #1
	movt	r7, #:upper16:combiner_init
	blx	r8
	cmp	r4, #16
	movt	r6, #:upper16:combiner_cascade_irq
	bne	.L20
	ldr	r3, [r10]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmn	r3, #465567744
	beq	.L25
.L22:
	mov	r0, #0
	movw	r3, #:lower16:s5p_init_irq
	mov	r1, r0
	movt	r3, #:upper16:s5p_init_irq
	blx	r3
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L25:
	movw	r3, #:lower16:samsung_rev
	movt	r3, #:upper16:samsung_rev
	blx	r3
	cmp	r0, #15
	bls	.L22
	mov	r1, #64
	mov	r2, #320
	mov	r0, r4
	movt	r1, 65136
	blx	r7
	mov	r0, r4
	mov	r1, #171
	blx	r6
	mov	r1, #64
	mov	r2, #328
	movt	r1, 65136
	mov	r0, #17
	blx	r7
	mov	r0, #17
	mov	r1, #172
	blx	r6
	mov	r1, #64
	mov	r2, #336
	movt	r1, 65136
	mov	r0, #18
	blx	r7
	mov	r0, #18
	mov	r1, #112
	blx	r6
	mov	r1, #64
	mov	r2, #344
	movt	r1, 65136
	mov	r0, #19
	blx	r7
	mov	r0, #19
	mov	r1, #113
	blx	r6
	b	.L22
	.fnend
	.size	exynos4_init_irq, .-exynos4_init_irq
	.align	2
	.global	exynos4_init
	.type	exynos4_init, %function
exynos4_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r0, #:lower16:.LC4
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC4
	movt	r3, #:upper16:printk
	movw	r4, #:lower16:exynos4_idle
	blx	r3
	movw	lr, #:lower16:pm_idle
	mov	r1, #4096
	movw	r3, #:lower16:s5p_reset_hook
	movw	r2, #:lower16:exynos4_sw_reset
	movw	ip, #:lower16:cpu_possible_mask
	mov	r0, #0
	movt	r4, #:upper16:exynos4_idle
	movt	r1, 65048
	movt	lr, #:upper16:pm_idle
	movt	r3, #:upper16:s5p_reset_hook
	movt	r2, #:upper16:exynos4_sw_reset
	movt	ip, #:upper16:cpu_possible_mask
	movw	r5, #8200
	movw	r6, #:lower16:__sw_hweight32
	str	r4, [lr]
	movt	r5, 65048
	str	r0, [r1, #372]
	mov	r4, r0
	str	r0, [r1, #952]
	movt	r6, #:upper16:__sw_hweight32
	ldr	r7, [ip]
	str	r2, [r3]
	b	.L27
.L28:
	ldr	r3, [r5]
	bic	r3, r3, #256
	str	r3, [r5], #128
.L27:
	ldr	r0, [r7]
	and	r0, r0, #15
	blx	r6
	cmp	r4, r0
	add	r4, r4, #1
	bcc	.L28
	movw	r3, #:lower16:samsung_cpu_id
	mov	r2, #0
	movt	r3, #:upper16:samsung_cpu_id
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L29
	cmn	r3, #465567744
	beq	.L29
.L30:
	movw	r3, #:lower16:device_register
	ldr	r0, .L31
	movt	r3, #:upper16:device_register
	blx	r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L29:
	mov	r3, #0
	movt	r3, 65048
	ldr	r2, [r3, #1032]
	bic	r2, r2, #1048576
	str	r2, [r3, #1032]
	ldr	r2, [r3, #1036]
	bic	r2, r2, #1048576
	str	r2, [r3, #1036]
	b	.L30
.L32:
	.align	2
.L31:
	.word	.LANCHOR0+464
	.fnend
	.size	exynos4_init, .-exynos4_init
	.global	exynos4_subsys
	.global	gic_bank_offset
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.20493, %object
	.size	__func__.20493, 20
__func__.20493:
	.ascii	"exynos4_init_clocks\000"
	.section	.initcallearly.init,"aw",%progbits
	.align	2
	.type	__initcall_exynos4_l2x0_cache_initearly, %object
	.size	__initcall_exynos4_l2x0_cache_initearly, 4
__initcall_exynos4_l2x0_cache_initearly:
	.word	exynos4_l2x0_cache_init
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	exynos4_subsys, %object
	.size	exynos4_subsys, 64
exynos4_subsys:
	.word	.LC5
	.word	.LC5
	.space	56
	.type	exynos4_iodesc, %object
	.size	exynos4_iodesc, 336
exynos4_iodesc:
	.word	-28311552
	.word	65616
	.word	4096
	.word	0
	.word	-32505856
	.word	65584
	.word	131072
	.word	0
	.word	-31981568
	.word	65568
	.word	65536
	.word	0
	.word	-26214400
	.word	66624
	.word	4096
	.word	0
	.word	-25165824
	.word	66816
	.word	8192
	.word	0
	.word	-27262976
	.word	66818
	.word	4096
	.word	0
	.word	-31457280
	.word	70656
	.word	4096
	.word	0
	.word	-31195136
	.word	69632
	.word	4096
	.word	0
	.word	-30932992
	.word	14432
	.word	256
	.word	0
	.word	-30670848
	.word	67296
	.word	256
	.word	0
	.word	-50331648
	.word	79872
	.word	524288
	.word	0
	.word	-28573696
	.word	75120
	.word	4096
	.word	0
	.word	-24117248
	.word	75184
	.word	4096
	.word	0
	.word	-25100288
	.word	66688
	.word	65536
	.word	0
	.word	-25034752
	.word	66704
	.word	65536
	.word	0
	.word	-24051712
	.word	14352
	.word	4096
	.word	0
	.word	-23904256
	.word	67264
	.word	8192
	.word	0
	.word	-23920640
	.word	67232
	.word	8192
	.word	0
	.word	-23912448
	.word	67248
	.word	8192
	.word	0
	.word	-23855104
	.word	71168
	.word	4096
	.word	0
	.word	-23851008
	.word	70144
	.word	4096
	.word	0
	.type	exynos4212_iodesc, %object
	.size	exynos4212_iodesc, 64
exynos4212_iodesc:
	.word	-29097984
	.word	67072
	.word	65536
	.word	0
	.word	-28835840
	.word	67088
	.word	65536
	.word	0
	.word	-29360128
	.word	8224
	.word	4096
	.word	0
	.word	-29294592
	.word	8271
	.word	4096
	.word	0
	.type	exynos4_dev, %object
	.size	exynos4_dev, 336
exynos4_dev:
	.space	76
	.word	exynos4_subsys
	.space	256
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"exynos-rtc\000"
	.space	1
.LC1:
	.ascii	"samsung-adc-v4\000"
	.space	1
.LC2:
	.ascii	"s3c2440-i2c\000"
.LC3:
	.ascii	"<7>%s: initializing clocks\012\000"
.LC4:
	.ascii	"<6>EXYNOS4: Initializing architecture\012\000"
	.space	1
.LC5:
	.ascii	"exynos4-core\000"
	.section	.initcall1.init,"aw",%progbits
	.align	2
	.type	__initcall_exynos4_core_init1, %object
	.size	__initcall_exynos4_core_init1, 4
__initcall_exynos4_core_init1:
	.word	exynos4_core_init
	.section	.data..read_mostly,"aw",%progbits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	gic_bank_offset, %object
	.size	gic_bank_offset, 4
gic_bank_offset:
	.space	4
	.ident	"GCC: (GNU) 4.8"
