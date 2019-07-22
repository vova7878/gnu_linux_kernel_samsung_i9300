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
	.file	"pmu-exynos4.c"
	.text
	.align	2
	.global	exynos4_pmu_xclkout_set
	.type	exynos4_pmu_xclkout_set, %function
exynos4_pmu_xclkout_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r3, #0
	movt	r3, 65048
	cmp	r0, #0
	movw	r0, #:lower16:.LC0
	ldr	r2, [r3, #2560]
	movt	r0, #:upper16:.LC0
	bicne	r2, r2, #3840
	orreq	r2, r2, #1
	bicne	r2, r2, #1
	streq	r2, [r3, #2560]
	orrne	r1, r2, r1, asl #8
	mov	r2, #0
	movt	r2, 65048
	strne	r1, [r3, #2560]
	movw	r3, #:lower16:printk
	ldr	r1, [r2, #2560]
	movt	r3, #:upper16:printk
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_pmu_xclkout_set, .-exynos4_pmu_xclkout_set
	.align	2
	.global	exynos4_sys_powerdown_xusbxti_control
	.type	exynos4_sys_powerdown_xusbxti_control, %function
exynos4_sys_powerdown_xusbxti_control:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:.LANCHOR0
	cmp	r0, #0
	movt	r3, #:upper16:.LANCHOR0
	moveq	r1, r0
	ldr	r2, [r3]
	ldrne	r0, [r3, #4]
	movne	r3, #1
	ldreq	r3, [r3, #4]
	movne	r1, r3
	addne	r2, r0, r2, asl #4
	addeq	r2, r3, r2, asl #4
	strne	r3, [r2, #-4]
	movw	r3, #:lower16:printk
	streq	r0, [r2, #-4]
	movw	r0, #:lower16:.LC1
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_sys_powerdown_xusbxti_control, .-exynos4_sys_powerdown_xusbxti_control
	.align	2
	.type	exynos4_pmu_init, %function
exynos4_pmu_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r3, #:lower16:cpu_possible_mask
	movw	r5, #8200
	movt	r3, #:upper16:cpu_possible_mask
	movw	r6, #:lower16:__sw_hweight32
	movt	r5, 65048
	ldr	r7, [r3]
	movt	r6, #:upper16:__sw_hweight32
	mov	r4, #0
	b	.L8
.L9:
	ldr	r3, [r5]
	orr	r3, r3, #4096
	str	r3, [r5], #128
.L8:
	ldr	r0, [r7]
	and	r0, r0, #15
	blx	r6
	cmp	r4, r0
	add	r4, r4, #1
	bcc	.L9
	movw	r3, #:lower16:samsung_cpu_id
	mov	r2, #0
	movt	r3, #:upper16:samsung_cpu_id
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L14
	cmn	r3, #465567744
	beq	.L15
	movw	r0, #:lower16:.LC4
	movw	r1, #:lower16:.LANCHOR2
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC4
	movt	r1, #:upper16:.LANCHOR2
	movt	r3, #:upper16:printk
	blx	r3
.L11:
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L15:
	ldr	r4, .L16
	mov	lr, #96
	movw	r3, #:lower16:.LANCHOR0
	movw	r0, #:lower16:.LC3
	movw	r1, #:lower16:.LANCHOR2
	movw	ip, #:lower16:printk
	movt	r3, #:upper16:.LANCHOR0
	mov	r2, lr
	movt	r1, #:upper16:.LANCHOR2
	movt	ip, #:upper16:printk
	movt	r0, #:upper16:.LC3
	str	r4, [r3, #4]
	str	lr, [r3]
	blx	ip
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L14:
	mov	r4, #103
	movw	r3, #:lower16:.LANCHOR0
	movw	lr, #:lower16:.LANCHOR1
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LANCHOR2
	movw	ip, #:lower16:printk
	movt	r3, #:upper16:.LANCHOR0
	movt	lr, #:upper16:.LANCHOR1
	mov	r2, r4
	movt	r1, #:upper16:.LANCHOR2
	movt	ip, #:upper16:printk
	movt	r0, #:upper16:.LC2
	stmia	r3, {r4, lr}
	blx	ip
	b	.L11
.L17:
	.align	2
.L16:
	.word	.LANCHOR1+1648
	.fnend
	.size	exynos4_pmu_init, .-exynos4_pmu_init
	.align	2
	.global	exynos4_sys_powerdown_conf
	.type	exynos4_sys_powerdown_conf, %function
exynos4_sys_powerdown_conf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	str	r4, [sp, #-4]!
	.save {r4}
	movt	r3, #:upper16:.LANCHOR0
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L22
	ldr	r1, [r3, #4]
	sub	r2, r2, #-268435455
	mov	r3, r0, asl #2
	rsb	r4, r0, r0, asl #30
	sub	ip, r1, #12
	mov	r4, r4, asl #2
	add	r1, r1, r2, asl #4
	add	ip, ip, r3
	add	r3, r1, r3
	add	r3, r3, #4
.L23:
	add	r2, r3, r4
	ldr	r1, [r3], #-16
	ldr	r2, [r2, #-4]
	cmp	r3, ip
	str	r1, [r2]
	bne	.L23
.L22:
	mov	r3, #0
	movt	r3, 65048
	ldr	r3, [r3, #36]
	cmp	r3, #0
	beq	.L18
	ldr	r3, .L34
	mov	r0, r0, asl #2
	add	ip, r3, #144
.L25:
	mov	r2, r3
	add	r3, r3, #16
	ldr	r1, [r2], r0
	cmp	r3, ip
	ldr	r2, [r2, #4]
	str	r2, [r1]
	bne	.L25
	movw	r3, #:lower16:samsung_cpu_id
	mov	r2, #0
	movt	r3, #:upper16:samsung_cpu_id
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	cmp	r2, r3, asl #17
	beq	.L33
.L26:
	ldr	ip, .L34+4
	mov	r2, #0
.L27:
	mov	r3, ip
	ldr	r1, [r3, r2]!
	add	r2, r2, #8
	cmp	r2, #24
	ldr	r3, [r3, #4]
	ldr	r0, [r1]
	orr	r3, r0, r3
	str	r3, [r1]
	bne	.L27
.L18:
	ldr	r4, [sp], #4
	bx	lr
.L33:
	movw	r3, #:lower16:.LANCHOR2
	mov	r2, #4096
	movt	r3, #:upper16:.LANCHOR2
	movt	r2, 65048
	add	r3, r3, r0
	ldr	r3, [r3, #168]
	str	r3, [r2, #960]
	b	.L26
.L35:
	.align	2
.L34:
	.word	.LANCHOR2+20
	.word	.LANCHOR1+3184
	.fnend
	.size	exynos4_sys_powerdown_conf, .-exynos4_sys_powerdown_conf
	.align	2
	.global	exynos4_c2c_request_pwr_mode
	.type	exynos4_c2c_request_pwr_mode, %function
exynos4_c2c_request_pwr_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	cmp	r0, #2
	movw	r4, #:lower16:.LANCHOR1
	mov	r3, #3
	movt	r4, #:upper16:.LANCHOR1
	str	r3, [r4, #3188]
	bne	.L41
	movw	r3, #:lower16:samsung_cpu_id
	mov	r2, #0
	movt	r3, #:upper16:samsung_cpu_id
	str	r2, [r4, #3196]
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmn	r3, #465567744
	beq	.L42
.L39:
	mov	r3, #0
	str	r3, [r4, #3204]
	ldmfd	sp!, {r4, pc}
.L41:
	mov	r2, #1
	str	r3, [r4, #3196]
	str	r2, [r4, #3204]
	ldmfd	sp!, {r4, pc}
.L42:
	movw	r3, #:lower16:samsung_rev
	movt	r3, #:upper16:samsung_rev
	blx	r3
	cmp	r0, #15
	movls	r3, #1
	strls	r3, [r4, #3204]
	ldmlsfd	sp!, {r4, pc}
	b	.L39
	.fnend
	.size	exynos4_c2c_request_pwr_mode, .-exynos4_c2c_request_pwr_mode
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.13020, %object
	.size	__func__.13020, 17
__func__.13020:
	.ascii	"exynos4_pmu_init\000"
	.space	3
	.type	exynos4x12_c2c_pmu_conf, %object
	.size	exynos4x12_c2c_pmu_conf, 144
exynos4x12_c2c_pmu_conf:
	.word	-31977188
	.word	1
	.word	1
	.word	1
	.word	-31977168
	.word	1
	.word	0
	.word	0
	.word	-31977068
	.word	1
	.word	0
	.word	0
	.word	-31977064
	.word	3
	.word	0
	.word	0
	.word	-31977040
	.word	1
	.word	1
	.word	1
	.word	-31977036
	.word	1
	.word	0
	.word	0
	.word	-31976900
	.word	1
	.word	1
	.word	1
	.word	-31976636
	.word	1
	.word	1
	.word	0
	.word	-31976632
	.word	1
	.word	0
	.word	0
	.type	exynos4212_c2c_pmu_conf, %object
	.size	exynos4212_c2c_pmu_conf, 16
exynos4212_c2c_pmu_conf:
	.word	-31976512
	.word	1
	.word	0
	.word	0
	.section	.initcall3.init,"aw",%progbits
	.align	2
	.type	__initcall_exynos4_pmu_init3, %object
	.size	__initcall_exynos4_pmu_init3, 4
__initcall_exynos4_pmu_init3:
	.word	exynos4_pmu_init
	.section	___ksymtab_gpl+exynos4_pmu_xclkout_set,"a",%progbits
	.align	2
	.type	__ksymtab_exynos4_pmu_xclkout_set, %object
	.size	__ksymtab_exynos4_pmu_xclkout_set, 8
__ksymtab_exynos4_pmu_xclkout_set:
	.word	exynos4_pmu_xclkout_set
	.word	__kstrtab_exynos4_pmu_xclkout_set
	.section	___ksymtab_gpl+exynos4_sys_powerdown_xusbxti_control,"a",%progbits
	.align	2
	.type	__ksymtab_exynos4_sys_powerdown_xusbxti_control, %object
	.size	__ksymtab_exynos4_sys_powerdown_xusbxti_control, 8
__ksymtab_exynos4_sys_powerdown_xusbxti_control:
	.word	exynos4_sys_powerdown_xusbxti_control
	.word	__kstrtab_exynos4_sys_powerdown_xusbxti_control
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	exynos4212_pmu_config, %object
	.size	exynos4212_pmu_config, 1648
exynos4212_pmu_config:
	.word	-31977472
	.word	0
	.word	0
	.word	2
	.word	-31977468
	.word	0
	.word	0
	.word	0
	.word	-31977464
	.word	0
	.word	0
	.word	0
	.word	-31977456
	.word	0
	.word	0
	.word	2
	.word	-31977452
	.word	0
	.word	0
	.word	0
	.word	-31977448
	.word	0
	.word	0
	.word	0
	.word	-31977392
	.word	1
	.word	0
	.word	0
	.word	-31977388
	.word	0
	.word	0
	.word	0
	.word	-31977384
	.word	1
	.word	0
	.word	0
	.word	-31977344
	.word	0
	.word	0
	.word	2
	.word	-31977280
	.word	0
	.word	0
	.word	3
	.word	-31971832
	.word	16
	.word	16
	.word	0
	.word	-31977276
	.word	0
	.word	0
	.word	3
	.word	-31971800
	.word	16
	.word	16
	.word	0
	.word	-31977216
	.word	1
	.word	0
	.word	0
	.word	-31977212
	.word	1
	.word	0
	.word	0
	.word	-31977204
	.word	1
	.word	1
	.word	0
	.word	-31976528
	.word	1
	.word	1
	.word	1
	.word	-31976524
	.word	1
	.word	1
	.word	1
	.word	-31976512
	.word	1
	.word	1
	.word	1
	.word	-31977200
	.word	1
	.word	0
	.word	0
	.word	-31977196
	.word	1
	.word	0
	.word	0
	.word	-31977188
	.word	1
	.word	1
	.word	0
	.word	-31977184
	.word	1
	.word	0
	.word	0
	.word	-31977180
	.word	1
	.word	0
	.word	0
	.word	-31977176
	.word	1
	.word	0
	.word	0
	.word	-31977172
	.word	1
	.word	1
	.word	0
	.word	-31977168
	.word	1
	.word	0
	.word	0
	.word	-31977160
	.word	1
	.word	0
	.word	0
	.word	-31977156
	.word	1
	.word	0
	.word	0
	.word	-31977152
	.word	1
	.word	0
	.word	0
	.word	-31977148
	.word	1
	.word	0
	.word	0
	.word	-31977144
	.word	1
	.word	0
	.word	0
	.word	-31977140
	.word	1
	.word	0
	.word	0
	.word	-31977136
	.word	1
	.word	0
	.word	0
	.word	-31977132
	.word	1
	.word	0
	.word	0
	.word	-31977128
	.word	1
	.word	0
	.word	0
	.word	-31977124
	.word	0
	.word	0
	.word	0
	.word	-31977120
	.word	1
	.word	0
	.word	0
	.word	-31977116
	.word	1
	.word	0
	.word	0
	.word	-31977112
	.word	1
	.word	0
	.word	0
	.word	-31977108
	.word	1
	.word	0
	.word	0
	.word	-31977104
	.word	1
	.word	0
	.word	0
	.word	-31977100
	.word	0
	.word	0
	.word	0
	.word	-31977096
	.word	1
	.word	1
	.word	0
	.word	-31977092
	.word	1
	.word	0
	.word	0
	.word	-31977088
	.word	3
	.word	0
	.word	0
	.word	-31977084
	.word	1
	.word	0
	.word	1
	.word	-31977080
	.word	3
	.word	0
	.word	3
	.word	-31977072
	.word	3
	.word	0
	.word	0
	.word	-31977068
	.word	1
	.word	0
	.word	1
	.word	-31977064
	.word	3
	.word	0
	.word	3
	.word	-31977056
	.word	1
	.word	1
	.word	0
	.word	-31977052
	.word	1
	.word	0
	.word	1
	.word	-31977040
	.word	1
	.word	1
	.word	0
	.word	-31977036
	.word	1
	.word	0
	.word	1
	.word	-31977024
	.word	3
	.word	0
	.word	0
	.word	-31969784
	.word	16
	.word	16
	.word	0
	.word	-31977020
	.word	3
	.word	0
	.word	0
	.word	-31969752
	.word	16
	.word	16
	.word	0
	.word	-31977016
	.word	3
	.word	0
	.word	0
	.word	-31969720
	.word	16
	.word	16
	.word	0
	.word	-31977012
	.word	3
	.word	0
	.word	0
	.word	-31969688
	.word	16
	.word	16
	.word	0
	.word	-31977008
	.word	3
	.word	0
	.word	0
	.word	-31969656
	.word	16
	.word	16
	.word	0
	.word	-31977004
	.word	3
	.word	0
	.word	0
	.word	-31969624
	.word	16
	.word	16
	.word	0
	.word	-31977000
	.word	3
	.word	0
	.word	0
	.word	-31969592
	.word	16
	.word	16
	.word	0
	.word	-31976996
	.word	3
	.word	0
	.word	0
	.word	-31969464
	.word	16
	.word	16
	.word	0
	.word	-31976960
	.word	1
	.word	0
	.word	0
	.word	-31976956
	.word	1
	.word	1
	.word	0
	.word	-31976928
	.word	1
	.word	0
	.word	0
	.word	-31976924
	.word	1
	.word	0
	.word	0
	.word	-31976920
	.word	1
	.word	0
	.word	0
	.word	-31976916
	.word	1
	.word	0
	.word	0
	.word	-31976912
	.word	1
	.word	0
	.word	0
	.word	-31976908
	.word	1
	.word	0
	.word	0
	.word	-31976900
	.word	1
	.word	0
	.word	0
	.word	-31976896
	.word	1
	.word	0
	.word	0
	.word	-31976880
	.word	1
	.word	0
	.word	0
	.word	-31976864
	.word	1
	.word	0
	.word	0
	.word	-31976828
	.word	1
	.word	1
	.word	0
	.word	-31976768
	.word	1
	.word	1
	.word	0
	.word	-31976704
	.word	1
	.word	0
	.word	0
	.word	-31976672
	.word	1
	.word	0
	.word	0
	.word	-31976640
	.word	1
	.word	1
	.word	0
	.word	-31976636
	.word	1
	.word	1
	.word	1
	.word	-31976632
	.word	1
	.word	0
	.word	1
	.word	-31976576
	.word	7
	.word	0
	.word	0
	.word	-31976572
	.word	7
	.word	0
	.word	0
	.word	-31976568
	.word	7
	.word	0
	.word	0
	.word	-31976564
	.word	7
	.word	0
	.word	0
	.word	-31976560
	.word	7
	.word	0
	.word	0
	.word	-31976556
	.word	7
	.word	0
	.word	0
	.word	-31976552
	.word	7
	.word	7
	.word	0
	.word	-31976548
	.word	7
	.word	0
	.word	0
	.word	-31976544
	.word	7
	.word	0
	.word	0
	.word	-31976520
	.word	0
	.word	0
	.word	0
	.word	-31976516
	.word	1
	.word	0
	.word	0
	.word	-31976832
	.word	1
	.word	1
	.word	0
	.type	exynos4412_pmu_config, %object
	.size	exynos4412_pmu_config, 1536
exynos4412_pmu_config:
	.word	-31977472
	.word	0
	.word	0
	.word	2
	.word	-31977456
	.word	0
	.word	0
	.word	2
	.word	-31977440
	.word	0
	.word	0
	.word	2
	.word	-31977424
	.word	0
	.word	0
	.word	2
	.word	-31977392
	.word	1
	.word	0
	.word	0
	.word	-31977388
	.word	0
	.word	0
	.word	0
	.word	-31977384
	.word	1
	.word	0
	.word	0
	.word	-31977344
	.word	0
	.word	0
	.word	2
	.word	-31977280
	.word	0
	.word	0
	.word	3
	.word	-31971832
	.word	16
	.word	16
	.word	0
	.word	-31977276
	.word	0
	.word	0
	.word	3
	.word	-31971800
	.word	16
	.word	16
	.word	0
	.word	-31977216
	.word	1
	.word	0
	.word	0
	.word	-31977212
	.word	1
	.word	0
	.word	0
	.word	-31977204
	.word	1
	.word	1
	.word	0
	.word	-31977200
	.word	1
	.word	0
	.word	0
	.word	-31977196
	.word	1
	.word	0
	.word	0
	.word	-31977188
	.word	1
	.word	1
	.word	0
	.word	-31977184
	.word	1
	.word	0
	.word	0
	.word	-31977180
	.word	1
	.word	0
	.word	0
	.word	-31977176
	.word	1
	.word	0
	.word	0
	.word	-31977172
	.word	1
	.word	1
	.word	0
	.word	-31977168
	.word	1
	.word	0
	.word	0
	.word	-31977160
	.word	1
	.word	0
	.word	0
	.word	-31977156
	.word	1
	.word	0
	.word	0
	.word	-31977152
	.word	1
	.word	0
	.word	0
	.word	-31977148
	.word	1
	.word	0
	.word	0
	.word	-31977144
	.word	1
	.word	0
	.word	0
	.word	-31977140
	.word	1
	.word	0
	.word	0
	.word	-31977136
	.word	1
	.word	0
	.word	0
	.word	-31977132
	.word	1
	.word	0
	.word	0
	.word	-31977128
	.word	1
	.word	0
	.word	0
	.word	-31977124
	.word	1
	.word	0
	.word	0
	.word	-31977120
	.word	1
	.word	0
	.word	0
	.word	-31977116
	.word	1
	.word	0
	.word	0
	.word	-31977112
	.word	1
	.word	0
	.word	0
	.word	-31977108
	.word	1
	.word	0
	.word	0
	.word	-31977104
	.word	1
	.word	0
	.word	0
	.word	-31977100
	.word	0
	.word	0
	.word	0
	.word	-31977096
	.word	1
	.word	0
	.word	0
	.word	-31977092
	.word	1
	.word	0
	.word	0
	.word	-31977088
	.word	3
	.word	0
	.word	0
	.word	-31977084
	.word	1
	.word	0
	.word	1
	.word	-31977080
	.word	3
	.word	0
	.word	3
	.word	-31977072
	.word	3
	.word	0
	.word	0
	.word	-31977068
	.word	1
	.word	0
	.word	1
	.word	-31977064
	.word	3
	.word	0
	.word	3
	.word	-31977056
	.word	1
	.word	1
	.word	0
	.word	-31977052
	.word	1
	.word	0
	.word	1
	.word	-31977040
	.word	1
	.word	1
	.word	0
	.word	-31977036
	.word	1
	.word	0
	.word	1
	.word	-31977020
	.word	3
	.word	0
	.word	0
	.word	-31969752
	.word	16
	.word	16
	.word	0
	.word	-31977016
	.word	3
	.word	0
	.word	0
	.word	-31969720
	.word	16
	.word	16
	.word	0
	.word	-31977012
	.word	3
	.word	0
	.word	0
	.word	-31969688
	.word	16
	.word	16
	.word	0
	.word	-31977008
	.word	3
	.word	0
	.word	0
	.word	-31969656
	.word	16
	.word	16
	.word	0
	.word	-31977004
	.word	3
	.word	0
	.word	0
	.word	-31969624
	.word	16
	.word	16
	.word	0
	.word	-31977000
	.word	3
	.word	0
	.word	0
	.word	-31969592
	.word	16
	.word	16
	.word	0
	.word	-31976996
	.word	3
	.word	0
	.word	0
	.word	-31969464
	.word	16
	.word	16
	.word	0
	.word	-31976960
	.word	1
	.word	0
	.word	0
	.word	-31976956
	.word	1
	.word	1
	.word	0
	.word	-31976928
	.word	1
	.word	0
	.word	0
	.word	-31976924
	.word	1
	.word	0
	.word	0
	.word	-31976920
	.word	1
	.word	0
	.word	0
	.word	-31976916
	.word	1
	.word	0
	.word	0
	.word	-31976912
	.word	1
	.word	0
	.word	0
	.word	-31976908
	.word	1
	.word	0
	.word	0
	.word	-31976900
	.word	1
	.word	0
	.word	0
	.word	-31976896
	.word	1
	.word	0
	.word	0
	.word	-31976880
	.word	1
	.word	0
	.word	0
	.word	-31976864
	.word	1
	.word	0
	.word	0
	.word	-31976828
	.word	1
	.word	1
	.word	0
	.word	-31976768
	.word	1
	.word	1
	.word	0
	.word	-31976704
	.word	1
	.word	0
	.word	0
	.word	-31976672
	.word	1
	.word	0
	.word	0
	.word	-31976640
	.word	1
	.word	1
	.word	0
	.word	-31976636
	.word	1
	.word	1
	.word	1
	.word	-31976632
	.word	1
	.word	0
	.word	1
	.word	-31976576
	.word	7
	.word	0
	.word	0
	.word	-31976572
	.word	7
	.word	0
	.word	0
	.word	-31976568
	.word	7
	.word	0
	.word	0
	.word	-31976564
	.word	7
	.word	0
	.word	0
	.word	-31976560
	.word	7
	.word	0
	.word	0
	.word	-31976556
	.word	7
	.word	0
	.word	0
	.word	-31976552
	.word	7
	.word	7
	.word	0
	.word	-31976548
	.word	7
	.word	0
	.word	0
	.word	-31976544
	.word	7
	.word	0
	.word	0
	.word	-31976520
	.word	1
	.word	0
	.word	0
	.word	-31976516
	.word	1
	.word	0
	.word	0
	.word	-31976832
	.word	1
	.word	1
	.word	0
	.type	exynos4_config_for_c2c, %object
	.size	exynos4_config_for_c2c, 24
exynos4_config_for_c2c:
	.word	-31977072
	.word	0
	.word	-31977064
	.word	0
	.word	-31977180
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<7>pmu_debug: 0x%08x\012\000"
	.space	2
.LC1:
	.ascii	"<7>xusbxti_control: %ld\012\000"
	.space	3
.LC2:
	.ascii	"<6>%s: PMU supports 4212(%d)\012\000"
	.space	2
.LC3:
	.ascii	"<6>%s: PMU supports 4412(%d)\012\000"
	.space	2
.LC4:
	.ascii	"<6>%s: PMU not supported\012\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	entry_cnt, %object
	.size	entry_cnt, 4
entry_cnt:
	.space	4
	.type	exynos4_pmu_config, %object
	.size	exynos4_pmu_config, 4
exynos4_pmu_config:
	.space	4
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_exynos4_sys_powerdown_xusbxti_control, %object
	.size	__kstrtab_exynos4_sys_powerdown_xusbxti_control, 38
__kstrtab_exynos4_sys_powerdown_xusbxti_control:
	.ascii	"exynos4_sys_powerdown_xusbxti_control\000"
	.type	__kstrtab_exynos4_pmu_xclkout_set, %object
	.size	__kstrtab_exynos4_pmu_xclkout_set, 24
__kstrtab_exynos4_pmu_xclkout_set:
	.ascii	"exynos4_pmu_xclkout_set\000"
	.ident	"GCC: (GNU) 4.8"
