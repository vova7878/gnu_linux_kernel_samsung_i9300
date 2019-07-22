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
	.file	"board-grande-gpio.c"
	.text
	.align	2
	.global	midas_config_sleep_gpio_table
	.type	midas_config_sleep_gpio_table, %function
midas_config_sleep_gpio_table:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	midas_config_sleep_gpio_table, .-midas_config_sleep_gpio_table
	.align	2
	.global	midas_config_gpio_table
	.type	midas_config_gpio_table, %function
midas_config_gpio_table:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r0, #:lower16:.LC0
	ldr	r4, .L12
	movw	r1, #:lower16:.LANCHOR0
	movw	r3, #:lower16:printk
	movw	r9, #:lower16:s3c_gpio_cfgpin
	movw	r8, #:lower16:s3c_gpio_setpull
	movw	r7, #:lower16:s5p_gpio_set_drvstr
	add	r6, r4, #1152
	movw	r10, #:lower16:__gpio_set_value
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	add	r6, r6, #8
	movt	r9, #:upper16:s3c_gpio_cfgpin
	movt	r8, #:upper16:s3c_gpio_setpull
	movt	r7, #:upper16:s5p_gpio_set_drvstr
	movt	r10, #:upper16:__gpio_set_value
	blx	r3
	b	.L6
.L3:
	add	r4, r4, #20
	cmp	r4, r6
	beq	.L11
.L6:
	ldr	r5, [r4, #-16]
	cmp	r5, #328
	bcs	.L3
	ldr	r1, [r4, #-12]
	mov	r0, r5
	blx	r9
	ldr	r1, [r4, #-4]
	mov	r0, r5
	blx	r8
	ldr	r1, [r4, #-8]
	mov	r0, r5
	cmp	r1, #2
	beq	.L4
	blx	r10
.L4:
	ldr	r1, [r4]
	mov	r0, r5
	add	r4, r4, #20
	blx	r7
	cmp	r4, r6
	bne	.L6
.L11:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L13:
	.align	2
.L12:
	.word	.LANCHOR0+40
	.fnend
	.size	midas_config_gpio_table, .-midas_config_gpio_table
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.21902, %object
	.size	__func__.21902, 24
__func__.21902:
	.ascii	"midas_config_gpio_table\000"
	.type	m0_init_gpios, %object
	.size	m0_init_gpios, 1160
m0_init_gpios:
	.word	4
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	5
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	6
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	7
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	13
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	14
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	26
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	31
	.word	-15
	.word	2
	.word	1
	.word	0
	.word	39
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	40
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	44
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	45
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	116
	.word	-15
	.word	2
	.word	0
	.word	0
	.word	126
	.word	-15
	.word	2
	.word	3
	.word	0
	.word	192
	.word	-16
	.word	2
	.word	3
	.word	0
	.word	193
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	194
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	195
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	196
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	197
	.word	-1
	.word	2
	.word	0
	.word	0
	.word	203
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	206
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	208
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	209
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	212
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	211
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	213
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	214
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	215
	.word	-15
	.word	2
	.word	0
	.word	0
	.word	217
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	218
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	219
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	222
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	234
	.word	-16
	.word	0
	.word	0
	.word	3
	.word	106
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	108
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	109
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	110
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	111
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	272
	.word	-15
	.word	0
	.word	0
	.word	0
	.word	285
	.word	-15
	.word	2
	.word	3
	.word	1
	.word	135
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	137
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	138
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	136
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	139
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	140
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	142
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	143
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	144
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	145
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	148
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	149
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	150
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	237
	.word	-16
	.word	2
	.word	3
	.word	1
	.word	241
	.word	-16
	.word	2
	.word	3
	.word	1
	.word	246
	.word	-16
	.word	2
	.word	1
	.word	1
	.word	268
	.word	-16
	.word	2
	.word	1
	.word	1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<7>%s\012\000"
	.ident	"GCC: (GNU) 4.8"
