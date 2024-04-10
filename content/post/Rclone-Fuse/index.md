---
title: Rclone挂载以及Fuse问题解决
description: Fuse一直是Rclone挂载的头疼问题呢~
date: 2023-07-21
slug: Rclone-Fuse
image: logo_on_light__horizontal_color.svg
categories:
    - Main
    - Rclone
---

# Rclone挂载以及Fuse问题解决

本文由 `High Ping Network` 的小伙伴 GenshinMinecraft 进行编撰，首发于 [本博客](https://blog.highp.ing)

## 前言
关于Rclone添加储存以及文件复制的问题可以参考这一篇博客：[VPSLOG](https://vpslog.org/blog/%E4%BD%BF%E7%94%A8-rclone-%E5%9C%A8-nas-%E5%92%8C-google-drive-%E4%B9%8B%E9%97%B4%E5%A4%8D%E5%88%B6%E6%96%87%E4%BB%B6/)，这里很好地写出了添加储存的过程。本文不再赘述。

## 挂载教程
### 挂载前注意事项：
1. 请确认即将挂载的网盘存在于Rclone的`config.conf`中；
2. 请确认即将挂载的目录已存在并为空；
3. 请确认使用的机器（VPS,NAS,Router等）能连接到所即将挂载的网盘（如国内机器无法连接谷歌云盘）

***确认完之后即可开始挂载！***

基本的挂载命令类似于：
```bash
rclone mount 网盘设定名称:网盘内路径 挂载目录 --copy-links --no-gzip-encoding --no-check-certificate --allow-other --allow-non-empty --umask 000
```
**不同的网盘也许有对应的各种选项，但是上面的是通用命令，请查阅[官方文档](https://rclone.org/docs/)！**

比如我将要挂载一个名为 od 的网盘到 /root/od ：
```
rclone mount od: /root/od --copy-links --no-gzip-encoding --no-check-certificate --allow-other --allow-non-empty --umask 000 
```

如果报错有关`Fuse`，请看下面的解决方法

当需要后台运行rclone挂载时`（默认为在终端挂载，且不可停止）`，可以在挂载命令后加上 `--daemon` 以作为daemon程序挂载。

## 解决Fuse问题
一般报错内容为：
```
2020/07/17 04:44:20 Fatal error: failed to mount FUSE fs: fusermount: exec: "fusermount": executable file not found in $PATH
```
这是因为未安装fuse软件包导致的，解决方法非常简单，使用包管理器安装Fuse：
```bash
yum install fuse
apt install fuse
```
请根据自己的系统选择对应的包管理器。

## 解决已安装Fuse的问题
当以上面的方法安装Fuse之后，如果还发生报错，请执行：
```
ln /usr/bin/fusermount /usr/bin/fusermount3
```
因为rclone默认寻找的是`fusermount3`，而软件包默认安装至`fusermount`。这条命令将创建一个`"快捷方式"`，再次运行挂载命令即可。

欢迎加入 High Ping 大家庭:
- [官网](https://highp.ing)
- [Blog](https://blog.highp.ing)
- [@HighPingNetwork](https://t.me/HighPingNetwork)
- [@HighPingChat](https://t.me/highpingchat)