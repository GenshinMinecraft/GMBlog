---
title: Rackdog 冷门商家 澳大利亚 $3 1C512M 测评
description: 我妈，但是这澳大利亚太假了！
date: 2024-01-30
slug: ceping-rackdogau
image: 4Dvs6WLGZi83KwQ.jpg
categories:
    - Main
    - CePing
---

# Rackdog 冷门商家 澳大利亚 $3 1C512M 测评

本文由 `High Ping Network` 的小伙伴 GenshinMinecraft 进行编撰，首发于 [本博客](https://blog.highp.ing)

## 商家简介：

[官网](https://cloud.rackdog.com/)
***注：此为小时计费网站，非[月付](https://rackdog.com/)网站***

该商家主要经营**按小时计费**服务器，最低配置1c512m 3$

无限流量@10Gbps（不论高低配）

但是到国内线路拉跨，不建议作为 直连node/建站机

支付方式：credit card

## 测评
脚本为 <https://github.com/spiritLHLS/ecs/>

测评区域为 新出的澳大利亚

IP：162.250.99.5

### 基本信息
```
---------------------基础信息查询--感谢所有开源项目---------------------
 CPU 型号          : Intel Xeon Processor (Skylake, IBRS)
 CPU 核心数        : 1
 CPU 频率          : 2699.998 MHz
 CPU 缓存          : L1: 64.00 KB / L2: 4.00 MB / L3: 16.00 MB
 硬盘空间          : 1.17 GiB / 19.52 GiB
 启动盘路径        : /dev/vda1
 内存              : 129.72 MiB / 473.34 MiB
 Swap              : [ no swap partition or swap file detected ]
 系统在线时间      : 0 days, 0 hour 7 min
 负载              : 0.07, 0.05, 0.01
 系统              : Debian GNU/Linux 11 (bullseye) (x86_64)
 AES-NI指令集      : ✔ Enabled
 VM-x/AMD-V支持    : ❌ Disabled
 架构              : x86_64 (64 Bit)
 内核              : 5.10.0-20-amd64
 TCP加速方式       : cubic
 虚拟化架构        : KVM
 NAT类型           : 独立映射,独立过滤,不支持回环
 IPV4 ASN          : AS142617 Rackdog LLC
 IPV4 位置         : Sydney / New South Wales / AU
```

### CPU && RAM && Disk
```
----------------------CPU测试--通过sysbench测试-------------------------
 -> CPU 测试中 (Fast Mode, 1-Pass @ 5sec)
 1 线程测试(单核)得分:          1176 Scores
---------------------内存测试--感谢lemonbench开源-----------------------
 -> 内存测试 Test (Fast Mode, 1-Pass @ 5sec)
 单线程读测试:          22873.12 MB/s
 单线程写测试:          16333.93 MB/s
------------------磁盘dd读写测试--感谢lemonbench开源--------------------
 -> 磁盘IO测试中 (4K Block/1M Block, Direct Mode)
 测试操作               写速度                                  读速度
 100MB-4K Block         7.8 MB/s (1898 IOPS, 13.49s)            16.1 MB/s (3920 IOPS, 6.53s)
 1GB-1M Block           199 MB/s (190 IOPS, 5.27s)              347 MB/s (330 IOPS, 3.02s)
---------------------磁盘fio读写测试--感谢yabs开源----------------------
Block Size | 4k            (IOPS) | 64k           (IOPS)
  ------   | ---            ----  | ----           ----
Read       | 99.09 MB/s   (24.7k) | 794.39 MB/s  (12.4k)
Write      | 99.35 MB/s   (24.8k) | 798.57 MB/s  (12.4k)
Total      | 198.45 MB/s  (49.6k) | 1.59 GB/s    (24.8k)
           |                      |
Block Size | 512k          (IOPS) | 1m            (IOPS)
  ------   | ---            ----  | ----           ----
Read       | 775.58 MB/s   (1.5k) | 769.94 MB/s    (751)
Write      | 816.78 MB/s   (1.5k) | 821.22 MB/s    (801)
Total      | 1.59 GB/s     (3.1k) | 1.59 GB/s     (1.5k)
```

### 流媒体
```
---------------------流媒体解锁--感谢sjlleo开源-------------------------
以下测试的解锁地区是准确的，但是不是完整解锁的判断可能有误，这方面仅作参考使用
----------------Youtube----------------
[IPv4]
连接方式: Youtube Video Server
视频缓存节点地域: 澳大利亚 墨尔本(MEL05S03)
Youtube识别地域: 澳大利亚(AU)
----------------Netflix----------------
[IPv4]
您的出口IP可以使用Netflix，但仅可看Netflix自制剧
NF所识别的IP地域信息：澳大利亚
[IPv6]
您的网络可能没有正常配置IPv6，或者没有IPv6网络接入
---------------DisneyPlus---------------
[IPv4]
当前IPv4出口解锁DisneyPlus
区域：澳大利亚区
解锁Youtube，Netflix，DisneyPlus上面和下面进行比较，不同之处自行判断
----------------流媒体解锁--感谢RegionRestrictionCheck开源--------------
 以下为IPV4网络测试，若无IPV4网络则无输出
============[ Multination ]============
 Dazn:                                  Yes (Region: US)
 HotStar:                               No
 Disney+:                               Yes (Region: US)
 Netflix:                               Yes (Region: AU)
 YouTube Premium:                       Yes (Region: AU)
 Amazon Prime Video:                    Yes (Region: US)
 TVBAnywhere+:                          Yes
 iQyi Oversea Region:                   US
 Viu.com:                               No
 YouTube CDN:                           Melbourne, Vic.
 Netflix Preferred CDN:                 Associated with [Vocus] in [Sydney, N.S.W. ]
 Spotify Registration:                  No
 Steam Currency:                        USD
 ChatGPT:                               Yes
 Bing Region:                           US
 Instagram Licensed Audio:              Yes
=======================================
 以下为IPV6网络测试，若无IPV6网络则无输出
---------------TikTok解锁--感谢lmc999的源脚本及fscarmen PR--------------
 Tiktok Region:         【US】
```

### IP
```
-------------------欺诈分数以及IP质量检测--本脚本原创-------------------
数据仅作参考，不代表100%准确，如果和实际情况不一致请手动查询多个数据库比对
以下为各数据库编号，输出结果后将自带数据库来源对应的编号
ipinfo数据库 ①  | scamalytics数据库 ②  | virustotal数据库 ③  | abuseipdb数据库 ④  | ip2location数据库   ⑤
ip-api数据库 ⑥  | ipwhois数据库     ⑦  | ipregistry数据库 ⑧  | ipdata数据库    ⑨  | ipgeolocation数据库 ⑩
欺诈分数(越低越好): 0②
abuse得分(越低越好): 0④
IP类型:
  使用类型(usage_type):business①  Data Center/Web Hosting/Transit⑤  business⑧  business⑨
  公司类型(company_type):business①  hosting⑧
  云服务提供商(cloud_provider):  Yes⑧
  数据中心(datacenter):  No⑥ ⑨
  移动网络(mobile):  No⑥
  代理(proxy):  No① ② ⑥ ⑦ ⑧ ⑨
  VPN(vpn):  No① ② ⑦ ⑧
  TOR(tor):  No① ② ⑦ ⑧ ⑨
  TOR出口(tor_exit):  No⑧
  搜索引擎机器人(search_engine_robot):②
  匿名代理(anonymous):  No⑦ ⑧ ⑨
  攻击方(attacker):  No⑧ ⑨
  滥用者(abuser):  No⑧ ⑨
  威胁(threat):  No⑧ ⑨
  iCloud中继(icloud_relay):  No① ⑧ ⑨
  未分配IP(bogon):  No⑧ ⑨
Google搜索可行性：YES
端口25检测:
  本地: No
  163邮箱: Yes
  gmail邮箱: Yes
  outlook邮箱: Yes
  qq邮箱: Yes
  yandex邮箱: Yes
```

### Traces
```
----------------三网回程--感谢zhanghanyun/backtrace开源-----------------
国家: AU 城市: Sydney 服务商: AS142617 Rackdog LLC
北京电信 219.141.136.12  测试超时
北京联通 202.106.50.1    测试超时
北京移动 221.179.155.161 移动CMI [普通线路]
上海电信 202.96.209.133  电信163 [普通线路]
上海联通 210.22.97.1     测试超时
上海移动 211.136.112.200 移动CMI [普通线路]
广州电信 58.60.188.222   测试超时
广州联通 210.21.196.6    测试超时
广州移动 120.196.165.24  移动CMI [普通线路]
成都电信 61.139.2.69     电信163 [普通线路]
成都联通 119.6.6.6       联通4837[普通线路]
成都移动 211.137.96.205  移动CMI [普通线路]
---------------------回程路由--感谢fscarmen开源及PR---------------------
依次测试电信/联通/移动经过的地区及线路，核心程序来自ipip.net或nexttrace，请知悉!
广州电信 58.60.188.222
0.38 ms  *  局域网
0.27 ms  *  局域网
1.47 ms  AS4826  澳大利亚, 新南威尔士州, 悉尼, vocus.com.au
267.95 ms  AS3356  美国, 加利福尼亚州, 圣何塞, level3.com
376.40 ms  AS4134  中国, 广东, 深圳, chinatelecom.com.cn, 电信
375.20 ms  AS4134  中国, 广东, 深圳, chinatelecom.com.cn, 电信
广州联通 210.21.196.6
0.29 ms  *  局域网
0.37 ms  *  局域网
1.73 ms  AS4826  澳大利亚, 新南威尔士州, 悉尼, vocus.com.au
93.84 ms  *  澳大利亚, 新南威尔士州, 悉尼, nextgengroup.com.au
93.93 ms  *  澳大利亚, 西澳大利亚州, 珀斯, nextgengroup.com.au
93.58 ms  *  澳大利亚, 西澳大利亚州, 珀斯, nextgengroup.com.au
103.38 ms  AS4826  新加坡, vocus.com.au
93.48 ms  AS5511  ORANGE.COM 骨干网, orange.com
479.69 ms  AS17623  中国, 广东, 深圳, chinaunicom.com, 联通
广州移动 120.196.165.24
0.26 ms  *  局域网
0.41 ms  *  局域网
1.64 ms  AS4826  澳大利亚, 新南威尔士州, 悉尼, vocus.com.au
1.49 ms  AS4826  澳大利亚, 新南威尔士州, 悉尼, vocus.com.au
1.78 ms  AS58453  澳大利亚, 新南威尔士州, 悉尼, chinamobile.com, 移动
93.33 ms  AS58453  澳大利亚, 新南威尔士州, 悉尼, chinamobile.com, 移动
93.15 ms  AS58453  新加坡, chinamobile.com, 移动
130.48 ms  AS58453  中国, 广东, 广州, chinamobile.com, 移动
130.51 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
128.31 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
131.78 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
133.69 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
135.78 ms  AS56040  中国, 广东, 深圳, chinamobile.com, 移动
```

### Speedtest
```
--------------------自动更新测速节点列表--本脚本原创--------------------
位置             上传速度        下载速度        延迟     丢包率
Speedtest.net    18.77 Mbps      577.23 Mbps     201.22   0.3%
新加坡           562.38 Mbps     662.27 Mbps     89.87    NULL
洛杉矶           627.88 Mbps     5281.29 Mbps    149.21   0.0%
联通Fuzhou       132.65 Mbps     553.06 Mbps     448.51   0.0%
电信天津5G       1.51 Mbps       9.69 Mbps       363.74   3.3%
移动Chengdu      899.33 Mbps     598.88 Mbps     179.56   0.0%
移动陕西5G       344.63 Mbps     559.43 Mbps     180.17   0.0%
```

## 评价
很离谱，很离谱，这分明就是一台 披着 AU 外皮的美国机器！

Ipinfo 数据为 AU，但是你可以从 Speedtest 看出，Au(Speedtest.net) 的速度才500Mbps，而美国洛杉矶为整整 5Gbps

一看就是拨出去的，IP 库都没更新完全，流媒体解锁是 Au 夹着 Us

CPU 和内存啥的不想说了，差不多，都是正常小鸡标准

欢迎加入 High Ping 大家庭:
- [官网](https://highp.ing)
- [Blog](https://blog.highp.ing)
- [@HighPingNetwork](https://t.me/HighPingNetwork)
- [@HighPingChat](https://t.me/highpingchat)