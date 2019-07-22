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
	.file	"clock-exynos4.c"
	.text
	.align	2
	.global	exynos4_clksrc_mask_lcd1_ctrl
	.type	exynos4_clksrc_mask_lcd1_ctrl, %function
exynos4_clksrc_mask_lcd1_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #49976
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clksrc_mask_lcd1_ctrl, .-exynos4_clksrc_mask_lcd1_ctrl
	.align	2
	.global	exynos4_clksrc_mask_fsys_ctrl
	.type	exynos4_clksrc_mask_fsys_ctrl, %function
exynos4_clksrc_mask_fsys_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #49984
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clksrc_mask_fsys_ctrl, .-exynos4_clksrc_mask_fsys_ctrl
	.align	2
	.global	exynos4_clk_ip_leftbus_ctrl
	.type	exynos4_clk_ip_leftbus_ctrl, %function
exynos4_clk_ip_leftbus_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r0, #18432
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_ip_leftbus_ctrl, .-exynos4_clk_ip_leftbus_ctrl
	.align	2
	.global	exynos4_clk_ip_cam_ctrl
	.type	exynos4_clk_ip_cam_ctrl, %function
exynos4_clk_ip_cam_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #51488
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_ip_cam_ctrl, .-exynos4_clk_ip_cam_ctrl
	.align	2
	.global	exynos4_clk_ip_tv_ctrl
	.type	exynos4_clk_ip_tv_ctrl, %function
exynos4_clk_ip_tv_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #51492
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_ip_tv_ctrl, .-exynos4_clk_ip_tv_ctrl
	.align	2
	.global	exynos4_clk_ip_image_ctrl
	.type	exynos4_clk_ip_image_ctrl, %function
exynos4_clk_ip_image_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #18736
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_ip_image_ctrl, .-exynos4_clk_ip_image_ctrl
	.align	2
	.global	exynos4_clk_ip_rightbus_ctrl
	.type	exynos4_clk_ip_rightbus_ctrl, %function
exynos4_clk_ip_rightbus_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r0, #34816
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_ip_rightbus_ctrl, .-exynos4_clk_ip_rightbus_ctrl
	.align	2
	.global	exynos4_clk_ip_fsys_ctrl
	.type	exynos4_clk_ip_fsys_ctrl, %function
exynos4_clk_ip_fsys_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #51520
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_ip_fsys_ctrl, .-exynos4_clk_ip_fsys_ctrl
	.align	2
	.global	exynos4_clk_ip_gps_ctrl
	.type	exynos4_clk_ip_gps_ctrl, %function
exynos4_clk_ip_gps_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #51532
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_ip_gps_ctrl, .-exynos4_clk_ip_gps_ctrl
	.align	2
	.global	exynos4_clk_ip_peril_ctrl
	.type	exynos4_clk_ip_peril_ctrl, %function
exynos4_clk_ip_peril_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #51536
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_ip_peril_ctrl, .-exynos4_clk_ip_peril_ctrl
	.align	2
	.global	exynos4_clk_ip_perir_ctrl
	.type	exynos4_clk_ip_perir_ctrl, %function
exynos4_clk_ip_perir_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #35168
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_ip_perir_ctrl, .-exynos4_clk_ip_perir_ctrl
	.align	2
	.global	exynos4_clk_ip_dmc_ctrl
	.type	exynos4_clk_ip_dmc_ctrl, %function
exynos4_clk_ip_dmc_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r0, #2304
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65041
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_ip_dmc_ctrl, .-exynos4_clk_ip_dmc_ctrl
	.align	2
	.type	exynos4_clk_sclkapll_ctrl, %function
exynos4_clk_sclkapll_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r0, #18432
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65041
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_sclkapll_ctrl, .-exynos4_clk_sclkapll_ctrl
	.align	2
	.type	exynos4_clksrc_mask_top_ctrl, %function
exynos4_clksrc_mask_top_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #49936
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clksrc_mask_top_ctrl, .-exynos4_clksrc_mask_top_ctrl
	.align	2
	.type	exynos4_clksrc_mask_maudio_ctrl, %function
exynos4_clksrc_mask_maudio_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #49980
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clksrc_mask_maudio_ctrl, .-exynos4_clksrc_mask_maudio_ctrl
	.align	2
	.type	exynos4_clk_ip_g3d_ctrl, %function
exynos4_clk_ip_g3d_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #51500
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_ip_g3d_ctrl, .-exynos4_clk_ip_g3d_ctrl
	.align	2
	.type	exynos4_clksrc_mask_peril1_ctrl, %function
exynos4_clksrc_mask_peril1_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #50004
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clksrc_mask_peril1_ctrl, .-exynos4_clksrc_mask_peril1_ctrl
	.align	2
	.type	exynos4_clksrc_mask_lcd0_ctrl, %function
exynos4_clksrc_mask_lcd0_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #49972
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clksrc_mask_lcd0_ctrl, .-exynos4_clksrc_mask_lcd0_ctrl
	.align	2
	.type	exynos4_clksrc_mask_cam_ctrl, %function
exynos4_clksrc_mask_cam_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #49952
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clksrc_mask_cam_ctrl, .-exynos4_clksrc_mask_cam_ctrl
	.align	2
	.type	exynos4_clksrc_mask_peril0_ctrl, %function
exynos4_clksrc_mask_peril0_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #50000
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clksrc_mask_peril0_ctrl, .-exynos4_clksrc_mask_peril0_ctrl
	.align	2
	.type	exynos4_clk_vpll_ctrl, %function
exynos4_clk_vpll_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #49440
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_vpll_ctrl, .-exynos4_clk_vpll_ctrl
	.align	2
	.type	exynos4_clk_audss_ctrl, %function
exynos4_clk_audss_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r0, #8
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65169
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_audss_ctrl, .-exynos4_clk_audss_ctrl
	.align	2
	.type	exynos4_clk_ip_cpu_ctrl, %function
exynos4_clk_ip_cpu_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r0, #18688
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65041
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_ip_cpu_ctrl, .-exynos4_clk_ip_cpu_ctrl
	.align	2
	.type	exynos4_clk_ip_mfc_ctrl, %function
exynos4_clk_ip_mfc_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #51496
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_ip_mfc_ctrl, .-exynos4_clk_ip_mfc_ctrl
	.align	2
	.type	exynos4_clk_ip_lcd0_ctrl, %function
exynos4_clk_ip_lcd0_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #51508
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_ip_lcd0_ctrl, .-exynos4_clk_ip_lcd0_ctrl
	.align	2
	.type	exynos4_clk_dac_ctrl, %function
exynos4_clk_dac_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #1804
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65048
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_dac_ctrl, .-exynos4_clk_dac_ctrl
	.align	2
	.type	exynos4_clk_hdmiphy_ctrl, %function
exynos4_clk_hdmiphy_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	mov	r0, #1792
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65048
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clk_hdmiphy_ctrl, .-exynos4_clk_hdmiphy_ctrl
	.align	2
	.type	exynos4_clksrc_mask_tv_ctrl, %function
exynos4_clksrc_mask_tv_ctrl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #49956
	movw	r3, #:lower16:s5p_gatectrl
	mov	r2, r1
	movt	r3, #:upper16:s5p_gatectrl
	mov	r1, ip
	movt	r0, 65040
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clksrc_mask_tv_ctrl, .-exynos4_clksrc_mask_tv_ctrl
	.align	2
	.type	exynos4_fout_apll_get_rate, %function
