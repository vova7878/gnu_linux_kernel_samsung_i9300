#include <linux/i2c.h>
#include <linux/leds.h>
#include <linux/i2c/touchkey_i2c_v2.h>

#include "cypress-touchkey-leds.h"

struct touchkey_led_conf {
	const char      *name;
	const char *default_trigger;
	int          brightness;
	int          max_brightness;
	int          flags;
};

static struct touchkey_led_conf led_conf =
{
	.name = "touchkey_led",
	.default_trigger = NULL, //"battery-charging-critical-low",
	.brightness = LED_OFF,
	.max_brightness = LED_FULL,
	.flags = 0,
};

static void touchkey_led_brightness_set(struct led_classdev *cdev, enum led_brightness brightness)
{
	static const int ledCmd[] = {TK_CMD_LED_OFF, TK_CMD_LED_ON};
	int data;

	data = brightness ? 1 : 0;
	data = ledCmd[data];

	i2c_touchkey_write(tkey_i2c->client, (u8 *) &data, 1);
}

int touchkey_led_probe(void)
{
	struct device *dev = &tkey_i2c->client->dev;
	int ret;
	
	tkey_i2c->cdev.brightness_set = touchkey_led_brightness_set;
	tkey_i2c->cdev.name = led_conf.name;
	tkey_i2c->cdev.default_trigger = led_conf.default_trigger;
	tkey_i2c->cdev.brightness = led_conf.brightness;
	tkey_i2c->cdev.max_brightness = led_conf.max_brightness;
	tkey_i2c->cdev.flags = led_conf.flags;

	ret = led_classdev_register(dev, &tkey_i2c->cdev);

	if (ret < 0) {
		printk(KERN_ERR "[Touchkey] failed to register led device\n");
		return ret;
	}

	tkey_i2c->pdata->led_power_on(1);
	
	return 0;
}

void touchkey_led_remove(void)
{
	tkey_i2c->pdata->led_power_on(0);
	led_classdev_unregister(&tkey_i2c->cdev);
}