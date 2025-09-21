---
title: 2025 年了，我的家里云发生了什么变化？
description: 化繁为简，渐渐减简
date: 2025-04-25
slug: 2025homecloud
image: https://img.genmin.icu/p/2025homecloud/image-6.png
categories:
    - Main
    - Linux
---

# 2025 年了，我的家里云发生了什么变化？

[<-前往本博客获取更好阅读体验->](https://c1oudf1are.eu.org/p/2025homecloud/)

## 前言

前情提要请看: <https://c1oudf1are.eu.org/p/homecloud/>

时隔了大概一年半，家里云机器与服务有很大的变迁，遂文之

总体来说，家里云从 3台 变成了 4台 又变回了 2台，现存仅有 `AX6s` 与 `R4s`

详细配置就不介绍了

## Redmi AX6s

时隔了这么久还是这个垃圾路由，现在已经刷回了官方最新固件，当作**拨号+AP** 使用

服务是没有的，只有最基础的 AP / DHCP / NAT 功能，Wi-Fi 性能还是属于千兆级别

网线拨号有大约 950 MBPS，暂时还不想换

## R4s

R4s 目前运行着 DietPi 系统，其他家里云的服务早已迁移到这里

CPU 占用率常年不过 10%，内存约 30%

### HomeBox

个人非常喜欢的一个*内网测速软件*，可以用浏览器快速测试，而不用繁琐的开终端拉 iperf 

Github: <https://github.com/XGHeaven/homebox>

![From Github](https://img.genmin.icu/p/2025homecloud/image.png)

~~虽然用到的次数很少就是了~~

### VaultWarden

密码储存库常客，已经稳定运行多年了，是我自部署服务里使用率最高的

Github: <https://github.com/dani-garcia/vaultwarden>

自从更新了 Web 新版 UI 之后就很好看了，手机端我一般使用 [KeyGuard](https://github.com/AChep/keyguard-app)，同样好看

![alt text](https://img.genmin.icu/p/2025homecloud/image-1.png)

就是不知道为什么 Chrome 插件经常性掉登录，希望优化下

### Gitea

自托管 Git 服务器，现在被我用作备份的东西，你别说 Git 当备份真不错

Github: <https://github.com/go-gitea/gitea>

并没有托管多少 Git 仓库在上面，写了一堆自动脚本以定时备份提交到上面

### Uptime Kuma

定时监控，用的次数也不多

![alt text](https://img.genmin.icu/p/2025homecloud/image-2.png)

Github: <https://github.com/louislam/uptime-kuma>

主要接了个 Telegram Bot 告警而已

### Nexterm

在线 SSH，用于外网应急用

Github: <https://github.com/gnmyt/Nexterm>

![alt text](https://img.genmin.icu/p/2025homecloud/image-3.png)

比起这个，我挺喜欢他的 UI 的，比其他的 SSH 工具都要好，就是功能不太全面

### Alist

大名鼎鼎，不必多说

Github: <https://github.com/AlistGo/alist>

![alt text](https://img.genmin.icu/p/2025homecloud/image-4.png)

挺不喜欢在线看剧的，都是下载到硬盘里面接电视

### Clash-Mihomo

Clash Meta 内核，并不作为路由代理，而是作为一些需要代理访问的服务以及应急

Github: <https://github.com/MetaCubeX/mihomo>

### WakaPi

自托管统计服务，兼容 WakaTime

Github: <https://github.com/muety/wakapi>

最近代码写的不多，所以也很少用

![alt text](https://img.genmin.icu/p/2025homecloud/image-5.png)

## 小结

差不多就这么多了，相比于 2023 年的服务数量少了一大截

主要是因为有很多服务对我来说都是**伪需求**，只有部署的时候用过一次两次

即使这样，就连现在的服务我也没怎么用