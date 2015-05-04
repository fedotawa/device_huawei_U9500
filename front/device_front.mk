#
# Copyright (C) 2012 The Android Open-Source Project
# Copyright (C) 2012 mdeejay
# Copyright (C) 2013 faust93
# Copyright (C) 2013-2014 ShevT
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product-if-exists, vendor/huawei/front/front-vendor.mk)

COMMON_FOLDER := device/huawei/front

# This file includes all definitions that apply to ALL front devices, and
# are also specific to front devices
#
# Everything in this directory will become public

DEVICE_PACKAGE_OVERLAYS := $(COMMON_FOLDER)/overlay

# Audio Packages
PRODUCT_PACKAGES += \
    libtinyalsa \
    tinycap \
    tinymix \
    tinyplay \
    libaudioutils \
    audio.r_submix.default \
    audio.a2dp.default \
    audio.usb.default

# bcmdhd
PRODUCT_PACKAGES += \
    libnetcmdiface

# PowerHAL
PRODUCT_PACKAGES += \
    hwcomposer.front \
    gralloc.omap4.so \
    libedid \
    libstagefrighthw

# OMAP4
PRODUCT_PACKAGES += \
    libion_ti \
    smc_pa_ctrl \
    tf_daemon \
    libtf_crypto_sst

# Symlinks
PRODUCT_PACKAGES += \
    libion.so

# Ramdisk
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/ramdisk/init.front.rc:root/init.front.rc \
    $(COMMON_FOLDER)/ramdisk/init.front.usb.rc:root/init.front.usb.rc \
    $(COMMON_FOLDER)/ramdisk/ueventd.front.rc:root/ueventd.front.rc \
    $(COMMON_FOLDER)/ramdisk/fstab.front:root/fstab.front

# Utilities
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/prebuilt/xbin/remount:system/xbin/remount \
    $(COMMON_FOLDER)/prebuilt/etc/utils/optimizedb:system/etc/utils/optimizedb \
    $(COMMON_FOLDER)/prebuilt/etc/utils/optimizestorage:system/etc/utils/optimizestorage \
    $(COMMON_FOLDER)/prebuilt/etc/init.d/11frandom:system/etc/init.d/11frandom

# Media / Audio
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(COMMON_FOLDER)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(COMMON_FOLDER)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(COMMON_FOLDER)/configs/audio/cm_front_audio_config.conf:system/etc/huawei/audio/cm_front_audio_config.conf \
    $(COMMON_FOLDER)/configs/audio/cm_front_audio_config.conf:system/etc/huawei/audio/pac_front_audio_config.conf \
    $(COMMON_FOLDER)/configs/audio/front_audio_config.conf:system/etc/huawei/audio/front_audio_config.conf \
    $(COMMON_FOLDER)/configs/audio/front_factory_audio_config.conf:system/etc/huawei/audio/front_factory_audio_config.conf

# GPS
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/configs/gps.conf:system/etc/gps.conf \
    $(COMMON_FOLDER)/configs/gpsconfig.xml:system/etc/gpsconfig.xml

# Wifi
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(COMMON_FOLDER)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(COMMON_FOLDER)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# Torch
PRODUCT_PACKAGES += \
    Torch

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Common
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs \
    e2fsck \
    l2ping \
    com.android.future.usb.accessory

# f2fs utilities
PRODUCT_PACKAGES += \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs

# Fix timezone 2014i
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/prebuilt/icudt51l.dat:system/usr/icu/icudt51l.dat \
    $(COMMON_FOLDER)/prebuilt/tzdata:/system/usr/share/zoneinfo/tzdata

# Key maps
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/configs/usr/omap4-keypad.kl:system/usr/keylayout/omap4-keypad.kl \
    $(COMMON_FOLDER)/configs/usr/omap4-keypad.kcm:system/usr/keychars/omap4-keypad.kcm \
    $(COMMON_FOLDER)/configs/usr/twl6030_pwrbutton.kl:system/usr/keylayout/twl6030_pwrbutton.kl

# Input device calibration files
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/configs/usr/syn_tm12xx_ts_1.idc:system/usr/idc/syn_tm12xx_ts_1.idc \
    $(COMMON_FOLDER)/configs/usr/syn_tm12xx_ts_2.idc:system/usr/idc/syn_tm12xx_ts_2.idc

# Replace Bootanimation
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml)

#Lib Skia test
PRODUCT_PACKAGES += \
    SkLibTiJpeg_Test

PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    persist.sys.root_access=3 \
    persist.adb.notify=0 \
    persist.call_recording.enabled=1

# adb has root
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1 \
    persist.sys.usb.config=mtp

# dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    dalvik.vm.verify-bytecode=false

# Memory management
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ksm.default=1

# Here crashes gallery
# if ro.build.display.id is such "cm_front-userdebug 4.2.2 JDQ39E eng.shev.20130805.153138 test-keys" then gellry crashshshsh
# as well - does not crash
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=KTU84Q-ShevT

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_CHARACTERISTICS      := default
PRODUCT_AAPT_CONFIG          := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG     := xhdpi
BOARD_WLAN_DEVICE_REV        := bcm4330_b1
WIFI_BAND                    := 802_11_ABG

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
