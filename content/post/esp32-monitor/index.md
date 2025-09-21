---
title: UDP 协议初体验 | 用 ESP32 掌控板制作小小探针
description: 十万年前的东西了也是
date: 2025-05-18
slug: esp32-monitor
image: https://img.genmin.icu/p/esp32-monitor/image-1.png
categories:
    - Main
    - Rust
---

# UDP 协议初体验 | 用 ESP32 掌控板制作小小探针

[<-前往本博客获取更好阅读体验->](https://c1oudf1are.eu.org/p/esp32-monitor/)

## 前言

又是一日闲来无事，从床底翻出了小学的时候玩的一块 ESP32 开发板，名称是 `掌控板`

是十万年前国内中小学生创客最常用的，当然现在已经退环境了，不过其性能还是有的

而且还有一个 1.3 英寸 OLED 显示屏，支持 16*16 字符显示，分辨率 128x64，自带全字库

这不得让他显示点什么？遂有本文

相关代码已托管: <https://github.com/GenshinMinecraft/esp32-udp-monitor>

## ESP32 部分代码

都上 Esp32 了，必须来点 MicroPython，虽然性能很渣，但是简单也足够用

由于是国产且面向中小学生 ~~(没错那就是我 (Neta from Elaina))~~ 的主控板，所以官方开发资源非常之丰富，直接封装了一整个 [`mpython`](https://mpython.readthedocs.io/zh-cn/master/library/mPython/index.html) 库出来，直接用即可

先来点老生常谈的 Wi-Fi 连接与初始化代码: 

```python
import network
import socket
import time
import ujson
from machine import Pin
from mpython import *

oled.fill(0)
oled.DispChar(str('Hello, world!'), 0, 0, 1)
oled.show()

# WiFi配置
WIFI_SSID = "xx"     # 修改为你的WiFi名称
WIFI_PASSWORD = "xx"  # 修改为你的WiFi密码

# 初始化网络接口
wlan = network.WLAN(network.STA_IF)
wlan.active(True)

def connect_wifi():
    print("正在连接WiFi...", end='')
    wlan.connect(WIFI_SSID, WIFI_PASSWORD)
    
    while not (wlan.isconnected()):
        pass
    
    print("\n连接成功！")
    oled.DispChar(str('连接成功！'), 0, 16, 1)
    print("IP地址:", wlan.ifconfig()[0])
    oled.DispChar(str(wlan.ifconfig()[0]), 0, 32, 1)
    oled.show()
    return True
```

至少，它封装出来的 oled 屏幕使用只需要导入即可，甚至不需要初始化，这点可以点赞下

如果你使用的并非具有这么**完全封装**的掌控板，而是其他开发板，可能需要自己写点有关显示的代码

这一次使用的是 Esp32 作为 UDP 服务器的方案，所以我们需要写点 UDP 相关代码

```python
def udp_server():
    # 创建UDP socket
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind(('0.0.0.0', 9090))
    print("UDP服务器已启动，监听端口：9090")
```

这里创建 Socket 并绑定到 9090 端口，记得监听 `0.0.0.0`

接下来接收数据并显示:

```python
data, _ = sock.recvfrom(1024)
text = data.decode('utf-8')
json_a = ujson.loads(text)
oled.fill(0)
oled.DispChar(str(json_a["line1"]), 0, 0, 1)
oled.DispChar(str(json_a["line2"]), 0, 16, 1)
oled.DispChar(str(json_a["line3"]), 0, 32, 1)
oled.DispChar(str(json_a["line4"]), 0, 48, 1)
oled.show()
```

由于这个 OLED 屏幕可以显示四行，所以可以直接从 UDP 客户端接收一个 Json，里面包含每行显示的数据，解析后直接显示即可

~~因为是个人小玩意，所以错误处理是什么？不知道，不管了~~

还有发现一个小问题，在显示大量文本并刷新的时候，会导致很严重的阻塞

由于我的设计是最后一行 (也就是文本最多的一行) 是不会改变的，所以可以**只**在第一次刷新时接收第四行的数据，而后续只用刷新前三行

所以在其之后写个死循环:

```python
while True:
    data, _ = sock.recvfrom(1024)
    text = data.decode('utf-8')
    json_a = ujson.loads(text)
    oled.fill_rect(0, 0, 128, 48, 0)
    oled.DispChar(str(json_a["line1"]), 0, 0, 1)
    oled.DispChar(str(json_a["line2"]), 0, 16, 1)
    oled.DispChar(str(json_a["line3"]), 0, 32, 1)
    oled.show()
```

最后，主程序判断 Wi-Fi 连接成功后开启 UDP 服务器即可:

```python
if connect_wifi():
    udp_server()
else:
    print("无法启动服务器，请检查网络连接")
```

## 被监测端部分代码

我开发各种 Agent 监测端的经验**不可谓不丰富** (自认)

整个项目只需要三个第三方库，`serde`、`serde-json` 与 `sysinfo`

先来定义结构体:

```rust
#[derive(Serialize, Deserialize, Debug, Clone)]
struct Line {
    line1: String,
    line2: String,
    line3: String,
    line4: String,
}
```

然后来连接到掌控板，其地址可以由命令行参数指定:

```rust
let socket = UdpSocket::bind("0.0.0.0:0")?;
let server_address = args().nth(1).unwrap_or(String::from("192.168.31.70:9090"));
```

再来初始化一堆东西来:

```rust
let mut sys = System::new();
let mut networks = Networks::new();
#[cfg(target_os = "windows")]
let system_str = format!("{} {}", System::name().unwrap_or(String::from("Unknown")), System::os_version().unwrap_or(String::from("Unknown")));

#[cfg(target_os = "linux")]
let system_str = format!("{} {}", System::name().unwrap_or(String::from("Unknown")), System::kernel_version().unwrap_or(String::from("Unknown")));
```

`sys` 与 `network` 是 `sysinfo` 库提供的 API，有关系统显示的部分由于需求不一样，在 Linux 下是 `DistName + KernelVersion`，Windows 则是 `Windows + KernelVersion`

又到了死循环阶段

```rust
loop {
    sys.refresh_cpu_usage();
    let cpu_usage = format!("CPU: {:.2}%", sys.global_cpu_usage());

    sys.refresh_memory_specifics(MemoryRefreshKind::nothing().with_ram());
    let ram_free = sys.available_memory() / 1024 / 1024;
    let ram_total = sys.total_memory() / 1024 / 1024;
    let ram_usage = format!("RAM: {}/{}MB", ram_free, ram_total);

    networks.refresh(true);
    let mut all_rx: u64 = 0;
    let mut all_tx: u64 = 0;
    for (_, network) in networks.iter() {
        all_rx += network.received();
        all_tx += network.transmitted();
    }
    let rx_mb = all_rx as f64 / 1024.0 / 1024.0 * 8.0;
    let tx_mb = all_tx as f64 / 1024.0 / 1024.0 * 8.0;
    let network_usage = format!("NET: {:.2}/{:.2}mBps", rx_mb, tx_mb);

    let message = serde_json::to_value(Line {
        line1: cpu_usage,
        line2: ram_usage,
        line3: network_usage,
        line4: system_str.clone(),
    })?
    .to_string();

    socket.send_to(message.as_bytes(), server_address.clone())?;
    println!("SendSuccess: {}", message);
    std::thread::sleep(Duration::from_millis(args().nth(2).unwrap_or(String::from("1000")).parse().unwrap()));
}
```

从上到下，依次获取 CPU 使用率、内存信息、网卡流量，并发送到 UDP 服务器，每次循环间隔 1sec (也可以由命令行参数决定，但是 MPY 弱鸡性能每次间隔 1sec 已经是极限了)

## 效果

效果还是可以的，我整了条很短的线给他接在了插座旁，被监测端开机自启，开机即可传输数据

![alt text](https://img.genmin.icu/p/esp32-monitor/image.png)

就这样吧，坐在电脑桌前，拿着手柄，一转头就可以看看电脑信息

或者直接插在我服务器上当实体监控也不是不可以的 (其实就是想这么玩的，可是找到了更好的使用方法)