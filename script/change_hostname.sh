#!/bin/bash

# 检查是否使用了root权限运行
if [ "$(id -u)" -ne 0 ]; then
  echo "请使用 root 权限运行此脚本"
  exit 1
fi

# 检查是否提供了新主机名作为参数
if [ -z "$1" ]; then
  echo "用法: $0 新的主机名"
  exit 1
fi

NEW_HOSTNAME=$1

# 获取当前主机名
CURRENT_HOSTNAME=$(hostname)

# 修改当前会话中的主机名
echo "修改当前主机名为 $NEW_HOSTNAME..."
hostnamectl set-hostname "$NEW_HOSTNAME"

# 更新 /etc/hostname 文件以永久更改主机名
echo "更新 /etc/hostname 文件..."
echo "$NEW_HOSTNAME" > /etc/hostname

# 更新 /etc/hosts 文件以替换旧主机名
echo "更新 /etc/hosts 文件..."
sed -i "s/$CURRENT_HOSTNAME/$NEW_HOSTNAME/g" /etc/hosts

echo "主机名修改成功！当前主机名是 $NEW_HOSTNAME"

# 显示修改后的主机名
hostnamectl status
