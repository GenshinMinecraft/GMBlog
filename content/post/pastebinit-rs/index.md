---
title: PastebinIt-rs | 在终端中 Paste 任何东西
description: Just Paste It!
date: 2025-07-23
slug: pastebin-rs
image: https://img.genmin.icu/p/pastebin-rs/image.png
categories:
    - Main
    - Rust
---

# PastebinIt-rs | 在终端中 Paste 任何东西

[<-前往本博客获取更好阅读体验->](https://c1oudf1are.eu.org/p/pastebin-rs/)

## 前言

又是一日闲来无事

由于一点点需求需要在终端用到 Pastebin 服务，但是复制出来再 Paste 上去非常不优雅

找到了 [pastebinit](https://github.com/skorokithakis/pastebinit) 但已经十年没更新，且用的是 Python

那么有什么理由不重写呢？

Github: <https://github.com/GenshinMinecraft/pastebinit-rs>

欢迎来点 Star

## 安装

用一键脚本即可:

```bash
bash <(wget -qO- -o- https://ghfast.top/https://raw.githubusercontent.com/GenshinMinecraft/pastebinit-rs/refs/heads/main/install.sh)
```

卸载也很简单:

```bash
bash <(wget -qO- -o- https://ghfast.top/https://raw.githubusercontent.com/GenshinMinecraft/pastebinit-rs/refs/heads/main/install.sh) uninstall
```

该脚本会自动检测 Linux 架构并下载到 `/usr/bin/pastebinit-rs`

若不希望安装到系统，也可以到 [Release](https://github.com/GenshinMinecraft/pastebinit-rs/releases/tag/latest) 下载最新的 Binary

当然，本程序也可以从 Cargo 安装:

```bash
cargo install pastebinit-rs
```

## 使用方法

```
Just Paste It! A simple CLI tool to paste text to various pastebin services.

Usage: 

Options:
  -s, --server <SERVER>  Select the pastebin provider [default: debian] [possible values: debian, centos]
  -f, --file <FILE>      Select file to upload (Ignored stdin) [default: ]
  -t, --title <TITLE>    Set pastebin title [default: ]
  -p, --private          Set pastebin visibility
  -r, --raw              Show RAW Text link
  -h, --help             Print help
  -V, --version          Print version
```

该软件有三种工作方式，分别为`管道符号输入`、`终端输入`和`文件输入`

- 管道符号输入
    ```bash
    cat ./test.txt | pastebinit-rs
    ```
- 终端输入
    ```bash
    pastebinit-rs
    Run on a terminal, try to type something and end by `EOF`!
    Hello, world! (text.txt 的文件内容)
    EOF
    ```
- 文件输入
    ```bash
    pastebinit-rs -f ./test.txt
    ```

上面的三种方式理论上是等价的，只要 text.txt 的内容相同，上传到 Pastebin 的内容也是相同的

你可以继续添加参数:

- `-s` 或 `--server`: 选择 Pastebin 服务，可选: `debian` / `centos`，默认值为 `debian`
- `-t` 或 `--title`: 设置 Pastebin 的标题，默认值为空，并不所有的 Pastebin 服务都支持
- `-p` 或 `--private`: 设置 Pastebin 的可见性，默认值为公开，并不是所有的 Pastebin 服务都支持
- `-r` 或 `--raw`: 显示 RAW Text 链接，默认值为 false

若成功上传，程序会直接输出 Pastebin 的链接，无任何附加内容

若失败则会输出错误信息，并以 `1` 的状态码退出

## 结尾

就这样吧，后面会加其他的 Pastebin 服务的，有无需鉴权的 Pastebin 服务也可以贴在下方，THX

Github: <https://github.com/GenshinMinecraft/pastebinit-rs>

欢迎来点 Star
