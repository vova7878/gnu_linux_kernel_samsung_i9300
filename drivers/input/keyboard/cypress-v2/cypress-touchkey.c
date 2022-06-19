/*
 * Driver for keys on GPIO lines capable of generating interrupts.
 *
 * Copyright 2005 Phil Blundell
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */

#include <linux/module.h>

#include <linux/init.h>
#include <linux/fs.h>
#include <linux/i2c.h>
#include <linux/interrupt.h>
#include <linux/irq.h>
#include <linux/sched.h>
#include <linux/pm.h>
#include <linux/sysctl.h>
#include <linux/proc_fs.h>
#include <linux/delay.h>
#include <linux/platform_device.h>
#include <linux/input.h>
#include <asm/system_info.h>
#include <mach/regs-gpio.h>
#include <plat/gpio-cfg.h>
#include <linux/gpio.h>
#include <linux/miscdevice.h>
#include <linux/uaccess.h>
#include <linux/earlysuspend.h>
#include <linux/io.h>
#include <linux/regulator/consumer.h>
#include <linux/regulator/driver.h>
#include <linux/regulator/machine.h>
#include <linux/regulator/consumer.h>
#include <linux/regulator/driver.h>
#include <linux/regulator/machine.h>
#include <linux/i2c/touchkey_i2c_v2.h>

#include "cypress-touchkey-leds.h"

#ifdef CONFIG_TOUCHSCREEN_ATMEL_MXT540E
#include <linux/i2c/mxt540e.h>
#else
#include <linux/i2c/mxt224_u1.h>
#endif

static int touchkey_keycode[] = { 0,
	KEY_BACK, KEY_MENU,
};
static const int touchkey_count = sizeof(touchkey_keycode) / sizeof(int);

static u16 raw_data0;
static u16 raw_data1;
static u16 raw_data2;
static u16 raw_data3;
static u8 idac0;
static u8 idac1;
static u8 idac2;
static u8 idac3;
static u8 touchkey_threshold;

static int touchkey_autocalibration(void);

static int touchkey_i2c_check(void);

static u16 menu_sensitivity;
static u16 back_sensitivity;

struct touchkey_i2c *tkey_i2c;

static const struct i2c_device_id sec_touchkey_id[] = {
	{"sec_touchkey", 0},
	{}
};

MODULE_DEVICE_TABLE(i2c, sec_touchkey_id);

static int touchkey_debug_count;
static char touchkey_debug[104];

static void set_touchkey_debug(char value)
{
	if (touchkey_debug_count == 100)
		touchkey_debug_count = 0;

	touchkey_debug[touchkey_debug_count] = value;
	touchkey_debug_count++;
}

static int i2c_touchkey_read(struct i2c_client *client,
		u8 reg, u8 *val, unsigned int len)
{
	int err = 0;
	int retry = 3;

	if (client == NULL) {
		printk(KERN_ERR "[TouchKey] touchkey is not enabled. %d\n",
		       __LINE__);
		return -ENODEV;
	}

	while (retry--) {
		err = i2c_smbus_read_i2c_block_data(client,
				KEYCODE_REG, len, val);

		if (err >= 0)
			return 0;
		printk(KERN_ERR "[TouchKey] %s %d i2c transfer error\n",
		       __func__, __LINE__);
		mdelay(10);
	}
	return err;

}

int i2c_touchkey_write(struct i2c_client *client,
		u8 *val, unsigned int len)
{
	int err = 0;
	int retry = 3;

	if (client == NULL) {
		printk(KERN_ERR "[TouchKey] touchkey is not enabled. %d\n",
		       __LINE__);
		return -ENODEV;
	}

	while (retry--) {
		err = i2c_smbus_write_i2c_block_data(client,
				KEYCODE_REG, len, val);

		if (err >= 0)
			return 0;

		printk(KERN_DEBUG "[TouchKey] %s %d i2c transfer error\n",
		       __func__, __LINE__);
		mdelay(10);
	}
	return err;
}

