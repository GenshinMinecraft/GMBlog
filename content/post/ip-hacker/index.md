---
title: IP-Hacker | 额螺丝带骇客所使用的 IP 检测工具 | Usage & Docs
description: Json 这招太狠了
date: 2025-06-06
slug: ip-hacker
image: image-4.png
categories:
    - Main
    - Rust
---

# IP-Hacker | 额螺丝带骇客所使用的 IP 检测工具 | Usage & Docs

[<-前往本博客获取更好阅读体验->](https://c1oudf1are.eu.org/p/ip-hacker/)

## 前言

又是一日闲来无事，看见之前写的项目 [RSBench](https://github.com/rsbench/rsbench) 过于臃肿

所以想把其中的 IP 地址检测工具给提取出来单独写

这小玩意优点还挺多的:
- 超高性能: 1sec 不到解决 IPv4 & IPv6 所有 IP 服务商的检测
- 低占用: Binary 体积不超过 1.5MB，可集成与各种脚本内部
- 多输出: 面向人类可阅读的**表格模式** / 面向其他应用的 **Json 输出**。可自定义表格格式，Json 便于集成
- 便于拓展: 封装了一系列的 API，只要你有一丁点编程基础就可以为本项目贡献，拓展一个 Provider 仅需 5mins
- FULL RUSTY! (THAT IS THE MOST IMPORTANT)

写出来就是为了替代传统的 Bash 脚本，那些玩意可太炸了

## Demo

基础运行:

![alt text](https://img.genmin.icu/p/ip-hacker/image.png)

包含所有项目:

![alt text](https://img.genmin.icu/p/ip-hacker/image-1.png)

Json 输出:

![alt text](https://img.genmin.icu/p/ip-hacker/image-2.png)

自定义组合:

![alt text](https://img.genmin.icu/p/ip-hacker/image-3.png)

## 安装

由于暂时没写一键脚本，所以现在还需要从 [Github Release](https://github.com/rsbench/IP-Hacker/releases/tag/latest) 下载 Binary 执行

对于一般的 Linux amd64 机器，直接使用以下命令即可:

```bash
wget https://github.com/rsbench/IP-Hacker/releases/download/latest/IP-Hacker-linux-x86_64-musl -O IP-Hacker
chmod +x ./IP-Hacker
./IP-Hacker
```

## 反馈 & 支持

有任何需要新增的 Providers，或者任何 Bug，可以前往我们的各种平台反馈:

- TG Channel: <https://t.me/rsbench>
- TG Chat: <https://t.me/rsbench_chat>
- Github Issue: <https://github.com/rsbench/IP-Hacker/issues>

如果你拥有一定的开发经验，并且希望为此项目贡献力量，请在群里一起交流！

WE LOVE OPEN-SOURCE!