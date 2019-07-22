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
	.file	"p4note-gpio.c"
	.text
	.align	2
	.global	p4note_config_sleep_gpio_table
	.type	p4note_config_sleep_gpio_table, %function
p4note_config_sleep_gpio_table:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:system_rev
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movt	r3, #:upper16:system_rev
	.pad #12
	sub	sp, sp, #12
	ldr	r9, [r3]
	add	r9, r9, #1
	mov	r2, r9
	cmp	r2, #12
	movcs	r2, #12
	cmp	r2, #0
	str	r2, [sp]
	beq	.L1
	mov	r7, #0
	movw	r6, #:lower16:s3c_gpio_slp_cfgpin
	movw	r5, #:lower16:s3c_gpio_slp_setpull_updown
	movw	r3, #:lower16:.LANCHOR0
	mov	r8, r7
	movt	r6, #:upper16:s3c_gpio_slp_cfgpin
	movt	r5, #:upper16:s3c_gpio_slp_setpull_updown
	movt	r3, #:upper16:.LANCHOR0
	str	r3, [sp, #4]
.L8:
	ldr	r2, [sp, #4]
	ldr	r3, [r2, r7]
	cmp	r3, #0
	beq	.L6
	movw	r1, #:lower16:.LANCHOR0
	movt	r1, #:upper16:.LANCHOR0
	add	r2, r1, r7
	ldr	r4, [r2, #4]
	cmp	r4, #0
	beq	.L6
	mov	r10, r3
	mov	fp, #0
.L7:
	ldr	r9, [r10]
	add	fp, fp, #1
	ldr	r1, [r10, #4]
	add	r10, r10, #12
	mov	r0, r9
	blx	r6
	ldr	r1, [r10, #-4]
	mov	r0, r9
	blx	r5
	cmp	fp, r4
	bne	.L7
.L6:
	ldr	r3, [sp]
	add	r8, r8, #1
	add	r7, r7, #8
	cmp	r3, r8
	bne	.L8
.L1:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.fnend
	.size	p4note_config_sleep_gpio_table, .-p4note_config_sleep_gpio_table
	.align	2
	.global	midas_config_sleep_gpio_table
	.type	midas_config_sleep_gpio_table, %function
midas_config_sleep_gpio_table:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	p4note_config_sleep_gpio_table
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
	ldr	r4, .L23
	movw	r3, #:lower16:printk
	movw	r9, #:lower16:s3c_gpio_cfgpin
	movw	r8, #:lower16:s3c_gpio_setpull
	movw	r7, #:lower16:s5p_gpio_set_drvstr
	movw	r10, #:lower16:__gpio_set_value
	add	r6, r4, #920
	movt	r3, #:upper16:printk
	sub	r1, r6, #960
	movt	r0, #:upper16:.LC0
	movt	r9, #:upper16:s3c_gpio_cfgpin
	movt	r8, #:upper16:s3c_gpio_setpull
	movt	r7, #:upper16:s5p_gpio_set_drvstr
	movt	r10, #:upper16:__gpio_set_value
	blx	r3
	b	.L18
.L15:
	add	r4, r4, #20
	cmp	r4, r6
	beq	.L22
.L18:
	ldr	r5, [r4, #-16]
	cmp	r5, #328
	bcs	.L15
	ldr	r1, [r4, #-12]
	mov	r0, r5
	blx	r9
	ldr	r1, [r4, #-4]
	mov	r0, r5
	blx	r8
	ldr	r1, [r4, #-8]
	mov	r0, r5
	cmp	r1, #2
	beq	.L16
	blx	r10
.L16:
	ldr	r1, [r4]
	mov	r0, r5
	add	r4, r4, #20
	blx	r7
	cmp	r4, r6
	bne	.L18
.L22:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L24:
	.align	2
.L23:
	.word	.LANCHOR0+136
	.fnend
	.size	midas_config_gpio_table, .-midas_config_gpio_table
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	p4note_sleep_table, %object
	.size	p4note_sleep_table, 96
p4note_sleep_table:
	.word	p4note_sleep_gpio_table
	.word	252
	.word	p4note_sleep_gpio_table_rev09
	.word	18
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	p4notelte_sleep_gpio_table_rev01
	.word	0
	.word	0
	.word	0
	.type	__func__.21935, %object
	.size	__func__.21935, 24
__func__.21935:
	.ascii	"midas_config_gpio_table\000"
	.type	p4note_init_gpios, %object
	.size	p4note_init_gpios, 920
p4note_init_gpios:
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
	.word	42
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	43
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
	.word	191
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	192
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	193
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	194
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	195
	.word	-16
	.word	2
	.word	0
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
	.word	202
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	203
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	204
	.word	-16
	.word	2
	.word	0
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
	.word	211
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
	.word	-16
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
	.word	-1
	.word	2
	.word	0
	.word	0
	.word	89
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	90
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	91
	.word	-16
	.word	2
	.word	1
	.word	0
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
	.word	135
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	136
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
	.word	246
	.word	-16
	.word	2
	.word	1
	.word	0
	.word	268
	.word	-16
	.word	2
	.word	1
	.word	0
	.data
	.align	2
	.type	p4note_sleep_gpio_table_rev09, %object
	.size	p4note_sleep_gpio_table_rev09, 216
p4note_sleep_gpio_table_rev09:
	.word	234
	.word	2
	.word	1
	.word	235
	.word	2
	.word	1
	.word	236
	.word	2
	.word	1
	.word	237
	.word	3
	.word	0
	.word	238
	.word	3
	.word	0
	.word	239
	.word	0
	.word	0
	.word	240
	.word	0
	.word	0
	.word	241
	.word	0
	.word	0
	.word	243
	.word	0
	.word	0
	.word	244
	.word	2
	.word	1
	.word	245
	.word	3
	.word	0
	.word	246
	.word	0
	.word	0
	.word	255
	.word	2
	.word	1
	.word	264
	.word	2
	.word	1
	.word	268
	.word	0
	.word	0
	.word	283
	.word	2
	.word	1
	.word	284
	.word	2
	.word	1
	.word	286
	.word	0
	.word	0
	.type	p4note_sleep_gpio_table, %object
	.size	p4note_sleep_gpio_table, 3024
p4note_sleep_gpio_table:
	.word	0
	.word	2
	.word	0
	.word	1
	.word	0
	.word	0
	.word	2
	.word	2
	.word	0
	.word	3
	.word	2
	.word	3
	.word	4
	.word	2
	.word	0
	.word	5
	.word	2
	.word	1
	.word	6
	.word	2
	.word	1
	.word	7
	.word	2
	.word	3
	.word	9
	.word	2
	.word	1
	.word	10
	.word	2
	.word	1
	.word	11
	.word	2
	.word	1
	.word	12
	.word	2
	.word	1
	.word	13
	.word	2
	.word	1
	.word	14
	.word	2
	.word	1
	.word	16
	.word	2
	.word	0
	.word	17
	.word	2
	.word	0
	.word	18
	.word	2
	.word	0
	.word	19
	.word	2
	.word	0
	.word	20
	.word	2
	.word	1
	.word	21
	.word	2
	.word	1
	.word	22
	.word	2
	.word	1
	.word	23
	.word	2
	.word	1
	.word	25
	.word	2
	.word	1
	.word	26
	.word	2
	.word	1
	.word	27
	.word	2
	.word	1
	.word	28
	.word	2
	.word	1
	.word	29
	.word	2
	.word	1
	.word	31
	.word	2
	.word	3
	.word	32
	.word	3
	.word	0
	.word	33
	.word	2
	.word	3
	.word	34
	.word	2
	.word	3
	.word	35
	.word	2
	.word	3
	.word	37
	.word	2
	.word	1
	.word	38
	.word	0
	.word	0
	.word	39
	.word	2
	.word	0
	.word	40
	.word	2
	.word	0
	.word	42
	.word	2
	.word	1
	.word	43
	.word	2
	.word	1
	.word	44
	.word	2
	.word	0
	.word	45
	.word	2
	.word	0
	.word	47
	.word	0
	.word	0
	.word	48
	.word	0
	.word	0
	.word	49
	.word	0
	.word	0
	.word	50
	.word	0
	.word	0
	.word	51
	.word	0
	.word	0
	.word	52
	.word	0
	.word	0
	.word	53
	.word	0
	.word	0
	.word	54
	.word	0
	.word	0
	.word	56
	.word	0
	.word	0
	.word	57
	.word	0
	.word	0
	.word	58
	.word	0
	.word	0
	.word	59
	.word	0
	.word	0
	.word	60
	.word	0
	.word	0
	.word	61
	.word	0
	.word	0
	.word	62
	.word	0
	.word	0
	.word	63
	.word	0
	.word	0
	.word	65
	.word	0
	.word	0
	.word	66
	.word	0
	.word	0
	.word	67
	.word	0
	.word	0
	.word	68
	.word	0
	.word	0
	.word	69
	.word	0
	.word	0
	.word	70
	.word	0
	.word	0
	.word	71
	.word	0
	.word	0
	.word	72
	.word	0
	.word	0
	.word	74
	.word	0
	.word	0
	.word	75
	.word	0
	.word	0
	.word	76
	.word	0
	.word	0
	.word	77
	.word	0
	.word	0
	.word	78
	.word	0
	.word	0
	.word	79
	.word	0
	.word	0
	.word	81
	.word	3
	.word	0
	.word	82
	.word	3
	.word	0
	.word	83
	.word	3
	.word	0
	.word	84
	.word	3
	.word	0
	.word	85
	.word	3
	.word	0
	.word	86
	.word	3
	.word	0
	.word	87
	.word	3
	.word	0
	.word	89
	.word	2
	.word	1
	.word	90
	.word	2
	.word	1
	.word	91
	.word	2
	.word	1
	.word	92
	.word	3
	.word	0
	.word	93
	.word	3
	.word	0
	.word	94
	.word	3
	.word	0
	.word	95
	.word	3
	.word	0
	.word	97
	.word	2
	.word	1
	.word	98
	.word	2
	.word	1
	.word	99
	.word	2
	.word	1
	.word	100
	.word	2
	.word	1
	.word	101
	.word	2
	.word	1
	.word	102
	.word	2
	.word	1
	.word	103
	.word	2
	.word	1
	.word	105
	.word	0
	.word	0
	.word	106
	.word	2
	.word	0
	.word	107
	.word	2
	.word	1
	.word	108
	.word	2
	.word	0
	.word	109
	.word	2
	.word	0
	.word	110
	.word	2
	.word	0
	.word	111
	.word	2
	.word	0
	.word	113
	.word	0
	.word	0
	.word	114
	.word	2
	.word	0
	.word	115
	.word	2
	.word	0
	.word	116
	.word	2
	.word	1
	.word	117
	.word	3
	.word	0
	.word	119
	.word	3
	.word	0
	.word	122
	.word	0
	.word	0
	.word	123
	.word	0
	.word	0
	.word	126
	.word	2
	.word	1
	.word	127
	.word	2
	.word	1
	.word	128
	.word	2
	.word	1
	.word	129
	.word	2
	.word	1
	.word	130
	.word	0
	.word	0
	.word	131
	.word	2
	.word	1
	.word	132
	.word	3
	.word	0
	.word	133
	.word	3
	.word	0
	.word	135
	.word	2
	.word	1
	.word	136
	.word	2
	.word	1
	.word	137
	.word	2
	.word	0
	.word	138
	.word	2
	.word	0
	.word	139
	.word	2
	.word	0
	.word	140
	.word	2
	.word	0
	.word	142
	.word	2
	.word	1
	.word	143
	.word	2
	.word	1
	.word	144
	.word	2
	.word	1
	.word	145
	.word	2
	.word	1
	.word	147
	.word	3
	.word	0
	.word	148
	.word	2
	.word	1
	.word	149
	.word	2
	.word	0
	.word	150
	.word	2
	.word	0
	.word	151
	.word	2
	.word	0
	.word	152
	.word	2
	.word	0
	.word	154
	.word	2
	.word	1
	.word	155
	.word	2
	.word	1
	.word	156
	.word	2
	.word	1
	.word	157
	.word	2
	.word	1
	.word	158
	.word	2
	.word	1
	.word	159
	.word	2
	.word	1
	.word	160
	.word	2
	.word	1
	.word	161
	.word	2
	.word	1
	.word	163
	.word	2
	.word	1
	.word	164
	.word	2
	.word	1
	.word	165
	.word	2
	.word	1
	.word	166
	.word	2
	.word	1
	.word	167
	.word	2
	.word	1
	.word	168
	.word	2
	.word	1
	.word	169
	.word	2
	.word	1
	.word	170
	.word	2
	.word	1
	.word	172
	.word	2
	.word	1
	.word	173
	.word	2
	.word	1
	.word	174
	.word	2
	.word	1
	.word	175
	.word	2
	.word	1
	.word	176
	.word	2
	.word	1
	.word	177
	.word	2
	.word	1
	.word	178
	.word	2
	.word	1
	.word	179
	.word	2
	.word	1
	.word	181
	.word	2
	.word	1
	.word	182
	.word	2
	.word	1
	.word	183
	.word	2
	.word	1
	.word	184
	.word	2
	.word	1
	.word	185
	.word	2
	.word	1
	.word	186
	.word	2
	.word	1
	.word	187
	.word	2
	.word	1
	.word	188
	.word	2
	.word	1
	.word	226
	.word	2
	.word	1
	.word	227
	.word	2
	.word	1
	.word	228
	.word	2
	.word	1
	.word	229
	.word	2
	.word	1
	.word	230
	.word	2
	.word	1
	.word	231
	.word	2
	.word	1
	.word	232
	.word	2
	.word	1
	.word	234
	.word	2
	.word	1
	.word	235
	.word	2
	.word	1
	.word	236
	.word	2
	.word	1
	.word	237
	.word	2
	.word	1
	.word	238
	.word	2
	.word	1
	.word	239
	.word	2
	.word	1
	.word	240
	.word	2
	.word	1
	.word	241
	.word	2
	.word	1
	.word	243
	.word	2
	.word	1
	.word	244
	.word	2
	.word	1
	.word	245
	.word	2
	.word	1
	.word	246
	.word	2
	.word	1
	.word	247
	.word	2
	.word	1
	.word	249
	.word	3
	.word	0
	.word	250
	.word	0
	.word	0
	.word	251
	.word	2
	.word	1
	.word	252
	.word	2
	.word	0
	.word	253
	.word	0
	.word	0
	.word	254
	.word	0
	.word	0
	.word	255
	.word	0
	.word	0
	.word	256
	.word	0
	.word	0
	.word	258
	.word	2
	.word	0
	.word	259
	.word	2
	.word	0
	.word	260
	.word	2
	.word	0
	.word	261
	.word	2
	.word	0
	.word	262
	.word	2
	.word	0
	.word	263
	.word	2
	.word	0
	.word	264
	.word	0
	.word	0
	.word	266
	.word	2
	.word	0
	.word	267
	.word	2
	.word	0
	.word	268
	.word	2
	.word	1
	.word	269
	.word	2
	.word	1
	.word	270
	.word	2
	.word	1
	.word	272
	.word	3
	.word	0
	.word	273
	.word	3
	.word	0
	.word	274
	.word	3
	.word	0
	.word	275
	.word	1
	.word	0
	.word	276
	.word	0
	.word	1
	.word	277
	.word	3
	.word	0
	.word	278
	.word	3
	.word	0
	.word	279
	.word	0
	.word	0
	.word	281
	.word	2
	.word	0
	.word	282
	.word	2
	.word	0
	.word	283
	.word	3
	.word	0
	.word	284
	.word	0
	.word	0
	.word	285
	.word	3
	.word	0
	.word	286
	.word	2
	.word	1
	.word	287
	.word	0
	.word	0
	.word	288
	.word	2
	.word	1
	.word	290
	.word	2
	.word	1
	.word	291
	.word	2
	.word	1
	.word	292
	.word	2
	.word	1
	.word	293
	.word	2
	.word	1
	.word	294
	.word	2
	.word	1
	.word	295
	.word	2
	.word	1
	.word	296
	.word	2
	.word	1
	.word	297
	.word	2
	.word	1
	.word	299
	.word	2
	.word	1
	.word	300
	.word	2
	.word	1
	.word	301
	.word	2
	.word	1
	.word	302
	.word	2
	.word	1
	.word	303
	.word	2
	.word	1
	.word	304
	.word	2
	.word	1
	.word	305
	.word	2
	.word	1
	.word	306
	.word	2
	.word	1
	.word	308
	.word	2
	.word	1
	.word	309
	.word	2
	.word	1
	.word	310
	.word	2
	.word	1
	.word	311
	.word	2
	.word	1
	.word	312
	.word	2
	.word	1
	.word	313
	.word	2
	.word	1
	.word	314
	.word	2
	.word	1
	.word	315
	.word	2
	.word	1
	.word	317
	.word	2
	.word	1
	.word	318
	.word	2
	.word	1
	.word	319
	.word	2
	.word	1
	.word	320
	.word	2
	.word	1
	.word	321
	.word	2
	.word	1
	.word	322
	.word	2
	.word	1
	.word	323
	.word	2
	.word	1
	.word	324
	.word	2
	.word	1
	.word	326
	.word	2
	.word	1
	.word	327
	.word	2
	.word	1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<7>%s\012\000"
	.bss
	.align	2
	.type	p4notelte_sleep_gpio_table_rev01, %object
	.size	p4notelte_sleep_gpio_table_rev01, 0
p4notelte_sleep_gpio_table_rev01:
	.ident	"GCC: (GNU) 4.8"
