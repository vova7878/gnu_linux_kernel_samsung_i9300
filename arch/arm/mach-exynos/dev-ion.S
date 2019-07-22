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
	.file	"dev-ion.c"
	.text
	.align	2
	.global	exynos_ion_set_platdata
	.type	exynos_ion_set_platdata, %function
exynos_ion_set_platdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:kmalloc_caches
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #28]
	cmp	r0, #0
	beq	.L4
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movw	r1, #32976
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #104
	blx	r3
	cmp	r0, #0
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L2:
	movw	r6, #:lower16:.LC0
	movw	r5, #:lower16:.LC1
	movw	r4, #:lower16:.LC2
	movw	ip, #:lower16:.LC3
	movw	r1, #:lower16:.LC4
	movw	r3, #:lower16:.LANCHOR0
	mov	r2, #5
	mov	r10, #0
	mov	r9, #1
	mov	r8, #4
	mov	r7, #6
	movt	r6, #:upper16:.LC0
	movt	r5, #:upper16:.LC1
	movt	r4, #:upper16:.LC2
	movt	ip, #:upper16:.LC3
	movt	r1, #:upper16:.LC4
	movt	r3, #:upper16:.LANCHOR0
	str	r6, [r0, #12]
	str	r5, [r0, #32]
	str	r4, [r0, #52]
	str	ip, [r0, #72]
	str	r1, [r0, #92]
	str	r2, [r0]
	str	r2, [r0, #44]
	str	r2, [r0, #48]
	str	r10, [r0, #4]
	str	r10, [r0, #8]
	str	r9, [r0, #24]
	str	r9, [r0, #28]
	str	r8, [r0, #64]
	str	r8, [r0, #68]
	str	r7, [r0, #84]
	str	r7, [r0, #88]
	str	r0, [r3, #92]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L4:
	mov	r0, #16
	b	.L2
	.fnend
	.size	exynos_ion_set_platdata, .-exynos_ion_set_platdata
	.global	exynos_device_ion
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	exynos_device_ion, %object
	.size	exynos_device_ion, 360
exynos_device_ion:
	.word	.LC5
	.word	-1
	.space	352
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"ion_noncontig_heap\000"
	.space	1
.LC1:
	.ascii	"ion_contig_heap\000"
.LC2:
	.ascii	"exynos_noncontig_heap\000"
	.space	2
.LC3:
	.ascii	"exynos_contig_heap\000"
	.space	1
.LC4:
	.ascii	"exynos_user_heap\000"
	.space	3
.LC5:
	.ascii	"ion-exynos\000"
	.ident	"GCC: (GNU) 4.8"
