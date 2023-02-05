#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=6.1/g' ./target/linux/x86/Makefile
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
# git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome
# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
#sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
#sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default
#sed -i '$a src-git diy https://github.com/jaydiao521/diy' feeds.conf.default
#sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#git clone https://github.com/godros/luci-app-godproxy.git package/luci-app-godproxy
#git clone https://github.com/garypang13/luci-app-bypass.git package/luci-app-bypass
#git clone https://github.com/garypang13/luci-app-dnsfilter.git package/luci-app-dnsfilter
#svn co https://github.com/garypang13/openwrt-packages/trunk/smartdns-le package/smartdns-le
# sed -i '$a src-git diy https://github.com/jaydiao521/diy' feeds.conf.default
# sed -i '$a src-git garypang https://github.com/garypang13/openwrt-packages' feeds.conf.default
# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
