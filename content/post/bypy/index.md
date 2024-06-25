---
title: 在命令行使用百度网盘 -- bypy 的使用
description: 下载一个晚上就下了 3GB?
date: 2024-04-20
slug: bypy
image: TUAPI-EEES-CC--1613297185.jpg
categories:
    - Main
    - Linux
---

# 在命令行使用百度网盘 -- bypy 的使用

本文由 `High Ping Network` 的小伙伴 GenshinMinecraft 进行编撰，首发于 [本博客](https://blog.highp.ing)

## 前言

[bypy](https://github.com/houtianze/bypy) 是一个**开源的**、**基于 Python** 的第三方百度网盘客户端，使用了官方提供的 OpenAPI

为什么要使用它呢？最近有点需求要将百度网盘东西全下载下来，那速度长期开着电脑肯定是不可能的，于是需要一个可以在服务器使用的百度网盘客户端进行离线下载到本地

需要注意的是，bypy 并**不会加速你的下载速度**，使用 bypy 的下载速度还是取决于你的账号等级

## 使用

废话不多说，使用就行了

### 安装

安装非常简单，仅需要拥有 Python3 环境即可，记得装个 Pip

```
pip install bypy 
# Or pip install bypy -i https://pypi.tuna.tsinghua.edu.cn/simple
```

### 登录

安装完后，在命令行执行: 

```
bypy info
```

他会输出: 

```
Please visit:
https://openapi.baidu.com/oauth/2.0/authorize?client_id=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
And authorize this app
Paste the Authorization Code here within 10 minutes.
Press [Enter] when you are done
```

用浏览器打开其中的链接以登录

![alt text](image.png)

登录完后获取授权码，粘贴到终端并回车以继续

完成后，就会显示百度网盘的已用空间与剩余空间

```
Quota: 2.007TB
Used: 2.258GB
```

### 基本使用方法

请注意: 由于百度网盘 OpenAPI 限制，bypy 只能获取 `/我的应用数据/bypy` 下的文件，并**自动把这一目录认为 / 根目录**，如果有需要下载需求，请事先将文件移动到此目录

参数介绍: 

- `--processes`: 多线程 (API 请求多线程)
- `-v`: 进度显示 (推荐使用)
- 

#### 列出文件

输入: 

```
bypy list
```

输出: 

```
/apps/bypy ($t $f $s $m $d):
D ESP32 0 2024-04-20, 10:47:00 
```

输入: 

```
bypy list ESP32
```

输出: 

```
/apps/bypy/ESP32 ($t $f $s $m $d):
D .vscode 0 2024-04-20, 10:47:01 
D Main 0 2024-04-20, 10:46:59 
F ESP32_GENERIC-20240222-v1.22.2.bin 1737776 2024-04-20, 10:46:55 c3d06da97u91dbc3b4a28d89308e8d06
```

#### 下载文件

##### 下载单文件

输入: 

```
bypy download ESP32/ESP32_GENERIC-20240222-v1.22.2.bin -v
```

输出: 

```
Loading Hash Cache File '/root/.bypy/bypy.hashcache.json'...
Hash Cache File '/root/.bypy/bypy.hashcache.json' not found, no caching
<I> [10:52:35] ESP32_GENERIC-20240222-v1.22.2.bin <- /apps/bypy/ESP32/ESP32_GENERIC-20240222-v1.22.2.bin
[====================] 100% (1.7MB/1.7MB) ETA:  (98kB/s, 17s gone) 'ESP32_GENERIC-20240222-v1.22.2.bin' <== '/apps/bypy/ESP32/ESP32_GENERIC-20240222-v1.22.2.bin' OK
Skip saving Hash Cache since it has not been updated.
```

##### 下载文件夹

输入: 

```
bypy download ESP32/ -v
```

输出:

```
Loading Hash Cache File '/root/.bypy/bypy.hashcache.json'...
Hash Cache File '/root/.bypy/bypy.hashcache.json' not found, no caching
Creating local directory '.vscode'
Creating local directory 'Main'
<I> [10:55:13] ESP32_GENERIC-20240222-v1.22.2.bin <- /apps/bypy/ESP32/ESP32_GENERIC-20240222-v1.22.2.bin
[====================] 100% (1.7MB/1.7MB) ETA:  (101kB/s, 16s gone) 'ESP32_GENERIC-20240222-v1.22.2.bin' <== '/apps/bypy/ESP32/ESP32_GENERIC-20240222-v1.22.2.bin' OK
<I> [10:55:30] .vscode/arduino.json <- /apps/bypy/ESP32/.vscode/arduino.json
[====================] 100% (327.0B/327.0B) ETA:  (245B/s, 1s gone) '.vscode/arduino.json' <== '/apps/bypy/ESP32/.vscode/arduino.json' OK
<I> [10:55:32] .vscode/c_cpp_properties.json <- /apps/bypy/ESP32/.vscode/c_cpp_properties.json
[====================] 100% (48.1kB/48.1kB) ETA:  (31kB/s, 1s gone) '.vscode/c_cpp_properties.json' <== '/apps/bypy/ESP32/.vscode/c_cpp_properties.json' OK
<I> [10:55:35] Main/Main.ino <- /apps/bypy/ESP32/Main/Main.ino
[====================] 100% (159.0B/159.0B) ETA:  (196B/s,  gone) 'Main/Main.ino' <== '/apps/bypy/ESP32/Main/Main.ino' OK
Skip saving Hash Cache since it has not been updated.
```

## 小结

使用还是很简单的，如果你有使用服务器下载文件的需求，建议开一个 [Screen](https://blog.highp.ing/p/screen) 窗口下载，文件再大总有一天能下完的

欢迎加入 High Ping 大家庭:
- [官网](https://highp.ing)
- [Blog](https://blog.highp.ing)
- [@HighPingNetwork](https://t.me/HighPingNetwork)
- [@HighPingChat](https://t.me/highpingchat)