static int touchkey_autocalibration()
{
	u8 data[6] = { 0, };
	int count = 0;
	int ret = 0;
	unsigned short retry = 0;

	while (retry < 3) {
		ret = i2c_touchkey_read(tkey_i2c->client, KEYCODE_REG, data, 4);
		if (ret < 0) {
			printk(KERN_ERR "[TouchKey]i2c read fail.\n");
			return ret;
		}
		printk(KERN_DEBUG
				"[TouchKey] data[0]=%x data[1]=%x data[2]=%x data[3]=%x\n",
				data[0], data[1], data[2], data[3]);

		/* Send autocal Command */
		data[0] = 0x50;
		data[3] = 0x01;

		count = i2c_touchkey_write(tkey_i2c->client, data, 4);

		msleep(100);

		/* Check autocal status */
		ret = i2c_touchkey_read(tkey_i2c->client, KEYCODE_REG, data, 6);

		if ((data[5] & TK_BIT_AUTOCAL)) {
			printk(KERN_DEBUG "[Touchkey] autocal Enabled\n");
			break;
		} else
			printk(KERN_DEBUG
			       "[Touchkey] autocal disabled, retry %d\n",
			       retry);

		retry = retry + 1;
	}

	if (retry == 3)
		printk(KERN_DEBUG "[Touchkey] autocal failed\n");

	return count;
}

static ssize_t touchkey_raw_data0_show(struct device *dev,
				       struct device_attribute *attr, char *buf)
{
	u8 data[26] = { 0, };
	int ret;

	printk(KERN_DEBUG "called %s\n", __func__);
	ret = i2c_touchkey_read(tkey_i2c->client, KEYCODE_REG, data, 26);
	printk(KERN_DEBUG "called %s data[16] =%d,data[17] = %d\n", __func__,
	       data[16], data[17]);
	raw_data0 = ((0x00FF & data[16]) << 8) | data[17]; /* menu*/
	return sprintf(buf, "%d\n", raw_data0);
}

static ssize_t touchkey_raw_data1_show(struct device *dev,
				       struct device_attribute *attr, char *buf)
{
	u8 data[26] = { 0, };
	int ret;

	printk(KERN_DEBUG "called %s\n", __func__);
	ret = i2c_touchkey_read(tkey_i2c->client, KEYCODE_REG, data, 26);
	printk(KERN_DEBUG "called %s data[14] =%d,data[15] = %d\n", __func__,
	       data[14], data[15]);
	raw_data1 = ((0x00FF & data[14]) << 8) | data[15]; /*back*/
	return sprintf(buf, "%d\n", raw_data1);
}

static ssize_t touchkey_raw_data2_show(struct device *dev,
				       struct device_attribute *attr, char *buf)
{
	u8 data[26] = { 0, };
	int ret;

	printk(KERN_DEBUG "called %s\n", __func__);
	ret = i2c_touchkey_read(tkey_i2c->client, KEYCODE_REG, data, 26);
	printk(KERN_DEBUG "called %s data[22] =%d,data[23] = %d\n", __func__,
	       data[14], data[15]);
	raw_data2 = ((0x00FF & data[14]) << 8) | data[15];
	return sprintf(buf, "%d\n", raw_data2);
}

static ssize_t touchkey_raw_data3_show(struct device *dev,
				       struct device_attribute *attr, char *buf)
{
	u8 data[26] = { 0, };
	int ret;

	printk(KERN_DEBUG "called %s\n", __func__);
	ret = i2c_touchkey_read(tkey_i2c->client, KEYCODE_REG, data, 26);
	printk(KERN_DEBUG "called %s data[24] =%d,data[25] = %d\n", __func__,
	       data[16], data[17]);
	raw_data3 = ((0x00FF & data[16]) << 8) | data[17];
	return sprintf(buf, "%d\n", raw_data3);
}

