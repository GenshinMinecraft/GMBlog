---
title: 优雅地使用 Rust 进行 ICMP Ping
description: 又是两个月没碰过博客
date: 2026-07-08
slug: pingpong
image: https://img.genmin.icu/p/pingpong/image-1.png
categories:
    - Main
    - Rust
---

# 优雅地使用 Rust 进行 ICMP Ping

## 前沿

Hi，这里是 GenshinMinecraft

ICMP Ping 是一个广泛的用于测试链路状态的工具，常常被用在网络环境检测上

近期的几个项目，比如 [NodeGet](https://github.com/NodeSeekDev/NodeGet/)，都需要在 Rust 实现 ICMP Ping 的处理

本博客可能会让你认识一个全新的 Ping，如果你对其中 Rust 的实现部分不感兴趣，也可以将本文作为一个科普短文 (为了避免混淆各种 Ping，上文都是以 `ICMP Ping` 指代，下文将直接称为 `Ping`)

还有，我认可很多已经实现了 Ping 的 Crates，让你只需要调用一个函数即可获取延迟，但本文会让你从构造数据包开始实现 Ping

## 一些误区

### Ping 工作于 Layer 3

![alt text](https://img.genmin.icu/p/pingpong/image.png)

很多人 (包括很久以前的我)，一直以为 Ping 工作在 Layer 4

但并非，Ping 工作在 Layer 3，也就是网络层

Layer 4 的协议包括有 TCP、UDP 等，特点是 Layer 4 有 `端口` 的概念，而 Layer 3 没有

### 各种 Ping 的区别

- `ICMP Ping`: 互联网控制消息协议中的 Ping 消息，工作在 Layer 3
- `TCP/UDP Ping`: TCP 和 UDP 的 Ping 服务，通常是以握手连接后发送接受一个包来计算 (TCP)，工作在 Layer 4，需要双方各开启一个端口
- `HTTP Ping`: HTTP 协议，通常是对 HTTP 服务的根目录发送 GET 请求，从开始握手 TCP 连接到返回完成计算，工作在 Layer 7，需要双方各开启一个端口，且对方端口支持 HTTP 协议

Ping 的最大用处是用来测试可访问性，以及访问延迟。本位讲述的是位于 Layer 3 的 ICMP Ping

请不要试图将不同的 Ping 作对比，这是不现实的。一般情况下 (最常见为例)，ICMP Ping < TCP/UDP Ping < HTTP Ping

### Ping 数据包具有大小

ICMP 协议可以想象成一个包裹，Ping 是一个消息，实际内容是其中的数据 (Ping 一般为空)

而在不同系统下，使用 `ping` 命令发送的数据包大小默认都不一样

- Windows: 32Bytes
- Linux/MacOS: 64Bytes

其实我也不知道为啥会这样，但是数据包大小只要不超过所设置的 MTU (一般为 1500) 都不会造成明显的延迟影响，所以在设计时可以直接以 64Bytes 为标准，这不重要

### Ping 需要权限

你可能知道，在各种操作系统下，你都可以随意执行 `ping x.x.x.x` 命令，不管你是什么用户，特权用户还是普通用户

但是，这不代表着任何一个用户的任何一个程序都有权限去发送 Ping

在 Linux 下，一般来说有三种方式，授权用户使用 `ping` 命令

1. 给 `ping` 设置 SUID，这可以让普通用户临时具有 Root 的权限以使用该命令
2. 给 `ping` 设置 CAP_NET_RAW，让其具有创建原始套接字的权力
3. 使用内核参数，允许用户具有创建的权力: `net.ipv4.ping_group_range` (具体可参考 [依云的这篇文章](https://blog.lilydjwg.me/2013/10/29/non-privileged-icmp-ping.41390.html))

只要满足上述任一条件，均可让普通用户使用 `ping` 命令

各个发行版，甚至是同一发行版的不同版本，在实现方面都会有区别

你可以用下面的命令查看你的 Linux 系统是通过什么方式授权你使用 `ping` 命令的:

```bash
$ which ping # 查看 ping 路径
/usr/bin/ping

$ ls -l /usr/bin/ping # 如果输出中包含字母 s，说明 SUID 已开启
-rwsr-xr-x 1 root root 146984 Apr  8  2024 /usr/bin/ping

$ getcap /usr/bin/ping # 如果输出如下，则已设置 CAP_NET_RAW
/usr/bin/ping cap_net_raw=ep

$ cat /proc/sys/net/ipv4/ping_group_range # 如果输出如下，则已用内核参数的方案；如果为 `1 0`，则为禁止
0       2147483647
```

为什么这里扯这么远，因为理所当然的 `ping` 命令让大部分没有经过了解的人都以为发送 Ping 不需要特殊权限

### ICMP Socket 与 Raw Socket

有的时候我也不是很希望解释到这么深入，但是这是有必要的

在 Linux Kernel 3.x 的时候，引入了 ICMP Socket，其作用仅限于发送 ICMP 数据包，越来越多的开发者开始使用 ICMP Socket

你可以想象成 Raw Socket 是可以用 IP 协议创建任何网络连接的东西

而 ICMP Socket 则是只需要自定义消息以及内容，让操作系统包装再处理的东西

上面讲到的 `ping` 权限中，第二种方式则是赋予了创建 Raw Socket 的权限；第三种方式则是赋予了创建 ICMP Socket 的权限

Raw Socket 是一个超级危险的东西，理论上可以操作所有网络连接，所以默认只开放了特权用户和特殊可执行文件。相比之下 ICMP Socket 则可控一点，仅可发送 ICMP 数据包 (但也同样较危险)

### Windows 下的 Ping

Windows 下的 Ping 也具有 Linux 的设计特色，具体如下:

- `ping.exe` 具有特权
- 可以通过 Windows API 免权限收发 ICMP 数据包
- 同样可以通过 Raw Socket 通信，强制要求管理员权限

## 优雅实现

我们的目标是在 Rust 下实现优雅的 Ping，至少需要以下几个目标

- 时钟精确，从开始发送到正确返回，毫秒级计时器
- 跨平台支持 (至少 Windows/Linux/MacOS)
- 权限兼容 (尽量非特权用户也可使用)

### Linux

先来看看 Linux 下的优雅实现

#### ICMP Socket

我们可以先看看最新特性 ICMP Socket 的使用

```toml
[dependencies]
socket2 = "0.6.4"
pnet_packet = "0.35.0"
```

需要两个依赖，前者创建 Socket，后者简化处理 ICMP 包

<details>
<summary>点击展开折叠内容</summary>

```rust
use pnet_packet::Packet;
use pnet_packet::icmp::echo_reply::EchoReplyPacket;
use pnet_packet::icmp::echo_request::MutableEchoRequestPacket;
use pnet_packet::icmp::{IcmpPacket, IcmpTypes};
use socket2::{Domain, Protocol, Socket, Type};
use std::mem::MaybeUninit;
use std::net::{IpAddr, SocketAddr};
use std::time::{Duration, Instant};

fn main() {
    let target_ip: IpAddr = "8.8.8.8".parse().unwrap();
    let socket_addr: SocketAddr = SocketAddr::new(target_ip, 0);

    let socket = Socket::new(
        Domain::for_address(socket_addr),
        Type::DGRAM, // DGRAM 是必要的
        Some(Protocol::ICMPV4),
    )
    .unwrap();

    // 超时
    socket
        .set_read_timeout(Some(Duration::from_secs(3)))
        .unwrap();

    // 64Bytes
    let mut send_buffer = vec![0; 64];
    let mut icmp_packet = MutableEchoRequestPacket::new(&mut send_buffer).unwrap();
    icmp_packet.set_icmp_type(IcmpTypes::EchoRequest);

    // 实际上由系统生成
    icmp_packet.set_identifier(67);
    icmp_packet.set_sequence_number(1);

    let icmp_ref = IcmpPacket::new(icmp_packet.packet()).unwrap();
    let checksum = pnet_packet::icmp::checksum(&icmp_ref);
    icmp_packet.set_checksum(checksum);

    let start = Instant::now();
    socket
        .send_to(icmp_packet.packet(), &socket_addr.into())
        .unwrap();

    let mut recv_buffer = [MaybeUninit::uninit(); 1024];
    loop {
        match socket.recv_from(&mut recv_buffer) {
            Ok((bytes_received, _from_addr)) => {
                let filled_buf = unsafe {
                    std::slice::from_raw_parts(recv_buffer.as_ptr() as *const u8, bytes_received)
                };

                if let Some(icmp_reply) = IcmpPacket::new(filled_buf) {
                    if icmp_reply.get_icmp_type() == IcmpTypes::EchoReply {
                        if let Some(reply_packet) = EchoReplyPacket::new(icmp_reply.packet()) {
                            let actual_id = reply_packet.get_identifier();

                            let end = start.elapsed();
                            println!(
                                "来自 {}: 字节={} 时间={:.2?}ms (实际 Identifier={})",
                                target_ip,
                                bytes_received,
                                end.as_secs_f64() * 1000.0,
                                actual_id
                            );
                            break;
                        }
                    }
                }
            }
            Err(e) => {
                println!("接收失败或超时: {:?}", e);
                break;
            }
        }
    }
}
```

</details>

有几点需要注意的地方，ICMP Socket 的 identifier 不能自主修改，所以设置是无效的。操作系统会帮我们处理好 set_identifier 和校验 identifier

#### Raw Socket

几乎一致，但是需要 `socket2` 依赖加上 `all` feature

```toml
[dependencies]
socket2 = { version = "0.6.4",features = ["all"] }
pnet_packet = "0.35.0"
```

<details>
<summary>点击展开折叠内容</summary>

```rust
use pnet_packet::Packet;
use pnet_packet::icmp::echo_reply::EchoReplyPacket;
use pnet_packet::icmp::echo_request::MutableEchoRequestPacket;
use pnet_packet::icmp::{IcmpPacket, IcmpTypes};
use socket2::{Domain, Protocol, Socket, Type};
use std::mem::MaybeUninit;
use std::net::{IpAddr, SocketAddr};
use std::time::{Duration, Instant};

fn main() {
    let target_ip: IpAddr = "8.8.8.8".parse().unwrap();
    let socket_addr: SocketAddr = SocketAddr::new(target_ip, 0);

    let socket = Socket::new(
        Domain::for_address(socket_addr),
        Type::RAW, // RAW 模式
        Some(Protocol::ICMPV4),
    )
    .unwrap();

    // 超时
    socket
        .set_read_timeout(Some(Duration::from_secs(3)))
        .unwrap();

    // 64Bytes
    let mut send_buffer = vec![0; 64];
    let mut icmp_packet = MutableEchoRequestPacket::new(&mut send_buffer).unwrap();
    icmp_packet.set_icmp_type(IcmpTypes::EchoRequest);

    // 主动设置
    icmp_packet.set_identifier(67);
    icmp_packet.set_sequence_number(1);

    let icmp_ref = IcmpPacket::new(icmp_packet.packet()).unwrap();
    let checksum = pnet_packet::icmp::checksum(&icmp_ref);
    icmp_packet.set_checksum(checksum);

    let start = Instant::now();
    socket
        .send_to(icmp_packet.packet(), &socket_addr.into())
        .unwrap();

    let mut recv_buffer = [MaybeUninit::uninit(); 1024];
    loop {
        match socket.recv_from(&mut recv_buffer) {
            Ok((bytes_received, _from_addr)) => {
                let filled_buf = unsafe {
                    std::slice::from_raw_parts(recv_buffer.as_ptr() as *const u8, bytes_received)
                };

                // RAW 套接字收到的数据包含 20 字节的 IP 头部，需要跳过它才能解析 ICMP
                let ip_header_len = 20;
                if bytes_received > ip_header_len {
                    if let Some(icmp_reply) = IcmpPacket::new(&filled_buf[ip_header_len..]) {
                        if icmp_reply.get_icmp_type() == IcmpTypes::EchoReply {
                            if let Some(reply_packet) = EchoReplyPacket::new(icmp_reply.packet()) {
                                let actual_id = reply_packet.get_identifier();

                                // 手动指定的标识符 67
                                if actual_id == 67 {
                                    let end = start.elapsed();
                                    println!(
                                        "来自 {}: 字节={} 时间={:.2?}ms (实际 Identifier={})",
                                        target_ip,
                                        bytes_received - ip_header_len, // 减去 IP 头长度才是真实的 ICMP 字节数
                                        end.as_secs_f64() * 1000.0,
                                        actual_id
                                    );
                                    break;
                                }
                            }
                        }
                    }
                }
            }
            Err(e) => {
                println!("接收失败或超时: {:?}", e);
                break;
            }
        }
    }
}
```

</details>

很明显，Raw Socket 麻烦许多。需要你主动验证 identifier，并且**需要自主解析 IP 头** (这里是不优雅的做法，直接砍了 20 Bytes)

### MacOS

#### Raw Socket

和 Linux 没有差别，可以直接使用 `socket2` 的跨平台兼容，同样需要特权用户

#### ICMP Socket

<details>
<summary>点击展开折叠内容</summary>

```rust
use pnet_packet::Packet;
use pnet_packet::icmp::echo_reply::EchoReplyPacket;
use pnet_packet::icmp::echo_request::MutableEchoRequestPacket;
use pnet_packet::icmp::{IcmpPacket, IcmpTypes};
use socket2::{Domain, Protocol, Socket, Type};
use std::mem::MaybeUninit;
use std::net::{IpAddr, SocketAddr};
use std::time::{Duration, Instant};

fn main() {
    let target_ip: IpAddr = "8.8.8.8".parse().unwrap();
    let socket_addr: SocketAddr = SocketAddr::new(target_ip, 0);

    let socket = Socket::new(
        Domain::for_address(socket_addr),
        Type::DGRAM, // DGRAM 是必要的
        Some(Protocol::ICMPV4),
    )
        .unwrap();

    // macOS 下必须显式 connect 绑定路由状态，否则回包无法正确分发
    socket.connect(&socket_addr.into()).unwrap();

    // 超时
    socket
        .set_read_timeout(Some(Duration::from_secs(3)))
        .unwrap();

    // 64Bytes
    let mut send_buffer = vec![0; 64];
    let mut icmp_packet = MutableEchoRequestPacket::new(&mut send_buffer).unwrap();
    icmp_packet.set_icmp_type(IcmpTypes::EchoRequest);

    // 实际上由系统生成
    icmp_packet.set_identifier(67);
    icmp_packet.set_sequence_number(1);

    let icmp_ref = IcmpPacket::new(icmp_packet.packet()).unwrap();
    let checksum = pnet_packet::icmp::checksum(&icmp_ref);
    icmp_packet.set_checksum(checksum);

    let start = Instant::now();
    socket
        .send(icmp_packet.packet())
        .unwrap();

    let mut recv_buffer = [MaybeUninit::uninit(); 1024];
    loop {
        match socket.recv(&mut recv_buffer) {
            Ok(bytes_received) => {
                let filled_buf = unsafe {
                    std::slice::from_raw_parts(recv_buffer.as_ptr() as *const u8, bytes_received)
                };

                let ip_header_len = 20;
                if bytes_received > ip_header_len {
                    if let Some(icmp_reply) = IcmpPacket::new(&filled_buf[ip_header_len..]) {
                        if icmp_reply.get_icmp_type() == IcmpTypes::EchoReply {
                            if let Some(reply_packet) = EchoReplyPacket::new(icmp_reply.packet()) {
                                let actual_id = reply_packet.get_identifier();

                                let end = start.elapsed();
                                println!(
                                    "来自 {}: 字节={} 时间={:.2?}ms (实际 Identifier={})",
                                    target_ip,
                                    bytes_received - ip_header_len,
                                    end.as_secs_f64() * 1000.0,
                                    actual_id
                                );
                                break;
                            }
                        }
                    }
                }
            }
            Err(e) => {
                println!("接收失败或超时: {:?}", e);
                break;
            }
        }
    }
}
```

</details>

MacOS 的 ICMP Socket 设计特别反直觉，它由操作系统高度掌控，identifier 和校验和都不用动手，但是返回**会带上 IP 头**，依然需要减 20 Bytes

### Windows

#### Raw Socket

<details>
<summary>点击展开折叠内容</summary>

```rust
use pnet_packet::Packet;
use pnet_packet::icmp::echo_reply::EchoReplyPacket;
use pnet_packet::icmp::echo_request::MutableEchoRequestPacket;
use pnet_packet::icmp::{IcmpPacket, IcmpTypes};
use socket2::{Domain, Protocol, Socket, Type};
use std::mem::MaybeUninit;
use std::net::{IpAddr, SocketAddr, UdpSocket};
use std::time::{Duration, Instant};

// 用于路由到目标 IP 的本地局域网 IP
fn get_local_ip_for_target(target: IpAddr) -> Option<IpAddr> {
    let dst = SocketAddr::new(target, 1);
    let socket = UdpSocket::bind("0.0.0.0:0").ok()?;
    socket.connect(dst).ok()?;
    socket.local_addr().ok().map(|addr| addr.ip())
}

fn main() {
    let target_ip: IpAddr = "8.8.8.8".parse().unwrap();
    let socket_addr: SocketAddr = SocketAddr::new(target_ip, 0);

    let socket = Socket::new(
        Domain::for_address(socket_addr),
        Type::RAW,
        Some(Protocol::ICMPV4),
    )
    .unwrap();

    // 必须显式绑定本地 IP
    let local_ip = get_local_ip_for_target(target_ip).expect("无法获取本地出口 IP");
    let local_addr = SocketAddr::new(local_ip, 0);
    socket.bind(&local_addr.into()).unwrap();
    println!("已绑定本地接口: {}", local_ip);

    // 超时设置
    socket
        .set_read_timeout(Some(Duration::from_secs(3)))
        .unwrap();

    // 64 字节
    let mut send_buffer = vec![0; 64];
    let mut icmp_packet = MutableEchoRequestPacket::new(&mut send_buffer).unwrap();
    icmp_packet.set_icmp_type(IcmpTypes::EchoRequest);
    icmp_packet.set_identifier(67);
    icmp_packet.set_sequence_number(1);

    // 计算校验和
    let icmp_ref = IcmpPacket::new(icmp_packet.packet()).unwrap();
    let checksum = pnet_packet::icmp::checksum(&icmp_ref);
    icmp_packet.set_checksum(checksum);

    // 发送
    let start = Instant::now();
    socket
        .send_to(icmp_packet.packet(), &socket_addr.into())
        .unwrap();

    // 接收缓冲区
    let mut recv_buffer = [MaybeUninit::<u8>::uninit(); 1024];

    loop {
        match socket.recv_from(&mut recv_buffer) {
            Ok((bytes_received, _from_addr)) => {
                // === Windows 兼容修改 2：安全地从 MaybeUninit 转换为 u8 切片 ===
                let filled_buf = unsafe {
                    // 确保只转换为实际接收到字节大小的切片
                    std::slice::from_raw_parts(recv_buffer.as_ptr() as *const u8, bytes_received)
                };

                let ip_header_len = 20;
                if bytes_received > ip_header_len {
                    if let Some(icmp_reply) = IcmpPacket::new(&filled_buf[ip_header_len..]) {
                        if icmp_reply.get_icmp_type() == IcmpTypes::EchoReply {
                            if let Some(reply_packet) = EchoReplyPacket::new(icmp_reply.packet()) {
                                let actual_id = reply_packet.get_identifier();

                                // 匹配标识符
                                if actual_id == 67 {
                                    let end = start.elapsed().as_millis();
                                    println!(
                                        "来自 {}: 字节={} 时间={:.2?}ms (实际 Identifier={})",
                                        target_ip,
                                        bytes_received - ip_header_len,
                                        end,
                                        actual_id
                                    );
                                    break;
                                }
                            }
                        }
                    }
                }
            }
            Err(e) => {
                println!("接收失败或超时: {:?}", e);
                break;
            }
        }
    }
}
```

</details>

Windows 的 Raw Socket 同样需要管理员权限，并且需要**手动绑定网卡**，这是必须的

#### Windows API

其他依赖不需要，需要 Windows API:

```toml
[dependencies]
windows-sys = { version = "0.61.2", features = [
    "Win32_NetworkManagement_IpHelper",
    "Win32_Networking_WinSock",
    "Win32_System_Threading",
] }
```

<details>
<summary>点击展开折叠内容</summary>

```rust
use std::net::Ipv4Addr;
use std::ptr;
use std::time::Instant;
use windows_sys::Win32::NetworkManagement::IpHelper::{IcmpCloseHandle, IcmpCreateFile, IcmpSendEcho, ICMP_ECHO_REPLY, IP_OPTION_INFORMATION};

fn main() {
    let target_ip = Ipv4Addr::new(8, 8, 8, 8);

    let target_ip_u32 = u32::from_ne_bytes(target_ip.octets());

    // 打开 ICMP 句柄
    let icmp_handle = unsafe { IcmpCreateFile() };
    if icmp_handle == -1isize as *mut std::ffi::c_void {
        panic!("无法创建 ICMP 句柄: {}", std::io::Error::last_os_error());
    }

    let request_data = vec![0u8; 32];

    let reply_buffer_size = 1024;
    let mut reply_buffer = vec![0u8; reply_buffer_size];

    let start = Instant::now();

    let reply_count = unsafe {
        IcmpSendEcho(
            icmp_handle,
            target_ip_u32,
            request_data.as_ptr() as *mut _,
            request_data.len() as u16,
            ptr::null() as *const IP_OPTION_INFORMATION,
            reply_buffer.as_mut_ptr() as *mut _,
            reply_buffer_size as u32,
            3000,
        )
    };

    let duration = start.elapsed();

    if reply_count > 0 {
        let reply = unsafe { &*(reply_buffer.as_ptr() as *const ICMP_ECHO_REPLY) };

        if reply.Status == 0 {
            println!(
                "来自 {}: 字节={} 时间={:.2?}ms TTL={}",
                target_ip,
                reply.DataSize,
                duration,
                reply.Options.Ttl
            );
        } else {
            println!("IP 状态错误: {:X}", reply.Status);
        }
    } else {
        println!("Ping 失败或超时: {}", std::io::Error::last_os_error());
    }

    unsafe {
        IcmpCloseHandle(icmp_handle);
    }
}
```

</details>

毫无疑问，这是 Windows 下最优雅的处理 Ping 的方式。不需要特权用户，不需要校验和，不需要 identifier，缺点就是有点 unsafe，不过几乎不可能失败

## 小结

阅读完后，你应该对各个操作系统的 Ping 方式应该有所了解

Linux/MacOS/Windows 基本如下:

- **所有系统都有 Raw Socket**，并且需要特权用户，需要自定 identifier 与校验和，需要手动处理 IP 头
- Linux/MacOS 有 ICMP Socket，不需要特权用户 (Linux 需要进一步配置)，identifier / 校验和 / IP 头 自定义情况有区别
- Windows 首选 Windows API，不需要特权用户，不需要 identifier / 校验和 / IP 头

你可以参考 NodeGet 的 Ping 代码进一步了解详情: [Github](https://github.com/NodeSeekDev/NodeGet/blob/main/agent/src/tasks/ping/icmp.rs)