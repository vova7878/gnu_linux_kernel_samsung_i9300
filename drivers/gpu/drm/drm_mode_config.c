/*
 * Copyright (c) 2016 Intel Corporation
 *
 * Permission to use, copy, modify, distribute, and sell this software and its
 * documentation for any purpose is hereby granted without fee, provided that
 * the above copyright notice appear in all copies and that both that copyright
 * notice and this permission notice appear in supporting documentation, and
 * that the name of the copyright holders not be used in advertising or
 * publicity pertaining to distribution of the software without specific,
 * written prior permission.  The copyright holders make no representations
 * about the suitability of this software for any purpose.  It is provided "as
 * is" without express or implied warranty.
 *
 * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
 * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
 * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
 * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
 * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
 * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
 * OF THIS SOFTWARE.
 */

#include <drm/drm_mode_config.h>
#include <drm/drmP.h>

#include "drm_crtc_internal.h"
#include "drm_internal.h"

/*
 * Global properties
 */
static const struct drm_prop_enum_list drm_dpms_enum_list[] =
{	{ DRM_MODE_DPMS_ON, "On" },
	{ DRM_MODE_DPMS_STANDBY, "Standby" },
	{ DRM_MODE_DPMS_SUSPEND, "Suspend" },
	{ DRM_MODE_DPMS_OFF, "Off" }
};

DRM_ENUM_NAME_FN(drm_get_dpms_name, drm_dpms_enum_list)

static const struct drm_prop_enum_list drm_plane_type_enum_list[] =
{
	{ DRM_PLANE_TYPE_OVERLAY, "Overlay" },
	{ DRM_PLANE_TYPE_PRIMARY, "Primary" },
	{ DRM_PLANE_TYPE_CURSOR, "Cursor" },
};

int drm_modeset_register_all(struct drm_device *dev)
{
	int ret;

	ret = drm_plane_register_all(dev);
	if (ret)
		goto err_plane;

	ret = drm_crtc_register_all(dev);
	if  (ret)
		goto err_crtc;

	ret = drm_encoder_register_all(dev);
	if (ret)
		goto err_encoder;

	ret = drm_connector_register_all(dev);
	if (ret)
		goto err_connector;

	return 0;

err_connector:
	drm_encoder_unregister_all(dev);
err_encoder:
	drm_crtc_unregister_all(dev);
err_crtc:
	drm_plane_unregister_all(dev);
err_plane:
	return ret;
}

void drm_modeset_unregister_all(struct drm_device *dev)
{
	drm_connector_unregister_all(dev);
	drm_encoder_unregister_all(dev);
	drm_crtc_unregister_all(dev);
	drm_plane_unregister_all(dev);
}

/**
 * drm_mode_getresources - get graphics configuration
 * @dev: drm device for the ioctl
 * @data: data pointer for the ioctl
 * @file_priv: drm file for the ioctl call
 *
 * Construct a set of configuration description structures and return
 * them to the user, including CRTC, connector and framebuffer configuration.
 *
 * Called by the user via ioctl.
 *
 * Returns:
 * Zero on success, errno on failure.
 */
int drm_mode_getresources(struct drm_device *dev, void *data,
			  struct drm_file *file_priv)
{
	struct drm_mode_card_res *card_res = data;
	struct list_head *lh;
	struct drm_framebuffer *fb;
	struct drm_connector *connector;
	struct drm_crtc *crtc;
	struct drm_encoder *encoder;
	int ret = 0;
	int connector_count = 0;
	int crtc_count = 0;
	int fb_count = 0;
	int encoder_count = 0;
	int copied = 0, i;
	uint32_t __user *fb_id;
	uint32_t __user *crtc_id;
	uint32_t __user *connector_id;
	uint32_t __user *encoder_id;
	struct drm_mode_group *mode_group;

	if (!drm_core_check_feature(dev, DRIVER_MODESET))
		return -EINVAL;


