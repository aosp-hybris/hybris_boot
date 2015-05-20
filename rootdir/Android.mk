LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

include $(LOCAL_PATH)/../hybris_boot.mk

# files that live under /...
$(shell cp -rf $(LOCAL_PATH)/init.rc $(TARGET_HYBRIS_BOOT_OUT))
$(shell cp -rf $(LOCAL_PATH)/init.usb.rc $(TARGET_HYBRIS_BOOT_OUT))
$(shell cp -rf $(LOCAL_PATH)/ueventd.rc $(TARGET_HYBRIS_BOOT_OUT))
$(shell cp -rf $(LOCAL_PATH)/ueventd.goldfish.rc $(TARGET_HYBRIS_BOOT_OUT))

# create some directories (some are mount points)
$(shell mkdir -p $(TARGET_HYBRIS_BOOT_OUT)/sbin)
$(shell mkdir -p $(TARGET_HYBRIS_BOOT_OUT)/dev)
$(shell mkdir -p $(TARGET_HYBRIS_BOOT_OUT)/proc)
$(shell mkdir -p $(TARGET_HYBRIS_BOOT_OUT)/sys)