exynos4_fout_apll_get_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #16384
	movw	r2, #:lower16:.LANCHOR0
	movt	r3, 65041
	movt	r2, #:upper16:.LANCHOR0
	stmfd	sp!, {r4, lr}
	.save {r4, lr}
	ldr	r3, [r3, #256]
	ldr	r2, [r2]
	ubfx	r0, r3, #16, #10
	ubfx	r4, r3, #8, #6
	and	r3, r3, #7
	mov	r4, r4, asl r3
	umull	r0, r1, r0, r2
@ 34 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/include/plat/pll.h" 1
	.ifnc r1,r1 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r4,r4 ; .err ; .endif
	bl	__do_div64
@ 0 "" 2
	mov	r0, r2
	ldmfd	sp!, {r4, pc}
	.fnend
	.size	exynos4_fout_apll_get_rate, .-exynos4_fout_apll_get_rate
	.align	2
	.type	exynos4_clock_resume, %function
exynos4_clock_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:s3c_pm_do_restore_core
	movt	r0, #:upper16:.LANCHOR1
	movt	r3, #:upper16:s3c_pm_do_restore_core
	mov	r1, #53
	blx	r3
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clock_resume, .-exynos4_clock_resume
	.align	2
	.type	exynos4_clock_suspend, %function
exynos4_clock_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #49152
	stmfd	sp!, {r3, lr}
	.save {r3, lr}
	movt	r2, 65040
	movw	r0, #:lower16:.LANCHOR1
	movw	r3, #:lower16:s3c_pm_do_save
	movt	r0, #:upper16:.LANCHOR1
	ldr	ip, [r2, #532]
	movt	r3, #:upper16:s3c_pm_do_save
	mov	r1, #53
	bic	ip, ip, #17825792
	str	ip, [r2, #532]
	blx	r3
	mov	r0, #0
	ldmfd	sp!, {r3, pc}
	.fnend
	.size	exynos4_clock_suspend, .-exynos4_clock_suspend
	.align	2
	.type	clock_domain_init, %function
clock_domain_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r5, #:lower16:clock_add_domain
	ldr	r4, .L36
	movt	r5, #:upper16:clock_add_domain
	mov	r0, #1
	sub	r1, r4, #204
	add	r6, r4, #612
	blx	r5
	sub	r1, r6, #748
	mov	r0, #1
	blx	r5
	mov	r0, #1
	sub	r1, r6, #680
	blx	r5
.L34:
	mov	r1, r4
	mov	r0, #1
	add	r4, r4, #68
	blx	r5
	cmp	r4, r6
	bne	.L34
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L37:
	.align	2
.L36:
	.word	.LANCHOR1+628
	.fnend
	.size	clock_domain_init, .-clock_domain_init
	.align	2
	.global	exynos4_setup_clocks
	.type	exynos4_setup_clocks, %function
exynos4_setup_clocks:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r0, #:lower16:.LC0
	movw	r1, #:lower16:.LANCHOR2
	movw	fp, #:lower16:printk
	movt	r1, #:upper16:.LANCHOR2
	.pad #44
	sub	sp, sp, #44
	movt	r0, #:upper16:.LC0
	movt	fp, #:upper16:printk
	blx	fp
	movw	r1, #:lower16:.LC1
	movw	r3, #:lower16:clk_get
	movt	r1, #:upper16:.LC1
	movt	r3, #:upper16:clk_get
	mov	r0, #0
	blx	r3
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L46
	movw	r5, #:lower16:clk_get_rate
	movw	r1, #:lower16:.LANCHOR0
	movt	r5, #:upper16:clk_get_rate
	movt	r1, #:upper16:.LANCHOR0
	str	r1, [sp, #24]
	mov	r7, #49152
	blx	r5
	ldr	r2, [sp, #24]
	movw	r3, #:lower16:clk_put
	mov	r8, r0
	movt	r3, #:upper16:clk_put
	mov	r0, r4
	movt	r7, 65040
	str	r8, [r2], #4
	movw	r6, #:lower16:.LANCHOR1
	str	r2, [sp, #24]
	movt	r6, #:upper16:.LANCHOR1
	blx	r3
	movw	r0, #:lower16:.LC2
	movw	r1, #:lower16:.LANCHOR2
	mov	r2, r8
	movt	r1, #:upper16:.LANCHOR2
	movt	r0, #:upper16:.LC2
	blx	fp
	mov	r3, #16384
	mov	r2, #0
	movt	r2, 65041
	movt	r3, 65041
	ldr	r3, [r3, #256]
	movw	r1, #:lower16:clk_fout_vpll
	ldr	r9, [r2, #264]
	ldr	lr, [r7, #272]
	and	r2, r3, #7
	ubfx	r4, r3, #8, #6
	mov	r4, r4, asl r2
	str	r1, [sp, #28]
	str	lr, [sp, #20]
	ubfx	r0, r3, #16, #10
	ldr	r2, [sp, #20]
	ubfx	r3, r9, #8, #6
	ldr	r10, [r7, #276]
	movw	lr, #:lower16:clk_fout_vpll
	str	r3, [sp, #32]
	movt	lr, #:upper16:clk_fout_vpll
	ubfx	r2, r2, #16, #9
	umull	r0, r1, r8, r0
	str	r2, [sp, #36]
	str	lr, [sp, #28]
	uxth	r10, r10
@ 34 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/include/plat/pll.h" 1
	.ifnc r1,r1 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r4,r4 ; .err ; .endif
	bl	__do_div64
@ 0 "" 2
	ldr	lr, [sp, #32]
	and	r4, r9, #7
	ldr	r3, [sp, #36]
	ubfx	r0, r9, #16, #10
	umull	r0, r1, r8, r0
	str	r2, [sp, #32]
	mov	r4, lr, asl r4
	add	r10, r10, r3, asl #16
@ 34 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/include/plat/pll.h" 1
	.ifnc r1,r1 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r4,r4 ; .err ; .endif
	bl	__do_div64
@ 0 "" 2
	ldr	r1, [sp, #20]
	str	r2, [sp, #20]
	and	r3, r1, #7
	ubfx	r4, r1, #8, #6
	mov	r4, r4, asl r3
	umull	r0, r1, r8, r10
@ 62 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/include/plat/pll.h" 1
	.ifnc r1,r1 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r4,r4 ; .err ; .endif
	bl	__do_div64
@ 0 "" 2
	add	r0, r6, #1232
	mov	r9, r2, lsr #16
	add	r0, r0, #8
	orr	r9, r9, r3, asl #16
	movw	r8, #:lower16:clk_fout_epll
	blx	r5
	ldr	r3, [r7, #288]
	movw	r2, #:lower16:clk_fout_mpll
	ldr	ip, [r7, #292]
	movt	r2, #:upper16:clk_fout_mpll
	ldr	lr, [sp, #20]
	movw	r7, #:lower16:clk_fout_apll
	ubfx	r1, r3, #16, #9
	ubfx	r4, r3, #8, #6
	and	r3, r3, #7
	movt	r8, #:upper16:clk_fout_epll
	str	lr, [r2, #32]
	uxth	r2, ip
	mov	r4, r4, asl r3
	movt	r7, #:upper16:clk_fout_apll
	add	r2, r2, r1, asl #16
	add	r10, r6, #1328
	str	r10, [r7, #40]
	umull	r0, r1, r0, r2
	str	r9, [r8, #32]
@ 62 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/plat-s5p/include/plat/pll.h" 1
	.ifnc r1,r1 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r4,r4 ; .err ; .endif
	bl	__do_div64
@ 0 "" 2
	mov	ip, r2, lsr #16
	ldr	lr, [sp, #28]
	ldr	r1, [sp, #32]
	orr	ip, ip, r3, asl #16
	movw	r0, #:lower16:.LC3
	ldr	r2, [sp, #20]
	mov	r3, r9
	str	ip, [sp]
	movt	r0, #:upper16:.LC3
	str	ip, [lr, #32]
	blx	fp
	add	r0, r6, #1344
	blx	r5
	mov	r9, r0
	add	r0, r6, #1424
	add	r0, r0, #8
	blx	r5
	mov	r7, r0
	add	r0, r6, #1520
	blx	r5
	mov	r10, r0
	add	r0, r6, #1600
	add	r0, r0, #8
	blx	r5
	mov	r4, r0
	add	r0, r6, #1696
	blx	r5
	mov	r3, r0
	add	r0, r6, #1776
	str	r3, [sp, #16]
	add	r0, r0, #8
	blx	r5
	ldr	r3, [sp, #16]
	mov	r1, r9
	str	r0, [sp, #4]
	movw	r0, #:lower16:.LC4
	mov	r2, r7
	str	r4, [sp, #8]
	str	r3, [sp]
	movt	r0, #:upper16:.LC4
	mov	r3, r10
	blx	fp
	movw	r0, #:lower16:exynos4212_clk_aclk_400_mcuisp
	movt	r0, #:upper16:exynos4212_clk_aclk_400_mcuisp
	blx	r5
	mov	r10, r0
	movw	r0, #:lower16:exynos4212_clk_aclk_266
	movt	r0, #:upper16:exynos4212_clk_aclk_266
	blx	r5
	mov	r2, r0
	movw	r0, #:lower16:.LC5
	mov	r1, r10
	movt	r0, #:upper16:.LC5
	blx	fp
	ldr	r5, [sp, #24]
	movw	lr, #:lower16:clk_f
	movw	ip, #:lower16:clk_h
	movw	r2, #:lower16:clk_p
	movw	r3, #:lower16:clk_set_parent
	movt	lr, #:upper16:clk_f
	movt	ip, #:upper16:clk_h
	movt	r2, #:upper16:clk_p
	add	r0, r6, #1872
	movt	r3, #:upper16:clk_set_parent
	mov	r1, r8
	str	r5, [r8, #40]
	str	r9, [lr, #32]
	str	r7, [ip, #32]
	str	r4, [r2, #32]
	blx	r3
	cmp	r0, #0
	bne	.L47
.L40:
	ldr	r4, .L48
	movw	r2, #:lower16:exynos4_clk_vpll_ctrl
	ldr	lr, [sp, #28]
	mov	r1, #57600
	ldr	ip, .L48+4
	movw	r3, #:lower16:clk_set_rate
	movw	r5, #:lower16:s3c_set_clksrc
	movt	r2, #:upper16:exynos4_clk_vpll_ctrl
	movt	r1, 1525
	movt	r3, #:upper16:clk_set_rate
	sub	r0, r4, #88
	add	r6, r4, #3696
	movt	r5, #:upper16:s3c_set_clksrc
	str	r2, [lr, #44]
	str	ip, [lr, #40]
	blx	r3
.L42:
	mov	r0, r4
	mov	r1, #1
	add	r4, r4, #88
	blx	r5
	cmp	r4, r6
	bne	.L42
	add	sp, sp, #44
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L46:
@ 2295 "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/clock-exynos4.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/media/system1/root/CM14/kernel/samsung/smdk4412/arch/arm/mach-exynos/clock-exynos4.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 2295, 0
.popsection
@ 0 "" 2
.L47:
	movw	r0, #:lower16:.LC6
	ldr	r1, [r8, #16]
	ldr	r2, [r6, #1888]
	movt	r0, #:upper16:.LC6
	blx	fp
	b	.L40
.L49:
	.align	2
.L48:
	.word	.LANCHOR1+2048
	.word	.LANCHOR0+20
	.fnend
	.size	exynos4_setup_clocks, .-exynos4_setup_clocks
	.align	2
	.global	exynos4_register_clocks
	.type	exynos4_register_clocks, %function
exynos4_register_clocks:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r3, #:lower16:s3c24xx_register_clocks
	ldr	r5, .L53
	movw	r6, #:lower16:s3c_register_clksrc
	movt	r3, #:upper16:s3c24xx_register_clocks
	mov	r1, #2
	ldr	r0, .L53+4
	movt	r6, #:upper16:s3c_register_clksrc
	add	r7, r5, #208
	blx	r3
.L52:
	ldr	r0, [r5, #4]!
	mov	r1, #1
	blx	r6
	movw	r4, #:lower16:s3c_register_clksrc
	cmp	r5, r7
	movt	r4, #:upper16:s3c_register_clksrc
	bne	.L52
	ldr	r0, .L53+8
	mov	r1, #1
	blx	r4
	ldr	r0, .L53+12
	mov	r1, #1
	blx	r4
	ldr	r0, .L53+16
	mov	r1, #1
	blx	r4
	ldr	r0, .L53+20
	mov	r1, #1
	blx	r4
	movw	r5, #:lower16:s3c_register_clocks
	ldr	r0, .L53+24
	mov	r1, #42
	movt	r5, #:upper16:s3c_register_clocks
	blx	r4
	ldr	r0, .L53+28
	mov	r1, #32
	blx	r5
	movw	r4, #:lower16:s3c_disable_clocks
	ldr	r0, .L53+32
	mov	r1, #84
	movt	r4, #:upper16:s3c_disable_clocks
	blx	r5
	ldr	r0, .L53+32
	mov	r1, #84
	blx	r4
	ldr	r0, .L53+36
	mov	r1, #3
	blx	r5
	ldr	r0, .L53+36
	mov	r1, #3
	blx	r4
	ldr	r0, .L53+40
	mov	r1, #3
	blx	r5
	ldr	r0, .L53+40
	mov	r1, #3
	blx	r4
	ldr	r0, .L53+44
	mov	r1, #9
	blx	r5
	ldr	r0, .L53+44
	mov	r1, #9
	blx	r4
	ldr	r0, .L53+48
	mov	r1, #1
	blx	r5
	mov	r1, #1
	ldr	r0, .L53+48
	blx	r4
	movw	r3, #:lower16:register_syscore_ops
	ldr	r0, .L53+52
	movt	r3, #:upper16:register_syscore_ops
	blx	r3
	movw	r3, #:lower16:s3c_pwmclk_init
	movt	r3, #:upper16:s3c_pwmclk_init
	blx	r3
	ldmfd	sp!, {r3, r4, r5, r6, r7, pc}
.L54:
	.align	2
.L53:
	.word	.LANCHOR2+20
	.word	.LANCHOR3-2440
	.word	.LANCHOR3-2432
	.word	.LANCHOR3-2344
	.word	.LANCHOR3-2256
	.word	.LANCHOR3-2168
	.word	.LANCHOR1+2048
	.word	.LANCHOR3-2080
	.word	.LANCHOR3+96
	.word	.LANCHOR4-2376
	.word	.LANCHOR1+424
	.word	.LANCHOR1+628
	.word	.LANCHOR4-2172
	.word	.LANCHOR4-2104
	.fnend
	.size	exynos4_register_clocks, .-exynos4_register_clocks
	.global	exynos4_clock_syscore_ops
	.global	exynos4_vpll_ops
	.global	exynos4_epll_ops
	.global	exynos4_clkset_mout_mfc0_list
	.global	exynos4_clk_fimg2d
	.global	exynos4_clk_sclk_fimg2d
	.global	exynos4_clk_mout_g2d1
	.global	exynos4_clkset_mout_g2d1
	.global	exynos4_clk_mout_g2d0
	.global	exynos4_clkset_group
	.global	exynos4_clkset_group_list
	.global	exynos4_init_dmaclocks
	.global	exynos4_clk_sclk_vpll
	.global	exynos4_clk_aclk_133
	.global	exynos4_clk_aclk_160
	.global	exynos4_clk_aclk_200
	.global	exynos4_clkset_aclk
	.global	exynos4_clkset_aclk_top_list
	.global	exynos4_clkset_mout_corebus
	.global	exynos4_clkset_corebus_list
	.global	exynos4_clk_mout_mpll
	.global	exynos4_clk_mout_epll
	.global	exynos4_clk_audiocdclk0
	.global	exynos4_clk_sclk_apll
	.global	exynos4_clk_sclk_usbphy1
	.global	exynos4_clk_sclk_usbphy0
	.global	exynos4_clk_sclk_hdmiphy
	.global	exynos4_clk_sclk_hdmi27m
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.15435, %object
	.size	__func__.15435, 21
__func__.15435:
	.ascii	"exynos4_setup_clocks\000"
	.space	3
	.type	exynos4_sysclks, %object
	.size	exynos4_sysclks, 208
exynos4_sysclks:
	.word	exynos4_clk_audiocdclk0
	.word	exynos4_clk_mout_apll
	.word	exynos4_clk_sclk_apll
	.word	exynos4_clk_mout_epll
	.word	exynos4_clk_mout_mpll
	.word	exynos4_clk_moutcore
	.word	exynos4_clk_coreclk
	.word	exynos4_clk_armclk
	.word	exynos4_clk_aclk_corem0
	.word	exynos4_clk_aclk_cores
	.word	exynos4_clk_aclk_corem1
	.word	exynos4_clk_periphclk
	.word	exynos4_clk_mout_corebus
	.word	exynos4_clk_sclk_dmc
	.word	exynos4_clk_aclk_cored
	.word	exynos4_clk_aclk_corep
	.word	exynos4_clk_aclk_acp
	.word	exynos4_clk_pclk_acp
	.word	exynos4_clk_vpllsrc
	.word	exynos4_clk_sclk_vpll
	.word	exynos4_clk_aclk_200
	.word	exynos4_clk_aclk_100
	.word	exynos4_clk_aclk_160
	.word	exynos4_clk_aclk_133
	.word	exynos4_clk_aclk_gdl
	.word	exynos4_clk_aclk_gdr
	.word	exynos4_clk_mout_mfc0
	.word	exynos4_clk_mout_mfc1
	.word	exynos4_clk_dout_mmc0
	.word	exynos4_clk_dout_mmc1
	.word	exynos4_clk_dout_mmc2
	.word	exynos4_clk_dout_mmc3
	.word	exynos4_clk_dout_mmc4
	.word	exynos4_clk_mout_audss
	.word	exynos4_clk_sclk_audss_bus
	.word	exynos4_clk_sclk_audss_i2s
	.word	exynos4_clk_dout_audss_srp
	.word	exynos4_clk_sclk_audio0
	.word	exynos4_clk_sclk_audio1
	.word	exynos4_clk_sclk_audio2
	.word	exynos4_clk_sclk_spdif
	.word	exynos4_clk_mout_g2d0
	.word	exynos4_clk_mout_g2d1
	.word	exynos4_clk_dout_copy
	.word	exynos4_clk_mout_g3d0
	.word	exynos4_clk_mout_g3d1
	.word	exynos4_clk_dout_spi0
	.word	exynos4_clk_dout_spi1
	.word	exynos4_clk_dout_spi2
	.word	exynos4_clk_sclk_c2c
	.word	exynos4_clk_aclk_c2c
	.word	exynos4_clk_sclk_fimg2d
	.section	.initcall7.init,"aw",%progbits
	.align	2
	.type	__initcall_clock_domain_init7, %object
	.size	__initcall_clock_domain_init7, 4
__initcall_clock_domain_init7:
	.word	clock_domain_init
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.set	.LANCHOR3,. + 8184
	.set	.LANCHOR4,. + 16368
	.type	exynos4_clock_save, %object
	.size	exynos4_clock_save, 424
exynos4_clock_save:
	.word	-32455904
	.space	4
	.word	-32455900
	.space	4
	.word	-32455884
	.space	4
	.word	-32455876
	.space	4
	.word	-32455872
	.space	4
	.word	-32455856
	.space	4
	.word	-32455852
	.space	4
	.word	-32439552
	.space	4
	.word	-32487424
	.space	4
	.word	-32471040
	.space	4
	.word	-32454624
	.space	4
	.word	-32454368
	.space	4
	.word	-32454364
	.space	4
	.word	-32454360
	.space	4
	.word	-32454356
	.space	4
	.word	-32454348
	.space	4
	.word	-32454336
	.space	4
	.word	-32454324
	.space	4
	.word	-32454320
	.space	4
	.word	-32454288
	.space	4
	.word	-32438016
	.space	4
	.word	-32421888
	.space	4
	.word	-32421632
	.space	4
	.word	-32488192
	.space	4
	.word	-32471808
	.space	4
	.word	-32455392
	.space	4
	.word	-32455388
	.space	4
	.word	-32455384
	.space	4
	.word	-32455380
	.space	4
	.word	-32455372
	.space	4
	.word	-32455364
	.space	4
	.word	-32455360
	.space	4
	.word	-32455356
	.space	4
	.word	-32455352
	.space	4
	.word	-32455348
	.space	4
	.word	-32455344
	.space	4
	.word	-32455340
	.space	4
	.word	-32455336
	.space	4
	.word	-32455332
	.space	4
	.word	-32455328
	.space	4
	.word	-32455324
	.space	4
	.word	-32455408
	.space	4
	.word	-32456176
	.space	4
	.word	-32456172
	.space	4
	.word	-32456160
	.space	4
	.word	-32456152
	.space	4
	.word	-32456140
	.space	4
	.word	-32456132
	.space	4
	.word	-32456128
	.space	4
	.word	-32456112
	.space	4
	.word	-32456108
	.space	4
	.word	-32439808
	.space	4
	.word	-32423424
	.space	4
	.type	exynos4_init_dmaclocks, %object
	.size	exynos4_init_dmaclocks, 204
exynos4_init_dmaclocks:
	.space	16
	.word	.LC97
	.word	.LC98
	.space	12
	.word	292
	.space	4
	.word	exynos4_clk_ip_image_ctrl
	.space	20
	.space	16
	.word	.LC97
	.word	.LC99
	.space	12
	.word	1
	.space	4
	.word	exynos4_clk_ip_fsys_ctrl
	.space	20
	.space	16
	.word	.LC97
	.word	.LC100
	.space	12
	.word	2
	.space	4
	.word	exynos4_clk_ip_fsys_ctrl
	.space	20
	.type	exynos4_i2cs_clocks, %object
	.size	exynos4_i2cs_clocks, 612
exynos4_i2cs_clocks:
	.space	12
	.word	exynos4_clk_aclk_100
	.word	.LC113
	.word	.LC114
	.space	12
	.word	64
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	12
	.word	exynos4_clk_aclk_100
	.word	.LC113
	.word	.LC115
	.space	12
	.word	128
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	12
	.word	exynos4_clk_aclk_100
	.word	.LC113
	.word	.LC116
	.space	12
	.word	256
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	12
	.word	exynos4_clk_aclk_100
	.word	.LC113
	.word	.LC117
	.space	12
	.word	512
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	12
	.word	exynos4_clk_aclk_100
	.word	.LC113
	.word	.LC118
	.space	12
	.word	1024
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	12
	.word	exynos4_clk_aclk_100
	.word	.LC113
	.word	.LC119
	.space	12
	.word	2048
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	12
	.word	exynos4_clk_aclk_100
	.word	.LC113
	.word	.LC120
	.space	12
	.word	4096
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	12
	.word	exynos4_clk_aclk_100
	.word	.LC113
	.word	.LC121
	.space	12
	.word	8192
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	12
	.word	exynos4_clk_aclk_100
	.word	.LC113
	.word	.LC122
	.space	12
	.word	16384
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.type	exynos4_clk_vpllsrc, %object
	.size	exynos4_clk_vpllsrc, 88
exynos4_clk_vpllsrc:
	.space	16
	.word	.LC207
	.space	16
	.word	1
	.space	4
	.word	exynos4_clksrc_mask_top_ctrl
	.space	20
	.word	exynos4_clkset_vpllsrc
	.word	-32456172
	.short	0
	.short	1
	.space	8
	.type	exynos4_fout_apll_ops, %object
	.size	exynos4_fout_apll_ops, 16
exynos4_fout_apll_ops:
	.space	4
	.word	exynos4_fout_apll_get_rate
	.space	8
	.type	exynos4_clk_armclk, %object
	.size	exynos4_clk_armclk, 88
exynos4_clk_armclk:
	.space	12
	.word	exynos4_clk_coreclk
	.word	.LC226
	.space	48
	.space	20
	.type	exynos4_clk_sclk_dmc, %object
	.size	exynos4_clk_sclk_dmc, 88
exynos4_clk_sclk_dmc:
	.space	12
	.word	exynos4_clk_mout_corebus
	.word	.LC220
	.space	48
	.space	12
	.word	-32439040
	.short	12
	.short	3
	.type	exynos4_clk_aclk_200, %object
	.size	exynos4_clk_aclk_200, 88
exynos4_clk_aclk_200:
	.space	16
	.word	.LC213
	.space	48
	.space	20
	.type	exynos4_clk_aclk_100, %object
	.size	exynos4_clk_aclk_100, 88
exynos4_clk_aclk_100:
	.space	16
	.word	.LC212
	.space	48
	.word	exynos4_clkset_aclk
	.word	-32456176
	.short	16
	.short	1
	.word	-32455408
	.short	4
	.short	4
	.type	exynos4_clk_aclk_160, %object
	.size	exynos4_clk_aclk_160, 88
exynos4_clk_aclk_160:
	.space	16
	.word	.LC211
	.space	48
	.word	exynos4_clkset_aclk
	.word	-32456176
	.short	20
	.short	1
	.word	-32455408
	.short	8
	.short	3
	.type	exynos4_clk_aclk_133, %object
	.size	exynos4_clk_aclk_133, 88
exynos4_clk_aclk_133:
	.space	16
	.word	.LC210
	.space	48
	.word	exynos4_clkset_aclk
	.word	-32456176
	.short	24
	.short	1
	.word	-32455408
	.short	12
	.short	3
	.type	exynos4_clk_mout_epll, %object
	.size	exynos4_clk_mout_epll, 88
exynos4_clk_mout_epll:
	.space	12
	.word	clk_fout_epll
	.word	.LC230
	.space	48
	.word	clk_src_epll
	.word	-32456176
	.short	4
	.short	1
	.space	8
	.type	exynos4_clk_sclk_apll, %object
	.size	exynos4_clk_sclk_apll, 88
exynos4_clk_sclk_apll:
	.space	12
	.word	exynos4_clk_mout_apll
	.word	.LC232
	.space	16
	.word	1
	.space	4
	.word	exynos4_clk_sclkapll_ctrl
	.space	20
	.space	12
	.word	-32422656
	.short	24
	.short	3
	.type	exynos4_clksrcs, %object
	.size	exynos4_clksrcs, 3696
exynos4_clksrcs:
	.space	16
	.word	.LC7
	.word	.LC8
	.space	12
	.word	1
	.space	4
	.word	exynos4_clksrc_mask_peril0_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456112
	.short	0
	.short	4
	.word	-32455344
	.short	0
	.short	4
	.space	16
	.word	.LC7
	.word	.LC9
	.space	12
	.word	16
	.space	4
	.word	exynos4_clksrc_mask_peril0_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456112
	.short	4
	.short	4
	.word	-32455344
	.short	4
	.short	4
	.space	16
	.word	.LC7
	.word	.LC10
	.space	12
	.word	256
	.space	4
	.word	exynos4_clksrc_mask_peril0_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456112
	.short	8
	.short	4
	.word	-32455344
	.short	8
	.short	4
	.space	16
	.word	.LC7
	.word	.LC11
	.space	12
	.word	4096
	.space	4
	.word	exynos4_clksrc_mask_peril0_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456112
	.short	12
	.short	4
	.word	-32455344
	.short	12
	.short	4
	.space	16
	.word	.LC12
	.word	.LC13
	.space	12
	.word	16777216
	.space	4
	.word	exynos4_clksrc_mask_cam_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456160
	.short	24
	.short	4
	.word	-32455392
	.short	24
	.short	4
	.space	16
	.word	.LC12
	.word	.LC14
	.space	12
	.word	268435456
	.space	4
	.word	exynos4_clksrc_mask_cam_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456160
	.short	28
	.short	4
	.word	-32455392
	.short	28
	.short	4
	.space	16
	.word	.LC15
	.space	16
	.word	65536
	.space	4
	.word	exynos4_clksrc_mask_cam_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456160
	.short	16
	.short	4
	.word	-32455392
	.short	16
	.short	4
	.space	16
	.word	.LC16
	.space	16
	.word	1048576
	.space	4
	.word	exynos4_clksrc_mask_cam_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456160
	.short	20
	.short	4
	.word	-32455392
	.short	20
	.short	4
	.space	16
	.word	.LC17
	.word	.LC18
	.space	12
	.word	1
	.space	4
	.word	exynos4_clksrc_mask_cam_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456160
	.short	0
	.short	4
	.word	-32455392
	.short	0
	.short	4
	.space	16
	.word	.LC17
	.word	.LC19
	.space	12
	.word	16
	.space	4
	.word	exynos4_clksrc_mask_cam_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456160
	.short	4
	.short	4
	.word	-32455392
	.short	4
	.short	4
	.space	16
	.word	.LC17
	.word	.LC20
	.space	12
	.word	256
	.space	4
	.word	exynos4_clksrc_mask_cam_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456160
	.short	8
	.short	4
	.word	-32455392
	.short	8
	.short	4
	.space	16
	.word	.LC17
	.word	.LC21
	.space	12
	.word	4096
	.space	4
	.word	exynos4_clksrc_mask_cam_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456160
	.short	12
	.short	4
	.word	-32455392
	.short	12
	.short	4
	.space	16
	.word	.LC22
	.word	.LC23
	.space	12
	.word	1
	.space	4
	.word	exynos4_clksrc_mask_lcd0_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456140
	.short	0
	.short	4
	.word	-32455372
	.short	0
	.short	4
	.space	16
	.word	.LC22
	.word	.LC24
	.space	12
	.word	1
	.space	4
	.word	exynos4_clksrc_mask_lcd1_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456136
	.short	0
	.short	4
	.word	-32455368
	.short	0
	.short	4
	.space	16
	.word	.LC25
	.space	4
	.word	-1
	.space	8
	.word	16
	.space	4
	.word	exynos4_clksrc_mask_lcd0_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456140
	.short	4
	.short	4
	.word	-32455372
	.short	4
	.short	4
	.space	16
	.word	.LC25
	.space	4
	.word	1
	.space	8
	.word	16
	.space	4
	.word	exynos4_clksrc_mask_lcd1_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456136
	.short	4
	.short	4
	.word	-32455368
	.short	4
	.short	4
	.space	16
	.word	.LC26
	.space	4
	.word	-1
	.space	8
	.word	256
	.space	4
	.word	exynos4_clksrc_mask_lcd0_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456140
	.short	8
	.short	4
	.word	-32455372
	.short	8
	.short	4
	.space	16
	.word	.LC26
	.space	4
	.word	1
	.space	8
	.word	256
	.space	4
	.word	exynos4_clksrc_mask_lcd1_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456136
	.short	8
	.short	4
	.word	-32455368
	.short	8
	.short	4
	.space	12
	.word	clk_sclk_mipidphy4l
	.word	.LC27
	.space	4
	.word	-1
	.space	8
	.word	4096
	.space	4
	.word	exynos4_clksrc_mask_lcd0_ctrl
	.space	20
	.space	12
	.word	-32455372
	.short	20
	.short	4
	.space	12
	.word	clk_sclk_mipidphy2l
	.word	.LC27
	.space	4
	.word	1
	.space	8
	.word	4096
	.space	4
	.word	exynos4_clksrc_mask_lcd1_ctrl
	.space	20
	.space	12
	.word	-32455368
	.short	20
	.short	4
	.space	12
	.word	exynos4_clk_dout_mmc0
	.word	.LC28
	.space	4
	.word	0
	.space	8
	.word	1
	.space	4
	.word	exynos4_clksrc_mask_fsys_ctrl
	.space	20
	.space	12
	.word	-32455356
	.short	8
	.short	8
	.space	12
	.word	exynos4_clk_dout_mmc1
	.word	.LC28
	.space	4
	.word	1
	.space	8
	.word	16
	.space	4
	.word	exynos4_clksrc_mask_fsys_ctrl
	.space	20
	.space	12
	.word	-32455356
	.short	24
	.short	8
	.space	12
	.word	exynos4_clk_dout_mmc2
	.word	.LC28
	.space	4
	.word	2
	.space	8
	.word	256
	.space	4
	.word	exynos4_clksrc_mask_fsys_ctrl
	.space	20
	.space	12
	.word	-32455352
	.short	8
	.short	8
	.space	12
	.word	exynos4_clk_dout_mmc3
	.word	.LC28
	.space	4
	.word	3
	.space	8
	.word	4096
	.space	4
	.word	exynos4_clksrc_mask_fsys_ctrl
	.space	20
	.space	12
	.word	-32455352
	.short	24
	.short	8
	.space	12
	.word	exynos4_clk_dout_mmc4
	.word	.LC29
	.space	4
	.word	-1
	.space	8
	.word	65536
	.space	4
	.word	exynos4_clksrc_mask_fsys_ctrl
	.space	20
	.space	12
	.word	-32455348
	.short	8
	.short	8
	.space	12
	.word	exynos4_clk_dout_spi0
	.word	.LC30
	.word	.LC31
	.space	12
	.word	65536
	.space	4
	.word	exynos4_clksrc_mask_peril1_ctrl
	.space	20
	.space	12
	.word	-32455340
	.short	8
	.short	8
	.space	12
	.word	exynos4_clk_dout_spi1
	.word	.LC30
	.word	.LC32
	.space	12
	.word	1048576
	.space	4
	.word	exynos4_clksrc_mask_peril1_ctrl
	.space	20
	.space	12
	.word	-32455340
	.short	24
	.short	8
	.space	12
	.word	exynos4_clk_dout_spi2
	.word	.LC30
	.word	.LC33
	.space	12
	.word	16777216
	.space	4
	.word	exynos4_clksrc_mask_peril1_ctrl
	.space	20
	.space	12
	.word	-32455336
	.short	8
	.short	8
	.space	16
	.word	.LC34
	.space	48
	.word	exynos4_clkset_mout_mfc
	.word	-32456152
	.short	8
	.short	1
	.word	-32455384
	.short	0
	.short	4
	.space	16
	.word	.LC35
	.space	16
	.word	1
	.space	4
	.word	exynos4_clk_ip_g3d_ctrl
	.space	20
	.word	exynos4_clkset_mout_g3d
	.word	-32456148
	.short	8
	.short	1
	.word	-32455380
	.short	0
	.short	4
	.space	12
	.word	exynos4_clk_dout_mmc0
	.word	.LC28
	.word	.LC36
	.space	12
	.word	1
	.space	4
	.word	exynos4_clksrc_mask_fsys_ctrl
	.space	20
	.space	12
	.word	-32455356
	.short	8
	.short	8
	.space	12
	.word	exynos4_clk_dout_mmc1
	.word	.LC28
	.word	.LC37
	.space	12
	.word	16
	.space	4
	.word	exynos4_clksrc_mask_fsys_ctrl
	.space	20
	.space	12
	.word	-32455356
	.short	24
	.short	8
	.space	12
	.word	exynos4_clk_dout_mmc2
	.word	.LC28
	.word	.LC38
	.space	12
	.word	256
	.space	4
	.word	exynos4_clksrc_mask_fsys_ctrl
	.space	20
	.space	12
	.word	-32455352
	.short	8
	.short	8
	.space	12
	.word	exynos4_clk_dout_mmc3
	.word	.LC28
	.word	.LC39
	.space	12
	.word	4096
	.space	4
	.word	exynos4_clksrc_mask_fsys_ctrl
	.space	20
	.space	12
	.word	-32455352
	.short	24
	.short	8
	.space	12
	.word	exynos4_clk_dout_mmc4
	.word	.LC29
	.space	16
	.word	65536
	.space	4
	.word	exynos4_clksrc_mask_fsys_ctrl
	.space	20
	.space	12
	.word	-32455348
	.short	8
	.short	8
	.space	12
	.word	exynos4_clk_sclk_audio0
	.word	.LC40
	.word	.LC41
	.space	44
	.space	12
	.word	-32455364
	.short	4
	.short	8
	.space	12
	.word	exynos4_clk_sclk_audio1
	.word	.LC40
	.word	.LC42
	.space	44
	.space	12
	.word	-32455328
	.short	4
	.short	8
	.space	12
	.word	exynos4_clk_sclk_audio2
	.word	.LC40
	.word	.LC43
	.space	44
	.space	12
	.word	-32455328
	.short	20
	.short	8
	.space	12
	.word	exynos4_clk_sclk_audio1
	.word	.LC44
	.space	48
	.space	12
	.word	-32455324
	.short	0
	.short	6
	.space	12
	.word	exynos4_clk_sclk_audio2
	.word	.LC44
	.space	48
	.space	12
	.word	-32455324
	.short	8
	.short	6
	.space	12
	.word	exynos4_clk_dout_copy
	.word	.LC45
	.space	48
	.space	12
	.word	-32422652
	.short	4
	.short	3
	.space	16
	.word	.LC46
	.space	48
	.word	exynos4_clkset_group
	.word	-32439808
	.short	16
	.short	4
	.word	-32439036
	.short	8
	.short	4
	.type	exynos4_clks, %object
	.size	exynos4_clks, 8
exynos4_clks:
	.word	exynos4_clk_sclk_hdmi27m
	.word	exynos4_clk_sclk_hdmiphy
	.type	exynos4_clk_sclk_dac, %object
	.size	exynos4_clk_sclk_dac, 88
exynos4_clk_sclk_dac:
	.space	16
	.word	.LC205
	.space	16
	.word	256
	.space	4
	.word	exynos4_clksrc_mask_tv_ctrl
	.space	20
	.word	exynos4_clkset_sclk_dac
	.word	-32456156
	.short	8
	.short	1
	.space	8
	.type	exynos4_clk_sclk_pixel, %object
	.size	exynos4_clk_sclk_pixel, 88
exynos4_clk_sclk_pixel:
	.space	12
	.word	exynos4_clk_sclk_vpll
	.word	.LC204
	.space	48
	.space	12
	.word	-32455388
	.short	0
	.short	4
	.type	exynos4_clk_sclk_hdmi, %object
	.size	exynos4_clk_sclk_hdmi, 88
exynos4_clk_sclk_hdmi:
	.space	16
	.word	.LC203
	.space	16
	.word	1
	.space	4
	.word	exynos4_clksrc_mask_tv_ctrl
	.space	20
	.word	exynos4_clkset_sclk_hdmi
	.word	-32456156
	.short	0
	.short	1
	.space	8
	.type	exynos4_clk_sclk_mixer, %object
	.size	exynos4_clk_sclk_mixer, 88
exynos4_clk_sclk_mixer:
	.space	16
	.word	.LC202
	.space	4
	.word	-1
	.space	8
	.word	16
	.space	4
	.word	exynos4_clksrc_mask_tv_ctrl
	.space	20
	.word	exynos4_clkset_sclk_mixer
	.word	-32456156
	.short	4
	.short	1
	.space	8
	.type	exynos4_init_clocks, %object
	.size	exynos4_init_clocks, 2176
exynos4_init_clocks:
	.space	16
	.word	.LC67
	.space	16
	.word	4096
	.space	4
	.word	exynos4_clk_ip_perir_ctrl
	.space	20
	.space	16
	.word	.LC68
	.word	.LC69
	.space	12
	.word	1024
	.space	4
	.word	exynos4_clk_ip_perir_ctrl
	.space	20
	.space	16
	.word	.LC68
	.word	.LC70
	.space	12
	.word	512
	.space	4
	.word	exynos4_clk_ip_perir_ctrl
	.space	20
	.space	16
	.word	.LC68
	.word	.LC71
	.space	12
	.word	256
	.space	4
	.word	exynos4_clk_ip_perir_ctrl
	.space	20
	.space	16
	.word	.LC68
	.word	.LC72
	.space	12
	.word	128
	.space	4
	.word	exynos4_clk_ip_perir_ctrl
	.space	20
	.space	16
	.word	.LC68
	.word	.LC73
	.space	12
	.word	64
	.space	4
	.word	exynos4_clk_ip_perir_ctrl
	.space	20
	.space	16
	.word	.LC68
	.word	.LC74
	.space	12
	.word	32
	.space	4
	.word	exynos4_clk_ip_perir_ctrl
	.space	20
	.space	16
	.word	.LC75
	.space	16
	.word	2
	.space	4
	.word	exynos4_clk_ip_cpu_ctrl
	.space	20
	.space	16
	.word	.LC76
	.space	16
	.word	1048576
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC77
	.space	16
	.word	32768
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC78
	.space	16
	.word	8192
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC79
	.space	16
	.word	128
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC80
	.space	16
	.word	64
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC81
	.space	16
	.word	32
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC82
	.space	16
	.word	4
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC83
	.space	16
	.word	1
	.space	4
	.word	exynos4_clk_ip_g3d_ctrl
	.space	20
	.space	16
	.word	.LC84
	.space	16
	.word	131072
	.space	4
	.word	exynos4_clk_ip_perir_ctrl
	.space	20
	.space	16
	.word	.LC85
	.space	16
	.word	8192
	.space	4
	.word	exynos4_clk_ip_perir_ctrl
	.space	20
	.space	16
	.word	.LC86
	.space	16
	.word	8
	.space	4
	.word	exynos4_clk_ip_perir_ctrl
	.space	20
	.space	16
	.word	.LC87
	.space	16
	.word	4
	.space	4
	.word	exynos4_clk_ip_perir_ctrl
	.space	20
	.space	16
	.word	.LC88
	.space	16
	.word	2
	.space	4
	.word	exynos4_clk_ip_perir_ctrl
	.space	20
	.space	16
	.word	.LC89
	.space	16
	.word	1
	.space	4
	.word	exynos4_clk_ip_perir_ctrl
	.space	20
	.space	16
	.word	.LC90
	.word	.LC8
	.space	12
	.word	1
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	16
	.word	.LC90
	.word	.LC9
	.space	12
	.word	2
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	16
	.word	.LC90
	.word	.LC10
	.space	12
	.word	4
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	16
	.word	.LC90
	.word	.LC11
	.space	12
	.word	8
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	16
	.word	.LC90
	.word	.LC91
	.space	12
	.word	16
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	16
	.word	.LC92
	.word	.LC23
	.space	12
	.word	1
	.space	4
	.word	exynos4_clk_ip_lcd0_ctrl
	.space	20
	.space	16
	.word	.LC93
	.space	16
	.word	2
	.space	4
	.word	exynos4_clk_ip_lcd0_ctrl
	.space	20
	.space	16
	.word	.LC94
	.space	16
	.word	4
	.space	4
	.word	exynos4_clk_ip_lcd0_ctrl
	.space	20
	.space	16
	.word	.LC95
	.space	16
	.word	8
	.space	4
	.word	exynos4_clk_ip_lcd0_ctrl
	.space	20
	.space	16
	.word	.LC96
	.space	16
	.word	32
	.space	4
	.word	exynos4_clk_ip_lcd0_ctrl
	.space	20
	.type	exynos4_init_clocks_off, %object
	.size	exynos4_init_clocks_off, 5712
exynos4_init_clocks_off:
	.space	16
	.word	.LC123
	.space	16
	.word	2
	.space	4
	.word	exynos4_clk_ip_rightbus_ctrl
	.space	20
	.space	16
	.word	.LC124
	.space	16
	.word	2
	.space	4
	.word	exynos4_clk_ip_leftbus_ctrl
	.space	20
	.space	12
	.word	exynos4_clk_aclk_100
	.word	.LC125
	.space	16
	.word	16777216
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	16
	.word	.LC126
	.word	.LC13
	.space	12
	.word	16
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC126
	.word	.LC14
	.space	12
	.word	32
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC127
	.word	.LC18
	.space	12
	.word	1
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC127
	.word	.LC19
	.space	12
	.word	2
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC127
	.word	.LC20
	.space	12
	.word	4
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC127
	.word	.LC21
	.space	12
	.word	8
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC128
	.space	16
	.word	2112
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC129
	.space	16
	.word	131072
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC130
	.space	16
	.word	262144
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC131
	.space	16
	.word	65536
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC128
	.space	16
	.word	64
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC132
	.word	.LC133
	.space	12
	.word	2
	.space	4
	.word	exynos4_clk_ip_image_ctrl
	.space	20
	.space	16
	.word	.LC134
	.word	.LC36
	.space	12
	.word	32
	.space	4
	.word	exynos4_clk_ip_fsys_ctrl
	.space	20
	.space	16
	.word	.LC134
	.word	.LC37
	.space	12
	.word	64
	.space	4
	.word	exynos4_clk_ip_fsys_ctrl
	.space	20
	.space	16
	.word	.LC134
	.word	.LC38
	.space	12
	.word	128
	.space	4
	.word	exynos4_clk_ip_fsys_ctrl
	.space	20
	.space	16
	.word	.LC134
	.word	.LC39
	.space	12
	.word	256
	.space	4
	.word	exynos4_clk_ip_fsys_ctrl
	.space	20
	.space	16
	.word	.LC135
	.space	16
	.word	512
	.space	4
	.word	exynos4_clk_ip_fsys_ctrl
	.space	20
	.space	16
	.word	.LC136
	.space	16
	.word	32768
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	16
	.word	.LC137
	.space	16
	.word	65536
	.space	4
	.word	exynos4_clk_ip_perir_ctrl
	.space	20
	.space	16
	.word	.LC138
	.space	16
	.word	32768
	.space	4
	.word	exynos4_clk_ip_perir_ctrl
	.space	20
	.space	16
	.word	.LC139
	.space	16
	.word	16384
	.space	4
	.word	exynos4_clk_ip_perir_ctrl
	.space	20
	.space	16
	.word	.LC140
	.space	16
	.word	2048
	.space	4
	.word	exynos4_clk_ip_perir_ctrl
	.space	20
	.space	16
	.word	.LC141
	.space	16
	.word	2048
	.space	4
	.word	exynos4_clk_ip_fsys_ctrl
	.space	20
	.space	16
	.word	.LC142
	.space	16
	.word	4096
	.space	4
	.word	exynos4_clk_ip_fsys_ctrl
	.space	20
	.space	16
	.word	.LC143
	.space	16
	.word	8192
	.space	4
	.word	exynos4_clk_ip_fsys_ctrl
	.space	20
	.space	16
	.word	.LC144
	.word	.LC31
	.space	12
	.word	65536
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	16
	.word	.LC144
	.word	.LC32
	.space	12
	.word	131072
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	16
	.word	.LC144
	.word	.LC33
	.space	12
	.word	262144
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	16
	.word	.LC105
	.word	.LC145
	.space	12
	.word	1048576
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	16
	.word	.LC105
	.word	.LC146
	.space	12
	.word	2097152
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	16
	.word	.LC107
	.word	.LC42
	.space	12
	.word	4194304
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	16
	.word	.LC107
	.word	.LC43
	.space	12
	.word	8388608
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	16
	.word	.LC147
	.space	16
	.word	33554432
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	16
	.word	.LC148
	.word	.LC149
	.space	12
	.word	67108864
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	16
	.word	.LC150
	.word	.LC151
	.space	12
	.word	134217728
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	16
	.word	.LC152
	.space	16
	.word	16384
	.space	4
	.word	exynos4_clk_ip_peril_ctrl
	.space	20
	.space	16
	.word	.LC153
	.space	16
	.word	32
	.space	4
	.word	exynos4_clk_ip_tv_ctrl
	.space	20
	.space	16
	.word	.LC154
	.space	16
	.word	8
	.space	4
	.word	exynos4_clk_ip_tv_ctrl
	.space	20
	.space	16
	.word	.LC155
	.word	.LC156
	.space	12
	.word	4
	.space	4
	.word	exynos4_clk_ip_tv_ctrl
	.space	20
	.space	16
	.word	.LC157
	.space	16
	.word	2
	.space	4
	.word	exynos4_clk_ip_tv_ctrl
	.space	20
	.space	16
	.word	.LC158
	.space	16
	.word	1
	.space	4
	.word	exynos4_clk_ip_tv_ctrl
	.space	20
	.space	16
	.word	.LC159
	.space	16
	.word	512
	.space	4
	.word	exynos4_clk_ip_image_ctrl
	.space	20
	.space	16
	.word	.LC160
	.space	16
	.word	128
	.space	4
	.word	exynos4_clk_ip_image_ctrl
	.space	20
	.space	16
	.word	.LC132
	.space	16
	.word	2
	.space	4
	.word	exynos4_clk_ip_image_ctrl
	.space	20
	.space	16
	.word	.LC161
	.word	.LC162
	.space	12
	.word	1
	.space	4
	.word	exynos4_clk_hdmiphy_ctrl
	.space	20
	.space	16
	.word	.LC163
	.word	.LC156
	.space	12
	.word	1
	.space	4
	.word	exynos4_clk_dac_ctrl
	.space	20
	.space	16
	.word	.LC164
	.word	.LC165
	.space	12
	.word	4096
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC164
	.word	.LC166
	.space	12
	.word	128
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC164
	.word	.LC167
	.space	12
	.word	256
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC164
	.word	.LC168
	.space	12
	.word	512
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC164
	.word	.LC169
	.space	12
	.word	1024
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC164
	.word	.LC170
	.space	12
	.word	2048
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC164
	.word	.LC171
	.space	12
	.word	16
	.space	4
	.word	exynos4_clk_ip_lcd0_ctrl
	.space	20
	.space	16
	.word	.LC164
	.word	.LC172
	.space	12
	.word	16
	.space	4
	.word	exynos4_clk_ip_image_ctrl
	.space	20
	.space	16
	.word	.LC164
	.word	.LC173
	.space	12
	.word	32
	.space	4
	.word	exynos4_clk_ip_image_ctrl
	.space	20
	.space	16
	.word	.LC164
	.word	.LC174
	.space	12
	.word	16
	.space	4
	.word	exynos4_clk_ip_tv_ctrl
	.space	20
	.space	16
	.word	.LC164
	.word	.LC175
	.space	12
	.word	2
	.space	4
	.word	exynos4_clk_ip_mfc_ctrl
	.space	20
	.space	16
	.word	.LC164
	.word	.LC176
	.space	12
	.word	4
	.space	4
	.word	exynos4_clk_ip_mfc_ctrl
	.space	20
	.space	16
	.word	.LC164
	.word	.LC177
	.space	12
	.word	2
	.space	4
	.word	exynos4_clk_ip_gps_ctrl
	.space	20
	.space	16
	.word	.LC178
	.space	16
	.word	1
	.space	4
	.word	exynos4_clk_ip_gps_ctrl
	.space	20
	.space	16
	.word	.LC179
	.space	16
	.word	24
	.space	4
	.word	exynos4_clk_ip_mfc_ctrl
	.space	20
	.space	16
	.word	.LC180
	.word	.LC181
	.space	12
	.word	1
	.space	4
	.word	exynos4_clk_ip_mfc_ctrl
	.space	20
	.space	16
	.word	.LC182
	.space	16
	.word	16
	.space	4
	.word	exynos4_clk_ip_fsys_ctrl
	.space	20
	.space	16
	.word	.LC183
	.space	16
	.word	32768
	.space	4
	.word	exynos4_clk_ip_fsys_ctrl
	.space	20
	.space	16
	.word	.LC184
	.space	16
	.word	65536
	.space	4
	.word	exynos4_clk_ip_fsys_ctrl
	.space	20
	.space	16
	.word	.LC185
	.space	16
	.word	131072
	.space	4
	.word	exynos4_clk_ip_fsys_ctrl
	.space	20
	.space	16
	.word	.LC186
	.space	16
	.word	2
	.space	4
	.word	exynos4_clk_ip_g3d_ctrl
	.space	20
	.space	16
	.word	.LC187
	.space	16
	.word	65536
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC188
	.space	16
	.word	1
	.space	4
	.word	exynos4_clk_ip_cpu_ctrl
	.space	20
	.space	16
	.word	.LC189
	.space	16
	.word	262144
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC190
	.space	16
	.word	131072
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC191
	.space	16
	.word	65536
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC192
	.space	16
	.word	1024
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC193
	.space	16
	.word	512
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC194
	.space	16
	.word	256
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.space	16
	.word	.LC195
	.word	.LC196
	.space	12
	.word	32768
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC195
	.word	.LC197
	.space	12
	.word	16384
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC195
	.word	.LC198
	.space	12
	.word	8192
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC195
	.word	.LC199
	.space	12
	.word	4096
	.space	4
	.word	exynos4_clk_ip_cam_ctrl
	.space	20
	.space	16
	.word	.LC200
	.space	16
	.word	4
	.space	4
	.word	exynos4_clk_ip_g3d_ctrl
	.space	20
	.space	12
	.word	exynos4_clk_aclk_acp
	.word	.LC201
	.space	16
	.word	16
	.space	4
	.word	exynos4_clk_ip_dmc_ctrl
	.space	20
	.type	exynos4_init_audss_clocks, %object
	.size	exynos4_init_audss_clocks, 204
exynos4_init_audss_clocks:
	.space	12
	.word	exynos4_clk_dout_audss_srp
	.word	.LC104
	.space	16
	.word	385
	.space	4
	.word	exynos4_clk_audss_ctrl
	.space	20
	.space	16
	.word	.LC105
	.word	.LC106
	.space	12
	.word	12
	.space	4
	.word	exynos4_clk_audss_ctrl
	.space	20
	.space	16
	.word	.LC107
	.word	.LC41
	.space	12
	.word	48
	.space	4
	.word	exynos4_clk_audss_ctrl
	.space	20
	.type	exynos4_clk_fimg2d, %object
	.size	exynos4_clk_fimg2d, 68
exynos4_clk_fimg2d:
	.space	16
	.word	.LC60
	.word	.LC61
	.space	44
	.type	exynos4_clock_syscore_ops, %object
	.size	exynos4_clock_syscore_ops, 20
exynos4_clock_syscore_ops:
	.space	8
	.word	exynos4_clock_suspend
	.word	exynos4_clock_resume
	.space	4
	.type	exynos4_clk_dout_spi2, %object
	.size	exynos4_clk_dout_spi2, 88
exynos4_clk_dout_spi2:
	.space	16
	.word	.LC47
	.space	48
	.word	exynos4_clkset_group
	.word	-32456108
	.short	24
	.short	4
	.word	-32455336
	.short	0
	.short	4
	.type	exynos4_clk_dout_spi1, %object
	.size	exynos4_clk_dout_spi1, 88
exynos4_clk_dout_spi1:
	.space	16
	.word	.LC48
	.space	48
	.word	exynos4_clkset_group
	.word	-32456108
	.short	20
	.short	4
	.word	-32455340
	.short	16
	.short	4
	.type	exynos4_clk_dout_spi0, %object
	.size	exynos4_clk_dout_spi0, 88
exynos4_clk_dout_spi0:
	.space	16
	.word	.LC49
	.space	48
	.word	exynos4_clkset_group
	.word	-32456108
	.short	16
	.short	4
	.word	-32455340
	.short	0
	.short	4
	.type	exynos4_clk_dout_copy, %object
	.size	exynos4_clk_dout_copy, 88
exynos4_clk_dout_copy:
	.space	16
	.word	.LC50
	.space	48
	.word	exynos4_clkset_sclk_hpm
	.word	-32423424
	.short	20
	.short	1
	.word	-32422652
	.short	0
	.short	3
	.type	exynos4_clkset_sclk_hpm, %object
	.size	exynos4_clkset_sclk_hpm, 8
exynos4_clkset_sclk_hpm:
	.word	2
	.word	exynos4_clkset_mout_hpm_list
	.type	exynos4_clkset_mout_hpm_list, %object
	.size	exynos4_clkset_mout_hpm_list, 8
exynos4_clkset_mout_hpm_list:
	.word	exynos4_clk_mout_apll
	.word	exynos4_clk_mout_mpll
	.type	exynos4_clk_dout_mmc4, %object
	.size	exynos4_clk_dout_mmc4, 88
exynos4_clk_dout_mmc4:
	.space	16
	.word	.LC51
	.space	48
	.word	exynos4_clkset_group
	.word	-32456128
	.short	16
	.short	4
	.word	-32455348
	.short	0
	.short	4
	.type	exynos4_clk_dout_mmc3, %object
	.size	exynos4_clk_dout_mmc3, 88
exynos4_clk_dout_mmc3:
	.space	16
	.word	.LC52
	.space	48
	.word	exynos4_clkset_group
	.word	-32456128
	.short	12
	.short	4
	.word	-32455352
	.short	16
	.short	4
	.type	exynos4_clk_dout_mmc2, %object
	.size	exynos4_clk_dout_mmc2, 88
exynos4_clk_dout_mmc2:
	.space	16
	.word	.LC53
	.space	48
	.word	exynos4_clkset_group
	.word	-32456128
	.short	8
	.short	4
	.word	-32455352
	.short	0
	.short	4
	.type	exynos4_clk_dout_mmc1, %object
	.size	exynos4_clk_dout_mmc1, 88
exynos4_clk_dout_mmc1:
	.space	16
	.word	.LC54
	.space	48
	.word	exynos4_clkset_group
	.word	-32456128
	.short	4
	.short	4
	.word	-32455356
	.short	16
	.short	4
	.type	exynos4_clk_dout_mmc0, %object
	.size	exynos4_clk_dout_mmc0, 88
exynos4_clk_dout_mmc0:
	.space	16
	.word	.LC55
	.space	48
	.word	exynos4_clkset_group
	.word	-32456128
	.short	0
	.short	4
	.word	-32455356
	.short	0
	.short	4
	.type	exynos4_clkset_mout_g3d, %object
	.size	exynos4_clkset_mout_g3d, 8
exynos4_clkset_mout_g3d:
	.word	2
	.word	exynos4_clkset_mout_g3d_list
	.type	exynos4_clkset_mout_g3d_list, %object
	.size	exynos4_clkset_mout_g3d_list, 8
exynos4_clkset_mout_g3d_list:
	.word	exynos4_clk_mout_g3d0
	.word	exynos4_clk_mout_g3d1
	.type	exynos4_clk_mout_g3d1, %object
	.size	exynos4_clk_mout_g3d1, 88
exynos4_clk_mout_g3d1:
	.space	16
	.word	.LC56
	.space	48
	.word	exynos4_clkset_mout_g3d1
	.word	-32456148
	.short	4
	.short	1
	.space	8
	.type	exynos4_clkset_mout_g3d1, %object
	.size	exynos4_clkset_mout_g3d1, 8
exynos4_clkset_mout_g3d1:
	.word	2
	.word	exynos4_clkset_mout_g3d1_list
	.type	exynos4_clkset_mout_g3d1_list, %object
	.size	exynos4_clkset_mout_g3d1_list, 8
exynos4_clkset_mout_g3d1_list:
	.word	exynos4_clk_mout_epll
	.word	exynos4_clk_sclk_vpll
	.type	exynos4_clk_mout_g3d0, %object
	.size	exynos4_clk_mout_g3d0, 88
exynos4_clk_mout_g3d0:
	.space	16
	.word	.LC57
	.space	48
	.word	exynos4_clkset_mout_g3d0
	.word	-32456148
	.short	0
	.short	1
	.space	8
	.type	exynos4_clkset_mout_g3d0, %object
	.size	exynos4_clkset_mout_g3d0, 8
exynos4_clkset_mout_g3d0:
	.word	2
	.word	exynos4_clkset_mout_g3d0_list
	.type	exynos4_clkset_mout_g3d0_list, %object
	.size	exynos4_clkset_mout_g3d0_list, 8
exynos4_clkset_mout_g3d0_list:
	.word	exynos4_clk_mout_mpll
	.word	exynos4_clk_sclk_apll
	.type	exynos4_clkset_mout_mfc, %object
	.size	exynos4_clkset_mout_mfc, 8
exynos4_clkset_mout_mfc:
	.word	2
	.word	exynos4_clkset_mout_mfc_list
	.type	exynos4_clkset_mout_mfc_list, %object
	.size	exynos4_clkset_mout_mfc_list, 8
exynos4_clkset_mout_mfc_list:
	.word	exynos4_clk_mout_mfc0
	.word	exynos4_clk_mout_mfc1
	.type	exynos4_clk_mout_mfc1, %object
	.size	exynos4_clk_mout_mfc1, 88
exynos4_clk_mout_mfc1:
	.space	16
	.word	.LC58
	.space	48
	.word	exynos4_clkset_mout_mfc1
	.word	-32456152
	.short	4
	.short	1
	.space	8
	.type	exynos4_clkset_mout_mfc1, %object
	.size	exynos4_clkset_mout_mfc1, 8
exynos4_clkset_mout_mfc1:
	.word	2
	.word	exynos4_clkset_mout_mfc1_list
	.type	exynos4_clkset_mout_mfc1_list, %object
	.size	exynos4_clkset_mout_mfc1_list, 8
exynos4_clkset_mout_mfc1_list:
	.word	exynos4_clk_mout_epll
	.word	exynos4_clk_sclk_vpll
	.type	exynos4_clk_mout_mfc0, %object
	.size	exynos4_clk_mout_mfc0, 88
exynos4_clk_mout_mfc0:
	.space	16
	.word	.LC59
	.space	48
	.word	exynos4_clkset_mout_mfc0
	.word	-32456152
	.short	0
	.short	1
	.space	8
	.type	exynos4_clkset_mout_mfc0, %object
	.size	exynos4_clkset_mout_mfc0, 8
exynos4_clkset_mout_mfc0:
	.word	2
	.word	exynos4_clkset_mout_mfc0_list
	.type	exynos4_clkset_mout_mfc0_list, %object
	.size	exynos4_clkset_mout_mfc0_list, 8
exynos4_clkset_mout_mfc0_list:
	.word	exynos4_clk_mout_mpll
	.word	exynos4_clk_sclk_apll
	.type	exynos4_clk_sclk_fimg2d, %object
	.size	exynos4_clk_sclk_fimg2d, 88
exynos4_clk_sclk_fimg2d:
	.space	16
	.word	.LC62
	.word	.LC61
	.space	44
	.word	exynos4_clkset_mout_g2d
	.space	16
	.type	exynos4_clkset_mout_g2d, %object
	.size	exynos4_clkset_mout_g2d, 8
exynos4_clkset_mout_g2d:
	.word	2
	.word	exynos4_clkset_mout_g2d_list
	.type	exynos4_clkset_mout_g2d_list, %object
	.size	exynos4_clkset_mout_g2d_list, 8
exynos4_clkset_mout_g2d_list:
	.word	exynos4_clk_mout_g2d0
	.word	exynos4_clk_mout_g2d1
	.type	exynos4_clk_mout_g2d1, %object
	.size	exynos4_clk_mout_g2d1, 88
exynos4_clk_mout_g2d1:
	.space	16
	.word	.LC63
	.space	48
	.word	exynos4_clkset_mout_g2d1
	.word	-32456144
	.short	4
	.short	1
	.space	8
	.type	exynos4_clkset_mout_g2d1, %object
	.size	exynos4_clkset_mout_g2d1, 8
exynos4_clkset_mout_g2d1:
	.word	2
	.word	exynos4_clkset_mout_g2d1_list
	.type	exynos4_clkset_mout_g2d1_list, %object
	.size	exynos4_clkset_mout_g2d1_list, 8
exynos4_clkset_mout_g2d1_list:
	.word	exynos4_clk_mout_epll
	.word	exynos4_clk_sclk_vpll
	.type	exynos4_clk_mout_g2d0, %object
	.size	exynos4_clk_mout_g2d0, 88
exynos4_clk_mout_g2d0:
	.space	16
	.word	.LC64
	.space	48
	.word	exynos4_clkset_mout_g2d0
	.word	-32456144
	.short	0
	.short	1
	.space	8
	.type	exynos4_clkset_mout_g2d0, %object
	.size	exynos4_clkset_mout_g2d0, 8
exynos4_clkset_mout_g2d0:
	.word	2
	.word	exynos4_clkset_mout_g2d0_list
	.type	exynos4_clkset_mout_g2d0_list, %object
	.size	exynos4_clkset_mout_g2d0_list, 8
exynos4_clkset_mout_g2d0_list:
	.word	exynos4_clk_mout_mpll
	.word	exynos4_clk_sclk_apll
	.type	clk_sclk_mipidphy2l, %object
	.size	clk_sclk_mipidphy2l, 88
clk_sclk_mipidphy2l:
	.space	16
	.word	.LC65
	.space	4
	.word	-1
	.space	8
	.word	4096
	.space	4
	.word	exynos4_clksrc_mask_lcd0_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456136
	.short	12
	.short	4
	.word	-32455368
	.short	16
	.short	4
	.type	clk_sclk_mipidphy4l, %object
	.size	clk_sclk_mipidphy4l, 88
clk_sclk_mipidphy4l:
	.space	16
	.word	.LC66
	.space	4
	.word	-1
	.space	8
	.word	4096
	.space	4
	.word	exynos4_clksrc_mask_lcd0_ctrl
	.space	20
	.word	exynos4_clkset_group
	.word	-32456140
	.short	12
	.short	4
	.word	-32455372
	.short	16
	.short	4
	.type	exynos4_clkset_group, %object
	.size	exynos4_clkset_group, 8
exynos4_clkset_group:
	.word	9
	.word	exynos4_clkset_group_list
	.type	exynos4_clkset_group_list, %object
	.size	exynos4_clkset_group_list, 36
exynos4_clkset_group_list:
	.word	clk_ext_xtal_mux
	.word	clk_xusbxti
	.word	exynos4_clk_sclk_hdmi27m
	.word	exynos4_clk_sclk_usbphy0
	.word	exynos4_clk_sclk_usbphy1
	.word	exynos4_clk_sclk_hdmiphy
	.word	exynos4_clk_mout_mpll
	.word	exynos4_clk_mout_epll
	.word	exynos4_clk_sclk_vpll
	.type	exynos4_clk_sclk_spdif, %object
	.size	exynos4_clk_sclk_spdif, 88
exynos4_clk_sclk_spdif:
	.space	16
	.word	.LC101
	.space	16
	.word	256
	.word	s5p_sclk_spdif_ops
	.word	exynos4_clksrc_mask_peril1_ctrl
	.space	20
	.word	exynos4_clkset_sclk_spdif
	.word	-32456108
	.short	8
	.short	2
	.space	8
	.type	exynos4_clkset_sclk_spdif, %object
	.size	exynos4_clkset_sclk_spdif, 8
exynos4_clkset_sclk_spdif:
	.word	4
	.word	exynos4_clkset_sclk_spdif_list
	.type	exynos4_clkset_sclk_spdif_list, %object
	.size	exynos4_clkset_sclk_spdif_list, 16
exynos4_clkset_sclk_spdif_list:
	.word	exynos4_clk_sclk_audio0
	.word	exynos4_clk_sclk_audio1
	.word	exynos4_clk_sclk_audio2
	.word	exynos4_clk_spdifcdclk
	.type	exynos4_clk_sclk_audio2, %object
	.size	exynos4_clk_sclk_audio2, 88
exynos4_clk_sclk_audio2:
	.space	16
	.word	.LC102
	.space	16
	.word	16
	.space	4
	.word	exynos4_clksrc_mask_peril1_ctrl
	.space	20
	.word	exynos4_clkset_sclk_audio2
	.word	-32456108
	.short	4
	.short	4
	.word	-32455328
	.short	16
	.short	4
	.type	exynos4_clkset_sclk_audio2, %object
	.size	exynos4_clkset_sclk_audio2, 8
exynos4_clkset_sclk_audio2:
	.word	9
	.word	exynos4_clkset_sclk_audio2_list
	.type	exynos4_clkset_sclk_audio2_list, %object
	.size	exynos4_clkset_sclk_audio2_list, 36
exynos4_clkset_sclk_audio2_list:
	.word	exynos4_clk_audiocdclk2
	.word	0
	.word	exynos4_clk_sclk_hdmi27m
	.word	exynos4_clk_sclk_usbphy0
	.word	clk_ext_xtal_mux
	.word	clk_xusbxti
	.word	exynos4_clk_mout_mpll
	.word	exynos4_clk_mout_epll
	.word	exynos4_clk_sclk_vpll
	.type	exynos4_clk_sclk_audio1, %object
	.size	exynos4_clk_sclk_audio1, 88
exynos4_clk_sclk_audio1:
	.space	16
	.word	.LC103
	.space	16
	.word	1
	.space	4
	.word	exynos4_clksrc_mask_peril1_ctrl
	.space	20
	.word	exynos4_clkset_sclk_audio1
	.word	-32456108
	.short	0
	.short	4
	.word	-32455328
	.short	0
	.short	8
	.type	exynos4_clkset_sclk_audio1, %object
	.size	exynos4_clkset_sclk_audio1, 8
exynos4_clkset_sclk_audio1:
	.word	9
	.word	exynos4_clkset_sclk_audio1_list
	.type	exynos4_clkset_sclk_audio1_list, %object
	.size	exynos4_clkset_sclk_audio1_list, 36
exynos4_clkset_sclk_audio1_list:
	.word	exynos4_clk_audiocdclk1
	.word	0
	.word	exynos4_clk_sclk_hdmi27m
	.word	exynos4_clk_sclk_usbphy0
	.word	clk_ext_xtal_mux
	.word	clk_xusbxti
	.word	exynos4_clk_mout_mpll
	.word	exynos4_clk_mout_epll
	.word	exynos4_clk_sclk_vpll
	.type	exynos4_clk_sclk_audss_bus, %object
	.size	exynos4_clk_sclk_audss_bus, 88
exynos4_clk_sclk_audss_bus:
	.space	12
	.word	exynos4_clk_dout_audss_srp
	.word	.LC108
	.space	16
	.word	4
	.space	4
	.word	exynos4_clk_audss_ctrl
	.space	20
	.space	12
	.word	-24051708
	.short	4
	.short	4
	.type	exynos4_clk_dout_audss_srp, %object
	.size	exynos4_clk_dout_audss_srp, 88
exynos4_clk_dout_audss_srp:
	.space	12
	.word	exynos4_clk_mout_audss
	.word	.LC109
	.space	48
	.space	12
	.word	-24051708
	.short	0
	.short	4
	.type	exynos4_clk_sclk_audss_i2s, %object
	.size	exynos4_clk_sclk_audss_i2s, 88
exynos4_clk_sclk_audss_i2s:
	.space	12
	.word	exynos4_clk_mout_audss
	.word	.LC110
	.space	16
	.word	8
	.space	4
	.word	exynos4_clk_audss_ctrl
	.space	20
	.word	exynos4_clkset_sclk_audss
	.word	-24051712
	.short	2
	.short	2
	.word	-24051708
	.short	8
	.short	4
	.type	exynos4_clkset_sclk_audss, %object
	.size	exynos4_clkset_sclk_audss, 8
exynos4_clkset_sclk_audss:
	.word	3
	.word	exynos4_clkset_sclk_audss_list
	.type	exynos4_clkset_sclk_audss_list, %object
	.size	exynos4_clkset_sclk_audss_list, 12
exynos4_clkset_sclk_audss_list:
	.word	exynos4_clk_mout_audss
	.word	exynos4_clk_audiocdclk0
	.word	exynos4_clk_sclk_audio0
	.type	exynos4_clk_mout_audss, %object
	.size	exynos4_clk_mout_audss, 88
exynos4_clk_mout_audss:
	.space	16
	.word	.LC111
	.space	48
	.word	clkset_mout_audss
	.word	-24051712
	.short	0
	.short	1
	.space	8
	.type	clkset_mout_audss, %object
	.size	clkset_mout_audss, 8
clkset_mout_audss:
	.word	2
	.word	exynos4_clkset_mout_audss_list
	.type	exynos4_clkset_mout_audss_list, %object
	.size	exynos4_clkset_mout_audss_list, 8
exynos4_clkset_mout_audss_list:
	.word	clk_ext_xtal_mux
	.word	clk_fout_epll
	.type	exynos4_clk_sclk_audio0, %object
	.size	exynos4_clk_sclk_audio0, 88
exynos4_clk_sclk_audio0:
	.space	16
	.word	.LC112
	.space	16
	.word	1
	.space	4
	.word	exynos4_clksrc_mask_maudio_ctrl
	.space	20
	.word	exynos4_clkset_sclk_audio0
	.word	-32456132
	.short	0
	.short	4
	.word	-32455364
	.short	0
	.short	4
	.type	exynos4_clkset_sclk_audio0, %object
	.size	exynos4_clkset_sclk_audio0, 8
exynos4_clkset_sclk_audio0:
	.word	9
	.word	clkset_sclk_audio0_list
	.type	clkset_sclk_audio0_list, %object
	.size	clkset_sclk_audio0_list, 36
clkset_sclk_audio0_list:
	.word	exynos4_clk_audiocdclk0
	.word	0
	.word	exynos4_clk_sclk_hdmi27m
	.word	exynos4_clk_sclk_usbphy0
	.word	clk_ext_xtal_mux
	.word	clk_xusbxti
	.word	exynos4_clk_mout_mpll
	.word	exynos4_clk_mout_epll
	.word	exynos4_clk_sclk_vpll
	.type	exynos4_clkset_sclk_mixer, %object
	.size	exynos4_clkset_sclk_mixer, 8
exynos4_clkset_sclk_mixer:
	.word	2
	.word	exynos4_clkset_sclk_mixer_list
	.type	exynos4_clkset_sclk_mixer_list, %object
	.size	exynos4_clkset_sclk_mixer_list, 8
exynos4_clkset_sclk_mixer_list:
	.word	exynos4_clk_sclk_dac
	.word	exynos4_clk_sclk_hdmi
	.type	exynos4_clkset_sclk_hdmi, %object
	.size	exynos4_clkset_sclk_hdmi, 8
exynos4_clkset_sclk_hdmi:
	.word	2
	.word	exynos4_clkset_sclk_hdmi_list
	.type	exynos4_clkset_sclk_hdmi_list, %object
	.size	exynos4_clkset_sclk_hdmi_list, 8
exynos4_clkset_sclk_hdmi_list:
	.word	exynos4_clk_sclk_pixel
	.word	exynos4_clk_sclk_hdmiphy
	.type	exynos4_clkset_sclk_dac, %object
	.size	exynos4_clkset_sclk_dac, 8
exynos4_clkset_sclk_dac:
	.word	2
	.word	exynos4_clkset_sclk_dac_list
	.type	exynos4_clkset_sclk_dac_list, %object
	.size	exynos4_clkset_sclk_dac_list, 8
exynos4_clkset_sclk_dac_list:
	.word	exynos4_clk_sclk_vpll
	.word	exynos4_clk_sclk_hdmiphy
	.type	exynos4_clk_sclk_vpll, %object
	.size	exynos4_clk_sclk_vpll, 88
exynos4_clk_sclk_vpll:
	.space	16
	.word	.LC206
	.space	48
	.word	exynos4_clkset_sclk_vpll
	.word	-32456176
	.short	8
	.short	1
	.space	8
	.type	exynos4_clkset_sclk_vpll, %object
	.size	exynos4_clkset_sclk_vpll, 8
exynos4_clkset_sclk_vpll:
	.word	2
	.word	exynos4_clkset_sclk_vpll_list
	.type	exynos4_clkset_sclk_vpll_list, %object
	.size	exynos4_clkset_sclk_vpll_list, 8
exynos4_clkset_sclk_vpll_list:
	.word	exynos4_clk_vpllsrc
	.word	clk_fout_vpll
	.type	exynos4_clkset_vpllsrc, %object
	.size	exynos4_clkset_vpllsrc, 8
exynos4_clkset_vpllsrc:
	.word	2
	.word	exynos4_clkset_vpllsrc_list
	.type	exynos4_clkset_vpllsrc_list, %object
	.size	exynos4_clkset_vpllsrc_list, 8
exynos4_clkset_vpllsrc_list:
	.word	clk_ext_xtal_mux
	.word	exynos4_clk_sclk_hdmi27m
	.type	exynos4_clk_aclk_gdr, %object
	.size	exynos4_clk_aclk_gdr, 88
exynos4_clk_aclk_gdr:
	.space	16
	.word	.LC208
	.space	48
	.word	exynos4_clkset_aclk_lrbus
	.word	-32472576
	.short	0
	.short	1
	.word	-32471808
	.short	0
	.short	3
	.type	exynos4_clk_aclk_gdl, %object
	.size	exynos4_clk_aclk_gdl, 88
exynos4_clk_aclk_gdl:
	.space	16
	.word	.LC209
	.space	48
	.word	exynos4_clkset_aclk_lrbus
	.word	-32488960
	.short	0
	.short	1
	.word	-32488192
	.short	0
	.short	3
	.type	exynos4_clkset_aclk_lrbus, %object
	.size	exynos4_clkset_aclk_lrbus, 8
exynos4_clkset_aclk_lrbus:
	.word	2
	.word	exynos4_clkset_aclk_lrbus_list
	.type	exynos4_clkset_aclk_lrbus_list, %object
	.size	exynos4_clkset_aclk_lrbus_list, 8
exynos4_clkset_aclk_lrbus_list:
	.word	exynos4_clk_mout_mpll
	.word	exynos4_clk_sclk_apll
	.type	exynos4_clkset_aclk, %object
	.size	exynos4_clkset_aclk, 8
exynos4_clkset_aclk:
	.word	2
	.word	exynos4_clkset_aclk_top_list
	.type	exynos4_clkset_aclk_top_list, %object
	.size	exynos4_clkset_aclk_top_list, 8
exynos4_clkset_aclk_top_list:
	.word	exynos4_clk_mout_mpll
	.word	exynos4_clk_sclk_apll
	.type	exynos4_clk_aclk_c2c, %object
	.size	exynos4_clk_aclk_c2c, 88
exynos4_clk_aclk_c2c:
	.space	12
	.word	exynos4_clk_sclk_c2c
	.word	.LC214
	.space	4
	.word	-1
	.space	40
	.space	12
	.word	-32439036
	.short	12
	.short	3
	.type	exynos4_clk_sclk_c2c, %object
	.size	exynos4_clk_sclk_c2c, 88
exynos4_clk_sclk_c2c:
	.space	16
	.word	.LC215
	.space	4
	.word	-1
	.space	40
	.word	exynos4_clkset_mout_c2c
	.word	-32439808
	.short	0
	.short	1
	.word	-32439036
	.short	4
	.short	3
	.type	exynos4_clkset_mout_c2c, %object
	.size	exynos4_clkset_mout_c2c, 8
exynos4_clkset_mout_c2c:
	.word	2
	.word	exynos4_clkset_c2c_list
	.type	exynos4_clkset_c2c_list, %object
	.size	exynos4_clkset_c2c_list, 8
exynos4_clkset_c2c_list:
	.word	exynos4_clk_mout_mpll
	.word	exynos4_clk_sclk_apll
	.type	exynos4_clk_pclk_acp, %object
	.size	exynos4_clk_pclk_acp, 88
exynos4_clk_pclk_acp:
	.space	12
	.word	exynos4_clk_aclk_acp
	.word	.LC216
	.space	48
	.space	12
	.word	-32439040
	.short	4
	.short	3
	.type	exynos4_clk_aclk_acp, %object
	.size	exynos4_clk_aclk_acp, 88
exynos4_clk_aclk_acp:
	.space	12
	.word	exynos4_clk_mout_corebus
	.word	.LC217
	.space	48
	.space	12
	.word	-32439040
	.short	0
	.short	3
	.type	exynos4_clk_aclk_corep, %object
	.size	exynos4_clk_aclk_corep, 88
exynos4_clk_aclk_corep:
	.space	12
	.word	exynos4_clk_aclk_cored
	.word	.LC218
	.space	48
	.space	12
	.word	-32439040
	.short	20
	.short	3
	.type	exynos4_clk_aclk_cored, %object
	.size	exynos4_clk_aclk_cored, 88
exynos4_clk_aclk_cored:
	.space	12
	.word	exynos4_clk_sclk_dmc
	.word	.LC219
	.space	48
	.space	12
	.word	-32439040
	.short	16
	.short	3
	.type	exynos4_clk_mout_corebus, %object
	.size	exynos4_clk_mout_corebus, 88
exynos4_clk_mout_corebus:
	.space	16
	.word	.LC221
	.space	48
	.word	exynos4_clkset_mout_corebus
	.word	-32439808
	.short	4
	.short	1
	.space	8
	.type	exynos4_clkset_mout_corebus, %object
	.size	exynos4_clkset_mout_corebus, 8
exynos4_clkset_mout_corebus:
	.word	2
	.word	exynos4_clkset_corebus_list
	.type	exynos4_clkset_corebus_list, %object
	.size	exynos4_clkset_corebus_list, 8
exynos4_clkset_corebus_list:
	.word	exynos4_clk_mout_mpll
	.word	exynos4_clk_sclk_apll
	.type	exynos4_clk_periphclk, %object
	.size	exynos4_clk_periphclk, 88
exynos4_clk_periphclk:
	.space	12
	.word	exynos4_clk_coreclk
	.word	.LC222
	.space	48
	.space	12
	.word	-32422656
	.short	12
	.short	3
	.type	exynos4_clk_aclk_corem1, %object
	.size	exynos4_clk_aclk_corem1, 88
exynos4_clk_aclk_corem1:
	.space	12
	.word	exynos4_clk_coreclk
	.word	.LC223
	.space	48
	.space	12
	.word	-32422656
	.short	8
	.short	3
	.type	exynos4_clk_aclk_cores, %object
	.size	exynos4_clk_aclk_cores, 88
exynos4_clk_aclk_cores:
	.space	12
	.word	exynos4_clk_coreclk
	.word	.LC224
	.space	48
	.space	12
	.word	-32422656
	.short	4
	.short	3
	.type	exynos4_clk_aclk_corem0, %object
	.size	exynos4_clk_aclk_corem0, 88
exynos4_clk_aclk_corem0:
	.space	12
	.word	exynos4_clk_coreclk
	.word	.LC225
	.space	48
	.space	12
	.word	-32422656
	.short	4
	.short	3
	.type	exynos4_clk_coreclk, %object
	.size	exynos4_clk_coreclk, 88
exynos4_clk_coreclk:
	.space	12
	.word	exynos4_clk_moutcore
	.word	.LC227
	.space	48
	.space	12
	.word	-32422656
	.short	0
	.short	3
	.type	exynos4_clk_moutcore, %object
	.size	exynos4_clk_moutcore, 88
exynos4_clk_moutcore:
	.space	16
	.word	.LC228
	.space	48
	.word	exynos4_clkset_moutcore
	.word	-32423424
	.short	16
	.short	1
	.space	8
	.type	exynos4_clkset_moutcore, %object
	.size	exynos4_clkset_moutcore, 8
exynos4_clkset_moutcore:
	.word	2
	.word	exynos4_clkset_moutcore_list
	.type	exynos4_clkset_moutcore_list, %object
	.size	exynos4_clkset_moutcore_list, 8
exynos4_clkset_moutcore_list:
	.word	exynos4_clk_mout_apll
	.word	exynos4_clk_mout_mpll
	.type	exynos4_clk_mout_mpll, %object
	.size	exynos4_clk_mout_mpll, 88
exynos4_clk_mout_mpll:
	.space	16
	.word	.LC229
	.space	48
	.word	clk_src_mpll
	.space	16
	.type	exynos4_clk_audiocdclk0, %object
	.size	exynos4_clk_audiocdclk0, 88
exynos4_clk_audiocdclk0:
	.space	16
	.word	.LC231
	.space	12
	.word	16934400
	.space	32
	.space	20
	.type	exynos4_clk_mout_apll, %object
	.size	exynos4_clk_mout_apll, 88
exynos4_clk_mout_apll:
	.space	16
	.word	.LC233
	.space	48
	.word	clk_src_apll
	.word	-32423424
	.short	0
	.short	1
	.space	8
	.type	exynos4_clk_spdifcdclk, %object
	.size	exynos4_clk_spdifcdclk, 68
exynos4_clk_spdifcdclk:
	.space	16
	.word	.LC234
	.space	48
	.type	exynos4_clk_audiocdclk2, %object
	.size	exynos4_clk_audiocdclk2, 68
exynos4_clk_audiocdclk2:
	.space	16
	.word	.LC231
	.space	48
	.type	exynos4_clk_audiocdclk1, %object
	.size	exynos4_clk_audiocdclk1, 68
exynos4_clk_audiocdclk1:
	.space	16
	.word	.LC231
	.space	48
	.type	exynos4_clk_sclk_usbphy1, %object
	.size	exynos4_clk_sclk_usbphy1, 68
exynos4_clk_sclk_usbphy1:
	.space	16
	.word	.LC235
	.space	48
	.type	exynos4_clk_sclk_usbphy0, %object
	.size	exynos4_clk_sclk_usbphy0, 68
exynos4_clk_sclk_usbphy0:
	.space	16
	.word	.LC236
	.space	12
	.word	27000000
	.space	32
	.type	exynos4_clk_sclk_hdmiphy, %object
	.size	exynos4_clk_sclk_hdmiphy, 68
exynos4_clk_sclk_hdmiphy:
	.space	16
	.word	.LC237
	.space	48
	.type	exynos4_clk_sclk_hdmi27m, %object
	.size	exynos4_clk_sclk_hdmi27m, 68
exynos4_clk_sclk_hdmi27m:
	.space	16
	.word	.LC238
	.space	12
	.word	27000000
	.space	32
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<7>%s: registering clocks\012\000"
	.space	1
.LC1:
	.ascii	"xtal\000"
	.space	3
.LC2:
	.ascii	"<7>%s: xtal is %ld\012\000"
.LC3:
	.ascii	"<6>EXYNOS4: PLL settings, A=%ld, M=%ld, E=%ld V=%ld"
	.ascii	"\000"
.LC4:
	.ascii	"<6>EXYNOS4: ARMCLK=%ld, DMC=%ld, ACLK200=%ld\012ACL"
	.ascii	"K160=%ld, ACLK133=%ld, ACLK100=%ld\012\000"
.LC5:
	.ascii	"<6>EXYNOS4: ACLK400=%ld ACLK266=%ld\012\000"
	.space	3
.LC6:
	.ascii	"<3>Unable to set parent %s of clock %s.\012\000"
	.space	3
.LC7:
	.ascii	"uclk1\000"
	.space	2
.LC8:
	.ascii	"s5pv210-uart.0\000"
	.space	1
.LC9:
	.ascii	"s5pv210-uart.1\000"
	.space	1
.LC10:
	.ascii	"s5pv210-uart.2\000"
	.space	1
.LC11:
	.ascii	"s5pv210-uart.3\000"
	.space	1
.LC12:
	.ascii	"sclk_csis\000"
	.space	2
.LC13:
	.ascii	"s3c-csis.0\000"
	.space	1
.LC14:
	.ascii	"s3c-csis.1\000"
	.space	1
.LC15:
	.ascii	"sclk_cam0\000"
	.space	2
.LC16:
	.ascii	"sclk_cam1\000"
	.space	2
.LC17:
	.ascii	"sclk_fimc\000"
	.space	2
.LC18:
	.ascii	"s3c-fimc.0\000"
	.space	1
.LC19:
	.ascii	"s3c-fimc.1\000"
	.space	1
.LC20:
	.ascii	"s3c-fimc.2\000"
	.space	1
.LC21:
	.ascii	"s3c-fimc.3\000"
	.space	1
.LC22:
	.ascii	"sclk_fimd\000"
	.space	2
.LC23:
	.ascii	"s3cfb.0\000"
.LC24:
	.ascii	"s3cfb.1\000"
.LC25:
	.ascii	"sclk_mdnie\000"
	.space	1
.LC26:
	.ascii	"sclk_mdnie_pwm\000"
	.space	1
.LC27:
	.ascii	"sclk_mipi\000"
	.space	2
.LC28:
	.ascii	"sclk_mmc\000"
	.space	3
.LC29:
	.ascii	"sclk_dwmci\000"
	.space	1
.LC30:
	.ascii	"sclk_spi\000"
	.space	3
.LC31:
	.ascii	"s3c64xx-spi.0\000"
	.space	2
.LC32:
	.ascii	"s3c64xx-spi.1\000"
	.space	2
.LC33:
	.ascii	"s3c64xx-spi.2\000"
	.space	2
.LC34:
	.ascii	"sclk_mfc\000"
	.space	3
.LC35:
	.ascii	"sclk_g3d\000"
	.space	3
.LC36:
	.ascii	"s3c-sdhci.0\000"
.LC37:
	.ascii	"s3c-sdhci.1\000"
.LC38:
	.ascii	"s3c-sdhci.2\000"
.LC39:
	.ascii	"s3c-sdhci.3\000"
.LC40:
	.ascii	"sclk_pcm\000"
	.space	3
.LC41:
	.ascii	"samsung-pcm.0\000"
	.space	2
.LC42:
	.ascii	"samsung-pcm.1\000"
	.space	2
.LC43:
	.ascii	"samsung-pcm.2\000"
	.space	2
.LC44:
	.ascii	"sclk_i2s\000"
	.space	3
.LC45:
	.ascii	"sclk_hpm\000"
	.space	3
.LC46:
	.ascii	"sclk_pwi\000"
	.space	3
.LC47:
	.ascii	"dout_spi2\000"
	.space	2
.LC48:
	.ascii	"dout_spi1\000"
	.space	2
.LC49:
	.ascii	"dout_spi0\000"
	.space	2
.LC50:
	.ascii	"dout_copy\000"
	.space	2
.LC51:
	.ascii	"dout_mmc4\000"
	.space	2
.LC52:
	.ascii	"dout_mmc3\000"
	.space	2
.LC53:
	.ascii	"dout_mmc2\000"
	.space	2
.LC54:
	.ascii	"dout_mmc1\000"
	.space	2
.LC55:
	.ascii	"dout_mmc0\000"
	.space	2
.LC56:
	.ascii	"mout_g3d1\000"
	.space	2
.LC57:
	.ascii	"mout_g3d0\000"
	.space	2
.LC58:
	.ascii	"mout_mfc1\000"
	.space	2
.LC59:
	.ascii	"mout_mfc0\000"
	.space	2
.LC60:
	.ascii	"fimg2d\000"
	.space	1
.LC61:
	.ascii	"s5p-fimg2d\000"
	.space	1
.LC62:
	.ascii	"sclk_fimg2d\000"
.LC63:
	.ascii	"mout_g2d1\000"
	.space	2
.LC64:
	.ascii	"mout_g2d0\000"
	.space	2
.LC65:
	.ascii	"sclk_mipidphy2l\000"
.LC66:
	.ascii	"sclk_mipidphy4l\000"
.LC67:
	.ascii	"seckey\000"
	.space	1
.LC68:
	.ascii	"tzpc\000"
	.space	3
.LC69:
	.ascii	"exnos4-tzpc.5\000"
	.space	2
.LC70:
	.ascii	"exnos4-tzpc.4\000"
	.space	2
.LC71:
	.ascii	"exnos4-tzpc.3\000"
	.space	2
.LC72:
	.ascii	"exnos4-tzpc.2\000"
	.space	2
.LC73:
	.ascii	"exnos4-tzpc.1\000"
	.space	2
.LC74:
	.ascii	"exnos4-tzpc.0\000"
	.space	2
.LC75:
	.ascii	"cssys\000"
	.space	2
.LC76:
	.ascii	"gic\000"
.LC77:
	.ascii	"qesss\000"
	.space	2
.LC78:
	.ascii	"id_remapper\000"
.LC79:
	.ascii	"qecpu\000"
	.space	2
.LC80:
	.ascii	"fbm_dmc1\000"
	.space	3
.LC81:
	.ascii	"fbm_dmc0\000"
	.space	3
.LC82:
	.ascii	"int_comb\000"
	.space	3
.LC83:
	.ascii	"g3d\000"
.LC84:
	.ascii	"tmu\000"
.LC85:
	.ascii	"mct\000"
.LC86:
	.ascii	"cmu_top\000"
.LC87:
	.ascii	"pmu_apb\000"
.LC88:
	.ascii	"sysreg\000"
	.space	1
.LC89:
	.ascii	"chipid\000"
	.space	1
.LC90:
	.ascii	"uart\000"
	.space	3
.LC91:
	.ascii	"s5pv210-uart.4\000"
	.space	1
.LC92:
	.ascii	"lcd\000"
.LC93:
	.ascii	"mie0\000"
	.space	3
.LC94:
	.ascii	"mdnie0\000"
	.space	1
.LC95:
	.ascii	"dsim0\000"
	.space	2
.LC96:
	.ascii	"ppmulcd\000"
.LC97:
	.ascii	"pdma\000"
	.space	3
.LC98:
	.ascii	"s3c-pl330.0\000"
.LC99:
	.ascii	"s3c-pl330.1\000"
.LC100:
	.ascii	"s3c-pl330.2\000"
.LC101:
	.ascii	"sclk_spdif\000"
	.space	1
.LC102:
	.ascii	"audio-bus2\000"
	.space	1
.LC103:
	.ascii	"audio-bus1\000"
	.space	1
.LC104:
	.ascii	"srpclk\000"
	.space	1
.LC105:
	.ascii	"iis\000"
.LC106:
	.ascii	"samsung-i2s.0\000"
	.space	2
.LC107:
	.ascii	"pcm\000"
.LC108:
	.ascii	"busclk\000"
	.space	1
.LC109:
	.ascii	"dout_srp\000"
	.space	3
.LC110:
	.ascii	"i2sclk\000"
	.space	1
.LC111:
	.ascii	"mout_audss\000"
	.space	1
.LC112:
	.ascii	"audio-bus\000"
	.space	2
.LC113:
	.ascii	"i2c\000"
.LC114:
	.ascii	"s3c2440-i2c.0\000"
	.space	2
.LC115:
	.ascii	"s3c2440-i2c.1\000"
	.space	2
.LC116:
	.ascii	"s3c2440-i2c.2\000"
	.space	2
.LC117:
	.ascii	"s3c2440-i2c.3\000"
	.space	2
.LC118:
	.ascii	"s3c2440-i2c.4\000"
	.space	2
.LC119:
	.ascii	"s3c2440-i2c.5\000"
	.space	2
.LC120:
	.ascii	"s3c2440-i2c.6\000"
	.space	2
.LC121:
	.ascii	"s3c2440-i2c.7\000"
	.space	2
.LC122:
	.ascii	"s3c2440-hdmiphy-i2c\000"
.LC123:
	.ascii	"ppmuright\000"
	.space	2
.LC124:
	.ascii	"ppmuleft\000"
	.space	3
.LC125:
	.ascii	"timers\000"
	.space	1
.LC126:
	.ascii	"csis\000"
	.space	3
.LC127:
	.ascii	"fimc\000"
	.space	3
.LC128:
	.ascii	"jpeg\000"
	.space	3
.LC129:
	.ascii	"pxl_async0\000"
	.space	1
.LC130:
	.ascii	"pxl_async1\000"
	.space	1
.LC131:
	.ascii	"ppmucamif\000"
	.space	2
.LC132:
	.ascii	"rotator\000"
.LC133:
	.ascii	"exynos-rot\000"
	.space	1
.LC134:
	.ascii	"hsmmc\000"
	.space	2
.LC135:
	.ascii	"dwmci\000"
	.space	2
.LC136:
	.ascii	"adc\000"
.LC137:
	.ascii	"keypad\000"
	.space	1
.LC138:
	.ascii	"rtc\000"
.LC139:
	.ascii	"watchdog\000"
	.space	3
.LC140:
	.ascii	"hdmicec\000"
.LC141:
	.ascii	"sromc\000"
	.space	2
.LC142:
	.ascii	"usbhost\000"
.LC143:
	.ascii	"usbotg\000"
	.space	1
.LC144:
	.ascii	"spi\000"
.LC145:
	.ascii	"samsung-i2s.1\000"
	.space	2
.LC146:
	.ascii	"samsung-i2s.2\000"
	.space	2
.LC147:
	.ascii	"slimbus\000"
.LC148:
	.ascii	"spdif\000"
	.space	2
.LC149:
	.ascii	"samsung-spdif\000"
	.space	2
.LC150:
	.ascii	"ac97\000"
	.space	3
.LC151:
	.ascii	"samsung-ac97\000"
	.space	3
.LC152:
	.ascii	"i2c-hdmiphy\000"
.LC153:
	.ascii	"ppmutv\000"
	.space	1
.LC154:
	.ascii	"hdmi\000"
	.space	3
.LC155:
	.ascii	"dac\000"
.LC156:
	.ascii	"s5p-sdo\000"
.LC157:
	.ascii	"mixer\000"
	.space	2
.LC158:
	.ascii	"vp\000"
	.space	1
.LC159:
	.ascii	"ppmuimage\000"
	.space	2
.LC160:
	.ascii	"qerotator\000"
	.space	2
.LC161:
	.ascii	"hdmiphy\000"
.LC162:
	.ascii	"exynos4-hdmi\000"
	.space	3
.LC163:
	.ascii	"dacphy\000"
	.space	1
.LC164:
	.ascii	"sysmmu\000"
	.space	1
.LC165:
	.ascii	"s5p-sysmmu.0\000"
	.space	3
.LC166:
	.ascii	"s5p-sysmmu.1\000"
	.space	3
.LC167:
	.ascii	"s5p-sysmmu.2\000"
	.space	3
.LC168:
	.ascii	"s5p-sysmmu.3\000"
	.space	3
.LC169:
	.ascii	"s5p-sysmmu.4\000"
	.space	3
.LC170:
	.ascii	"s5p-sysmmu.5\000"
	.space	3
.LC171:
	.ascii	"s5p-sysmmu.6\000"
	.space	3
.LC172:
	.ascii	"s5p-sysmmu.10\000"
	.space	2
.LC173:
	.ascii	"s5p-sysmmu.11\000"
	.space	2
.LC174:
	.ascii	"s5p-sysmmu.12\000"
	.space	2
.LC175:
	.ascii	"s5p-sysmmu.13\000"
	.space	2
.LC176:
	.ascii	"s5p-sysmmu.14\000"
	.space	2
.LC177:
	.ascii	"s5p-sysmmu.16\000"
	.space	2
.LC178:
	.ascii	"gps\000"
.LC179:
	.ascii	"ppmumfc\000"
.LC180:
	.ascii	"mfc\000"
.LC181:
	.ascii	"s3c-mfc\000"
.LC182:
	.ascii	"tsi\000"
.LC183:
	.ascii	"onenand\000"
.LC184:
	.ascii	"nfcon\000"
	.space	2
.LC185:
	.ascii	"ppmufsys\000"
	.space	3
.LC186:
	.ascii	"ppmug3d\000"
.LC187:
	.ascii	"ppmucam\000"
.LC188:
	.ascii	"hpm\000"
.LC189:
	.ascii	"iec\000"
.LC190:
	.ascii	"apc\000"
.LC191:
	.ascii	"ppmuacp\000"
.LC192:
	.ascii	"ppmucpu\000"
.LC193:
	.ascii	"ppmudmc1\000"
	.space	3
.LC194:
	.ascii	"ppmudmc0\000"
	.space	3
.LC195:
	.ascii	"qefimc\000"
	.space	1
.LC196:
	.ascii	"s5p-qe.3\000"
	.space	3
.LC197:
	.ascii	"s5p-qe.2\000"
	.space	3
.LC198:
	.ascii	"s5p-qe.1\000"
	.space	3
.LC199:
	.ascii	"s5p-qe.0\000"
	.space	3
.LC200:
	.ascii	"qeg3d\000"
	.space	2
.LC201:
	.ascii	"secss\000"
	.space	2
.LC202:
	.ascii	"sclk_mixer\000"
	.space	1
.LC203:
	.ascii	"sclk_hdmi\000"
	.space	2
.LC204:
	.ascii	"sclk_pixel\000"
	.space	1
.LC205:
	.ascii	"sclk_dac\000"
	.space	3
.LC206:
	.ascii	"sclk_vpll\000"
	.space	2
.LC207:
	.ascii	"vpll_src\000"
	.space	3
.LC208:
	.ascii	"aclk_gdr\000"
	.space	3
.LC209:
	.ascii	"aclk_gdl\000"
	.space	3
.LC210:
	.ascii	"aclk_133\000"
	.space	3
.LC211:
	.ascii	"aclk_160\000"
	.space	3
.LC212:
	.ascii	"aclk_100\000"
	.space	3
.LC213:
	.ascii	"aclk_200\000"
	.space	3
.LC214:
	.ascii	"aclk_c2c\000"
	.space	3
.LC215:
	.ascii	"sclk_c2c\000"
	.space	3
.LC216:
	.ascii	"pclk_acp\000"
	.space	3
.LC217:
	.ascii	"aclk_acp\000"
	.space	3
.LC218:
	.ascii	"aclk_corep\000"
	.space	1
.LC219:
	.ascii	"aclk_cored\000"
	.space	1
.LC220:
	.ascii	"sclk_dmc\000"
	.space	3
.LC221:
	.ascii	"mout_corebus\000"
	.space	3
.LC222:
	.ascii	"periphclk\000"
	.space	2
.LC223:
	.ascii	"aclk_corem1\000"
.LC224:
	.ascii	"aclk_cores\000"
	.space	1
.LC225:
	.ascii	"aclk_corem0\000"
.LC226:
	.ascii	"armclk\000"
	.space	1
.LC227:
	.ascii	"core_clk\000"
	.space	3
.LC228:
	.ascii	"moutcore\000"
	.space	3
.LC229:
	.ascii	"mout_mpll\000"
	.space	2
.LC230:
	.ascii	"mout_epll\000"
	.space	2
.LC231:
	.ascii	"audiocdclk\000"
	.space	1
.LC232:
	.ascii	"sclk_apll\000"
	.space	2
.LC233:
	.ascii	"mout_apll\000"
	.space	2
.LC234:
	.ascii	"spdifcdclk\000"
	.space	1
.LC235:
	.ascii	"sclk_usbphy1\000"
	.space	3
.LC236:
	.ascii	"sclk_usbphy0\000"
	.space	3
.LC237:
	.ascii	"sclk_hdmiphy\000"
	.space	3
.LC238:
	.ascii	"sclk_hdmi27m\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	xtal_rate, %object
	.size	xtal_rate, 4
xtal_rate:
	.space	4
	.type	exynos4_epll_ops, %object
	.size	exynos4_epll_ops, 16
exynos4_epll_ops:
	.space	16
	.type	exynos4_vpll_ops, %object
	.size	exynos4_vpll_ops, 16
exynos4_vpll_ops:
	.space	16
	.ident	"GCC: (GNU) 4.8"
