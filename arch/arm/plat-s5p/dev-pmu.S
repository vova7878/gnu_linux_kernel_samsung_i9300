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
	.file	"dev-pmu.c"
	.text
	.align	2
	.type	s5p_pmu_init, %function
s5p_pmu_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:platform_device_register
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:platform_device_register
	blx	r3
	subs	r4, r0, #0
	bne	.L7
.L2:
	mov	r0, r4
	ldmfd	sp!, {r4, pc}
.L7:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	b	.L2
	.fnend
	.size	s5p_pmu_init, .-s5p_pmu_init
	.global	s5p_device_pmu
	.section	.initcall3.init,"aw",%progbits
	.align	2
	.type	__initcall_s5p_pmu_init3, %object
	.size	__initcall_s5p_pmu_init3, 4
__initcall_s5p_pmu_init3:
	.word	s5p_pmu_init
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	s5p_device_pmu, %object
	.size	s5p_device_pmu, 360
s5p_device_pmu:
	.word	.LC1
	.word	0
	.space	336
	.word	4
	.word	s5p_pmu_resource
	.space	8
	.type	s5p_pmu_resource, %object
	.size	s5p_pmu_resource, 112
s5p_pmu_resource:
	.word	210
	.word	210
	.space	4
	.word	1024
	.space	12
	.word	218
	.word	218
	.space	4
	.word	1024
	.space	12
	.word	338
	.word	338
	.space	4
	.word	1024
	.space	12
	.word	346
	.word	346
	.space	4
	.word	1024
	.space	12
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<4>s5p_pmu_init: pmu device not registered.\012\000"
	.space	3
.LC1:
	.ascii	"arm-pmu\000"
	.ident	"GCC: (GNU) 4.8"
