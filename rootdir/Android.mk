LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

include $(LOCAL_PATH)/../hybris_boot.mk

# files that live under /...

file := $(TARGET_HYBRIS_BOOT_OUT)/init.rc
$(file) : $(LOCAL_PATH)/init.rc | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
$(INSTALLED_RAMDISK_TARGET): $(file)

file := $(TARGET_HYBRIS_BOOT_OUT)/ueventd.rc
$(file) : $(LOCAL_PATH)/ueventd.rc | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
$(INSTALLED_RAMDISK_TARGET): $(file)

#

$(shell cp -rf $(LOCAL_PATH)/init.usb.rc $(TARGET_HYBRIS_BOOT_OUT))

file := $(TARGET_HYBRIS_BOOT_OUT)/ueventd.goldfish.rc
$(file) : $(LOCAL_PATH)/ueventd.goldfish.rc | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)
$(INSTALLED_RAMDISK_TARGET): $(file)

# create some directories (some are mount points)
DIRS := $(addprefix $(TARGET_HYBRIS_BOOT_OUT)/, \
		sbin \
		dev \
		proc \
		sys \
	) \
	$(TARGET_OUT_DATA)

$(DIRS):
	@echo Directory: $@
	@mkdir -p $@

ALL_PREBUILT += $(DIRS)
