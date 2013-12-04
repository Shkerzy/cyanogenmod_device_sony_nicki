LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),nicki)
    include $(call first-makefiles-under,$(LOCAL_PATH))

    $(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wcd9310; \
        ln -sf /data/misc/audio/wcd9310_anc.bin \
        $(TARGET_OUT_ETC)/firmware/wcd9310/wcd9310_anc.bin; \
        ln -sf /data/misc/audio/mbhc.bin \
        $(TARGET_OUT_ETC)/firmware/wcd9310/wcd9310_mbhc.bin)

# workaround for our screen resolution
    $(shell cp $(LOCAL_PATH)/rootdir/logo.rle $(LOCAL_PATH)/../common/bootlogo/480x854.rle)
endif

