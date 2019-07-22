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
	.file	"kona-power.c"
	.text
	.align	2
	.global	midas_power_init
	.type	midas_power_init, %function
midas_power_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR0
	movw	r3, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR0
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	midas_power_init, .-midas_power_init
	.align	2
	.global	midas_power_set_muic_pdata
	.type	midas_power_set_muic_pdata, %function
midas_power_set_muic_pdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	movw	r3, #:lower16:gpio_request
	mov	r4, r1
	movw	r1, #:lower16:.LC1
	mov	r0, r4
	movt	r1, #:upper16:.LC1
	movt	r3, #:upper16:gpio_request
	blx	r3
	movw	r3, #:lower16:s3c_gpio_cfgpin
	mov	r0, r4
	mvn	r1, #0
	movt	r3, #:upper16:s3c_gpio_cfgpin
	blx	r3
	movw	r3, #:lower16:s3c_gpio_setpull
	mov	r0, r4
	mov	r1, #0
	movt	r3, #:upper16:s3c_gpio_setpull
	blx	r3
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	midas_power_set_muic_pdata, .-midas_power_set_muic_pdata
	.align	2
	.global	midas_power_gpio_init
	.type	midas_power_gpio_init, %function
midas_power_gpio_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	midas_power_gpio_init, .-midas_power_gpio_init
	.global	exynos4_max77686_info
	.global	max77686_opmode_data
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.20227, %object
	.size	__func__.20227, 17
__func__.20227:
	.ascii	"midas_power_init\000"
	.data
	.align	2
	.type	exynos4_max77686_info, %object
	.size	exynos4_max77686_info, 172
exynos4_max77686_info:
	.word	197
	.word	453
	.space	4
	.word	1
	.word	max77686_regulators
	.word	21
	.space	4
	.word	max77686_opmode_data
	.word	2
	.space	4
	.word	272
	.word	1
	.word	273
	.word	0
	.word	274
	.word	0
	.word	75
	.word	76
	.word	77
	.word	1100000
	.word	1100000
	.word	1100000
	.word	1100000
	.word	1100000
	.word	1100000
	.word	1100000
	.word	1100000
	.word	1100000
	.word	1000000
	.word	1100000
	.word	1100000
	.word	1100000
	.word	1100000
	.word	1100000
	.word	1100000
	.word	1100000
	.word	1000000
	.word	1100000
	.word	1100000
	.word	1100000
	.word	1100000
	.word	1100000
	.word	1100000
	.type	max77686_opmode_data, %object
	.size	max77686_opmode_data, 304
max77686_opmode_data:
	.space	16
	.word	2
	.word	0
	.space	32
	.word	7
	.word	2
	.space	8
	.word	9
	.word	2
	.word	10
	.word	2
	.word	11
	.word	2
	.space	8
	.word	13
	.word	2
	.space	96
	.word	26
	.word	2
	.word	27
	.word	2
	.word	28
	.word	2
	.word	29
	.word	2
	.space	64
	.type	max77686_regulators, %object
	.size	max77686_regulators, 168
max77686_regulators:
	.word	26
	.word	max77686_buck1_data
	.word	27
	.word	max77686_buck2_data
	.word	28
	.word	max77686_buck3_data
	.word	29
	.word	max77686_buck4_data
	.word	34
	.word	max77686_buck9_data
	.word	2
	.word	ldo3_init_data
	.word	4
	.word	ldo5_init_data
	.word	7
	.word	ldo8_init_data
	.word	8
	.word	ldo9_init_data
	.word	9
	.word	ldo10_init_data
	.word	10
	.word	ldo11_init_data
	.word	11
	.word	ldo12_init_data
	.word	13
	.word	ldo14_init_data
	.word	17
	.word	ldo18_init_data
	.word	18
	.word	ldo19_init_data
	.word	20
	.word	ldo21_init_data
	.word	22
	.word	ldo23_init_data
	.word	23
	.word	ldo24_init_data
	.word	24
	.word	ldo25_init_data
	.word	25
	.word	ldo26_init_data
	.word	37
	.word	max77686_enp32khz_data
	.type	max77686_enp32khz_data, %object
	.size	max77686_enp32khz_data, 116
max77686_enp32khz_data:
	.space	4
	.word	.LC2
	.space	24
	.word	8
	.space	20
	.space	8
	.word	1
	.word	0
	.space	24
	.byte	1
	.space	3
	.word	2
	.word	max77686_enp32khz
	.space	8
	.type	max77686_buck9_data, %object
	.size	max77686_buck9_data, 116
max77686_buck9_data:
	.space	4
	.word	.LC3
	.word	1200000
	.word	1400000
	.space	16
	.word	9
	.space	20
	.space	12
	.word	1
	.space	28
	.word	1
	.word	max77686_buck9
	.space	8
	.type	max77686_buck4_data, %object
	.size	max77686_buck4_data, 116
max77686_buck4_data:
	.space	4
	.word	.LC4
	.word	850000
	.word	1200000
	.space	16
	.word	9
	.space	60
	.byte	2
	.space	3
	.word	2
	.word	max77686_buck4
	.space	8
	.type	max77686_buck3_data, %object
	.size	max77686_buck3_data, 116
max77686_buck3_data:
	.space	4
	.word	.LC5
	.word	850000
	.word	1300000
	.space	16
	.word	1
	.space	60
	.byte	3
	.space	3
	.word	2
	.word	max77686_buck3
	.space	8
	.type	max77686_buck2_data, %object
	.size	max77686_buck2_data, 116
max77686_buck2_data:
	.space	4
	.word	.LC6
	.word	850000
	.word	1500000
	.space	16
	.word	1
	.space	60
	.byte	7
	.space	3
	.word	1
	.word	max77686_buck2
	.space	8
	.type	max77686_buck1_data, %object
	.size	max77686_buck1_data, 116
max77686_buck1_data:
	.space	4
	.word	.LC7
	.word	850000
	.word	1200000
	.space	16
	.word	1
	.space	60
	.byte	3
	.space	3
	.word	2
	.word	max77686_buck1
	.space	8
	.type	ldo26_init_data, %object
	.size	ldo26_init_data, 116
ldo26_init_data:
	.space	4
	.word	.LC8
	.word	2800000
	.word	2800000
	.space	16
	.word	8
	.space	20
	.space	8
	.word	0
	.word	1
	.space	24
	.byte	4
	.space	3
	.word	1
	.word	ldo26_supply
	.space	8
	.type	ldo25_init_data, %object
	.size	ldo25_init_data, 116
ldo25_init_data:
	.space	4
	.word	.LC9
	.word	3300000
	.word	3300000
	.space	16
	.word	8
	.space	20
	.space	8
	.word	0
	.word	1
	.space	24
	.byte	4
	.space	3
	.word	1
	.word	ldo25_supply
	.space	8
	.type	ldo24_init_data, %object
	.size	ldo24_init_data, 116
ldo24_init_data:
	.space	4
	.word	.LC10
	.word	2800000
	.word	2800000
	.space	16
	.word	8
	.space	20
	.space	8
	.word	0
	.word	1
	.space	24
	.byte	4
	.space	3
	.word	1
	.word	ldo24_supply
	.space	8
	.type	ldo23_init_data, %object
	.size	ldo23_init_data, 116
ldo23_init_data:
	.space	4
	.word	.LC11
	.word	3300000
	.word	3300000
	.space	16
	.word	8
	.space	20
	.space	8
	.word	0
	.word	1
	.space	24
	.byte	7
	.space	3
	.word	1
	.word	ldo23_supply
	.space	8
	.type	ldo21_init_data, %object
	.size	ldo21_init_data, 116
ldo21_init_data:
	.space	4
	.word	.LC12
	.word	2800000
	.word	2800000
	.space	16
	.word	8
	.space	20
	.space	8
	.word	0
	.word	1
	.space	24
	.byte	4
	.space	3
	.word	1
	.word	ldo21_supply
	.space	8
	.type	ldo19_init_data, %object
	.size	ldo19_init_data, 116
