---
title: 面向于国内中小学生的 创客开发板选型 / 语言选择 完全指北
description: 独角大盗
date: 2025-08-03
slug: magicboard
image: https://img.genmin.icu/p/magicboard/image-17.png
categories:
    - Main
---

# 面向于国内中小学生的 创客开发板选型 / 语言选择 完全指北

[<-前往本博客获取更好阅读体验->](https://c1oudf1are.eu.org/p/magicboard/)

## 前言

我是一位嵌入式开发板**资深玩家**，手里大大小小开发板几十个，自认为具有一定的实力来写这样的一篇文章，以帮助新入坑的，新打比赛的朋友们

如果你是准备想要**打比赛** (创意智造)，那么该文绝对适合你；如果你想**自己玩玩开发板**，实现一些小功能罢了，那本文也有一定的参考价值，不过不多 (主要原因在价格)

本文会分成如下部分: 

- Arduino 系列及其衍生开发板
- ESPxx 系列及其衍生开发板
- Linux 系列开发板
- 其他开发板

每一个开发板都有详细的介绍，涵盖了国内外多个厂商的产品，包括但不限于:

- 官方原厂
- 盛思
- DFRobot
- Lubot
- 淘宝和拼多多

请注意，在国内中小学生创客比赛中，许多的开发板**并不只有 MCU**，还具有类似于屏幕、按键、蜂鸣器等元器件，所以我们讨论的是广义上的开发板

本文所有的开发板均会配图 (除非实在没有)，官方 / 国内购买 / 本人实际购买价格等基本信息

还有，本文所有开发板都是本人自有并试用

## Arduino 系列及其衍生开发板

### Arduino Uno R3

![alt text](https://img.genmin.icu/p/magicboard/image.png)

第一位绝对是大名鼎鼎的 Arduino Uno R3

- 官方链接: <https://docs.arduino.cc/hardware/uno-rev3/>
- 价格: 官方 29 欧 / 国内 PDD 购买 82 RMB (国内版 33 RMB) / 本人实际购买 160 RMB
- Chip: ATmega328P
- GPIO: 14 Pins
- Analog: 6 Pins
- PWM: 6 Pins

请注意一下，Arduino Uno R3 有国内版和意大利版本之分，理论上完全没有差别，价格相差还是挺大的

最著名的开发板，没有之一。初学者必备 (经济原因可以不买官方)

默认的板子已经引出了所有针脚，易于接线

官方采用的都是 `ATmega16U2` 作为 USB 转串口芯片 (偷工减料一般为 `CH340` 家族)，在一些特殊的场合需要用到 `16U2`，比如模拟键盘输入 HID 设备。一般来说不使用该功能与其他无异

性能羸弱，板载内存少，I2C 总线接一个 Oled 0.96 inch 基本就可以占满了

IO 少，仅有 14 个 GPIO，一般项目都有可能不够

一般情况下仅为初学者提供，不能用于实际生产环境

本人购入官方版三块 (一块自己用，一块收藏用，一块传教用)

总之，你可以不用它，但是必须有一块！(传教 ing)

### DFRduino UNO R3

![alt text](https://img.genmin.icu/p/magicboard/image-1.png)

我的入门板子，来自于 DFRobot

- 官方链接: <https://wiki.dfrobot.com.cn/_SKU_DFR0216_DFRduino_UNO_R3>
- 价格: 官方 67 RMB / 本人实际购买 0 RMB
- Chip: ATmega328P
- GPIO: 14 Pins
- Analog: 6 Pins
- PWM: 6 Pins

DFRduino UNO R3 完全兼容 Arduino UNO R3版本，与原版基本无差别

是国内能买到的和官方最接近的版本，基本就是官方的模具换了个 PCB

我非常喜欢他的红蓝绿黑配色，每次看都是享受

### 国产 Arduino Uno R3 兼容板

![alt text](https://img.genmin.icu/p/magicboard/image-3.png)

最经济的板子

- 价格: PDD 14 RMB / 本人实际购买 0 RMB
- Chip: ATmega328P
- GPIO: 14 Pins
- Analog: 6 Pins
- PWM: 6 Pins

国产 Arduino Uno R3 兼容板并不是指某一特别的开发板，而是国内生产的统称

这样的开发板**一般**有如下特点，于官方区别开来:
- SOP 封装 (官方为 DIP 封装) (也就是 MCU 是一个方形的薄薄的芯片)
- 各式各样的数据接口 (官方为 USB-B 接口，兼容板为了方便可以是 Micro-USB / Type-C 等)
- USB 转串口芯片为 `CH340` 系列 (官方为 `16U2`) (正常使用无影响，需要做 HID 设备才有)
- 价格低廉: 对没错，超便宜

请注意，其芯片仍旧是 ATmega328P，只是做工和用料的差别，买来初学是不二之选

这代表它与正常官方无异，不必要纠结

本人有不下 10 余个兼容板，没事干就拿出来玩玩

### Arduino Uno R3 替代版 / 改进版 (LGT8F328P)

![alt text](https://img.genmin.icu/p/magicboard/image-2.png)

该板子非常少人用，特点就是便宜，缺点就是不完全兼容 Arduino Uno R3

- 官方链接: <http://www.prodesign.com.cn/lgt8f328p/>
- 价格: PDD 11 RMB / 本人实际购买 11 RMB
- Chip: LGT8F328P
- GPIO: 14 Pins
- Analog: 6 Pins 
- PWM: 6 Pins (实际 8 路)

不建议购买，性能比 `ATmega328P` 高但是支持非常少，连将 Arduino 代码移植过来都费劲了

现在只有一个 [`NullLab`](https://github.com/nulllaborg/arduino_nulllab) 在为这个芯片提供支持，编译需要特定的工具链

这意味着他不能直接用于一些图形化的代码编写，需要用 Arduino IDE

采用这款芯片的替代版 / 改进版非常多，基本所有模型都产过了，包括但不限于 Arduino Nano

如果你正在尝试为生产环境的产品选型，可以考虑一下这块芯片

### Arduino Mega 2560 R3

![alt text](https://img.genmin.icu/p/magicboard/image-4.png)

最有名的超多 IO 板

- 官方链接: <https://docs.arduino.cc/hardware/mega-2560/>
- 价格: 官方 53 欧 / 国内 PDD 购买 172 RMB / 本人实际购买 0 RMB
- Chip: ATmega2560
- GPIO: 54 Pins
- Analog: 16 Pins
- PWM: 15 Pins

可以看到它的 GPIO 数量简直就是恐怖，作为自制 3d 打印机的主控板还是挺不错的

然后还有一个值得肯定的是其拥有 4 个硬串口，秒杀 Uno 只有 1 个

而且他的代码基本与 Uno 兼容，不需要过多地更改就可以移植过来

想起当时 Uno 连接个串口都费劲的日子了，天天拔插 0 / 1 IO 才能刷写都快麻烦死了

8KB SRAM, 256KB FLASH, 4KB EEPROM 的配置也是非常恐怖，Uno 接个小屏幕都快占满了已经

同样地，USB 转串口芯片与 Uno 一致，为 `16U2`，可以使用 HID 等功能

我是很建议觉得 Uno 不够用的人来试试 Mega 的，当然现在国内创客教育也在推广 Mega 而不是 Uno 了

缺点只有一个，就是太大了。加上拓展板塞到成品里面有点困难

### DFRduino Mega 2560

![alt text](https://img.genmin.icu/p/magicboard/image-5.png)

与 Arduino Mega 2560 R3 基本无异

- 官方链接: <https://www.dfrobot.com.cn/goods-504.html>
- 价格: 官方 126 RMB / 本人实际购买 0 RMB
- Chip: ATmega2560
- GPIO: 54 Pins
- Analog: 16 Pins
- PWM: 15 Pins

就是 Arduino Mega 2560 R3 的国内创客版，集成在各种套件中

最大的改进就是优化了电源输入，不容易烧板子 + 宽电压支持

我是真的烧了块原装 Mega 2560 的，有点心疼

### 国产 Arduino Mega 2560 R3 兼容板

![alt text](https://img.genmin.icu/p/magicboard/image-6.png)

便宜大碗谁不爱，火速购入

- 价格: PDD 53 RMB / 本人实际购买 0 RMB
- Chip: ATmega2560
- GPIO: 54 Pins
- Analog: 16 Pins
- PWM: 15 Pins

情况和 Arduino Uno 的国产板子差不多，都有以下的区别

国产 Arduino Mega 2560 R3 兼容板并不是指某一特别的开发板，而是国内生产的统称

这样的开发板**一般**有如下特点，于官方区别开来:
- SOP 封装 (官方为 DIP 封装) (也就是 MCU 是一个方形的薄薄的芯片)
- 各式各样的数据接口 (官方为 USB-B 接口，兼容板为了方便可以是 Micro-USB / Type-C 等)
- USB 转串口芯片为 `CH340` 系列 (官方为 `16U2`) (正常使用无影响，需要做 HID 设备才有)
- 价格低廉: 对没错，超便宜

请注意，其芯片仍旧是 ATmega2560，只是做工和用料的差别，买来初学是不二之选

这代表它与正常官方无异，不必要纠结

### Arduino Nano

![alt text](https://img.genmin.icu/p/magicboard/image-7.png)

国内不是很常见，但是也有用的

- 官方链接: <https://docs.arduino.cc/hardware/nano/>
- 价格: 官方 27 欧 / 国内 PDD 购买 145 RMB (?) / 本人实际购买 0 RMB
- Chip: ATmega328
- GPIO: 14 Pins
- Analog: 8 Pins
- PWM: 6 Pins

说真的，很少见在南方的朋友使用 Nano 开发，但是在国赛和队友交流的时候发现北方 (黑龙江) 使用得比较多

我对这块板子没啥看法，就是 Uno 的缩小版吧，规格什么的都差不多的

USB 转串口芯片用的是 `FT232RL` 而不是 `16u2`，可拓展性不太行，其他都还可以

### DFRduino Nano

![alt text](https://img.genmin.icu/p/magicboard/image-8.png)

与 Arduino Nano 基本无异

- 官方链接: <https://www.dfrobot.com.cn/goods-754.html>
- 价格: 官方 40 RMB / 本人实际购买 0 RMB
- Chip: ATmega328
- GPIO: 14 Pins
- Analog: 8 Pins
- PWM: 6 Pins

就是 Arduino Nano 的国内创客版

最大的改进就是优化了电源输入，不容易烧板子 + 宽电压支持 (DFRobot 的工作就是把原版改个颜色然后优化电源输入吗)

### 国产 Arduino Nano 兼容板

![alt text](https://img.genmin.icu/p/magicboard/image-9.png)

- 价格: PDD 10 RMB / 本人实际购买 0 RMB
- Chip: ATmega328
- GPIO: 14 Pins
- Analog: 8 Pins
- PWM: 6 Pins

情况和 Arduino Uno 的国产板子差不多，都有以下的区别

国产 Arduino Nano 兼容板并不是指某一特别的开发板，而是国内生产的统称

这样的开发板**一般**有如下特点，于官方区别开来:
- SOP 封装 (官方为 DIP 封装) (也就是 MCU 是一个方形的薄薄的芯片)
- 各式各样的数据接口 (官方为 USB-B 接口，兼容板为了方便可以是 Micro-USB / Type-C 等)
- USB 转串口芯片为 `CH340` 系列 (官方为 `FT232`) (正常使用无影响)
- 价格低廉: 对没错，超便宜

请注意，其芯片仍旧是 ATmega328，只是做工和用料的差别，买来初学是不二之选

这代表它与正常官方无异，不必要纠结

### 其他 Arduino 开发板

这里对未详细列出的开发板做个小结，国内不太常见并且创客不经常用得到:

- [Arduino UNO R4 WiFi](https://docs.arduino.cc/hardware/uno-r4-wifi): 最小丑的板子，WiFi 模块采用的 ESP32-S3，WiFi 芯片比真正的处理器性能还高的也是第一次见，别碰 (买了然后送人了)
- [Leonardo](https://docs.arduino.cc/hardware/leonardo/#tech-specs): 真的很少见，没见过有其他朋友拿过的，我只见过我自己的唯一一块。已经被 Uno 完全代替

## ESPxx 系列及其衍生开发板

ESP32 && ESP8266 可就多了

### 最常见 ESPxx 板子

就是 PDD / TB 卖的最普通的板子，一块 PCB 集成 MCU / USB 转串口 / 引出针脚 的那种

ESPxx 有很多型号，这里一一讲下有什么区别 (若未详细说明均支持 WiFi (2.4 Ghz) 与 BlueTooth)

- [ESP8266](https://www.espressif.com/zh-hans/products/socs/esp8266): 不支持 BlueTooth，但价格便宜，体积小，常作为不支持 WiFi 连接的开发板的协处理器
- [ESP32](https://www.espressif.com/zh-hans/products/socs/esp32): 没有后缀，最普通的 MCU
- [ESP32-H2](https://www.espressif.com/zh-hans/products/socs/esp32-h2): 支持 Zigbee 网桥，支持 BlueTooth 5，支持 IEEE 802.15.4
- [ESP32-C2](https://www.espressif.com/zh-hans/products/socs/esp32-c2): 物联网专用，比 ESP8266 还小，支持 BlueTooth 5
- [ESP32-C3](https://www.espressif.com/zh-hans/products/socs/esp32-c3): 常见于微型开发板，支持 BlueTooth 5
- [ESP32-C5](https://www.espressif.com/zh-hans/products/socs/esp32-c5): 支持 BlueTooth 5，支持 WiFi 6 (2.4+5 Ghz)，支持 Zigbee 网桥，IO 较多
- [ESP32-C6](https://www.espressif.com/zh-hans/products/socs/esp32-c6): 支持 BlueTooth 5，支持 WiFi 6，支持 Zigbee 网桥，常用于 P4 的协处理器
- [ESP32-C61](https://www.espressif.com/zh-hans/products/socs/esp32-c61): 支持 BlueTooth 5，支持 WiFi 6
- [ESP32-S2](https://www.espressif.com/zh-hans/products/socs/esp32-s2): **不**支持 BlueTooth，支持 WiFi 6，IO 较多
- [ESP32-S3](https://www.espressif.com/zh-hans/products/socs/esp32-s3): 支持 BlueTooth 5，IO 较多，是目前最广泛使用且性能较为强劲的 MCU
- [ESP32-P4](https://www.espressif.com/zh-hans/products/socs/esp32-p4): 本身不支持 BlueTooth 与 WiFi，但常与 [ESP32-C6](https://www.espressif.com/zh-hans/products/socs/esp32-c6) 搭配使用，拥有 ESP32 系列最强劲的性能，可以驱动 1080p@30Hz 的显示屏，H264 解码，最多的 IO，USB OTG 2.0，以太网口等

以上的开发板在 PDD / TB 从 几块钱到几百块不等，入门建议选择 [ESP32-S3](https://www.espressif.com/zh-hans/products/socs/esp32-s3)，保证不会错

如果你需要为一些不支持 WiFi 连接的开发板开发一些物联网硬件，建议选择 [ESP8266](https://www.espressif.com/zh-hans/products/socs/esp8266)，一直低于 10 RMB

[ESP32-P4](https://www.espressif.com/zh-hans/products/socs/esp32-p4) 作为最强劲的 MCU 且现在刚发布，所以价格较高，不建议过早入手 (我都忍住没买)

ESP32 选型还是挺复杂的，而且很多芯片下面还细分好多模组，记得看看他们的 Pinout 和 Datasheet

上面的板子除了 `H2` / `C5` / `C61` / `P4` 我都有了，折腾体验都可以的

### 掌控板 V2

![alt text](https://img.genmin.icu/p/magicboard/image-11.png)

- 官方链接: <https://mpython.readthedocs.io/zh-cn/master/>
- 价格: 官方 99 RMB / 本人实际购买 0 RMB
- Chip: ESP-WROOM-32
- GPIO: 20 Pins
- Analog: 6 Pins
- PWM: 12 Pins

盛思的经典板子，虽然有些地方被其他板代替但仍有一席之地

板载了很多东西:

- 三轴加速度计 MSA300: 测量范围: ±2/4/8/16G;
- 六轴传感器 (v2.1.0及以后版本): QMI8658C (LGA-14) 陀螺仪: 量程可选，最高可测 ±2048°/s 三轴加速度计: 量程可选，最高可测 ±16G;
- 地磁传感器 MMC5983MA: 测量范围: ±8G 的量程;精度 0.4mGs,电子罗盘误差 ±0.5°;
- 地磁传感器 MMC5603NJ (v2.2.0及以后版本): 3 轴，最小分辨率为 0.0625mG，±30G 的量程，±1° 以内的指向精度;
- 光线传感器: 光敏三极管 ALS-PT19-315C
- 麦克风: EM4013BTC1R16B-T0-423
- 3 颗全彩 WS2812-2020 RGB-LED 灯珠
- 1.3 英寸 OLED 显示屏，支持 16*16 字符显示，分辨率 128x64
- 无源蜂鸣器 SMD-050020F-03040N
- 支持 2 个物理按键 (A/B)、6个触摸按键 (P/Y/T/H/O/N)
- 支持 1 路鳄鱼夹接口，可方便接入各种阻性传感器

说真的在 99 这个价格这真的可以了，而且还有显示屏，不是很坑钱

官方封装了一整个板子所需要的库，所有传感器都在里面了: [mPython](https://mpython.readthedocs.io/zh-cn/master/library/mPython/index.html)

盛思官方推荐使用语言是 MicroPython，但也有 Arduino C 库支持

比较推荐简单入门使用，能把玩一下

![alt text](https://img.genmin.icu/p/magicboard/image-10.png)

一般与拓展板一起使用，名为 掌中宝

- 两路 DC 马达驱动,单路电流 150mA
- 支持音频功放和喇叭输出 (掌控板 P8，P9 引脚)
- 支持文字转语音 (Text To Speech) 的语音合成
- 扩展 12 路 IO 接口、2 路 I2C 接口
- 支持锂电池供电和外接 USB 电源供电两种方式
- 内置 350mAH 锂电池,支持锂电池循环充电

作为入门 ESP32 板子绝对是不二之选，就是逐渐被新的板子替代

未加装拓展板时，Pinout 是兼容 Micro:bit 的，可以与 Micro:bit 拓展板通用

### 乐动掌控

![alt text](https://img.genmin.icu/p/magicboard/image-12.png)

- 官方链接: <https://www.labplus.cn/forum-hardware-ledong>
- 价格: 官方 298 RMB / 本人实际购买 0 RMB
- Chip: ESP-WROOM-32
- GPIO: 20 Pins
- Analog: 6 Pins
- PWM: 12 Pins

乐动掌控就是 掌控板 + 掌控拓展板 + 封装到一起。规格，参数与掌控板一模一样

但是 IO 做成了自有接口，与其他硬件完全不兼容，想要接入只能自己用杜邦线手动接，并且还很难接

我理解这是为了不用以前的硬件，卖新的硬件，但是这么做确实有点缺德了哈

太 TM 贵了，就是一个掌中宝 + 掌控板价格，买 298 RMB，自用绝对地不推荐！

现在已经逐渐替代原先的掌控板，贵但是因为比赛要求还是得买单啊......

### 行空板 K10

![alt text](https://img.genmin.icu/p/magicboard/image-13.png)

- 官方链接: <https://www.unihiker.com.cn/products/k10>
- 价格: 官方 158 RMB / 本人实际购买 0 RMB
- Chip: ESP32-S3

板载非常多东西:

- 双麦克风: 配备双麦克风，提供更好的降噪效果，显著提高语音唤醒和识别的准确性，确保清晰的录音质量。
- 摄像头: 200W 像素，80 度镜头 GC2145
- 扬声器: 功率 2W
- Wi-Fi 和蓝牙: 内置高效 Wi-Fi 和蓝牙模块，适用于物联网技术学习和项目开发，确保稳定连接。
- 屏幕: 2.8寸 240x320 彩色 LCD ILI9341
- 温湿度传感器 (AHT20): 温度: -40-85℃ 精度 ±0.3℃；湿度: 0-100%RH 精度 ±2%RH
- 环境光传感器 (LTR303ALS): 检测范围: 0~64k Lux
- 三轴加速度传感器 (SC7A20H): ±2G/±4G/±8G/±16G
- RGB 灯 x3: 可用于流水灯效果和状态指示，提供动感的视觉体验，提升设备的互动性。
- 状态指示灯: 在语音唤醒、拍照、录音等操作时亮灯，让用户快速了解设备状态，提升操作的直观性和便利性。
- microSD 卡接口: 支持扩充存储空间，可存储照片、音乐、录音等数据，满足更多数据的存储需求，可实现电子相册、音乐播放器、留声机等项目。
- 金手指接口: 引出所有 IO 接口，支持扩展板连接，轻松实现更多功能扩展，满足各种开发需求。
- Type-C 接口: 兼容程序烧录、供电及串口信息打印，接口多功能化，操作更加便捷。

最重要的东西就是 摄像头 和 全彩 2.8 寸屏幕了，在这个价格拥有集成度这么高的板子还是很不错的

未加装拓展板时，Pinout 是兼容 Micro:bit 的，可以与 Micro:bit 拓展板通用

DFRobot 的主力开发板，主要面向 AI 的，也是封装了所有的库，直接可以使用

背后的摄像头像素不高但足够人脸识别

除此之外还有语音识别、语音合成、二维码解析等等

缺点就是过于封装，想要直接获取摄像头内容反而更难，只适合图形化编程玩家，手动写还是有点困难

## Linux 系列开发板

PS: 这里指的是性能足够运行完整 Linux 系统的板子，并且经常用于运行 Linux 的板子，比如 Rpi 等 (不包含不主流，比如 ESP32-S3 也能跑 Linux)

### 1956

![alt text](https://img.genmin.icu/p/magicboard/image-14.png)

- 官方链接: <https://www.labplus.cn/new1956>
- 价格: 官方 497 RMB / 本人实际购买 0 RMB
- Chip: 全志 R329

来自盛思的最新板子，接口同样采用 乐动掌控 所采用的新 IO 接口

板载具有:

- CPU: 全志 R329 处理器，双核 ARM 64 位 Cortex-A53 架构，主频 1.5 GHz
- 屏幕: 2.8 寸彩屏，SPI 接口，分辨率：240*320
- USB-A 接口: USB2.0 TYPE A
- TYPE-C 接口: USB TYPE C
- 麦克风: 模拟 MEMS 麦克风*1
- 扬声器: 规格：1609 尺寸：16*9*3mm 8 欧
- 六轴陀螺仪: QMI8658ALAG14 QST 六轴加速度计最大量程±16g 陀螺仪最大量程±2048°/s
- 磁传感器: MMC5603NJ 最大量程：±30 Gauss精度：0.0625mG/LSB
- 气压计: SPL06-001 量程：300-1100hPa，精度：±1hPa
- 电机驱动: HR8833 两路电机输出
- WIFI: RTL8723DS AP/STATION/Bluetooth IEEE802.11b/g/n
- 存储器: EMMC 8GB
- 电池: 3.7V 2000mAh
- 五向键: 用户功能按键
- ARM China Zhouyi Z1 AIPU，最高 0.25TOPS@600 MHz

板载的是 Tina Linux (OpenWRT 的一个分支)，具有 256 MB 的 DDR 内存 (没错是 DDR)

可以运行完整 Python，至于其他也没啥好说的了，性能羸弱到十五年前老手机都没这么炸裂

为 GUI 显示封装了一个很好用的[库](https://1956-docs.readthedocs.io/zh/latest/gui/widgets/bar.html)，完全兼容它的五向按键，这点值得表扬

内置了 SIoT 服务，是一个 MQTT 服务器，国内创客必备，整挺好

### 行空板 M10

![alt text](https://img.genmin.icu/p/magicboard/image-15.png)

- 官方链接: <https://www.unihiker.com.cn/products/m10>
- 价格: 官方 399 RMB / 本人实际购买 0 RMB
- Chip: 全志 R329

板载具有:

- CPU: RK3308 Arm 64位 4核 主频1.2GHz
- 内存: 512MB DDR3
- 硬盘: 16GB eMMC
- 系统: debian 10
- Wi-Fi&蓝牙: RTL8723DS 2.4G&4.0BT
- 协处理器: GD32VF103C8T6 RISC-V 主频108MHz & 64KB Flash & 32KB SRAM
- 屏幕: 2.8 寸，分辨率 240x320 可触控 彩屏
- 麦克风传感器: 电容硅麦克风
- 光线传感器: PT0603 光敏三极管
- 蜂鸣器: 无源蜂鸣器
- L灯: 蓝色LED
- 六轴传感器: ICM20689 三轴加速度三轴陀螺仪
- microSD卡接口

板载的是 Debian 10 (有点老旧了)

可以运行完整 Python，看似内存比 1956 大但是 A35 CPU，别抱任何希望

具体评测可以去本博客的这篇文章: [Unihiker 行空板 M10 测评](https://blog.c1oudf1are.eu.org/p/ceping-unihikerm10/)

内置了 SIoT 服务，是一个 MQTT 服务器，国内创客必备，整挺好

我没想到他们的 WiFi 模块选型是一样的，都有点 Bug，有的设备连接不上我也不知道为什么

板载的东西是比行空板 K10 以及 1956 是少一点的，价格也便宜了点

未加装拓展板时，Pinout 是兼容 Micro:bit 的，可以与 Micro:bit 拓展板通用

DFRobot 的主力开发板，主要面向 AI 的，也是封装了所有的库，直接可以使用

官方为其开发了一个 pingpong 库，可以操作硬件了，兼容性做的还可以

对于初学者来说有点困难，看懂 Python 的报错就挺困难了，不是很建议上

### 树莓派系列

说实话国内创客上树莓派简直就是大杀器，性能上秒杀一切板子，但是基本用不上

所以这里不推荐，一般的中小学生我觉得也不太会使用啥的

## 其他开发板

这里只有一块开发板，以后会加上的

### Micro:bit

![alt text](https://img.genmin.icu/p/magicboard/image-16.png)

- 官方链接: <https://microbit.org/>
- 价格: 官方 19 USD / 国内 PDD 购买 80 RMB / 本人实际购买 0 RMB
- Chip: Nordic nRF51822

非常有名的一块板子，但是在国内没多少人用，性能不是很行

支持 BlueTooth，还有私有协议的无线通信 (仅能用于多块 Micro:bit 之间)

早些年还是很流行的，国内厂商都在做 Micro:bit 的兼容板，可惜他们自己都不卖 Micro:bit

亮点就是有一个 5x5 的 Led 点阵屏，和温度传感器、陀螺仪、指南针、加速度、触摸等等

V2 版本可以在内部保存数据，并连接到电脑当作 U 盘查看 (虽然存不了文件)，真的超喜欢这个功能

## 语言选择

目前国内创客流行的编程语言挺多的，包括了图形化与代码编程:

- Arduino C
- MicroPython
- Python
- Mind+ (MicroPython + Arduino C)
- mPython (Arduino C)
- Mixly (MicroPython + Arduino C)

前三者为代码编程，后三者为图形化

我个人更加推荐 Arduino C 系列的编程

因为其具有更高的兼容性，代码可读性，更贴切 C / C++，缺点就是难学

可以肯定的是 Arduino C 所支持的 库 和 硬件 是最多了，当然不是贬低 Python 系列，只是没有那么多开发者和社区罢了

图形化我个人推荐 Mind+，它支持上面提到的所有开发板，以及大量硬件，还支持两种语言，还有优质用户库

Python 主要用于 Linux 系列开发板，需要用协处理器来与硬件通信，不然很麻烦，库的支持也相对较少

## 结尾

就这样吧，后续拿到了更多的开发板我还会回来继续更新的

欢迎来 Telegram 与我交流: @C1oudF1are