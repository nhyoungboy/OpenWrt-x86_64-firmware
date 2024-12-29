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
#


# 移除要替换的包

rm -rf feeds/packages/net/mosdns
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-mosdns


# MosDNS
# git clone --depth=1 https://github.com/sbwml/luci-app-mosdns package/luci-app-mosdns
# sed -i '$a\src-git mosdns https://github.com/sbwml/luci-app-mosdns' ./feeds.conf.default

# onliner
git clone --depth=1 https://github.com/danchexiaoyang/luci-app-onliner.git package/luci-app-onliner
# sed -i '$a\src-git onliner https://github.com/danchexiaoyang/luci-app-onliner' ./feeds.conf.default

# 2-添加 PowerOff 关机插件
git clone https://github.com/WukongMaster/luci-app-poweroff.git package/luci-app-poweroff
sed -i '$a\src-git poweroff https://github.com/WukongMaster/luci-app-poweroff' ./feeds.conf.default

# 4-添加 OpenClash 插件
sed -i '$a\src-git openclash https://github.com/vernesong/OpenClash' ./feeds.conf.default

# git clone --depth=1 https://github.com/vernesong/OpenClash package/luci-app-openclash
# Add luci-app-openclash
# wget -O package/openclash.zip https://codeload.github.com/vernesong/OpenClash/zip/refs/heads/master
# unzip -d package/openclash package/openclash.zip
# cp -r package/openclash/OpenClash-master/luci-app-openclash package/lean/luci-app-openclash
# rm -rf package/openclash package/openclash.zip

# Update luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