ldo19_init_data:
	.space	4
	.word	.LC13
	.word	1800000
	.word	1800000
	.space	16
	.word	8
	.space	20
	.space	8
	.word	0
	.word	1
	.space	24
	.byte	4
	.space	3
	.word	1
	.word	ldo19_supply
	.space	8
	.type	ldo18_init_data, %object
	.size	ldo18_init_data, 116
ldo18_init_data:
	.space	4
	.word	.LC14
	.word	1800000
	.word	1800000
	.space	16
	.word	8
	.space	20
	.space	8
	.word	0
	.word	1
	.space	24
	.byte	4
	.space	3
	.word	1
	.word	ldo18_supply
	.space	8
	.type	ldo14_init_data, %object
	.size	ldo14_init_data, 116
ldo14_init_data:
	.space	4
	.word	.LC15
	.word	1950000
	.word	1950000
	.space	16
	.word	8
	.space	20
	.space	8
	.word	0
	.word	1
	.space	24
	.byte	7
	.space	3
	.word	1
	.word	ldo14_supply
	.space	8
	.type	ldo12_init_data, %object
	.size	ldo12_init_data, 116
ldo12_init_data:
	.space	4
	.word	.LC16
	.word	3000000
	.word	3000000
	.space	16
	.word	8
	.space	20
	.space	8
	.word	1
	.word	0
	.space	24
	.byte	7
	.space	3
	.word	1
	.word	ldo12_supply
	.space	8
	.type	ldo11_init_data, %object
	.size	ldo11_init_data, 116
ldo11_init_data:
	.space	4
	.word	.LC17
	.word	1950000
	.word	1950000
	.space	16
	.word	8
	.space	20
	.space	8
	.word	0
	.word	1
	.space	24
	.byte	7
	.space	3
	.word	1
	.word	ldo11_supply
	.space	8
	.type	ldo10_init_data, %object
	.size	ldo10_init_data, 116
ldo10_init_data:
	.space	4
	.word	.LC18
	.word	1800000
	.word	1800000
	.space	16
	.word	8
	.space	20
	.space	8
	.word	1
	.word	0
	.space	24
	.byte	7
	.space	3
	.word	3
	.word	ldo10_supply
	.space	8
	.type	ldo9_init_data, %object
	.size	ldo9_init_data, 116
ldo9_init_data:
	.space	4
	.word	.LC19
	.word	1950000
	.word	1950000
	.space	16
	.word	8
	.space	20
	.space	8
	.word	0
	.word	1
	.space	24
	.byte	4
	.space	3
	.word	1
	.word	ldo9_supply
	.space	8
	.type	ldo8_init_data, %object
	.size	ldo8_init_data, 116
ldo8_init_data:
	.space	4
	.word	.LC20
	.word	1000000
	.word	1000000
	.space	16
	.word	8
	.space	20
	.space	8
	.word	1
	.word	0
	.space	24
	.byte	7
	.space	3
	.word	4
	.word	ldo8_supply
	.space	8
	.type	ldo5_init_data, %object
	.size	ldo5_init_data, 116
ldo5_init_data:
	.space	4
	.word	.LC21
	.word	1800000
	.word	1800000
	.space	16
	.word	8
	.space	20
	.space	8
	.word	0
	.word	1
	.space	24
	.byte	4
	.space	3
	.word	2
	.word	ldo5_supply
	.space	8
	.type	ldo3_init_data, %object
	.size	ldo3_init_data, 116
ldo3_init_data:
	.space	4
	.word	.LC22
	.word	1800000
	.word	1800000
	.space	16
	.word	0
	.space	20
	.space	8
	.word	1
	.word	0
	.space	24
	.byte	7
	.space	3
	.word	5
	.word	ldo3_supply
	.space	8
	.type	max77686_enp32khz, %object
	.size	max77686_enp32khz, 24
max77686_enp32khz:
	.space	4
	.word	.LC23
	.word	.LC24
	.space	4
	.word	.LC25
	.word	.LC26
	.type	max77686_buck9, %object
	.size	max77686_buck9, 12
max77686_buck9:
	.space	4
	.word	0
	.word	.LC27
	.type	max77686_buck4, %object
	.size	max77686_buck4, 24
