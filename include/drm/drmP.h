/*
 * Internal Header for the Direct Rendering Manager
 *
 * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
 * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
 * Copyright (c) 2009-2010, Code Aurora Forum.
 * All rights reserved.
 *
 * Author: Rickard E. (Rik) Faith <faith@valinux.com>
 * Author: Gareth Hughes <gareth@valinux.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice (including the next
 * paragraph) shall be included in all copies or substantial portions of the
 * Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

#ifndef _DRM_P_H_
#define _DRM_P_H_

#include <linux/agp_backend.h>
#include <linux/cdev.h>
#include <linux/dma-mapping.h>
#include <linux/file.h>
#include <linux/fs.h>
#include <linux/highmem.h>
#include <linux/idr.h>
#include <linux/init.h>
#include <linux/io.h>
#include <linux/jiffies.h>
#include <linux/kernel.h>
#include <linux/kref.h>
#include <linux/miscdevice.h>
#include <linux/mm.h>
#include <linux/mutex.h>
#include <linux/pci.h>
#include <linux/platform_device.h>
#include <linux/poll.h>
#include <linux/ratelimit.h>
#include <linux/sched.h>
#include <linux/slab.h>
#include <linux/types.h>
#include <linux/vmalloc.h>
#include <linux/workqueue.h>

#include <asm/mman.h>
#include <asm/pgalloc.h>
#include <asm/uaccess.h>

#include <uapi/drm/drm.h>
#include <uapi/drm/drm_mode.h>

#include <drm/drm_ioctl.h>
#include <drm/drm_agpsupport.h>
#include <drm/drm_crtc.h>
#include <drm/drm_global.h>
#include <drm/drm_hashtab.h>
#include <drm/drm_mem_util.h>
#include <drm/drm_mm.h>
#include <drm/drm_os_linux.h>
#include <drm/drm_sarea.h>
#include <drm/drm_drv.h>
#include <drm/drm_prime.h>
#include <drm/drm_device.h>

struct module;

struct device_node;
struct videomode;
struct reservation_object;
struct dma_buf_attachment;

/*
 * 4 debug categories are defined:
 *
 * CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c, drm_memory.c, ...
 *	 This is the category used by the DRM_DEBUG() macro.
 *
 * DRIVER: Used in the vendor specific part of the driver: i915, radeon, ...
 *	   This is the category used by the DRM_DEBUG_DRIVER() macro.
 *
 * KMS: used in the modesetting code.
 *	This is the category used by the DRM_DEBUG_KMS() macro.
 *
 * PRIME: used in the prime code.
 *	  This is the category used by the DRM_DEBUG_PRIME() macro.
 *
 * Enabling verbose debug messages is done through the drm.debug parameter,
 * each category being enabled by a bit.
 *
 * drm.debug=0x1 will enable CORE messages
 * drm.debug=0x2 will enable DRIVER messages
 * drm.debug=0x3 will enable CORE and DRIVER messages
 * ...
 * drm.debug=0xf will enable all messages
 *
 * An interesting feature is that it's possible to enable verbose logging at
 * run-time by echoing the debug value in its sysfs node:
 *   # echo 0xf > /sys/module/drm/parameters/debug
 */
#define DRM_UT_CORE 		0x01
#define DRM_UT_DRIVER		0x02
#define DRM_UT_KMS		0x04
#define DRM_UT_PRIME		0x08

/***********************************************************************/
/** \name DRM template customization defaults */
/*@{*/

/***********************************************************************/
/** \name Macros to make printk easier */
/*@{*/

/**
 * Error output.
 *
 * \param fmt printf() like format string.
 * \param arg arguments
 */
