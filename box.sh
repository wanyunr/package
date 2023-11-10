#! /bin/bash
###
# @Author       : wanyunr
# @Email        : wanyunr@outlook.com
# @Date         : 2023-11-11 00:34:53
 # @LastEditTime : 2023-11-11 04:07:11
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
    bash "/root/box/ipv.sh 来运行"
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

#SSH 密钥一键配置脚本·下载
function ski() {
    wget -P "/root/box" "https://raw.githubusercontent.com/wanyunr/package/master/script/SSH-Key-Installer.sh" --no-check-certificate -N
    chmod +x "/root/box/SSH-Key-Installer.sh"
    blue "下载完成"
    green "手动运行: bash /root/box/SSH-Key-Installer.sh"
    green "查看帮助: https://p3terx.com/archives/ssh-key-installer.html "
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
    wget -P "/root/box" "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/yabs.sh" --no-check-certificate
    chmod +x "/root/box/yabs.sh"
    blue "下载完成"
    bash "/root/box/yabs.sh"
}

#RegionRestrictionCheck 流媒体解锁测试
function RegionRestrictionCheck() {
    bash <(curl -L -s check.unlock.media)
}

#三网测速
function speedtest() {
    bash <(curl -Lso- https://git.io/superspeed_uxh)
}

#国际测速
function globe_speedtest() {
    bash <(curl -Lso- hnetwork-speed.xyz)
}

#NEZHA.SH哪吒面板/探针·下载
function nezha() {
    wget -P /root/box -O "nezha.sh" "https://raw.githubusercontent.com/BlueSkyXN/nezha/master/script/install.sh" --no-check-certificate -N
    chmod +x "/root/box/nezha.sh"
    blue "下载完成"
    bash "/root/box/nezha.sh"
    green "手动运行: bash /root/box/nezha.sh"
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
    green "手动运行: bash /root/box/InstallNET.sh -debian --motd"
    green "查看帮助: https://github.com/leitbogioro/Tools#quickly-start "
}
#主菜单
function start_menu() {
    clear
    red " ---------------------VPS Tools---------------------"
    green " FROM: https://github.com/wanyunr/package "
    green " USE:  wget -N box.sh https://raw.githubusercontent.com/wanyunr/package/main/box.sh && chmod +x box.sh && bash box.sh "
    yellow " =================================================="
    green " 1.  ipv4/6优先级调整一键脚本"
    green " 2.  测试 IPv4 优先还是 IPv6 优先"
    green " 3.  内核安装和BBR加速脚本"
    green " 4.  SSH 密钥一键配置脚本下载"
    green " 5.  Linux一键换源"
    yellow " --------------------------------------------------"
    green " 6.  路由追踪测试"
    green " 7.  NEZHA.SH哪吒面板/探针"
    green " 8.  流媒体解锁测试"
    green " 9.  三网测速"
    green " 10. 国际测速"
    yellow " --------------------------------------------------"
    green " 11. Yabs.sh测试"
    green " 12. Acme.sh 域名证书一键申请脚本"
    green " 13. filebrowser一键安装"
    green " 14. 一键DD脚本"
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
        ski
        ;;
    5)
        cm
        ;;
    6)
        rtsh
        ;;
    7)
        nezha
        ;;
    8)
        RegionRestrictionCheck
        ;;
    9)
        speedtest
        ;;
    10)
        globe_speedtest
        ;;
    11)
        yabssh
        ;;
    12)
        acme1key
        ;;
    13)
        filebrowser
        ;;
    14)
        dd
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