max77686_buck4:
	.space	4
	.word	0
	.word	.LC28
	.space	4
	.word	.LC29
	.word	.LC28
	.type	max77686_buck3, %object
	.size	max77686_buck3, 24
max77686_buck3:
	.space	4
	.word	0
	.word	.LC30
	.space	4
	.word	.LC31
	.word	.LC30
	.type	max77686_buck2, %object
	.size	max77686_buck2, 12
max77686_buck2:
	.space	4
	.word	0
	.word	.LC32
	.type	max77686_buck1, %object
	.size	max77686_buck1, 24
max77686_buck1:
	.space	4
	.word	0
	.word	.LC33
	.space	4
	.word	.LC34
	.word	.LC33
	.type	ldo26_supply, %object
	.size	ldo26_supply, 12
ldo26_supply:
	.space	4
	.word	0
	.word	.LC35
	.type	ldo25_supply, %object
	.size	ldo25_supply, 12
ldo25_supply:
	.space	4
	.word	0
	.word	.LC36
	.type	ldo24_supply, %object
	.size	ldo24_supply, 12
ldo24_supply:
	.space	4
	.word	0
	.word	.LC37
	.type	ldo23_supply, %object
	.size	ldo23_supply, 12
ldo23_supply:
	.space	4
	.word	0
	.word	.LC38
	.type	ldo21_supply, %object
	.size	ldo21_supply, 12
ldo21_supply:
	.space	4
	.word	0
	.word	.LC39
	.type	ldo19_supply, %object
	.size	ldo19_supply, 12
ldo19_supply:
	.space	4
	.word	0
	.word	.LC40
	.type	ldo18_supply, %object
	.size	ldo18_supply, 12
ldo18_supply:
	.space	4
	.word	0
	.word	.LC41
	.type	ldo14_supply, %object
	.size	ldo14_supply, 12
ldo14_supply:
	.space	4
	.word	0
	.word	.LC42
	.type	ldo12_supply, %object
	.size	ldo12_supply, 12
ldo12_supply:
	.space	4
	.word	0
	.word	.LC43
	.type	ldo11_supply, %object
	.size	ldo11_supply, 12
ldo11_supply:
	.space	4
	.word	0
	.word	.LC44
	.type	ldo10_supply, %object
	.size	ldo10_supply, 36
ldo10_supply:
	.space	4
	.word	0
	.word	.LC45
	.space	4
	.word	.LC46
	.word	.LC47
	.space	4
	.word	.LC48
	.word	.LC49
	.type	ldo9_supply, %object
	.size	ldo9_supply, 12
ldo9_supply:
	.space	4
	.word	0
	.word	.LC50
	.type	ldo8_supply, %object
	.size	ldo8_supply, 48
ldo8_supply:
	.space	4
	.word	0
	.word	.LC51
	.space	4
	.word	.LC46
	.word	.LC52
	.space	4
	.word	.LC48
	.word	.LC53
	.space	4
	.word	.LC48
	.word	.LC54
	.type	ldo5_supply, %object
	.size	ldo5_supply, 24
ldo5_supply:
	.space	4
	.word	0
	.word	.LC55
	.space	4
	.word	0
	.word	.LC56
	.type	ldo3_supply, %object
	.size	ldo3_supply, 60
ldo3_supply:
	.space	4
	.word	0
	.word	.LC57
	.space	4
	.word	0
	.word	.LC58
	.space	4
	.word	0
	.word	.LC59
	.space	4
	.word	0
	.word	.LC60
	.space	4
	.word	0
	.word	.LC61
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<6>%s\012\000"
	.space	1
.LC1:
	.ascii	"AP_PMIC_IRQ\000"
.LC2:
	.ascii	"32KHZ_PMIC\000"
	.space	1
.LC3:
	.ascii	"3MP_CORE_1.2V\000"
	.space	2
.LC4:
	.ascii	"vdd_g3d range\000"
	.space	2
.LC5:
	.ascii	"vdd_int range\000"
	.space	2
.LC6:
	.ascii	"vdd_arm range\000"
	.space	2
