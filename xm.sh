#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.15/g' ./target/linux/ipq807x/Makefile
# git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome
# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
