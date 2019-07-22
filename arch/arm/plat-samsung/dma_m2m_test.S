	.cpu cortex-a9
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"dma_m2m_test.c"
	.text
	.align	2
	.global	s3cdma_cb
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3cdma_cb, %function
s3cdma_cb:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	.save {lr}
	movw	lr, #:lower16:complete
	movt	lr, #:upper16:complete
	str	r3, [r1, #32]
	add	r0, r1, #48
	mov	r3, lr
	str	r2, [r1, #36]
	ldr	lr, [sp], #4
	bx	r3	@ indirect register sibling call
	.fnend
	.size	s3cdma_cb, .-s3cdma_cb
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	dmatest_func, %function
dmatest_func:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r7, #:lower16:.LANCHOR0
	movt	r7, #:upper16:.LANCHOR0
	mov	r4, r0
	movw	r2, #:lower16:msecs_to_jiffies
	movw	r5, #:lower16:jiffies
	ldr	r3, [r7]
	movw	r1, #:lower16:kthread_should_stop
	ldr	r8, [r0]
	mov	r0, #1000
	.pad #68
	sub	sp, sp, #68
	movt	r2, #:upper16:msecs_to_jiffies
	movt	r5, #:upper16:jiffies
	movt	r1, #:upper16:kthread_should_stop
	mul	r0, r0, r3
	str	r2, [sp, #44]
	str	r5, [sp, #32]
	movw	r9, #:lower16:.LANCHOR1
	str	r1, [sp, #36]
	movw	r6, #:lower16:s3c2410_dma_devconfig
	blx	r2
	ldr	r2, [r5]
	movw	r10, #:lower16:s3c2410_dma_enqueue_ring
	ldr	r3, [r5]
	add	r8, r8, #69
	movt	r9, #:upper16:.LANCHOR1
	mov	fp, #0
	add	r2, r0, r2
	movt	r6, #:upper16:s3c2410_dma_devconfig
	movt	r10, #:upper16:s3c2410_dma_enqueue_ring
	str	fp, [r4, #40]
	str	r2, [sp, #40]
	str	r6, [sp, #48]
	str	r3, [r4, #24]
	str	r10, [sp, #52]
.L5:
	ldr	r3, [sp, #36]
	blx	r3
	cmp	r0, #0
	bne	.L11
	ldr	r3, [sp, #32]
	ldr	r2, [sp, #40]
	ldr	r3, [r3]
	sub	r3, r3, r2
	cmp	r3, #0
	bge	.L11
	ldrh	r2, [r7, #4]
	rsb	r3, fp, #1
	str	r3, [sp, #28]
	add	r0, r4, fp, lsl #2
	add	r3, r4, r3, lsl #2
	cmp	r2, #0
	ldr	r5, [r0, #8]
	ldr	r6, [r3, #8]
	beq	.L42
.L6:
	ldr	r2, [r0, #16]
	mov	r1, #2
	str	r3, [sp, #24]
	mov	r0, r8
	ldr	r3, [sp, #48]
	mov	r10, #0
	blx	r3
	ldr	r3, [sp, #24]
	mov	r1, r4
	ldr	ip, [r7, #8]
	mov	r0, r8
	ldr	r2, [r3, #16]
	ldr	r3, [r9]
	str	r10, [sp]
	sub	r3, ip, r3
	ldr	ip, [sp, #52]
	blx	ip
	movw	r3, #:lower16:s3c2410_dma_ctrl
	mov	r1, r10
	movt	r3, #:upper16:s3c2410_dma_ctrl
	mov	r0, r8
	blx	r3
	movw	r0, #5000
	ldr	r3, [sp, #44]
	blx	r3
	movw	r3, #:lower16:wait_for_completion_timeout
	mov	r1, r0
	movt	r3, #:upper16:wait_for_completion_timeout
	add	r0, r4, #48
	blx	r3
	cmp	r0, r10
	beq	.L43
	ldr	r3, [r4, #32]
	ldr	ip, [r4, #36]
	ldr	r2, [r4, #40]
	cmp	r3, #0
	bne	.L12
	ldr	r1, [r7, #8]
	ldr	r0, [r9]
	sub	r1, r1, r0
	cmp	ip, r1
	addeq	r2, r2, #1
	streq	r2, [r4, #40]
	bne	.L12
.L14:
	ldrh	r2, [r7, #4]
	cmp	r2, #0
	bne	.L15
	ldr	ip, [r7, #8]
	ldr	r3, [r9]
	sub	r3, ip, r3
	lsrs	r3, r3, #2
	beq	.L16
	ldr	r0, [r5]
	ldr	r1, [r6]
	cmp	r0, r1
	bne	.L17
	mov	r1, r6
	b	.L18
.L19:
	ldr	lr, [r5, #4]!
	ldr	r0, [r1, #4]!
	cmp	lr, r0
	bne	.L17
.L18:
	add	r2, r2, #1
	cmp	r2, r3
	bne	.L19
.L16:
	lsr	ip, ip, #2
	cmp	ip, r3
	bls	.L15
	ldr	r2, [r6, r3, lsl #2]
	add	r3, r6, r3, lsl #2
	cmp	r2, #0
	bne	.L17
	add	r6, r6, ip, lsl #2
	sub	r6, r6, #4
	b	.L20
.L21:
	ldr	r2, [r3, #4]!
	cmp	r2, #0
	bne	.L17
.L20:
	cmp	r6, r3
	bne	.L21
.L15:
	ldr	fp, [sp, #28]
	b	.L5
.L17:
	movw	r0, #:lower16:.LC2
	movw	r3, #:lower16:printk
	movt	r0, #:upper16:.LC2
	movt	r3, #:upper16:printk
	ldr	r2, [r4, #40]
	ldr	r1, [r4]
	blx	r3
.L11:
	ldr	r3, [sp, #32]
	mov	r1, #1
	ldr	r2, [r4, #24]
	mov	r0, #0
	str	r1, [r4, #28]
	ldr	r3, [r3]
	sub	r3, r3, r2
	str	r3, [r4, #24]
	add	sp, sp, #68
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L42:
	ldr	ip, [r7, #8]
	lsrs	ip, ip, #2
	beq	.L7
	sub	r1, r5, #4
.L8:
	str	r2, [r1, #4]!
	add	r2, r2, #1
	cmp	r2, ip
	bne	.L8
	ldr	r1, [r7, #8]
	lsrs	r1, r1, #2
	beq	.L7
	add	r1, r6, r1, lsl #2
	mov	r2, r6
	mov	ip, #0
.L9:
	str	ip, [r2], #4
	cmp	r2, r1
	bne	.L9
.L7:
	mov	r2, #1024
	str	r2, [r9]
	b	.L6
.L12:
	movw	r0, #:lower16:.LC1
	movw	r10, #:lower16:printk
	ldr	r1, [r4]
	movt	r10, #:upper16:printk
	str	ip, [sp]
	movt	r0, #:upper16:.LC1
	blx	r10
	b	.L14
.L43:
	ldr	r0, [r4]
	movw	r3, #:lower16:s3c2410_dma_getposition
	movt	r3, #:upper16:s3c2410_dma_getposition
	add	r2, sp, #60
	add	r1, sp, #56
	add	fp, fp, #4
	add	r0, r0, #69
	movw	r5, #:lower16:printk
	blx	r3
	ldr	r3, [sp, #28]
	movw	r1, #:lower16:.LANCHOR2
	ldr	r6, [r4, fp, lsl #2]
	movw	r0, #:lower16:.LC0
	ldr	ip, [r4, #40]
	movt	r1, #:upper16:.LANCHOR2
	add	r3, r3, #4
	ldr	r2, [sp, #60]
	ldr	r3, [r4, r3, lsl #2]
	movt	r5, #:upper16:printk
	ldr	lr, [sp, #56]
	movt	r0, #:upper16:.LC0
	str	r3, [sp, #16]
	ldr	r3, [r4]
	str	r6, [sp, #12]
	str	r2, [sp, #8]
	mov	r2, #147
	stm	sp, {ip, lr}
	blx	r5
	b	.L11
	.fnend
	.size	dmatest_func, .-dmatest_func
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	dmatest_init, %function
dmatest_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r5, #:lower16:.LANCHOR0
	movt	r5, #:upper16:.LANCHOR0
	.pad #20
	sub	sp, sp, #20
	ldr	r3, [r5, #8]
	ldr	r2, [r5]
	lsl	r3, r3, #10
	cmp	r2, #4
	str	r3, [r5, #8]
	bls	.L78
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	str	r3, [sp, #12]
.L45:
	ldrh	r1, [r5, #12]
	mov	r3, #0
	mov	r2, #1
.L47:
	cmp	r1, r2, lsl r3
	add	r3, r3, #1
	beq	.L46
	cmp	r3, #10
	bne	.L47
	movw	r0, #:lower16:.LC12
	ldr	r3, [sp, #12]
	movt	r0, #:upper16:.LC12
	strh	r2, [r5, #12]	@ movhi
	blx	r3
.L46:
	ldr	r6, [r5, #24]
	cmp	r6, #0
	beq	.L50
	ldr	r10, .L88
	movw	r9, #:lower16:kmalloc_caches
	movw	r7, #:lower16:dma_alloc_coherent
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movt	r9, #:upper16:kmalloc_caches
	movt	r7, #:upper16:dma_alloc_coherent
	mov	r6, #0
	movt	r3, #:upper16:kmem_cache_alloc_trace
	str	r3, [sp, #8]
.L63:
	ldr	r0, [r9, #28]
	cmp	r0, #0
	beq	.L65
	mov	r2, #76
	movw	r1, #32976
	ldr	r3, [sp, #8]
	blx	r3
	subs	r4, r0, #0
	beq	.L83
.L49:
	mov	r3, #208
	add	r2, r4, #16
	ldr	r1, [r5, #8]
	mov	r0, #0
	blx	r7
	cmp	r0, #0
	str	r0, [r4, #8]
	beq	.L84
	mov	r3, #208
	add	r2, r4, #20
	ldr	r1, [r5, #8]
	mov	r0, #0
	blx	r7
	cmp	r0, #0
	str	r0, [r4, #12]
	beq	.L85
	ldr	r1, [r5, #8]
	ldr	r2, [r4, #8]
	lsrs	r1, r1, #2
	beq	.L55
	sub	r2, r2, #4
	mov	r3, #0
.L56:
	str	r3, [r2, #4]!
	add	r3, r3, #1
	cmp	r3, r1
	bne	.L56
	ldr	r2, [r5, #8]
	ldr	r3, [r4, #12]
	lsrs	r2, r2, #2
	beq	.L55
	add	r2, r3, r2, lsl #2
	mov	r1, #0
.L57:
	str	r1, [r3], #4
	cmp	r2, r3
	bne	.L57
.L55:
	mov	fp, #0
	movw	r1, #:lower16:.LC7
	movw	r3, #:lower16:__init_waitqueue_head
	movt	r1, #:upper16:.LC7
	movt	r3, #:upper16:__init_waitqueue_head
	mov	r2, r10
	add	r0, r4, #52
	str	r6, [r4]
	str	r4, [r4, #44]
	add	r8, r4, #44
	str	fp, [r4, #28]
	str	fp, [r4, #48]
	blx	r3
	ldr	r0, [r4]
	movw	r3, #:lower16:s3c2410_dma_request
	mov	r2, fp
	mov	r1, r8
	movt	r3, #:upper16:s3c2410_dma_request
	add	r0, r0, #69
	blx	r3
	cmp	r0, #0
	bne	.L86
	ldr	r0, [r4]
	movw	r1, #:lower16:s3cdma_cb
	movw	r3, #:lower16:s3c2410_dma_set_buffdone_fn
	movt	r1, #:upper16:s3cdma_cb
	movt	r3, #:upper16:s3c2410_dma_set_buffdone_fn
	add	r0, r0, #69
	blx	r3
	ldr	r0, [r4]
	movw	r3, #:lower16:s3c2410_dma_config
	movt	r3, #:upper16:s3c2410_dma_config
	ldrh	r1, [r5, #12]
	add	r0, r0, #69
	blx	r3
	cmp	r0, #0
	bne	.L87
	movw	r3, #:lower16:.LC10
	movw	r0, #:lower16:dmatest_func
	movw	fp, #:lower16:kthread_create_on_node
	str	r6, [sp]
	movt	fp, #:upper16:kthread_create_on_node
	movt	r3, #:upper16:.LC10
	movt	r0, #:upper16:dmatest_func
	mvn	r2, #0
	mov	r1, r4
	blx	fp
	cmn	r0, #4096
	mov	fp, r0
	bhi	.L62
	movw	r3, #:lower16:wake_up_process
	add	r6, r6, #1
	movt	r3, #:upper16:wake_up_process
	blx	r3
	str	fp, [r4, #4]
	add	r2, r4, #68
	ldr	r3, [r5, #20]
	ldr	r1, .L88+4
	str	r2, [r5, #20]
	str	r3, [r4, #72]
	str	r1, [r4, #68]
	str	r2, [r3]
	ldr	r3, [r5, #24]
	cmp	r6, r3
	bcc	.L63
.L50:
	movw	r0, #:lower16:.LC11
	mov	r1, r6
	ldr	r3, [sp, #12]
	movt	r0, #:upper16:.LC11
	blx	r3
	mov	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L65:
	mov	r4, #16
	b	.L49
.L62:
	movw	r0, #:lower16:.LC13
	str	fp, [r4, #4]
	movt	r0, #:upper16:.LC13
	mov	r1, r6
	ldr	r3, [sp, #12]
	blx	r3
.L61:
.L64:
	ldr	r0, [r4]
	movw	r3, #:lower16:s3c2410_dma_free
	mov	r1, r8
	movt	r3, #:upper16:s3c2410_dma_free
	add	r0, r0, #69
	blx	r3
.L59:
	movw	r7, #:lower16:dma_free_coherent
	ldr	r3, [r4, #20]
	movt	r7, #:upper16:dma_free_coherent
	ldr	r2, [r4, #12]
	ldr	r1, [r5, #8]
	mov	r0, #0
	blx	r7
.L54:
	ldr	r1, [r5, #8]
	mov	r0, #0
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #8]
	blx	r7
.L52:
	movw	r3, #:lower16:kfree
	mov	r0, r4
	movt	r3, #:upper16:kfree
	blx	r3
	b	.L50
.L84:
	movw	r0, #:lower16:.LC5
	mov	r1, r6
	ldr	r3, [sp, #12]
	movt	r0, #:upper16:.LC5
	blx	r3
	b	.L52
.L87:
	mov	r2, r0
	movw	r0, #:lower16:.LC9
	mov	r1, r6
	ldr	r3, [sp, #12]
	movt	r0, #:upper16:.LC9
	blx	r3
	b	.L64
.L86:
	mov	r2, r0
	movw	r0, #:lower16:.LC8
	mov	r1, r6
	ldr	r3, [sp, #12]
	movt	r0, #:upper16:.LC8
	blx	r3
	b	.L59
.L85:
	movw	r0, #:lower16:.LC6
	mov	r1, r6
	movt	r0, #:upper16:.LC6
	movw	r7, #:lower16:dma_free_coherent
	ldr	r3, [sp, #12]
	movt	r7, #:upper16:dma_free_coherent
	blx	r3
	b	.L54
.L83:
	movw	r0, #:lower16:.LC4
	mov	r1, r6
	ldr	r3, [sp, #12]
	movt	r0, #:upper16:.LC4
	blx	r3
	b	.L50
.L78:
	movw	r3, #:lower16:printk
	movw	r0, #:lower16:.LC3
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC3
	mov	r2, r3
	str	r3, [sp, #12]
	mov	r3, #5
	str	r3, [r5]
	blx	r2
	b	.L45
.L89:
	.align	2
.L88:
	.word	.LANCHOR1+4
	.word	.LANCHOR0+16
	.fnend
	.size	dmatest_init, .-dmatest_init
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.19196, %object
	.size	__func__.19196, 13
__func__.19196:
	.ascii	"dmatest_func\000"
	.space	3
	.type	__param_str_channels, %object
	.size	__param_str_channels, 22
__param_str_channels:
	.ascii	"dma_m2m_test.channels\000"
	.space	2
	.type	__param_str_sec, %object
	.size	__param_str_sec, 17
__param_str_sec:
	.ascii	"dma_m2m_test.sec\000"
	.space	3
	.type	__param_str_perf_test, %object
	.size	__param_str_perf_test, 23
__param_str_perf_test:
	.ascii	"dma_m2m_test.perf_test\000"
	.space	1
	.type	__param_str_burst, %object
	.size	__param_str_burst, 19
__param_str_burst:
	.ascii	"dma_m2m_test.burst\000"
	.space	1
	.type	__param_str_xfer_size, %object
	.size	__param_str_xfer_size, 23
__param_str_xfer_size:
	.ascii	"dma_m2m_test.xfer_size\000"
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	sec, %object
	.size	sec, 4
sec:
	.word	3600
	.type	perf_test, %object
	.size	perf_test, 2
perf_test:
	.short	1
	.space	2
	.type	xfer_size, %object
	.size	xfer_size, 4
xfer_size:
	.word	256
	.type	burst, %object
	.size	burst, 2
burst:
	.short	1
	.space	2
	.type	channel_list, %object
	.size	channel_list, 8
channel_list:
	.word	channel_list
	.word	channel_list
	.type	channels, %object
	.size	channels, 4
channels:
	.word	10000
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	delta, %object
	.size	delta, 4
delta:
	.space	4
	.type	__key.8140, %object
	.size	__key.8140, 0
__key.8140:
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_dmatest_init6, %object
	.size	__initcall_dmatest_init6, 4
__initcall_dmatest_init6:
	.word	dmatest_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"\012%s:%d Thrd-%u Done-%u <%x,%x>/<%x,%x>\012\000"
.LC1:
	.ascii	"<6>S3C DMA M2M Test: Thrd-%u: Cycle-%u Res-%u Xfer_"
	.ascii	"size-%d!\012\000"
	.space	3
.LC2:
	.ascii	"<6>S3C DMA M2M Test: Thrd-%u: Cycle-%u Xfer_cmp fai"
	.ascii	"led!\012\000"
	.space	3
.LC3:
	.ascii	"<6>S3C DMA M2M Test: Using 5secs test time\012\000"
.LC4:
	.ascii	"<6>S3C DMA M2M Test: Thrd-%u No memory for channel\012"
	.ascii	"\000"
.LC5:
	.ascii	"<6>S3C DMA M2M Test: Thrd-%u No memory for src buff"
	.ascii	"\012\000"
	.space	3
.LC6:
	.ascii	"<6>S3C DMA M2M Test: Thrd-%u No memory for dst buff"
	.ascii	"\012\000"
	.space	3
.LC7:
	.ascii	"&x->wait\000"
	.space	3
.LC8:
	.ascii	"<6>S3C DMA M2M Test: Thrd-%d acq(%d)\012\000"
	.space	2
.LC9:
	.ascii	"<6>S3C DMA M2M Test: Thrd-%d config(%d)\012\000"
	.space	3
.LC10:
	.ascii	"dma-m2m-test%u\000"
	.space	1
.LC11:
	.ascii	"<6>S3C DMA M2M Test: Testing with %u Channels\012\000"
	.space	1
.LC12:
	.ascii	"<6>S3C DMA M2M Test: Using 1 burst size\012\000"
	.space	3
.LC13:
	.ascii	"<6>S3C DMA M2M Test: Failed to run thread dma-m2m-t"
	.ascii	"est%u\012\000"
	.section	__param,"a",%progbits
	.align	2
	.type	__param_channels, %object
	.size	__param_channels, 16
__param_channels:
	.word	__param_str_channels
	.word	param_ops_uint
	.short	292
	.short	-1
	.word	channels
	.type	__param_sec, %object
	.size	__param_sec, 16
__param_sec:
	.word	__param_str_sec
	.word	param_ops_uint
	.short	292
	.short	-1
	.word	sec
	.type	__param_perf_test, %object
	.size	__param_perf_test, 16
__param_perf_test:
	.word	__param_str_perf_test
	.word	param_ops_ushort
	.short	292
	.short	-1
	.word	perf_test
	.type	__param_burst, %object
	.size	__param_burst, 16
__param_burst:
	.word	__param_str_burst
	.word	param_ops_ushort
	.short	292
	.short	-1
	.word	burst
	.type	__param_xfer_size, %object
	.size	__param_xfer_size, 16
__param_xfer_size:
	.word	__param_str_xfer_size
	.word	param_ops_uint
	.short	292
	.short	-1
	.word	xfer_size
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
