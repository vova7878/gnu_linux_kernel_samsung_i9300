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
	.file	"baffin-gpio.c"
	.text
	.align	2
	.global	midas_config_sleep_gpio_table
	.type	midas_config_sleep_gpio_table, %function
midas_config_sleep_gpio_table:
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
	cmp	r9, #2
	movcs	r9, #2
	cmp	r9, #0
	beq	.L1
	movw	r7, #:lower16:s3c_gpio_slp_cfgpin
	movw	r6, #:lower16:s3c_gpio_slp_setpull_updown
	movw	r2, #:lower16:.LANCHOR0
	movt	r7, #:upper16:s3c_gpio_slp_cfgpin
	movt	r6, #:upper16:s3c_gpio_slp_setpull_updown
	mov	r8, #0
	movt	r2, #:upper16:.LANCHOR0
	str	r2, [sp, #4]
.L8:
	ldr	r3, [sp, #4]
	ldr	r4, [r3, r8, asl #3]
	mov	r3, r8, asl #3
	cmp	r4, #0
	beq	.L6
	movw	r2, #:lower16:.LANCHOR0
	movt	r2, #:upper16:.LANCHOR0
	add	r3, r2, r3
	ldr	r5, [r3, #4]
	cmp	r5, #0
	beq	.L6
	mov	fp, #0
.L7:
	ldr	r10, [r4]
	add	fp, fp, #1
	ldr	r1, [r4, #4]
	add	r4, r4, #12
	mov	r0, r10
	blx	r7
	ldr	r1, [r4, #-4]
	mov	r0, r10
	blx	r6
	cmp	fp, r5
	bne	.L7
.L6:
	add	r8, r8, #1
	cmp	r9, r8
	bne	.L8
.L1:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
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
	ldr	r4, .L22
	movw	r3, #:lower16:printk
	movw	r9, #:lower16:s3c_gpio_cfgpin
	movw	r8, #:lower16:s3c_gpio_setpull
	movw	r7, #:lower16:s5p_gpio_set_drvstr
	movw	r10, #:lower16:__gpio_set_value
	movt	r3, #:upper16:printk
	sub	r1, r4, #40
	movt	r0, #:upper16:.LC0
	add	r6, r4, #1120
	movt	r9, #:upper16:s3c_gpio_cfgpin
	movt	r8, #:upper16:s3c_gpio_setpull
	movt	r7, #:upper16:s5p_gpio_set_drvstr
	movt	r10, #:upper16:__gpio_set_value
	blx	r3
	b	.L17
.L14:
	add	r4, r4, #20
	cmp	r4, r6
	beq	.L21
.L17:
	ldr	r5, [r4, #-16]
	cmp	r5, #328
	bcs	.L14
	ldr	r1, [r4, #-12]
	mov	r0, r5
	blx	r9
	ldr	r1, [r4, #-4]
	mov	r0, r5
	blx	r8
	ldr	r1, [r4, #-8]
	mov	r0, r5
	cmp	r1, #2
	beq	.L15
	blx	r10
.L15:
	ldr	r1, [r4]
	mov	r0, r5
	add	r4, r4, #20
	blx	r7
	cmp	r4, r6
	bne	.L17
.L21:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L23:
	.align	2
.L22:
	.word	.LANCHOR0+56
	.fnend
	.size	midas_config_gpio_table, .-midas_config_gpio_table
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	baffin_sleep_table, %object
	.size	baffin_sleep_table, 16
baffin_sleep_table:
	.word	baffin_sleep_gpio_table
	.word	252
	.word	0
	.word	0
	.type	__func__.21924, %object
	.size	__func__.21924, 24
__func__.21924:
	.ascii	"midas_config_gpio_table\000"
	.type	baffin_init_gpios, %object
	.size	baffin_init_gpios, 1120
baffin_init_gpios:
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
	.word	1
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
	.word	105
	.word	-15
	.word	0
	.word	0
	.word	0
	.word	106
	.word	-16
	.word	2
	.word	0
	.word	0
	.word	107
	.word	-16
	.word	2
	.word	1
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
	.word	97
	.word	-16
	.word	0
	.word	1
	.word	3
	.word	98
	.word	-16
	.word	0
	.word	1
	.word	3
	.word	99
	.word	-16
	.word	0
	.word	1
	.word	3
	.word	100
	.word	-14
	.word	2
	.word	0
	.word	3
	.word	101
	.word	-14
	.word	2
	.word	0
	.word	3
	.word	102
	.word	-14
	.word	2
	.word	0
	.word	3
	.word	103
	.word	-14
	.word	2
	.word	0
	.word	3
	.data
	.align	2
	.type	baffin_sleep_gpio_table, %object
	.size	baffin_sleep_gpio_table, 3024
baffin_sleep_gpio_table:
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
	.word	3
	.word	22
	.word	2
	.word	1
	.word	23
	.word	2
	.word	1
	.word	25
	.word	3
	.word	0
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
	.word	3
	.word	0
	.word	31
	.word	2
	.word	1
	.word	32
	.word	2
	.word	1
	.word	33
	.word	2
	.word	1
	.word	34
	.word	2
	.word	1
	.word	35
	.word	2
	.word	1
	.word	37
	.word	2
	.word	1
	.word	38
	.word	2
	.word	1
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
	.word	2
	.word	0
	.word	48
	.word	2
	.word	0
	.word	49
	.word	2
	.word	1
	.word	50
	.word	2
	.word	1
	.word	51
	.word	2
	.word	0
	.word	52
	.word	2
	.word	1
	.word	53
	.word	2
	.word	0
	.word	54
	.word	2
	.word	1
	.word	56
	.word	2
	.word	1
	.word	57
	.word	3
	.word	1
	.word	58
	.word	2
	.word	1
	.word	59
	.word	2
	.word	1
	.word	60
	.word	2
	.word	0
	.word	61
	.word	2
	.word	0
	.word	62
	.word	3
	.word	0
	.word	63
	.word	3
	.word	0
	.word	65
	.word	3
	.word	0
	.word	66
	.word	2
	.word	1
	.word	67
	.word	2
	.word	1
	.word	68
	.word	2
	.word	1
	.word	69
	.word	2
	.word	1
	.word	70
	.word	2
	.word	1
	.word	71
	.word	2
	.word	0
	.word	72
	.word	2
	.word	0
	.word	74
	.word	0
	.word	0
	.word	75
	.word	3
	.word	0
	.word	76
	.word	3
	.word	0
	.word	77
	.word	3
	.word	0
	.word	78
	.word	2
	.word	1
	.word	79
	.word	2
	.word	1
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
	.word	1
	.word	115
	.word	2
	.word	1
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
	.word	2
	.word	0
	.word	123
	.word	2
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
	.word	3
	.word	0
	.word	131
	.word	3
	.word	0
	.word	132
	.word	3
	.word	0
	.word	133
	.word	2
	.word	1
	.word	135
	.word	1
	.word	0
	.word	136
	.word	2
	.word	1
	.word	137
	.word	2
	.word	1
	.word	138
	.word	2
	.word	1
	.word	139
	.word	1
	.word	0
	.word	140
	.word	1
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
	.word	3
	.word	0
	.word	155
	.word	3
	.word	0
	.word	156
	.word	3
	.word	0
	.word	157
	.word	3
	.word	0
	.word	158
	.word	3
	.word	0
	.word	159
	.word	3
	.word	0
	.word	160
	.word	3
	.word	0
	.word	161
	.word	3
	.word	0
	.word	163
	.word	3
	.word	0
	.word	164
	.word	3
	.word	0
	.word	165
	.word	3
	.word	0
	.word	166
	.word	3
	.word	0
	.word	167
	.word	3
	.word	0
	.word	168
	.word	3
	.word	0
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
	.word	3
	.word	0
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
	.word	3
	.word	0
	.word	239
	.word	3
	.word	0
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
	.word	3
	.word	0
	.word	245
	.word	3
	.word	0
	.word	246
	.word	2
	.word	1
	.word	247
	.word	2
	.word	1
	.word	249
	.word	0
	.word	0
	.word	250
	.word	2
	.word	1
	.word	251
	.word	2
	.word	1
	.word	252
	.word	2
	.word	1
	.word	253
	.word	2
	.word	1
	.word	254
	.word	2
	.word	1
	.word	255
	.word	2
	.word	1
	.word	256
	.word	0
	.word	0
	.word	258
	.word	2
	.word	1
	.word	259
	.word	2
	.word	1
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
	.word	2
	.word	1
	.word	266
	.word	2
	.word	0
	.word	267
	.word	2
	.word	0
	.word	268
	.word	0
	.word	0
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
	.word	2
	.word	1
	.word	276
	.word	2
	.word	1
	.word	277
	.word	2
	.word	1
	.word	278
	.word	2
	.word	1
	.word	279
	.word	2
	.word	1
	.word	281
	.word	2
	.word	1
	.word	282
	.word	2
	.word	1
	.word	283
	.word	2
	.word	1
	.word	284
	.word	2
	.word	1
	.word	285
	.word	3
	.word	0
	.word	286
	.word	3
	.word	0
	.word	287
	.word	3
	.word	0
	.word	288
	.word	3
	.word	0
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
	.ident	"GCC: (GNU) 4.8"
