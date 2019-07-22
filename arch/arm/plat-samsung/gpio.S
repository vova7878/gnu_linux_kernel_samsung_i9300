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
	.file	"gpio.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpiolib_input, %function
s3c_gpiolib_input:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	ldr	r6, [r0, #72]
	add	r4, r0, #88
	mov	r0, r4
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	mov	r5, r1
	blx	r3
	ldr	r2, [r6]
	lsl	r5, r5, #1
	mov	ip, #3
	movw	r3, #:lower16:_raw_spin_unlock_irqrestore
	mov	r1, r0
	movt	r3, #:upper16:_raw_spin_unlock_irqrestore
	mov	r0, r4
	bic	r2, r2, ip, lsl r5
	str	r2, [r6]
	blx	r3
	mov	r0, #0
	pop	{r4, r5, r6, pc}
	.fnend
	.size	s3c_gpiolib_input, .-s3c_gpiolib_input
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpiolib_output, %function
s3c_gpiolib_output:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	ldr	r4, [r0, #72]
	add	r6, r0, #88
	mov	r0, r6
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	mov	r5, r1
	mov	r7, r2
	blx	r3
	ldr	r3, [r4, #4]
	mov	ip, #1
	lsl	r2, ip, r5
	cmp	r7, #0
	lsl	r5, r5, #1
	mov	lr, #3
	bic	r3, r3, r2
	orrne	r3, r3, r2
	mov	ip, #1
	str	r3, [r4, #4]
	mov	r1, r0
	ldr	r2, [r4]
	mov	r0, r6
	movw	r6, #:lower16:_raw_spin_unlock_irqrestore
	movt	r6, #:upper16:_raw_spin_unlock_irqrestore
	bic	r2, r2, lr, lsl r5
	orr	r2, r2, ip, lsl r5
	str	r2, [r4]
	str	r3, [r4, #4]
	blx	r6
	mov	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
	.fnend
	.size	s3c_gpiolib_output, .-s3c_gpiolib_output
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpiolib_set, %function
s3c_gpiolib_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r3, #:lower16:_raw_spin_lock_irqsave
	ldr	r5, [r0, #72]
	add	r4, r0, #88
	mov	r0, r4
	movt	r3, #:upper16:_raw_spin_lock_irqsave
	mov	r6, r1
	mov	r7, r2
	blx	r3
	ldr	r3, [r5, #4]
	mov	ip, #1
	lsl	r2, ip, r6
	cmp	r7, #0
	mov	r1, r0
	bic	r3, r3, r2
	mov	r0, r4
	orrne	r3, r3, r2
	movw	r2, #:lower16:_raw_spin_unlock_irqrestore
	str	r3, [r5, #4]
	movt	r2, #:upper16:_raw_spin_unlock_irqrestore
	pop	{r4, r5, r6, r7, r8, lr}
	bx	r2	@ indirect register sibling call
	.fnend
	.size	s3c_gpiolib_set, .-s3c_gpiolib_set
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpiolib_get, %function
s3c_gpiolib_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #72]
	ldr	r0, [r3, #4]
	lsr	r0, r0, r1
	and	r0, r0, #1
	bx	lr
	.fnend
	.size	s3c_gpiolib_get, .-s3c_gpiolib_get
	.align	2
	.global	s3c_gpiolib_add
	.syntax unified
	.arm
	.fpu softvfp
	.type	s3c_gpiolib_add, %function
s3c_gpiolib_add:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	ldr	r3, [r0, #72]
	cmp	r3, #0
	beq	.L43
	ldr	r1, [r0]
	cmp	r1, #0
	beq	.L44
	ldrh	r3, [r0, #52]
	cmp	r3, #0
	beq	.L45
	ldr	r3, [r0, #20]
	mov	r2, #0
	str	r2, [r0, #88]
	mov	r4, r0
	str	r2, [r0, #92]
	cmp	r3, r2
	movweq	r3, #:lower16:s3c_gpiolib_input
	movteq	r3, #:upper16:s3c_gpiolib_input
	streq	r3, [r0, #20]
	ldr	r3, [r0, #28]
	cmp	r3, #0
	movweq	r3, #:lower16:s3c_gpiolib_output
	movteq	r3, #:upper16:s3c_gpiolib_output
	streq	r3, [r0, #28]
	ldr	r3, [r0, #36]
	cmp	r3, #0
	movweq	r3, #:lower16:s3c_gpiolib_set
	movteq	r3, #:upper16:s3c_gpiolib_set
	streq	r3, [r0, #36]
	ldr	r3, [r0, #24]
	cmp	r3, #0
	movweq	r3, #:lower16:s3c_gpiolib_get
	movteq	r3, #:upper16:s3c_gpiolib_get
	streq	r3, [r0, #24]
	ldr	r3, [r0, #68]
	cmp	r3, #0
	beq	.L25
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L26
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L26
.L27:
	movw	r3, #:lower16:gpiochip_add
	mov	r0, r4
	movt	r3, #:upper16:gpiochip_add
	blx	r3
	cmp	r0, #0
	poplt	{r4, pc}
	ldrh	r2, [r4, #52]
	ldr	r3, [r4, #48]
	cmp	r2, #0
	popeq	{r4, pc}
	cmp	r3, #328
	bhi	.L30
	movw	r2, #:lower16:.LANCHOR0
	rsb	r0, r3, #328
	movt	r2, #:upper16:.LANCHOR0
	add	r0, r0, #1
	add	r2, r2, r3, lsl #2
	mov	r3, #0
.L32:
	str	r4, [r2], #4
	add	r3, r3, #1
	ldrh	r1, [r4, #52]
	cmp	r3, r1
	popge	{r4, pc}
	cmp	r3, r0
	bne	.L32
.L30:
	.syntax divided
@ 32 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/gpio.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/gpio.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 32, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L43:
	.syntax divided
@ 131 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/gpio.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/gpio.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 131, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L44:
	.syntax divided
@ 132 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/gpio.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/gpio.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 132, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L45:
	.syntax divided
@ 133 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/gpio.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-samsung/gpio.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 133, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L26:
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	b	.L27
.L25:
	movw	r0, #:lower16:.LC1
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC1
	blx	r3
	b	.L27
	.fnend
	.size	s3c_gpiolib_add, .-s3c_gpiolib_add
	.align	2
	.global	samsung_gpiolib_to_irq
	.syntax unified
	.arm
	.fpu softvfp
	.type	samsung_gpiolib_to_irq, %function
samsung_gpiolib_to_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #76]
	add	r0, r1, r0
	bx	lr
	.fnend
	.size	samsung_gpiolib_to_irq, .-samsung_gpiolib_to_irq
	.global	s3c_gpios
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	s3c_gpios, %object
	.size	s3c_gpios, 1316
s3c_gpios:
	.space	1316
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>gpio: %s has missing PM functions\012\000"
	.space	2
.LC1:
	.ascii	"<3>gpio: %s has no PM function\012\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
