---
title: 五秒之内，我要拿到 IP 的全部信息 | IP-Hacker 简介 & 使用方法
description: 霸道 Hacker 爱上我
date: 2025-06-25
slug: hackerip
image: https://img.genmin.icu/p/hackerip/image-4.png
categories:
    - Main
    - Rust
    - Linux
---

# 五秒之内，我要拿到 IP 的全部信息 | IP-Hacker 简介 & 使用方法

又是一日闲来无事，写了一个 CLI 友好的 IP **地址信息批量检测工具**

下面是相关的链接:
- Github Repo: <https://github.com/rsbench/IP-Hacker>
- TG Channel: <https://t.me/rsbench>
- TG Chat: <https://t.me/rsbench_chat>
- Blog: https://c1oudf1are.eu.org/p/hackerip

它可以干什么？

在五秒之内获取多达 50 个 IP 信息服务商的所有数据，包括但不限于:
- ASN
- ASN Name
- Location (Country, Region, City)
- Lat & Lon
- Risk Score
- Risk Tags
- ...

相比于一般的 Bash IP 检测脚本，有何优势？
- `速度超快`: **Powered By RUST!**，别问，问就是比 Bash 处理快 (尽管瓶颈还是在网络请求) \
    除开网络请求，处理 100 个 IP 信息只需要 6ms (包括解析、输出、格式化)
