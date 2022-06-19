/*
 *  LEDs triggers for power supply class
 *
 *  Copyright © 2007  Anton Vorontsov <cbou@mail.ru>
 *  Copyright © 2004  Szabolcs Gyurko
 *  Copyright © 2003  Ian Molton <spyro@f2s.com>
 *
 *  Modified: 2004, Oct     Szabolcs Gyurko
 *
 *  You may use this code as per GPL version 2
 */

#include <linux/kernel.h>
#include <linux/power_supply.h>
#include <linux/slab.h>

#include "power_supply.h"

/* Battery specific LEDs triggers. */

static void power_supply_update_bat_leds(struct power_supply *psy)
{
	union power_supply_propval status;
	union power_supply_propval capacity_level;

	if (psy->get_property(psy, POWER_SUPPLY_PROP_STATUS, &status) ||
			psy->get_property(psy, POWER_SUPPLY_PROP_CAPACITY_LEVEL, &capacity_level))
		return;

	dev_dbg(psy->dev, "%s %d\n", __func__, status.intval);
	
	if(status.intval == POWER_SUPPLY_STATUS_CHARGING ||
			status.intval == POWER_SUPPLY_STATUS_FULL){
		switch(capacity_level.intval){
			case POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL:
				led_trigger_event(psy->charging_trig, LED_FULL);
				led_trigger_event(psy->charging_critical_trig, LED_FULL);
				led_trigger_event(psy->charging_low_trig, LED_OFF);
				led_trigger_event(psy->charging_normal_trig, LED_OFF);
				led_trigger_event(psy->charging_high_trig, LED_OFF);
				led_trigger_event(psy->charging_full_trig, LED_OFF);
				led_trigger_event(psy->charging_critical_low_trig, LED_FULL);
				led_trigger_event(psy->charging_high_full_trig, LED_OFF);
				goto success;
			case POWER_SUPPLY_CAPACITY_LEVEL_LOW:
				led_trigger_event(psy->charging_trig, LED_FULL);
				led_trigger_event(psy->charging_critical_trig, LED_OFF);
				led_trigger_event(psy->charging_low_trig, LED_FULL);
				led_trigger_event(psy->charging_normal_trig, LED_OFF);
				led_trigger_event(psy->charging_high_trig, LED_OFF);
				led_trigger_event(psy->charging_full_trig, LED_OFF);
				led_trigger_event(psy->charging_critical_low_trig, LED_FULL);
				led_trigger_event(psy->charging_high_full_trig, LED_OFF);
				goto success;
			case POWER_SUPPLY_CAPACITY_LEVEL_NORMAL:
				led_trigger_event(psy->charging_trig, LED_FULL);
				led_trigger_event(psy->charging_critical_trig, LED_OFF);
				led_trigger_event(psy->charging_low_trig, LED_OFF);
				led_trigger_event(psy->charging_normal_trig, LED_FULL);
				led_trigger_event(psy->charging_high_trig, LED_OFF);
				led_trigger_event(psy->charging_full_trig, LED_OFF);
				led_trigger_event(psy->charging_critical_low_trig, LED_OFF);
				led_trigger_event(psy->charging_high_full_trig, LED_OFF);
				goto success;
			case POWER_SUPPLY_CAPACITY_LEVEL_HIGH:
				led_trigger_event(psy->charging_trig, LED_FULL);
				led_trigger_event(psy->charging_critical_trig, LED_OFF);
				led_trigger_event(psy->charging_low_trig, LED_OFF);
				led_trigger_event(psy->charging_normal_trig, LED_OFF);
				led_trigger_event(psy->charging_high_trig, LED_FULL);
				led_trigger_event(psy->charging_full_trig, LED_OFF);
				led_trigger_event(psy->charging_critical_low_trig, LED_OFF);
				led_trigger_event(psy->charging_high_full_trig, LED_FULL);
				goto success;
			case POWER_SUPPLY_CAPACITY_LEVEL_FULL:
				led_trigger_event(psy->charging_trig, LED_FULL);
				led_trigger_event(psy->charging_critical_trig, LED_OFF);
				led_trigger_event(psy->charging_low_trig, LED_OFF);
				led_trigger_event(psy->charging_normal_trig, LED_OFF);
				led_trigger_event(psy->charging_high_trig, LED_OFF);
				led_trigger_event(psy->charging_full_trig, LED_FULL);
				led_trigger_event(psy->charging_critical_low_trig, LED_OFF);
				led_trigger_event(psy->charging_high_full_trig, LED_FULL);
				goto success;
		}
	}
	
	led_trigger_event(psy->charging_trig, LED_OFF);
	led_trigger_event(psy->charging_critical_trig, LED_OFF);
	led_trigger_event(psy->charging_low_trig, LED_OFF);
	led_trigger_event(psy->charging_normal_trig, LED_OFF);
	led_trigger_event(psy->charging_high_trig, LED_OFF);
	led_trigger_event(psy->charging_full_trig, LED_OFF);
	led_trigger_event(psy->charging_critical_low_trig, LED_OFF);
	led_trigger_event(psy->charging_high_full_trig, LED_OFF);

	success:
	return ;
}

