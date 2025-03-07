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

COMMON_PATH := device/samsung/exynos9820-common

## Inherit common configuration
include $(COMMON_PATH)/BoardConfigCommon.mk

## Boot Image
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

## Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 9856614400
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 9852420096

## DTB
BOARD_DTB_CFG := $(COMMON_PATH)/configs/kernel/exynos9825-r.cfg

## Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 61865984
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 71102464

$(call soong_config_set,fstab_exynos9820,has_metadata_partition,true)

## Platform
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/exynos9825_manifest.xml
TARGET_BOARD_PLATFORM := universal9825_r
TARGET_BOOTLOADER_BOARD_NAME := exynos9825

## Properties
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.exynos9825.prop

## Recovery
TARGET_RECOVERY_FSTAB_GENRULE := gen_fstab.exynos9820

## Security
VENDOR_SECURITY_PATCH := 2024-05-01

## Verified Boot
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 0
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --algorithm NONE
