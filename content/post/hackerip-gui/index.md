---
title: IP-Hacker-GUI 发版 | 更便捷地测试 IP
description: 霸道 Hacker 爱上我
date: 2025-06-30
slug: hackerip-gui
image: https://img.genmin.icu/p/hackerip-gui/image-1.png
categories:
    - Main
    - Rust
    - Linux
---

# IP-Hacker-GUI 发版 | 更便捷地测试 IP

又是一日闲来无事，为 [IP-Hacker](https://github.com/rsbench/IP-Hacker) 项目写了个 GUI 界面

![alt text](https://img.genmin.icu/p/hackerip-gui/image.png)

![alt text](<https://img.genmin.icu/p/hackerip-gui/2025-06-30 11-06-49.gif>)

项目存放于 [IP-Hacker](https://github.com/rsbench/IP-Hacker) 的 `./gui` 目录下

同样地，使用了 Rust Egui 编写，也是本人的第一个 Rust GUI 项目

## 下载

目前只预编译了 `linux amd64` / `windows amd64` / `macos amd64` / `macos arm64` 的 GUI，其他架构不打算支持 GUI

- [linux amd64](https://github.com/rsbench/IP-Hacker/releases/download/latest/linux-x86_64-gnu-with-gui.tar.gz)
- [windows amd64](https://github.com/rsbench/IP-Hacker/releases/download/latest/windows-x86_64-with-gui.zip)
- [macos amd64](https://github.com/rsbench/IP-Hacker/releases/download/latest/macos-amd64-with-gui.tar.gz)
- [macos arm64](https://github.com/rsbench/IP-Hacker/releases/download/latest/macos-arm64-with-gui.tar.gz)

当然，你也可以在 `Release` 下找到带有 `-with-gui` 后缀的压缩包，上面为直达链接

下载解压双击打开 `IP-Hacker-GUI` 即可

## 使用

如果你是从上述链接下载的压缩包并解压，那么不太需要点击 `Choose the exec binary` 来选择 `IP-Hacker` 本体的路径，直接开始测试即可

`Set IP` 字段可以填写待测 IP 地址，如果为空则为本机 IP，点击 `Start Test` 即可开始测试

测试会以流式输出打印到下方表格，点击题头按钮可排序

就这样吧

## 贡献

这玩意写起来还是挺简单的，但可能也有一些我没发现的 Bug，请在以下渠道反馈

- Github Repo: <https://github.com/rsbench/IP-Hacker>
- TG Channel: <https://t.me/rsbench>
- TG Chat: <https://t.me/rsbench_chat>

THANKS！