static ssize_t touchkey_idac0_show(struct device *dev,
				   struct device_attribute *attr, char *buf)
{
	u8 data[10];
	int ret;

	printk(KERN_DEBUG "called %s\n", __func__);
	ret = i2c_touchkey_read(tkey_i2c->client, KEYCODE_REG, data, 10);
	printk(KERN_DEBUG "called %s data[6] =%d\n", __func__, data[6]);
	idac0 = data[6];
	return sprintf(buf, "%d\n", idac0);
}

static ssize_t touchkey_idac1_show(struct device *dev,
				   struct device_attribute *attr, char *buf)
{
	u8 data[10];
	int ret;

	printk(KERN_DEBUG "called %s\n", __func__);
	ret = i2c_touchkey_read(tkey_i2c->client, KEYCODE_REG, data, 10);
	printk(KERN_DEBUG "called %s data[7] = %d\n", __func__, data[7]);
	idac1 = data[7];
	return sprintf(buf, "%d\n", idac1);
}

static ssize_t touchkey_idac2_show(struct device *dev,
				   struct device_attribute *attr, char *buf)
{
	u8 data[10];
	int ret;

	printk(KERN_DEBUG "called %s\n", __func__);
	ret = i2c_touchkey_read(tkey_i2c->client, KEYCODE_REG, data, 10);
	printk(KERN_DEBUG "called %s data[8] =%d\n", __func__, data[8]);
	idac2 = data[8];
	return sprintf(buf, "%d\n", idac2);
}

static ssize_t touchkey_idac3_show(struct device *dev,
				   struct device_attribute *attr, char *buf)
{
	u8 data[10];
	int ret;

	printk(KERN_DEBUG "called %s\n", __func__);
	ret = i2c_touchkey_read(tkey_i2c->client, KEYCODE_REG, data, 10);
	printk(KERN_DEBUG "called %s data[9] = %d\n", __func__, data[9]);
	idac3 = data[9];
	return sprintf(buf, "%d\n", idac3);
}

static ssize_t touchkey_threshold_show(struct device *dev,
				       struct device_attribute *attr, char *buf)
{
	u8 data[10];
	int ret;

	printk(KERN_DEBUG "called %s\n", __func__);
	ret = i2c_touchkey_read(tkey_i2c->client, KEYCODE_REG, data, 10);
	printk(KERN_DEBUG "called %s data[4] = %d\n", __func__, data[4]);
	touchkey_threshold = data[4];
	return sprintf(buf, "%d\n", touchkey_threshold);
}

#ifdef CONFIG_KEYBOARD_CYPRESS_TOUCH_VIRTUAL_MOUSE
extern void report_virtual_left_button(int state);
extern void report_virtual_right_button(int state);
#endif

static irqreturn_t touchkey_interrupt(int irq, void *dev_id)
{
	u8 data[3];
	int ret;
	int retry = 10;
	int keycode_type = 0;
	int pressed;

	set_touchkey_debug('a');

	if (!atomic_read(&tkey_i2c->keypad_enable)) {
		return IRQ_NONE;
	}

	retry = 3;
	while (retry--) {
		ret = i2c_touchkey_read(tkey_i2c->client, KEYCODE_REG, data, 3);
		if (!ret)
			break;
		else {
			printk(KERN_DEBUG
			       "[TouchKey] i2c read failed, ret:%d, retry: %d\n",
			       ret, retry);
			continue;
		}
	}
	if (ret < 0)
		return IRQ_HANDLED;

	set_touchkey_debug(data[0]);

	keycode_type = (data[0] & TK_BIT_KEYCODE);
	pressed = !(data[0] & TK_BIT_PRESS_EV);

	if (keycode_type <= 0 || keycode_type >= touchkey_count) {
		printk(KERN_DEBUG "[Touchkey] keycode_type err\n");
		return IRQ_HANDLED;
	}

	if (pressed)
		set_touchkey_debug('P');

	if (get_tsp_status() && pressed)
		printk(KERN_DEBUG "[TouchKey] touchkey pressed but don't send event because touch is pressed.\n");
	else {
#ifdef CONFIG_KEYBOARD_CYPRESS_TOUCH_VIRTUAL_MOUSE
		if(keycode_type == 1)
			report_virtual_left_button(pressed);
		else if (keycode_type == 2)
			report_virtual_right_button(pressed);
		else
		{
#endif
			input_report_key(tkey_i2c->input_dev,
					 touchkey_keycode[keycode_type], pressed);
			input_sync(tkey_i2c->input_dev);
#ifdef CONFIG_KEYBOARD_CYPRESS_TOUCH_VIRTUAL_MOUSE
		}
#endif

		printk(KERN_DEBUG "[TouchKey] pressed:%d\n",
			pressed);
	}
	set_touchkey_debug('A');
	return IRQ_HANDLED;
}

