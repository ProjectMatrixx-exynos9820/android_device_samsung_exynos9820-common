#
# Copyright (C) 2023 The LineageOS Project
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

COMMON_PATH := device/samsung/exynos9820-common

# Inherit common configuration
$(call inherit-product, $(COMMON_PATH)/common.mk)

# Audio
PRODUCT_PACKAGES += \
    audio.primary.universal9825_r

# Display
PRODUCT_PACKAGES += \
    gralloc.universal9825_r

# init
PRODUCT_PACKAGES += \
    fstab.exynos9825 \
    fstab.exynos9825.ramdisk

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/init/init.recovery.exynos9820.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.exynos9825.rc

# Shims
PRODUCT_PACKAGES += \
    libshim_camera
