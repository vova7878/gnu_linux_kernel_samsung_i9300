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
	.file	"dev-asocdma.c"
	.text
	.global	samsung_asoc_idma
	.global	samsung_asoc_dma
	.data
	.align	3
	.type	samsung_asoc_idma, %object
	.size	samsung_asoc_idma, 360
samsung_asoc_idma:
	.word	.LC0
	.word	-1
	.space	252
	.word	audio_idmamask
	.word	-1
	.word	0
	.space	72
	.space	16
	.type	audio_idmamask, %object
	.size	audio_idmamask, 8
audio_idmamask:
	.word	-1
	.word	0
	.type	samsung_asoc_dma, %object
	.size	samsung_asoc_dma, 360
samsung_asoc_dma:
	.word	.LC1
	.word	-1
	.space	252
	.word	audio_dmamask
	.word	-1
	.word	0
	.space	72
	.space	16
	.type	audio_dmamask, %object
	.size	audio_dmamask, 8
audio_dmamask:
	.word	-1
	.word	0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"samsung-audio-idma\000"
	.space	1
.LC1:
	.ascii	"samsung-audio\000"
	.section	___ksymtab+samsung_asoc_dma,"a",%progbits
	.align	2
	.type	__ksymtab_samsung_asoc_dma, %object
	.size	__ksymtab_samsung_asoc_dma, 8
__ksymtab_samsung_asoc_dma:
	.word	samsung_asoc_dma
	.word	__kstrtab_samsung_asoc_dma
	.section	___ksymtab+samsung_asoc_idma,"a",%progbits
	.align	2
	.type	__ksymtab_samsung_asoc_idma, %object
	.size	__ksymtab_samsung_asoc_idma, 8
__ksymtab_samsung_asoc_idma:
	.word	samsung_asoc_idma
	.word	__kstrtab_samsung_asoc_idma
	.section	__ksymtab_strings,"a",%progbits
	.type	__kstrtab_samsung_asoc_idma, %object
	.size	__kstrtab_samsung_asoc_idma, 18
__kstrtab_samsung_asoc_idma:
	.ascii	"samsung_asoc_idma\000"
	.type	__kstrtab_samsung_asoc_dma, %object
	.size	__kstrtab_samsung_asoc_dma, 17
__kstrtab_samsung_asoc_dma:
	.ascii	"samsung_asoc_dma\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