#ifdef CONFIG_HAS_EARLYSUSPEND
static int sec_touchkey_early_suspend(struct early_suspend *h)
{
	int i;

	disable_irq(tkey_i2c->irq);

	/* release keys */
	for (i = 1; i < touchkey_count; ++i) {
		input_report_key(tkey_i2c->input_dev,
				 touchkey_keycode[i], 0);
	}
	input_sync(tkey_i2c->input_dev);

	set_touchkey_debug('S');
	printk(KERN_DEBUG "[TouchKey] sec_touchkey_early_suspend\n");

	/* disable ldo18 */
	//tkey_i2c->pdata->led_power_on(0);

	/* disable ldo11 */
	//tkey_i2c->pdata->power_on(0);

	return 0;
}

static int sec_touchkey_late_resume(struct early_suspend *h)
{
	set_touchkey_debug('R');
	printk(KERN_DEBUG "[TouchKey] sec_touchkey_late_resume\n");

	/* enable ldo11 */
	//tkey_i2c->pdata->power_on(1);

	//msleep(50);
	//tkey_i2c->pdata->led_power_on(1);

	touchkey_autocalibration();

	enable_irq(tkey_i2c->irq);

	return 0;
}
#endif

static int touchkey_i2c_check()
{
	char data[3] = { 0, };
	int ret = 0;

	ret = i2c_touchkey_read(tkey_i2c->client, KEYCODE_REG, data, 3);
	if (ret < 0) {
		printk(KERN_ERR "[TouchKey] module version read fail\n");
		return ret;
	}

	tkey_i2c->firmware_ver = data[1];
	tkey_i2c->module_ver = data[2];

	return ret;
}

static ssize_t touch_version_read(struct device *dev,
				  struct device_attribute *attr, char *buf)
{
	char data[3] = { 0, };
	int count;

	i2c_touchkey_read(tkey_i2c->client, KEYCODE_REG, data, 3);

	count = sprintf(buf, "0x%x\n", data[1]);

	printk(KERN_DEBUG "[TouchKey] touch_version_read 0x%x\n", data[1]);
	printk(KERN_DEBUG "[TouchKey] module_version_read 0x%x\n", data[2]);

	return count;
}

static ssize_t touch_version_write(struct device *dev,
				   struct device_attribute *attr,
				   const char *buf, size_t size)
{
	printk(KERN_DEBUG "[TouchKey] input data --> %s\n", buf);

	return size;
}

static ssize_t touch_update_read(struct device *dev,
				 struct device_attribute *attr, char *buf)
{
	int count = 0;

	printk(KERN_DEBUG
	       "[TouchKey] touch_update_read: update_status %d\n",
	       tkey_i2c->update_status);

