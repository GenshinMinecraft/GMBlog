---
title: 虚妄猫 美国 17 区 51 特殊优惠 1.49 RMB/M 小鸡 测评
description: 能用就行
date: 2024-05-02
slug: ceping-nomaius17
image: image.png
categories:
    - Main
    - CePing
---

# 虚妄猫 美国 17 区 51 特殊优惠 1.49 RMB/M 小鸡 测评

本文由 `High Ping Network` 的小伙伴 GenshinMinecraft 进行编撰，首发于 [本博客](https://blog.highp.ing)

## 机器基本信息

购买链接: <https://port.nomao.top/aff.php?aff=49> (AFF) - 特殊优惠

CPU: 1 * e3-1231
RAM: 512M
Disk: 3G
Bandwidth: 1G@2T (Share)
Platform: OpenVZ
IP: HE Tunnel Broker *1 (可免费添加 10 个)

需要注意的是，Cloudflare 屏蔽了来自 HE 的免费 IPv6 隧道，因为 HE 的 IPv6 实在是太黑了

价格 1.49 RMB / Month，续费同价

## 基础信息

```
---------------------基础信息查询--感谢所有开源项目---------------------
 CPU 型号          : Intel(R) Xeon(R) CPU E3-1231 v3 @ 3.40GHz
 CPU 核心数        : 1
 CPU 频率          : 3399.978 MHz
 CPU 缓存          : L1: 32.00 KB / L2: 256.00 KB / L3: 8.00 MB
 硬盘空间          : 2.87 GiB / 0.05 GiB
 启动盘路径        : /dev/ploop50386p1
 内存              : 49.20 MiB / 512.00 MiB
 Swap              : 52 KiB / 386.00 MiB
 系统在线时间      : 0 days, 0 hour 6 min
 负载              : 0.51, 0.15, 0.05
 系统              : Debian GNU/Linux 12 (bookworm) (x86_64)
 AES-NI指令集      : ✔ Enabled
 VM-x/AMD-V支持    : ✔ Enabled
 架构              : x86_64 (64 Bit)
 内核              : 3.10.0-1160.105.1.vz7.214.3
 TCP加速方式       : 未设置TCP拥塞控制算法
 虚拟化架构        : OpenVZ (Virutozzo)
 NAT类型           : Symmetric NAT
 IPV4 ASN          : AS13335 Cloudflare, Inc.
 IPV4 位置         : Miami / Florida / US
 IPV6 ASN          : AS6939 Hurricane Electric IPv6 tunnel broker
 IPV6 位置         : Winter Park / Florida / United States
 IPV6 子网掩码     : Unknown
```

## CPU & RAM & DISK

```
----------------------CPU测试--通过sysbench测试-------------------------
 -> CPU 测试中 (Fast Mode, 1-Pass @ 5sec)
 1 线程测试(单核)得分: 		823 Scores
---------------------内存测试--感谢lemonbench开源-----------------------
 -> 内存测试 Test (Fast Mode, 1-Pass @ 5sec)
 单线程读测试:		20545.96 MB/s
 单线程写测试:		11380.71 MB/s
------------------磁盘dd读写测试--感谢lemonbench开源--------------------
 -> 磁盘IO测试中 (4K Block/1M Block, Direct Mode)
 测试操作		写速度					读速度
 100MB-4K Block		390 MB/s (95.29 IOPS, 0.27s)		1.6 GB/s (391811 IOPS, 0.07s)
 1GB-1M Block		387 MB/s (369 IOPS, 2.71s)		878 MB/s (837 IOPS, 1.19s)
---------------------磁盘fio读写测试--感谢yabs开源----------------------
测试失败请替换另一种方式
```

## 流媒体

```
------------流媒体解锁--基于oneclickvirt/CommonMediaTests开源-----------
以下测试的解锁地区是准确的，但是不是完整解锁的判断可能有误，这方面仅作参考使用
----------------Netflix-----------------
[IPV4]
您的出口IP可以使用Netflix，但仅可看Netflix自制剧
NF所识别的IP地域信息：美国
[IPV6]
您的出口IP完整解锁Netflix，支持非自制剧的观看
NF所识别的IP地域信息：美国
----------------Youtube-----------------
[IPV4]
连接方式: Youtube Video Server
视频缓存节点地域: 中国香港(HKG12S20)
Youtube识别地域: 纽埃(null)
[IPV6]
连接方式: Youtube Video Server
视频缓存节点地域: IAD(IAD23S03)
Youtube识别地域: 纽埃(null)
---------------DisneyPlus---------------
[IPV4]
当前出口所在地区解锁DisneyPlus
区域：US区
[IPV6]
当前出口所在地区解锁DisneyPlus
区域：NL区
解锁Netflix，Youtube，DisneyPlus上面和下面进行比较，不同之处自行判断
----------------流媒体解锁--感谢RegionRestrictionCheck开源--------------
 以下为IPV4网络测试，若无IPV4网络则无输出
============[ Multination ]============
 Dazn:					Yes (Region: US)
 HotStar:				No
 Disney+:				Yes (Region: US)
 Netflix:				Originals Only
 YouTube Premium:			Yes
 Amazon Prime Video:			Yes (Region: US)
 TVBAnywhere+:				Yes
 iQyi Oversea Region:			US
 Viu.com:				No
 YouTube CDN:				Hong Kong 
 Netflix Preferred CDN:			Miami, FL  
 Spotify Registration:			Yes (Region: US)
 Steam Currency:			USD
 ChatGPT:				Yes
 Bing Region:				US
 Instagram Licensed Audio:		->
 Instagram Licensed Audio:		Yes
=======================================
 以下为IPV6网络测试，若无IPV6网络则无输出
============[ Multination ]============
 Dazn:					Failed (Network Connection)
 HotStar:				Yes (Region: US)
 Disney+:				No
 Netflix:				Yes (Region: US)
 YouTube Premium:			Yes
 Amazon Prime Video:			Unsupported
 TVBAnywhere+:				Failed (Network Connection)
 iQyi Oversea Region:			Failed
 Viu.com:				Failed
 YouTube CDN:				Washington DC 
 Netflix Preferred CDN:			Miami, FL  
 Spotify Registration:			Yes (Region: US)
 Steam Currency:			Failed (Network Connection)
 ChatGPT:				Failed
 Bing Region:				US
 Instagram Licensed Audio:		->
 Instagram Licensed Audio:		Yes
=======================================
---------------TikTok解锁--感谢lmc999的源脚本及fscarmen PR--------------
 Tiktok Region:		【US】
```

## IP

```
-------------------欺诈分数以及IP质量检测--本脚本原创-------------------
数据仅作参考，不代表100%准确，如果和实际情况不一致请手动查询多个数据库比对
以下为各数据库编号，输出结果后将自带数据库来源对应的编号
ipinfo数据库  ① | scamalytics数据库 ②  | virustotal数据库  ③ | abuseipdb数据库 ④  | ip2location数据库   ⑤
ip-api数据库  ⑥ | ipwhois数据库     ⑦  | ipregistry数据库  ⑧ | ipdata数据库    ⑨  | ipgeolocation数据库 ⑩
ipapiis数据库 ⑪ | ipapicom数据库    ⑫  | abstractapi数据库 ⑬ | ipqualityscore数据库 ⑭ 
欺诈分数(越低越好): 7⑤  abuse得分(越低越好): 0⑤  0.0027 (Low)⑪  威胁等级: low②  
IP类型: 
  使用类型(usage_type):hosting①  Content Delivery Network⑤  hosting⑧  hostinggeneral⑨  business⑪  
  公司类型(company_type):hosting①  hosting⑧  business⑪  
  云服务提供商(cloud_provider):  Yes⑧ 
  数据中心(datacenter):  No⑥   Yes⑨ ⑪ 
  移动网络(mobile):  No⑥ ⑪ 
  代理(proxy):  No① ②   Yes⑥ ⑦ ⑧ ⑨ ⑪ ⑫ 
  VPN(vpn):  Yes① ②   No⑦ ⑧ ⑪ 
  TOR(tor):  No① ② ⑦ ⑧ ⑨ ⑪ ⑫ 
  TOR出口(tor_exit):  No⑧ 
  搜索引擎机器人(search_engine_robot):② 
  匿名代理(anonymous):  No⑦ ⑧ ⑨ 
  攻击方(attacker):  No⑧   Yes⑨ 
  滥用者(abuser):  No⑧   Yes⑨ ⑪ 
  威胁(threat):  No⑧   Yes⑨ 
  iCloud中继(icloud_relay):  No① ⑧ ⑨ 
  未分配IP(bogon):  No⑧ ⑨ ⑪ 
Google搜索可行性：NO
------以下为IPV6检测------
欺诈分数(越低越好): 0②  abuse得分(越低越好): 0⑤  0.0016 (Low)⑪  威胁等级: low②  
IP类型: Data Center/Web Hosting/Transit⑤  business⑪
```

## Trace 

```
----------------三网回程--基于oneclickvirt/backtrace开源----------------
国家: US 城市: Miami 服务商: AS13335 Cloudflare, Inc.
北京电信 219.141.136.12  电信163    [普通线路] 
北京联通 202.106.50.1    联通4837   [普通线路] 
北京移动 221.179.155.161 移动CMI    [普通线路] 
上海电信 202.96.209.133  电信163    [普通线路] 
上海联通 210.22.97.1     联通4837   [普通线路] 
上海移动 211.136.112.200 移动CMI    [普通线路] 
广州电信 58.60.188.222   电信163    [普通线路] 
广州联通 210.21.196.6    联通4837   [普通线路] 
广州移动 120.196.165.24  移动CMI    [普通线路] 
成都电信 61.139.2.69     电信163    [普通线路] 
成都联通 119.6.6.6       联通4837   [普通线路] 
成都移动 211.137.96.205  移动CMI    [普通线路] 
准确线路自行查看详细路由，本测试结果仅作参考
同一目标地址多个线路时，可能检测已越过汇聚层，除了第一个线路外，后续信息可能无效
---------------------回程路由--感谢fscarmen开源及PR---------------------
依次测试电信/联通/移动经过的地区及线路，核心程序来自ipip.net或nexttrace，请知悉!
广州电信 58.60.188.222
0.16 ms  *  局域网
2.90 ms  AS13335  美国, 佛罗里达州, 迈阿密, cloudflare.com
2.27 ms  AS13335  美国, 佛罗里达州, 迈阿密, cloudflare.com
2.06 ms  AS1299  美国, 佛罗里达州, 迈阿密, telia.com
40.20 ms  AS1299  美国, 弗吉尼亚州, 雷斯顿, telia.com
98.24 ms  AS4134  美国, 加利福尼亚州, 圣何塞, chinatelecom.com.cn, 电信
252.01 ms  AS4134  中国, 广东, 广州, chinatelecom.com.cn, 电信
258.32 ms  AS4134  中国, 广东, 深圳, chinatelecom.com.cn, 电信
广州联通 210.21.196.6
0.18 ms  *  局域网
3.25 ms  AS13335  美国, 佛罗里达州, 迈阿密, cloudflare.com
2.68 ms  AS13335  美国, 佛罗里达州, 迈阿密, cloudflare.com
3.26 ms  AS7018  美国, 佛罗里达州, att.com
65.28 ms  AS7018  美国, 佛罗里达州, att.com
63.96 ms  AS7018  美国, 佛罗里达州, 奥兰多, att.com
65.15 ms  AS7018  美国, 佛罗里达州, 奥兰多, att.com
67.89 ms  AS7018  美国, 德克萨斯州, 休斯顿, att.com
67.48 ms  AS7018  美国, 德克萨斯州, 达拉斯, att.com
67.89 ms  AS7018  美国, 德克萨斯州, 达拉斯, att.com
66.80 ms  AS7018  美国, 加利福尼亚州, 洛杉矶, att.com
62.16 ms  AS7018  美国, 加利福尼亚州, 洛杉矶, att.com
247.85 ms  AS7018  美国, 加利福尼亚州, 洛杉矶, att.com
225.33 ms  AS4837  中国, 广东, 广州, chinaunicom.com, 联通
240.34 ms  AS4837  中国, 广东, 广州, chinaunicom.com, 联通
235.23 ms  AS17816  中国, 广东, 深圳, chinaunicom.com, 联通
231.26 ms  AS17623  中国, 广东, 深圳, chinaunicom.com, 联通
239.78 ms  AS17623  中国, 广东, 深圳, chinaunicom.com, 联通
广州移动 120.196.165.24
0.21 ms  *  局域网
3.42 ms  AS13335  美国, 佛罗里达州, 迈阿密, cloudflare.com
2.51 ms  AS13335  美国, 佛罗里达州, 迈阿密, cloudflare.com
2.45 ms  AS701  美国, 佛罗里达州, 迈阿密, verizon.com
61.01 ms  *  美国, 加利福尼亚州, 洛杉矶, verizon.com
61.34 ms  AS701  美国, 加利福尼亚州, 洛杉矶, verizon.com
61.58 ms  AS58453  美国, 加利福尼亚州, 洛杉矶, chinamobile.com, 移动
227.47 ms  AS58453  中国, 香港, chinamobile.com, 移动
232.71 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
226.71 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
242.97 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
238.01 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
230.58 ms  AS56040  中国, 广东, 深圳, chinamobile.com, 移动
```

## Speedtest

```
--------------------自动更新测速节点列表--本脚本原创--------------------
位置		 上传速度	 下载速度	 延迟	  丢包率
Speedtest.net	 197.93 Mbps	 517.35 Mbps	 0.72	  0.0%
洛杉矶		 561.18 Mbps	 474.10 Mbps	 66.92	  NULL
法兰克福	 165.96 Mbps	 289.26 Mbps	 104.62	  0.0%
联通上海5G	 566.81 Mbps	 517.80 Mbps	 228.47	  0.0%
移动Beijing	 23.40 Mbps	 239.12 Mbps	 259.72	  0.0%
```

## 小结

IPv4/v6 出口分别是 CF Warp 和 HE 免费隧道，可以说是很烂，但是解锁却出乎意料地可以，特别是 HE 那垃圾 IP 都能解锁 US Netflix？

1.49 RMB 就别要多好了，能跑就行，买来也是探针 +1

欢迎加入 High Ping 大家庭:
- [官网](https://highp.ing)
- [Blog](https://blog.highp.ing)
- [@HighPingNetwork](https://t.me/HighPingNetwork)
- [@HighPingChat](https://t.me/highpingchat)