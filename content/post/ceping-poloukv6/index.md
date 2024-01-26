---
title: PoloCloud UKLite IPv6 1rmb小鸡 测评
description: 1rmb的小鸡有 6000 CPU分数是不是太离谱了
date: 2024-01-25
slug: ceping-poloukv6
image: 2e4c51c7b02c7ecc4c064c575b7910e3.jpg
categories:
    - Main
    - CePing
---

# [测评] PoloCloud UKLite IPv6 1rmb小鸡 测评

本文由 `High Ping Network` 的小伙伴 GenshinMinecraft 进行编撰，首发于 [本博客](https://blog.highp.ing)

## 机器基本信息
CPU: 1C AMD Ryzen 9 7900

RAM: 512M

Network: 300Mbps@250G

Disk: 10G

测试脚本: [ECS](https://github.com/spiritLHLS/ecs)

购买链接: <https://polocloud.xyz/index.php?rp=/store/uklite-ipv6-vps>

## 基础信息
```
---------------------基础信息查询--感谢所有开源项目---------------------
 CPU 型号          : AMD Ryzen 9 7900 12-Core Processor
 CPU 核心数        : 1
 CPU 频率          : 3699.982 MHz
 CPU 缓存          : L1: 128.00 KB / L2: 512.00 KB / L3: 16.00 MB
 硬盘空间          : 1.30 GiB / 9.81 GiB
 启动盘路径        : /dev/sda1
 内存              : 92.52 MiB / 475.55 MiB
 Swap              : [ no swap partition or swap file detected ]
 系统在线时间      : 0 days, 0 hour 14 min
 负载              : 0.23, 0.07, 0.02
 系统              : Debian GNU/Linux 11 (bullseye) (x86_64)
 AES-NI指令集      : ✔ Enabled
 VM-x/AMD-V支持    : ✔ Enabled
 架构              : x86_64 (64 Bit)
 内核              : 5.10.0-11-cloud-amd64
 TCP加速方式       : bbr
 虚拟化架构        : KVM
 NAT类型           : 无法检测
 IPV4 ASN          : AS151338 POLONETWORK LIMITED
 IPV4 位置         : Coventry / England / GB
 IPV6 ASN          : AS151338 Polonetwork
 IPV6 位置         : Coventry / England
 ```
 
 ## CPU && Ram && Disk
 ```
 ----------------------CPU测试--通过sysbench测试-------------------------
 -> CPU 测试中 (Fast Mode, 1-Pass @ 5sec)
 1 线程测试(单核)得分: 		5977 Scores
---------------------内存测试--感谢lemonbench开源-----------------------
 -> 内存测试 Test (Fast Mode, 1-Pass @ 5sec)
 单线程读测试:		70877.71 MB/s
 单线程写测试:		30639.44 MB/s
------------------磁盘dd读写测试--感谢lemonbench开源--------------------
 -> 磁盘IO测试中 (4K Block/1M Block, Direct Mode)
 测试操作		写速度					读速度
 100MB-4K Block		4.1 MB/s (1002 IOPS, 25.55s)		4.1 MB/s (998 IOPS, 25.63s)
 1GB-1M Block		106 MB/s (101 IOPS, 9.93s)		106 MB/s (100 IOPS, 9.91s)
---------------------磁盘fio读写测试--感谢yabs开源----------------------
Block Size | 4k            (IOPS) | 64k           (IOPS)
  ------   | ---            ----  | ----           ---- 
Read       | 3.98 MB/s      (996) | 63.77 MB/s     (996)
Write      | 4.01 MB/s     (1.0k) | 64.18 MB/s    (1.0k)
Total      | 7.99 MB/s     (1.9k) | 127.95 MB/s   (1.9k)
           |                      |                     
Block Size | 512k          (IOPS) | 1m            (IOPS)
  ------   | ---            ----  | ----           ---- 
Read       | 97.70 MB/s     (190) | 96.49 MB/s      (94)
Write      | 102.89 MB/s    (200) | 102.92 MB/s    (100)
Total      | 200.60 MB/s    (390) | 199.41 MB/s    (194)
```

## 流媒体
```
---------------------流媒体解锁--感谢sjlleo开源-------------------------
以下测试的解锁地区是准确的，但是不是完整解锁的判断可能有误，这方面仅作参考使用
----------------Youtube----------------
[IPv6]
连接方式: Youtube Video Server
视频缓存节点地域: LHR(LHR48S34)
Youtube识别地域: 无信息(null)
----------------Netflix----------------
[IPv4]
您的网络可能没有正常配置IPv4，或者没有IPv4网络接入
[IPv6]
您的出口IP完整解锁Netflix，支持非自制剧的观看
NF所识别的IP地域信息：英国
---------------DisneyPlus---------------
[提醒] 无法获取DisneyPlus权验接口信息，当前测试可能会不准确
[IPv6]
当前IPv6出口解锁DisneyPlus
区域：英国区
解锁Youtube，Netflix，DisneyPlus上面和下面进行比较，不同之处自行判断
----------------流媒体解锁--感谢RegionRestrictionCheck开源--------------
 以下为IPV4网络测试，若无IPV4网络则无输出
 以下为IPV6网络测试，若无IPV6网络则无输出
============[ Multination ]============
 Dazn:					Yes (Region: GB)
 HotStar:				Yes (Region: CA)
 Disney+:				Yes (Region: GB)
 Netflix:				Yes (Region: GB)
 YouTube Premium:			Yes (Region: GB)
 Amazon Prime Video:			Yes (Region: GB)
 TVBAnywhere+:				Yes
 iQyi Oversea Region:			GB
 Viu.com:				Yes (Region: SG)
 YouTube CDN:				London 
 Netflix Preferred CDN:			Associated with [hkgo LLC] in [London ]
 Spotify Registration:			No
 Steam Currency:			GBP
 ChatGPT:				Yes
 Bing Region:				GB
=======================================
---------------TikTok解锁--感谢lmc999的源脚本及fscarmen PR--------------
 Tiktok Region:		【GB】
 ```
 
## IP && Network
```
-------------------欺诈分数以及IP质量检测--本脚本原创-------------------
数据仅作参考，不代表100%准确，如果和实际情况不一致请手动查询多个数据库比对
以下为各数据库编号，输出结果后将自带数据库来源对应的编号
ipinfo数据库 ①  | scamalytics数据库 ②  | virustotal数据库 ③  | abuseipdb数据库 ④  | ip2location数据库   ⑤
ip-api数据库 ⑥  | ipwhois数据库     ⑦  | ipregistry数据库 ⑧  | ipdata数据库    ⑨  | ipgeolocation数据库 ⑩
以下为IPV6检测
IP类型: 
  使用类型(usage_type):isp⑧  business⑨  
  公司类型(company_type):isp⑧  
  云服务提供商(cloud_provider):  No⑧ 
  数据中心(datacenter):  No⑥ ⑨ 
  移动网络(mobile):  No⑥ 
  代理(proxy):  No⑥ ⑦ ⑧ ⑨ ⑩ 
  VPN(vpn):  No⑦ ⑧ 
  TOR(tor):  No⑦ ⑧ ⑨ 
  TOR出口(tor_exit):  No⑧ 
  匿名代理(anonymous):  No⑦ ⑧ ⑨ 
  攻击方(attacker):  No⑧ ⑨ 
  滥用者(abuser):  No⑧ ⑨ 
  威胁(threat):  No⑧ ⑨ 
  iCloud中继(icloud_relay):  No⑧ ⑨ 
  未分配IP(bogon):  No⑧ ⑨ 
Google搜索可行性：YES
端口25检测:
  本地: No
  163邮箱：No
欺诈分数(越低越好): 0②
abuse得分(越低越好): 0④
IP类型: Data Center/Web Hosting/Transit⑤
----------------三网回程--感谢zhanghanyun/backtrace开源-----------------
纯IPV6网络无法查询
---------------------回程路由--感谢fscarmen开源及PR---------------------
依次测试电信/联通/移动经过的地区及线路，核心程序来自nexttrace，请知悉!
广东电信 240e:0:a::c9:5238
0.23 ms 	AS151338 英国 英格兰 考文垂
0.94 ms 	AS212027 英国 pebblehost.com
4.03 ms 	AS212027 英国 pebblehost.com
0.34 ms 	AS212027 英国 pebblehost.com
31.55 ms 	AS212027 英国 pebblehost.com
8.12 ms 	AS1299 英国 英格兰 伦敦 arelion.com
7.88 ms 	AS1299 英国 英格兰 伦敦 arelion.com
8.50 ms 	AS1299 英国 英格兰 伦敦 arelion.com
240.49 ms 	AS4134 中国 广东 广州 chinatelecom.com.cn 电信
244.04 ms 	AS4134 中国 广东 广州 chinatelecom.com.cn 电信
257.36 ms 	AS4134 中国 广东 广州 chinatelecom.com.cn 电信
广东联通 2408:8651:3700::b
0.14 ms 	AS151338 英国 英格兰 考文垂
84.72 ms 	AS212027 英国 pebblehost.com
8.44 ms 	AS212027 英国 pebblehost.com
0.35 ms 	AS212027 英国 pebblehost.com
10.39 ms 	AS212027 英国 pebblehost.com
218.06 ms 	AS1299 法国 法兰西岛大区 巴黎 arelion.com
25.96 ms 	AS1299 德国 黑森州 美因河畔法兰克福 arelion.com
244.54 ms 	AS4837 中国 chinaunicom.cn
235.95 ms 	AS4837 中国 北京 chinaunicom.cn 联通
252.59 ms 	AS4837 中国 北京 chinaunicom.cn 联通
252.05 ms 	AS4837 中国 北京 chinaunicom.cn 联通
264.44 ms 	AS4837 中国 chinaunicom.cn 联通
258.76 ms 	AS4837 中国 chinaunicom.cn
广东移动 2409:8055:40:2a1::1
0.17 ms 	AS151338 英国 英格兰 考文垂
1.28 ms 	AS212027 英国 pebblehost.com
79.39 ms 	AS212027 英国 pebblehost.com
1.40 ms 	AS212027 英国 pebblehost.com
9.03 ms 	AS212027 英国 pebblehost.com
9.00 ms 	AS58453 中国 香港 cmi.chinamobile.com 移动
110.62 ms 	AS58453 中国 香港 cmi.chinamobile.com 移动
252.12 ms 	AS58453 中国 香港 cmi.chinamobile.com
202.54 ms 	AS9808 中国 广东 广州 chinamobile.com 移动
352.97 ms 	AS9808 中国 广东 广州 chinamobile.com 移动
251.81 ms 	AS9808 中国 广东 广州 chinamobile.com 移动
221.18 ms 	AS9808 中国 广东 广州 chinamobile.com 移动
218.83 ms 	AS9808 中国 chinamobile.com
```

## 评价
性价比拉满的 Ipv6 神机，令人震惊的是 CPU 将近6000分！还是单核

流媒体解锁也超牛逼，IPV6全绿

可以说是非常牛逼了