	if (tkey_i2c->update_status == TK_UPDATE_PASS)
		count = sprintf(buf, "PASS\n");
	else if (tkey_i2c->update_status == TK_UPDATE_DOWN)
		count = sprintf(buf, "Downloading\n");
	else if (tkey_i2c->update_status == TK_UPDATE_FAIL)
		count = sprintf(buf, "Fail\n");

	return count;
}

static ssize_t touchkey_menu_show(struct device *dev,
				  struct device_attribute *attr, char *buf)
{
	u8 data[14] = { 0, };
	int ret;

	ret = i2c_touchkey_read(tkey_i2c->client, KEYCODE_REG, data, 14);

	printk(KERN_DEBUG "called %s data[12] = %d, data[13] =%d\n", __func__,
			data[12], data[13]);
	menu_sensitivity = ((0x00FF & data[12]) << 8) | data[13];
	printk(KERN_DEBUG "called %s menu_sensitivity =%d\n", __func__,
			menu_sensitivity);
	return sprintf(buf, "%d\n", menu_sensitivity);
}

static ssize_t touchkey_back_show(struct device *dev,
				  struct device_attribute *attr, char *buf)
{
	u8 data[14] = { 0, };
	int ret;

	ret = i2c_touchkey_read(tkey_i2c->client, KEYCODE_REG, data, 14);

	printk(KERN_DEBUG "called %s data[10] = %d, data[11] =%d\n", __func__,
			data[10], data[11]);
	back_sensitivity =((0x00FF & data[10]) << 8) | data[11];
	printk(KERN_DEBUG "called %s back_sensitivity =%d\n", __func__,
			back_sensitivity);
	return sprintf(buf, "%d\n", back_sensitivity);
}

static ssize_t autocalibration_enable(struct device *dev,
				      struct device_attribute *attr,
				      const char *buf, size_t size)
{
	int data;

	sscanf(buf, "%d\n", &data);

	if (data == 1)
		touchkey_autocalibration();

	return size;
}

static ssize_t autocalibration_status(struct device *dev,
				      struct device_attribute *attr, char *buf)
{
	u8 data[6];
	int ret;

	printk(KERN_DEBUG "[Touchkey] %s\n", __func__);

	ret = i2c_touchkey_read(tkey_i2c->client, KEYCODE_REG, data, 6);
	if ((data[5] & TK_BIT_AUTOCAL))
		return sprintf(buf, "Enabled\n");
	else
		return sprintf(buf, "Disabled\n");

}

static ssize_t touch_sensitivity_control(struct device *dev,
					 struct device_attribute *attr,
					 const char *buf, size_t size)
{
	unsigned char data = 0x40;
	i2c_touchkey_write(tkey_i2c->client, &data, 1);
	return size;
}

static ssize_t set_touchkey_firm_version_read_show(struct device *dev,
						   struct device_attribute
						   *attr, char *buf)
{
	char data[3] = { 0, };
	int count;

	i2c_touchkey_read(tkey_i2c->client, KEYCODE_REG, data, 3);
	count = sprintf(buf, "0x%x\n", data[1]);

	printk(KERN_DEBUG "[TouchKey] touch_version_read 0x%x\n", data[1]);
	printk(KERN_DEBUG "[TouchKey] module_version_read 0x%x\n", data[2]);
	return count;
}

static ssize_t set_touchkey_firm_status_show(struct device *dev,
					     struct device_attribute *attr,
					     char *buf)
{
	int count = 0;

	printk(KERN_DEBUG
	       "[TouchKey] touch_update_read: update_status %d\n",
	       tkey_i2c->update_status);

	if (tkey_i2c->update_status == TK_UPDATE_PASS)
		count = sprintf(buf, "PASS\n");
	else if (tkey_i2c->update_status == TK_UPDATE_DOWN)
		count = sprintf(buf, "Downloading\n");
	else if (tkey_i2c->update_status == TK_UPDATE_FAIL)
		count = sprintf(buf, "Fail\n");

	return count;
}