	mutex_lock(&file_priv->fbs_lock);
	/*
	 * For the non-control nodes we need to limit the list of resources
	 * by IDs in the group list for this node
	 */
	list_for_each(lh, &file_priv->fbs)
		fb_count++;

	/* handle this in 4 parts */
	/* FBs */
	if (card_res->count_fbs >= fb_count) {
		copied = 0;
		fb_id = (uint32_t __user *)(unsigned long)card_res->fb_id_ptr;
		list_for_each_entry(fb, &file_priv->fbs, filp_head) {
			if (put_user(fb->base.id, fb_id + copied)) {
				mutex_unlock(&file_priv->fbs_lock);
				return -EFAULT;
			}
			copied++;
		}
	}
	card_res->count_fbs = fb_count;
	mutex_unlock(&file_priv->fbs_lock);

	drm_modeset_lock_all(dev);
	if (!drm_is_primary_client(file_priv)) {

		mode_group = NULL;
		list_for_each(lh, &dev->mode_config.crtc_list)
			crtc_count++;

		list_for_each(lh, &dev->mode_config.connector_list)
			connector_count++;

		list_for_each(lh, &dev->mode_config.encoder_list)
			encoder_count++;
	} else {

		mode_group = &file_priv->master->minor->mode_group;
		crtc_count = mode_group->num_crtcs;
		connector_count = mode_group->num_connectors;
		encoder_count = mode_group->num_encoders;
	}

	card_res->max_height = dev->mode_config.max_height;
	card_res->min_height = dev->mode_config.min_height;
	card_res->max_width = dev->mode_config.max_width;
	card_res->min_width = dev->mode_config.min_width;

	/* CRTCs */
	if (card_res->count_crtcs >= crtc_count) {
		copied = 0;
		crtc_id = (uint32_t __user *)(unsigned long)card_res->crtc_id_ptr;
		if (!mode_group) {
			list_for_each_entry(crtc, &dev->mode_config.crtc_list,
					    head) {
				DRM_DEBUG_KMS("[CRTC:%d]\n", crtc->base.id);
				if (put_user(crtc->base.id, crtc_id + copied)) {
					ret = -EFAULT;
					goto out;
				}
				copied++;
			}
		} else {
			for (i = 0; i < mode_group->num_crtcs; i++) {
				if (put_user(mode_group->id_list[i],
					     crtc_id + copied)) {
					ret = -EFAULT;
					goto out;
				}
				copied++;
			}
		}
	}
	card_res->count_crtcs = crtc_count;

	/* Encoders */
	if (card_res->count_encoders >= encoder_count) {
		copied = 0;
		encoder_id = (uint32_t __user *)(unsigned long)card_res->encoder_id_ptr;
		if (!mode_group) {
			list_for_each_entry(encoder,
					    &dev->mode_config.encoder_list,
					    head) {
				DRM_DEBUG_KMS("[ENCODER:%d:%s]\n", encoder->base.id,
						encoder->name);
				if (put_user(encoder->base.id, encoder_id +
					     copied)) {
					ret = -EFAULT;
					goto out;
				}
				copied++;
			}
		} else {
			for (i = mode_group->num_crtcs; i < mode_group->num_crtcs + mode_group->num_encoders; i++) {
				if (put_user(mode_group->id_list[i],
					     encoder_id + copied)) {
					ret = -EFAULT;
					goto out;
				}
				copied++;
			}

		}
	}
	card_res->count_encoders = encoder_count;

