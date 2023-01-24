## 云崽一键安装脚本（仅适用于Ubuntu）
```
curl -L https://raw.githubusercontent.com/wanyunr/package/main/script/yunzai_built_ubuntu.sh | bash
```
## Acme.sh 域名证书一键申请脚本
需要准备 CloudFlare Global API Key，CloudFlare的登录邮箱和一枚在Cloudflare托管的域名
```
wget -N --no-check-certificate https://raw.githubusercontent.com/wanyunr/package/main/script/acme1key.sh && bash acme1key.sh
```