static ssize_t sec_keypad_enable_show(struct device *dev,
		struct device_attribute *attr, char *buf)
{
	return sprintf(buf, "%d\n", atomic_read(&tkey_i2c->keypad_enable));
}

static ssize_t sec_keypad_enable_store(struct device *dev,
		struct device_attribute *attr, const char *buf, size_t count)
{
	unsigned int val = 0;
	sscanf(buf, "%d", &val);
	val = (val == 0 ? 0 : 1);
	atomic_set(&tkey_i2c->keypad_enable, val);
	if (val) {
		set_bit(KEY_BACK, tkey_i2c->input_dev->keybit);
		set_bit(KEY_MENU, tkey_i2c->input_dev->keybit);
		set_bit(KEY_HOME, tkey_i2c->input_dev->keybit);
	} else {
		clear_bit(KEY_BACK, tkey_i2c->input_dev->keybit);
		clear_bit(KEY_MENU, tkey_i2c->input_dev->keybit);
		clear_bit(KEY_HOME, tkey_i2c->input_dev->keybit);
	}
	input_sync(tkey_i2c->input_dev);

	return count;
}

static DEVICE_ATTR(keypad_enable, S_IRUGO|S_IWUSR, sec_keypad_enable_show,
	      sec_keypad_enable_store);

static DEVICE_ATTR(recommended_version, S_IRUGO | S_IWUSR | S_IWGRP,
		   touch_version_read, touch_version_write);
static DEVICE_ATTR(touchkey_menu, S_IRUGO | S_IWUSR | S_IWGRP,
		   touchkey_menu_show, NULL);
static DEVICE_ATTR(touchkey_back, S_IRUGO | S_IWUSR | S_IWGRP,
		   touchkey_back_show, NULL);

static DEVICE_ATTR(touch_sensitivity, S_IRUGO | S_IWUSR | S_IWGRP, NULL,
		   touch_sensitivity_control);
static DEVICE_ATTR(touchkey_firm_update_status, S_IRUGO | S_IWUSR | S_IWGRP,
	set_touchkey_firm_status_show, NULL);
static DEVICE_ATTR(touchkey_firm_version_panel, S_IRUGO | S_IWUSR | S_IWGRP,
		   set_touchkey_firm_version_read_show, NULL);

static DEVICE_ATTR(touchkey_raw_data0, S_IRUGO, touchkey_raw_data0_show, NULL);
static DEVICE_ATTR(touchkey_raw_data1, S_IRUGO, touchkey_raw_data1_show, NULL);
static DEVICE_ATTR(touchkey_raw_data2, S_IRUGO, touchkey_raw_data2_show, NULL);
static DEVICE_ATTR(touchkey_raw_data3, S_IRUGO, touchkey_raw_data3_show, NULL);
static DEVICE_ATTR(touchkey_idac0, S_IRUGO, touchkey_idac0_show, NULL);
static DEVICE_ATTR(touchkey_idac1, S_IRUGO, touchkey_idac1_show, NULL);
static DEVICE_ATTR(touchkey_idac2, S_IRUGO, touchkey_idac2_show, NULL);
static DEVICE_ATTR(touchkey_idac3, S_IRUGO, touchkey_idac3_show, NULL);
static DEVICE_ATTR(touchkey_threshold, S_IRUGO, touchkey_threshold_show, NULL);
static DEVICE_ATTR(autocal_enable, S_IRUGO | S_IWUSR | S_IWGRP, NULL,
		   autocalibration_enable);
static DEVICE_ATTR(autocal_stat, S_IRUGO | S_IWUSR | S_IWGRP,
		   autocalibration_status, NULL);

