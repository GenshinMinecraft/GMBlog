---
title: Rackdog 冷门商家 $3 1C512M 测评
description: 我妈!
date: 2023-01-26
slug: ceping-rackdog
image: 5b7595e45ebeb.jpg
categories:
    - Main
    - CePing
---

# [测评] Rackdog 冷门商家 $3 1C512M 测评

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

测评区域为 Chicago, IL

IP：158.51.15.26

### 基础信息
```
---------------------基础信息查询--感谢所有开源项目---------------------
 CPU 型号          : Intel Xeon Processor (Skylake, IBRS)
 CPU 核心数        : 1
 CPU 频率          : 2700.034 MHz
 CPU 缓存          : L1: 0.00 KB / L2: 0.00 KB / L3: 0.00 KB
 硬盘空间          : 1.33 GiB / 19.20 GiB
 启动盘路径        : /dev/vda1
 内存              : 123.32 MiB / 480.99 MiB
 Swap              : [ no swap partition or swap file detected ]
 系统在线时间      : 0 days, 0 hour 4 min
 负载              : 0.27, 0.16, 0.08
 系统              : Ubuntu 18.04.6 LTS (x86_64)
 AES-NI指令集      : ✔ Enabled
 VM-x/AMD-V支持    : ❌ Disabled
 架构              : x86_64 (64 Bit)
 内核              : 4.15.0-200-generic
 TCP加速方式       : cubic
 虚拟化架构        : KVM
 NAT类型           : 独立映射,独立过滤,不支持回环
 IPV4 ASN          : AS398465 Rackdog, LLC
 IPV4 位置         : Chicago / Illinois / US
```
### CPU & 内存 & 硬盘
```
---------------------CPU测试--感谢lemonbench开源------------------------
 -> CPU 测试中 (Fast Mode, 1-Pass @ 5sec)
 1 线程测试(1核)得分: 		1192 Scores
---------------------内存测试--感谢lemonbench开源-----------------------
 -> 内存测试 Test (Fast Mode, 1-Pass @ 5sec)
 单线程读测试:		22511.40 MB/s
 单线程写测试:		16169.62 MB/s
------------------磁盘dd读写测试--感谢lemonbench开源--------------------
 -> 磁盘IO测试中 (4K Block/1M Block, Direct Mode)
 测试操作		写速度					读速度
 100MB-4K Block		6.5 MB/s (1589 IOPS, 16.11s)		13.7 MB/s (3346 IOPS, 7.65s)
 1GB-1M Block		217 MB/s (207 IOPS, 4.83s)		324 MB/s (309 IOPS, 3.23s)
---------------------磁盘fio读写测试--感谢yabs开源----------------------
Block Size | 4k            (IOPS) | 64k           (IOPS)
  ------   | ---            ----  | ----           ---- 
Read       | 100.31 MB/s  (25.0k) | 794.39 MB/s  (12.4k)
Write      | 100.58 MB/s  (25.1k) | 798.57 MB/s  (12.4k)
Total      | 200.89 MB/s  (50.2k) | 1.59 GB/s    (24.8k)           |                      |                     
Block Size | 512k          (IOPS) | 1m            (IOPS)
  ------   | ---            ----  | ----           ---- 
Read       | 775.58 MB/s   (1.5k) | 768.48 MB/s    (750)
Write      | 816.78 MB/s   (1.5k) | 819.66 MB/s    (800)
Total      | 1.59 GB/s     (3.1k) | 1.58 GB/s     (1.5k)
```

