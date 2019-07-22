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
	.file	"midas-thermistor.c"
	.text
	.align	2
	.type	get_midas_siop_level, %function
get_midas_siop_level:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r2, [r3]
	cmp	r2, r0
	bge	.L2
	cmp	r0, #540
	blt	.L3
	movw	r2, #:lower16:.LANCHOR1
	mov	r1, #4
	movt	r2, #:upper16:.LANCHOR1
	ldr	ip, [r2]
	b	.L4
.L2:
	movw	r2, #409
	cmp	r0, r2
	movle	r1, #0
	bgt	.L15
.L7:
	movw	r2, #:lower16:.LANCHOR1
	movt	r2, #:upper16:.LANCHOR1
	ldr	ip, [r2]
	cmp	r1, ip
	movge	r1, ip
.L4:
	cmp	r1, ip
	str	r0, [r3]
	strne	r1, [r2]
	movne	r0, r1
	mvneq	r0, #0
	bx	lr
.L15:
	cmp	r0, #440
	movlt	r1, #1
	blt	.L7
	cmp	r0, #480
	movlt	r1, #2
	blt	.L7
	movw	r1, #529
	cmp	r0, r1
	movgt	r1, #4
	movle	r1, #3
	b	.L7
.L3:
	movw	r2, #529
	cmp	r0, r2
	movw	r2, #:lower16:.LANCHOR1
	bgt	.L16
	cmp	r0, #480
	blt	.L6
	movt	r2, #:upper16:.LANCHOR1
	mov	r1, #2
	ldr	ip, [r2]
	b	.L4
.L16:
	movt	r2, #:upper16:.LANCHOR1
	mov	r1, #3
	ldr	ip, [r2]
	b	.L4
.L6:
	cmp	r0, #440
	movt	r2, #:upper16:.LANCHOR1
	movlt	r1, #0
	movge	r1, #1
	ldr	ip, [r2]
	b	.L4
	.fnend
	.size	get_midas_siop_level, .-get_midas_siop_level
	.global	__aeabi_idiv
	.align	2
	.global	convert_adc
	.type	convert_adc, %function
