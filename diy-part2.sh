#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
# sed -i 's/192.168.1.1/192.168.10.11/g' package/base-files/files/bin/config_generate
# 网络配置信息，将从 zzz-default-settings 文件的第2行开始添加
sed -i "2i # network config" ./package/lean/default-settings/files/zzz-default-settings
# 默认 IP 地址，旁路由时不会和主路由的 192.168.1.1 冲突
sed -i "3i uci set network.lan.ipaddr='192.168.10.11'" ./package/lean/default-settings/files/zzz-default-settings
sed -i "4i uci set network.lan.proto='static'" ./package/lean/default-settings/files/zzz-default-settings # 静态 IP
sed -i "5i uci set network.lan.type='bridge'" ./package/lean/default-settings/files/zzz-default-settings  # 接口类型：桥接
sed -i "6i uci set network.lan.ifname='eth0'" ./package/lean/default-settings/files/zzz-default-settings  # 网络端口：默认 eth0，第一个接口
sed -i "7i uci set network.lan.netmask='255.255.255.0'" ./package/lean/default-settings/files/zzz-default-settings    # 子网掩码
sed -i "8i uci set network.lan.gateway='192.168.10.10'" ./package/lean/default-settings/files/zzz-default-settings  # 默认网关地址（主路由 IP）
sed -i "9i uci set network.lan.dns='119.29.29.29 101.226.4.6'" ./package/lean/default-settings/files/zzz-default-settings  # 默认上游 DNS 地址
sed -i "10i uci commit network\n" ./package/lean/default-settings/files/zzz-default-settings
#
# sed -i "s/LUCI_DEPENDS:=+mosdns_neo/LUCI_DEPENDS:=+mosdns/g" ./feeds/kenzo/luci-app-mosdns/Makefile
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt'/DISTRIB_DESCRIPTION='OpenWrt by Han'/g" ./package/lean/default-settings/files/zzz-default-settings
sed -i "s/hostname='OpenWrt'/hostname='H.W'/g" ./package/base-files/files/bin/config_generate
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/$1$15T8S9pF$4hfjTe2Q8IxjhD0F8gUlw.:18682:0:99999:7:::/g' package/lean/default-settings/files/zzz-default-settings
#sudo rm -rf ./feeds/luci/applications/luci-app-mosdns
#sudo rm -rf ./feeds/packages/net/smartdns
sudo rm -rf ./feeds/packages/net/mosdns && cp -rf ./feeds/kenzo/mosdns ./feeds/packages/net/mosdns
sudo rm -rf ./feeds/packages/net/smartdns && cp -rf ./feeds/kenzo/smartdns ./feeds/packages/net/smartdns
#sed -i 's/mosdns-neo/mosdns/g' ./feeds/kenzo/luci-app-mosdns/Makefile
#sed -i 's/mosdns-neo/mosdns/g' ./feeds/kenzo/mosdns/Makefile
#sed -i 's/mosdns-neo/mosdns/g' ./feeds/packages/net/mosdns/Makefile
#find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
#find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}
# sed -i 's/root::0:0:99999:7:::/root:$1$15T8S9pF$4hfjTe2Q8IxjhD0F8gUlw.:18682:0:99999:7:::/g' package/base-files/files/etc/shadow
# sed -i '/shadow/d' package/lean/default-settings/files/zzz-default-settings
#
# rm -rf ./package/lean/luci-theme-argon
# rm -rf ./package/lean/v2ray
# rm -rf ./package/lean/v2ray-plugin