#define DRM_ERROR(fmt, ...)				\
	drm_err(__func__, fmt, ##__VA_ARGS__)

/**
 * Rate limited error output.  Like DRM_ERROR() but won't flood the log.
 *
 * \param fmt printf() like format string.
 * \param arg arguments
 */
#define DRM_ERROR_RATELIMITED(fmt, ...)				\
({									\
	static DEFINE_RATELIMIT_STATE(_rs,				\
				      DEFAULT_RATELIMIT_INTERVAL,	\
				      DEFAULT_RATELIMIT_BURST);		\
									\
	if (__ratelimit(&_rs))						\
		drm_err(__func__, fmt, ##__VA_ARGS__);			\
})

#define DRM_INFO(fmt, ...)				\
	printk(KERN_INFO "[" DRM_NAME "] " fmt, ##__VA_ARGS__)

#define DRM_INFO_ONCE(fmt, ...)				\
	printk_once(KERN_INFO "[" DRM_NAME "] " fmt, ##__VA_ARGS__)

/**
 * Debug output.
 *
 * \param fmt printf() like format string.
 * \param arg arguments
 */
#define DRM_DEBUG(fmt, args...)						\
	do {								\
		if (unlikely(drm_debug & DRM_UT_CORE))			\
			drm_ut_debug_printk(__func__, fmt, ##args);	\
	} while (0)

#define DRM_DEBUG_DRIVER(fmt, args...)					\
	do {								\
		if (unlikely(drm_debug & DRM_UT_DRIVER))		\
			drm_ut_debug_printk(__func__, fmt, ##args);	\
	} while (0)
#define DRM_DEBUG_KMS(fmt, args...)					\
	do {								\
		if (unlikely(drm_debug & DRM_UT_KMS))			\
			drm_ut_debug_printk(__func__, fmt, ##args);	\
	} while (0)
#define DRM_DEBUG_PRIME(fmt, args...)					\
	do {								\
		if (unlikely(drm_debug & DRM_UT_PRIME))			\
			drm_ut_debug_printk(__func__, fmt, ##args);	\
	} while (0)

/*@}*/

/***********************************************************************/
/** \name Internal types and structures */
/*@{*/

#define DRM_IF_VERSION(maj, min) (maj << 16 | min)

/* Event queued up for userspace to read */
struct drm_pending_event {
	struct drm_event *event;
	struct list_head link;
	struct drm_file *file_priv;
	pid_t pid; /* pid of requester, no guarantee it's valid by the time
		      we deliver the event, for tracing only */
	void (*destroy)(struct drm_pending_event *event);
};

/** File private data */
struct drm_file {
	unsigned authenticated :1;
	/* Whether we're master for a minor. Protected by master_mutex */
	unsigned is_master :1;
	/* true when the client has asked us to expose stereo 3D mode flags */
	unsigned stereo_allowed :1;
	/*
	 * true if client understands CRTC primary planes and cursor planes
	 * in the plane list
	 */
	unsigned universal_planes:1;

	struct pid *pid;
	kuid_t uid;
	drm_magic_t magic;
	struct list_head lhead;
	struct drm_minor *minor;
	unsigned long lock_count;

	/** Mapping of mm object handles to object pointers. */
	struct idr object_idr;
	/** Lock for synchronization of access to object_idr. */
	spinlock_t table_lock;

	struct file *filp;
	void *driver_priv;

	struct drm_master *master; /* master this node is currently associated with
				      N.B. not always minor->master */
	/**
	 * fbs - List of framebuffers associated with this file.
	 *
	 * Protected by fbs_lock. Note that the fbs list holds a reference on
	 * the fb object to prevent it from untimely disappearing.
	 */
	struct list_head fbs;
	struct mutex fbs_lock;

	wait_queue_head_t event_wait;
	struct list_head event_list;
	int event_space;

	struct drm_prime_file_private prime;
};

/**
 * Lock data.
 */
struct drm_lock_data {
	struct drm_hw_lock *hw_lock;	/**< Hardware lock */
	/** Private of lock holder's file (NULL=kernel) */
	struct drm_file *file_priv;
	wait_queue_head_t lock_queue;	/**< Queue of blocked processes */
	unsigned long lock_time;	/**< Time of last lock in jiffies */
	spinlock_t spinlock;
	uint32_t kernel_waiters;
	uint32_t user_waiters;
	int idle_has_lock;
};

/**
 * struct drm_master - drm master structure
 *
 * @refcount: Refcount for this master object.
 * @minor: Link back to minor char device we are master for. Immutable.
 * @unique: Unique identifier: e.g. busid. Protected by drm_global_mutex.
 * @unique_len: Length of unique field. Protected by drm_global_mutex.
 * @magiclist: Hash of used authentication tokens. Protected by struct_mutex.
 * @magicfree: List of used authentication tokens. Protected by struct_mutex.
 * @lock: DRI lock information.
 * @driver_priv: Pointer to driver-private information.
 */
struct drm_master {
	struct kref refcount;
	struct drm_minor *minor;
	char *unique;
	int unique_len;
	struct drm_open_hash magiclist;
	struct list_head magicfree;
	struct drm_lock_data lock;
	void *driver_priv;
};

/* Size of ringbuffer for vblank timestamps. Just double-buffer
 * in initial implementation.
 */
#define DRM_VBLANKTIME_RBSIZE 2

/* Flags and return codes for get_vblank_timestamp() driver function. */
#define DRM_CALLED_FROM_VBLIRQ 1
#define DRM_VBLANKTIME_SCANOUTPOS_METHOD (1 << 0)
#define DRM_VBLANKTIME_IN_VBLANK         (1 << 1)

/* get_scanout_position() return flags */
#define DRM_SCANOUTPOS_VALID        (1 << 0)
#define DRM_SCANOUTPOS_IN_VBLANK    (1 << 1)
#define DRM_SCANOUTPOS_ACCURATE     (1 << 2)

enum drm_minor_type {
	DRM_MINOR_LEGACY,
	DRM_MINOR_CONTROL,
	DRM_MINOR_RENDER,
	DRM_MINOR_CNT,
};

/**
 * Info file list entry. This structure represents a debugfs or proc file to
 * be created by the drm core
 */
struct drm_info_list {
	const char *name; /** file name */
	int (*show)(struct seq_file*, void*); /** show callback */
	u32 driver_features; /**< Required driver features for this entry */
	void *data;
};

/**
 * debugfs node structure. This structure represents a debugfs file.
 */
struct drm_info_node {
	struct list_head list;
	struct drm_minor *minor;
	const struct drm_info_list *info_ent;
	struct dentry *dent;
};

/**
 * DRM minor structure. This structure represents a drm minor number.
 */
struct drm_minor {
	int index;			/**< Minor device number */
	int type;                       /**< Control or render */
	struct device *kdev;		/**< Linux device */
	struct drm_device *dev;

	struct dentry *debugfs_root;

	struct list_head debugfs_list;
	struct mutex debugfs_lock; /* Protects debugfs_list. */

	/* currently active master for this node. Protected by master_mutex */
	struct drm_master *master;
	struct drm_mode_group mode_group;
};


struct drm_pending_vblank_event {
	struct drm_pending_event base;
	int pipe;
	struct drm_event_vblank event;
};

struct drm_vblank_crtc {
	struct drm_device *dev;		/* pointer to the drm_device */
	wait_queue_head_t queue;	/**< VBLANK wait queue */
	struct timeval time[DRM_VBLANKTIME_RBSIZE];	/**< timestamp of current count */
	struct timer_list disable_timer;		/* delayed disable timer */
	atomic_t count;			/**< number of VBLANK interrupts */
	atomic_t refcount;		/* number of users of vblank interruptsper crtc */
	u32 last;			/* protected by dev->vbl_lock, used */
					/* for wraparound handling */
	u32 last_wait;			/* Last vblank seqno waited per CRTC */
	unsigned int inmodeset;		/* Display driver is setting mode */
	int crtc;			/* crtc index */
	bool enabled;			/* so we don't call enable more than
					   once per disable */
};

#define DRM_SWITCH_POWER_ON 0
#define DRM_SWITCH_POWER_OFF 1
#define DRM_SWITCH_POWER_CHANGING 2
#define DRM_SWITCH_POWER_DYNAMIC_OFF 3

static __inline__ int drm_core_check_feature(struct drm_device *dev,
					     int feature)
{
	return ((dev->driver->driver_features & feature) ? 1 : 0);
}

static inline void drm_device_set_unplugged(struct drm_device *dev)
{
	smp_wmb();
	atomic_set(&dev->unplugged, 1);
}

static inline int drm_device_is_unplugged(struct drm_device *dev)
{
	int ret = atomic_read(&dev->unplugged);
	smp_rmb();
	return ret;
}

static inline bool drm_is_render_client(const struct drm_file *file_priv)
{
	return file_priv->minor->type == DRM_MINOR_RENDER;
}

static inline bool drm_is_control_client(const struct drm_file *file_priv)
{
	return file_priv->minor->type == DRM_MINOR_CONTROL;
}

static inline bool drm_is_primary_client(const struct drm_file *file_priv)
{
	return file_priv->minor->type == DRM_MINOR_LEGACY;
}

/******************************************************************/
/** \name Internal function definitions */
/*@{*/

				/* Device support (drm_fops.h) */
extern int drm_open(struct inode *inode, struct file *filp);
extern ssize_t drm_read(struct file *filp, char __user *buffer,
			size_t count, loff_t *offset);
extern int drm_release(struct inode *inode, struct file *filp);

				/* Mapping support (drm_vm.h) */
extern unsigned int drm_poll(struct file *filp, struct poll_table_struct *wait);

/* Cache management (drm_cache.c) */
void drm_clflush_pages(struct page *pages[], unsigned long num_pages);
void drm_clflush_sg(struct sg_table *st);
void drm_clflush_virt_range(void *addr, unsigned long length);

/*
 * These are exported to drivers so that they can implement fencing using
 * DMA quiscent + idle. DMA quiescent usually requires the hardware lock.
 */

				/* IRQ support (drm_irq.h) */
extern int drm_irq_install(struct drm_device *dev, int irq);
extern int drm_irq_uninstall(struct drm_device *dev);

extern int drm_vblank_init(struct drm_device *dev, int num_crtcs);
extern int drm_wait_vblank(struct drm_device *dev, void *data,
			   struct drm_file *filp);
extern u32 drm_vblank_count(struct drm_device *dev, int crtc);
extern u32 drm_vblank_count_and_time(struct drm_device *dev, int crtc,
				     struct timeval *vblanktime);
extern void drm_send_vblank_event(struct drm_device *dev, int crtc,
				     struct drm_pending_vblank_event *e);
extern bool drm_handle_vblank(struct drm_device *dev, int crtc);
extern int drm_vblank_get(struct drm_device *dev, int crtc);
extern void drm_vblank_put(struct drm_device *dev, int crtc);
extern int drm_crtc_vblank_get(struct drm_crtc *crtc);
extern void drm_crtc_vblank_put(struct drm_crtc *crtc);
extern void drm_wait_one_vblank(struct drm_device *dev, int crtc);
extern void drm_crtc_wait_one_vblank(struct drm_crtc *crtc);
extern void drm_vblank_off(struct drm_device *dev, int crtc);
extern void drm_vblank_on(struct drm_device *dev, int crtc);
extern void drm_crtc_vblank_off(struct drm_crtc *crtc);
extern void drm_crtc_vblank_on(struct drm_crtc *crtc);
extern void drm_vblank_cleanup(struct drm_device *dev);

extern int drm_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
						 int crtc, int *max_error,
						 struct timeval *vblank_time,
						 unsigned flags,
						 const struct drm_crtc *refcrtc,
						 const struct drm_display_mode *mode);
extern void drm_calc_timestamping_constants(struct drm_crtc *crtc,
					    const struct drm_display_mode *mode);

/**
 * drm_crtc_vblank_waitqueue - get vblank waitqueue for the CRTC
 * @crtc: which CRTC's vblank waitqueue to retrieve
 *
 * This function returns a pointer to the vblank waitqueue for the CRTC.
 * Drivers can use this to implement vblank waits using wait_event() & co.
 */
static inline wait_queue_head_t *drm_crtc_vblank_waitqueue(struct drm_crtc *crtc)
{
	return &crtc->dev->vblank[drm_crtc_index(crtc)].queue;
}

/* Modesetting support */
extern void drm_vblank_pre_modeset(struct drm_device *dev, int crtc);
extern void drm_vblank_post_modeset(struct drm_device *dev, int crtc);

				/* Stub support (drm_stub.h) */
extern struct drm_master *drm_master_get(struct drm_master *master);
extern void drm_master_put(struct drm_master **master);

				/* Debugfs support */
#if defined(CONFIG_DEBUG_FS)
extern int drm_debugfs_create_files(const struct drm_info_list *files,
				    int count, struct dentry *root,
				    struct drm_minor *minor);
extern int drm_debugfs_remove_files(const struct drm_info_list *files,
				    int count, struct drm_minor *minor);
#else
static inline int drm_debugfs_create_files(const struct drm_info_list *files,
					   int count, struct dentry *root,
					   struct drm_minor *minor)
{
	return 0;
}

static inline int drm_debugfs_remove_files(const struct drm_info_list *files,
					   int count, struct drm_minor *minor)
{
	return 0;
}
#endif

extern struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev, size_t size,
					    size_t align);
extern void drm_pci_free(struct drm_device *dev, struct drm_dma_handle * dmah);

			       /* sysfs support (drm_sysfs.c) */
extern void drm_sysfs_hotplug_event(struct drm_device *dev);

/*@}*/

/* PCI section */
static __inline__ int drm_pci_device_is_agp(struct drm_device *dev)
{
	if (dev->driver->device_is_agp != NULL) {
		int err = (*dev->driver->device_is_agp) (dev);

		if (err != 2) {
			return err;
		}
	}

	return pci_find_capability(dev->pdev, PCI_CAP_ID_AGP);
}
void drm_pci_agp_destroy(struct drm_device *dev);

extern int drm_pci_init(struct drm_driver *driver, struct pci_driver *pdriver);
extern void drm_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver);
extern int drm_get_pci_dev(struct pci_dev *pdev,
			   const struct pci_device_id *ent,
			   struct drm_driver *driver);
extern int drm_pci_set_busid(struct drm_device *dev, struct drm_master *master);

#define DRM_PCIE_SPEED_25 1
#define DRM_PCIE_SPEED_50 2
#define DRM_PCIE_SPEED_80 4

extern int drm_pcie_get_speed_cap_mask(struct drm_device *dev, u32 *speed_mask);

/* platform section */
extern int drm_platform_init(struct drm_driver *driver, struct platform_device *platform_device);
extern int drm_platform_set_busid(struct drm_device *d, struct drm_master *m);

/* returns true if currently okay to sleep */
static __inline__ bool drm_can_sleep(void)
{
	if (in_atomic() || in_dbg_master() || irqs_disabled())
		return false;
	return true;
}

#endif
