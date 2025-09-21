---
title: ESP8266 上 Komari Agent 使用教程 
description: ...?
date: 2025-09-07
slug: esp8266-komari-agent
image: https://img.genmin.icu/p/esp8266-komari-agent/image.png
categories:
    - Main
---

# ESP8266 上 Komari Agent 使用教程

[<-前往本博客获取更好阅读体验->](https://genmin.icu)

## 前言

又是一日闲来无事，想给 ESP8266 上个 [Komari](https://github.com/komari-monitor) 监控

本来是想用 Rust 当嵌入式练手项目的，但无奈发现 esp8266-hal rust 已经停止维护

又因为不想再翻出来一块 esp32 或者 uno 3，所以只好用 Arduino C 写了

开源于: <https://github.com/GenshinMinecraft/komari-agent-for-esp8266-arduinoc>

## 使用

为了方便使用，我封装成了一个库，直接放入 [`.h`](https://raw.githubusercontent.com/GenshinMinecraft/komari-agent-for-esp8266-arduinoc/refs/heads/main/komari.h) 和 [`.cpp`](https://raw.githubusercontent.com/GenshinMinecraft/komari-agent-for-esp8266-arduinoc/refs/heads/main/komari.cpp) 到项目文件夹即可使用:

![alt text](https://img.genmin.icu/p/esp8266-komari-agent/025A4B18-53E8-4A97-8F10-8DF9C0F74FB8.png)

随后去 `.cpp` 文件定义一下 Komari 主控的地址、Token什么的:

![alt text](https://img.genmin.icu/p/esp8266-komari-agent/BF501E9A-2F09-4358-AD99-E70670729837.png)

需要注意的是，我没有写 TLS 兼容，所以只能连接到 HTTP 主控 (不强制 HTTPs 也可以)

在主文件 `.ino` 里面初始化并调用它:

```cpp
#include "komari.h"
#include <ESP8266WiFi.h>

const char* ssid = "Demo";
const char* password = "Demo";

void setup() {
  Serial.begin(115200);
  Serial.println("\n--- ESP8266 监控客户端 ---");

  WiFi.begin(ssid, password);
  Serial.print("正在连接.");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("\nWiFi 已连接");
  Serial.print("IP 地址: ");
  Serial.println(WiFi.localIP());

  if (setupKomari()) {
    Serial.println("[Komari] 初始化成功");
  } else {
    Serial.println("[Komari] 初始化失败");
  }
}

void loop() {
  agentPostOnce();
  
  Serial.println("Processing");

  delay(10);
}
```

`setup()` 函数中连接网络并初始化 Komari Agent，这里会发送 ESP8266 的 Basic Info

`loop()` 函数中，每次循环都会调用 `agentPostOnce()`，内部函数会以**每秒一次**的时间发送 Realtime Info 到 Komari 主控，如果不到一秒则不推送

`Serial.println("Processing")` 是模拟真实任务，你需要将你的业务逻辑代码放在这里，但最好保证他**快速执行**，否则 Websocket 会断开连接

最后的一点等待是**必须的**，否则 CPU 占用率会误判很高，但如果你的业务逻辑代码耗时很长，也可以去掉以检测到最精准的 CPU 占用率

就这样吧

## 结

能用就行，无聊的产物

效果如图:

![alt text](https://img.genmin.icu/p/esp8266-komari-agent/1318B3BE-E086-4694-9E83-6AF3EC78E946.png)

![alt text](https://img.genmin.icu/p/esp8266-komari-agent/8E0B8254-2F1E-4DE5-8F25-36823AB97552.png)