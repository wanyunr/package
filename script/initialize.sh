#!/bin/bash

# ANSI转义码用于颜色
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # 无颜色

# 创建下载目录
DOWNLOAD_DIR="$HOME/box/initialize"
mkdir -p "$DOWNLOAD_DIR"

# 函数：在 .bashrc 中添加或替换 alias
add_or_replace_alias() {
    local alias_name=$1
    local alias_command=$2

    if grep -q "alias $alias_name=" ~/.bashrc; then
        # Alias 存在，进行替换
        sed -i "s|alias $alias_name=.*|alias $alias_name='$alias_command'|g" ~/.bashrc
    else
        # Alias 不存在，添加
        echo "alias $alias_name='$alias_command'" >> ~/.bashrc
    fi
}

# 安装其他软件包
sudo apt install -y iperf3 lrzsz ufw vim vnstat tree

# 下载并安装 lsd
wget -P "$DOWNLOAD_DIR" https://github.com/lsd-rs/lsd/releases/download/v1.1.2/lsd_1.1.2_amd64.deb
dpkg -i "$DOWNLOAD_DIR/lsd_1.1.2_amd64.deb"

# 添加或替换 lsd 的 alias
add_or_replace_alias "ll" "lsd --long --header"

# 添加或替换 tree 的 alias
add_or_replace_alias "t2" "tree -L 2"

add_or_replace_alias "d1" "du -ah --max-depth=1"

# 下载并安装 duf
wget -P "$DOWNLOAD_DIR" https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_amd64.deb
sudo dpkg -i "$DOWNLOAD_DIR/duf_0.8.1_linux_amd64.deb"

# 添加或替换 duf 的 alias
add_or_replace_alias "df" "duf"

# 下载并安装 fastfetch
wget -P "$DOWNLOAD_DIR" https://github.com/fastfetch-cli/fastfetch/releases/download/2.11.5/fastfetch-linux-amd64.deb
dpkg -i "$DOWNLOAD_DIR/fastfetch-linux-amd64.deb"

# 添加 fastfetch 的 alias
add_or_replace_alias "ff" "fastfetch --logo none"

# 下载并安装 tcping
wget -P "$DOWNLOAD_DIR" https://github.com/pouriyajamshidi/tcping/releases/latest/download/tcping_amd64.deb
sudo apt install -y "$DOWNLOAD_DIR/tcping_amd64.deb"

# 下载并安装 bottom
curl -L -o "$DOWNLOAD_DIR/bottom_0.9.6_amd64.deb" https://github.com/ClementTsang/bottom/releases/download/0.9.6/bottom_0.9.6_amd64.deb
sudo dpkg -i "$DOWNLOAD_DIR/bottom_0.9.6_amd64.deb"

# 显示安装信息及别名替换信息
echo -e "${YELLOW}以下软件包已安装，并设置了相应的别名${NC}"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "软件包" "别名"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "iperf3" "无别名"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "lrzsz" "无别名"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "ufw" "无别名"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "vim" "无别名"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "vnstat" "无别名"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "tree" "t2 -> 'tree -L 2'"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "lsd" "ll -> 'lsd --long --header'"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "du" "d1 -> 'du -ah --max-depth=1'"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "duf" "df -> 'duf'"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "fastfetch" "ff -> 'fastfetch --logo none'"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "tcping" "无别名"
printf "${GREEN}%-15s${NC} ${BLUE}%-40s${NC}\n" "bottom" "btm"

# 删除下载的文件
rm -rf "$DOWNLOAD_DIR"

# 使 .bashrc 生效以应用新的 alias
source ~/.bashrc
