# Copyright (C) 2012 The CyanogenMod Project
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

# Inherit APNs list
$(call inherit-product, vendor/du/config/cdma.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/du/config/common.mk)

$(call inherit-product-if-exists, vendor/lge/galbi/galbi-vs980-vendor.mk)
$(call inherit-product, device/lge/g2-common/g2.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := du_vs980
PRODUCT_DEVICE := vs980
PRODUCT_BRAND := lge
PRODUCT_MANUFACTURER := lge
PRODUCT_MODEL := LG-VS980

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=lge/g2_vzw/g2:4.2.2/JDQ39B/VS98011A.1378346052:user/release-keys \
    PRIVATE_BUILD_DESC="g2_vzw-user 4.2.2 JDQ39B VS98011A.1378346052 release-keys"

## overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_PROPERTY_OVERRIDES += \
        telephony.lteOnCdmaDevice=1 \
        ro.telephony.default_network=10 \
        ro.cdma.home.operator.numeric=311480 \
        ro.cdma.home.operator.alpha=Verizon \
        ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83

PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# NFC packages
PRODUCT_PACKAGES += \
    nfc_nci.g2 \
    NfcNci

