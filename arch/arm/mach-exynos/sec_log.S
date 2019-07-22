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
	.file	"sec_log.c"

	.text
	.align	2
	.type	emit_sec_log_char, %function
emit_sec_log_char:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r1, [r3]
	cmp	r1, #0
	bxeq	lr
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bxeq	lr
	ldr	r3, [r3, #8]
	ldr	ip, [r2]
	sub	r3, r3, #1
	and	r3, r3, ip
	strb	r0, [r1, r3]
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	bx	lr
	.fnend
	.size	emit_sec_log_char, .-emit_sec_log_char
	.align	2
	.type	sec_log_setup, %function
sec_log_setup:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #28
	sub	sp, sp, #28
	add	r1, sp, #24
	movw	r3, #:lower16:memparse
	movt	r3, #:upper16:memparse
	str	r0, [r1, #-12]!
	blx	r3
	subs	r4, r0, #0
	mov	r1, #0
	str	r1, [sp, #20]
	beq	.L12
	sub	r3, r4, #1
	mov	r5, #1
@ 268 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/bitops.h" 1
	clz	r3, r3
@ 0 "" 2
	rsb	r3, r3, #32
	cmp	r4, r5, asl r3
	beq	.L27
.L12:
	mov	r0, #0
	add	sp, sp, #28
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L27:
	ldr	r0, [sp, #12]
	ldrb	r6, [r0]	@ zero_extendqisi2
	cmp	r6, #64
	bne	.L12
	movw	r3, #:lower16:_kstrtoul
	add	r0, r0, r5
	movt	r3, #:upper16:_kstrtoul
	add	r2, sp, #20
	blx	r3
	cmp	r0, #0
	bne	.L12
	ldr	r0, [sp, #20]
	movw	r3, #:lower16:reserve_bootmem
	movt	r3, #:upper16:reserve_bootmem
	add	r1, r4, #8
	mov	r2, r5
	sub	r0, r0, #8
	blx	r3
	subs	r8, r0, #0
	bne	.L28
	ldr	ip, [sp, #20]
	movw	r3, #:lower16:.LANCHOR2
	movt	r3, #:upper16:.LANCHOR2
	add	lr, r4, #1048576
	movw	r2, #:lower16:iotable_init
	mov	r1, r5
	sub	ip, ip, #1048576
	mov	r0, r3
	mov	ip, ip, lsr #12
	str	lr, [r3, #8]
	movt	r2, #:upper16:iotable_init
	str	ip, [r3, #4]
	movw	r7, #:lower16:.LANCHOR0
	blx	r2
	movw	r3, #65532
	mov	ip, #0
	movt	ip, 64800
	mvn	r9, #48234496
	movt	r7, #:upper16:.LANCHOR0
	movt	r3, 64799
	movw	r0, #:lower16:.LC1
	movw	r1, #:lower16:.LANCHOR1
	movw	r5, #:lower16:printk
	stmib	r7, {r3, r4}
	str	ip, [r7]
	movt	r0, #:upper16:.LC1
	ldr	r3, [r9, #-3]
	movt	r1, #:upper16:.LANCHOR1
	ldr	r2, [r9, #-7]
	movt	r5, #:upper16:printk
	str	r4, [sp, #4]
	movw	r4, #20300
	str	ip, [sp]
	movt	r4, 19783
	blx	r5
	ldr	r3, [r9, #-7]
	cmp	r3, r4
	bne	.L29
	ldr	r0, [r7, #4]
	movw	r3, #:lower16:__alloc_bootmem
	mov	r1, r6
	movt	r3, #:upper16:__alloc_bootmem
	mvn	r2, #0
	ldr	ip, [r0]
@ 175 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/memory.h" 1
	@ __pv_stub
1:	add	r2, r2, #-2130706432
	.pushsection .pv_table,"a"
	.long	1b
	.popsection

@ 0 "" 2
	cmp	ip, #524288
	movcs	ip, #524288
	mov	r0, ip
	str	ip, [r7, #12]
	blx	r3
	ldr	r1, [r7, #12]
	mov	r3, r0
	str	r0, [r7, #16]
	cmp	r1, #0
	beq	.L17
	cmp	r0, #0
	beq	.L17
	ldr	r0, [r7, #8]
	mov	r2, r8
	ldmia	r7, {r4, lr}
	sub	r0, r0, #1
.L19:
	ldr	ip, [lr]
	rsb	ip, r1, ip
	add	ip, ip, r2
	and	ip, ip, r0
	ldrb	ip, [r4, ip]	@ zero_extendqisi2
	strb	ip, [r3, r2]
	add	r2, r2, #1
	cmp	r2, r1
	bne	.L19
	movw	r0, #:lower16:.LC3
	ldr	r1, .L30
	movt	r0, #:upper16:.LC3
	blx	r5
.L16:
	movw	r0, #:lower16:emit_sec_log_char
	movw	r3, #:lower16:register_log_char_hook
	movt	r0, #:upper16:emit_sec_log_char
	movt	r3, #:upper16:register_log_char_hook
	blx	r3
	b	.L12
.L28:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR1
	movw	ip, #:lower16:printk
	mov	r2, r4
	movt	r1, #:upper16:.LANCHOR1
	movt	ip, #:upper16:printk
	ldr	r3, [sp, #20]
	movt	r0, #:upper16:.LC0
	blx	ip
	b	.L12
.L17:
	movw	r0, #:lower16:.LC4
	mov	r2, r1
	movt	r0, #:upper16:.LC4
	ldr	r1, .L30
	blx	r5
	b	.L16
.L29:
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LANCHOR1
	movt	r0, #:upper16:.LC2
	movt	r1, #:upper16:.LANCHOR1
	blx	r5
	ldr	r3, [r7, #4]
	str	r8, [r3]
	str	r4, [r9, #-7]
	b	.L16
.L31:
	.align	2
.L30:
	.word	.LANCHOR1+16
	.fnend
	.size	sec_log_setup, .-sec_log_setup
	.align	2
	.type	sec_log_read_old, %function
sec_log_read_old:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:.LANCHOR0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movt	ip, #:upper16:.LANCHOR0
	ldrd	r4, [r3]
	mov	r8, r3
	mov	r7, #0
	ldr	r3, [ip, #12]
	mov	r6, r3
	cmp	r4, r6
	sbcs	r0, r5, r7
	bge	.L35
	mov	r6, sp
	rsb	r3, r4, r3
	bic	r0, r6, #8128
	cmp	r3, r2
	movcc	r2, r3
	bic	r0, r0, #63
	mov	r6, r2
	ldr	r3, [r0, #8]
@ 448 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/include/asm/uaccess.h" 1
	adds r0, r1, r2; sbcccs r0, r0, r3; movcc r3, #0
@ 0 "" 2
	cmp	r3, #0
	ldr	ip, [ip, #16]
	beq	.L37
.L34:
	cmp	r2, #0
	bne	.L36
	ldrd	r2, [r8]
	mov	r0, r6
	adds	r2, r2, r6
	adc	r3, r3, r6, asr #31
	strd	r2, [r8]
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L35:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L37:
	movw	r3, #:lower16:__copy_to_user
	mov	r0, r1
	movt	r3, #:upper16:__copy_to_user
	add	r1, ip, r4
	blx	r3
	mov	r2, r0
	b	.L34
.L36:
	mvn	r0, #13
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.fnend
	.size	sec_log_read_old, .-sec_log_read_old
	.align	2
	.type	sec_log_late_init, %function
sec_log_late_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L39
	movw	r0, #:lower16:.LC5
	movw	r3, #:lower16:create_proc_entry
	movt	r0, #:upper16:.LC5
	movt	r3, #:upper16:create_proc_entry
	movw	r1, #33060
	mov	r2, #0
	blx	r3
	cmp	r0, #0
	beq	.L44
	ldr	r2, [r4, #12]
	mov	r1, #0
	ldr	r3, .L45
	str	r1, [r0, #20]
	str	r2, [r0, #16]
	str	r3, [r0, #28]
.L39:
	mov	r0, #0
	ldmfd	sp!, {r4, pc}
.L44:
	movw	r0, #:lower16:.LC6
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	ldr	r1, .L45+4
	movt	r0, #:upper16:.LC6
	blx	r3
	b	.L39
.L46:
	.align	2
.L45:
	.word	.LANCHOR1+56
	.word	.LANCHOR1+36
	.fnend
	.size	sec_log_late_init, .-sec_log_late_init
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.18879, %object
	.size	__func__.18879, 14
__func__.18879:
	.ascii	"sec_log_setup\000"
	.space	2
	.type	__func__.18895, %object
	.size	__func__.18895, 17
__func__.18895:
	.ascii	"sec_log_save_old\000"
	.space	3
	.type	__func__.18912, %object
	.size	__func__.18912, 18
__func__.18912:
	.ascii	"sec_log_late_init\000"
	.space	2
	.type	last_kmsg_file_ops, %object
	.size	last_kmsg_file_ops, 104
last_kmsg_file_ops:
	.word	0
	.space	4
	.word	sec_log_read_old
	.space	92
	.type	__setup_str_sec_log_setup, %object
	.size	__setup_str_sec_log_setup, 9
__setup_str_sec_log_setup:
	.ascii	"sec_log=\000"
	.section	.initcall7.init,"aw",%progbits
	.align	2
	.type	__initcall_sec_log_late_init7, %object
	.size	__initcall_sec_log_late_init7, 4
__initcall_sec_log_late_init7:
	.word	sec_log_late_init
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	log_buf_iodesc, %object
	.size	log_buf_iodesc, 16
log_buf_iodesc:
	.word	-49283072
	.space	8
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>%s: failed reserving size %d + 8 at base 0x%lx -"
	.ascii	" 8\012\000"
	.space	1
.LC1:
	.ascii	"<6>%s: *sec_log_mag:%x *sec_log_ptr:%x sec_log_buf:"
	.ascii	"%p sec_log_size:%d\012\000"
	.space	1
.LC2:
	.ascii	"<6>%s: no old log found\012\000"
	.space	3
.LC3:
	.ascii	"<6>%s: saved old log at %d@%p\012\000"
	.space	1
.LC4:
	.ascii	"<3>%s: failed saving old log %d@%p\012\000"
.LC5:
	.ascii	"last_kmsg\000"
	.space	2
.LC6:
	.ascii	"<3>%s: failed to create proc entry\012\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	sec_log_buf, %object
	.size	sec_log_buf, 4
sec_log_buf:
	.space	4
	.type	sec_log_ptr, %object
	.size	sec_log_ptr, 4
sec_log_ptr:
	.space	4
	.type	sec_log_size, %object
	.size	sec_log_size, 4
sec_log_size:
	.space	4
	.type	last_kmsg_size, %object
	.size	last_kmsg_size, 4
last_kmsg_size:
	.space	4
	.type	last_kmsg_buffer, %object
	.size	last_kmsg_buffer, 4
last_kmsg_buffer:
	.space	4
	.section	.init.setup,"aw",%progbits
	.align	2
	.type	__setup_sec_log_setup, %object
	.size	__setup_sec_log_setup, 12
__setup_sec_log_setup:
	.word	__setup_str_sec_log_setup
	.word	sec_log_setup
	.word	0
	.ident	"GCC: (GNU) 4.8"
