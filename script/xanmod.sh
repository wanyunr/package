#!/bin/bash

# 检查系统是否为 Debian/Ubuntu 并且是 AMD/x86 架构
if [ "$(dpkg --print-architecture)" != "amd64" ]; then
    echo "错误：此脚本仅适用于 amd64 架构。"
    exit 1
fi

if [ "$(lsb_release -is)" != "Debian" ] && [ "$(lsb_release -is)" != "Ubuntu" ]; then
    echo "错误：此脚本仅适用于 Debian 或 Ubuntu 系统。"
    exit 1
fi

# 更新并安装必要的软件包
apt update -y && apt install -y wget gnupg lrzsz

# 添加 Xanmod 的 GPG 密钥
wget -qO - https://dl.xanmod.org/archive.key | gpg --dearmor -o /usr/share/keyrings/xanmod-archive-keyring.gpg --yes

# 添加 Xanmod 软件源
echo 'deb [signed-by=/usr/share/keyrings/xanmod-archive-keyring.gpg] http://deb.xanmod.org releases main' | tee /etc/apt/sources.list.d/xanmod-release.list

# 再次更新并安装 Linux-Xanmod 内核
apt update -y && apt install -y linux-xanmod-x64v3

# 配置 sysctl 设置
cat > /etc/sysctl.conf << EOF
net.core.default_qdisc=fq_pie
net.ipv4.tcp_congestion_control=bbr
EOF

echo "安装完成，请重启系统以使更改生效。"