	/* Connectors */
	if (card_res->count_connectors >= connector_count) {
		copied = 0;
		connector_id = (uint32_t __user *)(unsigned long)card_res->connector_id_ptr;
		if (!mode_group) {
			list_for_each_entry(connector,
					    &dev->mode_config.connector_list,
					    head) {
				DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n",
					connector->base.id,
					connector->name);
				if (put_user(connector->base.id,
					     connector_id + copied)) {
					ret = -EFAULT;
					goto out;
				}
				copied++;
			}
		} else {
			int start = mode_group->num_crtcs +
				mode_group->num_encoders;
			for (i = start; i < start + mode_group->num_connectors; i++) {
				if (put_user(mode_group->id_list[i],
					     connector_id + copied)) {
					ret = -EFAULT;
					goto out;
				}
				copied++;
			}
		}
	}
	card_res->count_connectors = connector_count;

	DRM_DEBUG_KMS("CRTC[%d] CONNECTORS[%d] ENCODERS[%d]\n", card_res->count_crtcs,
		  card_res->count_connectors, card_res->count_encoders);

out:
	drm_modeset_unlock_all(dev);
	return ret;
}

/**
 * drm_mode_config_reset - call ->reset callbacks
 * @dev: drm device
 *
 * This functions calls all the crtc's, encoder's and connector's ->reset
 * callback. Drivers can use this in e.g. their driver load or resume code to
 * reset hardware and software state.
 */
void drm_mode_config_reset(struct drm_device *dev)
{
	struct drm_crtc *crtc;
	struct drm_plane *plane;
	struct drm_encoder *encoder;
	struct drm_connector *connector;

	list_for_each_entry(plane, &dev->mode_config.plane_list, head)
		if (plane->funcs->reset)
			plane->funcs->reset(plane);

	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head)
		if (crtc->funcs->reset)
			crtc->funcs->reset(crtc);

	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head)
		if (encoder->funcs->reset)
			encoder->funcs->reset(encoder);

	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
		connector->status = connector_status_unknown;

		if (connector->funcs->reset)
			connector->funcs->reset(connector);
	}
}
EXPORT_SYMBOL(drm_mode_config_reset);

static int drm_mode_create_standard_connector_properties(struct drm_device *dev)
{
	struct drm_property *edid;
	struct drm_property *dpms;
	struct drm_property *dev_path;

	/*
	 * Standard properties (apply to all connectors)
	 */
	edid = drm_property_create(dev, DRM_MODE_PROP_BLOB |
				   DRM_MODE_PROP_IMMUTABLE,
				   "EDID", 0);
	dev->mode_config.edid_property = edid;

	dpms = drm_property_create_enum(dev, 0,
				   "DPMS", drm_dpms_enum_list,
				   ARRAY_SIZE(drm_dpms_enum_list));
	dev->mode_config.dpms_property = dpms;

	dev_path = drm_property_create(dev,
				       DRM_MODE_PROP_BLOB |
				       DRM_MODE_PROP_IMMUTABLE,
				       "PATH", 0);
	dev->mode_config.path_property = dev_path;

	return 0;
}

static int drm_mode_create_standard_plane_properties(struct drm_device *dev)
{
	struct drm_property *type;

	/*
	 * Standard properties (apply to all planes)
	 */
	type = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
					"type", drm_plane_type_enum_list,
					ARRAY_SIZE(drm_plane_type_enum_list));
	dev->mode_config.plane_type_property = type;

	return 0;
}

/**
 * drm_mode_config_init - initialize DRM mode_configuration structure
 * @dev: DRM device
 *
 * Initialize @dev's mode_config structure, used for tracking the graphics
 * configuration of @dev.
 *
 * Since this initializes the modeset locks, no locking is possible. Which is no
 * problem, since this should happen single threaded at init time. It is the
 * driver's problem to ensure this guarantee.
 *
 */
