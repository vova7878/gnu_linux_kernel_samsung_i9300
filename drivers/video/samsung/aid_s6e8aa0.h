#ifndef __AID_S6E8AA0_H__
#define __AID_S6E8AA0_H__

#include "smart_dimming.h"

#define aid_300nit_260nit_F8_1st	0x19
#define aid_300nit_260nit_F8_18th	0x04
#define aid_250nit_190nit_F8_1st	0x19
#define aid_250nit_190nit_F8_18th	0x04
#define aid_188nit_182nit_F8_1st	0x59
#define aid_188nit_F8_18th		0x0D
#define aid_186nit_F8_18th		0x1A
#define aid_184nit_F8_18th		0x27
#define aid_182nit_F8_18th		0x34
#define aid_180nit_110nit_F8_18th	0x42
#define aid_180nit_110nit_F8_1st	0x59
#define aid_100nit_20nit_F8_1st	0x59
#define AOR40_BASE_188		201
#define AOR40_BASE_186		214
#define AOR40_BASE_184		234
#define AOR40_BASE_182		250
#define AOR40_BASE_180		273
#define AOR40_BASE_170		258
#define AOR40_BASE_160		244
#define AOR40_BASE_150		229
#define AOR40_BASE_140		215
#define AOR40_BASE_130		200
#define AOR40_BASE_120		186
#define AOR40_BASE_110		171
#define base_20to100			110

unsigned int brightness_config = 1;

unsigned char aid_108nit_F8_18th = 0x38;
unsigned char aid_106nit_F8_18th = 0x2F;
unsigned char aid_104nit_F8_18th = 0x25;
unsigned char aid_102nit_F8_18th = 0x1C;
unsigned char aid_100nit_F8_18th = 0x12;
unsigned char aid_90nit_F8_18th = 0x22;
unsigned char aid_80nit_F8_18th = 0x32;
unsigned char aid_70nit_F8_18th = 0x41;
unsigned char aid_60nit_F8_18th = 0x50;
unsigned char aid_50nit_F8_18th = 0x5E;
unsigned char aid_40nit_F8_18th = 0x6C;
unsigned char aid_30nit_F8_18th = 0x7A;
unsigned char aid_20nit_F8_18th = 0x88;

unsigned int AOR40_BASE_108 = 156;
unsigned int AOR40_BASE_106 = 143;
unsigned int AOR40_BASE_104 = 130;
unsigned int AOR40_BASE_102 = 120;

const struct rgb_offset_info aid_rgb_fix_table[] = {
	{GAMMA_180CD, IV_15, CI_RED, 1}, {GAMMA_180CD, IV_15, CI_GREEN, -1}, {GAMMA_180CD, IV_15, CI_BLUE, 5},
	{GAMMA_170CD, IV_15, CI_RED, 1}, {GAMMA_170CD, IV_15, CI_GREEN, -1}, {GAMMA_170CD, IV_15, CI_BLUE, 5},
	{GAMMA_160CD, IV_15, CI_RED, 1}, {GAMMA_160CD, IV_15, CI_GREEN, -1}, {GAMMA_160CD, IV_15, CI_BLUE, 5},
	{GAMMA_150CD, IV_15, CI_RED, 1}, {GAMMA_150CD, IV_15, CI_GREEN, -1}, {GAMMA_150CD, IV_15, CI_BLUE, 5},
	{GAMMA_140CD, IV_15, CI_RED, 1}, {GAMMA_140CD, IV_15, CI_GREEN, -1}, {GAMMA_140CD, IV_15, CI_BLUE, 5},
	{GAMMA_130CD, IV_15, CI_RED, 1}, {GAMMA_130CD, IV_15, CI_GREEN, -1}, {GAMMA_130CD, IV_15, CI_BLUE, 5},
	{GAMMA_120CD, IV_15, CI_RED, 1}, {GAMMA_120CD, IV_15, CI_GREEN, -1}, {GAMMA_120CD, IV_15, CI_BLUE, 5},
	{GAMMA_110CD, IV_15, CI_RED, 1}, {GAMMA_110CD, IV_15, CI_GREEN, -1}, {GAMMA_110CD, IV_15, CI_BLUE, 5},
	{GAMMA_108CD, IV_15, CI_RED, 1}, {GAMMA_110CD, IV_15, CI_GREEN, -1}, {GAMMA_110CD, IV_15, CI_BLUE, 5},
	{GAMMA_106CD, IV_15, CI_RED, 1}, {GAMMA_110CD, IV_15, CI_GREEN, -1}, {GAMMA_110CD, IV_15, CI_BLUE, 5},
	{GAMMA_104CD, IV_15, CI_RED, 1}, {GAMMA_110CD, IV_15, CI_GREEN, -1}, {GAMMA_110CD, IV_15, CI_BLUE, 5},
	{GAMMA_102CD, IV_15, CI_RED, 1}, {GAMMA_110CD, IV_15, CI_GREEN, -1}, {GAMMA_110CD, IV_15, CI_BLUE, 5},
	{GAMMA_100CD, IV_15, CI_RED, -2}, {GAMMA_100CD, IV_15, CI_GREEN, -3},
	{GAMMA_90CD, IV_15, CI_RED, -6}, {GAMMA_90CD, IV_15, CI_GREEN, -7},
	{GAMMA_80CD, IV_15, CI_RED, -10}, {GAMMA_80CD, IV_15, CI_GREEN, -12},
	{GAMMA_70CD, IV_15, CI_RED, -17}, {GAMMA_70CD, IV_15, CI_GREEN, -20},
	{GAMMA_60CD, IV_15, CI_RED, -27}, {GAMMA_60CD, IV_15, CI_GREEN, -32},
	{GAMMA_50CD, IV_15, CI_RED, -44}, {GAMMA_50CD, IV_15, CI_GREEN, -53},
	{GAMMA_40CD, IV_15, CI_RED, -44}, {GAMMA_40CD, IV_15, CI_GREEN, -53}, {GAMMA_40CD, IV_15, CI_BLUE, 14},
	{GAMMA_30CD, IV_15, CI_RED, -44}, {GAMMA_30CD, IV_15, CI_GREEN, -53}, {GAMMA_30CD, IV_15, CI_BLUE, 32},
	{GAMMA_20CD, IV_15, CI_RED, -33}, {GAMMA_20CD, IV_15, CI_GREEN, -53}, {GAMMA_20CD, IV_15, CI_BLUE, 62},
	{GAMMA_20CD, IV_35, CI_RED, -15}, {GAMMA_20CD, IV_35, CI_GREEN, -12},
};

static unsigned char aid_command_20[2];

static unsigned char aid_command_30[2];

static unsigned char aid_command_40[2];

static unsigned char aid_command_50[2];

static unsigned char aid_command_60[2];

static unsigned char aid_command_70[2];

static unsigned char aid_command_80[2];

static unsigned char aid_command_90[2];

static unsigned char aid_command_100[2];

static unsigned char aid_command_102[2];

static unsigned char aid_command_104[2];

static unsigned char aid_command_106[2];

static unsigned char aid_command_108[2];

static unsigned char aid_command_110[] = {
	aid_180nit_110nit_F8_18th,
	aid_180nit_110nit_F8_1st,
};

static unsigned char aid_command_120[] = {
	aid_180nit_110nit_F8_18th,
	aid_180nit_110nit_F8_1st,
};

static unsigned char aid_command_130[] = {
	aid_180nit_110nit_F8_18th,
	aid_180nit_110nit_F8_1st,
};

static unsigned char aid_command_140[] = {
	aid_180nit_110nit_F8_18th,
	aid_180nit_110nit_F8_1st,
};

static unsigned char aid_command_150[] = {
	aid_180nit_110nit_F8_18th,
	aid_180nit_110nit_F8_1st,
};

static unsigned char aid_command_160[] = {
	aid_180nit_110nit_F8_18th,
	aid_180nit_110nit_F8_1st,
};

static unsigned char aid_command_170[] = {
	aid_180nit_110nit_F8_18th,
	aid_180nit_110nit_F8_1st,
};

static unsigned char aid_command_180[] = {
	aid_180nit_110nit_F8_18th,
	aid_180nit_110nit_F8_1st,
};

static unsigned char aid_command_182[] = {
	aid_182nit_F8_18th,
	aid_188nit_182nit_F8_1st,
};

static unsigned char aid_command_184[] = {
	aid_184nit_F8_18th,
	aid_188nit_182nit_F8_1st,
};

static unsigned char aid_command_186[] = {
	aid_186nit_F8_18th,
	aid_188nit_182nit_F8_1st,
};

static unsigned char aid_command_188[] = {
	aid_188nit_F8_18th,
	aid_188nit_182nit_F8_1st,
};

static unsigned char aid_command_190[] = {
	aid_250nit_190nit_F8_18th,
	aid_250nit_190nit_F8_1st,
};

static unsigned char aid_command_200[] = {
	aid_250nit_190nit_F8_18th,
	aid_250nit_190nit_F8_1st,
};

static unsigned char aid_command_210[] = {
	aid_250nit_190nit_F8_18th,
	aid_250nit_190nit_F8_1st,
};

static unsigned char aid_command_220[] = {
	aid_250nit_190nit_F8_18th,
	aid_250nit_190nit_F8_1st,
};

static unsigned char aid_command_230[] = {
	aid_250nit_190nit_F8_18th,
	aid_250nit_190nit_F8_1st,
};

static unsigned char aid_command_240[] = {
	aid_250nit_190nit_F8_18th,
	aid_250nit_190nit_F8_1st,
};

static unsigned char aid_command_250[] = {
	aid_250nit_190nit_F8_18th,
	aid_250nit_190nit_F8_1st,
};

static unsigned char aid_command_300[] = {
	aid_300nit_260nit_F8_18th,
	aid_300nit_260nit_F8_1st,
};

static unsigned char *aid_command_table[GAMMA_MAX] = {
	aid_command_20,
	aid_command_30,
	aid_command_40,
	aid_command_50,
	aid_command_60,
	aid_command_70,
	aid_command_80,
	aid_command_90,
	aid_command_100,
	aid_command_102,
	aid_command_104,
	aid_command_106,
	aid_command_108,
	aid_command_110,
	aid_command_120,
	aid_command_130,
	aid_command_140,
	aid_command_150,
	aid_command_160,
	aid_command_170,
	aid_command_180,
	aid_command_182,
	aid_command_184,
	aid_command_186,
	aid_command_188,
	aid_command_190,
	aid_command_200,
	aid_command_210,
	aid_command_220,
	aid_command_230,
	aid_command_240,
	aid_command_250,
	aid_command_300
};

#endif