### 解锁检测
```
---------------------流媒体解锁--感谢sjlleo开源-------------------------
以下测试的解锁地区是准确的，但是不是完整解锁的判断可能有误，这方面仅作参考使用
----------------Youtube----------------
[IPv4]
连接方式: Youtube Video Server
视频缓存节点地域: ORD(ORD38S25)
Youtube识别地域: 加纳(GH)
----------------Netflix----------------
[IPv4]
您的出口IP可以使用Netflix，但仅可看Netflix自制剧
NF所识别的IP地域信息：美国
[IPv6]
您的网络可能没有正常配置IPv6，或者没有IPv6网络接入
---------------DisneyPlus---------------
[IPv4]
当前IPv4出口解锁DisneyPlus
区域：美国区
解锁Youtube，Netflix，DisneyPlus上面和下面进行比较，不同之处自行判断
----------------流媒体解锁--感谢RegionRestrictionCheck开源--------------
 以下为IPV4网络测试，若无IPV4网络则无输出
============[ Multination ]============
 Dazn:					Yes (Region: US)
 HotStar:				Yes (Region: US)
 Disney+:				No
 Netflix:				Originals Only
 YouTube Premium:			Yes (Region: GH)
 Amazon Prime Video:			Yes (Region: US)
 TVBAnywhere+:				Yes
 iQyi Oversea Region:			US
 Viu.com:				No
 YouTube CDN:				Chicago, IL 
 Netflix Preferred CDN:			Associated with [Astound Broadband] in [Chicago, IL ]
 Spotify Registration:			Yes (Region: US)
 Steam Currency:			USD
 ChatGPT:				Yes
 Bing Region:				US
=======================================
 以下为IPV6网络测试，若无IPV6网络则无输出
---------------TikTok解锁--感谢lmc999的源脚本及fscarmen PR--------------
 Tiktok Region:		【US】
 ```
 
### IP检测
 ```
 -------------------欺诈分数以及IP质量检测--本脚本原创-------------------
数据仅作参考，不代表100%准确，如果和实际情况不一致请手动查询多个数据库比对
以下为各数据库编号，输出结果后将自带数据库来源对应的编号
ipinfo数据库 ①  | scamalytics数据库 ②  | virustotal数据库 ③  | abuseipdb数据库 ④  | ip2location数据库   ⑤
ip-api数据库 ⑥  | ipwhois数据库     ⑦  | ipregistry数据库 ⑧  | ipdata数据库    ⑨  | ipgeolocation数据库 ⑩
欺诈分数(越低越好): 0②
abuse得分(越低越好): 0④
IP类型: 
  使用类型(usage_type):isp①  Data Center/Web Hosting/Transit⑤  isp⑧  business⑨  
  公司类型(company_type):isp①  isp⑧  
  云服务提供商(cloud_provider):  No⑧ 
  数据中心(datacenter):  No⑥ ⑨ 
  移动网络(mobile):  No⑥ 
  代理(proxy):  No① ② ⑥ ⑦ ⑧ ⑨ ⑩ 
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
  qq邮箱：No
  yandex邮箱: Yes
 ```
 
