#ifndef _CYPRESS_TOUCHKEY_LEDS_H
#define _CYPRESS_TOUCHKEY_LEDS_H

#include <linux/i2c.h>
#include <linux/leds.h>

int i2c_touchkey_write(struct i2c_client *client,
		u8 *val, unsigned int len);

int touchkey_led_start(struct touchkey_i2c *tkey_i2c);
void touchkey_led_exit(void);

#endif /* _CYPRESS_TOUCHKEY_LEDS_H */
