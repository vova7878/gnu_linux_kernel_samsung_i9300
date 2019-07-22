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
	.file	"dev-audio.c"
	.text
	.align	2
	.type	exynos_cfg_i2s_gpio, %function
exynos_cfg_i2s_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:.LANCHOR0
	stmfd	sp!, {r4, r5, lr}
	.save {r4, r5, lr}
	movt	ip, #:upper16:.LANCHOR0
	mov	r5, r0
	.pad #44
	sub	sp, sp, #44
	ldmia	ip!, {r0, r1, r2, r3}
	add	r4, sp, #4
	ldr	r5, [r5, #4]
	stmia	r4!, {r0, r1, r2, r3}
	cmp	r5, #2
	ldmia	ip!, {r0, r1, r2, r3}
	ldr	ip, [ip]
	stmia	r4!, {r0, r1, r2, r3}
	str	ip, [r4]
	bhi	.L7
	movw	r3, #:lower16:samsung_cpu_id
	mov	r2, #0
	movt	r3, #:upper16:samsung_cpu_id
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L4
	cmn	r3, #465567744
	movne	r0, #0
	beq	.L4
.L3:
	add	sp, sp, #44
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
.L4:
	add	r5, r5, r5, asl #1
	add	r2, sp, #40
	movw	r3, #:lower16:s3c_gpio_cfgpin_range
	add	r5, r2, r5, asl #2
	movt	r3, #:upper16:s3c_gpio_cfgpin_range
	sub	r0, r5, #36
	ldmia	r0, {r0, r1, r2}
	blx	r3
	mov	r0, #0
	add	sp, sp, #44
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
.L7:
	movw	r0, #:lower16:.LC4
	movw	r3, #:lower16:printk
	mov	r1, r5
	movt	r0, #:upper16:.LC4
	movt	r3, #:upper16:printk
	blx	r3
	mvn	r0, #21
	b	.L3
	.fnend
	.size	exynos_cfg_i2s_gpio, .-exynos_cfg_i2s_gpio
	.align	2
	.type	exynos_pcm_cfg_gpio, %function
exynos_pcm_cfg_gpio:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	.save {r4, r5, lr}
	.pad #44
	sub	sp, sp, #44
	ldr	r4, .L14
	add	ip, sp, #4
	ldr	r5, [r0, #4]
	ldmia	r4!, {r0, r1, r2, r3}
	cmp	r5, #2
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	ldr	r4, [r4]
	stmia	ip!, {r0, r1, r2, r3}
	str	r4, [ip]
	bhi	.L13
	movw	r3, #:lower16:samsung_cpu_id
	mov	r2, #0
	movt	r3, #:upper16:samsung_cpu_id
	movt	r2, 17186
	ldr	r3, [r3]
	mov	r3, r3, lsr #17
	mov	r3, r3, asl #17
	cmp	r3, r2
	beq	.L11
	cmn	r3, #465567744
	movne	r0, #0
	beq	.L11
.L10:
	add	sp, sp, #44
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
.L11:
	add	r5, r5, r5, asl #1
	add	r2, sp, #40
	movw	r3, #:lower16:s3c_gpio_cfgpin_range
	add	r5, r2, r5, asl #2
	movt	r3, #:upper16:s3c_gpio_cfgpin_range
	sub	r0, r5, #36
	ldmia	r0, {r0, r1, r2}
	blx	r3
	mov	r0, #0
	add	sp, sp, #44
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
.L13:
	movw	r0, #:lower16:.LC4
	movw	r3, #:lower16:printk
	mov	r1, r5
	movt	r0, #:upper16:.LC4
	movt	r3, #:upper16:printk
	blx	r3
	mvn	r0, #21
	b	.L10
.L15:
	.align	2
.L14:
	.word	.LANCHOR0+36
	.fnend
	.size	exynos_pcm_cfg_gpio, .-exynos_pcm_cfg_gpio
	.align	2
	.type	exynos_ac97_cfg_gpio, %function
exynos_ac97_cfg_gpio:
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
	beq	.L17
	cmn	r3, #465567744
	beq	.L17
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
.L17:
	movw	r3, #:lower16:s3c_gpio_cfgpin_range
	mov	r1, #5
	movt	r3, #:upper16:s3c_gpio_cfgpin_range
	mvn	r2, #11
	mov	r0, #25
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos_ac97_cfg_gpio, .-exynos_ac97_cfg_gpio
	.align	2
	.type	exynos_spdif_cfg_gpio, %function
exynos_spdif_cfg_gpio:
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
	beq	.L20
	cmn	r3, #465567744
	beq	.L20
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
.L20:
	movw	r3, #:lower16:s3c_gpio_cfgpin_range
	mov	r1, #2
	movt	r3, #:upper16:s3c_gpio_cfgpin_range
	mvn	r2, #11
	mov	r0, #31
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos_spdif_cfg_gpio, .-exynos_spdif_cfg_gpio
	.align	2
	.global	exynos4_i2sv3_setup_resource
	.type	exynos4_i2sv3_setup_resource, %function
exynos4_i2sv3_setup_resource:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	mov	r0, #255
	mov	r1, ip
	mov	r2, r0
	movw	r3, #:lower16:.LANCHOR1
	movt	ip, 5014
	movt	r3, #:upper16:.LANCHOR1
	movt	r0, 5014
	movt	r1, 5015
	movt	r2, 5015
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #84]
	str	r2, [r3, #88]
	bx	lr
	.fnend
	.size	exynos4_i2sv3_setup_resource, .-exynos4_i2sv3_setup_resource
	.global	exynos_device_srp
	.global	exynos_device_spdif
	.global	exynos_device_ac97
	.global	exynos_device_pcm2
	.global	exynos_device_pcm1
	.global	exynos_device_pcm0
	.global	exynos_device_i2s2
	.global	exynos_device_i2s1
	.global	exynos_device_i2s0
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.word	226
	.word	7
	.word	-14
	.word	25
	.word	5
	.word	-14
	.word	31
	.word	5
	.word	-14
.LC2:
	.word	226
	.word	5
	.word	-13
	.word	25
	.word	5
	.word	-13
	.word	31
	.word	5
	.word	-13
	.section	___ksymtab+exynos_device_srp,"a",%progbits
	.align	2
	.type	__ksymtab_exynos_device_srp, %object
	.size	__ksymtab_exynos_device_srp, 8
__ksymtab_exynos_device_srp:
	.word	exynos_device_srp
	.word	__kstrtab_exynos_device_srp
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_exynos_device_srp, %object
	.size	__kstrtab_exynos_device_srp, 18
__kstrtab_exynos_device_srp:
	.ascii	"exynos_device_srp\000"
	.data
	.align	3
	.set	.LANCHOR1,. + 0
	.type	exynos_i2s1_resource, %object
	.size	exynos_i2s1_resource, 84
exynos_i2s1_resource:
	.word	-502267904
	.word	-502267649
	.space	4
	.word	512
	.space	12
	.word	19
	.word	19
	.space	4
	.word	2048
	.space	12
	.word	18
	.word	18
	.space	4
	.word	2048
	.space	12
	.type	exynos_i2s2_resource, %object
	.size	exynos_i2s2_resource, 84
exynos_i2s2_resource:
	.word	-492830720
	.word	-492830465
	.space	4
	.word	512
	.space	12
	.word	21
	.word	21
	.space	4
	.word	2048
	.space	12
	.word	20
	.word	20
	.space	4
	.word	2048
	.space	12
	.type	exynos_device_srp, %object
	.size	exynos_device_srp, 360
exynos_device_srp:
	.word	.LC5
	.word	-1
	.space	252
	.word	exynos_srp_dmamask
	.word	-1
	.word	0
	.space	72
	.word	0
	.word	exynos_srp_resource
	.space	8
	.type	exynos_srp_dmamask, %object
	.size	exynos_srp_dmamask, 8
exynos_srp_dmamask:
	.word	-1
	.word	0
	.type	exynos_device_spdif, %object
	.size	exynos_device_spdif, 360
exynos_device_spdif:
	.word	.LC6
	.word	-1
	.space	84
	.word	samsung_spdif_pdata
	.space	164
	.word	exynos_spdif_dmamask
	.word	-1
	.word	0
	.space	72
	.word	2
	.word	exynos_spdif_resource
	.space	8
	.type	exynos_spdif_dmamask, %object
	.size	exynos_spdif_dmamask, 8
exynos_spdif_dmamask:
	.word	-1
	.word	0
	.type	samsung_spdif_pdata, %object
	.size	samsung_spdif_pdata, 12
samsung_spdif_pdata:
	.word	exynos_spdif_cfg_gpio
	.space	8
	.type	exynos_spdif_resource, %object
	.size	exynos_spdif_resource, 56
exynos_spdif_resource:
	.word	328925184
	.word	328925439
	.space	4
	.word	512
	.space	12
	.word	33
	.word	33
	.space	4
	.word	2048
	.space	12
	.space	4
	.type	exynos_device_ac97, %object
	.size	exynos_device_ac97, 360
exynos_device_ac97:
	.word	.LC7
	.word	-1
	.space	84
	.word	s3c_ac97_pdata
	.space	164
	.word	exynos_ac97_dmamask
	.word	-1
	.word	0
	.space	72
	.word	5
	.word	exynos_ac97_resource
	.space	8
	.type	exynos_ac97_dmamask, %object
	.size	exynos_ac97_dmamask, 8
exynos_ac97_dmamask:
	.word	-1
	.word	0
	.type	s3c_ac97_pdata, %object
	.size	s3c_ac97_pdata, 12
s3c_ac97_pdata:
	.word	exynos_ac97_cfg_gpio
	.space	8
	.type	exynos_ac97_resource, %object
	.size	exynos_ac97_resource, 140
exynos_ac97_resource:
	.word	328859648
	.word	328859903
	.space	4
	.word	512
	.space	12
	.word	30
	.word	30
	.space	4
	.word	2048
	.space	12
	.word	29
	.word	29
	.space	4
	.word	2048
	.space	12
	.word	28
	.word	28
	.space	4
	.word	2048
	.space	12
	.word	164
	.word	164
	.space	4
	.word	1024
	.space	12
	.type	exynos_device_pcm2, %object
	.size	exynos_device_pcm2, 360
exynos_device_pcm2:
	.word	.LC8
	.word	2
	.space	84
	.word	s3c_pcm_pdata
	.space	248
	.word	3
	.word	exynos_pcm2_resource
	.space	8
	.type	exynos_pcm2_resource, %object
	.size	exynos_pcm2_resource, 84
exynos_pcm2_resource:
	.word	328794112
	.word	328794367
	.space	4
	.word	512
	.space	12
	.word	40
	.word	40
	.space	4
	.word	2048
	.space	12
	.word	41
	.word	41
	.space	4
	.word	2048
	.space	12
	.space	4
	.type	exynos_device_pcm1, %object
	.size	exynos_device_pcm1, 360
exynos_device_pcm1:
	.word	.LC8
	.word	1
	.space	84
	.word	s3c_pcm_pdata
	.space	248
	.word	3
	.word	exynos_pcm1_resource
	.space	8
	.type	exynos_pcm1_resource, %object
	.size	exynos_pcm1_resource, 84
exynos_pcm1_resource:
	.word	328728576
	.word	328728831
	.space	4
	.word	512
	.space	12
	.word	38
	.word	38
	.space	4
	.word	2048
	.space	12
	.word	39
	.word	39
	.space	4
	.word	2048
	.space	12
	.space	4
	.type	exynos_device_pcm0, %object
	.size	exynos_device_pcm0, 360
exynos_device_pcm0:
	.word	.LC8
	.word	0
	.space	84
	.word	s3c_pcm_pdata
	.space	248
	.word	3
	.word	exynos_pcm0_resource
	.space	8
	.type	exynos_pcm0_resource, %object
	.size	exynos_pcm0_resource, 84
exynos_pcm0_resource:
	.word	58982400
	.word	58982655
	.space	4
	.word	512
	.space	12
	.word	36
	.word	36
	.space	4
	.word	2048
	.space	12
	.word	37
	.word	37
	.space	4
	.word	2048
	.space	12
	.type	s3c_pcm_pdata, %object
	.size	s3c_pcm_pdata, 12
s3c_pcm_pdata:
	.word	exynos_pcm_cfg_gpio
	.space	8
	.type	exynos_device_i2s2, %object
	.size	exynos_device_i2s2, 360
exynos_device_i2s2:
	.word	.LC9
	.word	2
	.space	84
	.word	i2sv3_pdata
	.space	248
	.word	3
	.word	exynos_i2s2_resource
	.space	8
	.type	exynos_device_i2s1, %object
	.size	exynos_device_i2s1, 360
exynos_device_i2s1:
	.word	.LC9
	.word	1
	.space	84
	.word	i2sv3_pdata
	.space	248
	.word	3
	.word	exynos_i2s1_resource
	.space	8
	.type	i2sv3_pdata, %object
	.size	i2sv3_pdata, 12
i2sv3_pdata:
	.word	exynos_cfg_i2s_gpio
	.word	4
	.word	rclksrc_v3
	.type	rclksrc_v3, %object
	.size	rclksrc_v3, 8
rclksrc_v3:
	.word	.LC10
	.word	.LC11
	.space	4
	.type	exynos_device_i2s0, %object
	.size	exynos_device_i2s0, 360
exynos_device_i2s0:
	.word	.LC9
	.word	0
	.space	84
	.word	i2sv5_pdata
	.space	248
	.word	4
	.word	exynos_i2s0_resource
	.space	8
	.type	exynos_i2s0_resource, %object
	.size	exynos_i2s0_resource, 112
exynos_i2s0_resource:
	.word	58916864
	.word	58917119
	.space	4
	.word	512
	.space	12
	.word	16
	.word	16
	.space	4
	.word	2048
	.space	12
	.word	15
	.word	15
	.space	4
	.word	2048
	.space	12
	.word	17
	.word	17
	.space	4
	.word	2048
	.space	12
	.type	i2sv5_pdata, %object
	.size	i2sv5_pdata, 12
i2sv5_pdata:
	.word	exynos_cfg_i2s_gpio
	.word	11
	.word	rclksrc
	.type	rclksrc, %object
	.size	rclksrc, 8
rclksrc:
	.word	.LC12
	.word	.LC13
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC4:
	.ascii	"<3>Invalid Device %d\012\000"
	.space	2
.LC5:
	.ascii	"samsung-rp\000"
	.space	1
.LC6:
	.ascii	"samsung-spdif\000"
	.space	2
.LC7:
	.ascii	"samsung-ac97\000"
	.space	3
.LC8:
	.ascii	"samsung-pcm\000"
.LC9:
	.ascii	"samsung-i2s\000"
.LC10:
	.ascii	"sclk_i2s\000"
	.space	3
.LC11:
	.ascii	"no_such_clock\000"
	.space	2
.LC12:
	.ascii	"busclk\000"
	.space	1
.LC13:
	.ascii	"i2sclk\000"
	.bss
	.align	2
	.type	exynos_srp_resource, %object
	.size	exynos_srp_resource, 0
exynos_srp_resource:
	.ident	"GCC: (GNU) 4.8"
