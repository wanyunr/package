## Acme.sh 域名证书一键申请脚本

需要准备 CloudFlare Global API Key，CloudFlare的登录邮箱和一枚在Cloudflare托管的域名
```bash
wget -N --no-check-certificate https://raw.githubusercontent.com/wanyunr/package/main/script/acme1key.sh && bash acme1key.sh
```
## filebrowser一键安装
默认安装目录为`/`
```bash
wget -N --no-check-certificate https://raw.githubusercontent.com/wanyunr/package/main/script/filebrowser.sh && bash filebrowser.sh
```
[filebrowser一键安装脚本使用说明](https://github.com/wanyunr/package/wiki/#filebrowser%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85%E8%84%9A%E6%9C%AC%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E)

## VPS Tool
#### motd.sh
```bash
wget -N --no-check-certificate https://raw.githubusercontent.com/wanyunr/package/main/script/motd.sh -P /etc/profile.d
```