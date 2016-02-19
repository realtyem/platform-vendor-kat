#
# Copyright (C) 2011 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL builds

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0

PRODUCT_PACKAGES += \
    TerminalEmulator \
    thtt \
    ntfs-3g.probe \
    ntfsfix \
    ntfs-3g \
    PhaseBeam \
    HoloSpiral \
    fstrim \
    libnl \
    iw \
    tcpdump \
    dropbear \
    scp \
    sftp \
    Launcher3 \
    libbt-vendor \
    fsck.exfat \
    mount.exfat \
    mkfs.exfat \
    mkntfs \
    busybox \
    org.apache.http.legacy \
    #LauncherLayout \
    #ssh-keygen
    #powertop \
    #ControlCenter \
    #Trebuchet \
    #com.tmobile.themes \
    #ThemeChooser \
    #ThemeManager \

PRODUCT_PACKAGES += libkatcam \
 		libkatomx \

#PRODUCT_COPY_FILES += \
#    vendor/kat/proprietary/terminalemulator/libjackpal-androidterm4.so:system/lib/libjackpal-androidterm4.so \

#Bring in camera media effects
$(call inherit-product-if-exists, frameworks/base/data/videos/VideoPackage2.mk)

$(call inherit-product-if-exists, vendor/kat/filesystem_overlay/overlay.mk)
#DEVICE_PACKAGE_OVERLAYS += vendor/kat/resource_overlay

    PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_DISPLAY_ID="$(BUILD_ID) KatKiss-$(PLATFORM_VERSION)_$(KAT_BUILD_NUMBER)"

ifeq ($(BOOTANIMATION_RESOLUTION), KatKiss)
PRODUCT_COPY_FILES += \
    vendor/kat/bootanimations/KatKiss.zip:system/media/bootanimation.zip
endif

# Inherit sabermod vendor
USE_LEGACY_GCC := true #Sabermod use 4.6 GCC for HOST build
SM_VENDOR := vendor/sm
include $(SM_VENDOR)/Main.mk
