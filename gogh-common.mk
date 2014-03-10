#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/gogh-common/gogh-common-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/gogh-common/overlay

# Device uses high-density artwork where available
PRODUCT_LOCALES := en_US
PRODUCT_LOCALES += hdpi
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Audio configuration
PRODUCT_COPY_FILES += \
	device/samsung/gogh-common/audio/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x \
	device/samsung/gogh-common/audio/audio_policy.conf:system/etc/audio_policy.conf

# init
PRODUCT_COPY_FILES += \
    device/samsung/gogh-common/init/init.ath3k.bt.sh:system/etc/init.ath3k.bt.sh \
    device/samsung/gogh-common/init/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/samsung/gogh-common/init/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    device/samsung/gogh-common/init/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh \
    device/samsung/gogh-common/init/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    device/samsung/gogh-common/init/init.qcom.mdm_links.sh:system/etc/init.qcom.mdm_links.sh \
    device/samsung/gogh-common/init/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh \
    device/samsung/gogh-common/init/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    device/samsung/gogh-common/init/init.qcom.post_fs.sh:system/etc/init.qcom.post_fs.sh \
    device/samsung/gogh-common/init/init.qcom.thermald_conf.sh:system/etc/init.qcom.thermald_conf.sh \
    device/samsung/gogh-common/init/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh  

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.class_core.sh \
    init.qcom.class_main.sh \
    init.qcom.early_boot.sh \
    init.qcom.lpm_boot.sh \
    init.qcom.sh \
    init.qcom.syspart_fixup.sh \
    initlogo.rle \
    init.bt.rc \
    init.carrier.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.target.rc \
    lpm.rc \
    ueventd.qcom.rc

# GPS / quipc Configs
PRODUCT_COPY_FILES += \
    device/samsung/gogh-common/configs/gps.conf:system/etc/gps.conf \
    device/samsung/gogh-common/configs/quipc.conf:system/etc/quipc.conf  

# EGL config
PRODUCT_COPY_FILES += \
    device/samsung/gogh-common/configs/egl.cfg:system/lib/egl/egl.cfg

# Media config
PRODUCT_COPY_FILES += \
    device/samsung/gogh-common/configs/media_profiles.xml:system/etc/media_profiles.xml \
	device/samsung/gogh-common/configs/media_codecs.xml:system/etc/media_codecs.xml

# QCOM Display
PRODUCT_PACKAGES += \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    libtilerenderer \
    libI420colorconvert

# Omx
PRODUCT_PACKAGES += \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libOmxCore \
    libstagefrighthw \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc

# Audio
PRODUCT_PACKAGES += \
    alsa.msm8960 \
    audio.a2dp.default \
    audio_policy.msm8960 \
    audio.primary.msm8960 \
    libalsa-intf \
    libaudioutils

# HAL
PRODUCT_PACKAGES += \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    power.msm8960

# Bluetooth
#PRODUCT_PACKAGES += \
        hci_qcomm_init

# GPS
#PRODUCT_PACKAGES += \
	gps.msm8960

# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# for bugmailer
PRODUCT_PACKAGES += send_bug
PRODUCT_COPY_FILES += \
    system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
    system/extras/bugmailer/send_bug:system/bin/send_bug

# Init scripts
#PRODUCT_PACKAGES += \
    init.qcom.post_boot.sh \
    init.qcom.efs.sync.sh \
    init.qcom.sh \
    init.qcom.class_core.sh \
    init.qcom.class_main.sh \
    init.qcom.syspart_fixup.sh \
    init.qcom.early_boot.sh \
    init.qcom.mdm_links.sh \
    init.qcom.modem_links.sh \
    init.qcom.usb.sh \
    lpm.rc \
    init.qcom.lpm_boot.sh

# Charger
PRODUCT_PACKAGES += charger charger_res_images

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/samsung/gogh-common/configs/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/samsung/gogh-common/configs/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Torch
PRODUCT_PACKAGES += Torch

# Vold configuration
PRODUCT_COPY_FILES += \
    device/samsung/gogh-common/vold.fstab:system/etc/vold.fstab

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Lights
PRODUCT_PACKAGES += lights.msm8960

# Increase the HWUI font cache since we have tons of RAM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.text_cache_width=2048

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

# QRNGD
PRODUCT_PACKAGES += qrngd

#common build.props
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    debug.composition.type=dyn \
    debug.mdpcomp.maxlayer=3 \
    debug.mdpcomp.logs=0 \
    ro.bluetooth.hfp.ver=1.6 \
    ro.qualcomm.bt.hci_transport=smd \
    ro.bluetooth.request.master=true \
    ro.bluetooth.remote.autoconnect=true \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    persist.radio.add_power_save=1 \
    persist.radio.snapshot_disabled=1 \
    com.qc.hardware=true \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.gps.qmienabled=true \
    ro.telephony.call_ring.multiple=0 \
    ro.sf.lcd_density=240 \
    ro.ril.transmitpower=true \
    ro.opengles.version=131072 \
    persist.audio.fluence.mode=endfire \
    persist.audio.vr.enable=false \
    persist.audio.handset.mic=digital \
    persist.audio.speaker.location=high \
    ro.qc.sdk.audio.fluencetype=fluence \
    persist.timed.enable=true \
    ro.emmc.sdcard.partition=17 \
    ro.use_data_netmgrd=true \
    persist.data_netmgrd_nint=16 \
    lpa.decode=true \
    rild.libpath=/system/lib/libril-qc-qmi-1.s \
    ril.subscription.types=NV,RUIM \
    ro.yas.enable=true \
    ro.yas_softiron.goghspr=true

# keylayouts
PRODUCT_COPY_FILES += \
     device/samsung/gogh-common/keylayout/Button_Jack.kl:system/usr/keylayout/Button_Jack.kl \
     device/samsung/gogh-common/keylayout/ue_rf4ce_remote.kl:system/usr/keylayout/ue_rf4ce_remote.kl \
     device/samsung/gogh-common/keylayout/samsung_remote_ir.kl:system/usr/keylayout/samsung_remote_ir.kl \
     device/samsung/gogh-common/keylayout/keypad_8960_liquid.kl:system/usr/keylayout/keypad_8960_liquid.kl \
     device/samsung/gogh-common/keylayout/philips_remote_ir.kl:system/usr/keylayout/philips_remote_ir.kl \
     device/samsung/gogh-common/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
     device/samsung/gogh-common/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
     device/samsung/gogh-common/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl\
     device/samsung/gogh-common/keylayout/cyttsp-i2c.kl:system/usr/keylayout/cyttsp-i2c.kl \
     device/samsung/gogh-common/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
     device/samsung/gogh-common/keylayout/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl \
     device/samsung/gogh-common/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
     device/samsung/gogh-common/keylayout/sec_keys.kl:system/usr/keylayout/sec_keys.kl \
     device/samsung/gogh-common/keylayout/sec_powerkey.kl:system/usr/keylayout/sec_powerkey.kl \
     device/samsung/gogh-common/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl

# Needed to reset bootmode when leaving recovery
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
	$(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/system/bin/postrecoveryboot.sh

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Common overlay
DEVICE_PACKAGE_OVERLAYS += device/samsung/gogh-common/overlay

# common msm8960
#$(call inherit-product, device/samsung/qcom-common/qcom-common.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

