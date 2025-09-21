---
title: RSBench | 送给 MJJ 的新年礼物 | 最好的小鸡基准测试工具 | 2s 测试流媒体与 IP
description: BUG+++
date: 2025-01-31
slug: rsbench
image: https://img.genmin.icu/p/rsbench/img300.webp
categories:
    - Main
    - Rust
    - Linux
---

# RSBench | 送给 MJJ 的新年礼物 | 最好的小鸡基准测试工具 | 2s 测试流媒体与 IP

又是一日闲来无事，又是与朋友一起写了个服务器性能基准测试工具

下面是相关的链接:
- Github Repo: <https://github.com/rsbench/rsbench>
- Docs: <https://rsbench.github.io/rsbench>
- TG Channel: <https://t.me/rsbench>
- TG Chat: <https://t.me/rsbench_chat>
- Blog: https://c1oudf1are.eu.org/p/rsbench

## 简介

RSBench 是一个用 Rust 语言编写的、高性能的、快速的、拥有美观输出的**设备性能基准测试工具** ~~(定语是不是有点多)~~

好像很牛逼的样子，那么他有什么功能呢？
- 设备基本信息输出
- 设备性能测试 (CPU / MEM / DISK 等)
- 网络速度测试
- IP 地址详细信息检测
- 流媒体解锁测试
- ......

目前还在持续更新中

由于其发行二进制可执行文件的性质，可以在几乎所有日常所见到的平台上执行，而不用依赖任何其他软件 (GLIBC等就算了)

比如完美支持: 软路由 / 安卓设备 / Windows......

## 为什么要写这一个玩意

本文开头已经说了，很简单，因为闲来无事，寒假太漫长了

还有现在 MJJ 常用的测试工具多为 Bash 脚本类型，强依赖于其他二进制可执行文件 (比如 curl / wget / sysbench)，即使适配十分完善，但仍有部分极端环境无法正常运行

所以就写了，嗯

## 如何使用？

这很简单，详细的教程可以看我们的[文档](https://rsbench.github.io/rsbench)

对于最常见的 x86_64 Linux 常规发行版 (拥有 GLIBC 的)，直接执行下面的命令即可:
```bash
wget -O ./rsbench "https://ghfast.top/https://github.com/rsbench/rsbench/releases/download/latest/rsbench-linux-x86_64-musl" && chmod +x ./rsbench
./rsbench -ibtu
```

如有其他平台需求，也一样简单

只需在 [Release](https://github.com/rsbench/rsbench/releases/tag/latest) 界面选择对应架构的可执行文件下载并执行即可

## 模块化

本项目目前分为四个模块
- INFO: 输出系统信息
- BENCH: 系统性能测试
- TUNE: 包含一些小功能，比如 IP 测试与 Speedtest
- UNLOCK: 互联网服务解锁测试，用于测试用户是否可以正常使用互联网服务，如流媒体、游戏平台等

我自认为这个项目的模块化处理非常好，基本上可以马上上手使用甚至开发

每个模块对应的参数为其首字母 (ibtu)，所以全量运行的参数就为 `-ibtu`

当然其中还有很多细分的参数，那就请参照[文档](https://rsbench.github.io/rsbench)啦！

## Demo

来点截图吧

INFO:

![1.png](https://img.genmin.icu/p/rsbench/1.png)

BENCH:

![](https://img.genmin.icu/p/rsbench/2.png)

TUNE:

![](https://img.genmin.icu/p/rsbench/3.png)

UNLOCK:

![](https://img.genmin.icu/p/rsbench/4.png)

## 贡献

我们现在急须一些开发者来编写 IP 检测与流媒体检测的脚本，编写非常简单，我们也提供了非常多的工具用于简化开发流程

~~说起来这也是我写的第一个代码量比较大的项目了~~
![](https://img.genmin.icu/p/rsbench/5.png)

详情请看这不存在的文档 (还没开始写)

同时也欢迎广大 MJJ 提供宝贵建议与反馈 Bug

请到 TG 群组或 ISSUE:
- TG Channel: <https://t.me/rsbench>
- TG Chat: <https://t.me/rsbench_chat>
- ISSUE: https://github.com/rsbench/rsbench/issues