convert_adc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	r3, r1, #1
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	cmp	r3, #1
	mov	r2, r1
	bhi	.L29
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r2, [r3, #4]
	cmp	r2, r0
	bge	.L30
	ldr	r2, [r3, #804]
	cmp	r0, r2
	bge	.L31
	add	lr, r3, #4
	mov	ip, #100
	mov	r2, #0
.L27:
	add	r3, r2, ip
	mov	r3, r3, asr #1
	ldr	r1, [lr, r3, asl #3]
	add	r4, lr, r3, asl #3
	cmp	r0, r1
	sublt	ip, r3, #1
	blt	.L24
	add	r2, r3, #1
	ble	.L25
.L24:
	cmp	ip, r2
	bge	.L27
	cmp	r0, r1
	bge	.L25
	sub	r3, r3, #-536870911
	ldr	r4, [r4, #4]
	add	r2, lr, r3, asl #3
	ldr	ip, [lr, r3, asl #3]
	rsb	r0, r0, r1
	ldr	r2, [r2, #4]
	movw	r3, #:lower16:__aeabi_idiv
	rsb	r1, ip, r1
	movt	r3, #:upper16:__aeabi_idiv
	rsb	r2, r4, r2
	mul	r0, r0, r2
	blx	r3
	add	r0, r4, r0
	ldmfd	sp!, {r4, pc}
.L31:
	ldr	r0, [r3, #808]
	ldmfd	sp!, {r4, pc}
.L30:
	ldr	r0, [r3, #8]
	ldmfd	sp!, {r4, pc}
.L25:
	add	r3, r3, #1
	ldr	r4, [r4, #4]
	add	r2, lr, r3, asl #3
	ldr	ip, [lr, r3, asl #3]
	rsb	r0, r1, r0
	ldr	r2, [r2, #4]
	movw	r3, #:lower16:__aeabi_idiv
	rsb	r1, r1, ip
	movt	r3, #:upper16:__aeabi_idiv
	rsb	r2, r2, r4
	mul	r0, r0, r2
	blx	r3
	rsb	r0, r0, r4
	ldmfd	sp!, {r4, pc}
.L29:
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR2
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR2
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	mvn	r0, #21
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	convert_adc, .-convert_adc
	.global	sec_device_thermistor
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.13304, %object
	.size	__func__.13304, 12
__func__.13304:
	.ascii	"convert_adc\000"
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	prev_temp.13322, %object
	.size	prev_temp.13322, 4
prev_temp.13322:
	.word	400
	.type	ap_adc_temper_table_battery, %object
	.size	ap_adc_temper_table_battery, 808
ap_adc_temper_table_battery:
	.word	204
	.word	800
	.word	210
	.word	790
	.word	216
	.word	780
	.word	223
	.word	770
	.word	230
	.word	760
	.word	237
	.word	750
	.word	244
	.word	740
	.word	252
	.word	730
	.word	260
	.word	720
	.word	268
	.word	710
	.word	276
	.word	700
	.word	285
	.word	690
	.word	294
	.word	680
	.word	303
	.word	670
	.word	312
	.word	660
	.word	322
	.word	650
	.word	332
	.word	640
	.word	342
	.word	630
	.word	353
	.word	620
	.word	364
	.word	610
	.word	375
	.word	600
	.word	387
	.word	590
	.word	399
	.word	580
	.word	411
	.word	570
	.word	423
	.word	560
	.word	436
	.word	550
	.word	450
	.word	540
	.word	463
	.word	530
	.word	477
	.word	520
	.word	492
	.word	510
	.word	507
	.word	500
	.word	522
	.word	490
	.word	537
	.word	480
	.word	553
	.word	470
	.word	569
	.word	460
	.word	586
	.word	450
	.word	603
	.word	440
	.word	621
	.word	430
	.word	638
	.word	420
	.word	657
	.word	410
	.word	675
	.word	400
	.word	694
	.word	390
	.word	713
	.word	380
	.word	733
	.word	370
	.word	753
	.word	360
	.word	773
	.word	350
	.word	794
	.word	340
	.word	815
	.word	330
	.word	836
	.word	320
	.word	858
	.word	310
	.word	880
	.word	300
	.word	902
	.word	290
	.word	924
	.word	280
	.word	947
	.word	270
	.word	969
	.word	260
	.word	992
	.word	250
	.word	1015
	.word	240
	.word	1039
	.word	230
	.word	1062
	.word	220
	.word	1086
	.word	210
	.word	1109
	.word	200
	.word	1133
	.word	190
	.word	1156
	.word	180
	.word	1180
	.word	170
	.word	1204
	.word	160
	.word	1227
	.word	150
	.word	1250
	.word	140
	.word	1274
	.word	130
	.word	1297
	.word	120
	.word	1320
	.word	110
	.word	1343
	.word	100
	.word	1366
	.word	90
	.word	1388
	.word	80
	.word	1410
	.word	70
	.word	1432
	.word	60
	.word	1454
	.word	50
	.word	1475
	.word	40
	.word	1496
	.word	30
	.word	1516
	.word	20
	.word	1536
	.word	10
	.word	1556
	.word	0
	.word	1576
	.word	-10
	.word	1595
	.word	-20
	.word	1613
	.word	-30
	.word	1631
	.word	-40
	.word	1649
	.word	-50
	.word	1666
	.word	-60
	.word	1683
	.word	-70
	.word	1699
	.word	-80
	.word	1714
	.word	-90
	.word	1730
	.word	-100
	.word	1744
	.word	-110
	.word	1759
	.word	-120
	.word	1773
	.word	-130
	.word	1786
	.word	-140
	.word	1799
	.word	-150
	.word	1811
	.word	-160
	.word	1823
	.word	-170
	.word	1835
	.word	-180
	.word	1846
	.word	-190
	.word	1856
	.word	-200
	.space	4
	.type	sec_device_thermistor, %object
	.size	sec_device_thermistor, 360
sec_device_thermistor:
	.word	.LC1
	.word	-1
	.space	84
	.word	sec_therm_pdata
	.space	248
	.space	16
	.type	sec_therm_pdata, %object
	.size	sec_therm_pdata, 20
sec_therm_pdata:
	.word	1
	.word	42
	.word	temper_table_ap
	.word	30000
	.word	get_midas_siop_level
	.type	temper_table_ap, %object
	.size	temper_table_ap, 336
temper_table_ap:
	.word	196
	.word	700
	.word	211
	.word	690
	.word	242
	.word	685
	.word	249
	.word	680
	.word	262
	.word	670
	.word	275
	.word	660
	.word	288
	.word	650
	.word	301
	.word	640
	.word	314
	.word	630
	.word	328
	.word	620
	.word	341
	.word	610
	.word	354
	.word	600
	.word	366
	.word	590
	.word	377
	.word	580
	.word	389
	.word	570
	.word	404
	.word	560
	.word	419
	.word	550
	.word	434
	.word	540
	.word	452
	.word	530
	.word	469
	.word	520
	.word	487
	.word	510
	.word	498
	.word	500
	.word	509
	.word	490
	.word	520
	.word	480
	.word	529
	.word	470
	.word	538
	.word	460
	.word	547
	.word	450
	.word	556
	.word	440
	.word	564
	.word	430
	.word	573
	.word	420
	.word	581
	.word	410
	.word	590
	.word	400
	.word	615
	.word	390
	.word	640
	.word	380
	.word	665
	.word	370
	.word	690
	.word	360
	.word	715
	.word	350
	.word	736
	.word	340
	.word	758
	.word	330
	.word	779
	.word	320
	.word	801
	.word	310
	.word	822
	.word	300
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>%s: not exist temper table for ch(%d)\012\000"
	.space	2
.LC1:
	.ascii	"sec-thermistor\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	prev_level.13323, %object
	.size	prev_level.13323, 4
prev_level.13323:
	.space	4
	.ident	"GCC: (GNU) 4.8"
