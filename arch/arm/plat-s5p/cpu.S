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
	.file	"cpu.c"
	.text
	.align	2
	.global	s5p_init_io
	.type	s5p_init_io, %function
s5p_init_io:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r5, r0
	movw	r4, #:lower16:iotable_init
	movw	r0, #:lower16:.LANCHOR0
	mov	r7, r1
	movt	r0, #:upper16:.LANCHOR0
	movt	r4, #:upper16:iotable_init
	mov	r1, #6
	mov	r6, r2
	blx	r4
	cmp	r5, #0
	beq	.L2
	mov	r0, r5
	mov	r1, r7
	blx	r4
.L2:
	movw	r3, #:lower16:s5p_init_cpu
	mov	r0, r6
	movt	r3, #:upper16:s5p_init_cpu
	blx	r3
	movw	r2, #:lower16:samsung_cpu_id
	movw	r3, #:lower16:s3c_init_cpu
	movt	r2, #:upper16:samsung_cpu_id
	movt	r3, #:upper16:s3c_init_cpu
	ldr	r0, [r2]
	mov	r2, #9
	ldr	r1, .L7
	blx	r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L8:
	.align	2
.L7:
	.word	.LANCHOR0+96
	.fnend
	.size	s5p_init_io, .-s5p_init_io
	.global	cpu_idcode
	.section	.rodata
	.align	2
	.type	name_exynos5250, %object
	.size	name_exynos5250, 11
name_exynos5250:
	.ascii	"EXYNOS5250\000"
	.space	1
	.type	name_exynos5210, %object
	.size	name_exynos5210, 11
name_exynos5210:
	.ascii	"EXYNOS5210\000"
	.space	1
	.type	name_exynos4412, %object
	.size	name_exynos4412, 11
name_exynos4412:
	.ascii	"EXYNOS4412\000"
	.space	1
	.type	name_exynos4212, %object
	.size	name_exynos4212, 11
name_exynos4212:
	.ascii	"EXYNOS4212\000"
	.space	1
	.type	name_exynos4210, %object
	.size	name_exynos4210, 11
name_exynos4210:
	.ascii	"EXYNOS4210\000"
	.space	1
	.type	name_s5pv210, %object
	.size	name_s5pv210, 16
name_s5pv210:
	.ascii	"S5PV210/S5PC110\000"
	.type	name_s5pc100, %object
	.size	name_s5pc100, 8
name_s5pc100:
	.ascii	"S5PC100\000"
	.type	name_s5p6450, %object
	.size	name_s5p6450, 8
name_s5p6450:
	.ascii	"S5P6450\000"
	.type	name_s5p6440, %object
	.size	name_s5p6440, 8
name_s5p6440:
	.ascii	"S5P6440\000"
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	s5p_iodesc, %object
	.size	s5p_iodesc, 96
s5p_iodesc:
	.word	-33554432
	.word	65536
	.word	4096
	.word	0
	.word	-66060288
	.word	65552
	.word	65536
	.word	0
	.word	-63963136
	.word	80336
	.word	16384
	.word	0
	.word	-62914560
	.word	65632
	.word	4096
	.word	0
	.word	-28573696
	.word	75120
	.word	4096
	.word	0
	.word	-51380224
	.word	75184
	.word	4096
	.word	0
	.type	cpu_ids, %object
	.size	cpu_ids, 252
cpu_ids:
	.word	1447297024
	.word	536084480
	.word	0
	.word	0
	.word	0
	.word	0
	.word	name_s5p6440
	.word	910491648
	.word	536084480
	.word	0
	.word	0
	.word	0
	.word	0
	.word	name_s5p6450
	.word	1125122048
	.word	-4096
	.word	0
	.word	0
	.word	0
	.word	0
	.word	name_s5pc100
	.word	1125187584
	.word	-4096
	.word	0
	.word	0
	.word	0
	.word	0
	.word	name_s5pv210
	.word	1126236160
	.word	-131072
	.word	exynos4_map_io
	.word	exynos_common_init_uarts
	.word	exynos4_init_clocks
	.word	exynos4_init
	.word	name_exynos4210
	.word	1126301696
	.word	-131072
	.word	exynos4_map_io
	.word	exynos_common_init_uarts
	.word	exynos4_init_clocks
	.word	exynos4_init
	.word	name_exynos4212
	.word	-465493504
	.word	-131072
	.word	exynos4_map_io
	.word	exynos_common_init_uarts
	.word	exynos4_init_clocks
	.word	exynos4_init
	.word	name_exynos4412
	.word	1129381888
	.word	-131072
	.word	0
	.word	0
	.word	0
	.word	0
	.word	name_exynos5210
	.word	1129447424
	.word	-131072
	.word	0
	.word	0
	.word	0
	.word	0
	.word	name_exynos5250
	.bss
	.align	2
	.type	cpu_idcode, %object
	.size	cpu_idcode, 4
cpu_idcode:
	.space	4
	.ident	"GCC: (GNU) 4.8"
