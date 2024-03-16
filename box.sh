#! /bin/bash
###
# @Author       : wanyunr
# @Email        : wanyunr@outlook.com
# @Date         : 2023-11-11 00:34:53
 # @LastEditTime : 2024-03-16 19:32:59
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

#IPV.SH ipv4/6优先级调整一键脚本
function ipvsh() {
    wget -P "/root/box" "https://raw.githubusercontent.com/wanyunr/package/master/script/ipv.sh" --no-check-certificate -N
    chmod +x "/root/box/ipv.sh"
    blue "下载完成"
    bash "/root/box/ipv.sh"
    green "手动运行: bash /root/box/ipv.sh"

}

#测试 IPv4 优先还是 IPv6 优先
function getip() {
    echo
    curl ip.p3terx.com
    echo
}

#最新或 LTS 版本的 Linux 内核并启用 BBR 或 BBR Plus安装
function kernel() {
    wget -P "/root/box" "https://git.io/kernel.sh" --no-check-certificate -N
    chmod +x "/root/box/kernel.sh"
    blue "下载完成"
    bash "/root/box/kernel.sh"
    green "手动运行: bash /root/box/kernel.sh"
}

#TCP加速 一键安装管理
function tcpx() {
    wget -P "/root/box" "https://github.com/ylx2016/Linux-NetSpeed/raw/master/tcpx.sh" --no-check-certificate -N
    chmod +x "/root/box/tcpx.sh"
    blue "下载完成"
    bash "/root/box/tcpx.sh"
    green "手动运行: bash /root/box/tcpx.sh"
}
#SSH 密钥一键配置脚本·下载
function ski() {
    wget -P "/root/box" "https://raw.githubusercontent.com/wanyunr/package/master/script/SSH-Key-Installer.sh" --no-check-certificate -N
    chmod +x "/root/box/SSH-Key-Installer.sh"
    blue "下载完成"
    green "手动运行: bash /root/box/SSH-Key-Installer.sh"
    green "查看帮助: https://p3terx.com/archives/ssh-key-installer.html "
}

#F2B一键安装脚本
function f2bsh(){
red "卸载请 运行 wget https://raw.githubusercontent.com/FunctionClub/Fail2ban/master/uninstall.sh && bash uninstall.sh"
wget https://raw.githubusercontent.com/FunctionClub/Fail2ban/master/fail2ban.sh && bash fail2ban.sh 2>&1 | tee fail2ban.log
red "卸载请 运行 wget https://raw.githubusercontent.com/FunctionClub/Fail2ban/master/uninstall.sh && bash uninstall.sh"
}

#Linux换源脚本-国内·下载
function cm() {
    wget -P "/root/box" "https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/ChangeMirrors.sh" --no-check-certificate -N
    chmod +x "/root/box/ChangeMirrors.sh"
    blue "下载完成"
    echo
    green "请自行输入下面命令切换对应源"
    green " =================================================="
    echo
    green " bash /root/box/ChangeMirrors.sh 国内源选择切换 "
    green " bash /root/box/ChangeMirrors.sh --abroad  国外源选择切换  "
}

#Route-trace 路由追踪测试·下载
function rtsh() {
    wget -P "/root/box" "https://raw.githubusercontent.com/Chennhaoo/Shell_Bash/master/AutoTrace.sh" --no-check-certificate
    chmod +x "/root/box/AutoTrace.sh"
    blue "下载完成"
    bash /root/box/AutoTrace.sh
    green "手动运行: bash /root/box/AutoTrace.sh"
}

#Yabs.sh测试
function yabssh() {
    blue "-f/-d	禁用 fio（磁盘性能）测试"
    blue "-i	禁用 iperf（网络性能）测试"
    blue "-g	禁用 Geekbench（系统性能）测试"
    blue "-5	运行 Geekbench 5 测试并禁用 Geekbench 6 测试"
    blue "示例：curl -sL yabs.sh | bash -s -- -fig	#仅打印系统信息"
    # 询问是否继续，回车继续，输入其他字符退出
    read -p "回车继续，输入其他字符退出:" yabs
    [[ -z ${yabs} ]] && yabs="y"
    [[ ${yabs} != "y" ]] && [[ ${yabs} != "Y" ]] && exit 1
    # 下载并运行 yabs.sh
    curl -sL yabs.sh | bash
    green "手动运行: curl -sL yabs.sh | bash"
    green "-f/-d	禁用 fio（磁盘性能）测试"
    green "-i	禁用 iperf（网络性能）测试"
    green "-g	禁用 Geekbench（系统性能）测试"
    green "-5	运行 Geekbench 5 测试并禁用 Geekbench 6 测试"
    green "示例：curl -sL yabs.sh | bash -s -- -fig	#仅打印系统信息"
}

#RegionRestrictionCheck 流媒体解锁测试
function RegionRestrictionCheck() {
    bash <(curl -L -s check.unlock.media)
}

