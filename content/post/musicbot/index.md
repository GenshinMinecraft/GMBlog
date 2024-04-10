
---
title: Yukki Music Bot 的部署
description: Telegram 淫帕 Bot！
date: 2024-01-08
slug: musicbot
image: YukkiMusicBot.png
categories:
    - Main
    - Free
---

# Yukki Music Bot 的部署

本文由 `High Ping Network` 的小伙伴 Lemonawa 进行编撰，首发于 [本博客](https://blog.highp.ing)

## 环境准备

示例系统：Debian 11 x64

此外，你需要准备一个用于播放音乐的Telegram账号（助理账户）和一个Telegram Bot（可在[@BotFather](https://t.me/botfather)处创建Bot），然后把这两个账号拉进一个群（作为Log群）

连接上ssh，开始操作：

```bash
#先更新下软件源
sudo apt update && sudo apt upgrade -y
#安装一些必要的包
sudo apt install python3-pip ffmpeg git curl -y
#更新一下pip
sudo pip3 install -U pip
#安装Node.js
curl -fssL https://deb.nodesource.com/setup_19.x | sudo -E bash - && sudo apt-get install nodejs -y && npm i -g npm
```

## 安装

```bash
#把代码克隆下来
git clone https://github.com/notreallyshikhar/YukkiMusicBot &&  cd YukkiMusicBot
#安装必要的pip包
pip3 install -U -r requirements.txt
```

## 配置

用你喜欢的方式（如`vim`/`nano`）打开`.env`，配置以下内容：

```env
STRING_SESSION = #从@yukkistringbot获取（助理账户）
API_ID = #从my.telegram.org获取（主账户）
API_HASH = #从my.telegram.org获取（主账户）
BOT_TOKEN = #从botfather获取token（主账户）
MONGO_DB_URI = #从mongodb.com获取
LOG_GROUP_ID = #Log群组的ID
MUSIC_BOT_NAME = #给自己的bot取个名字
OWNER_ID = #主账户的ID
```

## 启动

配置守护进程：

```systemd
cat <<'TEXT' > /etc/systemd/system/musicbot.service
[Unit]
Description=YukkiMusicBot daemon
After=network.target

[Install]
WantedBy=multi-user.target

[Service]
Type=simple
WorkingDirectory=/root/YukkiMusicBot
ExecStart=/usr/bin/bash /root/YukkiMusicBot/start
Restart=always
TEXT
```

```shell
#启动
systemctl start musicbot
#设置开机自启
ystemctl enable musicbot
```

欢迎加入 High Ping 大家庭:
- [官网](https://highp.ing)
- [Blog](https://blog.highp.ing)
- [@HighPingNetwork](https://t.me/HighPingNetwork)
- [@HighPingChat](https://t.me/highpingchat)