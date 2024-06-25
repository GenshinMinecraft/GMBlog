---
title: 虚妄猫 美国2号主机 4.9rmb/m 2c512m 测评
description: 慈善埋给我开的SSD！
date: 2024-01-26
slug: ceping-nomaius2
image: 5a2e8b12f2e48.jpg
categories:
    - Main
    - CePing
---

# [测评] 虚妄猫 Nat-kvm-美国-独立v6-2号母鸡 4.9rmb/m 2c512m 40gDisk 2T 纯IPV6小鸡 测评

本文由 `High Ping Network` 的小伙伴 GenshinMinecraft 进行编撰，首发于 [本博客](https://blog.highp.ing)

官网介绍：
```
Nat-kvm-美国-独立v6-2号母鸡
¥4.90 CNY
每月 + ¥0.50 初装费
核心 2*amd6272
IP 独立ipv6/128 一个
内存 512M
硬盘 40G(机械硬盘io较差)
流量 2000G高速流量，用完暂停
宽带 共享1G
架构 kvm
是否可续费 可以续费
```


该机器探针地址：<https://te1egram.link/>

## 测试

***注：下列测试已开启 Warp-Go***

**重点：本机器硬盘不作为参考，小埋说不知道为什么开的是 SSD，原本是HDD**

<https://paste.spiritlhl.net/u/GmcVSN.txt>

测试脚本: [ECS融合怪](https://github.com/spiritLHLS/ecs)

### 基础信息
```                    
---------------------基础信息查询--感谢所有开源项目---------------------
 CPU 型号          : AMD Opteron(TM) Processor 6272
 CPU 核心数        : 2
 CPU 频率          : 2099.998 MHz
 CPU 缓存          : L1: 128.00 KB / L2: 1.00 MB / L3: 32.00 MB
 硬盘空间          : 1.30 GiB / 39.26 GiB
 启动盘路径        : /dev/sda1
 内存              : 118.73 MiB / 457.54 MiB
 Swap              : [ no swap partition or swap file detected ]
 系统在线时间      : 0 days, 0 hour 8 min
 负载              : 1.19, 0.40, 0.16
 系统              : Debian GNU/Linux 12 (bookworm) (x86_64)
 AES-NI指令集      : ✔ Enabled
 VM-x/AMD-V支持    : ✔ Enabled
 架构              : x86_64 (64 Bit)
 内核              : 6.1.0-9-amd64
 TCP加速方式       : cubic
 虚拟化架构        : KVM
 NAT类型           : 独立映射,独立过滤,不支持回环
 IPV4 ASN          : AS13335 Cloudflare, Inc.
 IPV4 位置         : Wichita / Kansas / US
 IPV6 ASN          : AS64236 Unreal Servers, LLC
 IPV6 位置         : Kansas City / US-MO
 IPV6 子网掩码     : 128
```

### CPU
```
---------------------CPU测试--感谢lemonbench开源------------------------
 -> CPU 测试中 (Fast Mode, 1-Pass @ 5sec)
 1 线程测试(1核)得分:           814 Scores
 2 线程测试(多核)得分:          1623 Scores
```

### 内存
```
---------------------内存测试--感谢lemonbench开源-----------------------
 -> 内存测试 Test (Fast Mode, 1-Pass @ 5sec)
 单线程读测试:          11262.79 MB/s
 单线程写测试:          6591.22 MB/s
```

### 磁盘
> IO测试不对，这台机器不具备参考。这台的服务器明显是固态SSD，可能后台开通出现了问题。不知道咋创建成固态了，所以这台机器不具备参考意义。
```
------------------磁盘dd读写测试--感谢lemonbench开源--------------------
 -> 磁盘IO测试中 (4K Block/1M Block, Direct Mode)
 测试操作               写速度                                  读速度
 100MB-4K Block         12.4 MB/s (3033 IOPS, 8.44s)            14.0 MB/s (3414 IOPS, 7.50s)
 1GB-1M Block           162 MB/s (155 IOPS, 6.46s)              249 MB/s (237 IOPS, 4.22s)
---------------------磁盘fio读写测试--感谢yabs开源----------------------
Block Size | 4k            (IOPS) | 64k           (IOPS)
  ------   | ---            ----  | ----           ---- 
Read       | 13.02 MB/s    (3.2k) | 107.15 MB/s   (1.6k)
Write      | 13.02 MB/s    (3.2k) | 107.71 MB/s   (1.6k)
Total      | 26.05 MB/s    (6.5k) | 214.87 MB/s   (3.3k)           |                      |                     
Block Size | 512k          (IOPS) | 1m            (IOPS)
  ------   | ---            ----  | ----           ---- 
Read       | 20.61 MB/s      (40) | 19.86 MB/s      (19)
Write      | 22.39 MB/s      (43) | 22.17 MB/s      (21)
Total      | 43.00 MB/s      (83) | 42.03 MB/s      (40)
```

### 解锁(IPV4 解锁是 Warp 的作用，IPV6 未开启)
```
---------------------流媒体解锁--感谢sjlleo开源-------------------------
以下测试的解锁地区是准确的，但是不是完整解锁的判断可能有误，这方面仅作参考使用
----------------Youtube----------------
[IPv4]
连接方式: Youtube Video Server
视频缓存节点地域: 德国法兰克福(FRA16S31)
Youtube识别地域: 无信息(null)
[IPv6]
连接方式: Google Global CacheCDN (ISP Cooperation)
ISP运营商: STLRIX
视频缓存节点地域: 美国  圣路易斯(STL1)
Youtube识别地域: 无信息(null)
----------------Netflix----------------
[IPv4]
您的出口IP完整解锁Netflix，支持非自制剧的观看
NF所识别的IP地域信息：美国
[IPv6]
您的出口IP完整解锁Netflix，支持非自制剧的观看
NF所识别的IP地域信息：美国
---------------DisneyPlus---------------
[IPv4]
当前IPv4出口解锁DisneyPlus
区域：美国区
[IPv6]
当前IPv6出口解锁DisneyPlus
区域：美国区
解锁Youtube，Netflix，DisneyPlus上面和下面进行比较，不同之处自行判断
----------------流媒体解锁--感谢RegionRestrictionCheck开源--------------
 以下为IPV4网络测试，若无IPV4网络则无输出
============[ Multination ]============
 Dazn:                                  Yes (Region: US)
 HotStar:                               No
 Disney+:                               Yes (Region: US)
 Netflix:                               Yes (Region: US)
 YouTube Premium:                       Yes
 Amazon Prime Video:                    Yes (Region: US)
 TVBAnywhere+:                          Yes
 iQyi Oversea Region:                   US
 Viu.com:                               No
 YouTube CDN:                           Frankfurt 
 Netflix Preferred CDN:                 Kansas City, MO  
 Spotify Registration:                  Yes (Region: US)
 Steam Currency:                        USD
 ChatGPT:                               Yes
 Bing Region:                           US
=======================================
 以下为IPV6网络测试，若无IPV6网络则无输出
============[ Multination ]============
 Dazn:                                  Failed (Network Connection)
 HotStar:                               Yes (Region: US)
 Disney+:                               Yes (Region: US)
 Netflix:                               Yes (Region: US)
 YouTube Premium:                       Yes
 Amazon Prime Video:                    Unsupported
 TVBAnywhere+:                          Failed (Network Connection)
 iQyi Oversea Region:                   Failed
 Viu.com:                               Failed
 YouTube CDN:                           STLRIX in St. Louis, MO 
 Netflix Preferred CDN:                 Kansas City, MO  
 Spotify Registration:                  Yes (Region: US)
 Steam Currency:                        Failed (Network Connection)
 ChatGPT:                               Failed
 Bing Region:                           US
=======================================
---------------TikTok解锁--感谢lmc999的源脚本及fscarmen PR--------------
 Tiktok Region:         【US】
```
### IP(无参考意义，测试为 CloudFlare 的 WarpIP)
```
-------------------欺诈分数以及IP质量检测--本脚本原创-------------------
数据仅作参考，不代表100%准确，如果和实际情况不一致请手动查询多个数据库比对
以下为各数据库编号，输出结果后将自带数据库来源对应的编号
ipinfo数据库 ①  | scamalytics数据库 ②  | virustotal数据库 ③  | abuseipdb数据库 ④  | ip2location数据库   ⑤
ip-api数据库 ⑥  | ipwhois数据库     ⑦  | ipregistry数据库 ⑧  | ipdata数据库    ⑨  | ipgeolocation数据库 ⑩

欺诈分数(越低越好): 7②
abuse得分(越低越好): 0④
IP类型: 
  使用类型(usage_type):hosting①  Content Delivery Network⑤  hosting⑧  hosting⑨  
  公司类型(company_type):hosting①  hosting⑧  
  云服务提供商(cloud_provider):  Yes⑧ 
  数据中心(datacenter):  No⑥   Yes⑨ 
  移动网络(mobile):  No⑥ 
  代理(proxy):  No① ②   Yes⑥ ⑦ ⑧ ⑨ ⑩ 
  VPN(vpn):  No① ② ⑦ ⑧ 
  TOR(tor):  No① ② ⑦ ⑧ ⑨ 
  TOR出口(tor_exit):  No⑧ 
  搜索引擎机器人(search_engine_robot):② 
  匿名代理(anonymous):  No⑦ ⑧   Yes⑨ 
  攻击方(attacker):  No⑧ ⑨ 
  滥用者(abuser):  No⑧ ⑨ 
  威胁(threat):  No⑧ ⑨ 
  iCloud中继(icloud_relay):  No① ⑧ ⑨ 
  未分配IP(bogon):  No⑧ ⑨ 
Google搜索可行性：YES
端口25检测:
  本地: No
  163邮箱：No
------以下为IPV6检测------
欺诈分数(越低越好): 0②
abuse得分(越低越好): 0④
IP类型: Content Delivery Network⑤
```

### Trace(无参考意义，测试为 CloudFlare 的 WarpIP)
```
----------------三网回程--感谢zhanghanyun/backtrace开源-----------------
国家: US 城市: Wichita 服务商: AS13335 Cloudflare, Inc.
北京电信 219.141.136.12  电信163 [普通线路]           
北京联通 202.106.50.1    联通4837[普通线路]           
北京移动 221.179.155.161 测试超时
上海电信 202.96.209.133  电信163 [普通线路]           
上海联通 210.22.97.1     联通4837[普通线路]           
上海移动 211.136.112.200 移动CMI [普通线路]           
广州电信 58.60.188.222   电信163 [普通线路]           
广州联通 210.21.196.6    联通4837[普通线路]           
广州移动 120.196.165.24  测试超时
成都电信 61.139.2.69     电信163 [普通线路]           
成都联通 119.6.6.6       联通4837[普通线路]           
成都移动 211.137.96.205  移动CMI [普通线路]           
---------------------回程路由--感谢fscarmen开源及PR---------------------
依次测试电信/联通/移动经过的地区及线路，核心程序来自ipip.net或nexttrace，请知悉!
广州电信 58.60.188.222
2.91 ms  AS13335  中国, 香港, cloudflare.com
9.31 ms  AS13335  美国, 密苏里州, 堪萨斯城, level3.com
3.08 ms  AS13335  美国, 密苏里州, 堪萨斯城, cloudflare.com
2.69 ms  AS1299  美国, 密苏里州, 堪萨斯城, telia.com
39.58 ms  AS1299  美国, 加利福尼亚州, 圣何塞, telia.com
41.06 ms  AS4134  美国, 加利福尼亚州, 圣何塞, chinatelecom.com.cn, 电信
190.62 ms  AS4134  中国, 广东, 广州, chinatelecom.com.cn, 电信
201.77 ms  AS4134  中国, 广东, 深圳, chinatelecom.com.cn, 电信
191.76 ms  AS4134  中国, 广东, 深圳, chinatelecom.com.cn, 电信
广州联通 210.21.196.6
4.43 ms  AS13335  中国, 香港, cloudflare.com
2.67 ms  AS13335  美国, 密苏里州, 堪萨斯城, level3.com
33.91 ms  AS13335  美国, 密苏里州, 堪萨斯城, cloudflare.com
3.05 ms  AS1299  美国, 密苏里州, 堪萨斯城, telia.com
2.98 ms  AS1299  美国, 密苏里州, 堪萨斯城, telia.com
43.85 ms  AS1299  美国, 加利福尼亚州, 洛杉矶, telia.com
243.15 ms  AS1299  美国, 加利福尼亚州, 洛杉矶, telia.com
223.90 ms  AS4837  中国, 北京, chinaunicom.com, 联通
238.81 ms  AS4837  中国, 广东, 广州, chinaunicom.com, 联通
238.15 ms  AS4837  中国, 广东, 广州, chinaunicom.com, 联通
207.26 ms  AS4837  中国, 广东, 广州, chinaunicom.com, 联通
219.51 ms  AS17816  中国, 广东, 深圳, chinaunicom.com, 联通
244.17 ms  AS17623  中国, 广东, 深圳, chinaunicom.com, 联通
216.35 ms  AS17623  中国, 广东, 深圳, chinaunicom.com, 联通
广州移动 120.196.165.24
3.17 ms  AS13335  中国, 香港, cloudflare.com
2.76 ms  AS13335  美国, 密苏里州, 堪萨斯城, level3.com
36.06 ms  AS13335  美国, 密苏里州, 堪萨斯城, cloudflare.com
3.02 ms  AS1299  美国, 密苏里州, 堪萨斯城, telia.com
39.42 ms  AS1299  美国, 加利福尼亚州, 圣何塞, telia.com
39.13 ms  AS58453  美国, 加利福尼亚州, 圣何塞, chinamobile.com, 移动
202.19 ms  AS58453  中国, 广东, 广州, chinamobile.com, 移动
200.43 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
200.83 ms  AS56040  中国, 广东, 深圳, chinamobile.com, 移动
```

### Speedtest(Warp)
```
--------------------自动更新测速节点列表--本脚本原创--------------------
位置             上传速度        下载速度        延迟     丢包率
Speedtest.net        932.24 Mbps     927.97 Mbps     5.11     0.0%
洛杉矶     211.73 Mbps      202.58 Mbps     70.29    0.0%
法兰克福     203.63 Mbps     230.39 Mbps     124.91   0.0%
移动Chengdu  0.22 Mbps       239.75 Mbps     304.33   26.5%
```

### 全球Ping(Itdog Ipv6)
![9d5e76035db082f05260ff37d2cfffe3.png](https://i.miji.bid/2023/12/31/9d5e76035db082f05260ff37d2cfffe3.png)

### 全球持续Ping(Itdog Ipv6)
![0a2034041bc41eaba859212ef83ced94.png](https://i.miji.bid/2023/12/31/0a2034041bc41eaba859212ef83ced94.png)

## 评价
小埋家的都知道，低价机器多了去了

也不能说是灵车，买来也是探针+1

IPV6的ping在联通和电信都挺好的，但是一到移动就拉跨了，丢包率至少20起步

2c512m的机器，也不知道干啥好了，等会整个站吧

下辈子建议抛弃移动（我就是移动）

附上我家本地网络ping
![91ad38ca9f0c898dace46d19b795fe6d.png](https://i.miji.bid/2023/12/31/91ad38ca9f0c898dace46d19b795fe6d.png)

欢迎加入 High Ping 大家庭:
- [官网](https://highp.ing)
- [Blog](https://blog.highp.ing)
- [@HighPingNetwork](https://t.me/HighPingNetwork)
- [@HighPingChat](https://t.me/highpingchat)