#三网测速
function speedtest() {
    bash <(curl -sL bash.icu/speedtest)
}

#国际测速
function globe_speedtest() {
    bash <(curl -Lso- hnetwork-speed.xyz)
}

#NEZHA.SH哪吒面板/探针·下载
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

#Acme.sh 域名证书一键申请脚本
function acme1key() {
    wget -P /root/box https://raw.githubusercontent.com/wanyunr/package/main/script/acme1key.sh --no-check-certificate -N
    chmod +x "/root/box/acme1key.sh"
    blue "下载完成"
    bash "/root/box/acme1key.sh"
    green "手动运行: bash /root/box/acme1key.sh"
}

#filebrowser一键安装
function filebrowser() {
    wget -P /root/box https://raw.githubusercontent.com/wanyunr/package/main/script/filebrowser.sh --no-check-certificate -N
    chmod +x "/root/box/filebrowser.sh"
    blue "下载完成"
    green "默认安装目录为 / "
    bash "/root/box/filebrowser.sh"
    green "手动运行: bash /root/box/filebrowser.sh"
}

#一键DD脚本
function dd() {
    wget -P "/root/box" "https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh" --no-check-certificate -N
    chmod +x "/root/box/InstallNET.sh"
    blue "下载完成"
    green "默认DD系统为 Debian 11 ，密码为 LeitboGi0ro"
    green "手动运行: bash /root/box/InstallNET.sh -debian 11 --motd --bbr"
    green "查看帮助: https://github.com/leitbogioro/Tools#quickly-start "
}
function 1Panel() {
    wget -P "/root/box" "https://resource.fit2cloud.com/1panel/package/quick_start.sh" --no-check-certificate -N
    chmod +x "/root/box/quick_start.sh"
    blue "下载完成"
    bash "/root/box/quick_start.sh"
}

function aaPanel() {
    wget -P "/root/box" "http://www.aapanel.com/script/install-ubuntu_6.0_en.sh" --no-check-certificate -N
    chmod +x /root/box/install-ubuntu_6.0_en.sh
    blue "下载完成"
    bash /root/box/install-ubuntu_6.0_en.sh forum
}

#Docker 一键安装
function Docker() {
    curl -fsSL https://get.docker.com | bash
}

function warp() {
    wget -O "/root/box/warp.sh" "https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh" --no-check-certificate -N
    chmod +x "/root/box/warp.sh"
    blue "下载完成"
    bash "/root/box/warp.sh"
}

function v2ray-agent() {
    wget -O /root/box/v2ray-agent.sh https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh --no-check-certificate -N
    chmod +x /root/box/v2ray-agent.sh
    blue "下载完成"
    bash /root/box/v2ray-agent.sh
}

function x-ui() {
    bash <(curl -Ls https://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install.sh)
}
function 3x-ui() {
    bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
}
#主菜单
function start_menu() {
    clear
    red " ---------------------VPS Tools---------------------"
    green " FROM: https://github.com/wanyunr/package "
    green " USE:  wget -N box.sh https://raw.githubusercontent.com/wanyunr/package/main/box.sh && chmod +x box.sh && bash box.sh "
    yellow " =================================================="
    green " 1. ipv4/6优先级调整一键脚本"
    green " 2. 测试 IPv4 优先还是 IPv6 优先"
    green " 3. 内核安装和BBR加速脚本"
    green " 4. TCP加速 一键安装管理"
    green " 5. SSH 密钥一键配置脚本下载"
    green " 6. Linux一键换源"
    green " 7. F2B一键安装脚本"
    green " 8. 一键DD脚本"
    yellow " --------------------------------------------------"
    green " 12. 路由追踪测试"
    green " 13. Yabs.sh测试"
    green " 14. 流媒体解锁测试"
    green " 15. 三网测速"
    green " 16. 国际测速"
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
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
    1)
        ipvsh
        ;;
    2)
        getip
        ;;
    3)
        kernel
        ;;
    4)
        tcpx
        ;;
    5)
        ski
        ;;
    6)
        cm
        ;;
    7)
        f2bsh
        ;;
    8)
        dd
        ;;
    12)
        rtsh
        ;;
    13)
        yabssh
        ;;
    14)
        RegionRestrictionCheck
        ;;
    15)
        speedtest
        ;;
    16)
        globe_speedtest
        ;;
    21)
        nezha
        ;;
    22)
        Docker
        ;;
    23)
        1Panel
        ;;
    24)
        aaPanel
        ;;
    25)
        acme1key
        ;;
    26)
        filebrowser
        ;;
    31)
        v2ray-agent
        ;;
    32)
        x-ui
        ;;
    33)
        3x-ui
        ;;
    34)
        warp
        ;;
    0)
        exit 1
        ;;
    *)
        clear
        red "请输入正确数字 !"
        start_menu
        ;;
    esac
}
start_menu "first"
