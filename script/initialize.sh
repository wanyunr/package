#!/bin/bash

# ANSI转义码用于颜色
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # 无颜色

# 检查系统是否为AMD架构的Debian或Ubuntu系统
if ! [[ $(uname -m) == "x86_64" ]]; then
    echo -e "${RED}此脚本仅支持AMD64架构系统。退出脚本。${NC}"
    exit 1
fi

if ! grep -Ei 'debian|ubuntu' /etc/os-release > /dev/null; then
    echo -e "${RED}此脚本仅支持Debian或Ubuntu系统。退出脚本。${NC}"
    exit 1
fi

# 创建下载目录
DOWNLOAD_DIR="/tmp/box/initialize"
mkdir -p "$DOWNLOAD_DIR"

# 函数：在 .bashrc 中添加或替换 alias
add_or_replace_alias() {
    local alias_name=$1
    local alias_command=$2

    # 删除已经存在的 alias
    sed -i "/alias $alias_name=/d" ~/.bashrc

    # 添加新的 alias
    echo "alias $alias_name='$alias_command'" >> ~/.bashrc
}

# 安装其他软件包
apt update && apt install -y sudo wget curl iperf3 lrzsz ufw vim vnstat tree traceroute unzip lsof ntpdate

# 下载并安装 lsd
wget -q --show-progress -P "$DOWNLOAD_DIR" https://github.com/lsd-rs/lsd/releases/download/v1.1.2/lsd_1.1.2_amd64_xz.deb
sudo dpkg -i "$DOWNLOAD_DIR/lsd_1.1.2_amd64_xz.deb"

# 添加或替换 lsd 的 alias
add_or_replace_alias "la" "lsd -a"
add_or_replace_alias "ll" "lsd --long --header"

# 添加或替换 tree 的 alias
add_or_replace_alias "t2" "tree -L 2"

add_or_replace_alias "d1" "du -ah --max-depth=1"

# 下载并安装 duf
wget -q --show-progress -P "$DOWNLOAD_DIR" https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_amd64.deb
sudo dpkg -i "$DOWNLOAD_DIR/duf_0.8.1_linux_amd64.deb"

# 添加或替换 duf 的 alias
add_or_replace_alias "df" "duf"

# 下载并安装 fastfetch
wget -q --show-progress -P "$DOWNLOAD_DIR" https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.deb
sudo dpkg -i "$DOWNLOAD_DIR/fastfetch-linux-amd64.deb"

# 添加 fastfetch 的 alias
add_or_replace_alias "ff" "fastfetch --logo none"

# 下载并安装 tcping
wget -q --show-progress -P "$DOWNLOAD_DIR" https://github.com/pouriyajamshidi/tcping/releases/latest/download/tcping_amd64.deb
sudo apt install -y "$DOWNLOAD_DIR/tcping_amd64.deb"

# 下载并安装 bottom
curl -s -L -o "$DOWNLOAD_DIR/bottom_0.10.1-1_amd64.deb" https://github.com/ClementTsang/bottom/releases/download/0.10.1/bottom_0.10.1-1_amd64.deb
sudo dpkg -i "$DOWNLOAD_DIR/bottom_0.10.1-1_amd64.deb"

# # 同步系统时间 1
sudo ntpdate pool.ntp.org
# 设置时区为上海
sudo timedatectl set-timezone Asia/Shanghai
# 创建一个cron作业，每天0点同步时间
(crontab -l 2>/dev/null; echo "0 0 * * * /usr/sbin/ntpdate pool.ntp.org") | crontab -

# # 同步系统时间 2
# sudo bash -c 'cat << EOF > /etc/ntp.conf
# # Use public servers from the pool.ntp.org project.
# pool pool.ntp.org iburst

# # Specify the drift file.
# driftfile /var/lib/ntp/ntp.drift

# # Enable kernel synchronization of the real-time clock (RTC).
# rtcsync
# EOF'
# # 重启ntp服务以应用新配置
# sudo systemctl restart ntp
# # 设置时区为上海
# sudo timedatectl set-timezone Asia/Shanghai
# # 创建一个cron作业，每天0点同步时间
# (crontab -l 2>/dev/null; echo "0 0 * * * /usr/sbin/ntpdate pool.ntp.org") | crontab -

# 显示安装信息及别名替换信息
echo -e "${YELLOW}以下软件包已安装，并设置了相应的别名${NC}"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "软件包" "别名"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "iperf3" "无"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "lrzsz" "无"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "ufw" "无"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "vim" "无"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "vnstat" "无"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "tree" "t2 -> 'tree -L 2'"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "lsd" "ll -> 'lsd --long --header'"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "du" "d1 -> 'du -ah --max-depth=1'"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "duf" "df -> 'duf'"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "fastfetch" "ff -> 'fastfetch --logo none'"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "tcping" "无"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "bottom" "btm"

# 删除下载的文件
rm -rf "$DOWNLOAD_DIR"

# 使 .bashrc 生效以应用新的 alias
source ~/.bashrc

# 提示用户
echo -e "${YELLOW}如果别名未生效，请新建一个终端窗口。${NC}"