#!/bin/bash
#=================================================
# Description: DIY script
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.111.254/g' package/base-files/files/bin/config_generate
# 修正连接数（by ベ七秒鱼ベ）
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

# themes添加（svn co 命令意思：指定版本如https://github）
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata


#添加额外非必须软件包
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
git clone https://github.com/sensec/luci-app-udp2raw.git package/luci-app-udp2raw
git clone https://github.com/pgolds/openwrt-udp2raw.git package/openwrt-udp2raw
git clone https://github.com/kuoruan/openwrt-kcptun.git package/kcptun
git clone https://github.com/kuoruan/luci-app-kcptun.git package/luci-app-kcptun

# Add luci-app-onliner
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner
