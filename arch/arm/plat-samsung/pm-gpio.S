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
	.file	"pm-gpio.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_pm_1bit_save, %function
s3c_gpio_pm_1bit_save:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #72]
	ldr	r2, [r3]
	str	r2, [r0, #96]
	ldr	r3, [r3, #4]
	str	r3, [r0, #100]
	bx	lr
	.fnend
	.size	s3c_gpio_pm_1bit_save, .-s3c_gpio_pm_1bit_save
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_pm_1bit_resume, %function
s3c_gpio_pm_1bit_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #72]
	ldr	r1, [r0, #96]
	ldr	r0, [r0, #100]
	ldr	r2, [r3]
	ldr	ip, [r3, #4]
	orr	r2, r2, r1
	str	r2, [r3]
	str	r0, [r3, #4]
	str	r1, [r3]
	bx	lr
	.fnend
	.size	s3c_gpio_pm_1bit_resume, .-s3c_gpio_pm_1bit_resume
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_pm_2bit_save, %function
s3c_gpio_pm_2bit_save:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #72]
	ldr	r2, [r3]
	str	r2, [r0, #96]
	ldr	r2, [r3, #4]
	str	r2, [r0, #100]
	ldr	r3, [r3, #8]
	str	r3, [r0, #104]
	bx	lr
	.fnend
	.size	s3c_gpio_pm_2bit_save, .-s3c_gpio_pm_2bit_save
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_pm_2bit_resume, %function
s3c_gpio_pm_2bit_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r1, #0
	ldr	r6, [r0, #72]
	mov	r5, r1
	mov	ip, #3
	ldr	r3, [r0, #104]
	ldr	lr, [r0, #96]
	ldr	r4, [r6]
	ldr	r0, [r0, #100]
	ldr	r2, [r6, #4]
	str	r3, [r6, #8]
	b	.L9
.L17:
	cmp	r2, #0
	bne	.L6
.L8:
	orr	r5, r5, ip
.L6:
	add	r1, r1, #2
	lsl	ip, ip, #2
	cmp	r1, #32
	beq	.L16
.L9:
	and	r3, r4, ip
	and	r2, lr, ip
	lsr	r3, r3, r1
	lsr	r2, r2, r1
	cmp	r3, r2
	beq	.L6
	cmp	r3, #1
	bhi	.L17
	cmp	r3, #0
	bne	.L8
	cmp	r2, #1
	bne	.L8
	add	r1, r1, #2
	lsl	ip, ip, #2
	cmp	r1, #32
	bne	.L9
.L16:
	eor	r3, r4, lr
	and	r5, r5, r3
	eor	r4, r4, r5
	str	r4, [r6]
	str	r0, [r6, #4]
	str	lr, [r6]
	pop	{r4, r5, r6, pc}
	.fnend
	.size	s3c_gpio_pm_2bit_resume, .-s3c_gpio_pm_2bit_resume
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_pm_4bit_save, %function
s3c_gpio_pm_4bit_save:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #72]
	ldrh	r1, [r0, #52]
	ldr	r2, [r3]
	cmp	r1, #8
	str	r2, [r0, #100]
	ldr	r2, [r3, #4]
	str	r2, [r0, #104]
	ldr	r2, [r3, #8]
	str	r2, [r0, #108]
	ldrhi	r3, [r3, #-4]
	strhi	r3, [r0, #96]
	bx	lr
	.fnend
	.size	s3c_gpio_pm_4bit_save, .-s3c_gpio_pm_4bit_save
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_pm_4bit_mask, %function
s3c_gpio_pm_4bit_mask:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	mov	lr, #15
	mov	r0, ip
.L24:
	and	r3, r4, lr
	and	r2, r1, lr
	lsr	r3, r3, ip
	lsr	r2, r2, ip
	cmp	r3, r2
	beq	.L21
	cmp	r3, #1
	bls	.L22
	cmp	r2, #0
	bne	.L21
.L23:
	orr	r0, r0, lr
.L21:
	add	ip, ip, #4
	lsl	lr, lr, #4
	cmp	ip, #16
	bne	.L24
	pop	{r4, pc}
.L22:
	cmp	r3, #0
	bne	.L23
	cmp	r2, #1
	bne	.L23
	b	.L21
	.fnend
	.size	s3c_gpio_pm_4bit_mask, .-s3c_gpio_pm_4bit_mask
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpio_pm_4bit_resume, %function
s3c_gpio_pm_4bit_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	ldr	r4, [r0, #72]
	ldr	r6, [r0, #100]
	ldr	r3, [r4, #4]
	ldr	r3, [r4]
	ldr	r7, [r4]
	mov	r1, r6
	mov	r0, r7
	eor	r6, r6, r7
	bl	s3c_gpio_pm_4bit_mask
	and	r6, r6, r0
	eor	r6, r6, r7
	str	r6, [r4]
	ldrh	r3, [r5, #52]
	cmp	r3, #8
	bhi	.L37
.L32:
	ldr	r3, [r5, #104]
	str	r3, [r4, #4]
	ldr	r3, [r5, #100]
	str	r3, [r4]
	ldrh	r3, [r5, #52]
	cmp	r3, #8
	ldrhi	r3, [r5, #96]
	strhi	r3, [r4, #-4]
	ldr	r3, [r5, #104]
	str	r3, [r4, #4]
	ldr	r3, [r5, #108]
	str	r3, [r4, #8]
	ldrh	r3, [r5, #52]
	cmp	r3, #8
	ldrhi	r3, [r4, #-4]
	ldr	r3, [r4]
	pop	{r4, r5, r6, r7, r8, pc}
.L37:
	ldr	r8, [r5, #72]
	ldr	r3, [r4, #-4]
	ldr	r6, [r5, #96]
	ldr	r7, [r8, #-4]
	mov	r1, r6
	mov	r0, r7
	eor	r6, r6, r7
	bl	s3c_gpio_pm_4bit_mask
	and	r6, r6, r0
	eor	r6, r6, r7
	str	r6, [r8, #-4]
	b	.L32
	.fnend
	.size	s3c_gpio_pm_4bit_resume, .-s3c_gpio_pm_4bit_resume
	.align	2
	.global	s3c_pm_save_gpios
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_pm_save_gpios, %function
s3c_pm_save_gpios:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:.LANCHOR0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movt	r3, #:upper16:.LANCHOR0
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L57
.L47:
	movw	r7, #:lower16:s3c_gpios
	mov	r4, #0
	movt	r7, #:upper16:s3c_gpios
	b	.L46
.L58:
	ldr	r5, [r7, r4, lsl #2]
	cmp	r5, #0
	mov	r0, r5
	beq	.L42
	ldr	r3, [r5, #68]
	cmp	r3, #0
	beq	.L45
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L45
	blx	r3
.L45:
	ldrh	r3, [r5, #52]
	add	r4, r4, r3
	cmp	r4, r6
	popcs	{r4, r5, r6, r7, r8, pc}
.L46:
	cmp	r4, #328
	bls	.L58
.L42:
	add	r4, r4, #1
	cmp	r4, r6
	bcc	.L46
	pop	{r4, r5, r6, r7, r8, pc}
.L57:
	movw	r2, #:lower16:samsung_cpu_id
	mov	r1, #0
	movt	r2, #:upper16:samsung_cpu_id
	movt	r1, 17186
	ldr	r2, [r2]
	lsr	r2, r2, #17
	lsl	r2, r2, #17
	cmn	r2, #465567744
	cmpne	r2, r1
	movweq	r6, #289
	movwne	r6, #329
	str	r6, [r3]
	b	.L47
	.fnend
	.size	s3c_pm_save_gpios, .-s3c_pm_save_gpios
	.align	2
	.global	s3c_pm_restore_gpios
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_pm_restore_gpios, %function
s3c_pm_restore_gpios:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:.LANCHOR0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movt	r3, #:upper16:.LANCHOR0
	ldr	r6, [r3]
	cmp	r6, #0
	beq	.L78
.L68:
	movw	r7, #:lower16:s3c_gpios
	mov	r4, #0
	movt	r7, #:upper16:s3c_gpios
	b	.L67
.L79:
	ldr	r5, [r7, r4, lsl #2]
	cmp	r5, #0
	mov	r0, r5
	beq	.L63
	ldr	r3, [r5, #68]
	cmp	r3, #0
	beq	.L66
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L66
	blx	r3
.L66:
	ldrh	r3, [r5, #52]
	add	r4, r4, r3
	cmp	r4, r6
	popcs	{r4, r5, r6, r7, r8, pc}
.L67:
	cmp	r4, #328
	bls	.L79
.L63:
	add	r4, r4, #1
	cmp	r4, r6
	bcc	.L67
	pop	{r4, r5, r6, r7, r8, pc}
.L78:
	movw	r2, #:lower16:samsung_cpu_id
	mov	r1, #0
	movt	r2, #:upper16:samsung_cpu_id
	movt	r1, 17186
	ldr	r2, [r2]
	lsr	r2, r2, #17
	lsl	r2, r2, #17
	cmn	r2, #465567744
	cmpne	r2, r1
	movweq	r6, #289
	movwne	r6, #329
	str	r6, [r3]
	b	.L68
	.fnend
	.size	s3c_pm_restore_gpios, .-s3c_pm_restore_gpios
	.global	s3c_gpio_pm_4bit
	.global	s3c_gpio_pm_2bit
	.global	s3c_gpio_pm_1bit
	.data
	.align	2
	.type	s3c_gpio_pm_4bit, %object
	.size	s3c_gpio_pm_4bit, 8
s3c_gpio_pm_4bit:
	.word	s3c_gpio_pm_4bit_save
	.word	s3c_gpio_pm_4bit_resume
	.type	s3c_gpio_pm_2bit, %object
	.size	s3c_gpio_pm_2bit, 8
s3c_gpio_pm_2bit:
	.word	s3c_gpio_pm_2bit_save
	.word	s3c_gpio_pm_2bit_resume
	.type	s3c_gpio_pm_1bit, %object
	.size	s3c_gpio_pm_1bit, 8
s3c_gpio_pm_1bit:
	.word	s3c_gpio_pm_1bit_save
	.word	s3c_gpio_pm_1bit_resume
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	gpio_max_nr.11069, %object
	.size	gpio_max_nr.11069, 4
gpio_max_nr.11069:
	.space	4
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