static struct attribute *touchkey_attributes[] = {
	&dev_attr_recommended_version.attr,
	&dev_attr_touchkey_menu.attr,
	&dev_attr_touchkey_back.attr,
	&dev_attr_touch_sensitivity.attr,
	&dev_attr_touchkey_raw_data0.attr,
	&dev_attr_touchkey_raw_data1.attr,
	&dev_attr_touchkey_raw_data2.attr,
	&dev_attr_touchkey_raw_data3.attr,
	&dev_attr_touchkey_idac0.attr,
	&dev_attr_touchkey_idac1.attr,
	&dev_attr_touchkey_idac2.attr,
	&dev_attr_touchkey_idac3.attr,
	&dev_attr_touchkey_threshold.attr,
	&dev_attr_autocal_enable.attr,
	&dev_attr_autocal_stat.attr,
	&dev_attr_keypad_enable.attr,
	NULL,
};

static struct attribute_group touchkey_attr_group = {
	.attrs = touchkey_attributes,
};

static int i2c_touchkey_probe(struct i2c_client *client,
	const struct i2c_device_id *id)
{
	struct touchkey_platform_data *pdata = client->dev.platform_data;

	struct input_dev *input_dev;
	int err = 0;
	unsigned char data;
	int i;
	int ret;

	printk(KERN_DEBUG "[TouchKey] i2c_touchkey_probe\n");

	if (pdata == NULL) {
		printk(KERN_ERR "%s: no pdata\n", __func__);
		return -ENODEV;
	}

	/*Check I2C functionality */
	ret = i2c_check_functionality(client->adapter, I2C_FUNC_I2C);
	if (ret == 0) {
		printk(KERN_ERR "[Touchkey] No I2C functionality found\n");
		ret = -ENODEV;
		return ret;
	}

	/*Obtain kernel memory space for touchkey i2c */
	tkey_i2c = kzalloc(sizeof(struct touchkey_i2c), GFP_KERNEL);
	if (NULL == tkey_i2c) {
		printk(KERN_ERR "[Touchkey] failed to allocate tkey_i2c.\n");
		return -ENOMEM;
	}

	input_dev = input_allocate_device();

	if (!input_dev) {
		printk(KERN_ERR"[Touchkey] failed to allocate input device\n");
		ret = -ENOMEM;
		goto exit_tkey_i2c;
	}

	input_dev->name = "sec_touchkey";
	input_dev->phys = "sec_touchkey/input0";
	input_dev->id.bustype = BUS_HOST;
	input_dev->dev.parent = &client->dev;

	/*tkey_i2c*/
	tkey_i2c->pdata = pdata;
	tkey_i2c->input_dev = input_dev;
	tkey_i2c->client = client;
	tkey_i2c->irq = client->irq;
	tkey_i2c->name = "sec_touchkey";

	set_bit(EV_SYN, input_dev->evbit);
	set_bit(EV_LED, input_dev->evbit);
	set_bit(LED_MISC, input_dev->ledbit);
	set_bit(EV_KEY, input_dev->evbit);

	atomic_set(&tkey_i2c->keypad_enable, 1);

	for (i = 1; i < touchkey_count; i++)
		set_bit(touchkey_keycode[i], input_dev->keybit);

	ret = input_register_device(input_dev);
	if (ret) {
		printk(KERN_ERR"[Touchkey] failed to register input device\n");
		input_free_device(input_dev);
		goto exit_tkey_i2c;
	}

	tkey_i2c->pdata->power_on(1);
	msleep(50);

	data = 1;

	/*sysfs*/
	tkey_i2c->dev = device_create(sec_class, NULL, 0, NULL, "sec_touchkey");

	if (IS_ERR(tkey_i2c->dev)) {
		printk(KERN_ERR "Failed to create device(tkey_i2c->dev)!\n");
		ret = -ENODEV;
		goto exit;
	}
	ret = sysfs_create_group(&tkey_i2c->dev->kobj,
				&touchkey_attr_group);
	if (ret) {
		printk(KERN_ERR
			"[TouchKey]: failed to create sysfs group\n");
		goto exit;
	}

	gpio_request(GPIO_OLED_DET, "OLED_DET");
	ret = gpio_get_value(GPIO_OLED_DET);
	printk(KERN_DEBUG
	"[TouchKey] OLED_DET = %d\n", ret);

	if (ret == 0) {
		printk(KERN_DEBUG
		"[TouchKey] device wasn't connected to board\n");

		ret = -EBUSY;
		goto exit_group;
	}

	ret =
		request_threaded_irq(tkey_i2c->irq, NULL, touchkey_interrupt,
				IRQF_DISABLED | IRQF_TRIGGER_FALLING |
				IRQF_ONESHOT, tkey_i2c->name, NULL);
	if (ret) {
		printk(KERN_ERR
			"[Touchkey]: failed to request irq(%d) - %d\n",
			tkey_i2c->irq, ret);

		ret = -EBUSY;
		goto exit_group;
	}

	ret = touchkey_led_probe();
	if (ret) {
		printk(KERN_ERR
			"[Touchkey]: failed to create led device");
		goto exit_irq;
	}
	
#ifdef CONFIG_LEDS_TRIGGERS
	tkey_i2c->touchkey_trig_name = "touchkey";
	led_trigger_register_simple(tkey_i2c->touchkey_trig_name,
				    &tkey_i2c->touchkey_trig);
#endif

#ifdef CONFIG_HAS_EARLYSUSPEND
	tkey_i2c->early_suspend.suspend =
		(void *)sec_touchkey_early_suspend;
	tkey_i2c->early_suspend.resume =
		(void *)sec_touchkey_late_resume;
	register_early_suspend(&tkey_i2c->early_suspend);
#endif

	touchkey_autocalibration();
	set_touchkey_debug('K');
	return 0;

exit_irq:
	free_irq(tkey_i2c->irq, touchkey_interrupt);
exit_group:
	sysfs_remove_group(&tkey_i2c->dev->kobj, &touchkey_attr_group);
exit:
	tkey_i2c->pdata->power_on(0);
	input_unregister_device(input_dev);
exit_tkey_i2c:
	kfree(tkey_i2c);
	return ret;
}