static int power_supply_create_bat_triggers(struct power_supply *psy)
{
	int rc = 0;

	psy->charging_trig_name = kasprintf(GFP_KERNEL,
					"%s-charging", psy->name);
	if (!psy->charging_trig_name)
		goto charging_failed;

	psy->charging_critical_trig_name = kasprintf(GFP_KERNEL,
					"%s-charging-critical", psy->name);
	if (!psy->charging_critical_trig_name)
		goto charging_critical_failed;

	psy->charging_low_trig_name = kasprintf(GFP_KERNEL,
					"%s-charging-low", psy->name);
	if (!psy->charging_low_trig_name)
		goto charging_low_failed;

	psy->charging_normal_trig_name = kasprintf(GFP_KERNEL,
					"%s-charging-normal", psy->name);
	if (!psy->charging_normal_trig_name)
		goto charging_normal_failed;

	psy->charging_high_trig_name = kasprintf(GFP_KERNEL,
					"%s-charging-high", psy->name);
	if (!psy->charging_high_trig_name)
		goto charging_high_failed;

	psy->charging_full_trig_name = kasprintf(GFP_KERNEL,
					"%s-charging-full", psy->name);
	if (!psy->charging_full_trig_name)
		goto charging_full_failed;

	psy->charging_critical_low_trig_name = kasprintf(GFP_KERNEL,
					"%s-charging-critical-low", psy->name);
	if (!psy->charging_critical_low_trig_name)
		goto charging_critical_low_failed;

	psy->charging_high_full_trig_name = kasprintf(GFP_KERNEL,
					"%s-charging-high-full", psy->name);
	if (!psy->charging_high_full_trig_name)
		goto charging_high_full_failed;

	led_trigger_register_simple(psy->charging_trig_name,
				    &psy->charging_trig);
	led_trigger_register_simple(psy->charging_critical_trig_name,
				    &psy->charging_critical_trig);
	led_trigger_register_simple(psy->charging_low_trig_name,
				    &psy->charging_low_trig);
	led_trigger_register_simple(psy->charging_normal_trig_name,
				    &psy->charging_normal_trig);
	led_trigger_register_simple(psy->charging_high_trig_name,
				    &psy->charging_high_trig);
	led_trigger_register_simple(psy->charging_full_trig_name,
				    &psy->charging_full_trig);
	led_trigger_register_simple(psy->charging_critical_low_trig_name,
				    &psy->charging_critical_low_trig);
	led_trigger_register_simple(psy->charging_high_full_trig_name,
				    &psy->charging_high_full_trig);

	goto success;

charging_high_full_failed:
	kfree(psy->charging_critical_low_trig_name);
charging_critical_low_failed:
	kfree(psy->charging_full_trig_name);
charging_full_failed:
	kfree(psy->charging_high_trig_name);
charging_high_failed:
	kfree(psy->charging_normal_trig_name);
charging_normal_failed:
	kfree(psy->charging_low_trig_name);
charging_low_failed:
	kfree(psy->charging_critical_trig_name);
charging_critical_failed:
	kfree(psy->charging_trig_name);
charging_failed:
	rc = -ENOMEM;
success:
	return rc;
}

static void power_supply_remove_bat_triggers(struct power_supply *psy)
{
	led_trigger_unregister_simple(psy->charging_trig);
	led_trigger_unregister_simple(psy->charging_critical_trig);
	led_trigger_unregister_simple(psy->charging_low_trig);
	led_trigger_unregister_simple(psy->charging_normal_trig);
	led_trigger_unregister_simple(psy->charging_high_trig);
	led_trigger_unregister_simple(psy->charging_full_trig);
	led_trigger_unregister_simple(psy->charging_critical_low_trig);
	led_trigger_unregister_simple(psy->charging_high_full_trig);
	kfree(psy->charging_trig_name);
	kfree(psy->charging_critical_trig_name);
	kfree(psy->charging_low_trig_name);
	kfree(psy->charging_normal_trig_name);
	kfree(psy->charging_high_trig_name);
	kfree(psy->charging_full_trig_name);
	kfree(psy->charging_critical_low_trig_name);
	kfree(psy->charging_high_full_trig_name);
}

/* Generated power specific LEDs triggers. */

static void power_supply_update_gen_leds(struct power_supply *psy)
{
	union power_supply_propval online;

	if (psy->get_property(psy, POWER_SUPPLY_PROP_ONLINE, &online))
		return;

	dev_dbg(psy->dev, "%s %d\n", __func__, online.intval);

	if (online.intval)
		led_trigger_event(psy->online_trig, LED_FULL);
	else
		led_trigger_event(psy->online_trig, LED_OFF);
}

static int power_supply_create_gen_triggers(struct power_supply *psy)
{
	int rc = 0;

	psy->online_trig_name = kasprintf(GFP_KERNEL, "%s-online", psy->name);
	if (!psy->online_trig_name)
		goto online_failed;

	led_trigger_register_simple(psy->online_trig_name, &psy->online_trig);

	goto success;

online_failed:
	rc = -ENOMEM;
success:
	return rc;
}

static void power_supply_remove_gen_triggers(struct power_supply *psy)
{
	led_trigger_unregister_simple(psy->online_trig);
	kfree(psy->online_trig_name);
}

/* Choice what triggers to create&update. */

void power_supply_update_leds(struct power_supply *psy)
{
	if (psy->type == POWER_SUPPLY_TYPE_BATTERY)
		power_supply_update_bat_leds(psy);
	else
		power_supply_update_gen_leds(psy);
}

int power_supply_create_triggers(struct power_supply *psy)
{
	if (psy->type == POWER_SUPPLY_TYPE_BATTERY)
		return power_supply_create_bat_triggers(psy);
	return power_supply_create_gen_triggers(psy);
}

void power_supply_remove_triggers(struct power_supply *psy)
{
	if (psy->type == POWER_SUPPLY_TYPE_BATTERY)
		power_supply_remove_bat_triggers(psy);
	else
		power_supply_remove_gen_triggers(psy);
}
