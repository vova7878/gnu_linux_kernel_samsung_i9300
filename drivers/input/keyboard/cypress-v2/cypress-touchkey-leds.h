#ifndef _CYPRESS_TOUCHKEY_LEDS_H
#define _CYPRESS_TOUCHKEY_LEDS_H

#include <linux/i2c.h>
#include <linux/leds.h>

extern struct touchkey_i2c *tkey_i2c;

int i2c_touchkey_write(struct i2c_client *client,
		u8 *val, unsigned int len);

int touchkey_led_probe(void);
void touchkey_led_remove(void);

#endif /* _CYPRESS_TOUCHKEY_LEDS_H */
