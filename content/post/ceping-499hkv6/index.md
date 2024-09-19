---
title: Wawo 哇沃 4.99rmb/年 LXC HK Ipv6 Nat 小鸡 测评
description: 和 Polo 家的 UKLite 比差远了
date: 2024-01-28
slug: ceping-499hkv6
image: obOsYjScKep1VQ7.jpg
categories:
    - Main
    - CePing
---


# Wawo 哇沃 4.99rmb LXC HK 小鸡测评

本文由 `High Ping Network` 的小伙伴 GenshinMinecraft 进行编撰，首发于 [本博客](https://blog.c1oudf1are.eu.org/)

## 基本信息
- CPU: 0.5c
- Ram: 512mb
- Disk: 3GB
- Network: 500G@500Mbps
- IP: IPv6\*1, 出口 Nat IPv4
- 价格: 4.99RMB/1Y

## 脚本测试
脚本: ECS

### 基本信息
```

---------------------基础信息查询--感谢所有开源项目---------------------
 CPU 型号          : Intel(R) Xeon(R) CPU E5-2695 v2 @ 2.40GHz
 CPU 核心数        : 48
 CPU 频率          : 3200.000 MHz
 CPU 缓存          : L1: 1.50 MB / L2: 6.00 MB / L3: 60.00 MB
 硬盘空间          : 2.89 GiB / 0.00 GiB
 启动盘路径        : /dev/almalinux_undefined/vsv2293-dgqUTDcW7y2vtKmS-uoVmWu9kMJLmHXF9
 内存              : 66.29 MiB / 768.00 MiB
 Swap              : [ no swap partition or swap file detected ]
 系统在线时间      : 0 days, 0 hour 7 min
 负载              : 9.93, 8.49, 8.06
 系统              : Ubuntu 20.04.1 LTS (x86_64)
 AES-NI指令集      : ✔ Enabled
 VM-x/AMD-V支持    : ✔ Enabled
 架构              : x86_64 (64 Bit)
 内核              : 4.18.0-513.11.1.el8_9.x86_64
 TCP加速方式       : bbr
 虚拟化架构        : LXC
 NAT类型           : 独立映射,独立过滤,不支持回环
 IPV4 ASN          : AS150452 LANDUPS LIMITED
 IPV4 位置         : Hong Kong / Central and Western / HK
 ```

### CPU & RAM & Disk
```
----------------------CPU测试--通过sysbench测试-------------------------
 -> CPU 测试中 (Fast Mode, 1-Pass @ 5sec)
 1 线程测试(单核)得分: 		664 Scores
 48 线程测试(多核)得分: 		670 Scores
---------------------内存测试--感谢lemonbench开源-----------------------
 -> 内存测试 Test (Fast Mode, 1-Pass @ 5sec)
 单线程读测试:		15143.28 MB/s
 单线程写测试:		10807.79 MB/s
------------------磁盘dd读写测试--感谢lemonbench开源--------------------
 -> 磁盘IO测试中 (4K Block/1M Block, Direct Mode)
 测试操作		写速度					读速度
 100MB-4K Block		32.4 MB/s (7912 IOPS, 3.24s)		23.5 MB/s (5744 IOPS, 4.46s)
 1GB-1M Block		339 MB/s (324 IOPS, 3.09s)		301 MB/s (287 IOPS, 3.48s)
---------------------磁盘fio读写测试--感谢yabs开源----------------------
测试失败请替换另一种方式
```

### 流媒体测试
```
---------------------流媒体解锁--感谢sjlleo开源-------------------------
以下测试的解锁地区是准确的，但是不是完整解锁的判断可能有误，这方面仅作参考使用
----------------Youtube----------------
[IPv4]
连接方式: Youtube Video Server
视频缓存节点地域: 中国香港(HKG07S42)
Youtube识别地域: 无信息(null)
[IPv6]
连接方式: Youtube Video Server
视频缓存节点地域: 中国香港(HKG07S42)
Youtube识别地域: 香港(HK)
----------------Netflix----------------
[IPv4]
您的出口IP完整解锁Netflix，支持非自制剧的观看
NF所识别的IP地域信息：香港
[IPv6]
您的出口IP完整解锁Netflix，支持非自制剧的观看
NF所识别的IP地域信息：香港
---------------DisneyPlus---------------
[IPv4]
当前IPv4出口解锁DisneyPlus
区域：香港区
[IPv6]
当前IPv6出口解锁DisneyPlus
区域：香港区
解锁Youtube，Netflix，DisneyPlus上面和下面进行比较，不同之处自行判断
----------------流媒体解锁--感谢RegionRestrictionCheck开源--------------
 以下为IPV4网络测试，若无IPV4网络则无输出
============[ Multination ]============
 Dazn:					Yes (Region: HK)
 HotStar:				No
 Disney+:				Yes (Region: HK)
 Netflix:				Yes (Region: HK)
 YouTube Premium:			Yes
 Amazon Prime Video:			Yes (Region: HK)
 TVBAnywhere+:				No
 iQyi Oversea Region:			HK
 Viu.com:				Yes (Region: HK)
 YouTube CDN:				Hong Kong 
 Netflix Preferred CDN:			Seattle, WA  
 Spotify Registration:			No
 Steam Currency:			HKD
 ChatGPT:				Only Available with Mobile APP
 Bing Region:				HK
 Instagram Licensed Audio:		->
 Instagram Licensed Audio:		No
=======================================
 以下为IPV6网络测试，若无IPV6网络则无输出
============[ Multination ]============
 Dazn:					Failed (Network Connection)
 HotStar:				No
 Disney+:				Yes (Region: HK)
 Netflix:				Yes (Region: HK)
 YouTube Premium:			Yes (Region: HK)
 Amazon Prime Video:			Unsupported
 TVBAnywhere+:				Failed (Network Connection)
 iQyi Oversea Region:			Failed
 Viu.com:				Failed
 YouTube CDN:				Hong Kong 
 Netflix Preferred CDN:			Seattle, WA  
 Spotify Registration:			No
 Steam Currency:			Failed (Network Connection)
 ChatGPT:				Failed
 Bing Region:				HK
 Instagram Licensed Audio:		->
 Instagram Licensed Audio:		No
=======================================
---------------TikTok解锁--感谢lmc999的源脚本及fscarmen PR--------------
 Tiktok Region:		Failed
 ```

### IP 测试
```
-------------------欺诈分数以及IP质量检测--本脚本原创-------------------
数据仅作参考，不代表100%准确，如果和实际情况不一致请手动查询多个数据库比对
以下为各数据库编号，输出结果后将自带数据库来源对应的编号
ipinfo数据库 ①  | scamalytics数据库 ②  | virustotal数据库 ③  | abuseipdb数据库 ④  | ip2location数据库   ⑤
ip-api数据库 ⑥  | ipwhois数据库     ⑦  | ipregistry数据库 ⑧  | ipdata数据库    ⑨  | ipgeolocation数据库 ⑩
欺诈分数(越低越好): 0②
abuse得分(越低越好): 0④
IP类型: 
  使用类型(usage_type):business①  Commercial⑤  business⑧  business⑨  
  公司类型(company_type):hosting①  hosting⑧  
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
黑名单记录统计(有多少个黑名单网站有记录): 无害0 恶意0 可疑0 未检测89 ③
Google搜索可行性：YES
端口25检测:
  本地: Yes
  163邮箱: Yes
  gmail邮箱: Yes
  outlook邮箱: Yes
  yandex邮箱: Yes
  qq邮箱: Yes
------以下为IPV6检测------
欺诈分数(越低越好): 0②
abuse得分(越低越好): 0④
IP类型: Commercial⑤
```

### Traces
```
----------------三网回程--感谢zhanghanyun/backtrace开源-----------------
国家: HK 城市: Hong Kong 服务商: AS150452 LANDUPS LIMITED
北京电信 219.141.136.12  电信CN2 [优质线路]           
北京联通 202.106.50.1    联通4837[普通线路]           
北京移动 221.179.155.161 移动CMI [普通线路]           
上海电信 202.96.209.133  电信CN2 [优质线路]           
上海联通 210.22.97.1     联通4837[普通线路]           
上海移动 211.136.112.200 移动CMI [普通线路]           
广州电信 58.60.188.222   电信CN2 [优质线路]           
广州联通 210.21.196.6    联通4837[普通线路]           
广州移动 120.196.165.24  移动CMI [普通线路]           
成都电信 61.139.2.69     电信CN2 [优质线路]           
成都联通 119.6.6.6       联通4837[普通线路]           
成都移动 211.137.96.205  移动CMI [普通线路]           
---------------------回程路由--感谢fscarmen开源及PR---------------------
依次测试电信/联通/移动经过的地区及线路，核心程序来自ipip.net或nexttrace，请知悉!
广州电信 58.60.188.222
216.25 ms  AS150452  中国, 香港, landups.com
12.71 ms  AS150452  中国, 香港, landups.com
106.12 ms  *  局域网
40.42 ms  *  局域网
12.09 ms  *  局域网
275.94 ms  *  局域网
90.61 ms  AS24429  中国, 香港, aliyun.com, 阿里云
4.33 ms  *  中国, 香港, chinatelecom.com.cn, 电信
3.39 ms  *  中国, 香港, chinatelecom.com.cn, 电信
8.47 ms  *  中国, 广东, 广州, chinatelecom.com.cn, 电信
10.05 ms  *  中国, 广东, 广州, chinatelecom.com.cn, 电信
11.25 ms  *  中国, 广东, 广州, chinatelecom.com.cn, 电信
14.36 ms  *  中国, 广东, 深圳, chinatelecom.com.cn, 电信
13.38 ms  AS4134  中国, 广东, 深圳, chinatelecom.com.cn, 电信
53.00 ms  AS4134  中国, 广东, 深圳, chinatelecom.com.cn, 电信
广州联通 210.21.196.6
58.51 ms  AS150452  中国, 香港, landups.com
254.63 ms  AS150452  中国, 香港, landups.com
213.25 ms  AS150452  中国, 香港, landups.com
158.78 ms  *  局域网
174.84 ms  *  局域网
1.65 ms  *  局域网
1.86 ms  *  局域网
3.17 ms  AS24429  中国, 香港, aliyun.com, 阿里云
3.84 ms  *  中国, 香港, chinaunicom.com, 联通
10.89 ms  AS10099  中国, 香港, chinaunicom.com, 联通
3.87 ms  AS10099  中国, 香港, chinaunicom.com, 联通
50.79 ms  AS4837  中国, 广东, 广州, chinaunicom.com, 联通
26.28 ms  AS4837  中国, 广东, 广州, chinaunicom.com, 联通
13.42 ms  AS17816  中国, 广东, 广州, chinaunicom.com, 联通
18.03 ms  AS17623  中国, 广东, 深圳, chinaunicom.com, 联通
11.93 ms  AS17623  中国, 广东, 深圳, chinaunicom.com, 联通
广州移动 120.196.165.24
0.24 ms  AS150452  中国, 香港, landups.com
2.76 ms  AS150452  中国, 香港, landups.com
5.33 ms  AS150452  中国, 香港, landups.com
0.90 ms  *  局域网
1.03 ms  *  局域网
1.74 ms  *  局域网
1.75 ms  *  局域网
3.03 ms  AS58453  中国, 香港, chinamobile.com, 移动
8.33 ms  AS58453  中国, 广东, 广州, chinamobile.com, 移动
16.71 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
37.77 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
20.41 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
13.29 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
17.47 ms  AS56040  中国, 广东, 深圳, chinamobile.com, 移动
```

### 测速
```
--------------------自动更新测速节点列表--本脚本原创--------------------
位置		 上传速度	 下载速度	 延迟	  丢包率
Speedtest.net	 296.24 Mbps	 67.75 Mbps	 3.03	  0.0%
中国香港	 339.89 Mbps	 177.59 Mbps	 6.19	  NULL
新加坡		 433.70 Mbps	 287.92 Mbps	 38.01	  NULL
联通海南	 4.54 Mbps	 135.45 Mbps	 171.43	  NULL
电信湖南5G	 19.39 Mbps	 166.48 Mbps	 75.82	  8.0%
电信成都	 225.34 Mbps	 158.61 Mbps	 94.44	  4.4%
```

## 评价
毕竟是 5rmb 不到的年付机，将就用就行

玩具机，最多也是探针加一

解锁 NF，虽然但是还不错 (?)

也就那样，猜测之后会有人溢价几块钱收

欢迎加入 High Ping 大家庭:
- [官网](https://highp.ing)
- [Blog](https://blog.c1oudf1are.eu.org)
- [@HighPingNetwork](https://t.me/HighPingNetwork)
- [@HighPingChat](https://t.me/highpingchat)