- `支持服务商多`: 列表就不列出来了，支持的都在 [Readme.md](https://github.com/rsbench/IP-Hacker/blob/main/README.md) 列出来了
- `CLI 程序 / 用户界面友好`: 有两种输出格式，**Json 输出**可传递给其他程序继续处理；**表格输出**为默认，便于用户阅读；既可作为其他项目依赖，也可直接调用
- `便于拓展`: 只要有一点点的编程基础，就可以为本项目贡献各种 API，相关的请往下看
- `可自定义程度高`: 支持自定义输出格式 / 列表
- `多平台支持`: 由于使用编译型语言，可以简单地实现**跨平台支持**，不像 Bash 脚本仅 Linux，还需要很多依赖
- ... 总之就是很多


先来点图:

![alt text](<https://img.genmin.icu/p/hackerip/2025-06-24 04-49-49.gif>)

![alt text](https://img.genmin.icu/p/hackerip/image.png)

![alt text](https://img.genmin.icu/p/hackerip/image-1.png)


## 安装

### 一键脚本

```bash
bash <(wget -qO- -o- https://raw.githubusercontent.com/rsbench/IP-Hacker/refs/heads/main/install.sh)
```

仅支持 Linux，且特殊发行版有概率不正常

安装到本地的 `./IP-Hacker`

### Binary 安装

安装非常简单，只需要下载一个 Binary 可执行文件即可:

在 [Github Release](https://github.com/rsbench/IP-Hacker/releases/tag/latest) 下载

![alt text](https://img.genmin.icu/p/hackerip/image-2.png)

关于 Binary 的选择: 

`Windows x86_64` 直接选择 `IP-Hacker.exe`

`Macos` 请根据自己的芯片选择:
- `IP-Hacker-macos-amd64`
- `IP-Hacker-macos-arm64`

`Linux` 编译架构众多，基本命名为: `IP-Hacker-linux-[ARCH]-[RUNTIME]`

架构我就不说了，关键是 Runtime (也就是对应平台特性 / 依赖库)

对于正常发行版 (如 Ubuntu / Debian 新版本)，直接选择带有 `gnu` 后缀的即可

对于不使用 `Glibc` 的发行版 (如 OpenWrt / Alpine)，直接选择带有 `musl` 后缀的即可

当然，任意发行版均可运行带有 `musl` 后缀的 Binary

## 使用

详细列表可以使用 `--help` 参数查看

```
IP tools used by Russia's big hackers

Usage:

Options:
  -a, --all              Show All Information
      --provider         Show Provider Name
      --ip               Show IP Address
      --asn              Show ASN
      --isp              Show ISP Name
      --country          Show Country
      --region           Show Region
      --city             Show City
      --coordinates      Show Coordinates
      --time-zone        Show Time Zone
      --risk             Show Risk Score
      --tags             Show Risk Tags
      --time             Show Processing Time
  -s, --set-ip <SET_IP>  IP Address
      --cls              No CLS
      --no-logo          No Logo
      --no-upload        No Upload
      --logger           No Logger Output
      --json             Json Output
  -h, --help             Print help
  -V, --version          Print version
```

其中，从 `--provider` 到 `--time` 参数都是用于设置输出的列，一个参数对应一个列，如果不手动指定则默认为 `provider`、`asn`、`country`、`region`与`city`

`--set-ip` 可以指定查询的 IP，但是只有部分服务商支持 (当然也有只能指定 IP 查询的服务商)

`--cls` 可以在执行前先将屏幕清空

`--no-logo`: 不打印 `IP-Hacker` Ascii Logo

`--no-upload`: 不上传统计信息与 Pastebin，目前 Pastebin 暂未实现，统计信息仅为调用次数，不会读取任何用户机器相关信息

`--json`: Json 输出

### Demo

什么也不带，默认输出:

```bash
./IP-Hacker
```

输出所有支持的信息 (若终端字符较大可能显示不全 / 显示出错):

```bash
./IP-Hacker --all
```

测试指定 IP:

```bash
./IP-Hacker --set-ip 1.1.1.1
```

输出指定栏目:

```bash
./IP-Hacker --provider --ip --country
```

... 其余请自行组合

### Json

使用 `--json` 参数可以输出所有检测项目的 Json 信息:

```bash
./IP-Hacker --json
```

比如传送到 `jq` 美化输出:

```bash
./IP-Hacker --json | jq
```

![alt text](https://img.genmin.icu/p/hackerip/image-3.png)

当然，也可以传送给其他语言，比如 Python

```python
import subprocess
import json

def run_and_parse_ip_hacker():
    command = ["./IP-Hacker", "--json"]
    print(f"正在执行命令: {' '.join(command)}")
    print("-" * 30)
    try:
        result = subprocess.run(
            command,
            capture_output=True,
            text=True,
            check=True,
            encoding='utf-8'
        )
        json_output = result.stdout
        try:
            data = json.loads(json_output)
            print("发现以下IP地址信息：")
            for item in data:
                if item.get("success"):
                    provider = item.get("provider", "N/A")
                    ip = item.get("ip", "N/A")
                    print(f"服务商: {provider:<25} IP 地址: {ip}")
        except json.JSONDecodeError:
            print("错误：无法解析命令返回的JSON数据。")
            print("原始输出：")
            print(json_output)
    except FileNotFoundError:
        print(f"错误：程序 '{command[0]}' 未找到。")
        print("请确保该程序在当前目录中，并且您有执行权限。")
        print("您可能需要先运行 'chmod +x ./IP-Hacker' 来添加执行权限。")
    except subprocess.CalledProcessError as e:
        print(f"错误：命令执行失败，返回码 {e.returncode}")
        print("错误信息：")
        print(e.stderr)

if __name__ == "__main__":
    run_and_parse_ip_hacker()
```


它会输出:

```
正在执行命令: ./IP-Hacker --json
------------------------------
发现以下IP地址信息：
服务商: Baidu                     IP 地址: 46.232.60.204
服务商: Biantailajiao.com         IP 地址: 46.232.60.204
.... More
```

## 贡献

如果你有一定的 Rust 基础，并且想要为此项目贡献脚本，那么请看:

你只需要关注 [`src/ip_check`](https://github.com/rsbench/IP-Hacker/tree/main/src/ip_check) 文件夹内的东西即可

其中，`script` 文件夹为脚本的主要存放地方

`ip_result.rs` 主要定义了 `IpResult` 结构体，任何脚本都需要返回一个结构体来传输数据

`mod.rs` 主要定义了 Trait 与批量检测的实现，写脚本主要就是写一个能实现 `IpCheck` Trait 的空结构体

具体可参考[这一脚本](https://github.com/rsbench/IP-Hacker/blob/main/src/ip_check/script/ip_lark_com_ipstack.rs)，它是这之中写的比较规范的之一

### 具体流程

新建一个 `.rs` 文件在 `script` 目录下，一般命名为 API 域名，点号换成下划线，如 `ipinfo_io.rs`

在其中定义一个公共的结构体:

```rust
pub struct IpInfo;
```

结构体名称为服务商名称

随后实现测试的函数 (即为该结构体实现 IpCheck Trait):

```rust
#[async_trait]
#[async_trait]
impl IpCheck for IpInfoIo {
    async fn check(&self, ip: Option<IpAddr>) -> Vec<IpResult> {
        todo!()
    }
}
```

代码具体实现请看参考脚本，基本流程如下:

- 判断是否传入了 IP (Option)，有的脚本仅支持指定 IP / 本机 IP，如果为 Some 则为指定 IP，None 为本机 IP
- 如果该脚本不支持本机 / 指定 IP，则用 `not_support_error` 函数直接传出
- 如果支持，则继续该逻辑
- 先判断 API 是否支持 IPv4 / 6 双栈，若支持则创建两个 Handles 同时处理 (指定 IP 默认即可，让 Reqwest 决定)
- 收集 Handles 传出的数据，进行必要的格式化，返回即可

中间的处理逻辑请自行编写，创建 Reqwest Client 务必使用 `create_reqwest_client` 函数

具体参考示例脚本即可，不赘述了

## 关于

我们目前非常需要新的 API，不论是 PR 还是仅提供 API，都可以通过下面的方式找到我们

- Github Repo: <https://github.com/rsbench/IP-Hacker>
- TG Channel: <https://t.me/rsbench>
- TG Chat: <https://t.me/rsbench_chat>

也可以进到我们的 TG 频道和群聊获取最新信息