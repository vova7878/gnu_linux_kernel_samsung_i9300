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
	.file	"clock.c"
	.text
	.align	2
	.global	s5p_spdif_set_rate
	.type	s5p_spdif_set_rate, %function
s5p_spdif_set_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:clk_get_parent
	movt	r3, #:upper16:clk_get_parent
	mov	r5, r1
	blx	r3
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L3
	ldr	r3, [r0, #40]
	mov	r1, r5
	ldr	r3, [r3]
	blx	r3
	movw	r3, #:lower16:clk_put
	mov	r5, r0
	movt	r3, #:upper16:clk_put
	mov	r0, r4
	blx	r3
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, pc}
.L3:
	mvn	r0, #21
	ldmfd	sp!, {r3, r4, r5, pc}
	.fnend
	.size	s5p_spdif_set_rate, .-s5p_spdif_set_rate
	.align	2
	.global	s5p_spdif_get_rate
	.type	s5p_spdif_get_rate, %function
s5p_spdif_get_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r3, #:lower16:clk_get_parent
	movt	r3, #:upper16:clk_get_parent
	blx	r3
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L7
	ldr	r3, [r0, #40]
	ldr	r3, [r3, #4]
	blx	r3
	movw	r3, #:lower16:clk_put
	mov	r5, r0
	movt	r3, #:upper16:clk_put
	mov	r0, r4
	blx	r3
.L6:
	mov	r0, r5
	ldmfd	sp!, {r3, r4, r5, pc}
.L7:
	mvn	r5, #21
	b	.L6
	.fnend
	.size	s5p_spdif_get_rate, .-s5p_spdif_get_rate
	.align	2
	.global	s5p_gatectrl
	.type	s5p_gatectrl, %function
s5p_gatectrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	cmp	r2, #0
	ldr	r2, [r1, #36]
	orrne	r3, r3, r2
	biceq	r3, r3, r2
	str	r3, [r0]
	mov	r0, #0
	bx	lr
	.fnend
	.size	s5p_gatectrl, .-s5p_gatectrl
	.align	2
	.global	s5p_epll_enable
	.type	s5p_epll_enable, %function
s5p_epll_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #49152
	cmp	r1, #0
	movt	r3, 65040
	ldr	r1, [r0, #36]
	ldr	r2, [r3, #272]
	mov	r0, #0
	orrne	r2, r2, r1
	biceq	r2, r2, r1
	str	r2, [r3, #272]
	bx	lr
	.fnend
	.size	s5p_epll_enable, .-s5p_epll_enable
	.align	2
	.global	s5p_epll_get_rate
	.type	s5p_epll_get_rate, %function
s5p_epll_get_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #32]
	bx	lr
	.fnend
	.size	s5p_epll_get_rate, .-s5p_epll_get_rate
	.align	2
	.global	s5p_register_clocks
	.type	s5p_register_clocks, %function
s5p_register_clocks:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	movw	r2, #:lower16:s3c24xx_register_clocks
	movt	r2, #:upper16:s3c24xx_register_clocks
	mov	r1, #11
	str	r0, [r3, #32]
	add	r0, r3, #68
	blx	r2
	cmp	r0, #0
	ldmlefd	sp!, {r3, pc}
	movw	r0, #:lower16:.LC0
	movw	r3, #:lower16:printk
	movt	r3, #:upper16:printk
	movt	r0, #:upper16:.LC0
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	s5p_register_clocks, .-s5p_register_clocks
	.global	s5p_sclk_spdif_ops
	.global	clk_vpll
	.global	clk_src_dpll
	.global	clk_src_epll
	.global	clk_src_mpll
	.global	clk_src_apll
	.global	clk_fout_vpll
	.global	clk_fout_dpll
	.global	clk_fout_epll
	.global	clk_fout_mpll
	.global	clk_fout_apll
	.global	clk_48m
	.global	s5p_clk_27m
	.global	clk_xxti
	.global	clk_xusbxti
	.global	clk_ext_xtal_mux
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	clk_ext_xtal_mux, %object
	.size	clk_ext_xtal_mux, 68
clk_ext_xtal_mux:
	.space	16
	.word	.LC11
	.space	4
	.word	-1
	.space	40
	.type	s5p_clks, %object
	.size	s5p_clks, 44
s5p_clks:
	.word	clk_ext_xtal_mux
	.word	clk_48m
	.word	s5p_clk_27m
	.word	clk_fout_apll
	.word	clk_fout_mpll
	.word	clk_fout_epll
	.word	clk_fout_dpll
	.word	clk_fout_vpll
	.word	clk_vpll
	.word	clk_xusbxti
	.word	clk_xxti
	.type	s5p_sclk_spdif_ops, %object
	.size	s5p_sclk_spdif_ops, 16
s5p_sclk_spdif_ops:
	.word	s5p_spdif_set_rate
	.word	s5p_spdif_get_rate
	.space	8
	.type	clk_vpll, %object
	.size	clk_vpll, 68
clk_vpll:
	.space	16
	.word	.LC1
	.space	4
	.word	-1
	.space	40
	.type	clk_src_dpll, %object
	.size	clk_src_dpll, 8
clk_src_dpll:
	.word	2
	.word	clk_src_dpll_list
	.type	clk_src_dpll_list, %object
	.size	clk_src_dpll_list, 8
clk_src_dpll_list:
	.word	clk_ext_xtal_mux
	.word	clk_fout_dpll
	.type	clk_src_epll, %object
	.size	clk_src_epll, 8
clk_src_epll:
	.word	2
	.word	clk_src_epll_list
	.type	clk_src_epll_list, %object
	.size	clk_src_epll_list, 8
clk_src_epll_list:
	.word	clk_ext_xtal_mux
	.word	clk_fout_epll
	.type	clk_src_mpll, %object
	.size	clk_src_mpll, 8
clk_src_mpll:
	.word	2
	.word	clk_src_mpll_list
	.type	clk_src_mpll_list, %object
	.size	clk_src_mpll_list, 8
clk_src_mpll_list:
	.word	clk_ext_xtal_mux
	.word	clk_fout_mpll
	.type	clk_src_apll, %object
	.size	clk_src_apll, 8
clk_src_apll:
	.word	2
	.word	clk_src_apll_list
	.type	clk_src_apll_list, %object
	.size	clk_src_apll_list, 8
clk_src_apll_list:
	.word	clk_ext_xtal_mux
	.word	clk_fout_apll
	.type	clk_fout_vpll, %object
	.size	clk_fout_vpll, 68
clk_fout_vpll:
	.space	16
	.word	.LC2
	.space	4
	.word	-1
	.space	8
	.word	-2147483648
	.space	28
	.type	clk_fout_dpll, %object
	.size	clk_fout_dpll, 68
clk_fout_dpll:
	.space	16
	.word	.LC3
	.space	4
	.word	-1
	.space	8
	.word	-2147483648
	.space	28
	.type	clk_fout_epll, %object
	.size	clk_fout_epll, 68
clk_fout_epll:
	.space	12
	.word	clk_ext_xtal_mux
	.word	.LC4
	.space	4
	.word	-1
	.space	8
	.word	-2147483648
	.space	28
	.type	clk_fout_mpll, %object
	.size	clk_fout_mpll, 68
clk_fout_mpll:
	.space	16
	.word	.LC5
	.space	4
	.word	-1
	.space	40
	.type	clk_fout_apll, %object
	.size	clk_fout_apll, 68
clk_fout_apll:
	.space	16
	.word	.LC6
	.space	4
	.word	-1
	.space	40
	.type	clk_48m, %object
	.size	clk_48m, 68
clk_48m:
	.space	16
	.word	.LC7
	.space	4
	.word	-1
	.space	4
	.word	48000000
	.space	32
	.type	s5p_clk_27m, %object
	.size	s5p_clk_27m, 68
s5p_clk_27m:
	.space	16
	.word	.LC8
	.space	4
	.word	-1
	.space	4
	.word	27000000
	.space	32
	.type	clk_xxti, %object
	.size	clk_xxti, 68
clk_xxti:
	.space	16
	.word	.LC9
	.space	4
	.word	-1
	.space	40
	.type	clk_xusbxti, %object
	.size	clk_xusbxti, 68
clk_xusbxti:
	.space	16
	.word	.LC10
	.space	4
	.word	-1
	.space	40
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>Failed to register s5p clocks\012\000"
	.space	2
.LC1:
	.ascii	"vpll\000"
	.space	3
.LC2:
	.ascii	"fout_vpll\000"
	.space	2
.LC3:
	.ascii	"fout_dpll\000"
	.space	2
.LC4:
	.ascii	"fout_epll\000"
	.space	2
.LC5:
	.ascii	"fout_mpll\000"
	.space	2
.LC6:
	.ascii	"fout_apll\000"
	.space	2
.LC7:
	.ascii	"clk_48m\000"
.LC8:
	.ascii	"clk_27m\000"
.LC9:
	.ascii	"xxti\000"
	.space	3
.LC10:
	.ascii	"xusbxti\000"
.LC11:
	.ascii	"ext_xtal\000"
	.ident	"GCC: (GNU) 4.8"