.LC7:
	.ascii	"vdd_mif range\000"
	.space	2
.LC8:
	.ascii	"3MP_AF_2.8V\000"
.LC9:
	.ascii	"TSP_3.3V\000"
	.space	3
.LC10:
	.ascii	"CAM_A2.8V\000"
	.space	2
.LC11:
	.ascii	"VDD_ADC_3.3V\000"
	.space	3
.LC12:
	.ascii	"VTF_2.8V\000"
	.space	3
.LC13:
	.ascii	"VT_CORE_1.8V\000"
	.space	3
.LC14:
	.ascii	"CAM_IO_1.8V\000"
.LC15:
	.ascii	"VABB2_1.9V\000"
	.space	1
.LC16:
	.ascii	"VUOTG_3.0V\000"
	.space	1
.LC17:
	.ascii	"VABB1_1.9V\000"
	.space	1
.LC18:
	.ascii	"VMIPI_1.8V\000"
	.space	1
.LC19:
	.ascii	"VLED_IC_1.9V\000"
	.space	3
.LC20:
	.ascii	"VMIPI_1.0V\000"
	.space	1
.LC21:
	.ascii	"VCC_1.8V_IO\000"
.LC22:
	.ascii	"VCC_1.8V_AP\000"
.LC23:
	.ascii	"bcm47511\000"
	.space	3
.LC24:
	.ascii	"lpo_in\000"
	.space	1
.LC25:
	.ascii	"bcm4334_bluetooth\000"
	.space	2
.LC26:
	.ascii	"lpo\000"
.LC27:
	.ascii	"3mp_core_1.2v\000"
	.space	2
.LC28:
	.ascii	"vdd_g3d\000"
.LC29:
	.ascii	"mali_dev.0\000"
	.space	1
.LC30:
	.ascii	"vdd_int\000"
.LC31:
	.ascii	"exynoss4412-busfreq\000"
.LC32:
	.ascii	"vdd_arm\000"
.LC33:
	.ascii	"vdd_mif\000"
.LC34:
	.ascii	"exynos4412-busfreq\000"
	.space	1
.LC35:
	.ascii	"3mp_af_2.8v\000"
.LC36:
	.ascii	"tsp_3.3v\000"
	.space	3
.LC37:
	.ascii	"cam_a2.8v\000"
	.space	2
.LC38:
	.ascii	"vdd_adc_3.3v\000"
	.space	3
.LC39:
	.ascii	"vtf_2.8v\000"
	.space	3
.LC40:
	.ascii	"vt_core_1.8v\000"
	.space	3
.LC41:
	.ascii	"cam_io_1.8v\000"
.LC42:
	.ascii	"vabb2_1.9v\000"
	.space	1
.LC43:
	.ascii	"votg_3.0v\000"
	.space	2
.LC44:
	.ascii	"vabb1_1.9v\000"
	.space	1
.LC45:
	.ascii	"vmipi_1.8v\000"
	.space	1
.LC46:
	.ascii	"s5p-mipi-dsim.0\000"
.LC47:
	.ascii	"VDD18\000"
	.space	2
.LC48:
	.ascii	"exynos4-hdmi\000"
	.space	3
.LC49:
	.ascii	"vdd_osc\000"
.LC50:
	.ascii	"vled_ic_1.9v\000"
	.space	3
.LC51:
	.ascii	"vmipi_1.0v\000"
	.space	1
.LC52:
	.ascii	"VDD10\000"
	.space	2
.LC53:
	.ascii	"vdd\000"
.LC54:
	.ascii	"vdd_pll\000"
.LC55:
	.ascii	"vcc_1.8v\000"
	.space	3
.LC56:
	.ascii	"touchkey\000"
	.space	3
.LC57:
	.ascii	"AVDD2\000"
	.space	2
.LC58:
	.ascii	"CPVDD\000"
	.space	2
.LC59:
	.ascii	"DBVDD1\000"
	.space	1
.LC60:
	.ascii	"DBVDD2\000"
	.space	1
.LC61:
	.ascii	"DBVDD3\000"
	.ident	"GCC: (GNU) 4.8"