### TraceRoute
 ```
 ----------------三网回程--感谢zhanghanyun/backtrace开源-----------------
国家: US 城市: Chicago 服务商: AS398465 Rackdog, LLC
北京电信 219.141.136.12  测试超时
北京联通 202.106.50.1    联通4837[普通线路]           
北京移动 221.179.155.161 移动CMI [普通线路]           
上海电信 202.96.209.133  电信163 [普通线路]           
上海联通 210.22.97.1     联通4837[普通线路]           
上海移动 211.136.112.200 移动CMI [普通线路]           
广州电信 58.60.188.222   电信163 [普通线路]           
广州联通 210.21.196.6    联通4837[普通线路]           
广州移动 120.196.165.24  移动CMI [普通线路]           
成都电信 61.139.2.69     电信163 [普通线路]           
成都联通 119.6.6.6       联通4837[普通线路]           
成都移动 211.137.96.205  移动CMI [普通线路]           
---------------------回程路由--感谢fscarmen开源及PR---------------------
依次测试电信/联通/移动经过的地区及线路，核心程序来自ipip.net或nexttrace，请知悉!
广州电信 58.60.188.222
0.28 ms  *  局域网
0.30 ms  *  局域网
0.93 ms  AS174  美国, 伊利诺伊州, 芝加哥, cogentco.com
2.18 ms  AS174  美国, 伊利诺伊州, 芝加哥, cogentco.com
14.07 ms  AS174  美国, 密苏里州, 堪萨斯城, cogentco.com
25.68 ms  AS174  美国, 科罗拉多州, 丹佛, cogentco.com
35.70 ms  AS174  美国, 犹他州, 盐湖城, cogentco.com
49.93 ms  AS174  美国, 加利福尼亚州, 旧金山, cogentco.com
51.33 ms  AS174  美国, 加利福尼亚州, 圣何塞, cogentco.com
204.70 ms  AS4134  中国, 广东, 广州, chinatelecom.com.cn, 电信
201.28 ms  AS4134  中国, 广东, 广州, chinatelecom.com.cn, 电信
201.84 ms  AS4134  中国, 广东, 深圳, chinatelecom.com.cn, 电信
209.59 ms  AS4134  中国, 广东, 深圳, chinatelecom.com.cn, 电信
广州联通 210.21.196.6
0.28 ms  *  局域网
4.29 ms  *  局域网
0.90 ms  AS174  美国, 伊利诺伊州, 芝加哥, cogentco.com
2.52 ms  AS174  美国, 伊利诺伊州, 芝加哥, cogentco.com
13.99 ms  AS174  美国, 密苏里州, 堪萨斯城, cogentco.com
25.52 ms  AS174  美国, 科罗拉多州, 丹佛, cogentco.com
38.03 ms  AS174  美国, 德克萨斯州, 埃尔帕索, cogentco.com
46.51 ms  AS174  美国, 亚利桑那州, 凤凰城, cogentco.com
58.39 ms  http: 502  http: 502
59.01 ms  http: 502  http: 502
212.13 ms  http: 502  http: 502
217.12 ms  http: 502  中国, 广东, 广州, chinaunicom.com, 联通
217.43 ms  http: 502  中国, 广东, 广州, chinaunicom.com, 联通
217.17 ms  AS17816  中国, 广东, 深圳, chinaunicom.com, 联通
215.75 ms  AS17623  中国, 广东, 深圳, chinaunicom.com, 联通
广州移动 120.196.165.24
0.36 ms  *  局域网
0.58 ms  *  局域网
1.11 ms  AS174  美国, 伊利诺伊州, 芝加哥, cogentco.com
2.32 ms  AS174  美国, 伊利诺伊州, 芝加哥, cogentco.com
13.89 ms  AS174  美国, 密苏里州, 堪萨斯城, cogentco.com
25.53 ms  AS174  美国, 科罗拉多州, 丹佛, cogentco.com
38.33 ms  AS174  美国, 德克萨斯州, 埃尔帕索, cogentco.com
46.42 ms  AS174  美国, 亚利桑那州, 凤凰城, cogentco.com
58.16 ms  AS174  美国, 加利福尼亚州, 洛杉矶, cogentco.com
58.32 ms  AS174  美国, 加利福尼亚州, 洛杉矶, cogentco.com
58.29 ms  AS174  美国, 加利福尼亚州, 洛杉矶, cogentco.com
59.62 ms  AS58453  美国, 加利福尼亚州, 洛杉矶, chinamobile.com, 移动
58.36 ms  AS58453  美国, 加利福尼亚州, 洛杉矶, chinamobile.com, 移动
221.80 ms  AS58453  中国, 香港, chinamobile.com, 移动
215.36 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
215.51 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
223.13 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
224.44 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
218.30 ms  AS56040  中国, 广东, 深圳, chinamobile.com, 移动
```

### SpeedTest
```
--------------------自动更新测速节点列表--本脚本原创--------------------
位置		 上传速度	 下载速度	 延迟	  丢包率
Speedtest.net	 8849.05 Mbps	 8534.30 Mbps	 1.34	  0.0%
洛杉矶		 903.23 Mbps	 8855.56 Mbps	 59.39	  NULL
法兰克福	 231.28 Mbps	 916.86 Mbps	 104.67	  0.0%
联通上海5G	 9.75 Mbps	 1686.00 Mbps	 211.63	  0.0%
电信浙江	 5.86 Mbps	 538.76 Mbps	 192.39	  NULL
电信Nanjing5G	 68.32 Mbps	 3806.91 Mbps	 204.27	  1.3%
移动陕西5G	 105.71 Mbps	 2979.74 Mbps	 259.80	  1.0%
移动Chengdu	 341.01 Mbps	 3350.41 Mbps	 269.56	  0.0%
```

### Ping （Powered By Itdog）
![](https://i2.100024.xyz/2023/12/19/x317hj.webp)

### 完整测试Link
<https://paste.spiritlhl.net/code/QmkNZ2.txt>

## 评价
要我评价就是，小商家就是好

10G口为共享带宽（？）（猜测

但是大部分时间都可以跑满

只要稳定使用就行了，商家基本不管什么，BT也很松
