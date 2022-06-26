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

#ifndef __DRM_MODE_CONFIG_H__
#define __DRM_MODE_CONFIG_H__

#include <linux/mutex.h>
#include <linux/types.h>
#include <linux/idr.h>
#include <linux/workqueue.h>

#include <drm/drm_modeset_lock.h>

struct drm_file;
struct drm_device;
struct drm_atomic_state;
struct drm_mode_fb_cmd2;

/**
 * struct drm_mode_config_funcs - basic driver provided mode setting functions
 * @fb_create: create a new framebuffer object
 * @output_poll_changed: function to handle output configuration changes
 *
 * Some global (i.e. not per-CRTC, connector, etc) mode setting functions that
 * involve drivers.
 */
struct drm_mode_config_funcs {
	struct drm_framebuffer *(*fb_create)(struct drm_device *dev,
					     struct drm_file *file_priv,
					     struct drm_mode_fb_cmd2 *mode_cmd);
	void (*output_poll_changed)(struct drm_device *dev);
};

/**
 * drm_mode_config - Mode configuration control structure
 * @mutex: mutex protecting KMS related lists and structures
 * @idr_mutex: mutex for KMS ID allocation and management
 * @crtc_idr: main KMS ID tracking object
 * @num_fb: number of fbs available
 * @fb_list: list of framebuffers available
 * @num_connector: number of connectors on this device
 * @connector_list: list of connector objects
 * @num_bridge: number of bridges on this device
 * @bridge_list: list of bridge objects
 * @num_encoder: number of encoders on this device
 * @encoder_list: list of encoder objects
 * @num_crtc: number of CRTCs on this device
 * @crtc_list: list of CRTC objects
 * @min_width: minimum pixel width on this device
 * @min_height: minimum pixel height on this device
 * @max_width: maximum pixel width on this device
 * @max_height: maximum pixel height on this device
 * @funcs: core driver provided mode setting functions
 * @fb_base: base address of the framebuffer
 * @poll_enabled: track polling status for this device
 * @output_poll_work: delayed work for polling in process context
 * @*_property: core property tracking
 *
 * Core mode resource tracking structure.  All CRTC, encoders, and connectors
 * enumerated by the driver are added here, as are global properties.  Some
 * global restrictions are also here, e.g. dimension restrictions.
 */
struct drm_mode_config {
	struct mutex mutex; /* protects configuration (mode lists etc.) */
	struct drm_modeset_lock connection_mutex; /* protects connector->encoder and encoder->crtc links */
	struct drm_modeset_acquire_ctx *acquire_ctx; /* for legacy _lock_all() / _unlock_all() */
	struct mutex idr_mutex; /* for IDR management */
	struct idr crtc_idr; /* use this idr for all IDs, fb, crtc, connector, modes - just makes life easier */
	/* this is limited to one for now */


	/**
	 * fb_lock - mutex to protect fb state
	 *
	 * Besides the global fb list his also protects the fbs list in the
	 * file_priv
	 */
	struct mutex fb_lock;
	int num_fb;
	struct list_head fb_list;

	int num_connector;
	struct list_head connector_list;
	int num_bridge;
	struct list_head bridge_list;
	int num_encoder;
	struct list_head encoder_list;

	/*
	 * Track # of overlay planes separately from # of total planes.  By
	 * default we only advertise overlay planes to userspace; if userspace
	 * sets the "universal plane" capability bit, we'll go ahead and
	 * expose all planes.
	 */
	int num_overlay_plane;
	int num_total_plane;
	struct list_head plane_list;

	int num_crtc;
	struct list_head crtc_list;

	struct list_head property_list;

	int min_width, min_height;
	int max_width, max_height;
	const struct drm_mode_config_funcs *funcs;
	resource_size_t fb_base;

	/* output poll support */
	bool poll_enabled;
	bool poll_running;
	struct delayed_work output_poll_work;

	/* pointers to standard properties */
	struct list_head property_blob_list;
	struct drm_property *edid_property;
	struct drm_property *dpms_property;
	struct drm_property *path_property;
	struct drm_property *plane_type_property;
	struct drm_property *rotation_property;

	/* DVI-I properties */
	struct drm_property *dvi_i_subconnector_property;
	struct drm_property *dvi_i_select_subconnector_property;

	/* TV properties */
	struct drm_property *tv_subconnector_property;
	struct drm_property *tv_select_subconnector_property;
	struct drm_property *tv_mode_property;
	struct drm_property *tv_left_margin_property;
	struct drm_property *tv_right_margin_property;
	struct drm_property *tv_top_margin_property;
	struct drm_property *tv_bottom_margin_property;
	struct drm_property *tv_brightness_property;
	struct drm_property *tv_contrast_property;
	struct drm_property *tv_flicker_reduction_property;
	struct drm_property *tv_overscan_property;
	struct drm_property *tv_saturation_property;
	struct drm_property *tv_hue_property;

	/* Optional properties */
	struct drm_property *scaling_mode_property;
	struct drm_property *aspect_ratio_property;
	struct drm_property *dirty_info_property;

	/* dumb ioctl parameters */
	uint32_t preferred_depth, prefer_shadow;

	/* whether async page flip is supported or not */
	bool async_page_flip;

	/* cursor size */
	uint32_t cursor_width, cursor_height;
};

extern void drm_mode_config_init(struct drm_device *dev);
extern void drm_mode_config_reset(struct drm_device *dev);
extern void drm_mode_config_cleanup(struct drm_device *dev);

#endif