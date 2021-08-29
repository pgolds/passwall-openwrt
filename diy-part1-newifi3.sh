#!/bin/bash
#=================================================
# Description: DIY script
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.111.254/g' package/base-files/files/bin/config_generate
# DNS Cache FixUP
echo -e "#max-ttl=600\nneg-ttl=600\nmin-cache-ttl=3600\nauth-ttl=3600" >> package/network/services/dnsmasq/files/dnsmasq.conf
# mkdir package/base-files/files/config
# rm -rf package/lean/smartdns
# git clone -b lede https://github.com/pymumu/luci-app-smartdns.git feeds/luci/applications/luci-app-smartdns
# git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

git clone https://github.com/sensec/luci-app-udp2raw.git package/luci-app-udp2raw
git clone https://github.com/pgolds/openwrt-udp2raw.git package/openwrt-udp2raw
git clone https://github.com/kuoruan/openwrt-kcptun.git package/kcptun
git clone https://github.com/kuoruan/luci-app-kcptun.git package/luci-app-kcptun

# Add luci-app-onliner
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default

#git clone https://github.com/garypang13/luci-app-bypass.git package/luci-app-bypass
#git clone https://github.com/garypang13/smartdns-le package/smartdns-le
#git clone https://github.com/jerrykuku/luci-app-vssr package/lean/luci-app-vssr
wget -P package/lua-maxminddb https://raw.githubusercontent.com/kiddin9/openwrt-packages/master/lua-maxminddb/Makefile
wget -P package/redsocks2 https://raw.githubusercontent.com/coolsnowwolf/lede/master/package/lean/redsocks2/Makefile
#find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
#find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}
