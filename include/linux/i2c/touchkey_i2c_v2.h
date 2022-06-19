#ifndef _LINUX_CYPRESS_TOUCHKEY_I2C_H
#define _LINUX_CYPRESS_TOUCHKEY_I2C_H

#include <linux/module.h>
#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/input.h>
#include <linux/i2c.h>
#include <linux/interrupt.h>
#include <linux/slab.h>
#include <linux/hrtimer.h>
#include <linux/gpio.h>
#include <linux/irq.h>
#include <linux/delay.h>
#include <linux/leds.h>

#ifdef CONFIG_HAS_EARLYSUSPEND
#include <linux/earlysuspend.h>
#endif

/* Touchkey Register */
#define KEYCODE_REG			0x00

#define TK_BIT_PRESS_EV		0x08
#define TK_BIT_KEYCODE		0x07

#define TK_BIT_AUTOCAL		0x80

#define TK_CMD_LED_ON		0x10
#define TK_CMD_LED_OFF		0x20

#define TK_UPDATE_DOWN		1
#define TK_UPDATE_FAIL		-1
#define TK_UPDATE_PASS		0

/* Firmware Version */
#define TK_FIRMWARE_VER  0x06
#define TK_MODULE_VER    0x05

/* LDO Regulator */
#define	TK_REGULATOR_NAME	"touchkey"

/* LED LDO Type*/
#define LED_LDO_WITH_EN_PIN

#define  TOUCHKEY_FW_UPDATEABLE_HW_REV  11

struct touchkey_platform_data {
	int (*power_on) (bool);
	int (*led_power_on) (bool);
};

/*Parameters for i2c driver*/
struct touchkey_i2c {
	struct i2c_client *client;
	struct input_dev *input_dev;
	struct early_suspend early_suspend;
	struct led_classdev cdev;
	//struct mutex lock;
	struct device	*dev;
	int irq;
	int module_ver;
	int firmware_ver;
	struct touchkey_platform_data *pdata;
	char *name;
	int update_status;
	atomic_t keypad_enable;
};

#endif /* _LINUX_CYPRESS_TOUCHKEY_I2C_H */