static int i2c_touchkey_remove(struct i2c_client *client)
{
#ifdef CONFIG_LEDS_TRIGGERS
	led_trigger_unregister_simple(tkey_i2c->touchkey_trig);
#endif
#ifdef CONFIG_HAS_EARLYSUSPEND
	unregister_early_suspend(&tkey_i2c->early_suspend);
#endif
	touchkey_led_remove();
	tkey_i2c->pdata->power_on(0);
	free_irq(tkey_i2c->irq, touchkey_interrupt);
	sysfs_remove_group(&tkey_i2c->dev->kobj, &touchkey_attr_group);
	input_unregister_device(tkey_i2c->input_dev);
	kfree(tkey_i2c);
	return 0;
}

struct i2c_driver touchkey_i2c_driver = {
	.driver = {
		.name = "sec_touchkey_driver",
	},
	.id_table = sec_touchkey_id,
	.probe = i2c_touchkey_probe,
	.remove = i2c_touchkey_remove,
};

static int __init touchkey_init(void)
{
	int ret = 0;

	if (system_rev < TOUCHKEY_FW_UPDATEABLE_HW_REV) {
		printk(KERN_DEBUG "[Touchkey] Doesn't support this board rev %d\n",
				system_rev);
		return 0;
	}

	ret = i2c_add_driver(&touchkey_i2c_driver);

	if (ret) {
		printk(KERN_ERR
	       "[TouchKey] registration failed, module not inserted.ret= %d\n",
	       ret);
	}
	return ret;
}

static void __exit touchkey_exit(void)
{
	printk(KERN_DEBUG "[TouchKey] %s\n", __func__);
	i2c_del_driver(&touchkey_i2c_driver);
}

late_initcall(touchkey_init);
module_exit(touchkey_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("@@@");
MODULE_DESCRIPTION("touch keypad");
