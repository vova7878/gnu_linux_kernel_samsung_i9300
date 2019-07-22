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
	.file	"pcm_native.c"

	.text
	.align	2
	.type	snd_pcm_mmap_data_open, %function
snd_pcm_mmap_data_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #80]
	add	r2, r3, #172
@ 44 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r1, [r2]
	add	r1, r1, #1
	strex	r0, r1, [r2]
	teq	r0, #0
	bne	1b
@ 0 "" 2
	bx	lr
	.fnend
	.size	snd_pcm_mmap_data_open, .-snd_pcm_mmap_data_open
	.align	2
	.type	snd_pcm_mmap_data_close, %function
snd_pcm_mmap_data_close:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #80]
	add	r2, r3, #172
@ 82 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r1, [r2]
	sub	r1, r1, #1
	strex	r0, r1, [r2]
	teq	r0, #0
	bne	1b
@ 0 "" 2
	bx	lr
	.fnend
	.size	snd_pcm_mmap_data_close, .-snd_pcm_mmap_data_close
	.align	2
	.type	snd_pcm_pre_start, %function
snd_pcm_pre_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	.save {r4}
	ldr	r3, [r0, #116]
	ldr	r2, [r3, #156]
	ldr	r1, [r2]
	cmp	r1, #2
	bne	.L8
	ldr	r1, [r0, #48]
	cmp	r1, #0
	bne	.L5
	ldr	r1, [r3, #128]
	ldr	ip, [r3, #116]
	cmp	ip, r1
	bcs	.L5
	ldr	r4, [r3, #160]
	ldr	r2, [r2, #8]
	ldr	ip, [r3, #68]
	ldr	r4, [r4]
	add	r2, ip, r2
	subs	r2, r2, r4
	addmi	r2, r2, r1
	bmi	.L7
	cmp	r1, r2
	rsbls	r2, r1, r2
.L7:
	cmp	ip, r2
	bls	.L9
.L5:
	str	r0, [r3]
	mov	r0, #0
.L4:
	ldr	r4, [sp], #4
	bx	lr
.L8:
	mvn	r0, #76
	b	.L4
.L9:
	mvn	r0, #31
	b	.L4
	.fnend
	.size	snd_pcm_pre_start, .-snd_pcm_pre_start
	.align	2
	.type	snd_pcm_pre_stop, %function
snd_pcm_pre_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #116]
	ldr	r2, [r3, #156]
	ldr	r2, [r2]
	cmp	r2, #0
	strne	r0, [r3]
	movne	r0, #0
	mvneq	r0, #76
	bx	lr
	.fnend
	.size	snd_pcm_pre_stop, .-snd_pcm_pre_stop
	.align	2
	.type	snd_pcm_pre_pause, %function
snd_pcm_pre_pause:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #116]
	ldr	r2, [r3, #88]
	tst	r2, #524288
	beq	.L18
	ldr	r2, [r3, #156]
	cmp	r1, #0
	ldr	r2, [r2]
	bne	.L21
	cmp	r2, #6
	bne	.L20
.L17:
	str	r0, [r3]
	mov	r0, #0
	bx	lr
.L21:
	cmp	r2, #3
	beq	.L17
.L20:
	mvn	r0, #76
	bx	lr
.L18:
	mvn	r0, #37
	bx	lr
	.fnend
	.size	snd_pcm_pre_pause, .-snd_pcm_pre_pause
	.align	2
	.type	snd_pcm_pre_suspend, %function
snd_pcm_pre_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #116]
	ldr	r2, [r3, #156]
	ldr	r2, [r2]
	cmp	r2, #7
	strne	r0, [r3]
	movne	r0, #0
	mvneq	r0, #15
	bx	lr
	.fnend
	.size	snd_pcm_pre_suspend, .-snd_pcm_pre_suspend
	.align	2
	.type	snd_pcm_pre_resume, %function
snd_pcm_pre_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #116]
	ldr	r2, [r3, #88]
	tst	r2, #262144
	strne	r0, [r3]
	movne	r0, #0
	mvneq	r0, #37
	bx	lr
	.fnend
	.size	snd_pcm_pre_resume, .-snd_pcm_pre_resume
	.align	2
	.type	snd_pcm_pre_reset, %function
snd_pcm_pre_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #116]
	ldr	r3, [r3, #156]
	ldr	r3, [r3]
	sub	r3, r3, #2
	cmp	r3, #5
	bhi	.L30
	mov	r2, #1
	mov	r3, r2, asl r3
	tst	r3, #51
	mvneq	r0, #76
	movne	r0, #0
	bx	lr
.L30:
	mvn	r0, #76
	bx	lr
	.fnend
	.size	snd_pcm_pre_reset, .-snd_pcm_pre_reset
	.global	__aeabi_uidivmod
	.align	2
	.type	snd_pcm_do_reset, %function
snd_pcm_do_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r1, #0
	ldr	ip, [r0, #112]
	mov	r2, r1
	ldr	r4, [r0, #116]
	ldr	r3, [ip, #8]
	blx	r3
	cmp	r0, #0
	ldmltfd	sp!, {r3, r4, r5, r6, r7, pc}
	ldr	r6, [r4, #156]
	mov	r5, #0
	str	r5, [r4, #20]
	movw	r3, #:lower16:__aeabi_uidivmod
	movt	r3, #:upper16:__aeabi_uidivmod
	ldr	r1, [r4, #60]
	ldr	r7, [r6, #8]
	mov	r0, r7
	blx	r3
	rsb	r1, r1, r7
	mov	r0, r5
	str	r1, [r4, #24]
	ldr	r3, [r6, #8]
	str	r5, [r4, #136]
	str	r3, [r4, #132]
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	snd_pcm_do_reset, .-snd_pcm_do_reset
	.align	2
	.type	snd_pcm_pre_prepare, %function
snd_pcm_pre_prepare:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #116]
	mov	r2, r0
	ldr	r3, [r3, #156]
	ldr	r3, [r3]
	bics	r0, r3, #8
	beq	.L38
	cmp	r3, #3
	beq	.L39
	cmp	r3, #5
	beq	.L41
.L37:
	mov	r0, #0
	str	r1, [r2, #176]
	bx	lr
.L41:
	ldr	r3, [r2, #48]
	cmp	r3, #0
	bne	.L37
.L39:
	mvn	r0, #15
	bx	lr
.L38:
	mvn	r0, #76
	bx	lr
	.fnend
	.size	snd_pcm_pre_prepare, .-snd_pcm_pre_prepare
	.align	2
	.type	snd_pcm_post_prepare, %function
snd_pcm_post_prepare:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #116]
	mov	r2, #2
	ldr	r0, [r3, #156]
	ldr	r1, [r3, #160]
	ldr	r0, [r0, #8]
	str	r0, [r1]
	ldr	r3, [r3, #156]
	str	r2, [r3]
	bx	lr
	.fnend
	.size	snd_pcm_post_prepare, .-snd_pcm_post_prepare
	.align	2
	.type	snd_pcm_pre_drain_init, %function
snd_pcm_pre_drain_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	mov	r0, #0
	ldr	r2, [r3, #116]
	str	r3, [r2]
	bx	lr
	.fnend
	.size	snd_pcm_pre_drain_init, .-snd_pcm_pre_drain_init
	.align	2
	.type	snd_pcm_post_drain_init, %function
snd_pcm_post_drain_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	snd_pcm_post_drain_init, .-snd_pcm_post_drain_init
	.align	2
	.type	snd_pcm_hw_rule_buffer_bytes_max, %function
snd_pcm_hw_rule_buffer_bytes_max:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	.pad #16
	sub	sp, sp, #16
	ldr	r2, [r1, #8]
	movw	r3, #:lower16:snd_interval_refine
	mov	lr, #0
	movt	r3, #:upper16:snd_interval_refine
	ldr	r1, [r1, #28]
	sub	r2, r2, #8
	ldrb	r4, [sp, #12]	@ zero_extendqisi2
	add	r2, r2, r2, asl #1
	str	lr, [sp, #4]
	ldr	ip, [r1, #76]
	add	r1, sp, #4
	add	r0, r0, r2, asl #2
	and	r4, r4, #252
	orr	r4, r4, #4
	add	r0, r0, #260
	strb	r4, [sp, #12]
	str	ip, [sp, #8]
	blx	r3
	add	sp, sp, #16
	@ sp needed
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	snd_pcm_hw_rule_buffer_bytes_max, .-snd_pcm_hw_rule_buffer_bytes_max
	.align	2
	.global	snd_pcm_hw_refine
	.type	snd_pcm_hw_refine, %function
snd_pcm_hw_refine:
	.fnstart
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.setfp fp, sp, #32
	add	fp, sp, #32
	.pad #116
	sub	sp, sp, #116
	mov	r4, r1
	mov	r3, #0
	ldr	r5, [r0, #116]
	movw	r9, #:lower16:memcmp
	ldr	r2, [r1, #512]
	movt	r9, #:upper16:memcmp
	add	r8, r4, #4
	mov	r7, r4
	ldr	r1, [r5, #520]
	mov	r10, r5
	tst	r2, #256
	str	r3, [r4, #520]
	strne	r3, [r4, #524]
	tst	r2, #2048
	str	r3, [r4, #536]
	movne	r3, #0
	mov	r1, r1, asl #2
	str	r9, [fp, #-120]
	mov	r9, #0
	str	r0, [fp, #-132]
	add	r1, r1, #10
	strne	r3, [r4, #528]
	bic	r1, r1, #7
	strne	r3, [r4, #532]
	sub	sp, sp, r1
	str	r9, [fp, #-136]
	str	r5, [fp, #-124]
	str	sp, [fp, #-128]
.L54:
	ldr	r6, [r7, #4]
	cmp	r6, #0
	bne	.L49
	ldr	r3, [r8, #4]
	cmp	r3, #0
	bne	.L49
.L55:
	mvn	r0, #21
.L132:
	sub	sp, fp, #32
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L49:
	ldr	r1, [fp, #-136]
	mov	r9, #1
	ldr	r3, [r4, #512]
	mov	r9, r9, asl r1
	tst	r9, r3
	str	r9, [fp, #-140]
	beq	.L89
	mov	r5, r8
	ldr	r9, [r10, #280]
	ldmia	r5!, {r0, r1, r2, r3}
	sub	ip, fp, #116
	and	r6, r6, r9
	cmp	r6, #0
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r5, {r0, r1, r2, r3}
	str	r6, [r7, #4]
	ldr	r6, [r10, #284]
	ldr	r5, [r8, #4]
	stmia	ip, {r0, r1, r2, r3}
	and	r5, r6, r5
	str	r5, [r8, #4]
	bne	.L51
	cmp	r5, #0
	bne	.L51
	ldr	r3, [r4, #516]
	mvn	r0, #21
	ldr	r8, [fp, #-140]
	orr	r3, r3, r8
	str	r3, [r4, #516]
	sub	sp, fp, #32
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L51:
	mov	r0, r8
	sub	r1, fp, #116
	mov	r2, #8
	ldr	r9, [fp, #-120]
	blx	r9
	cmp	r0, #0
	ldrne	r3, [r4, #516]
	ldrne	r9, [fp, #-140]
	orrne	r3, r3, r9
	strne	r3, [r4, #516]
.L89:
	ldr	r9, [fp, #-136]
	add	r7, r7, #32
	add	r8, r8, #32
	add	r10, r10, #32
	add	r9, r9, #1
	cmp	r9, #3
	str	r9, [fp, #-136]
	bne	.L54
	ldr	r5, [fp, #-124]
	movw	ip, #:lower16:snd_interval_refine
	add	r2, r4, #260
	movt	ip, #:upper16:snd_interval_refine
	mov	r9, r4
	mov	r6, #0
	add	r3, r5, #376
	mov	r8, #8
	mov	r10, #1
	str	r3, [fp, #-120]
	mov	r5, r2
	mov	r4, ip
	b	.L60
.L59:
	add	r6, r6, #12
	cmp	r6, #144
	beq	.L139
.L60:
	add	r0, r5, r6
	mov	r7, r10, asl r8
	ldrb	r1, [r0, #8]	@ zero_extendqisi2
	add	r8, r8, #1
	tst	r1, #8
	bne	.L55
	ldr	r1, [r9, #512]
	tst	r7, r1
	beq	.L59
	ldr	r2, [fp, #-120]
	add	r1, r2, r6
	blx	r4
	cmp	r0, #0
	beq	.L59
	ldr	r1, [r9, #516]
	orr	r3, r1, r7
	str	r3, [r9, #516]
	blt	.L132
	add	r6, r6, #12
	cmp	r6, #144
	bne	.L60
.L139:
	ldr	r5, [fp, #-124]
	mov	r4, r9
	ldr	r7, [fp, #-128]
	ldr	r0, [r5, #520]
	cmp	r0, #0
	beq	.L61
	mov	r3, #0
	sub	r2, r7, #4
	mov	r1, r3
.L62:
	add	r3, r3, #1
	str	r1, [r2, #4]!
	cmp	r3, r0
	bne	.L62
.L61:
	ldr	r6, [r4, #512]
	sub	r2, fp, #120
	mov	r3, #0
	mov	ip, #1
.L94:
	ands	r8, r6, ip, asl r3
	add	r3, r3, #1
	moveq	r1, #0
	movne	r1, #1
	cmp	r3, #20
	str	r1, [r2, #4]!
	bne	.L94
	mov	r9, #0
	mov	ip, #2
	mov	r6, r9
.L64:
	cmp	r6, r0
	bcc	.L71
.L141:
	cmp	r9, #0
	beq	.L140
	mov	r9, #0
	mov	r6, r9
	cmp	r6, r0
	bcs	.L141
.L71:
	ldr	r8, [r5, #528]
	ldr	r3, [r8, r6, asl #5]
	add	r8, r8, r6, asl #5
	cmp	r3, #0
	beq	.L65
	ldr	r2, [r4]
	tst	r3, r2
	beq	.L66
.L65:
	ldr	r3, [r8, #12]
	cmp	r3, #0
	blt	.L66
	sub	r1, fp, #36
	mov	r10, r6, asl #2
	add	r3, r1, r3, asl #2
	ldr	r1, [r7, r6, asl #2]
	ldr	r3, [r3, #-80]
	cmp	r1, r3
	bcc	.L67
	mov	r3, r8
	str	r8, [fp, #-120]
	b	.L68
.L69:
	ldr	r2, [r2, #-80]
	cmp	r2, r1
	bhi	.L136
.L68:
	ldr	r2, [r3, #16]
	sub	r8, fp, #36
	add	r3, r3, #4
	cmp	r2, #0
	add	r2, r8, r2, asl #2
	bge	.L69
.L66:
	add	r6, r6, #1
	b	.L64
.L136:
	ldr	r8, [fp, #-120]
.L67:
	ldr	r3, [r8, #4]
	mov	r0, r4
	str	ip, [fp, #-144]
	mov	r1, r8
	blx	r3
	ldr	ip, [fp, #-144]
	cmp	r0, #0
	str	ip, [r7, r10]
	beq	.L93
	ldr	r3, [r8, #8]
	cmp	r3, #0
	blt	.L70
	ldr	r2, [r4, #516]
	mov	r9, #1
	sub	r1, fp, #36
	orr	r3, r2, r9, asl r3
	str	r3, [r4, #516]
	ldr	r3, [r8, #8]
	add	r3, r1, r3, asl #2
	str	ip, [r3, #-80]
.L70:
	cmp	r0, #0
	blt	.L132
.L93:
	ldr	r0, [r5, #520]
	add	ip, ip, #1
	add	r6, r6, #1
	b	.L64
.L140:
	ldr	r3, [r4, #524]
	cmp	r3, #0
	bne	.L73
	ldr	r3, [r4, #260]
	ldr	r2, [r4, #264]
	cmp	r3, r2
	beq	.L74
	add	r1, r3, #1
	cmp	r2, r1
	bne	.L73
	ldrb	r2, [r4, #268]	@ zero_extendqisi2
	tst	r2, #2
	bne	.L74
.L73:
	ldr	r3, [r4, #532]
	cmp	r3, #0
	bne	.L75
	ldr	r3, [r4, #296]
	ldr	r2, [r4, #300]
	cmp	r3, r2
	beq	.L76
	add	r1, r3, #1
	cmp	r2, r1
	bne	.L75
	ldrb	r2, [r4, #304]	@ zero_extendqisi2
	tst	r2, #2
	bne	.L76
.L75:
	ldr	r8, [fp, #-132]
	ldr	r3, [r4, #520]
	ldr	r2, [r8, #116]
	cmp	r3, #0
	ldreq	r3, [r2, #216]
	biceq	r3, r3, #-2147483648
	streq	r3, [r4, #520]
	ldr	r3, [r4, #536]
	cmp	r3, #0
	bne	.L87
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L79
	ldr	r3, [r4, #40]
	cmp	r3, #0
	bne	.L142
.L80:
	ldrb	r1, [r4, #292]	@ zero_extendqisi2
	ldr	r3, [r4, #288]
	ldr	r2, [r4, #284]
	tst	r1, #2
	subne	r3, r3, #1
	cmp	r2, r3
	beq	.L143
.L87:
	mov	r0, #0
	str	r0, [r4, #512]
	sub	sp, fp, #32
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L76:
	mov	r2, #1
	str	r3, [r4, #528]
	str	r2, [r4, #532]
	b	.L75
.L74:
	str	r3, [r4, #524]
	b	.L73
.L143:
	ldr	r9, [fp, #-132]
	mov	r1, #4
	mov	r2, r4
	ldr	r3, [r9, #112]
	mov	r0, r9
	ldr	r3, [r3, #8]
	blx	r3
	cmp	r0, #0
	bge	.L87
	b	.L132
.L79:
	ldr	r2, [r4, #40]
	rsb	r0, r3, #0
	and	r0, r0, r3
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r0, r0
@ 0 "" 2
	cmp	r2, #0
	rsb	r0, r0, #31
	movne	r3, r2
	movne	r1, #32
	moveq	r1, #0
.L81:
	cmp	r3, #65536
	movcs	r3, r3, lsr #16
	movcs	r2, #16
	movcc	r2, #0
	cmp	r3, #255
	movhi	r3, r3, lsr #8
	addhi	r2, r2, #8
	cmp	r3, #15
	movhi	r3, r3, lsr #4
	addhi	r2, r2, #4
	cmp	r3, #3
	movhi	r3, r3, lsr #2
	addhi	r2, r2, #2
	cmp	r3, #1
	addne	r2, r2, #1
	add	r2, r2, r1
	cmp	r2, r0
	bne	.L87
	b	.L80
.L142:
	rsb	r0, r3, #0
	mov	r1, #32
	and	r0, r0, r3
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r0, r0
@ 0 "" 2
	rsb	r0, r0, #63
	b	.L81
	.fnend
	.size	snd_pcm_hw_refine, .-snd_pcm_hw_refine
	.align	2
	.type	snd_pcm_trigger_tstamp, %function
snd_pcm_trigger_tstamp:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	ldr	r4, [r0, #116]
	ldr	r3, [r4]
	cmp	r3, #0
	ldmeqfd	sp!, {r4, pc}
	cmp	r0, r3
	beq	.L152
	mov	r0, r3
	bl	snd_pcm_trigger_tstamp
	mov	r3, r4
	ldr	r2, [r3], #4
	ldr	r2, [r2, #116]
	ldmib	r2, {r0, r1}
	stmia	r3, {r0, r1}
.L148:
	mov	r3, #0
	str	r3, [r4]
	ldmfd	sp!, {r4, pc}
.L152:
	ldr	r3, [r4, #544]
	add	r0, r4, #4
	cmp	r3, #1
	movweq	r3, #:lower16:ktime_get_ts
	movwne	r3, #:lower16:getnstimeofday
	movteq	r3, #:upper16:ktime_get_ts
	movtne	r3, #:upper16:getnstimeofday
	blx	r3
	b	.L148
	.fnend
	.size	snd_pcm_trigger_tstamp, .-snd_pcm_trigger_tstamp
	.align	2
	.type	snd_pcm_hwsync, %function
snd_pcm_hwsync:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r3, #:lower16:_raw_read_lock_irq
	mov	r4, r0
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_lock_irq
	ldr	r6, [r4, #116]
	add	r5, r4, #140
	blx	r3
	movw	r3, #:lower16:_raw_spin_lock
	mov	r0, r5
	movt	r3, #:upper16:_raw_spin_lock
	blx	r3
	ldr	r3, [r6, #156]
	ldr	r3, [r3]
	sub	r3, r3, #2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L161
.L156:
	.word	.L160
	.word	.L157
	.word	.L158
	.word	.L159
	.word	.L161
	.word	.L160
.L159:
	ldr	r3, [r4, #48]
	cmp	r3, #1
	beq	.L161
.L157:
	movw	r3, #:lower16:snd_pcm_update_hw_ptr
	mov	r0, r4
	movt	r3, #:upper16:snd_pcm_update_hw_ptr
	blx	r3
	and	r4, r0, r0, asr #31
.L155:
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r5
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_unlock_irq
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, pc}
.L160:
	mov	r4, #0
	b	.L155
.L158:
	mvn	r4, #31
	b	.L155
.L161:
	mvn	r4, #76
	b	.L155
	.fnend
	.size	snd_pcm_hwsync, .-snd_pcm_hwsync
	.align	2
	.type	snd_pcm_action_group, %function
snd_pcm_action_group:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r1
	ldr	r1, [r1, #160]
	mov	r6, r0
	mov	r7, r2
	mov	fp, r3
	ldr	r4, [r1, #8]!
	cmp	r4, r1
	sub	r4, r4, #132
	beq	.L178
	movw	r10, #:lower16:_raw_spin_lock
	adds	r9, r3, #0
	movne	r9, #1
	movt	r10, #:upper16:_raw_spin_lock
	b	.L167
.L164:
	ldr	r3, [r6]
	mov	r0, r4
	mov	r1, r7
	blx	r3
	subs	r8, r0, #0
	blt	.L165
	ldr	r2, [r5, #160]
	ldr	r4, [r4, #132]
	add	r3, r2, #8
	cmp	r3, r4
	sub	r4, r4, #132
	beq	.L187
.L167:
	cmp	r4, r5
	moveq	r3, #0
	andne	r3, r9, #1
	cmp	r3, #0
	beq	.L164
	add	r0, r4, #140
	blx	r10
	b	.L164
.L170:
	cmp	r9, r4
	beq	.L182
	ldr	r3, [r6, #8]
.L169:
	mov	r0, r9
	mov	r1, r7
	blx	r3
	ldr	r3, [r5, #160]
	ldr	r9, [r9, #132]
	add	r3, r3, #8
	cmp	r9, r3
	sub	r9, r9, #132
	bne	.L170
.L182:
	mov	r4, #0
.L165:
	cmp	fp, #0
	beq	.L184
	ldr	r3, [r5, #160]
	ldr	r6, [r3, #8]!
	cmp	r6, r3
	sub	r6, r6, #132
	beq	.L184
	movw	r7, #:lower16:_raw_spin_unlock
	movt	r7, #:upper16:_raw_spin_unlock
	b	.L177
.L188:
	ldr	r3, [r5, #160]
	ldr	r6, [r6, #132]
	add	r3, r3, #8
	cmp	r6, r3
	sub	r6, r6, #132
	beq	.L184
.L177:
	cmp	r6, r5
	add	r0, r6, #140
	beq	.L176
	blx	r7
.L176:
	cmp	r6, r4
	bne	.L188
.L184:
	mov	r0, r8
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L187:
	ldr	r4, [r2, #8]
	cmp	r3, r4
	sub	r4, r4, #132
	bne	.L172
	b	.L165
.L168:
	ldr	r2, [r5, #160]
	ldr	r4, [r4, #132]
	add	r3, r2, #8
	cmp	r3, r4
	sub	r4, r4, #132
	beq	.L189
.L172:
	ldr	r3, [r6, #4]
	mov	r0, r4
	mov	r1, r7
	blx	r3
	subs	r8, r0, #0
	bge	.L168
	ldr	r3, [r6, #8]
	cmp	r3, #0
	moveq	r4, r3
	beq	.L165
	ldr	r2, [r5, #160]
	ldr	r9, [r2, #8]!
	cmp	r9, r2
	sub	r9, r9, #132
	beq	.L182
	cmp	r9, r4
	bne	.L169
	b	.L182
.L189:
	ldr	r4, [r2, #8]
	cmp	r3, r4
	sub	r4, r4, #132
	beq	.L165
.L173:
	ldr	r3, [r6, #12]
	mov	r0, r4
	mov	r1, r7
	blx	r3
	ldr	r3, [r5, #160]
	ldr	r4, [r4, #132]
	add	r3, r3, #8
	cmp	r4, r3
	sub	r4, r4, #132
	bne	.L173
	b	.L165
.L178:
	mov	r8, #0
	b	.L165
	.fnend
	.size	snd_pcm_action_group, .-snd_pcm_action_group
	.align	2
	.type	snd_pcm_post_reset, %function
snd_pcm_post_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	ldr	r3, [r0, #116]
	ldr	ip, [r3, #156]
	ldr	r1, [r3, #160]
	ldr	ip, [ip, #8]
	str	ip, [r1]
	ldr	r2, [r0, #48]
	cmp	r2, #0
	ldmnefd	sp!, {r3, pc}
	ldr	r3, [r3, #124]
	cmp	r3, #0
	ldmeqfd	sp!, {r3, pc}
	movw	r3, #:lower16:snd_pcm_playback_silence
	mvn	r1, #0
	movt	r3, #:upper16:snd_pcm_playback_silence
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	snd_pcm_post_reset, .-snd_pcm_post_reset
	.global	__aeabi_uidiv
	.align	2
	.type	snd_pcm_post_start, %function
snd_pcm_post_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r1
	ldr	r4, [r0, #116]
	mov	r5, r0
	bl	snd_pcm_trigger_tstamp
	movw	r3, #:lower16:jiffies
	ldr	r1, [r4, #52]
	movt	r3, #:upper16:jiffies
	ldr	r3, [r3]
	cmp	r1, #0
	str	r3, [r4, #28]
	beq	.L196
	ldr	r0, [r4, #68]
	mov	ip, #300
	movw	r3, #:lower16:__aeabi_uidiv
	movt	r3, #:upper16:__aeabi_uidiv
	mul	r0, ip, r0
	blx	r3
	str	r0, [r4, #32]
.L196:
	ldr	r3, [r4, #156]
	str	r6, [r3]
	ldr	r3, [r5, #48]
	cmp	r3, #0
	bne	.L197
	ldr	r3, [r4, #124]
	cmp	r3, #0
	bne	.L208
.L197:
	ldr	r0, [r5, #120]
	cmp	r0, #0
	ldmeqfd	sp!, {r4, r5, r6, pc}
	movw	r3, #:lower16:snd_timer_notify
	add	r2, r4, #4
	movt	r3, #:upper16:snd_timer_notify
	mov	r1, #12
	blx	r3
	ldmfd	sp!, {r4, r5, r6, pc}
.L208:
	movw	r3, #:lower16:snd_pcm_playback_silence
	mov	r0, r5
	movt	r3, #:upper16:snd_pcm_playback_silence
	mvn	r1, #0
	blx	r3
	b	.L197
	.fnend
	.size	snd_pcm_post_start, .-snd_pcm_post_start
	.align	2
	.type	snd_pcm_post_resume, %function
snd_pcm_post_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r5, [r0, #116]
	bl	snd_pcm_trigger_tstamp
	ldr	r0, [r4, #120]
	cmp	r0, #0
	beq	.L210
	movw	r3, #:lower16:snd_timer_notify
	mov	r1, #18
	movt	r3, #:upper16:snd_timer_notify
	add	r2, r5, #4
	blx	r3
.L210:
	ldr	r3, [r5, #156]
	ldr	r2, [r3, #20]
	str	r2, [r3]
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	snd_pcm_post_resume, .-snd_pcm_post_resume
	.align	2
	.type	snd_pcm_post_stop, %function
snd_pcm_post_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r4, [r0, #116]
	mov	r5, r1
	ldr	r3, [r4, #156]
	ldr	r3, [r3]
	cmp	r3, r1
	beq	.L215
	bl	snd_pcm_trigger_tstamp
	ldr	r0, [r6, #120]
	cmp	r0, #0
	beq	.L216
	movw	r3, #:lower16:snd_timer_notify
	mov	r1, #13
	movt	r3, #:upper16:snd_timer_notify
	add	r2, r4, #4
	blx	r3
.L216:
	ldr	r3, [r4, #156]
	str	r5, [r3]
.L215:
	movw	r5, #:lower16:__wake_up
	add	r0, r4, #168
	movt	r5, #:upper16:__wake_up
	mov	r1, #3
	mov	r2, #1
	mov	r3, #0
	blx	r5
	add	r0, r4, #184
	mov	r1, #3
	mov	r2, #1
	mov	r3, #0
	blx	r5
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	snd_pcm_post_stop, .-snd_pcm_post_stop
	.align	2
	.type	snd_pcm_post_suspend, %function
snd_pcm_post_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	ldr	r4, [r0, #116]
	bl	snd_pcm_trigger_tstamp
	ldr	r0, [r5, #120]
	cmp	r0, #0
	beq	.L221
	movw	r3, #:lower16:snd_timer_notify
	mov	r1, #17
	movt	r3, #:upper16:snd_timer_notify
	add	r2, r4, #4
	blx	r3
.L221:
	ldr	ip, [r4, #156]
	mov	lr, #7
	movw	r5, #:lower16:__wake_up
	add	r0, r4, #168
	movt	r5, #:upper16:__wake_up
	mov	r1, #3
	ldr	r6, [ip]
	mov	r2, #1
	mov	r3, #0
	str	r6, [ip, #20]
	ldr	ip, [r4, #156]
	str	lr, [ip]
	blx	r5
	add	r0, r4, #184
	mov	r1, #3
	mov	r2, #1
	mov	r3, #0
	blx	r5
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	snd_pcm_post_suspend, .-snd_pcm_post_suspend
	.align	2
	.type	snd_pcm_post_pause, %function
snd_pcm_post_pause:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r1
	ldr	r4, [r0, #116]
	mov	r5, r0
	bl	snd_pcm_trigger_tstamp
	cmp	r6, #0
	ldr	r3, [r4, #156]
	beq	.L226
	mov	r2, #6
	str	r2, [r3]
	ldr	r0, [r5, #120]
	cmp	r0, #0
	beq	.L227
	movw	r3, #:lower16:snd_timer_notify
	mov	r1, #15
	movt	r3, #:upper16:snd_timer_notify
	add	r2, r4, #4
	blx	r3
.L227:
	movw	r5, #:lower16:__wake_up
	add	r0, r4, #168
	movt	r5, #:upper16:__wake_up
	mov	r1, #3
	mov	r2, #1
	mov	r3, #0
	blx	r5
	add	r0, r4, #184
	mov	r1, #3
	mov	r2, #1
	mov	r3, #0
	blx	r5
	ldmfd	sp!, {r4, r5, r6, pc}
.L226:
	mov	r2, #3
	str	r2, [r3]
	ldr	r0, [r5, #120]
	cmp	r0, #0
	ldmeqfd	sp!, {r4, r5, r6, pc}
	movw	r3, #:lower16:snd_timer_notify
	add	r2, r4, #4
	movt	r3, #:upper16:snd_timer_notify
	mov	r1, #14
	blx	r3
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	snd_pcm_post_pause, .-snd_pcm_post_pause
	.align	2
	.type	snd_pcm_hw_rule_muldivk, %function
snd_pcm_hw_rule_muldivk:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	.save {r4, r5, lr}
	mov	r5, r0
	mov	r4, r1
	ldr	r0, [r1, #12]
	.pad #20
	sub	sp, sp, #20
	movw	ip, #:lower16:snd_interval_muldivk
	ldr	r1, [r1, #16]
	movt	ip, #:upper16:snd_interval_muldivk
	sub	r0, r0, #8
	ldr	r2, [r4, #28]
	add	r0, r0, r0, asl #1
	add	r3, sp, #4
	sub	r1, r1, #8
	add	r1, r1, r1, asl #1
	add	r0, r5, r0, asl #2
	add	r1, r5, r1, asl #2
	add	r0, r0, #260
	add	r1, r1, #260
	blx	ip
	ldr	r2, [r4, #8]
	movw	r3, #:lower16:snd_interval_refine
	add	r1, sp, #4
	movt	r3, #:upper16:snd_interval_refine
	sub	r2, r2, #8
	add	r2, r2, r2, asl #1
	add	r0, r5, r2, asl #2
	add	r0, r0, #260
	blx	r3
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
	.fnend
	.size	snd_pcm_hw_rule_muldivk, .-snd_pcm_hw_rule_muldivk
	.align	2
	.type	snd_pcm_hw_rule_mulkdiv, %function
snd_pcm_hw_rule_mulkdiv:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	.save {r4, r5, lr}
	mov	r5, r0
	ldr	r2, [r1, #16]
	.pad #20
	sub	sp, sp, #20
	movw	ip, #:lower16:snd_interval_mulkdiv
	mov	r4, r1
	ldr	r0, [r1, #12]
	movt	ip, #:upper16:snd_interval_mulkdiv
	sub	r2, r2, #8
	ldr	r1, [r1, #28]
	add	r2, r2, r2, asl #1
	add	r3, sp, #4
	sub	r0, r0, #8
	add	r0, r0, r0, asl #1
	add	r2, r5, r2, asl #2
	add	r0, r5, r0, asl #2
	add	r2, r2, #260
	add	r0, r0, #260
	blx	ip
	ldr	r2, [r4, #8]
	movw	r3, #:lower16:snd_interval_refine
	add	r1, sp, #4
	movt	r3, #:upper16:snd_interval_refine
	sub	r2, r2, #8
	add	r2, r2, r2, asl #1
	add	r0, r5, r2, asl #2
	add	r0, r0, #260
	blx	r3
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
	.fnend
	.size	snd_pcm_hw_rule_mulkdiv, .-snd_pcm_hw_rule_mulkdiv
	.align	2
	.type	snd_pcm_hw_rule_mul, %function
snd_pcm_hw_rule_mul:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	.save {r4, r5, lr}
	mov	r4, r0
	mov	r5, r1
	ldr	r0, [r1, #12]
	.pad #20
	sub	sp, sp, #20
	movw	r3, #:lower16:snd_interval_mul
	ldr	r1, [r1, #16]
	add	r2, sp, #4
	sub	r0, r0, #8
	movt	r3, #:upper16:snd_interval_mul
	add	r0, r0, r0, asl #1
	sub	r1, r1, #8
	add	r1, r1, r1, asl #1
	add	r0, r4, r0, asl #2
	add	r1, r4, r1, asl #2
	add	r0, r0, #260
	add	r1, r1, #260
	blx	r3
	ldr	r2, [r5, #8]
	movw	r3, #:lower16:snd_interval_refine
	add	r1, sp, #4
	movt	r3, #:upper16:snd_interval_refine
	sub	r2, r2, #8
	add	r2, r2, r2, asl #1
	add	r0, r4, r2, asl #2
	add	r0, r0, #260
	blx	r3
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
	.fnend
	.size	snd_pcm_hw_rule_mul, .-snd_pcm_hw_rule_mul
	.align	2
	.type	snd_pcm_hw_rule_div, %function
snd_pcm_hw_rule_div:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	.save {r4, r5, lr}
	mov	r4, r0
	mov	r5, r1
	ldr	r0, [r1, #12]
	.pad #20
	sub	sp, sp, #20
	movw	r3, #:lower16:snd_interval_div
	ldr	r1, [r1, #16]
	add	r2, sp, #4
	sub	r0, r0, #8
	movt	r3, #:upper16:snd_interval_div
	add	r0, r0, r0, asl #1
	sub	r1, r1, #8
	add	r1, r1, r1, asl #1
	add	r0, r4, r0, asl #2
	add	r1, r4, r1, asl #2
	add	r0, r0, #260
	add	r1, r1, #260
	blx	r3
	ldr	r2, [r5, #8]
	movw	r3, #:lower16:snd_interval_refine
	add	r1, sp, #4
	movt	r3, #:upper16:snd_interval_refine
	sub	r2, r2, #8
	add	r2, r2, r2, asl #1
	add	r0, r4, r2, asl #2
	add	r0, r0, #260
	blx	r3
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
	.fnend
	.size	snd_pcm_hw_rule_div, .-snd_pcm_hw_rule_div
	.align	2
	.type	snd_pcm_hw_rule_sample_bits, %function
snd_pcm_hw_rule_sample_bits:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	sub	sp, sp, #16
	ldrb	r2, [sp, #12]	@ zero_extendqisi2
	mov	r3, #0
	movw	r5, #:lower16:snd_pcm_format_physical_width
	mov	r6, r1
	mvn	r1, #0
	mov	r7, r0
	and	r2, r2, #254
	mov	r4, r3
	bfi	r2, r3, #1, #1
	movt	r5, #:upper16:snd_pcm_format_physical_width
	mov	r8, #1
	strb	r2, [sp, #12]
	stmib	sp, {r1, r3}
	b	.L245
.L241:
	add	r4, r4, #1
	cmp	r4, #48
	beq	.L246
.L245:
	mov	r3, r4, lsr #5
	and	r2, r4, #31
	add	r3, r7, r3, asl #2
	ldr	r3, [r3, #36]
	ands	r3, r3, r8, asl r2
	beq	.L241
	mov	r0, r4
	blx	r5
	cmp	r0, #0
	ble	.L241
	ldmib	sp, {r2, r3}
	add	r4, r4, #1
	cmp	r2, r0
	strhi	r0, [sp, #4]
	cmp	r0, r3
	strhi	r0, [sp, #8]
	cmp	r4, #48
	bne	.L245
.L246:
	ldr	r2, [r6, #8]
	movw	r3, #:lower16:snd_interval_refine
	ldrb	r0, [sp, #12]	@ zero_extendqisi2
	movt	r3, #:upper16:snd_interval_refine
	add	r1, sp, #4
	sub	r2, r2, #8
	add	r2, r2, r2, asl #1
	orr	r0, r0, #4
	strb	r0, [sp, #12]
	add	r0, r7, r2, asl #2
	add	r0, r0, #260
	blx	r3
	add	sp, sp, #16
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	snd_pcm_hw_rule_sample_bits, .-snd_pcm_hw_rule_sample_bits
	.align	2
	.type	snd_pcm_hw_rule_format, %function
snd_pcm_hw_rule_format:
	.fnstart
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r7, r0
	ldr	r2, [r1, #12]
	.pad #64
	sub	sp, sp, #64
	movw	r3, #:lower16:memset
	movw	r8, #:lower16:snd_pcm_format_physical_width
	movt	r3, #:upper16:memset
	mov	r1, #255
	sub	r2, r2, #8
	mov	r0, sp
	add	r2, r2, r2, asl #1
	movt	r8, #:upper16:snd_pcm_format_physical_width
	mov	r4, #0
	add	r10, r7, r2, asl #2
	mov	r2, #8
	mov	r9, #1
	add	r10, r10, #260
	blx	r3
	b	.L253
.L249:
	add	r4, r4, #1
	cmp	r4, #48
	beq	.L257
.L253:
	mov	r5, r4, lsr #5
	and	r6, r4, #31
	mov	r6, r9, asl r6
	mov	r5, r5, asl #2
	add	r3, r7, r5
	ldr	r3, [r3, #36]
	tst	r6, r3
	beq	.L249
	mov	r0, r4
	blx	r8
	cmp	r0, #0
	add	r3, sp, #64
	add	r5, r3, r5
	ble	.L249
	ldr	r3, [r10]
	cmp	r0, r3
	bcc	.L251
	ldr	r3, [r10, #4]
	cmp	r0, r3
	bls	.L249
.L251:
	ldr	r3, [r5, #-64]
	add	r4, r4, #1
	cmp	r4, #48
	bic	r6, r3, r6
	str	r6, [r5, #-64]
	bne	.L253
.L257:
	add	r6, r7, #36
	ldr	r10, [sp]
	mov	r4, r6
	add	ip, sp, #32
	ldmia	r4!, {r0, r1, r2, r3}
	ldr	r8, [r7, #40]
	ldr	r9, [sp, #4]
	and	r5, r10, r0
	stmia	ip!, {r0, r1, r2, r3}
	cmp	r5, #0
	ldmia	r4, {r0, r1, r2, r3}
	and	r4, r9, r8
	str	r5, [r7, #36]
	str	r4, [r7, #40]
	stmia	ip, {r0, r1, r2, r3}
	bne	.L254
	cmp	r4, #0
	bne	.L254
	mvn	r0, #21
.L256:
	add	sp, sp, #64
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L254:
	movw	r3, #:lower16:memcmp
	mov	r0, r6
	add	r1, sp, #32
	movt	r3, #:upper16:memcmp
	mov	r2, #8
	blx	r3
	adds	r0, r0, #0
	movne	r0, #1
	b	.L256
	.fnend
	.size	snd_pcm_hw_rule_format, .-snd_pcm_hw_rule_format
	.align	2
	.type	snd_pcm_hw_rule_rate, %function
snd_pcm_hw_rule_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r2, #:lower16:.LANCHOR1
	ldr	r3, [r1, #8]
	movw	ip, #:lower16:snd_interval_list
	movt	r2, #:upper16:.LANCHOR1
	movt	ip, #:upper16:snd_interval_list
	ldr	r4, [r1, #28]
	mov	r1, #13
	sub	r3, r3, #8
	add	lr, r3, r3, asl #1
	ldr	r3, [r4, #16]
	add	r0, r0, lr, asl #2
	add	r0, r0, #260
	blx	ip
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	snd_pcm_hw_rule_rate, .-snd_pcm_hw_rule_rate
	.align	2
	.type	snd_pcm_capture_poll, %function
snd_pcm_capture_poll:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	ldr	r3, [r0, #124]
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L260
	ldr	r4, [r5, #116]
	cmp	r4, #0
	beq	.L260
	cmp	r1, #0
	beq	.L262
	ldr	r3, [r1]
	cmp	r3, #0
	beq	.L262
	mov	r2, r1
	add	r1, r4, #168
	blx	r3
.L262:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_lock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_lock_irq
	blx	r3
	add	r5, r5, #140
	movw	r3, #:lower16:_raw_spin_lock
	mov	r0, r5
	movt	r3, #:upper16:_raw_spin_lock
	blx	r3
	ldr	r3, [r4, #156]
	ldr	r0, [r4, #160]
	ldr	r1, [r3, #8]
	ldr	r2, [r0]
	ldr	r3, [r3]
	subs	r2, r1, r2
	ldrmi	r1, [r4, #128]
	sub	r3, r3, #2
	addmi	r2, r2, r1
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L271
.L266:
	.word	.L265
	.word	.L265
	.word	.L271
	.word	.L267
	.word	.L265
.L267:
	cmp	r2, #0
	bne	.L268
.L271:
	mov	r4, #73
.L264:
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r5
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_unlock_irq
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, pc}
.L265:
	ldr	r3, [r0, #4]
	cmp	r3, r2
	movhi	r4, #0
	bhi	.L264
.L268:
	mov	r4, #65
	b	.L264
.L260:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:.LC1
	movw	r3, #:lower16:.LC2
	movw	ip, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:.LC2
	movt	ip, #:upper16:warn_slowpath_fmt
	movw	r1, #2961
	blx	ip
	mvn	r0, #5
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	snd_pcm_capture_poll, .-snd_pcm_capture_poll
	.align	2
	.type	snd_pcm_playback_poll, %function
snd_pcm_playback_poll:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	ldr	r3, [r0, #124]
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L285
	ldr	r4, [r5, #116]
	cmp	r4, #0
	beq	.L285
	cmp	r1, #0
	beq	.L287
	ldr	r3, [r1]
	cmp	r3, #0
	beq	.L287
	mov	r2, r1
	add	r1, r4, #168
	blx	r3
.L287:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_lock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_lock_irq
	blx	r3
	add	r5, r5, #140
	movw	r3, #:lower16:_raw_spin_lock
	mov	r0, r5
	movt	r3, #:upper16:_raw_spin_lock
	blx	r3
	ldr	r2, [r4, #156]
	ldr	r0, [r4, #160]
	ldr	ip, [r4, #68]
	ldr	r3, [r2, #8]
	ldr	r1, [r0]
	add	r3, ip, r3
	subs	r3, r3, r1
	ldr	r1, [r4, #128]
	addmi	r3, r3, r1
	bmi	.L289
	cmp	r3, r1
	rsbcs	r3, r1, r3
.L289:
	ldr	r2, [r2]
	sub	r2, r2, #2
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L296
.L292:
	.word	.L291
	.word	.L291
	.word	.L296
	.word	.L293
	.word	.L291
.L293:
	mov	r4, #0
.L290:
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r5
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_unlock_irq
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, pc}
.L291:
	ldr	r4, [r0, #4]
	cmp	r4, r3
	movls	r4, #260
	movhi	r4, #0
	b	.L290
.L285:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:.LC1
	movw	r3, #:lower16:.LC2
	movw	ip, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:.LC2
	movt	ip, #:upper16:warn_slowpath_fmt
	movw	r1, #2922
	blx	ip
	mvn	r0, #5
	ldmfd	sp!, {r3, r4, r5, pc}
.L296:
	mov	r4, #268
	b	.L290
	.fnend
	.size	snd_pcm_playback_poll, .-snd_pcm_playback_poll
	.align	2
	.type	snd_pcm_write, %function
snd_pcm_write:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r7, r1
	ldr	r3, [r0, #124]
	mov	r6, r2
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L310
	ldr	r4, [r5, #116]
	cmp	r4, #0
	beq	.L310
	ldr	r3, [r4, #156]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L326
	movw	r3, #:lower16:__aeabi_uidivmod
	mov	r0, r6
	movt	r3, #:upper16:__aeabi_uidivmod
	ldr	r1, [r4, #76]
	blx	r3
	cmp	r1, #0
	bne	.L314
	movw	r3, #:lower16:__aeabi_uidiv
	ldr	r1, [r4, #80]
	mov	r0, r6, asl #3
	movt	r3, #:upper16:__aeabi_uidiv
	blx	r3
	movw	r3, #:lower16:snd_pcm_lib_write
	mov	r2, r0
	movt	r3, #:upper16:snd_pcm_lib_write
	mov	r0, r5
	mov	r1, r7
	blx	r3
	cmp	r0, #0
	ldrgt	r3, [r4, #80]
	mulgt	r0, r3, r0
	movgt	r0, r0, lsr #3
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L310:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:.LC1
	movw	r3, #:lower16:.LC2
	movw	ip, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:.LC2
	movt	ip, #:upper16:warn_slowpath_fmt
	movw	r1, #2827
	blx	ip
	mvn	r0, #5
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L314:
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L326:
	mvn	r0, #76
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	snd_pcm_write, .-snd_pcm_write
	.align	2
	.type	snd_pcm_aio_write, %function
snd_pcm_aio_write:
	.fnstart
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, r1
	ldr	r3, [r0, #20]
	ldr	r3, [r3, #124]
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L328
	ldr	r6, [r7, #116]
	cmp	r6, #0
	beq	.L328
	ldr	r3, [r6, #156]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L352
	cmp	r2, #128
	bhi	.L339
	ldr	r5, [r6, #56]
	cmp	r5, r2
	bne	.L339
	ldr	r8, [r4, #4]
	movw	r3, #:lower16:__aeabi_uidivmod
	movt	r3, #:upper16:__aeabi_uidivmod
	ldr	r1, [r6, #76]
	mov	r0, r8
	blx	r3
	subs	r10, r1, #0
	bne	.L339
	movw	r3, #:lower16:__aeabi_uidiv
	ldr	r1, [r6, #84]
	mov	r0, r8, asl #3
	movt	r3, #:upper16:__aeabi_uidiv
	blx	r3
	movw	r3, #:lower16:__kmalloc
	mov	r9, r0
	movt	r3, #:upper16:__kmalloc
	mov	r0, r5, asl #2
	mov	r1, #208
	blx	r3
	subs	r8, r0, #0
	beq	.L340
	cmp	r5, #0
	movne	r5, r5, asl #3
	movne	r3, r10
	subne	ip, r8, #4
	beq	.L334
.L335:
	ldr	lr, [r4, r3]
	add	r3, r3, #8
	cmp	r3, r5
	str	lr, [ip, #4]!
	bne	.L335
.L334:
	movw	r3, #:lower16:snd_pcm_lib_writev
	mov	r0, r7
	mov	r2, r9
	movt	r3, #:upper16:snd_pcm_lib_writev
	mov	r1, r8
	blx	r3
	subs	r4, r0, #0
	ldrgt	r0, [r6, #80]
	mulgt	r4, r0, r4
	movgt	r4, r4, lsr #3
.L333:
	movw	r3, #:lower16:kfree
	mov	r0, r8
	movt	r3, #:upper16:kfree
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L328:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:.LC1
	movw	r3, #:lower16:.LC2
	movw	ip, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:.LC2
	movt	ip, #:upper16:warn_slowpath_fmt
	movw	r1, #2890
	blx	ip
	mvn	r0, #5
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L339:
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L352:
	mvn	r0, #76
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L340:
	mvn	r0, #11
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
	.fnend
	.size	snd_pcm_aio_write, .-snd_pcm_aio_write
	.align	2
	.type	snd_pcm_sync_ptr, %function
snd_pcm_sync_ptr:
	.fnstart
	@ args = 0, pretend = 0, frame = 136
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	movw	r4, #:lower16:__stack_chk_guard
	movt	r4, #:upper16:__stack_chk_guard
	.pad #140
	sub	sp, sp, #140
	movw	r6, #:lower16:__memzero
	mov	r7, r0
	ldr	r3, [r4]
	mov	r5, r1
	mov	r0, sp
	movt	r6, #:upper16:__memzero
	mov	r1, #132
	ldr	r9, [r7, #116]
	str	r3, [sp, #132]
	blx	r6
	mov	r2, sp
	mov	r0, r5
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
@ 2466 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__get_user_4
@ 0 "" 2
	subs	r8, r0, #0
	str	r2, [sp]
	bne	.L370
	mov	r2, sp
	add	r1, r5, #68
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
@ 439 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r1, #8; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	bne	.L356
	movw	r3, #:lower16:__copy_from_user
	add	r0, sp, #68
	movt	r3, #:upper16:__copy_from_user
	mov	r2, #8
	blx	r3
	cmp	r0, #0
	bne	.L370
	ldr	r3, [sp]
	ldr	r6, [r9, #156]
	ldr	r9, [r9, #160]
	tst	r3, #1
	beq	.L362
	mov	r0, r7
	bl	snd_pcm_hwsync
	cmp	r0, #0
	blt	.L371
.L362:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_lock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_lock_irq
	blx	r3
	add	r7, r7, #140
	movw	r3, #:lower16:_raw_spin_lock
	movt	r3, #:upper16:_raw_spin_lock
	mov	r0, r7
	blx	r3
	ldr	r3, [sp]
	tst	r3, #2
	bne	.L372
	ldr	r3, [sp, #68]
	str	r3, [r9]
	ldr	r3, [sp]
.L363:
	tst	r3, #4
	add	r1, r6, #12
	ldrne	r3, [r9, #4]
	add	r2, sp, #16
	ldreq	r3, [sp, #72]
	strne	r3, [sp, #72]
	streq	r3, [r9, #4]
	movw	r3, #:lower16:_raw_spin_unlock
	ldr	ip, [r6]
	movt	r3, #:upper16:_raw_spin_unlock
	ldr	r0, [r6, #8]
	str	ip, [sp, #4]
	str	r0, [sp, #12]
	ldmia	r1, {r0, r1}
	stmia	r2, {r0, r1}
	mov	r0, r7
	ldr	r2, [r6, #20]
	str	r2, [sp, #24]
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock_irq
	movt	r3, #:upper16:_raw_read_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
@ 448 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r5, #132; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	bne	.L370
	movw	r3, #:lower16:__copy_to_user
	mov	r0, r5
	mov	r1, sp
	movt	r3, #:upper16:__copy_to_user
	mov	r2, #132
	blx	r3
	cmp	r0, #0
	beq	.L355
.L370:
	mvn	r8, #13
.L355:
	ldr	r2, [sp, #132]
	mov	r0, r8
	ldr	r3, [r4]
	cmp	r2, r3
	bne	.L373
	add	sp, sp, #140
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L356:
	add	r0, sp, #68
	mov	r1, #8
	blx	r6
	b	.L370
.L372:
	ldr	r2, [r9]
	str	r2, [sp, #68]
	b	.L363
.L371:
	mov	r8, r0
	b	.L355
.L373:
	movw	r3, #:lower16:__stack_chk_fail
	movt	r3, #:upper16:__stack_chk_fail
	blx	r3
	.fnend
	.size	snd_pcm_sync_ptr, .-snd_pcm_sync_ptr
	.align	2
	.type	snd_pcm_sw_params_user, %function
snd_pcm_sw_params_user:
	.fnstart
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #124
	sub	sp, sp, #124
	mov	r2, sp
	movw	r7, #:lower16:__stack_chk_guard
	bic	r3, r2, #8128
	movt	r7, #:upper16:__stack_chk_guard
	bic	r3, r3, #63
	ldr	r2, [r7]
	ldr	r3, [r3, #8]
	mov	r6, r0
@ 439 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r0, r1, #104; sbcccs r0, r0, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	str	r1, [sp, #4]
	str	r2, [sp, #116]
	bne	.L375
	movw	r3, #:lower16:__copy_from_user
	add	r0, sp, #12
	movt	r3, #:upper16:__copy_from_user
	mov	r2, #104
	blx	r3
	cmp	r0, #0
	bne	.L413
	cmp	r6, #0
	beq	.L378
	ldr	r4, [r6, #116]
	cmp	r4, #0
	beq	.L378
	movw	r0, #:lower16:.LANCHOR0
	movw	r9, #:lower16:_raw_read_lock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r9, #:upper16:_raw_read_lock_irq
	add	fp, r6, #140
	movw	r8, #:lower16:_raw_spin_lock
	blx	r9
	movt	r8, #:upper16:_raw_spin_lock
	mov	r0, fp
	blx	r8
	ldr	r3, [r4, #156]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L414
	movw	r5, #:lower16:_raw_spin_unlock
	mov	r0, fp
	movt	r5, #:upper16:_raw_spin_unlock
	movw	r10, #:lower16:_raw_read_unlock_irq
	blx	r5
	movw	r0, #:lower16:.LANCHOR0
	movt	r10, #:upper16:_raw_read_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	blx	r10
	ldr	r2, [sp, #12]
	cmp	r2, #1
	bgt	.L395
	ldr	r2, [sp, #24]
	cmp	r2, #0
	beq	.L395
	ldr	r2, [sp, #44]
	ldr	r1, [r4, #128]
	cmp	r2, r1
	bcs	.L415
	ldr	r1, [sp, #40]
	cmp	r2, r1
	bhi	.L395
	ldr	r2, [r4, #68]
	cmp	r1, r2
	bhi	.L395
.L382:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	blx	r9
	mov	r0, fp
	blx	r8
	ldr	r2, [r4, #160]
	ldr	r0, [sp, #16]
	ldr	ip, [sp, #12]
	ldr	r1, [sp, #24]
	str	r0, [r4, #108]
	str	ip, [r4, #104]
	str	r1, [r2, #4]
	ldr	r0, [sp, #36]
	ldr	r2, [sp, #40]
	ldr	ip, [sp, #32]
	ldr	r1, [sp, #44]
	str	r0, [r4, #116]
	str	ip, [r4, #112]
	str	r2, [r4, #120]
	str	r1, [r4, #124]
	ldr	r2, [r6, #116]
	ldr	r0, [r4, #128]
	ldr	r2, [r2, #156]
	str	r0, [sp, #48]
	ldr	r2, [r2]
	cmp	r2, #3
	beq	.L383
	cmp	r2, #5
	beq	.L416
.L397:
	mov	r4, #0
.L384:
	mov	r0, fp
	blx	r5
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	blx	r10
.L380:
	mov	ip, sp
	bic	r3, ip, #8128
	ldr	ip, [sp, #4]
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
@ 448 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, ip, #104; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	bne	.L413
	movw	r3, #:lower16:__copy_to_user
	mov	r0, ip
	add	r1, sp, #12
	movt	r3, #:upper16:__copy_to_user
	mov	r2, #104
	blx	r3
	cmp	r0, #0
	beq	.L377
.L413:
	mvn	r4, #13
.L377:
	ldr	r2, [sp, #116]
	mov	r0, r4
	ldr	r3, [r7]
	cmp	r2, r3
	bne	.L417
	add	sp, sp, #124
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L375:
	movw	r3, #:lower16:__memzero
	add	r0, sp, #12
	movt	r3, #:upper16:__memzero
	mov	r1, #104
	blx	r3
	b	.L413
.L415:
	ldr	r2, [sp, #40]
	cmp	r2, #0
	beq	.L382
.L395:
	mvn	r4, #21
	b	.L380
.L378:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:.LC1
	movw	r3, #:lower16:.LC2
	movw	ip, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:.LC2
	movt	ip, #:upper16:warn_slowpath_fmt
	movw	r1, #525
	mvn	r4, #5
	blx	ip
	b	.L380
.L383:
	ldr	r2, [r6, #48]
	cmp	r2, #0
	beq	.L389
.L385:
	movw	r2, #:lower16:snd_pcm_update_state
	mov	r1, r4
	mov	r0, r6
	movt	r2, #:upper16:snd_pcm_update_state
	blx	r2
	mov	r4, r0
	b	.L384
.L416:
	ldr	r2, [r6, #48]
	cmp	r2, #0
	bne	.L397
.L389:
	cmp	r1, #0
	beq	.L385
	movw	r2, #:lower16:snd_pcm_playback_silence
	mov	r0, r6
	movt	r2, #:upper16:snd_pcm_playback_silence
	mvn	r1, #0
	blx	r2
	b	.L385
.L414:
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, fp
	movt	r3, #:upper16:_raw_spin_unlock
	mvn	r4, #76
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_unlock_irq
	blx	r3
	b	.L380
.L417:
	movw	r3, #:lower16:__stack_chk_fail
	movt	r3, #:upper16:__stack_chk_fail
	blx	r3
	.fnend
	.size	snd_pcm_sw_params_user, .-snd_pcm_sw_params_user
	.align	2
	.type	snd_pcm_unlink, %function
snd_pcm_unlink:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:down_write
	mov	r4, r0
	movt	r3, #:upper16:down_write
	add	r5, r4, #140
	ldr	r0, .L424
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_write_lock_irq
	movt	r3, #:upper16:_raw_write_lock_irq
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldr	r3, [r4, #160]
	cmp	r3, r5
	beq	.L422
	ldr	r3, [r4, #136]
	mov	r0, #256
	ldr	r2, [r4, #132]
	mov	r1, #512
	str	r3, [r2, #4]
	str	r2, [r3]
	ldr	r3, [r4, #160]
	str	r0, [r4, #132]
	str	r1, [r4, #136]
	ldr	r2, [r3, #16]
	sub	r2, r2, #1
	str	r2, [r3, #16]
	ldr	r0, [r4, #160]
	ldr	r3, [r0, #16]
	cmp	r3, #1
	beq	.L423
.L420:
	str	r5, [r4, #160]
	mov	r5, #0
	add	r2, r4, #148
	add	r3, r4, #132
	str	r2, [r4, #132]
	str	r2, [r4, #136]
	str	r3, [r4, #152]
	str	r3, [r4, #148]
.L419:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_write_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_write_unlock_irq
	blx	r3
	movw	r3, #:lower16:up_write
	ldr	r0, .L424
	movt	r3, #:upper16:up_write
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, pc}
.L423:
	mov	r2, r0
	ldr	r3, [r2, #8]!
	cmp	r3, r2
	beq	.L421
	add	r2, r3, #16
	add	r1, r3, #8
	str	r3, [r3, #20]
	str	r3, [r3, #16]
	str	r1, [r3, #28]
	str	r2, [r3]
	str	r2, [r3, #4]
	ldr	r0, [r4, #160]
.L421:
	movw	r3, #:lower16:kfree
	movt	r3, #:upper16:kfree
	blx	r3
	b	.L420
.L422:
	mvn	r5, #113
	b	.L419
.L425:
	.align	2
.L424:
	.word	.LANCHOR1+52
	.fnend
	.size	snd_pcm_unlink, .-snd_pcm_unlink
	.align	2
	.type	pcm_release_private, %function
pcm_release_private:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	snd_pcm_unlink
	.fnend
	.size	pcm_release_private, .-pcm_release_private
	.align	2
	.type	snd_pcm_read, %function
snd_pcm_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r7, r1
	ldr	r3, [r0, #124]
	mov	r6, r2
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L428
	ldr	r4, [r5, #116]
	cmp	r4, #0
	beq	.L428
	ldr	r3, [r4, #156]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L444
	movw	r3, #:lower16:__aeabi_uidivmod
	mov	r0, r6
	movt	r3, #:upper16:__aeabi_uidivmod
	ldr	r1, [r4, #76]
	blx	r3
	cmp	r1, #0
	bne	.L432
	movw	r3, #:lower16:__aeabi_uidiv
	ldr	r1, [r4, #80]
	mov	r0, r6, asl #3
	movt	r3, #:upper16:__aeabi_uidiv
	blx	r3
	movw	r3, #:lower16:snd_pcm_lib_read
	mov	r2, r0
	movt	r3, #:upper16:snd_pcm_lib_read
	mov	r0, r5
	mov	r1, r7
	blx	r3
	cmp	r0, #0
	ldrgt	r3, [r4, #80]
	mulgt	r0, r3, r0
	movgt	r0, r0, lsr #3
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L428:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:.LC1
	movw	r3, #:lower16:.LC2
	movw	ip, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:.LC2
	movt	ip, #:upper16:warn_slowpath_fmt
	movw	r1, #2803
	blx	ip
	mvn	r0, #5
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L432:
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L444:
	mvn	r0, #76
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	snd_pcm_read, .-snd_pcm_read
	.align	2
	.type	snd_pcm_aio_read, %function
snd_pcm_aio_read:
	.fnstart
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, r1
	ldr	r3, [r0, #20]
	ldr	r3, [r3, #124]
	ldr	r7, [r3]
	cmp	r7, #0
	beq	.L446
	ldr	r6, [r7, #116]
	cmp	r6, #0
	beq	.L446
	ldr	r3, [r6, #156]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L470
	cmp	r2, #1024
	bhi	.L457
	ldr	r5, [r6, #56]
	cmp	r5, r2
	bne	.L457
	ldr	r8, [r4, #4]
	movw	r3, #:lower16:__aeabi_uidivmod
	movt	r3, #:upper16:__aeabi_uidivmod
	ldr	r1, [r6, #76]
	mov	r0, r8
	blx	r3
	subs	r10, r1, #0
	bne	.L457
	movw	r3, #:lower16:__aeabi_uidiv
	ldr	r1, [r6, #84]
	mov	r0, r8, asl #3
	movt	r3, #:upper16:__aeabi_uidiv
	blx	r3
	movw	r3, #:lower16:__kmalloc
	mov	r9, r0
	movt	r3, #:upper16:__kmalloc
	mov	r0, r5, asl #2
	mov	r1, #208
	blx	r3
	subs	r8, r0, #0
	beq	.L458
	cmp	r5, #0
	movne	r5, r5, asl #3
	movne	r3, r10
	subne	ip, r8, #4
	beq	.L452
.L453:
	ldr	lr, [r4, r3]
	add	r3, r3, #8
	cmp	r3, r5
	str	lr, [ip, #4]!
	bne	.L453
.L452:
	movw	r3, #:lower16:snd_pcm_lib_readv
	mov	r0, r7
	mov	r2, r9
	movt	r3, #:upper16:snd_pcm_lib_readv
	mov	r1, r8
	blx	r3
	subs	r4, r0, #0
	ldrgt	r0, [r6, #80]
	mulgt	r4, r0, r4
	movgt	r4, r4, lsr #3
.L451:
	movw	r3, #:lower16:kfree
	mov	r0, r8
	movt	r3, #:upper16:kfree
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L446:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:.LC1
	movw	r3, #:lower16:.LC2
	movw	ip, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:.LC2
	movt	ip, #:upper16:warn_slowpath_fmt
	movw	r1, #2855
	blx	ip
	mvn	r0, #5
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L457:
	mvn	r0, #21
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L470:
	mvn	r0, #76
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L458:
	mvn	r0, #11
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
	.fnend
	.size	snd_pcm_aio_read, .-snd_pcm_aio_read
	.align	2
	.global	snd_pcm_mmap_data
	.type	snd_pcm_mmap_data, %function
snd_pcm_mmap_data:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	.save {r4, r5, lr}
	mov	r4, r0
	ldr	r3, [r0, #48]
	.pad #12
	sub	sp, sp, #12
	ldr	r1, [r2, #24]
	cmp	r3, #0
	bne	.L472
	tst	r1, #3
	beq	.L485
.L474:
	ldr	r3, [r4, #116]
	ldr	r0, [r3, #156]
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L481
	ldr	r0, [r3, #88]
	tst	r0, #1
	beq	.L482
	ldr	r0, [r3, #40]
	sub	r0, r0, #3
	cmp	r0, #1
	bls	.L485
	ldr	r3, [r3, #556]
	ldr	r5, [r2, #8]
	ldr	ip, [r2, #4]
	add	r3, r3, #4080
	ldr	r0, [r2, #72]
	add	r3, r3, #15
	bic	r3, r3, #4080
	rsb	ip, ip, r5
	bic	r3, r3, #15
	cmp	ip, r3
	mov	r0, r0, asl #12
	bhi	.L485
	rsb	r3, ip, r3
	cmp	r0, r3
	bhi	.L485
	movw	r3, #:lower16:.LANCHOR2
	str	r4, [r2, #80]
	movt	r3, #:upper16:.LANCHOR2
	str	r3, [r2, #68]
	ldr	r3, [r4, #112]
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L475
	mov	r1, r2
	mov	r0, r4
	blx	r3
.L476:
	cmp	r0, #0
	bne	.L473
.L487:
	add	r3, r4, #172
@ 44 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	mov	r0, #0
.L473:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
.L472:
	tst	r1, #1
	bne	.L474
.L485:
	mvn	r0, #21
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
.L475:
	orr	r1, r1, #524288
	str	r1, [r2, #24]
	ldr	r3, [r4, #112]
	ldr	r3, [r3, #40]
	cmp	r3, #0
	beq	.L488
.L477:
	ldr	r3, .L489
	str	r3, [r2, #68]
	b	.L487
.L481:
	mvn	r0, #76
	b	.L473
.L482:
	mvn	r0, #5
	b	.L473
.L488:
	ldr	r3, [r4, #80]
	cmp	r3, #2
	bne	.L477
	ldr	r3, [r4, #116]
	movw	r5, #:lower16:dma_mmap_coherent
	ldr	r0, [r4, #84]
	mov	r1, r2
	movt	r5, #:upper16:dma_mmap_coherent
	ldr	r2, [r3, #548]
	ldr	r3, [r3, #552]
	str	ip, [sp]
	blx	r5
	b	.L476
.L490:
	.align	2
.L489:
	.word	.LANCHOR2+20
	.fnend
	.size	snd_pcm_mmap_data, .-snd_pcm_mmap_data
	.align	2
	.type	snd_pcm_mmap, %function
snd_pcm_mmap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r3, [r0, #124]
	mov	r2, r1
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L492
	ldr	r1, [r0, #116]
	cmp	r1, #0
	beq	.L492
	ldr	ip, [r2, #72]
	mov	ip, ip, asl #12
	cmp	ip, #-2147483648
	beq	.L505
	cmp	ip, #-2130706432
	beq	.L505
	mov	r1, r4
	ldmfd	sp!, {r4, lr}
	b	snd_pcm_mmap_data
.L492:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:.LC1
	movw	r3, #:lower16:.LC2
	movw	ip, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:.LC2
	movt	ip, #:upper16:warn_slowpath_fmt
	movw	r1, #3257
	blx	ip
.L505:
	mvn	r0, #5
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	snd_pcm_mmap, .-snd_pcm_mmap
	.align	2
	.type	snd_pcm_mmap_data_fault, %function
snd_pcm_mmap_data_fault:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r1
	ldr	r0, [r0, #80]
	cmp	r0, #0
	beq	.L515
	ldr	r2, [r0, #116]
	ldr	r1, [r1, #4]
	ldr	r3, [r2, #556]
	mov	r1, r1, asl #12
	add	r3, r3, #4080
	add	r3, r3, #15
	bic	r3, r3, #4080
	bic	r3, r3, #15
	sub	r3, r3, #4096
	cmp	r1, r3
	bls	.L527
.L515:
	mov	r0, #2
	ldmfd	sp!, {r3, r4, r5, pc}
.L527:
	ldr	r3, [r0, #112]
	ldr	r3, [r3, #40]
	cmp	r3, #0
	beq	.L516
	blx	r3
	mov	r5, r0
.L517:
	cmp	r5, #0
	beq	.L515
	ldr	r3, [r5]
	tst	r3, #32768
	bne	.L518
.L520:
	mov	r3, r5
	ldr	r2, [r3, #16]!
@ 44 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
.L519:
	mov	r0, #0
	str	r5, [r4, #12]
	ldmfd	sp!, {r3, r4, r5, pc}
.L516:
	movw	r0, #:lower16:__pv_phys_offset
	ldr	ip, [r2, #548]
	movt	r0, #:upper16:__pv_phys_offset
	movw	r3, #:lower16:mem_map
	ldr	r2, [r0]
	movt	r3, #:upper16:mem_map
	add	r1, ip, r1
	ldr	r3, [r3]
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r1, r1, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	mov	r2, r2, lsr #12
	rsb	r1, r2, r1, lsr #12
	add	r1, r1, r1, asl #3
	add	r5, r3, r1, asl #2
	b	.L517
.L518:
	movw	r3, #:lower16:__get_page_tail
	mov	r0, r5
	movt	r3, #:upper16:__get_page_tail
	blx	r3
	cmp	r0, #0
	bne	.L519
	b	.L520
	.fnend
	.size	snd_pcm_mmap_data_fault, .-snd_pcm_mmap_data_fault
	.align	2
	.type	snd_pcm_fasync, %function
snd_pcm_fasync:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	ldr	r3, [r1, #124]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L529
	ldr	r3, [r3, #116]
	cmp	r3, #0
	beq	.L529
	movw	ip, #:lower16:fasync_helper
	add	r3, r3, #200
	movt	ip, #:upper16:fasync_helper
	blx	ip
	ldmfd	sp!, {r3, pc}
.L529:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:.LC1
	movw	r3, #:lower16:.LC2
	movw	ip, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:.LC2
	movt	ip, #:upper16:warn_slowpath_fmt
	movw	r1, #3284
	blx	ip
	mvn	r0, #5
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	snd_pcm_fasync, .-snd_pcm_fasync
	.align	2
	.type	snd_pcm_action_single, %function
snd_pcm_action_single:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r4, r0
	ldr	r3, [r0]
	mov	r5, r1
	mov	r0, r1
	mov	r1, r2
	mov	r6, r2
	blx	r3
	cmp	r0, #0
	ldmltfd	sp!, {r3, r4, r5, r6, r7, pc}
	ldr	r3, [r4, #4]
	mov	r0, r5
	mov	r1, r6
	blx	r3
	subs	r7, r0, #0
	beq	.L548
	ldr	r3, [r4, #8]
	cmp	r3, #0
	beq	.L543
	mov	r0, r5
	mov	r1, r6
	blx	r3
.L543:
	mov	r0, r7
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L548:
	mov	r0, r5
	ldr	r3, [r4, #12]
	mov	r1, r6
	blx	r3
	mov	r0, r7
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	snd_pcm_action_single, .-snd_pcm_action_single
	.align	2
	.type	snd_pcm_action, %function
snd_pcm_action:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	add	r6, r1, #140
	ldr	ip, [r1, #160]
	mov	r4, r1
	mov	r8, r0
	mov	r7, r2
	cmp	ip, r6
	beq	.L550
	movw	r3, #:lower16:_raw_spin_trylock
	mov	r0, ip
	movt	r3, #:upper16:_raw_spin_trylock
	movw	r5, #:lower16:_raw_spin_unlock
	blx	r3
	cmp	r0, #0
	movtne	r5, #:upper16:_raw_spin_unlock
	bne	.L551
	mov	r0, r6
	movt	r5, #:upper16:_raw_spin_unlock
	movw	r9, #:lower16:_raw_spin_lock
	blx	r5
	movt	r9, #:upper16:_raw_spin_lock
	ldr	r0, [r4, #160]
	blx	r9
	mov	r0, r6
	blx	r9
.L551:
	mov	r2, r7
	mov	r1, r4
	mov	r3, #1
	mov	r0, r8
	bl	snd_pcm_action_group
	mov	r6, r0
	ldr	r0, [r4, #160]
	blx	r5
	mov	r0, r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L550:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	b	snd_pcm_action_single
	.fnend
	.size	snd_pcm_action, .-snd_pcm_action
	.align	2
	.global	snd_pcm_stop
	.type	snd_pcm_stop, %function
snd_pcm_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, r1
	mov	r1, r0
	ldr	r0, .L557
	b	snd_pcm_action
.L558:
	.align	2
.L557:
	.word	.LANCHOR1+72
	.fnend
	.size	snd_pcm_stop, .-snd_pcm_stop
	.align	2
	.global	snd_pcm_suspend
	.type	snd_pcm_suspend, %function
snd_pcm_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	subs	r4, r0, #0
	beq	.L561
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_lock_irqsave
	movt	r3, #:upper16:_raw_read_lock_irqsave
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	add	r5, r4, #140
	movw	r3, #:lower16:_raw_spin_lock
	mov	r6, r0
	movt	r3, #:upper16:_raw_spin_lock
	mov	r0, r5
	blx	r3
	mov	r1, r4
	mov	r2, #0
	ldr	r0, .L562
	bl	snd_pcm_action
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r4, r0
	movt	r3, #:upper16:_raw_spin_unlock
	mov	r0, r5
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock_irqrestore
	mov	r1, r6
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_unlock_irqrestore
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, pc}
.L561:
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, pc}
.L563:
	.align	2
.L562:
	.word	.LANCHOR1+88
	.fnend
	.size	snd_pcm_suspend, .-snd_pcm_suspend
	.align	2
	.global	snd_pcm_suspend_all
	.type	snd_pcm_suspend_all, %function
snd_pcm_suspend_all:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movne	r5, r0
	movne	r6, #2
	beq	.L569
.L575:
	ldr	r4, [r5, #184]
	cmp	r4, #0
	beq	.L572
.L574:
	ldr	r3, [r4, #116]
	mov	r0, r4
	cmp	r3, #0
	beq	.L573
	bl	snd_pcm_suspend
	adds	r3, r0, #16
	movne	r3, #1
	ands	r3, r3, r0, lsr #31
	bne	.L577
.L573:
	ldr	r4, [r4, #128]
	cmp	r4, #0
	bne	.L574
.L572:
	subs	r6, r6, #1
	add	r5, r5, #20
	bne	.L575
.L569:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L577:
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	snd_pcm_suspend_all, .-snd_pcm_suspend_all
	.align	2
	.type	snd_pcm_drop, %function
snd_pcm_drop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	subs	r4, r0, #0
	beq	.L579
	ldr	r5, [r4, #116]
	cmp	r5, #0
	beq	.L579
	ldr	r3, [r5, #156]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L585
	sub	r3, r3, #7
	cmp	r3, #1
	bls	.L585
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_lock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_lock_irq
	blx	r3
	add	r6, r4, #140
	movw	r3, #:lower16:_raw_spin_lock
	movt	r3, #:upper16:_raw_spin_lock
	mov	r0, r6
	blx	r3
	ldr	r3, [r5, #156]
	ldr	r3, [r3]
	cmp	r3, #6
	beq	.L595
.L582:
	mov	r1, r4
	mov	r2, #1
	ldr	r0, .L596
	bl	snd_pcm_action
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r6
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_unlock_irq
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L579:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:.LC1
	movw	r3, #:lower16:.LC2
	movw	ip, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:.LC2
	movt	ip, #:upper16:warn_slowpath_fmt
	mov	r1, #1536
	blx	ip
	mvn	r0, #5
	ldmfd	sp!, {r4, r5, r6, pc}
.L595:
	mov	r1, r4
	mov	r2, #0
	ldr	r0, .L596+4
	bl	snd_pcm_action
	b	.L582
.L585:
	mvn	r0, #76
	ldmfd	sp!, {r4, r5, r6, pc}
.L597:
	.align	2
.L596:
	.word	.LANCHOR1+72
	.word	.LANCHOR1+104
	.fnend
	.size	snd_pcm_drop, .-snd_pcm_drop
	.align	2
	.type	snd_pcm_action_lock_irq, %function
snd_pcm_action_lock_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r9, r0
	movw	r3, #:lower16:_raw_read_lock_irq
	movw	r0, #:lower16:.LANCHOR0
	mov	r4, r1
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_lock_irq
	add	r7, r1, #140
	mov	r8, r2
	blx	r3
	ldr	r5, [r4, #160]
	cmp	r5, r7
	beq	.L599
	movw	r6, #:lower16:_raw_spin_lock
	mov	r0, r5
	movt	r6, #:upper16:_raw_spin_lock
	movw	r5, #:lower16:_raw_spin_unlock
	blx	r6
	mov	r0, r7
	movt	r5, #:upper16:_raw_spin_unlock
	blx	r6
	mov	r1, r4
	mov	r2, r8
	mov	r3, #1
	mov	r0, r9
	bl	snd_pcm_action_group
	mov	r6, r0
	mov	r0, r7
	blx	r5
	ldr	r0, [r4, #160]
	blx	r5
.L600:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_unlock_irq
	blx	r3
	mov	r0, r6
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L599:
	movw	r3, #:lower16:_raw_spin_lock
	mov	r0, r5
	movt	r3, #:upper16:_raw_spin_lock
	blx	r3
	mov	r0, r9
	mov	r1, r4
	mov	r2, r8
	bl	snd_pcm_action_single
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r6, r0
	movt	r3, #:upper16:_raw_spin_unlock
	mov	r0, r5
	blx	r3
	b	.L600
	.fnend
	.size	snd_pcm_action_lock_irq, .-snd_pcm_action_lock_irq
	.align	2
	.type	snd_pcm_action_nonatomic, %function
snd_pcm_action_nonatomic:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:down_read
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:down_read
	mov	r4, r1
	mov	r5, r0
	mov	r6, r2
	ldr	r0, .L604
	blx	r3
	ldr	r1, [r4, #160]
	add	r3, r4, #140
	mov	r0, r5
	mov	r2, r6
	cmp	r1, r3
	mov	r1, r4
	beq	.L602
	mov	r3, #0
	bl	snd_pcm_action_group
	mov	r4, r0
.L603:
	movw	r3, #:lower16:up_read
	ldr	r0, .L604
	movt	r3, #:upper16:up_read
	blx	r3
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, pc}
.L602:
	bl	snd_pcm_action_single
	mov	r4, r0
	b	.L603
.L605:
	.align	2
.L604:
	.word	.LANCHOR1+52
	.fnend
	.size	snd_pcm_action_nonatomic, .-snd_pcm_action_nonatomic
	.align	2
	.type	snd_pcm_undo_start, %function
snd_pcm_undo_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	ldr	r2, [r0, #116]
	ldr	r2, [r2]
	cmp	r2, r0
	ldmnefd	sp!, {r3, pc}
	ldr	r3, [r2, #112]
	mov	r1, #0
	ldr	r3, [r3, #24]
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	snd_pcm_undo_start, .-snd_pcm_undo_start
	.align	2
	.type	snd_pcm_do_stop, %function
snd_pcm_do_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	ldr	r3, [r0, #116]
	ldr	r2, [r3]
	cmp	r2, r0
	beq	.L618
.L615:
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
.L618:
	ldr	r3, [r3, #156]
	ldr	r3, [r3]
	cmp	r3, #3
	beq	.L610
	cmp	r3, #5
	bne	.L615
	ldr	r3, [r2, #48]
	cmp	r3, #0
	bne	.L615
.L610:
	ldr	r3, [r2, #112]
	mov	r0, r2
	mov	r1, #0
	ldr	r3, [r3, #24]
	blx	r3
	b	.L615
	.fnend
	.size	snd_pcm_do_stop, .-snd_pcm_do_stop
	.align	2
	.type	snd_pcm_do_drain_init, %function
snd_pcm_do_drain_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r2, [r0, #48]
	ldr	r3, [r0, #116]
	cmp	r2, #0
	ldr	r2, [r3, #156]
	ldr	r1, [r2]
	bne	.L620
	cmp	r1, #2
	beq	.L622
	cmp	r1, #3
	moveq	r3, #5
	streq	r3, [r2]
.L621:
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
.L620:
	cmp	r1, #3
	bne	.L621
	ldr	r1, [r3, #160]
	ldr	r5, [r2, #8]
	ldr	r2, [r1]
	subs	r5, r5, r2
	ldrmi	r3, [r3, #128]
	addmi	r5, r5, r3
	cmp	r5, #0
	moveq	r5, #1
	movne	r5, #5
	mov	r1, r5
	bl	snd_pcm_do_stop
	mov	r0, r4
	mov	r1, r5
	bl	snd_pcm_post_stop
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
.L622:
	ldr	ip, [r3, #160]
	ldr	r0, [r3, #68]
	ldr	r1, [r2, #8]
	ldr	ip, [ip]
	add	r1, r0, r1
	subs	r1, r1, ip
	ldr	ip, [r3, #128]
	addmi	r1, r1, ip
	bmi	.L625
	cmp	r1, ip
	rsbcs	r1, ip, r1
.L625:
	cmp	r0, r1
	movls	r3, #1
	strls	r3, [r2]
	bls	.L621
	ldr	r3, [r3]
	cmp	r4, r3
	beq	.L631
.L627:
	mov	r0, r4
	mov	r1, #5
	bl	snd_pcm_post_start
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, pc}
.L631:
	ldr	r3, [r4, #112]
	mov	r0, r4
	mov	r1, #1
	ldr	r3, [r3, #24]
	blx	r3
	b	.L627
	.fnend
	.size	snd_pcm_do_drain_init, .-snd_pcm_do_drain_init
	.align	2
	.type	snd_pcm_undo_pause, %function
snd_pcm_undo_pause:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	ldr	r2, [r0, #116]
	ldr	r2, [r2]
	cmp	r2, r0
	ldmnefd	sp!, {r3, pc}
	ldr	r3, [r2, #112]
	cmp	r1, #0
	moveq	r1, #3
	movne	r1, #4
	ldr	r3, [r3, #24]
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	snd_pcm_undo_pause, .-snd_pcm_undo_pause
	.align	2
	.type	snd_pcm_do_suspend, %function
snd_pcm_do_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	ldr	r3, [r0, #116]
	ldr	r2, [r3]
	cmp	r2, r0
	beq	.L646
.L643:
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
.L646:
	ldr	r3, [r3, #156]
	ldr	r3, [r3]
	cmp	r3, #3
	beq	.L638
	cmp	r3, #5
	bne	.L643
	ldr	r3, [r2, #48]
	cmp	r3, #0
	bne	.L643
.L638:
	ldr	r3, [r2, #112]
	mov	r0, r2
	mov	r1, #5
	ldr	r3, [r3, #24]
	blx	r3
	b	.L643
	.fnend
	.size	snd_pcm_do_suspend, .-snd_pcm_do_suspend
	.align	2
	.type	snd_pcm_do_resume, %function
snd_pcm_do_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	ldr	r3, [r0, #116]
	ldr	r2, [r3]
	cmp	r2, r0
	beq	.L656
.L652:
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
.L656:
	ldr	r3, [r3, #156]
	ldr	r3, [r3, #20]
	cmp	r3, #3
	beq	.L649
	cmp	r3, #5
	bne	.L652
	ldr	r3, [r2, #48]
	cmp	r3, #0
	bne	.L652
.L649:
	ldr	r3, [r2, #112]
	mov	r0, r2
	mov	r1, #6
	ldr	r3, [r3, #24]
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	snd_pcm_do_resume, .-snd_pcm_do_resume
	.align	2
	.type	snd_pcm_undo_resume, %function
snd_pcm_undo_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	ldr	r3, [r0, #116]
	ldr	r2, [r3]
	cmp	r2, r0
	ldmnefd	sp!, {r3, pc}
	ldr	r3, [r3, #156]
	ldr	r3, [r3]
	cmp	r3, #3
	beq	.L659
	cmp	r3, #5
	ldmnefd	sp!, {r3, pc}
	ldr	r3, [r2, #48]
	cmp	r3, #0
	ldmnefd	sp!, {r3, pc}
.L659:
	ldr	r3, [r2, #112]
	mov	r0, r2
	mov	r1, #5
	ldr	r3, [r3, #24]
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	snd_pcm_undo_resume, .-snd_pcm_undo_resume
	.align	2
	.type	snd_pcm_do_prepare, %function
snd_pcm_do_prepare:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r3, [r0, #112]
	ldr	r3, [r3, #20]
	blx	r3
	cmp	r0, #0
	ldmltfd	sp!, {r4, pc}
	mov	r0, r4
	mov	r1, #0
	ldmfd	sp!, {r4, lr}
	b	snd_pcm_do_reset
	.fnend
	.size	snd_pcm_do_prepare, .-snd_pcm_do_prepare
	.align	2
	.type	snd_pcm_do_pause, %function
snd_pcm_do_pause:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	mov	r3, r0
	ldr	r2, [r0, #116]
	ldr	r4, [r2]
	cmp	r4, r0
	beq	.L675
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
.L675:
	cmp	r1, #0
	movweq	r3, #:lower16:jiffies
	moveq	r1, #4
	movteq	r3, #:upper16:jiffies
	bne	.L676
.L674:
	ldr	r3, [r3]
	mov	r0, r4
	sub	r3, r3, #299008
	sub	r3, r3, #992
	str	r3, [r2, #28]
	ldr	r3, [r4, #112]
	ldr	r3, [r3, #24]
	blx	r3
	ldmfd	sp!, {r4, pc}
.L676:
	movw	r3, #:lower16:snd_pcm_update_hw_ptr
	movt	r3, #:upper16:snd_pcm_update_hw_ptr
	blx	r3
	movw	r3, #:lower16:jiffies
	ldr	r2, [r4, #116]
	movt	r3, #:upper16:jiffies
	mov	r1, #3
	b	.L674
	.fnend
	.size	snd_pcm_do_pause, .-snd_pcm_do_pause
	.align	2
	.type	snd_pcm_release_substream.part.10, %function
snd_pcm_release_substream.part.10:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	bl	snd_pcm_drop
	ldrb	r3, [r4, #188]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L678
	ldr	r3, [r4, #112]
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L679
	mov	r0, r4
	blx	r2
	ldr	r3, [r4, #112]
.L679:
	ldr	r3, [r3, #4]
	mov	r0, r4
	blx	r3
	ldrb	r3, [r4, #188]	@ zero_extendqisi2
	bfc	r3, #0, #1
	strb	r3, [r4, #188]
.L678:
	add	r5, r4, #52
	movw	r3, #:lower16:pm_qos_request_active
	mov	r0, r5
	movt	r3, #:upper16:pm_qos_request_active
	blx	r3
	cmp	r0, #0
	bne	.L694
.L680:
	ldr	r3, [r4, #180]
	cmp	r3, #0
	beq	.L681
	mov	r0, r4
	blx	r3
	mov	r3, #0
	str	r3, [r4, #180]
.L681:
	movw	r3, #:lower16:snd_pcm_detach_substream
	mov	r0, r4
	movt	r3, #:upper16:snd_pcm_detach_substream
	blx	r3
	ldmfd	sp!, {r3, r4, r5, pc}
.L694:
	movw	r3, #:lower16:pm_qos_remove_request
	mov	r0, r5
	movt	r3, #:upper16:pm_qos_remove_request
	blx	r3
	b	.L680
	.fnend
	.size	snd_pcm_release_substream.part.10, .-snd_pcm_release_substream.part.10
	.align	2
	.global	snd_pcm_release_substream
	.type	snd_pcm_release_substream, %function
snd_pcm_release_substream:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #168]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r0, #168]
	bxgt	lr
	b	snd_pcm_release_substream.part.10
	.fnend
	.size	snd_pcm_release_substream, .-snd_pcm_release_substream
	.align	2
	.type	snd_pcm_release, %function
snd_pcm_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r6, r1
	ldr	r7, [r1, #124]
	ldr	r4, [r7]
	cmp	r4, #0
	beq	.L704
	ldr	r5, [r4]
	movw	r3, #:lower16:mutex_lock
	movt	r3, #:upper16:mutex_lock
	add	r8, r5, #208
	mov	r0, r8
	blx	r3
	ldr	r3, [r4, #168]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #168]
	ble	.L705
.L700:
	movw	r3, #:lower16:kfree
	mov	r0, r7
	movt	r3, #:upper16:kfree
	blx	r3
	movw	r3, #:lower16:mutex_unlock
	mov	r0, r8
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	movw	ip, #:lower16:__wake_up
	add	r0, r5, #232
	movt	ip, #:upper16:__wake_up
	mov	r1, #3
	mov	r2, #1
	mov	r3, #0
	blx	ip
	ldr	r2, [r5]
	movw	r3, #:lower16:module_put
	movt	r3, #:upper16:module_put
	ldr	r0, [r2, #356]
	blx	r3
	movw	r3, #:lower16:snd_card_file_remove
	ldr	r0, [r5]
	mov	r1, r6
	movt	r3, #:upper16:snd_card_file_remove
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L705:
	mov	r0, r4
	bl	snd_pcm_release_substream.part.10
	b	.L700
.L704:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:.LC1
	movw	r3, #:lower16:.LC3
	movw	ip, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:.LC3
	movt	ip, #:upper16:warn_slowpath_fmt
	movw	r1, #2179
	blx	ip
	mvn	r0, #5
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	snd_pcm_release, .-snd_pcm_release
	.align	2
	.type	snd_pcm_do_start, %function
snd_pcm_do_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	ldr	r2, [r0, #116]
	ldr	r2, [r2]
	cmp	r2, r0
	beq	.L709
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
.L709:
	ldr	r3, [r2, #112]
	mov	r1, #1
	ldr	r3, [r3, #24]
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	snd_pcm_do_start, .-snd_pcm_do_start
	.align	2
	.global	snd_pcm_info
	.type	snd_pcm_info, %function
snd_pcm_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r3, #:lower16:__memzero
	ldr	r6, [r0]
	mov	r4, r1
	mov	r5, r0
	movt	r3, #:upper16:__memzero
	mov	r0, r1
	mov	r1, #288
	ldr	r8, [r5, #4]
	movw	r7, #:lower16:strlcpy
	blx	r3
	ldr	r3, [r6]
	movt	r7, #:upper16:strlcpy
	add	r1, r6, #24
	mov	r2, #64
	add	r0, r4, #16
	ldr	r3, [r3]
	str	r3, [r4, #12]
	ldr	r3, [r6, #12]
	str	r3, [r4]
	ldr	r3, [r5, #48]
	str	r3, [r4, #8]
	ldr	r3, [r5, #12]
	str	r3, [r4, #4]
	blx	r7
	add	r1, r6, #88
	mov	r2, #80
	add	r0, r4, #80
	blx	r7
	ldrh	r3, [r6, #20]
	add	r0, r4, #160
	add	r1, r5, #16
	mov	r2, #32
	str	r3, [r4, #192]
	ldrh	r3, [r6, #22]
	str	r3, [r4, #196]
	ldr	r3, [r8, #8]
	str	r3, [r4, #200]
	ldr	ip, [r8, #8]
	ldr	r3, [r8, #12]
	rsb	r3, r3, ip
	str	r3, [r4, #204]
	blx	r7
	ldr	r3, [r5, #116]
	cmp	r3, #0
	beq	.L711
	add	r3, r3, #140
	add	ip, r4, #208
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	mov	r2, r4
	ldr	r3, [r5, #112]
	mov	r0, r5
	mov	r1, #1
	ldr	r3, [r3, #8]
	blx	r3
.L711:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	snd_pcm_info, .-snd_pcm_info
	.align	2
	.global	snd_pcm_info_user
	.type	snd_pcm_info_user, %function
snd_pcm_info_user:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:kmalloc_caches
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:kmalloc_caches
	mov	r6, r0
	mov	r5, r1
	ldr	r0, [r3, #36]
	cmp	r0, #0
	beq	.L721
	movw	r3, #:lower16:kmem_cache_alloc_trace
	mov	r1, #208
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #288
	blx	r3
	subs	r4, r0, #0
	beq	.L723
.L716:
	mov	r0, r6
	mov	r1, r4
	bl	snd_pcm_info
	subs	r6, r0, #0
	blt	.L718
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
@ 448 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r5, #288; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	beq	.L719
.L720:
	mvn	r6, #13
.L718:
	movw	r3, #:lower16:kfree
	mov	r0, r4
	movt	r3, #:upper16:kfree
	blx	r3
	mov	r0, r6
	ldmfd	sp!, {r4, r5, r6, pc}
.L721:
	mov	r4, #16
	b	.L716
.L719:
	movw	r3, #:lower16:__copy_to_user
	mov	r0, r5
	movt	r3, #:upper16:__copy_to_user
	mov	r1, r4
	mov	r2, #288
	blx	r3
	cmp	r0, #0
	beq	.L718
	b	.L720
.L723:
	mvn	r0, #11
	ldmfd	sp!, {r4, r5, r6, pc}
	.fnend
	.size	snd_pcm_info_user, .-snd_pcm_info_user
	.align	2
	.global	snd_pcm_status
	.type	snd_pcm_status, %function
snd_pcm_status:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r6, r0
	movw	r3, #:lower16:_raw_read_lock_irq
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_lock_irq
	ldr	r4, [r6, #116]
	mov	r5, r1
	add	r7, r6, #140
	blx	r3
	movw	r3, #:lower16:_raw_spin_lock
	mov	r0, r7
	movt	r3, #:upper16:_raw_spin_lock
	blx	r3
	ldr	r3, [r4, #156]
	ldr	r3, [r3]
	str	r3, [r5]
	cmp	r3, #0
	ldr	r3, [r4, #156]
	ldr	r3, [r3, #20]
	str	r3, [r5, #44]
	beq	.L725
	ldmib	r4, {r0, r1}
	stmib	r5, {r0, r1}
	ldr	r3, [r6, #116]
	ldr	r3, [r3, #156]
	ldr	r3, [r3]
	cmp	r3, #3
	beq	.L726
	cmp	r3, #5
	beq	.L749
.L727:
	ldr	r3, [r4, #544]
	add	r0, r5, #12
	cmp	r3, #1
	movweq	r3, #:lower16:ktime_get_ts
	movwne	r3, #:lower16:getnstimeofday
	movteq	r3, #:upper16:ktime_get_ts
	movtne	r3, #:upper16:getnstimeofday
	blx	r3
.L728:
	ldr	r3, [r4, #160]
	ldr	r3, [r3]
	str	r3, [r5, #20]
	ldr	r3, [r4, #156]
	ldr	r3, [r3, #8]
	str	r3, [r5, #24]
	ldr	r3, [r6, #48]
	ldr	r2, [r4, #156]
	cmp	r3, #0
	ldr	r3, [r4, #160]
	bne	.L730
	ldr	r1, [r4, #68]
	ldr	r2, [r2, #8]
	ldr	r3, [r3]
	add	r2, r1, r2
	subs	r2, r2, r3
	ldr	r3, [r4, #128]
	addmi	r2, r2, r3
	bmi	.L732
	cmp	r2, r3
	rsbcs	r2, r3, r2
.L732:
	str	r2, [r5, #32]
	ldr	r3, [r4, #156]
	ldr	r3, [r3]
	cmp	r3, #3
	cmpne	r3, #5
	movne	r3, #0
	moveq	r3, #1
	beq	.L750
.L748:
	str	r3, [r5, #28]
.L734:
	ldr	r2, [r4, #16]
	mov	r3, #0
	str	r2, [r5, #36]
	ldr	r2, [r4, #12]
	str	r2, [r5, #40]
	str	r3, [r4, #16]
	str	r3, [r4, #12]
.L725:
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r7
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_unlock_irq
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L749:
	ldr	r3, [r6, #48]
	cmp	r3, #0
	bne	.L727
.L726:
	movw	r3, #:lower16:snd_pcm_update_hw_ptr
	mov	r0, r6
	movt	r3, #:upper16:snd_pcm_update_hw_ptr
	blx	r3
	ldr	r3, [r4, #104]
	cmp	r3, #1
	bne	.L727
	ldr	r2, [r4, #156]
	add	r3, r5, #12
	add	r2, r2, #12
	ldmia	r2, {r0, r1}
	stmia	r3, {r0, r1}
	b	.L728
.L730:
	ldr	r2, [r2, #8]
	ldr	r3, [r3]
	subs	r3, r2, r3
	ldrmi	r2, [r4, #128]
	addmi	r3, r3, r2
	str	r3, [r5, #32]
	ldr	r2, [r4, #156]
	ldr	r2, [r2]
	cmp	r2, #3
	movne	r3, #0
	bne	.L748
	ldr	r2, [r4, #36]
	add	r3, r3, r2
	str	r3, [r5, #28]
	b	.L734
.L750:
	ldr	r3, [r4, #68]
	rsb	r2, r2, r3
	str	r2, [r5, #28]
	ldr	r3, [r4, #36]
	add	r2, r2, r3
	str	r2, [r5, #28]
	b	.L734
	.fnend
	.size	snd_pcm_status, .-snd_pcm_status
	.align	2
	.type	snd_pcm_status_user, %function
snd_pcm_status_user:
	.fnstart
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:__stack_chk_guard
	movt	r4, #:upper16:__stack_chk_guard
	.pad #112
	sub	sp, sp, #112
	movw	r3, #:lower16:__memzero
	mov	r6, r0
	ldr	r2, [r4]
	mov	r0, sp
	movt	r3, #:upper16:__memzero
	mov	r5, r1
	mov	r1, #108
	str	r2, [sp, #108]
	blx	r3
	mov	r0, r6
	mov	r1, sp
	bl	snd_pcm_status
	cmp	r0, #0
	blt	.L752
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
@ 448 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r5, #108; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	beq	.L753
.L754:
	mvn	r0, #13
.L752:
	ldr	r2, [sp, #108]
	ldr	r3, [r4]
	cmp	r2, r3
	bne	.L757
	add	sp, sp, #112
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, pc}
.L753:
	movw	r3, #:lower16:__copy_to_user
	mov	r0, r5
	mov	r1, sp
	movt	r3, #:upper16:__copy_to_user
	mov	r2, #108
	blx	r3
	cmp	r0, #0
	beq	.L752
	b	.L754
.L757:
	movw	r3, #:lower16:__stack_chk_fail
	movt	r3, #:upper16:__stack_chk_fail
	blx	r3
	.fnend
	.size	snd_pcm_status_user, .-snd_pcm_status_user
	.align	2
	.type	snd_pcm_common_ioctl1, %function
snd_pcm_common_ioctl1:
	.fnstart
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #16643
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movt	ip, 16388
	.pad #84
	sub	sp, sp, #84
	cmp	r2, ip
	mov	r7, r0
	mov	r4, r3
	mov	r9, r1
	beq	.L760
	bhi	.L761
	movw	r3, #16707
	cmp	r2, r3
	beq	.L762
	bhi	.L763
	movw	r3, #16704
	cmp	r2, r3
	beq	.L764
	bhi	.L765
	movw	r3, #16658
	cmp	r2, r3
	beq	.L766
	add	r3, r3, #16
	cmp	r2, r3
	bne	.L759
	mov	r0, r1
	bl	snd_pcm_hwsync
	mov	r5, r0
	b	.L924
.L761:
	movw	r3, #16672
	movt	r3, 32876
	cmp	r2, r3
	beq	.L776
	bhi	.L777
	mov	r3, #16640
	movt	r3, 32772
	cmp	r2, r3
	beq	.L778
	bhi	.L779
	movw	r3, #16709
	movt	r3, 16388
	cmp	r2, r3
	beq	.L780
	movw	r3, #16736
	movt	r3, 16388
	cmp	r2, r3
	bne	.L759
	movw	r3, #:lower16:fget
	mov	r0, r4
	movt	r3, #:upper16:fget
	blx	r3
	subs	r4, r0, #0
	beq	.L841
	ldr	r3, [r4, #12]
	ldr	r2, [r3, #32]
	ldrh	r3, [r2]
	and	r3, r3, #61440
	cmp	r3, #8192
	bne	.L953
	movw	r3, #:lower16:snd_major
	ldr	r2, [r2, #48]
	movt	r3, #:upper16:snd_major
	ldr	r3, [r3]
	cmp	r3, r2, lsr #20
	bne	.L953
	ubfx	r6, r2, #0, #20
	movw	r5, #:lower16:snd_lookup_minor_data
	mov	r0, r6
	movt	r5, #:upper16:snd_lookup_minor_data
	mov	r1, #16
	blx	r5
	cmp	r0, #0
	beq	.L959
.L844:
	ldr	r2, [r4, #124]
	movw	r3, #:lower16:down_write
	movt	r3, #:upper16:down_write
	ldr	r0, .L972
	ldr	r6, [r2]
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_write_lock_irq
	movt	r3, #:upper16:_raw_write_lock_irq
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldr	r3, [r9, #116]
	ldr	r3, [r3, #156]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L913
	ldr	r2, [r6, #116]
	ldr	r2, [r2, #156]
	ldr	r2, [r2]
	cmp	r3, r2
	beq	.L960
.L913:
	mvn	r5, #76
.L845:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_write_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_write_unlock_irq
	blx	r3
	movw	r3, #:lower16:up_write
	ldr	r0, .L972
	movt	r3, #:upper16:up_write
	blx	r3
	movw	r3, #:lower16:fput
	mov	r0, r4
	movt	r3, #:upper16:fput
	blx	r3
	b	.L924
.L763:
	movw	r3, #16712
	cmp	r2, r3
	beq	.L770
	bhi	.L771
	movw	r3, #16708
	cmp	r2, r3
	beq	.L772
	add	r3, r3, #3
	cmp	r2, r3
	bne	.L759
	ldr	r2, [r1]
	movw	r3, #:lower16:mutex_lock
	movt	r3, #:upper16:mutex_lock
	ldr	r5, [r2]
	add	r4, r5, #524
	mov	r0, r4
	blx	r3
	movw	r3, #:lower16:snd_power_wait
	mov	r0, r5
	mov	r1, #0
	movt	r3, #:upper16:snd_power_wait
	blx	r3
	subs	r5, r0, #0
	blt	.L958
	mov	r1, r9
	ldr	r0, .L972+4
	mov	r2, #0
	bl	snd_pcm_action_lock_irq
	mov	r5, r0
.L958:
	movw	r3, #:lower16:mutex_unlock
	mov	r0, r4
	movt	r3, #:upper16:mutex_unlock
	blx	r3
	mov	r0, r5
	add	sp, sp, #84
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L777:
	movw	r3, #16675
	movt	r3, 49284
	cmp	r2, r3
	beq	.L784
	bhi	.L785
	movw	r3, #16641
	movt	r3, 33056
	cmp	r2, r3
	beq	.L786
	movw	r3, #16659
	movt	r3, 49256
	cmp	r2, r3
	bne	.L759
	mov	r0, r1
	mov	r1, r4
	bl	snd_pcm_sw_params_user
	mov	r5, r0
	b	.L924
.L779:
	movw	r3, #16673
	movt	r3, 32772
	cmp	r2, r3
	beq	.L782
	movw	r3, #16690
	movt	r3, 32784
	cmp	r2, r3
	bne	.L759
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
@ 439 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r4, #16; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	bne	.L832
	add	r6, sp, #60
	movw	r3, #:lower16:__copy_from_user
	mov	r0, r6
	movt	r3, #:upper16:__copy_from_user
	mov	r1, r4
	mov	r2, #16
	blx	r3
	cmp	r0, #0
	bne	.L956
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_lock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_lock_irq
	ldr	r8, [r9, #116]
	add	r7, r9, #140
	ldr	r5, [sp, #60]
	blx	r3
	movw	r3, #:lower16:_raw_spin_lock
	mov	r0, r7
	movt	r3, #:upper16:_raw_spin_lock
	blx	r3
	ldr	r3, [r8, #156]
	mov	r0, r7
	ldr	r3, [r3]
	cmp	r3, #0
	movw	r3, #:lower16:_raw_spin_unlock
	movt	r3, #:upper16:_raw_spin_unlock
	mvneq	r5, #76
	beq	.L954
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock_irq
	movt	r3, #:upper16:_raw_read_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldr	r3, [r8, #56]
	cmp	r5, r3
	bcs	.L900
	movw	r3, #:lower16:__memzero
	mov	r0, r6
	movt	r3, #:upper16:__memzero
	mov	r1, #16
	blx	r3
	ldr	r3, [r9, #112]
	mov	r0, r9
	str	r5, [sp, #60]
	mov	r1, #2
	mov	r2, r6
	ldr	r3, [r3, #8]
	blx	r3
	subs	r5, r0, #0
	blt	.L924
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
@ 448 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r4, #16; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	beq	.L961
.L956:
	mvn	r5, #13
	b	.L924
.L771:
	movw	r3, #16737
	cmp	r2, r3
	beq	.L774
	movw	r3, #16642
	movt	r3, 16388
	cmp	r2, r3
	moveq	r5, #0
	beq	.L924
.L759:
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:.LC5
	movw	ip, #:lower16:__snd_printk
	str	r2, [sp]
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:.LC5
	movt	ip, #:upper16:__snd_printk
	mov	r0, #1
	movw	r2, #2575
	mvn	r5, #24
	blx	ip
	b	.L924
.L785:
	movw	r3, #16656
	movt	r3, 49756
	cmp	r2, r3
	beq	.L788
	movw	r3, #16657
	movt	r3, 49756
	cmp	r2, r3
	bne	.L759
	movw	r3, #:lower16:memdup_user
	mov	r0, r4
	movt	r3, #:upper16:memdup_user
	mov	r1, #604
	blx	r3
	cmn	r0, #4096
	mov	r7, r0
	movhi	r5, r0
	bhi	.L924
	cmp	r9, #0
	beq	.L799
	ldr	r6, [r9, #116]
	cmp	r6, #0
	beq	.L799
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_lock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_lock_irq
	blx	r3
	add	r5, r9, #140
	movw	r3, #:lower16:_raw_spin_lock
	movt	r3, #:upper16:_raw_spin_lock
	mov	r0, r5
	blx	r3
	ldr	r3, [r6, #156]
	ldr	r3, [r3]
	cmp	r3, #2
	bhi	.L962
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r5
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_unlock_irq
	blx	r3
	ldr	r8, [r9, #172]
	cmp	r8, #0
	bne	.L890
	mvn	r3, #0
	mov	r0, r9
	str	r3, [r7, #512]
	mov	r1, r7
	bl	snd_pcm_hw_refine
	subs	r5, r0, #0
	blt	.L804
	movw	r3, #:lower16:snd_pcm_hw_params_choose
	mov	r0, r9
	movt	r3, #:upper16:snd_pcm_hw_params_choose
	mov	r1, r7
	blx	r3
	subs	r5, r0, #0
	blt	.L804
	ldr	r3, [r9, #112]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L808
	mov	r0, r9
	mov	r1, r7
	blx	r3
	subs	r5, r0, #0
	blt	.L804
.L808:
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L963
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bne	.L964
.L809:
	str	r3, [r6, #40]
	ldr	r3, [r7, #36]
	cmp	r3, #0
	bne	.L810
	ldr	r3, [r7, #40]
	cmp	r3, #0
	moveq	r0, r3
	bne	.L965
.L811:
	str	r0, [r6, #44]
	ldr	r3, [r7, #68]
	cmp	r3, #0
	bne	.L812
	ldr	r3, [r7, #72]
	cmp	r3, #0
	bne	.L966
.L813:
	str	r8, [r6, #48]
	ldr	r3, [r7, #284]
	ldrb	r2, [r6, #100]	@ zero_extendqisi2
	str	r3, [r6, #56]
	ldr	r3, [r7, #296]
	str	r3, [r6, #52]
	ldr	r3, [r7, #320]
	str	r3, [r6, #60]
	ldr	r3, [r7, #344]
	str	r3, [r6, #64]
	ldr	r3, [r7, #368]
	str	r3, [r6, #68]
	ldr	r3, [r7, #520]
	str	r3, [r6, #88]
	ldr	r3, [r7, #528]
	str	r3, [r6, #92]
	ldr	r3, [r7, #532]
	str	r3, [r6, #96]
	ldr	r3, [r7, #520]
	ands	r3, r3, #8388608
	ldrne	r1, [r7]
	moveq	r1, r3
	movw	r3, #:lower16:snd_pcm_format_physical_width
	movt	r3, #:upper16:snd_pcm_format_physical_width
	ubfxne	r1, r1, #2, #1
	bfi	r2, r1, #0, #1
	strb	r2, [r6, #100]
	blx	r3
	ldr	r3, [r6, #56]
	mov	r2, #1
	str	r0, [r6, #84]
	mul	r3, r3, r0
	tst	r3, #7
	str	r3, [r6, #80]
	beq	.L815
.L816:
	mov	r3, r3, asl #1
	mov	r2, r2, asl #1
	tst	r3, #6
	bne	.L816
.L815:
	ldr	r5, [r6, #160]
	mov	r3, r3, lsr #3
	ldr	r8, [r6, #60]
	mov	r0, #0
	mov	lr, #1
	str	r3, [r6, #76]
	str	r2, [r6, #72]
	movw	r1, #65535
	str	r0, [r6, #104]
	movt	r1, 32767
	str	lr, [r6, #108]
	str	r8, [r5, #4]
	ldr	r3, [r6, #68]
	str	lr, [r6, #112]
	str	r0, [r6, #120]
	rsb	r1, r3, r1
	str	r0, [r6, #124]
	mov	r2, r3, asl lr
	str	r3, [r6, #116]
	str	r3, [r6, #128]
	cmp	r2, r1
	bls	.L822
	b	.L821
.L820:
	mov	r2, r3
.L822:
	mov	r3, r2, asl #1
	cmp	r3, r1
	bls	.L820
	str	r2, [r6, #128]
.L821:
	movw	r3, #:lower16:snd_pcm_timer_resolution_change
	mov	r0, r9
	movt	r3, #:upper16:snd_pcm_timer_resolution_change
	add	r8, r9, #52
	blx	r3
	ldr	r2, [r6, #156]
	mov	r1, #1
	movw	r3, #:lower16:pm_qos_request_active
	mov	r0, r8
	movt	r3, #:upper16:pm_qos_request_active
	str	r1, [r2]
	blx	r3
	cmp	r0, #0
	bne	.L967
.L819:
	ldr	r5, [r6, #52]
	cmp	r5, #0
	beq	.L802
	ldr	r9, [r6, #60]
	movw	r3, #:lower16:__aeabi_uidivmod
	movw	r0, #29104
	movt	r3, #:upper16:__aeabi_uidivmod
	mov	r1, r5
	movt	r0, 11
	movw	r6, #:lower16:__aeabi_uidiv
	blx	r3
	movt	r6, #:upper16:__aeabi_uidiv
	mul	r0, r9, r1
	mov	r1, r5
	blx	r6
	mov	r10, r0
	movw	r0, #29104
	mov	r1, r5
	movt	r0, 11
	blx	r6
	mlas	r2, r9, r0, r10
	movmi	r5, #0
	bmi	.L802
	movw	r3, #:lower16:pm_qos_add_request
	mov	r0, r8
	movt	r3, #:upper16:pm_qos_add_request
	mov	r1, #1
	mov	r5, #0
	blx	r3
.L802:
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
@ 448 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r4, #604; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	beq	.L823
.L825:
	cmp	r5, #0
	mvneq	r5, #13
.L824:
	movw	r3, #:lower16:kfree
	mov	r0, r7
	movt	r3, #:upper16:kfree
	blx	r3
	b	.L924
.L765:
	movw	r3, #16705
	cmp	r2, r3
	beq	.L768
	add	r3, r3, #1
	cmp	r2, r3
	bne	.L759
	ldr	r0, .L972+8
	mov	r2, #3
	bl	snd_pcm_action_lock_irq
	mov	r5, r0
.L924:
	mov	r0, r5
	add	sp, sp, #84
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L772:
	ldr	r8, [r1, #116]
	ldr	r2, [r1]
	ldr	r3, [r8, #156]
	ldr	r5, [r2]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L841
	add	r4, r5, #524
	movw	r6, #:lower16:mutex_lock
	mov	r0, r4
	movt	r6, #:upper16:mutex_lock
	blx	r6
	ldr	r3, [r8, #156]
	ldr	r3, [r3]
	cmp	r3, #7
	beq	.L968
.L867:
	movw	fp, #:lower16:down_read
	cmp	r7, #0
	movw	r3, #:lower16:_raw_read_lock_irq
	ldr	r0, .L972
	movt	fp, #:upper16:down_read
	ldrne	r7, [r7, #32]
	ldreq	r7, [r9, #176]
	add	r5, r9, #140
	str	r3, [sp, #12]
	blx	fp
	ldr	r3, [sp, #12]
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	ubfx	r7, r7, #11, #1
	movt	r3, #:upper16:_raw_read_lock_irq
	str	r3, [sp, #12]
	movw	r3, #:lower16:_raw_spin_lock
	str	r3, [sp, #16]
	ldr	r3, [sp, #12]
	blx	r3
	ldr	r3, [sp, #16]
	mov	r0, r5
	movt	r3, #:upper16:_raw_spin_lock
	str	r3, [sp, #16]
	blx	r3
	ldr	r3, [r8, #156]
	ldr	r3, [r3]
	cmp	r3, #6
	beq	.L969
.L870:
	mov	r2, #0
	ldr	r0, .L972+12
	mov	r1, r9
	bl	snd_pcm_action
	movw	r2, #:lower16:_raw_spin_unlock
	movw	r3, #:lower16:_raw_read_unlock_irq
	movt	r2, #:upper16:_raw_spin_unlock
	movt	r3, #:upper16:_raw_read_unlock_irq
	cmp	r0, #0
	str	r2, [sp, #20]
	str	r3, [sp, #28]
	movw	r2, #:lower16:mutex_unlock
	movw	r3, #:lower16:up_read
	movt	r2, #:upper16:mutex_unlock
	movt	r3, #:upper16:up_read
	str	r0, [sp, #48]
	str	r2, [sp, #32]
	str	r3, [sp, #24]
	blt	.L871
	cmp	r7, #0
	mvnne	r3, #10
	strne	r3, [sp, #48]
	bne	.L871
	movw	r2, #:lower16:default_wake_function
	movw	r3, #:lower16:add_wait_queue
	movt	r2, #:upper16:default_wake_function
	movt	r3, #:upper16:add_wait_queue
	str	r2, [sp, #40]
	movw	r2, #:lower16:msecs_to_jiffies
	str	r3, [sp, #44]
	movw	r3, #:lower16:__aeabi_uidiv
	movt	r2, #:upper16:msecs_to_jiffies
	movt	r3, #:upper16:__aeabi_uidiv
	str	r2, [sp, #36]
	str	r3, [sp, #52]
.L877:
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	ip, [r3, #12]
	ldr	r3, [ip, #4]
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L910
	ldr	r0, [r9, #160]
	ldr	r3, [r0, #8]!
	cmp	r0, r3
	sub	r3, r3, #132
	beq	.L871
.L874:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	bne	.L872
	ldr	r2, [r3, #116]
	ldr	lr, [r2, #156]
	ldr	lr, [lr]
	cmp	lr, #5
	beq	.L873
.L872:
	ldr	r3, [r3, #132]
	cmp	r0, r3
	sub	r3, r3, #132
	bne	.L874
.L871:
	mov	r0, r5
	ldr	r2, [sp, #20]
	ldr	r5, [sp, #48]
	blx	r2
	movw	r0, #:lower16:.LANCHOR0
	ldr	r3, [sp, #28]
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldr	r0, .L972
	ldr	r2, [sp, #24]
	blx	r2
	mov	r0, r4
	ldr	r3, [sp, #32]
	blx	r3
	b	.L924
.L780:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_lock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_lock_irq
	blx	r3
	add	r6, r9, #140
	movw	r3, #:lower16:_raw_spin_lock
	movt	r3, #:upper16:_raw_spin_lock
	mov	r0, r6
	blx	r3
	mov	r1, r9
	mov	r2, r4
	ldr	r0, .L972+28
	bl	snd_pcm_action
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r5, r0
	mov	r0, r6
.L955:
	movt	r3, #:upper16:_raw_spin_unlock
.L954:
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_unlock_irq
	blx	r3
	b	.L924
.L786:
	mov	r0, r1
	mov	r1, r4
	bl	snd_pcm_info_user
	mov	r5, r0
	b	.L924
.L782:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_lock_irq
	ldr	r6, [r1, #116]
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_lock_irq
	add	r7, r1, #140
	blx	r3
	movw	r3, #:lower16:_raw_spin_lock
	mov	r0, r7
	movt	r3, #:upper16:_raw_spin_lock
	blx	r3
	ldr	r2, [r6, #156]
	ldr	r3, [r2]
	sub	r3, r3, #2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L906
.L857:
	.word	.L856
	.word	.L858
	.word	.L859
	.word	.L860
	.word	.L906
	.word	.L856
.L764:
	ldr	r3, [r1]
	cmp	r0, #0
	ldrne	r6, [r0, #32]
	ldreq	r6, [r1, #176]
	ldr	r5, [r3]
	movw	r3, #:lower16:mutex_lock
	movt	r3, #:upper16:mutex_lock
	add	r4, r5, #524
	mov	r0, r4
	blx	r3
	movw	r3, #:lower16:snd_power_wait
	mov	r0, r5
	mov	r1, #0
	movt	r3, #:upper16:snd_power_wait
	blx	r3
	subs	r5, r0, #0
	blt	.L958
	mov	r1, r9
	mov	r2, r6
	ldr	r0, .L972+16
	bl	snd_pcm_action_nonatomic
	mov	r5, r0
	b	.L958
.L784:
	mov	r0, r1
	mov	r1, r4
	bl	snd_pcm_sync_ptr
	mov	r5, r0
	b	.L924
.L766:
	cmp	r1, #0
	beq	.L826
	ldr	r4, [r1, #116]
	cmp	r4, #0
	beq	.L826
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_lock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_lock_irq
	blx	r3
	add	r5, r9, #140
	movw	r3, #:lower16:_raw_spin_lock
	movt	r3, #:upper16:_raw_spin_lock
	mov	r0, r5
	blx	r3
	ldr	r3, [r4, #156]
	ldr	r3, [r3]
	sub	r3, r3, #1
	cmp	r3, #1
	bhi	.L970
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r5
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock_irq
	movt	r3, #:upper16:_raw_read_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldr	r3, [r9, #172]
	cmp	r3, #0
	bne	.L841
	ldr	r3, [r9, #112]
	ldr	r5, [r3, #16]
	cmp	r5, #0
	beq	.L831
	mov	r0, r9
	blx	r5
	mov	r5, r0
.L831:
	ldr	r2, [r4, #156]
	mov	r1, #0
	movw	r3, #:lower16:pm_qos_remove_request
	add	r0, r9, #52
	movt	r3, #:upper16:pm_qos_remove_request
	str	r1, [r2]
	blx	r3
	b	.L924
.L788:
	movw	r3, #:lower16:memdup_user
	mov	r0, r4
	movt	r3, #:upper16:memdup_user
	mov	r1, #604
	blx	r3
	cmn	r0, #4096
	mov	r6, r0
	movhi	r5, r0
	bhi	.L924
	mov	r0, r9
	mov	r1, r6
	bl	snd_pcm_hw_refine
	mov	r2, sp
	mov	r5, r0
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
@ 448 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r4, #604; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	beq	.L794
.L796:
	cmp	r5, #0
	mvneq	r5, #13
.L795:
	movw	r3, #:lower16:kfree
	mov	r0, r6
	movt	r3, #:upper16:kfree
	blx	r3
	b	.L924
.L768:
	ldr	r0, .L972+20
	mov	r2, #0
	bl	snd_pcm_action_nonatomic
	mov	r5, r0
	b	.L924
.L774:
	mov	r0, r1
	bl	snd_pcm_unlink
	mov	r5, r0
	b	.L924
.L770:
	ldr	r2, [r1]
	movw	r3, #:lower16:mutex_lock
	ldr	r6, [r1, #116]
	movt	r3, #:upper16:mutex_lock
	ldr	r5, [r2]
	add	r4, r5, #524
	mov	r0, r4
	blx	r3
	ldr	r3, [r6, #156]
	ldr	r3, [r3]
	cmp	r3, #7
	beq	.L849
.L854:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_lock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_lock_irq
	blx	r3
	add	r7, r9, #140
	movw	r3, #:lower16:_raw_spin_lock
	movt	r3, #:upper16:_raw_spin_lock
	mov	r0, r7
	blx	r3
	ldr	r3, [r6, #156]
	ldr	r3, [r3]
	cmp	r3, #3
	beq	.L851
	cmp	r3, #4
	moveq	r5, #0
	mvnne	r5, #76
.L850:
.L853:
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r7
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_unlock_irq
	blx	r3
	b	.L958
.L778:
	mov	r2, sp
	mov	r0, r4
	bic	r3, r2, #8128
	mov	r2, #10
	bic	r3, r3, #63
	movt	r2, 2
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
@ 2517 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	subs	r5, r0, #0
	mvnne	r5, #13
	b	.L924
.L858:
	movw	r3, #:lower16:snd_pcm_update_hw_ptr
	mov	r0, r9
	movt	r3, #:upper16:snd_pcm_update_hw_ptr
	blx	r3
	subs	r5, r0, #0
	blt	.L855
	ldr	r2, [r6, #156]
.L856:
	ldr	r3, [r9, #48]
	cmp	r3, #0
	ldr	r3, [r6, #160]
	bne	.L861
	ldr	r1, [r2, #8]
	ldr	r2, [r6, #68]
	ldr	r3, [r3]
	add	r1, r2, r1
	subs	r3, r1, r3
	ldr	r1, [r6, #128]
	addmi	r3, r3, r1
	bmi	.L863
	cmp	r3, r1
	rsbcs	r3, r1, r3
.L863:
	rsb	r2, r3, r2
.L864:
	ldr	r5, [r6, #36]
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r7
	movt	r3, #:upper16:_raw_spin_unlock
	add	r5, r2, r5
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_unlock_irq
	blx	r3
	mov	r2, sp
	mov	r0, r4
	bic	r3, r2, #8128
	mov	r2, r5
	bic	r3, r3, #63
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
@ 2451 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	cmp	r0, #0
	mvnne	r5, #13
	moveq	r5, #0
	b	.L924
.L859:
	mvn	r5, #31
.L855:
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r7
	b	.L955
.L860:
	ldr	r3, [r9, #48]
	cmp	r3, #1
	bne	.L858
.L906:
	mvn	r5, #76
	b	.L855
.L873:
	ldr	r3, [sp, #40]
	add	r7, r2, #168
	add	r8, sp, #60
	str	r2, [sp, #8]
	mov	r0, r7
	str	r1, [sp, #60]
	str	r3, [sp, #68]
	mov	r1, r8
	ldr	r3, [sp, #44]
	str	ip, [sp, #64]
	blx	r3
	mov	r0, r5
	ldr	r3, [sp, #20]
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	ldr	r3, [sp, #28]
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldr	r0, .L972
	ldr	r3, [sp, #24]
	blx	r3
	mov	r0, r4
	ldr	r3, [sp, #32]
	blx	r3
	ldr	r2, [sp, #8]
	ldrb	r3, [r2, #100]	@ zero_extendqisi2
	tst	r3, #1
	mvnne	r0, #-2147483648
	bne	.L881
	ldr	r1, [r2, #52]
	cmp	r1, #0
	movweq	r0, #10000
	beq	.L875
	ldr	r0, [r2, #60]
	ldr	r3, [sp, #52]
	mov	r0, r0, asl #1
	blx	r3
	mov	r3, #1000
	cmp	r0, #10
	movlt	r0, #10
	mul	r0, r3, r0
.L875:
	ldr	r2, [sp, #36]
	blx	r2
.L881:
	movw	r3, #:lower16:schedule_timeout_interruptible
	movt	r3, #:upper16:schedule_timeout_interruptible
	blx	r3
	mov	r10, r0
	mov	r0, r4
	blx	r6
	ldr	r0, .L972
	blx	fp
	movw	r0, #:lower16:.LANCHOR0
	ldr	r3, [sp, #12]
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	mov	r0, r5
	ldr	r3, [sp, #16]
	blx	r3
	movw	r3, #:lower16:remove_wait_queue
	mov	r0, r7
	mov	r1, r8
	movt	r3, #:upper16:remove_wait_queue
	blx	r3
	cmp	r10, #0
	bne	.L877
	ldr	r3, [r9, #116]
	ldr	r3, [r3, #156]
	ldr	r3, [r3]
	cmp	r3, #7
	mvneq	r3, #85
	streq	r3, [sp, #48]
	beq	.L871
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:.LC4
	movw	r6, #:lower16:__snd_printk
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:.LC4
	movt	r6, #:upper16:__snd_printk
	mov	r0, #1
	movw	r2, #1510
	blx	r6
	mvn	r3, #4
	mov	r1, r9
	mov	r2, #1
	ldr	r0, .L972+24
	str	r3, [sp, #48]
	bl	snd_pcm_action
	b	.L871
.L760:
	mov	r2, sp
	ldr	ip, [r1, #116]
	bic	r3, r2, #8128
	mov	r0, r4
	bic	r3, r3, #63
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
@ 2501 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__get_user_4
@ 0 "" 2
	subs	r5, r0, #0
	bne	.L956
	cmp	r2, #1
	bhi	.L900
	strne	r5, [ip, #544]
	streq	r2, [ip, #544]
	b	.L924
.L762:
	mov	r0, r1
	bl	snd_pcm_drop
.L957:
	mov	r5, r0
	b	.L924
.L776:
	mov	r0, r1
	mov	r1, r4
	bl	snd_pcm_status_user
	mov	r5, r0
	b	.L924
.L959:
	mov	r0, r6
	mov	r1, #24
	blx	r5
	cmp	r0, #0
	bne	.L844
.L953:
	movw	r3, #:lower16:fput
	mov	r0, r4
	movt	r3, #:upper16:fput
	blx	r3
.L841:
	mvn	r5, #76
	b	.L924
.L804:
	ldr	r3, [r6, #156]
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, [r9, #112]
	ldr	r3, [r3, #16]
	cmp	r3, r2
	beq	.L802
	mov	r0, r9
	blx	r3
	b	.L802
.L832:
	movw	r3, #:lower16:__memzero
	add	r0, sp, #60
	movt	r3, #:upper16:__memzero
	mov	r1, #16
	blx	r3
	b	.L956
.L851:
	mov	r1, r9
	ldr	r0, .L972+24
	mov	r2, #4
	bl	snd_pcm_action
	mov	r5, r0
	b	.L850
.L823:
	movw	r3, #:lower16:__copy_to_user
	mov	r0, r4
	movt	r3, #:upper16:__copy_to_user
	mov	r1, r7
	mov	r2, #604
	blx	r3
	cmp	r0, #0
	beq	.L824
	b	.L825
.L794:
	movw	r3, #:lower16:__copy_to_user
	mov	r0, r4
	movt	r3, #:upper16:__copy_to_user
	mov	r1, r6
	mov	r2, #604
	blx	r3
	cmp	r0, #0
	beq	.L795
	b	.L796
.L849:
	movw	r3, #:lower16:snd_power_wait
	mov	r0, r5
	movt	r3, #:upper16:snd_power_wait
	mov	r1, #0
	blx	r3
	subs	r5, r0, #0
	bge	.L854
	b	.L958
.L799:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:.LC1
	movw	r3, #:lower16:.LC2
	movw	ip, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:.LC2
	movt	ip, #:upper16:warn_slowpath_fmt
	movw	r1, #379
	mvn	r5, #5
	blx	ip
	b	.L802
.L973:
	.align	2
.L972:
	.word	.LANCHOR1+52
	.word	.LANCHOR1+168
	.word	.LANCHOR1+152
	.word	.LANCHOR1+184
	.word	.LANCHOR1+120
	.word	.LANCHOR1+136
	.word	.LANCHOR1+72
	.word	.LANCHOR1+104
.L826:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:.LC1
	movw	r3, #:lower16:.LC2
	movw	ip, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:.LC2
	movt	ip, #:upper16:warn_slowpath_fmt
	movw	r1, #497
	mvn	r5, #5
	blx	ip
	b	.L924
.L861:
	ldr	r3, [r3]
	ldr	r2, [r2, #8]
	subs	r2, r2, r3
	ldrmi	r3, [r6, #128]
	addmi	r2, r2, r3
	b	.L864
.L961:
	movw	r3, #:lower16:__copy_to_user
	mov	r0, r4
	mov	r1, r6
	movt	r3, #:upper16:__copy_to_user
	mov	r2, #16
	blx	r3
	cmp	r0, #0
	beq	.L957
	b	.L956
.L900:
	mvn	r5, #21
	b	.L924
.L960:
	ldr	r2, [r6, #160]
	add	r3, r6, #140
	cmp	r2, r3
	mvnne	r5, #113
	bne	.L845
	ldr	r3, [r9, #160]
	add	r2, r9, #140
	cmp	r3, r2
	beq	.L971
.L846:
	ldr	r2, [r3, #12]
	add	r1, r6, #132
	add	r0, r3, #8
	str	r1, [r3, #12]
	str	r0, [r6, #132]
	mov	r5, #0
	str	r2, [r6, #136]
	str	r1, [r2]
	ldr	r3, [r9, #160]
	ldr	r2, [r3, #16]
	add	r2, r2, #1
	str	r2, [r3, #16]
	ldr	r3, [r9, #160]
	str	r3, [r6, #160]
	b	.L845
.L969:
	mov	r1, r9
	mov	r2, #0
	ldr	r0, .L972+28
	bl	snd_pcm_action
	b	.L870
.L968:
	movw	r3, #:lower16:snd_power_wait
	mov	r0, r5
	movt	r3, #:upper16:snd_power_wait
	mov	r1, #0
	blx	r3
	subs	r5, r0, #0
	bge	.L867
	b	.L958
.L890:
	mvn	r5, #76
	b	.L802
.L967:
	movw	r3, #:lower16:pm_qos_remove_request
	mov	r0, r8
	movt	r3, #:upper16:pm_qos_remove_request
	blx	r3
	b	.L819
.L962:
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r5
	movt	r3, #:upper16:_raw_spin_unlock
	mvn	r5, #76
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_unlock_irq
	blx	r3
	b	.L802
.L970:
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r5
	movt	r3, #:upper16:_raw_spin_unlock
	mvn	r5, #76
	b	.L954
.L966:
	rsb	r2, r3, #0
	mov	r8, #32
	and	r3, r2, r3
.L885:
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r3, r3
@ 0 "" 2
	rsb	r3, r3, #31
	add	r8, r8, r3
	b	.L813
.L965:
	rsb	r1, r3, #0
	mov	r2, #32
	and	r3, r1, r3
.L884:
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r3, r3
@ 0 "" 2
	rsb	r0, r3, #31
	add	r0, r2, r0
	b	.L811
.L964:
	rsb	r1, r3, #0
	mov	r2, #32
	and	r3, r1, r3
.L883:
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r3, r3
@ 0 "" 2
	rsb	r3, r3, #31
	add	r3, r3, r2
	b	.L809
.L963:
	rsb	r1, r3, #0
	mov	r2, #0
	and	r3, r1, r3
	b	.L883
.L812:
	rsb	r2, r3, #0
	and	r3, r2, r3
	b	.L885
.L810:
	rsb	r1, r3, #0
	mov	r2, #0
	and	r3, r1, r3
	b	.L884
.L910:
	mov	r3, #65024
	movt	r3, 65535
	str	r3, [sp, #48]
	b	.L871
.L971:
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L847
	movw	r3, #:lower16:kmem_cache_alloc_trace
	mov	r1, #32
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #20
	blx	r3
	cmp	r0, #0
	str	r0, [r9, #160]
	mvneq	r5, #11
	beq	.L845
.L880:
	mov	r3, #0
	add	r1, r9, #132
	str	r3, [r0]
	mov	lr, #1
	str	r3, [r0, #4]
	ldr	r3, [r9, #160]
	add	r2, r3, #8
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	ldr	r3, [r9, #160]
	ldr	r2, [r3, #12]
	add	r0, r3, #8
	str	r1, [r3, #12]
	str	r0, [r9, #132]
	str	r2, [r9, #136]
	str	r1, [r2]
	ldr	r3, [r9, #160]
	str	lr, [r3, #16]
	ldr	r3, [r9, #160]
	b	.L846
.L847:
	mov	r0, #16
	str	r0, [r9, #160]
	b	.L880
	.fnend
	.size	snd_pcm_common_ioctl1, .-snd_pcm_common_ioctl1
	.align	2
	.type	snd_pcm_playback_ioctl1, %function
snd_pcm_playback_ioctl1:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	subs	r5, r1, #0
	.pad #20
	sub	sp, sp, #20
	mov	r6, r3
	beq	.L1032
	ldr	r3, [r5, #48]
	cmp	r3, #0
	bne	.L1015
	movw	ip, #16713
	movt	ip, 16388
	cmp	r2, ip
	beq	.L1003
	bls	.L1033
	movw	r1, #16720
	movt	r1, 16396
	cmp	r2, r1
	beq	.L977
	movw	r1, #16722
	movt	r1, 16396
	cmp	r2, r1
	bne	.L1014
	ldr	r4, [r5, #116]
	ldr	r2, [r4, #156]
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L1018
	ldr	r2, [r4, #56]
	cmp	r2, #128
	mvnhi	r4, #21
	bhi	.L1028
	mov	r2, sp
	mov	r0, r6
	bic	r1, r2, #8128
	mov	r2, r3
	bic	r3, r1, #63
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
@ 2615 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	cmp	r0, #0
	bne	.L1031
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
@ 439 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r6, #12; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	bne	.L980
	movw	r3, #:lower16:__copy_from_user
	add	r0, sp, #4
	movt	r3, #:upper16:__copy_from_user
	mov	r1, r6
	mov	r2, #12
	blx	r3
	subs	r8, r0, #0
	bne	.L1031
	ldr	r1, [r4, #56]
	movw	r3, #:lower16:memdup_user
	movt	r3, #:upper16:memdup_user
	ldr	r0, [sp, #8]
	mov	r1, r1, asl #2
	blx	r3
	cmn	r0, #4096
	mov	r7, r0
	movhi	r4, r0
	bhi	.L1028
	movw	r3, #:lower16:snd_pcm_lib_writev
	mov	r1, r7
	ldr	r2, [sp, #12]
	mov	r0, r5
	movt	r3, #:upper16:snd_pcm_lib_writev
	blx	r3
	movw	r3, #:lower16:kfree
	mov	r4, r0
	movt	r3, #:upper16:kfree
	mov	r0, r7
	blx	r3
@ 2626 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	1:	str	r4,[r6],#0
2:
	.pushsection .fixup,"ax"
	.align	2
3:	mov	r8, #-14
	b	2b
	.popsection
	.pushsection __ex_table,"a"
	.align	3
	.long	1b, 3b
	.popsection
@ 0 "" 2
	and	r4, r4, r4, asr #31
	b	.L1028
.L1033:
	movw	r3, #16710
	movt	r3, 16388
	cmp	r2, r3
	bne	.L1014
	mov	r2, sp
	mov	r0, r6
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
@ 2634 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__get_user_4
@ 0 "" 2
	cmp	r0, #0
	mov	r7, r2
	bne	.L1031
	mov	r2, sp
	bic	r3, r2, #8128
	mov	r2, r0
	bic	r3, r3, #63
	mov	r0, r6
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
@ 2636 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	subs	r4, r0, #0
	bne	.L1031
	cmp	r7, #0
	ldr	r8, [r5, #116]
	bne	.L1034
.L1024:
	mov	r7, r4
.L1004:
	mov	r3, #0
@ 2652 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	1:	str	r7,[r6],#0
2:
	.pushsection .fixup,"ax"
	.align	2
3:	mov	r3, #-14
	b	2b
	.popsection
	.pushsection __ex_table,"a"
	.align	3
	.long	1b, 3b
	.popsection
@ 0 "" 2
.L1028:
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L1014:
	mov	r1, r5
	mov	r3, r6
	bl	snd_pcm_common_ioctl1
	mov	r4, r0
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L977:
	ldr	r2, [r5, #116]
	ldr	r2, [r2, #156]
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L1018
	mov	r2, sp
	mov	r0, r6
	bic	r1, r2, #8128
	mov	r2, r3
	bic	r3, r1, #63
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
@ 2596 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	cmp	r0, #0
	bne	.L1031
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
@ 439 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r6, #12; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	beq	.L1035
.L980:
	movw	r3, #:lower16:__memzero
	add	r0, sp, #4
	movt	r3, #:upper16:__memzero
	mov	r1, #12
	blx	r3
.L1031:
	mvn	r4, #13
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L998:
.L1003:
	mov	r2, sp
	mov	r0, r6
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
@ 2647 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__get_user_4
@ 0 "" 2
	cmp	r0, #0
	mov	r7, r2
	bne	.L1031
	mov	r2, sp
	bic	r3, r2, #8128
	mov	r2, r0
	bic	r3, r3, #63
	mov	r0, r6
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
@ 2649 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	subs	r4, r0, #0
	bne	.L1031
	cmp	r7, #0
	ldr	r8, [r5, #116]
	beq	.L1024
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_lock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_lock_irq
	blx	r3
	add	r9, r5, #140
	movw	r3, #:lower16:_raw_spin_lock
	movt	r3, #:upper16:_raw_spin_lock
	mov	r0, r9
	blx	r3
	ldr	r2, [r8, #156]
	ldr	r3, [r2]
	sub	r3, r3, #2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L1005
.L1007:
	.word	.L1006
	.word	.L1008
	.word	.L1026
	.word	.L1008
	.word	.L1006
	.word	.L1010
.L1018:
	mvn	r4, #76
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L1034:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_lock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_lock_irq
	blx	r3
	add	r9, r5, #140
	movw	r3, #:lower16:_raw_spin_lock
	movt	r3, #:upper16:_raw_spin_lock
	mov	r0, r9
	blx	r3
	ldr	r2, [r8, #156]
	ldr	r3, [r2]
	sub	r3, r3, #2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L1005
.L996:
	.word	.L995
	.word	.L997
	.word	.L1026
	.word	.L997
	.word	.L1005
	.word	.L1010
.L1035:
	movw	r3, #:lower16:__copy_from_user
	add	r0, sp, #4
	movt	r3, #:upper16:__copy_from_user
	mov	r1, r6
	mov	r2, #12
	blx	r3
	subs	r4, r0, #0
	bne	.L1031
	movw	r3, #:lower16:snd_pcm_lib_write
	mov	r0, r5
	movt	r3, #:upper16:snd_pcm_lib_write
	ldr	r1, [sp, #8]
	ldr	r2, [sp, #12]
	blx	r3
	mov	r3, r4
@ 2601 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	1:	str	r0,[r6],#0
2:
	.pushsection .fixup,"ax"
	.align	2
3:	mov	r3, #-14
	b	2b
	.popsection
	.pushsection __ex_table,"a"
	.align	3
	.long	1b, 3b
	.popsection
@ 0 "" 2
	and	r4, r0, r0, asr #31
	b	.L1028
.L1026:
	mvn	r4, #31
	mov	r7, r4
.L1009:
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r9
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_unlock_irq
	blx	r3
	b	.L1004
.L1010:
	mvn	r4, #85
	mov	r7, r4
	b	.L1009
.L1008:
	movw	r3, #:lower16:snd_pcm_update_hw_ptr
	mov	r0, r5
	movt	r3, #:upper16:snd_pcm_update_hw_ptr
	blx	r3
	cmp	r0, #0
	blt	.L1026
	ldr	r2, [r8, #156]
.L1006:
	ldr	r0, [r8, #160]
	ldr	r3, [r2, #8]
	ldr	r1, [r8, #68]
	ldr	r2, [r0]
	add	r3, r1, r3
	ldr	r1, [r8, #128]
	subs	r3, r3, r2
	addmi	r3, r3, r1
	bmi	.L1012
	cmp	r3, r1
	rsbcs	r3, r1, r3
.L1012:
	cmp	r3, #0
	ble	.L1027
	cmp	r3, r7
	movcc	r7, r3
	add	r2, r7, r2
	cmp	r2, r1
	rsbge	r2, r1, r2
	str	r2, [r0]
	b	.L1009
.L997:
	movw	r3, #:lower16:snd_pcm_update_hw_ptr
	mov	r0, r5
	movt	r3, #:upper16:snd_pcm_update_hw_ptr
	blx	r3
	cmp	r0, #0
	blt	.L1026
	ldr	r2, [r8, #156]
.L995:
	ldr	r0, [r8, #160]
	ldr	r2, [r2, #8]
	ldr	r1, [r8, #68]
	ldr	r3, [r0]
	ldr	ip, [r8, #128]
	add	r2, r1, r2
	subs	r2, r2, r3
	addmi	r2, r2, ip
	bmi	.L1001
	cmp	r2, ip
	rsbcs	r2, ip, r2
.L1001:
	rsb	r2, r2, r1
	cmp	r2, #0
	ble	.L1027
	cmp	r2, r7
	movcc	r7, r2
	subs	r3, r3, r7
	addmi	r3, r3, ip
	str	r3, [r0]
	b	.L1009
.L1005:
	mvn	r4, #76
	mov	r7, r4
	b	.L1009
.L1027:
	mov	r7, #0
	b	.L1009
.L1032:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:.LC1
	movw	r3, #:lower16:.LC3
	movw	ip, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:.LC3
	movt	ip, #:upper16:warn_slowpath_fmt
	movw	r1, #2583
	mvn	r4, #5
	blx	ip
	b	.L1028
.L1015:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:.LC1
	movw	r3, #:lower16:.LC6
	movw	ip, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:.LC6
	movt	ip, #:upper16:warn_slowpath_fmt
	movw	r1, #2585
	mvn	r4, #21
	blx	ip
	b	.L1028
	.fnend
	.size	snd_pcm_playback_ioctl1, .-snd_pcm_playback_ioctl1
	.align	2
	.type	snd_pcm_playback_ioctl, %function
snd_pcm_playback_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, r1
	ubfx	r1, r1, #8, #8
	cmp	r1, #65
	mov	r3, r2
	ldr	r2, [r0, #124]
	bne	.L1037
	ldr	r1, [r2]
	mov	r2, ip
	b	snd_pcm_playback_ioctl1
.L1037:
	mvn	r0, #24
	bx	lr
	.fnend
	.size	snd_pcm_playback_ioctl, .-snd_pcm_playback_ioctl
	.align	2
	.type	snd_pcm_capture_ioctl1, %function
snd_pcm_capture_ioctl1:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	subs	r5, r1, #0
	.pad #20
	sub	sp, sp, #20
	mov	r6, r3
	beq	.L1094
	ldr	r3, [r5, #48]
	cmp	r3, #1
	bne	.L1077
	movw	ip, #16713
	movt	ip, 16388
	cmp	r2, ip
	beq	.L1066
	bls	.L1095
	movw	r3, #16721
	movt	r3, 32780
	cmp	r2, r3
	beq	.L1041
	movw	r3, #16723
	movt	r3, 32780
	cmp	r2, r3
	bne	.L1076
	ldr	r4, [r5, #116]
	ldr	r3, [r4, #156]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1080
	ldr	r3, [r4, #56]
	cmp	r3, #128
	mvnhi	r4, #21
	bhi	.L1090
	mov	r2, sp
	mov	r0, r6
	bic	r3, r2, #8128
	mov	r2, #0
	bic	r3, r3, #63
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
@ 2695 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	cmp	r0, #0
	bne	.L1093
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
@ 439 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r6, #12; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	bne	.L1044
	movw	r3, #:lower16:__copy_from_user
	add	r0, sp, #4
	movt	r3, #:upper16:__copy_from_user
	mov	r1, r6
	mov	r2, #12
	blx	r3
	subs	r8, r0, #0
	bne	.L1093
	ldr	r1, [r4, #56]
	movw	r3, #:lower16:memdup_user
	movt	r3, #:upper16:memdup_user
	ldr	r0, [sp, #8]
	mov	r1, r1, asl #2
	blx	r3
	cmn	r0, #4096
	mov	r7, r0
	movhi	r4, r0
	bhi	.L1090
	movw	r3, #:lower16:snd_pcm_lib_readv
	mov	r1, r7
	ldr	r2, [sp, #12]
	mov	r0, r5
	movt	r3, #:upper16:snd_pcm_lib_readv
	blx	r3
	movw	r3, #:lower16:kfree
	mov	r4, r0
	movt	r3, #:upper16:kfree
	mov	r0, r7
	blx	r3
@ 2706 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	1:	str	r4,[r6],#0
2:
	.pushsection .fixup,"ax"
	.align	2
3:	mov	r8, #-14
	b	2b
	.popsection
	.pushsection __ex_table,"a"
	.align	3
	.long	1b, 3b
	.popsection
@ 0 "" 2
	and	r4, r4, r4, asr #31
	b	.L1090
.L1095:
	movw	r3, #16710
	movt	r3, 16388
	cmp	r2, r3
	bne	.L1076
	mov	r2, sp
	mov	r0, r6
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
@ 2714 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__get_user_4
@ 0 "" 2
	cmp	r0, #0
	mov	r7, r2
	bne	.L1093
	mov	r2, sp
	bic	r3, r2, #8128
	mov	r2, r0
	bic	r3, r3, #63
	mov	r0, r6
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
@ 2716 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	subs	r4, r0, #0
	bne	.L1093
	cmp	r7, #0
	ldr	r8, [r5, #116]
	bne	.L1096
.L1086:
	mov	r7, r4
.L1067:
	mov	r3, #0
@ 2732 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	1:	str	r7,[r6],#0
2:
	.pushsection .fixup,"ax"
	.align	2
3:	mov	r3, #-14
	b	2b
	.popsection
	.pushsection __ex_table,"a"
	.align	3
	.long	1b, 3b
	.popsection
@ 0 "" 2
.L1090:
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L1076:
	mov	r1, r5
	mov	r3, r6
	bl	snd_pcm_common_ioctl1
	mov	r4, r0
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L1041:
	ldr	r3, [r5, #116]
	ldr	r3, [r3, #156]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1080
	mov	r2, sp
	mov	r0, r6
	bic	r3, r2, #8128
	mov	r2, #0
	bic	r3, r3, #63
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
@ 2676 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	cmp	r0, #0
	bne	.L1093
	mov	r2, sp
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
@ 439 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r2, r6, #12; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	beq	.L1097
.L1044:
	movw	r3, #:lower16:__memzero
	add	r0, sp, #4
	movt	r3, #:upper16:__memzero
	mov	r1, #12
	blx	r3
.L1093:
	mvn	r4, #13
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L1062:
.L1066:
	mov	r2, sp
	mov	r0, r6
	bic	r3, r2, #8128
	bic	r3, r3, #63
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
@ 2727 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__get_user_4
@ 0 "" 2
	cmp	r0, #0
	mov	r7, r2
	bne	.L1093
	mov	r2, sp
	bic	r3, r2, #8128
	mov	r2, r0
	bic	r3, r3, #63
	mov	r0, r6
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
@ 2729 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	subs	r4, r0, #0
	bne	.L1093
	cmp	r7, #0
	ldr	r8, [r5, #116]
	beq	.L1086
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_lock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_lock_irq
	blx	r3
	add	r9, r5, #140
	movw	r3, #:lower16:_raw_spin_lock
	movt	r3, #:upper16:_raw_spin_lock
	mov	r0, r9
	blx	r3
	ldr	r2, [r8, #156]
	ldr	r3, [r2]
	sub	r3, r3, #2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L1068
.L1070:
	.word	.L1069
	.word	.L1071
	.word	.L1088
	.word	.L1069
	.word	.L1069
	.word	.L1073
.L1080:
	mvn	r4, #76
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L1096:
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_lock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_lock_irq
	blx	r3
	add	r9, r5, #140
	movw	r3, #:lower16:_raw_spin_lock
	movt	r3, #:upper16:_raw_spin_lock
	mov	r0, r9
	blx	r3
	ldr	r2, [r8, #156]
	ldr	r3, [r2]
	sub	r3, r3, #2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L1068
.L1060:
	.word	.L1059
	.word	.L1061
	.word	.L1088
	.word	.L1059
	.word	.L1068
	.word	.L1073
.L1097:
	movw	r3, #:lower16:__copy_from_user
	add	r0, sp, #4
	movt	r3, #:upper16:__copy_from_user
	mov	r1, r6
	mov	r2, #12
	blx	r3
	subs	r4, r0, #0
	bne	.L1093
	movw	r3, #:lower16:snd_pcm_lib_read
	mov	r0, r5
	movt	r3, #:upper16:snd_pcm_lib_read
	ldr	r1, [sp, #8]
	ldr	r2, [sp, #12]
	blx	r3
	mov	r3, r4
@ 2681 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	1:	str	r0,[r6],#0
2:
	.pushsection .fixup,"ax"
	.align	2
3:	mov	r3, #-14
	b	2b
	.popsection
	.pushsection __ex_table,"a"
	.align	3
	.long	1b, 3b
	.popsection
@ 0 "" 2
	and	r4, r0, r0, asr #31
	b	.L1090
.L1088:
	mvn	r4, #31
	mov	r7, r4
.L1072:
	movw	r3, #:lower16:_raw_spin_unlock
	mov	r0, r9
	movt	r3, #:upper16:_raw_spin_unlock
	blx	r3
	movw	r0, #:lower16:.LANCHOR0
	movw	r3, #:lower16:_raw_read_unlock_irq
	movt	r0, #:upper16:.LANCHOR0
	movt	r3, #:upper16:_raw_read_unlock_irq
	blx	r3
	b	.L1067
.L1073:
	mvn	r4, #85
	mov	r7, r4
	b	.L1072
.L1071:
	movw	r3, #:lower16:snd_pcm_update_hw_ptr
	mov	r0, r5
	movt	r3, #:upper16:snd_pcm_update_hw_ptr
	blx	r3
	cmp	r0, #0
	blt	.L1088
	ldr	r2, [r8, #156]
.L1069:
	ldr	r1, [r8, #160]
	ldr	r2, [r2, #8]
	ldr	r3, [r1]
	subs	r2, r2, r3
	ldrmi	r0, [r8, #128]
	addmi	r2, r2, r0
	cmp	r2, #0
	ble	.L1089
	ldr	r0, [r8, #128]
	cmp	r2, r7
	movcc	r7, r2
	add	r3, r7, r3
	cmp	r3, r0
	rsbge	r3, r0, r3
.L1075:
	str	r3, [r1]
	b	.L1072
.L1061:
	movw	r3, #:lower16:snd_pcm_update_hw_ptr
	mov	r0, r5
	movt	r3, #:upper16:snd_pcm_update_hw_ptr
	blx	r3
	cmp	r0, #0
	blt	.L1088
	ldr	r2, [r8, #156]
.L1059:
	ldr	r1, [r8, #160]
	ldr	r2, [r2, #8]
	ldr	r0, [r8, #68]
	ldr	r3, [r1]
	subs	r2, r2, r3
	ldrmi	ip, [r8, #128]
	addmi	r2, r2, ip
	rsb	r2, r2, r0
	cmp	r2, #0
	ble	.L1089
	cmp	r2, r7
	movcc	r7, r2
	subs	r3, r3, r7
	ldrmi	r2, [r8, #128]
	addmi	r3, r3, r2
	b	.L1075
.L1068:
	mvn	r4, #76
	mov	r7, r4
	b	.L1072
.L1089:
	mov	r7, #0
	b	.L1072
.L1094:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:.LC1
	movw	r3, #:lower16:.LC3
	movw	ip, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:.LC3
	movt	ip, #:upper16:warn_slowpath_fmt
	movw	r1, #2663
	mvn	r4, #5
	blx	ip
	b	.L1090
.L1077:
	movw	r0, #:lower16:.LC0
	movw	r2, #:lower16:.LC1
	movw	r3, #:lower16:.LC7
	movw	ip, #:lower16:warn_slowpath_fmt
	movt	r0, #:upper16:.LC0
	movt	r2, #:upper16:.LC1
	movt	r3, #:upper16:.LC7
	movt	ip, #:upper16:warn_slowpath_fmt
	movw	r1, #2665
	mvn	r4, #21
	blx	ip
	b	.L1090
	.fnend
	.size	snd_pcm_capture_ioctl1, .-snd_pcm_capture_ioctl1
	.align	2
	.global	snd_pcm_kernel_ioctl
	.type	snd_pcm_kernel_ioctl, %function
snd_pcm_kernel_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r5, r0
	ldr	r4, [r0, #48]
	mov	r3, sp
	mov	r0, #0
	bic	ip, r3, #8128
	bic	ip, ip, #63
	mov	r7, r1
	cmp	r4, r0
	ldr	r6, [ip, #8]
	mov	r3, r2
	str	r0, [ip, #8]
	beq	.L1100
	cmp	r4, #1
	beq	.L1101
	mvn	r0, #21
	str	r6, [ip, #8]
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L1101:
	mov	r1, r5
	mov	r2, r7
	bl	snd_pcm_capture_ioctl1
	mov	r3, sp
	bic	ip, r3, #8128
	bic	ip, ip, #63
	str	r6, [ip, #8]
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L1100:
	mov	r0, r4
	mov	r1, r5
	mov	r2, r7
	bl	snd_pcm_playback_ioctl1
	mov	r3, sp
	bic	ip, r3, #8128
	bic	ip, ip, #63
	str	r6, [ip, #8]
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
	.fnend
	.size	snd_pcm_kernel_ioctl, .-snd_pcm_kernel_ioctl
	.align	2
	.type	snd_pcm_capture_ioctl, %function
snd_pcm_capture_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, r1
	ubfx	r1, r1, #8, #8
	cmp	r1, #65
	mov	r3, r2
	ldr	r2, [r0, #124]
	bne	.L1105
	ldr	r1, [r2]
	mov	r2, ip
	b	snd_pcm_capture_ioctl1
.L1105:
	mvn	r0, #24
	bx	lr
	.fnend
	.size	snd_pcm_capture_ioctl, .-snd_pcm_capture_ioctl
	.align	2
	.global	snd_pcm_start
	.type	snd_pcm_start, %function
snd_pcm_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, r0
	mov	r2, #3
	ldr	r0, .L1107
	b	snd_pcm_action
.L1108:
	.align	2
.L1107:
	.word	.LANCHOR1+152
	.fnend
	.size	snd_pcm_start, .-snd_pcm_start
	.align	2
	.global	snd_pcm_drain_done
	.type	snd_pcm_drain_done, %function
snd_pcm_drain_done:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, r0
	mov	r2, #1
	ldr	r0, .L1110
	b	snd_pcm_action_single
.L1111:
	.align	2
.L1110:
	.word	.LANCHOR1+72
	.fnend
	.size	snd_pcm_drain_done, .-snd_pcm_drain_done
	.align	2
	.global	snd_pcm_hw_constraints_init
	.type	snd_pcm_hw_constraints_init, %function
snd_pcm_hw_constraints_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r5, #:lower16:memset
	ldr	r10, [r0, #116]
	.pad #20
	sub	sp, sp, #20
	movt	r5, #:upper16:memset
	mov	r4, #0
	add	r6, r10, #280
.L1114:
	add	r0, r6, r4
	mov	r1, #255
	add	r4, r4, #32
	mov	r2, #8
	blx	r5
	cmp	r4, #96
	bne	.L1114
	mov	r3, r10
	mov	r2, #8
	mov	r4, #0
	mvn	lr, #0
.L1116:
	ldrb	r0, [r3, #384]	@ zero_extendqisi2
	add	r2, r2, #1
	cmp	r2, #20
	add	r1, r3, #376
	str	r4, [r3, #376]
	add	r3, r3, #12
	and	r0, r0, #248
	str	lr, [r3, #368]
	bfc	r0, #3, #1
	strb	r0, [r1, #8]
	bne	.L1116
	ldrb	r3, [r10, #408]	@ zero_extendqisi2
	tst	r3, #4
	bne	.L1117
	and	r3, r3, #3
	cmp	r3, #3
	beq	.L1148
	ldrb	r3, [r10, #408]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r10, #408]
.L1117:
	ldrb	r3, [r10, #492]	@ zero_extendqisi2
	tst	r3, #4
	bne	.L1119
	and	r3, r3, #3
	cmp	r3, #3
	beq	.L1149
	ldrb	r3, [r10, #492]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r10, #492]
.L1119:
	ldrb	r3, [r10, #504]	@ zero_extendqisi2
	tst	r3, #4
	bne	.L1121
	and	r3, r3, #3
	cmp	r3, #3
	beq	.L1150
	ldrb	r3, [r10, #504]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r10, #504]
.L1121:
	ldrb	r3, [r10, #384]	@ zero_extendqisi2
	tst	r3, #4
	bne	.L1123
	and	r3, r3, #3
	cmp	r3, #3
	beq	.L1151
	ldrb	r3, [r10, #384]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r10, #384]
.L1123:
	ldrb	r3, [r10, #396]	@ zero_extendqisi2
	tst	r3, #4
	bne	.L1125
	and	r3, r3, #3
	cmp	r3, #3
	beq	.L1152
	ldrb	r3, [r10, #396]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r10, #396]
.L1125:
	mov	fp, #0
	mov	r4, #8
	mvn	r5, #0
	movw	r3, #:lower16:snd_pcm_hw_rule_format
	movw	r8, #:lower16:snd_pcm_hw_rule_add
	str	fp, [sp]
	mov	r1, fp
	stmib	sp, {r4, r5}
	movt	r3, #:upper16:snd_pcm_hw_rule_format
	movt	r8, #:upper16:snd_pcm_hw_rule_add
	mov	r0, r10
	mov	r2, #1
	blx	r8
	cmp	r0, #0
	blt	.L1127
	mov	r2, #1
	movw	r3, #:lower16:snd_pcm_hw_rule_sample_bits
	str	r2, [sp, #4]
	movt	r3, #:upper16:snd_pcm_hw_rule_sample_bits
	str	fp, [sp]
	mov	r0, r10
	str	r4, [sp, #8]
	mov	r1, fp
	str	r5, [sp, #12]
	mov	r2, r4
	blx	r8
	cmp	r0, #0
	blt	.L1127
	mov	r6, #9
	mov	r7, #10
	movw	r3, #:lower16:snd_pcm_hw_rule_div
	str	fp, [sp]
	str	r5, [sp, #12]
	movt	r3, #:upper16:snd_pcm_hw_rule_div
	str	r6, [sp, #4]
	mov	r0, r10
	str	r7, [sp, #8]
	mov	r1, fp
	mov	r2, r4
	blx	r8
	cmp	r0, #0
	blt	.L1127
	movw	r3, #:lower16:snd_pcm_hw_rule_mul
	str	fp, [sp]
	str	r4, [sp, #4]
	movt	r3, #:upper16:snd_pcm_hw_rule_mul
	str	r7, [sp, #8]
	mov	r0, r10
	str	r5, [sp, #12]
	mov	r1, fp
	mov	r2, r6
	blx	r8
	cmp	r0, #0
	blt	.L1127
	mov	r2, #14
	mov	r9, #13
	movw	r3, #:lower16:snd_pcm_hw_rule_mulkdiv
	str	r2, [sp, #4]
	str	r4, [sp]
	movt	r3, #:upper16:snd_pcm_hw_rule_mulkdiv
	str	r5, [sp, #12]
	mov	r0, r10
	str	r9, [sp, #8]
	mov	r1, fp
	mov	r2, r6
	blx	r8
	cmp	r0, #0
	blt	.L1127
	mov	r2, #18
	mov	r1, #17
	movw	r3, #:lower16:snd_pcm_hw_rule_mulkdiv
	str	r2, [sp, #4]
	str	r1, [sp, #8]
	movt	r3, #:upper16:snd_pcm_hw_rule_mulkdiv
	str	r4, [sp]
	mov	r0, r10
	str	r5, [sp, #12]
	mov	r1, fp
	mov	r2, r6
	blx	r8
	cmp	r0, #0
	blt	.L1127
	movw	r3, #:lower16:snd_pcm_hw_rule_div
	str	fp, [sp]
	str	r6, [sp, #4]
	mov	r2, r7
	str	r4, [sp, #8]
	movt	r3, #:upper16:snd_pcm_hw_rule_div
	str	r5, [sp, #12]
	mov	r0, r10
	mov	r1, fp
	blx	r8
	cmp	r0, #0
	blt	.L1127
	movw	r4, #16960
	mov	r2, #12
	movt	r4, 15
	movw	r3, #:lower16:snd_pcm_hw_rule_mulkdiv
	str	r2, [sp, #8]
	movt	r3, #:upper16:snd_pcm_hw_rule_mulkdiv
	str	r9, [sp, #4]
	mov	r0, r10
	str	r5, [sp, #12]
	mov	r1, fp
	str	r4, [sp]
	mov	r2, #11
	blx	r8
	cmp	r0, #0
	blt	.L1127
	mov	r2, #16
	mov	r1, #17
	movw	r3, #:lower16:snd_pcm_hw_rule_mulkdiv
	str	r1, [sp, #4]
	str	r2, [sp, #8]
	movt	r3, #:upper16:snd_pcm_hw_rule_mulkdiv
	str	r4, [sp]
	mov	r0, r10
	str	r5, [sp, #12]
	mov	r1, fp
	mov	r2, #11
	blx	r8
	cmp	r0, #0
	blt	.L1127
	mov	r2, #17
	movw	r3, #:lower16:snd_pcm_hw_rule_div
	str	r2, [sp, #4]
	mov	r1, fp
	str	fp, [sp]
	movt	r3, #:upper16:snd_pcm_hw_rule_div
	str	r9, [sp, #8]
	mov	r0, r10
	str	r5, [sp, #12]
	mov	r2, #15
	blx	r8
	cmp	r0, #0
	blt	.L1127
	mov	r4, fp
	mov	r7, #17
	mov	fp, #15
	movw	r3, #:lower16:snd_pcm_hw_rule_div
	str	r5, [sp, #12]
	mov	r1, r4
	str	r4, [sp]
	movt	r3, #:upper16:snd_pcm_hw_rule_div
	stmib	sp, {r7, fp}
	mov	r0, r10
	mov	r2, r9
	mov	r6, r5
	blx	r8
	cmp	r0, #0
	mov	r5, r8
	blt	.L1127
	mov	r1, #8
	mov	r2, #14
	mov	r9, #9
	movw	r3, #:lower16:snd_pcm_hw_rule_mulkdiv
	str	r1, [sp]
	movt	r3, #:upper16:snd_pcm_hw_rule_mulkdiv
	str	r2, [sp, #4]
	mov	r0, r10
	str	r6, [sp, #12]
	mov	r1, r4
	str	r9, [sp, #8]
	mov	r2, #13
	blx	r8
	cmp	r0, #0
	blt	.L1127
	movw	r8, #16960
	mov	r1, #12
	mov	r2, #11
	movt	r8, 15
	movw	r3, #:lower16:snd_pcm_hw_rule_muldivk
	str	r1, [sp, #4]
	str	r2, [sp, #8]
	movt	r3, #:upper16:snd_pcm_hw_rule_muldivk
	str	r6, [sp, #12]
	mov	r0, r10
	str	r8, [sp]
	mov	r1, r4
	mov	r2, #13
	blx	r5
	cmp	r0, #0
	blt	.L1127
	mov	r2, #13
	movw	r3, #:lower16:snd_pcm_hw_rule_mul
	str	r2, [sp, #4]
	movt	r3, #:upper16:snd_pcm_hw_rule_mul
	str	r4, [sp]
	mov	r0, r10
	str	fp, [sp, #8]
	mov	r1, r4
	str	r6, [sp, #12]
	mov	r2, r7
	blx	r5
	cmp	r0, #0
	blt	.L1127
	mov	r1, #8
	mov	fp, #18
	movw	r3, #:lower16:snd_pcm_hw_rule_mulkdiv
	str	r1, [sp]
	movt	r3, #:upper16:snd_pcm_hw_rule_mulkdiv
	str	r9, [sp, #8]
	mov	r0, r10
	str	r6, [sp, #12]
	mov	r1, r4
	str	fp, [sp, #4]
	mov	r2, r7
	blx	r5
	cmp	r0, #0
	blt	.L1127
	mov	r2, #11
	movw	r3, #:lower16:snd_pcm_hw_rule_muldivk
	str	r2, [sp, #8]
	mov	r2, #16
	str	r2, [sp, #4]
	movt	r3, #:upper16:snd_pcm_hw_rule_muldivk
	str	r8, [sp]
	mov	r0, r10
	str	r6, [sp, #12]
	mov	r1, r4
	mov	r2, r7
	blx	r5
	cmp	r0, #0
	blt	.L1127
	mov	r1, #8
	mov	r2, #13
	movw	r3, #:lower16:snd_pcm_hw_rule_muldivk
	stmia	sp, {r1, r2}
	str	r9, [sp, #8]
	mov	r2, #14
	movt	r3, #:upper16:snd_pcm_hw_rule_muldivk
	str	r6, [sp, #12]
	mov	r0, r10
	mov	r1, r4
	blx	r5
	cmp	r0, #0
	blt	.L1127
	mov	r1, #8
	movw	r3, #:lower16:snd_pcm_hw_rule_muldivk
	stmia	sp, {r1, r7}
	mov	r2, fp
	str	r9, [sp, #8]
	movt	r3, #:upper16:snd_pcm_hw_rule_muldivk
	str	r6, [sp, #12]
	mov	r0, r10
	mov	r1, r4
	blx	r5
	cmp	r0, #0
	blt	.L1127
	mov	r2, #13
	mov	r1, #11
	movw	r3, #:lower16:snd_pcm_hw_rule_mulkdiv
	str	r2, [sp, #4]
	str	r1, [sp, #8]
	mov	r2, #12
	str	r8, [sp]
	movt	r3, #:upper16:snd_pcm_hw_rule_mulkdiv
	str	r6, [sp, #12]
	mov	r0, r10
	mov	r1, r4
	blx	r5
	cmp	r0, #0
	blt	.L1127
	mov	r2, #11
	movw	r3, #:lower16:snd_pcm_hw_rule_mulkdiv
	str	r2, [sp, #8]
	mov	r0, r10
	str	r8, [sp]
	mov	r1, r4
	str	r7, [sp, #4]
	mov	r2, #16
	str	r6, [sp, #12]
	movt	r3, #:upper16:snd_pcm_hw_rule_mulkdiv
	blx	r5
	and	r0, r0, r0, asr #31
.L1127:
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L1149:
	ldr	r2, [r10, #484]
	ldr	r3, [r10, #488]
	cmp	r2, r3
	ldrneb	r3, [r10, #492]	@ zero_extendqisi2
	orrne	r3, r3, #4
	strneb	r3, [r10, #492]
	b	.L1119
.L1150:
	ldr	r2, [r10, #496]
	ldr	r3, [r10, #500]
	cmp	r2, r3
	ldrneb	r3, [r10, #504]	@ zero_extendqisi2
	orrne	r3, r3, #4
	strneb	r3, [r10, #504]
	b	.L1121
.L1151:
	ldr	r2, [r10, #376]
	ldr	r3, [r10, #380]
	cmp	r2, r3
	ldrneb	r3, [r10, #384]	@ zero_extendqisi2
	orrne	r3, r3, #4
	strneb	r3, [r10, #384]
	b	.L1123
.L1152:
	ldr	r2, [r10, #388]
	ldr	r3, [r10, #392]
	cmp	r2, r3
	ldrneb	r3, [r10, #396]	@ zero_extendqisi2
	orrne	r3, r3, #4
	strneb	r3, [r10, #396]
	b	.L1125
.L1148:
	ldr	r2, [r10, #400]
	ldr	r3, [r10, #404]
	cmp	r2, r3
	ldrneb	r3, [r10, #408]	@ zero_extendqisi2
	orrne	r3, r3, #4
	strneb	r3, [r10, #408]
	b	.L1117
	.fnend
	.size	snd_pcm_hw_constraints_init, .-snd_pcm_hw_constraints_init
	.align	2
	.global	snd_pcm_hw_constraints_complete
	.type	snd_pcm_hw_constraints_complete, %function
snd_pcm_hw_constraints_complete:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r6, r0
	ldr	r4, [r0, #116]
	.pad #20
	sub	sp, sp, #20
	ldr	r3, [r4, #216]
	ands	r0, r3, #256
	movne	r2, #8
	moveq	r2, #0
	ands	r1, r3, #512
	orrne	r2, r2, #16
	tst	r3, #1
	beq	.L1156
	cmp	r0, #0
	orrne	r2, r2, #1
	cmp	r1, #0
	orrne	r2, r2, #2
	tst	r3, #1024
	orrne	r2, r2, #4
.L1156:
	movw	r5, #:lower16:snd_pcm_hw_constraint_mask
	mov	r0, r4
	movt	r5, #:upper16:snd_pcm_hw_constraint_mask
	mov	r1, #0
	blx	r5
	cmp	r0, #0
	blt	.L1159
	movw	ip, #:lower16:snd_pcm_hw_constraint_mask64
	mov	r0, r4
	movt	ip, #:upper16:snd_pcm_hw_constraint_mask64
	mov	r1, #1
	ldrd	r2, [r4, #224]
	blx	ip
	cmp	r0, #0
	blt	.L1159
	mov	r0, r4
	mov	r1, #2
	mov	r2, #1
	blx	r5
	cmp	r0, #0
	blt	.L1159
	movw	r5, #:lower16:snd_pcm_hw_constraint_minmax
	mov	r0, r4
	movt	r5, #:upper16:snd_pcm_hw_constraint_minmax
	mov	r1, #10
	ldr	r2, [r4, #244]
	ldr	r3, [r4, #248]
	blx	r5
	cmp	r0, #0
	blt	.L1159
	mov	r0, r4
	mov	r1, #11
	ldr	r2, [r4, #236]
	ldr	r3, [r4, #240]
	blx	r5
	cmp	r0, #0
	blt	.L1159
	mov	r0, r4
	mov	r1, #14
	ldr	r2, [r4, #256]
	ldr	r3, [r4, #260]
	blx	r5
	cmp	r0, #0
	blt	.L1159
	mov	r0, r4
	mov	r1, #15
	ldr	r2, [r4, #264]
	ldr	r3, [r4, #268]
	blx	r5
	cmp	r0, #0
	blt	.L1159
	mov	r0, r4
	mov	r1, #18
	ldr	r2, [r4, #256]
	ldr	r3, [r4, #252]
	blx	r5
	cmp	r0, #0
	blt	.L1159
	mov	r1, #18
	mvn	r0, #0
	movw	r3, #:lower16:snd_pcm_hw_rule_buffer_bytes_max
	movw	r7, #:lower16:snd_pcm_hw_rule_add
	mov	r2, r1
	str	r1, [sp, #4]
	str	r0, [sp, #8]
	movt	r3, #:upper16:snd_pcm_hw_rule_buffer_bytes_max
	str	r6, [sp]
	movt	r7, #:upper16:snd_pcm_hw_rule_add
	mov	r0, r4
	mov	r1, #0
	blx	r7
	cmp	r0, #0
	blt	.L1159
	ldr	r3, [r4, #556]
	cmp	r3, #0
	bne	.L1160
.L1163:
	ldr	r3, [r4, #232]
	ands	r1, r3, #-1073741824
	bne	.L1162
	add	ip, r4, #216
	mov	r2, #11
	mvn	r0, #0
	movw	r3, #:lower16:snd_pcm_hw_rule_rate
	str	r0, [sp, #8]
	movt	r3, #:upper16:snd_pcm_hw_rule_rate
	str	ip, [sp]
	mov	r0, r4
	str	r2, [sp, #4]
	blx	r7
	cmp	r0, #0
	blt	.L1159
.L1162:
	movw	r3, #:lower16:snd_pcm_hw_constraint_integer
	mov	r0, r4
	movt	r3, #:upper16:snd_pcm_hw_constraint_integer
	mov	r1, #13
	blx	r3
	mov	r0, #0
.L1159:
	add	sp, sp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L1160:
	mov	r0, r4
	mov	r1, #18
	mov	r2, #0
	blx	r5
	cmp	r0, #0
	bge	.L1163
	mvn	r0, #21
	b	.L1159
	.fnend
	.size	snd_pcm_hw_constraints_complete, .-snd_pcm_hw_constraints_complete
	.align	2
	.global	snd_pcm_open_substream
	.type	snd_pcm_open_substream, %function
snd_pcm_open_substream:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	.save {r4, r5, lr}
	movw	ip, #:lower16:snd_pcm_attach_substream
	.pad #12
	sub	sp, sp, #12
	mov	r4, r3
	movt	ip, #:upper16:snd_pcm_attach_substream
	add	r3, sp, #4
	blx	ip
	cmp	r0, #0
	blt	.L1191
	ldr	r0, [sp, #4]
	ldr	r3, [r0, #168]
	cmp	r3, #1
	ble	.L1192
	str	r0, [r4]
	mov	r0, #0
.L1191:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, pc}
.L1192:
	bl	snd_pcm_hw_constraints_init
	subs	r5, r0, #0
	blt	.L1198
	ldr	r0, [sp, #4]
	ldr	r3, [r0, #112]
	ldr	r3, [r3]
	blx	r3
	subs	r5, r0, #0
	blt	.L1194
	ldr	r3, [sp, #4]
	ldrb	r2, [r3, #188]	@ zero_extendqisi2
	mov	r0, r3
	orr	r2, r2, #1
	strb	r2, [r3, #188]
	bl	snd_pcm_hw_constraints_complete
	subs	r5, r0, #0
	blt	.L1199
	ldr	r3, [sp, #4]
	mov	r0, #0
	str	r3, [r4]
	b	.L1191
.L1198:
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:.LC8
	movw	ip, #:lower16:__snd_printk
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:.LC8
	movt	ip, #:upper16:__snd_printk
	mov	r0, #1
	movw	r2, #2038
	blx	ip
.L1194:
	ldr	r0, [sp, #4]
	ldr	r3, [r0, #168]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r0, #168]
	movgt	r0, r5
	bgt	.L1191
	bl	snd_pcm_release_substream.part.10
	mov	r0, r5
	b	.L1191
.L1199:
	movw	r1, #:lower16:.LC0
	movw	r3, #:lower16:.LC9
	movw	ip, #:lower16:__snd_printk
	movt	r1, #:upper16:.LC0
	movt	r3, #:upper16:.LC9
	movt	ip, #:upper16:__snd_printk
	mov	r0, #1
	movw	r2, #2049
	blx	ip
	b	.L1194
	.fnend
	.size	snd_pcm_open_substream, .-snd_pcm_open_substream
	.align	2
	.type	snd_pcm_open, %function
snd_pcm_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	subs	r6, r1, #0
	.pad #36
	sub	sp, sp, #36
	mov	r4, r0
	mov	r9, r2
	mvneq	fp, #18
	beq	.L1215
	movw	r3, #:lower16:snd_card_file_add
	ldr	r0, [r6]
	movt	r3, #:upper16:snd_card_file_add
	mov	r1, r4
	blx	r3
	subs	fp, r0, #0
	blt	.L1215
	ldr	r2, [r6]
	movw	r3, #:lower16:try_module_get
	movt	r3, #:upper16:try_module_get
	ldr	r0, [r2, #356]
	blx	r3
	cmp	r0, #0
	beq	.L1211
	mov	r1, sp
	mov	ip, #0
	bic	r3, r1, #8128
	str	ip, [sp, #12]
	bic	r3, r3, #63
	movw	ip, #:lower16:schedule
	ldr	lr, [r3, #12]
	add	r1, r6, #232
	movw	r2, #:lower16:default_wake_function
	movw	r3, #:lower16:add_wait_queue
	movt	r2, #:upper16:default_wake_function
	mov	r0, r1
	str	ip, [sp]
	movt	r3, #:upper16:add_wait_queue
	str	r1, [sp, #4]
	add	r5, r6, #208
	add	r1, sp, #12
	movw	r10, #:lower16:mutex_lock
	str	r2, [sp, #20]
	movt	r10, #:upper16:mutex_lock
	str	lr, [sp, #16]
	movw	r8, #:lower16:mutex_unlock
	blx	r3
	mov	r0, r5
	movt	r8, #:upper16:mutex_unlock
	blx	r10
	ldr	ip, [sp]
	mov	r2, sp
	bic	r7, r2, #8128
	bic	r7, r7, #63
	movt	ip, #:upper16:schedule
	mov	fp, ip
.L1208:
	mov	r0, r6
	mov	r1, r9
	mov	r2, r4
	add	r3, sp, #8
	bl	snd_pcm_open_substream
	cmp	r0, #0
	blt	.L1203
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L1212
	movw	r3, #:lower16:kmem_cache_alloc_trace
	movw	r1, #32976
	movt	r3, #:upper16:kmem_cache_alloc_trace
	mov	r2, #8
	blx	r3
	cmp	r0, #0
	beq	.L1216
.L1204:
	ldr	r3, [sp, #8]
	add	r1, sp, #12
	mov	fp, #0
	str	r3, [r0]
	ldr	r3, [sp, #8]
	ldr	r2, [r3, #168]
	cmp	r2, #1
	movweq	r2, #:lower16:pcm_release_private
	streq	r0, [r3, #164]
	movteq	r2, #:upper16:pcm_release_private
	streq	r2, [r3, #180]
	movw	r2, #:lower16:remove_wait_queue
	str	r0, [r4, #124]
	movt	r2, #:upper16:remove_wait_queue
	ldr	r0, [sp, #4]
	blx	r2
	mov	r0, r5
	blx	r8
.L1215:
	mov	r0, fp
	add	sp, sp, #36
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L1211:
	mvn	fp, #13
.L1202:
	movw	r2, #:lower16:snd_card_file_remove
	ldr	r0, [r6]
	mov	r1, r4
	movt	r2, #:upper16:snd_card_file_remove
	blx	r2
	mov	r0, fp
	add	sp, sp, #36
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L1212:
	mov	r0, #16
	b	.L1204
.L1203:
	cmn	r0, #11
	bne	.L1217
	ldr	r3, [r4, #32]
	tst	r3, #2048
	bne	.L1213
	ldr	r3, [r7, #12]
	mov	r1, #1
	str	r1, [r3]
@ 2148 "/media/system1/root/CM14/kernel/samsung/smdk4412/sound/core/pcm_native.c" 1
	dmb
@ 0 "" 2
	mov	r0, r5
	blx	r8
	blx	fp
	mov	r0, r5
	blx	r10
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #1
	beq	.L1208
	mov	fp, #65024
	movt	fp, 65535
	b	.L1207
.L1216:
	ldr	r0, [sp, #8]
	ldr	r3, [r0, #168]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r0, #168]
	ble	.L1218
.L1205:
	mvn	fp, #11
.L1207:
	movw	r2, #:lower16:remove_wait_queue
	add	r1, sp, #12
	movt	r2, #:upper16:remove_wait_queue
	ldr	r0, [sp, #4]
	blx	r2
	mov	r0, r5
	blx	r8
	ldr	r1, [r6]
	movw	r2, #:lower16:module_put
	movt	r2, #:upper16:module_put
	ldr	r0, [r1, #356]
	blx	r2
	b	.L1202
.L1213:
	mvn	fp, #15
	b	.L1207
.L1218:
	bl	snd_pcm_release_substream.part.10
	b	.L1205
.L1217:
	mov	fp, r0
	b	.L1207
	.fnend
	.size	snd_pcm_open, .-snd_pcm_open
	.align	2
	.type	snd_pcm_capture_open, %function
snd_pcm_capture_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:nonseekable_open
	movt	r3, #:upper16:nonseekable_open
	mov	r5, r0
	mov	r4, r1
	blx	r3
	cmp	r0, #0
	ldmltfd	sp!, {r3, r4, r5, pc}
	ldr	r0, [r5, #48]
	movw	r3, #:lower16:snd_lookup_minor_data
	movt	r3, #:upper16:snd_lookup_minor_data
	mov	r1, #24
	ubfx	r0, r0, #0, #20
	blx	r3
	mov	r2, #1
	mov	r1, r0
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, lr}
	b	snd_pcm_open
	.fnend
	.size	snd_pcm_capture_open, .-snd_pcm_capture_open
	.align	2
	.type	snd_pcm_playback_open, %function
snd_pcm_playback_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:nonseekable_open
	movt	r3, #:upper16:nonseekable_open
	mov	r5, r0
	mov	r4, r1
	blx	r3
	cmp	r0, #0
	ldmltfd	sp!, {r3, r4, r5, pc}
	ldr	r0, [r5, #48]
	movw	r3, #:lower16:snd_lookup_minor_data
	movt	r3, #:upper16:snd_lookup_minor_data
	mov	r1, #16
	ubfx	r0, r0, #0, #20
	blx	r3
	mov	r2, #0
	mov	r1, r0
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, lr}
	b	snd_pcm_open
	.fnend
	.size	snd_pcm_playback_open, .-snd_pcm_playback_open
	.global	snd_pcm_f_ops
	.global	snd_pcm_known_rates
	.global	snd_pcm_link_rwlock
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	snd_pcm_vm_ops_data, %object
	.size	snd_pcm_vm_ops_data, 20
snd_pcm_vm_ops_data:
	.word	snd_pcm_mmap_data_open
	.word	snd_pcm_mmap_data_close
	.space	12
	.type	snd_pcm_vm_ops_data_fault, %object
	.size	snd_pcm_vm_ops_data_fault, 20
snd_pcm_vm_ops_data_fault:
	.word	snd_pcm_mmap_data_open
	.word	snd_pcm_mmap_data_close
	.word	snd_pcm_mmap_data_fault
	.space	8
	.type	snd_pcm_f_ops, %object
	.size	snd_pcm_f_ops, 208
snd_pcm_f_ops:
	.word	0
	.word	no_llseek
	.space	4
	.word	snd_pcm_write
	.space	4
	.word	snd_pcm_aio_write
	.space	4
	.word	snd_pcm_playback_poll
	.word	snd_pcm_playback_ioctl
	.word	0
	.word	snd_pcm_mmap
	.word	snd_pcm_playback_open
	.space	4
	.word	snd_pcm_release
	.space	8
	.word	snd_pcm_fasync
	.space	8
	.word	0
	.space	24
	.word	0
	.word	no_llseek
	.word	snd_pcm_read
	.space	4
	.word	snd_pcm_aio_read
	.space	8
	.word	snd_pcm_capture_poll
	.word	snd_pcm_capture_ioctl
	.word	0
	.word	snd_pcm_mmap
	.word	snd_pcm_capture_open
	.space	4
	.word	snd_pcm_release
	.space	8
	.word	snd_pcm_fasync
	.space	8
	.word	0
	.space	24
	.type	snd_pcm_known_rates, %object
	.size	snd_pcm_known_rates, 12
snd_pcm_known_rates:
	.word	13
	.word	rates
	.space	4
	.section	___ksymtab+snd_pcm_stop,"a",%progbits
	.align	2
	.type	__ksymtab_snd_pcm_stop, %object
	.size	__ksymtab_snd_pcm_stop, 8
__ksymtab_snd_pcm_stop:
	.word	snd_pcm_stop
	.word	__kstrtab_snd_pcm_stop
	.section	___ksymtab+snd_pcm_suspend_all,"a",%progbits
	.align	2
	.type	__ksymtab_snd_pcm_suspend_all, %object
	.size	__ksymtab_snd_pcm_suspend_all, 8
__ksymtab_snd_pcm_suspend_all:
	.word	snd_pcm_suspend_all
	.word	__kstrtab_snd_pcm_suspend_all
	.section	___ksymtab+snd_pcm_suspend,"a",%progbits
	.align	2
	.type	__ksymtab_snd_pcm_suspend, %object
	.size	__ksymtab_snd_pcm_suspend, 8
__ksymtab_snd_pcm_suspend:
	.word	snd_pcm_suspend
	.word	__kstrtab_snd_pcm_suspend
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_snd_pcm_mmap_data, %object
	.size	__kstrtab_snd_pcm_mmap_data, 18
__kstrtab_snd_pcm_mmap_data:
	.ascii	"snd_pcm_mmap_data\000"
	.type	__kstrtab_snd_pcm_kernel_ioctl, %object
	.size	__kstrtab_snd_pcm_kernel_ioctl, 21
__kstrtab_snd_pcm_kernel_ioctl:
	.ascii	"snd_pcm_kernel_ioctl\000"
	.type	__kstrtab_snd_pcm_open_substream, %object
	.size	__kstrtab_snd_pcm_open_substream, 23
__kstrtab_snd_pcm_open_substream:
	.ascii	"snd_pcm_open_substream\000"
	.type	__kstrtab_snd_pcm_release_substream, %object
	.size	__kstrtab_snd_pcm_release_substream, 26
__kstrtab_snd_pcm_release_substream:
	.ascii	"snd_pcm_release_substream\000"
	.type	__kstrtab_snd_pcm_suspend_all, %object
	.size	__kstrtab_snd_pcm_suspend_all, 20
__kstrtab_snd_pcm_suspend_all:
	.ascii	"snd_pcm_suspend_all\000"
	.type	__kstrtab_snd_pcm_suspend, %object
	.size	__kstrtab_snd_pcm_suspend, 16
__kstrtab_snd_pcm_suspend:
	.ascii	"snd_pcm_suspend\000"
	.type	__kstrtab_snd_pcm_stop, %object
	.size	__kstrtab_snd_pcm_stop, 13
__kstrtab_snd_pcm_stop:
	.ascii	"snd_pcm_stop\000"
	.type	__kstrtab_snd_pcm_hw_refine, %object
	.size	__kstrtab_snd_pcm_hw_refine, 18
__kstrtab_snd_pcm_hw_refine:
	.ascii	"snd_pcm_hw_refine\000"
	.type	__kstrtab_snd_pcm_link_rwlock, %object
	.size	__kstrtab_snd_pcm_link_rwlock, 20
__kstrtab_snd_pcm_link_rwlock:
	.ascii	"snd_pcm_link_rwlock\000"
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	rates, %object
	.size	rates, 52
rates:
	.word	5512
	.word	8000
	.word	11025
	.word	16000
	.word	22050
	.word	32000
	.word	44100
	.word	48000
	.word	64000
	.word	88200
	.word	96000
	.word	176400
	.word	192000
	.type	snd_pcm_link_rwsem, %object
	.size	snd_pcm_link_rwsem, 20
snd_pcm_link_rwsem:
	.word	0
	.word	0
	.space	4
	.word	snd_pcm_link_rwsem+12
	.word	snd_pcm_link_rwsem+12
	.type	snd_pcm_action_stop, %object
	.size	snd_pcm_action_stop, 16
snd_pcm_action_stop:
	.word	snd_pcm_pre_stop
	.word	snd_pcm_do_stop
	.space	4
	.word	snd_pcm_post_stop
	.type	snd_pcm_action_suspend, %object
	.size	snd_pcm_action_suspend, 16
snd_pcm_action_suspend:
	.word	snd_pcm_pre_suspend
	.word	snd_pcm_do_suspend
	.space	4
	.word	snd_pcm_post_suspend
	.type	snd_pcm_action_pause, %object
	.size	snd_pcm_action_pause, 16
snd_pcm_action_pause:
	.word	snd_pcm_pre_pause
	.word	snd_pcm_do_pause
	.word	snd_pcm_undo_pause
	.word	snd_pcm_post_pause
	.type	snd_pcm_action_prepare, %object
	.size	snd_pcm_action_prepare, 16
snd_pcm_action_prepare:
	.word	snd_pcm_pre_prepare
	.word	snd_pcm_do_prepare
	.space	4
	.word	snd_pcm_post_prepare
	.type	snd_pcm_action_reset, %object
	.size	snd_pcm_action_reset, 16
snd_pcm_action_reset:
	.word	snd_pcm_pre_reset
	.word	snd_pcm_do_reset
	.space	4
	.word	snd_pcm_post_reset
	.type	snd_pcm_action_start, %object
	.size	snd_pcm_action_start, 16
snd_pcm_action_start:
	.word	snd_pcm_pre_start
	.word	snd_pcm_do_start
	.word	snd_pcm_undo_start
	.word	snd_pcm_post_start
	.type	snd_pcm_action_resume, %object
	.size	snd_pcm_action_resume, 16
snd_pcm_action_resume:
	.word	snd_pcm_pre_resume
	.word	snd_pcm_do_resume
	.word	snd_pcm_undo_resume
	.word	snd_pcm_post_resume
	.type	snd_pcm_action_drain_init, %object
	.size	snd_pcm_action_drain_init, 16
snd_pcm_action_drain_init:
	.word	snd_pcm_pre_drain_init
	.word	snd_pcm_do_drain_init
	.space	4
	.word	snd_pcm_post_drain_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"/media/system1/root/CM14/kernel/samsung/smdk4412/so"
	.ascii	"und/core/pcm_native.c\000"
	.space	3
.LC1:
	.ascii	"BUG? (%s)\012\000"
	.space	1
.LC2:
	.ascii	"!(substream) || !(substream)->runtime\000"
	.space	2
.LC3:
	.ascii	"!substream\000"
	.space	1
.LC4:
	.ascii	"playback drain error (DMA or IRQ trouble?)\012\000"
.LC5:
	.ascii	"unknown ioctl = 0x%x\012\000"
	.space	2
.LC6:
	.ascii	"substream->stream != SNDRV_PCM_STREAM_PLAYBACK\000"
	.space	1
.LC7:
	.ascii	"substream->stream != SNDRV_PCM_STREAM_CAPTURE\000"
	.space	2
.LC8:
	.ascii	"snd_pcm_hw_constraints_init failed\012\000"
.LC9:
	.ascii	"snd_pcm_hw_constraints_complete failed\012\000"
	.section	___ksymtab+snd_pcm_link_rwlock,"a",%progbits
	.align	2
	.type	__ksymtab_snd_pcm_link_rwlock, %object
	.size	__ksymtab_snd_pcm_link_rwlock, 8
__ksymtab_snd_pcm_link_rwlock:
	.word	snd_pcm_link_rwlock
	.word	__kstrtab_snd_pcm_link_rwlock
	.section	___ksymtab+snd_pcm_hw_refine,"a",%progbits
	.align	2
	.type	__ksymtab_snd_pcm_hw_refine, %object
	.size	__ksymtab_snd_pcm_hw_refine, 8
__ksymtab_snd_pcm_hw_refine:
	.word	snd_pcm_hw_refine
	.word	__kstrtab_snd_pcm_hw_refine
	.section	___ksymtab+snd_pcm_open_substream,"a",%progbits
	.align	2
	.type	__ksymtab_snd_pcm_open_substream, %object
	.size	__ksymtab_snd_pcm_open_substream, 8
__ksymtab_snd_pcm_open_substream:
	.word	snd_pcm_open_substream
	.word	__kstrtab_snd_pcm_open_substream
	.section	___ksymtab+snd_pcm_kernel_ioctl,"a",%progbits
	.align	2
	.type	__ksymtab_snd_pcm_kernel_ioctl, %object
	.size	__ksymtab_snd_pcm_kernel_ioctl, 8
__ksymtab_snd_pcm_kernel_ioctl:
	.word	snd_pcm_kernel_ioctl
	.word	__kstrtab_snd_pcm_kernel_ioctl
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	snd_pcm_link_rwlock, %object
	.size	snd_pcm_link_rwlock, 8
snd_pcm_link_rwlock:
	.space	8
	.section	___ksymtab+snd_pcm_mmap_data,"a",%progbits
	.align	2
	.type	__ksymtab_snd_pcm_mmap_data, %object
	.size	__ksymtab_snd_pcm_mmap_data, 8
__ksymtab_snd_pcm_mmap_data:
	.word	snd_pcm_mmap_data
	.word	__kstrtab_snd_pcm_mmap_data
	.section	___ksymtab+snd_pcm_release_substream,"a",%progbits
	.align	2
	.type	__ksymtab_snd_pcm_release_substream, %object
	.size	__ksymtab_snd_pcm_release_substream, 8
__ksymtab_snd_pcm_release_substream:
	.word	snd_pcm_release_substream
	.word	__kstrtab_snd_pcm_release_substream
	.ident	"GCC: (GNU) 4.8"
