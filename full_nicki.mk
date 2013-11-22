# Screen resolution in Pixels.
TARGET_SCREEN_HEIGHT := 854
TARGET_SCREEN_WIDTH := 480

# Torch
PRODUCT_PACKAGES := \
    Torch

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from (this) nicki device makefile
$(call inherit-product, device/sony/nicki/nicki.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_nicki
PRODUCT_DEVICE := nicki
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony
PRODUCT_MODEL := C1905
