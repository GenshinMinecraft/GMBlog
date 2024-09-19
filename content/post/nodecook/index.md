---
title: 贡献 Nodecook 测试后端
description: 不为别的，就为了开源的精神
date: 2024-03-02
slug: nodecook
image: TUAPI-EEES-CC--961089562.jpg
categories:
    - Main
    - Linux
---

# 贡献 Nodecook 测试后端

本文由 `High Ping Network` 的小伙伴 GenshinMinecraft 进行编撰，首发于 [本博客](https://blog.c1oudf1are.eu.org)

## 前言

Nodecook 是一位论坛老哥 @dsa231sd 开发的全球 ping 检测网站

详情可以参考: [爆肝两个月，做了一个全球 ping 检测网站！贡献节点，让你的吃灰小鸡发光发热！](https://www.nodeseek.com/post-74548-1)

如果你曾经使用过 Itdog、Pingpe 等类似的服务，那么 Nodecook 就是类似于前两个站点的服务

不同于 Itdog 等服务，Nodecook 让全世界的用户**都可以接入他们的设备来成为测试节点之一**，供全球使用

现在，Nodecook 还是一个尚未完善的雏形，但是我相信，在**开源**之力的推动下，会变得更好！

你至少需要以下的东西来为 Nodecook 贡献测试后端: 
1. 一个邮箱 (有人没有?)
2. 一台机器 (可以是任何地区的机器，有网络连接即可，IPv4/6 均可)
3. 一个内网穿透服务 (如果你有稳定的公网 IP，可以不需要)
4. 一份乐于助人、热爱开源的心

你需要注意的是: 
1. 他人可以获取你设备的 IP 地址
2. 目前界面仅适配了 PC 端，手机端开发者说正在适配

## 步骤

## 获取 API 令牌

打开[官网](https://www.nodecook.com)，右上角登录，可选 邮箱/ Github / Google 等，邮箱登陆需要在邮箱内获取登录链接

登录后，后台转到 [API 令牌](https://www.nodecook.com/zh/dashboard/apikey)

获取到自己的令牌后，保存备用，格式为 UUID

该令牌是为了验证该后端为谁的

## 配置后端

### Docker 

推荐使用 Docker 来运行，但**仅支持 AMD64 架构**，其他架构请参考下文

安装 Docker: 

```
curl -fsSL https://test.docker.com -o test-docker.sh  
sudo sh test-docker.sh
```

运行 Docker 容器:

```
docker run -d \
	--user=root \
	--name nodecook-agent \
	-e NCA_API_KEY=[your_api_key] \
	-e NCA_PORT=[port]
	-e NCA_ENDPOINT=[url]
	--restart=always \
	--network=host \
	ghcr.io/nodecook/agent
```

- `NCA_API_KEY` 部分是上文获取到的 API 令牌
- `NCA_PORT`  部分为后端监听的端口
- `NCA_ENDPOINT` 为访问至后端的 URL，格式为: `http://[IP/DOMAIN]:[PORT]`

请注意，如果你的机器为 NAT 或者没有公网 IP，请记得配置好 FRP 等内网穿透/端口转发服务

当你配置内网穿透/端口转发服务时，请记得要把 `NCA_ENDPOINT` 改成对应的 URL

### 编译二进制并运行

当你的架构不是 AMD64 或无法使用 Docker 时，可以采用下文方法编译并运行

本文以 Debian 11 为例，其他系统请对应更改命令

安装环境: 
```bash
apt install libssl-dev cargo
```

克隆仓库: 
```bash
git clone https://github.com/nodecook/agent.git && cd agent
```

开始编译: 
```
cargo build --release --bin nodecook-agent
```

等待几分钟，编译就完成了

出来的二进制文件应该在 `./target/[架构]/nodecook-agent`，将其复制到 `/usr/bin/` 目录下即可

运行:

```
nodecook-agent -p [NCA_PORT] -a [NCA_API_KEY] -e [NCA_ENDPOINT] --debug
```

- `NCA_API_KEY` 部分是上文获取到的 API 令牌
- `NCA_PORT`  部分为后端监听的端口
- `NCA_ENDPOINT` 为访问至后端的 URL，格式为: `http://[IP/DOMAIN]:[PORT]`

请注意，使用命令行运行时，需要配置保活等服务，可以使用 Screen，[教程参考](https://blog.c1oudf1are.eu.org/p/screen/)

## 配置完成

配置完成后，你应该可以在[节点管理](https://www.nodecook.com/zh/dashboard/node)找到自己刚才新加的节点，

### 关于广告

你可以在[广告投放](https://www.nodecook.com/zh/dashboard/advertise)配置在你的测速节点右边展示的内容，这是你作为贡献者的权利，但请注意，投放广告需要审核！

## 小结

添加节点差不多就到这里了，其他功能可以自行玩玩，不赘述了

欢迎加入 High Ping 大家庭:
- [官网](https://highp.ing)
- [Blog](https://blog.c1oudf1are.eu.org)
- [@HighPingNetwork](https://t.me/HighPingNetwork)
- [@HighPingChat](https://t.me/highpingchat)