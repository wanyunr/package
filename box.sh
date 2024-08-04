#! /bin/bash
###
# @Author       : wanyunr
# @Email        : wanyunr@outlook.com
# @Date         : 2023-11-11 00:34:53
 # @LastEditTime : 2024-08-04 16:32:02
# @Description  :
# Copyright (c) 2023 by wanyunr, All Rights Reserved.
###

#彩色
red() {
    echo -e "\033[31m\033[01m$1\033[0m"
}
green() {
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow() {
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue() {
    echo -e "\033[34m\033[01m$1\033[0m"
}

# IP 优先级调整一键脚本
function ipvsh_priority() {
    wget -N -P "$HOME/box" "https://raw.githubusercontent.com/wanyunr/package/master/script/ipv.sh" --no-check-certificate
    chmod +x "$HOME/box/ipv.sh"
    blue "下载完成"
    bash "$HOME/box/ipv.sh"
    green "手动运行: bash $HOME/box/ipv.sh"
}

# 常用工具包一键安装
function initialize_tools() {
    wget -N -P "$HOME/box" "https://raw.githubusercontent.com/wanyunr/package/master/script/initialize.sh" --no-check-certificate
    chmod +x "$HOME/box/initialize.sh"
    blue "下载完成"
    bash "$HOME/box/initialize.sh"
}

# xanmod-x64v3 内核安装
function xanmod() {
    wget -N -P "$HOME/box" "https://raw.githubusercontent.com/wanyunr/package/master/script/xanmod.sh" --no-check-certificate
    chmod +x "$HOME/box/xanmod.sh"
    blue "下载完成"
    bash "$HOME/box/xanmod.sh"
}

# 测试 IPv4 优先还是 IPv6 优先
function getip() {
    echo
    curl ip.p3terx.com
    echo
}

# 最新或 LTS 版本的 Linux 内核并启用 BBR 或 BBR Plus 安装
function kernel() {
    wget -N -P "$HOME/box" "https://git.io/kernel.sh" --no-check-certificate
    chmod +x "$HOME/box/kernel.sh"
    blue "下载完成"
    bash "$HOME/box/kernel.sh"
    green "手动运行: bash $HOME/box/kernel.sh"
}

# TCP 加速一键安装管理
function tcpx() {
    wget -N -P "$HOME/box" "https://github.com/ylx2016/Linux-NetSpeed/raw/master/tcpx.sh" --no-check-certificate
    chmod +x "$HOME/box/tcpx.sh"
    blue "下载完成"
    bash "$HOME/box/tcpx.sh"
    green "手动运行: bash $HOME/box/tcpx.sh"
}

# SSH 密钥一键配置脚本下载
function ski() {
    wget -N -P "$HOME/box" "https://raw.githubusercontent.com/wanyunr/package/master/script/SSH-Key-Installer.sh" --no-check-certificate
    chmod +x "$HOME/box/SSH-Key-Installer.sh"
    blue "下载完成"
    green "手动运行: bash $HOME/box/SSH-Key-Installer.sh"
    green "查看帮助: https://p3terx.com/archives/ssh-key-installer.html"
}

# F2B 一键安装脚本
function f2bsh() {
    red "卸载请运行 wget https://raw.githubusercontent.com/FunctionClub/Fail2ban/master/uninstall.sh && bash uninstall.sh"
    wget https://raw.githubusercontent.com/FunctionClub/Fail2ban/master/fail2ban.sh && bash fail2ban.sh 2>&1 | tee fail2ban.log
    red "卸载请运行 wget https://raw.githubusercontent.com/FunctionClub/Fail2ban/master/uninstall.sh && bash uninstall.sh"
}

# Linux 换源脚本 - 国内下载
function cm() {
    wget -N -P "$HOME/box" "https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/ChangeMirrors.sh" --no-check-certificate
    chmod +x "$HOME/box/ChangeMirrors.sh"
    blue "下载完成"
    echo
    green "请自行输入下面命令切换对应源"
    green " =================================================="
    echo
    green " bash $HOME/box/ChangeMirrors.sh 国内源选择切换"
    green " bash $HOME/box/ChangeMirrors.sh --abroad 国外源选择切换"
}

# Route-trace 路由追踪测试
function rtsh() {
    wget -N -P "$HOME/box" "https://raw.githubusercontent.com/Chennhaoo/Shell_Bash/master/AutoTrace.sh" --no-check-certificate
    chmod +x "$HOME/box/AutoTrace.sh"
    blue "下载完成"
    bash $HOME/box/AutoTrace.sh
    green "手动运行: bash $HOME/box/AutoTrace.sh"
}

# Yabs.sh 测试
function yabssh() {
    blue "-f/-d 禁用 fio（磁盘性能）测试"
    blue "-i 禁用 iperf（网络性能）测试"
    blue "-g 禁用 Geekbench（系统性能）测试"
    blue "-5 运行 Geekbench 5 测试并禁用 Geekbench 6 测试"
    blue "仅打印系统信息："
    blue "curl -sL yabs.sh | bash -s -- -fig"
    read -p "回车继续，输入其他字符退出: " yabs
    [[ -z ${yabs} ]] && yabs="y"
    [[ ${yabs} != "y" ]] && [[ ${yabs} != "Y" ]] && exit 1
    curl -sL yabs.sh | bash
    green "手动运行: curl -sL yabs.sh | bash"
    green "-f/-d 禁用 fio（磁盘性能）测试"
    green "-i 禁用 iperf（网络性能）测试"
    green "-g 禁用 Geekbench（系统性能）测试"
    green "-5 运行 Geekbench 5 测试并禁用 Geekbench 6 测试"
    green "示例：curl -sL yabs.sh | bash -s -- -fig 仅打印系统信息"
}

# RegionRestrictionCheck 流媒体解锁测试
function RegionRestrictionCheck() {
    bash <(curl -L -s check.unlock.media)
}

# IP 质量测试
function ipcheck() {
    bash <(curl -sL IP.Check.Place)
}

# 三网测速
function speedtest() {
    bash <(curl -sL bash.icu/speedtest)
}

# 国际测速
function globe_speedtest() {
    bash <(curl -Lso- network-speed.xyz)
}

# 融合怪测试
function ecs() {
    wget -N -P "$HOME/box" "https://gitlab.com/spiritysdx/za/-/raw/main/ecs.sh" --no-check-certificate
    chmod +x "$HOME/box/ecs.sh"
    blue "下载完成"
    bash $HOME/box/ecs.sh
    green "手动运行: bash $HOME/box/ecs.sh"
}

# NEZHA.SH 哪吒面板/探针·下载
function nezha() {
    country_code=$(curl -s ipinfo.io/country)
    echo "$(date) - 当前地区代码为: $country_code"

    if [ "$country_code" = "CN" ]; then
        echo "$(date) - 从 gitee 安装 Nezha"
        curl -L https://gitee.com/naibahq/nezha/raw/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && sudo CN=true ./nezha.sh
    else
        echo "$(date) - 从 github 安装 Nezha"
        curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && sudo ./nezha.sh
    fi
}

# Acme.sh 域名证书一键申请脚本
function acme1key() {
    wget -N -P $HOME/box https://raw.githubusercontent.com/wanyunr/package/main/script/acme1key.sh --no-check-certificate
    chmod +x "$HOME/box/acme1key.sh"
    blue "下载完成"
    bash "$HOME/box/acme1key.sh"
    green "手动运行: bash $HOME/box/acme1key.sh"
}

# filebrowser 一键安装
function filebrowser() {
    wget -N -P $HOME/box https://raw.githubusercontent.com/wanyunr/package/main/script/filebrowser.sh --no-check-certificate
    chmod +x "$HOME/box/filebrowser.sh"
    blue "下载完成"
    green "默认安装目录为 /"
    bash "$HOME/box/filebrowser.sh"
    green "手动运行: bash $HOME/box/filebrowser.sh"
}

# 一键 DD 脚本
function dd() {
    wget -N -P "$HOME/box" "https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh" --no-check-certificate
    chmod +x "$HOME/box/InstallNET.sh"
    blue "下载完成"
    green "默认 DD 系统为 Debian 11 ，密码为 LeitboGi0ro"
    green "手动运行: bash $HOME/box/InstallNET.sh -debian 11 --motd --bbr"
    green "查看帮助: https://github.com/leitbogioro/Tools#quickly-start"
}

# 1Panel 一键安装
function onePanel() {
    wget -N -P "$HOME/box" "https://resource.fit2cloud.com/1panel/package/quick_start.sh" --no-check-certificate
    chmod +x "$HOME/box/quick_start.sh"
    blue "下载完成"
    bash "$HOME/box/quick_start.sh"
}

# aaPanel 一键安装
function aaPanel() {
    wget -N -P "$HOME/box" "http://www.aapanel.com/script/install-ubuntu_6.0_en.sh" --no-check-certificate
    chmod +x $HOME/box/install-ubuntu_6.0_en.sh
    blue "下载完成"
    bash $HOME/box/install-ubuntu_6.0_en.sh forum
}

# Docker 一键安装
function Docker() {
    curl -fsSL https://get.docker.com | bash
}

# WARP 一键安装
function warp() {
    wget -O "$HOME/box/warp.sh" "https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh" --no-check-certificate
    chmod +x "$HOME/box/warp.sh"
    blue "下载完成"
    bash "$HOME/box/warp.sh"
}

# v2ray-agent 一键安装
function v2ray_agent() {
    wget -O $HOME/box/v2ray-agent.sh https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh --no-check-certificate
    chmod +x $HOME/box/v2ray-agent.sh
    blue "下载完成"
    bash $HOME/box/v2ray-agent.sh
}

# x-ui 一键安装
function x_ui() {
    bash <(curl -Ls https://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install.sh)
}

# 3x-ui 一键安装
function three_x_ui() {
    bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
}

# 主菜单
function start_menu() {
    clear
    red " ---------------------VPS Tools---------------------"
    green " FROM: https://github.com/wanyunr/package"
    green " USE:  wget -N box.sh https://raw.githubusercontent.com/wanyunr/package/main/box.sh && chmod +x box.sh && bash box.sh"
    yellow " =================================================="
    green " 1. ipv4/6优先级调整一键脚本"
    green " 2. 测试 IPv4 优先还是 IPv6 优先"
    green " 3. 内核安装和BBR加速脚本"
    green " 4. TCP加速 一键安装管理"
    green " 5. SSH 密钥一键配置脚本下载"
    green " 6. Linux一键换源"
    green " 7. F2B一键安装脚本"
    green " 8. 一键DD脚本"
    green " 9. 常用工具包一键安装"
    green " 10. xanmod 内核安装"
    yellow " --------------------------------------------------"
    green " 12. 路由追踪测试"
    green " 13. Yabs.sh测试"
    green " 14. 流媒体解锁测试"
    green " 15. IP 质量测试"
    green " 16. 三网测速"
    green " 17. 国际测速"
    green " 18. 融合怪测试"
    yellow " --------------------------------------------------"
    green " 21. 安装哪吒面板/探针"
    green " 22. 安装Docker"
    green " 23. 安装1Panel面板"
    green " 24. 安装aaPanel面板"
    green " 25. 安装Acme.sh脚本"
    green " 26. 安装filebrowser"
    yellow " --------------------------------------------------"
    green " 0. 退出脚本"
    echo
    read -p "请输入数字: " menuNumberInput
    case "$menuNumberInput" in
        1) ipvsh_priority ;;
        2) getip ;;
        3) kernel ;;
        4) tcpx ;;
        5) ski ;;
        6) cm ;;
        7) f2bsh ;;
        8) dd ;;
        9) initialize_tools ;;
        10) xanmod ;;
        12) rtsh ;;
        13) yabssh ;;
        14) RegionRestrictionCheck ;;
        15) ipcheck ;;
        16) speedtest ;;
        17) globe_speedtest ;;
        18) ecs ;;
        21) nezha ;;
        22) Docker ;;
        23) onePanel ;;
        24) aaPanel ;;
        25) acme1key ;;
        26) filebrowser ;;
        31) v2ray_agent ;;
        32) x_ui ;;
        33) three_x_ui ;;
        34) warp ;;
        0) exit 1 ;;
        *) clear; red "请输入正确数字 !"; start_menu ;;
    esac
}
start_menu "first"
