/*
 * Copyright © 2006 Keith Packard
 * Copyright © 2007-2008 Dave Airlie
 * Copyright © 2007-2008 Intel Corporation
 *   Jesse Barnes <jesse.barnes@intel.com>
 * Copyright © 2014 Intel Corporation
 *   Daniel Vetter <daniel.vetter@ffwll.ch>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

/*
 * This header file contains mode setting related functions and definitions
 * which are only used within the drm module as internal implementation details
 * and are not exported to drivers.
 */

/* Avoid boilerplate.  I'm tired of typing. */
#define DRM_ENUM_NAME_FN(fnname, list)				\
	const char *fnname(int val)				\
	{							\
		int i;						\
		for (i = 0; i < ARRAY_SIZE(list); i++) {	\
			if (list[i].type == val)		\
				return list[i].name;		\
		}						\
		return "(unknown)";				\
	}

int drm_mode_object_get(struct drm_device *dev,
			struct drm_mode_object *obj, uint32_t obj_type);
void drm_mode_object_put(struct drm_device *dev,
			 struct drm_mode_object *object);
			 
void drm_property_destroy_blob(struct drm_device *dev,
			       struct drm_property_blob *blob);

int drm_plane_register_all(struct drm_device *dev);
void drm_plane_unregister_all(struct drm_device *dev);
int drm_crtc_register_all(struct drm_device *dev);
void drm_crtc_unregister_all(struct drm_device *dev);
void drm_connector_unregister_all(struct drm_device *dev);
int drm_connector_register_all(struct drm_device *dev);
int drm_encoder_register_all(struct drm_device *dev);
void drm_encoder_unregister_all(struct drm_device *dev);
int drm_modeset_register_all(struct drm_device *dev);
void drm_modeset_unregister_all(struct drm_device *dev);

/* IOCTLs */
int drm_mode_getresources(struct drm_device *dev,
			  void *data, struct drm_file *file_priv);
