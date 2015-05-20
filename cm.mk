# Inherit some common CM stuff.
$(call inherit-product, device/huawei/front/device.mk)
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := front
PRODUCT_NAME := cm_front
PRODUCT_RELEASE_NAME := U9500
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := U9500
PRODUCT_MANUFACTURER := Huawei

ifneq ($(CM_BUILDTYPE),UNOFFICIAL)
    CM_BUILDTYPE := ShevT
    CM_VERSION := $(PRODUCT_VERSION_MAJOR)-$(shell date -u +%Y%m%d)-$(CM_BUILDTYPE)-$(CM_BUILD)$(CM_EXTRAVERSION)
endif
