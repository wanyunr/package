if curl -s ipinfo.io/country | grep -q "CN"; then
    echo "$(date) - 从 gitee 安装 Nezha"
    curl -L https://gitee.com/naibahq/nezha/raw/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && sudo CN=true ./nezha.sh
else
    echo "$(date) - 从 github 安装 Nezha"
    curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && sudo ./nezha.sh
fi