void drm_mode_config_init(struct drm_device *dev)
{
	mutex_init(&dev->mode_config.mutex);
	drm_modeset_lock_init(&dev->mode_config.connection_mutex);
	mutex_init(&dev->mode_config.idr_mutex);
	mutex_init(&dev->mode_config.fb_lock);
	INIT_LIST_HEAD(&dev->mode_config.fb_list);
	INIT_LIST_HEAD(&dev->mode_config.crtc_list);
	INIT_LIST_HEAD(&dev->mode_config.connector_list);
	INIT_LIST_HEAD(&dev->mode_config.bridge_list);
	INIT_LIST_HEAD(&dev->mode_config.encoder_list);
	INIT_LIST_HEAD(&dev->mode_config.property_list);
	INIT_LIST_HEAD(&dev->mode_config.property_blob_list);
	INIT_LIST_HEAD(&dev->mode_config.plane_list);
	idr_init(&dev->mode_config.crtc_idr);

	drm_modeset_lock_all(dev);
	drm_mode_create_standard_connector_properties(dev);
	drm_mode_create_standard_plane_properties(dev);
	drm_modeset_unlock_all(dev);

	/* Just to be sure */
	dev->mode_config.num_fb = 0;
	dev->mode_config.num_connector = 0;
	dev->mode_config.num_crtc = 0;
	dev->mode_config.num_encoder = 0;
	dev->mode_config.num_overlay_plane = 0;
	dev->mode_config.num_total_plane = 0;
}
EXPORT_SYMBOL(drm_mode_config_init);

/**
 * drm_mode_config_cleanup - free up DRM mode_config info
 * @dev: DRM device
 *
 * Free up all the connectors and CRTCs associated with this DRM device, then
 * free up the framebuffers and associated buffer objects.
 *
 * Note that since this /should/ happen single-threaded at driver/device
 * teardown time, no locking is required. It's the driver's job to ensure that
 * this guarantee actually holds true.
 *
 * FIXME: cleanup any dangling user buffer objects too
 */
void drm_mode_config_cleanup(struct drm_device *dev)
{
	struct drm_connector *connector, *ot;
	struct drm_crtc *crtc, *ct;
	struct drm_encoder *encoder, *enct;
	struct drm_bridge *bridge, *brt;
	struct drm_framebuffer *fb, *fbt;
	struct drm_property *property, *pt;
	struct drm_property_blob *blob, *bt;
	struct drm_plane *plane, *plt;

	list_for_each_entry_safe(encoder, enct, &dev->mode_config.encoder_list,
				 head) {
		encoder->funcs->destroy(encoder);
	}

	list_for_each_entry_safe(bridge, brt,
				 &dev->mode_config.bridge_list, head) {
		bridge->funcs->destroy(bridge);
	}

	list_for_each_entry_safe(connector, ot,
				 &dev->mode_config.connector_list, head) {
		connector->funcs->destroy(connector);
	}

	list_for_each_entry_safe(property, pt, &dev->mode_config.property_list,
				 head) {
		drm_property_destroy(dev, property);
	}

	list_for_each_entry_safe(blob, bt, &dev->mode_config.property_blob_list,
				 head) {
		drm_property_destroy_blob(dev, blob);
	}

	/*
	 * Single-threaded teardown context, so it's not required to grab the
	 * fb_lock to protect against concurrent fb_list access. Contrary, it
	 * would actually deadlock with the drm_framebuffer_cleanup function.
	 *
	 * Also, if there are any framebuffers left, that's a driver leak now,
	 * so politely WARN about this.
	 */
	WARN_ON(!list_empty(&dev->mode_config.fb_list));
	list_for_each_entry_safe(fb, fbt, &dev->mode_config.fb_list, head) {
		drm_framebuffer_remove(fb);
	}

	list_for_each_entry_safe(plane, plt, &dev->mode_config.plane_list,
				 head) {
		plane->funcs->destroy(plane);
	}

	list_for_each_entry_safe(crtc, ct, &dev->mode_config.crtc_list, head) {
		crtc->funcs->destroy(crtc);
	}

	idr_destroy(&dev->mode_config.crtc_idr);
	drm_modeset_lock_fini(&dev->mode_config.connection_mutex);
}
EXPORT_SYMBOL(drm_mode_config_cleanup);
