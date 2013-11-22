$(call inherit-product, device/sony/nicki/full_nicki.mk)

# Inherit CM common GSM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit CM common Phone stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Build fingerprints
PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=C1905_1274-5551 \
	BUILD_FINGERPRINT=Sony/C1905_1274-5551/C1905:4.1.2/15.1.C.2.8/7bd96g:user/release-keys \
	PRIVATE_BUILD_DESC="C1905-user 4.1.2 2.11.J.2.18 7bd96g test-keys"

PRODUCT_DEVICE := nicki
PRODUCT_NAME := cm_nicki
