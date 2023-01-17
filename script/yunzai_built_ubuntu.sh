#!/bin/bash
# ubuntu
# 2022年2月6日13:20:06
# 项目地址：https://github.com/Le-niao/Yunzai-Bot

if [ $EUID -ne 0 ]; then
	echo "请先输入 sudo -i 切换root权限"
	exit
fi

# 安装nodejs
echo '安装nodejs开始';
if ! type node >/dev/null 2>&1; then
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt-get install -y nodejs
else
    echo 'nodejs已安装';
fi
echo '安装nodejs完成';

# 安装并运行redis
echo '安装redis开始';
apt-get install redis -y
redis-server --save 900 1 --save 300 10 --daemonize yes
echo '安装redis完成';

# 安装chromium
echo '安装chromium开始';
apt install chromium-browser -y
echo '安装chromium完成';

# 安装中文字体
echo '安装中文字体开始';
apt install -y --force-yes --no-install-recommends fonts-wqy-microhei
echo '安装中文字体完成';

# 安装git
echo '安装git开始';
apt install git -y
echo '安装git完成';

# 安装pnpm
echo '安装pnpm开始';
npm install pnpm -g
echo '安装pnpm完成';

# 克隆项目
echo '克隆Yunzai-Bot开始';
if [ ! -d "Yunzai-Bot/" ];then
  git clone https://gitee.com/Le-niao/Yunzai-Bot.git
  if [ ! -d "Yunzai-Bot/" ];then
    echo "克隆失败"
    exit 0
  else
    echo '克隆完成'
  fi
else
  echo '克隆完成'
fi

cd Yunzai-Bot
echo '安装模块开始';
if [ ! -d "node_modules/" ];then
  npm install
  echo '安装模块完成'
else
  echo '安装模块完成'
fi

echo '安装依赖开始'
sudo apt install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget libgbm-dev
echo '安装依赖完成'

echo '安装成功';
