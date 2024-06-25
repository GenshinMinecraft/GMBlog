---
title: DIYLink 免费 3 年 HK 机器 测评
description: 灵车得不能再灵车了
date: 2024-04-10
slug: ceping-diylinkfreehk
image: 5af86a1157cd1.jpg
categories:
    - Main
    - CePing
---

# DIYLink 免费 3 年 HK 机器 测评

本文由 `High Ping Network` 的小伙伴 GenshinMinecraft 进行编撰，首发于 [本博客](https://blog.highp.ing)

## 基本信息

机器配置: 1C1G & 25GB Disk & 1T@100Mbps

基本评价: 灵车，很灵车，开机开了三天才算开好，而且据传有收集信用卡风险

## 白嫖方法

链接在此: https://console.diylink.net/register?invitation_code=4bXyIlNWQa8BQ7Hj （有 AFF）

绑卡很好过

可购买最低配置 1c1g 25G 1T@100Mbps HK 服务器三年以上

PS: 售罄，其他不可使用余额付款

## 测试

测试脚本: [ECS融合怪](https://github.com/spiritLHLS/ecs)

### 基本信息

```
---------------------基础信息查询--感谢所有开源项目---------------------
 CPU 型号          : Intel Core Processor (Haswell, no TSX, IBRS)
 CPU 核心数        : 1
 CPU 频率          : 2499.988 MHz
 CPU 缓存          : L1: 64.00 KB / L2: 4.00 MB / L3: 16.00 MB
 硬盘空间          : 1.08 GiB / 24.44 GiB
 启动盘路径        : /dev/vda1
 内存              : 130.53 MiB / 964.59 MiB
 Swap              : [ no swap partition or swap file detected ]
 系统在线时间      : 0 days, 0 hour 39 min
 负载              : 0.46, 0.14, 0.05
 系统              : Debian GNU/Linux 11 (bullseye) (x86_64)
 AES-NI指令集      : ✔ Enabled
 VM-x/AMD-V支持    : ✔ Enabled
 架构              : x86_64 (64 Bit)
 内核              : 5.10.0-26-amd64
 TCP加速方式       : cubic
 虚拟化架构        : KVM
 NAT类型           : Restric NAT
 IPV4 ASN          : AS63888 TISP LIMITED
 IPV4 位置         : Hong Kong / Hong Kong / HK
```

### CPU && RAM && DISK

```
----------------------CPU测试--通过sysbench测试-------------------------
 -> CPU 测试中 (Fast Mode, 1-Pass @ 5sec)
 1 线程测试(单核)得分: 		769 Scores
---------------------内存测试--感谢lemonbench开源-----------------------
 -> 内存测试 Test (Fast Mode, 1-Pass @ 5sec)
 单线程读测试:		17348.40 MB/s
 单线程写测试:		12280.84 MB/s
------------------磁盘dd读写测试--感谢lemonbench开源--------------------
 -> 磁盘IO测试中 (4K Block/1M Block, Direct Mode)
 测试操作		写速度					读速度
 100MB-4K Block		3.0 MB/s (743 IOPS, 34.44s)		8.5 MB/s (2072 IOPS, 12.35s)
 1GB-1M Block		117 MB/s (111 IOPS, 9.00s)		117 MB/s (111 IOPS, 9.00s)
---------------------磁盘fio读写测试--感谢yabs开源----------------------
Block Size | 4k            (IOPS) | 64k           (IOPS)
  ------   | ---            ----  | ----           ---- 
Read       | 50.29 MB/s   (12.5k) | 107.04 MB/s   (1.6k)
Write      | 50.36 MB/s   (12.5k) | 107.60 MB/s   (1.6k)
Total      | 100.65 MB/s  (25.1k) | 214.65 MB/s   (3.3k)
           |                      |                     
Block Size | 512k          (IOPS) | 1m            (IOPS)
  ------   | ---            ----  | ----           ---- 
Read       | 98.59 MB/s     (192) | 97.46 MB/s      (95)
Write      | 103.83 MB/s    (202) | 103.95 MB/s    (101)
Total      | 202.42 MB/s    (394) | 201.42 MB/s    (196)
```

### 流媒体

```
---------------------流媒体解锁--感谢sjlleo开源-------------------------
以下测试的解锁地区是准确的，但是不是完整解锁的判断可能有误，这方面仅作参考使用
----------------Youtube----------------
[IPv4]
连接方式: Youtube Video Server
视频缓存节点地域: 中国香港(HKG33S01)
Youtube识别地域: 香港(HK)
----------------Netflix----------------
[IPv4]
您的出口IP完整解锁Netflix，支持非自制剧的观看
NF所识别的IP地域信息：香港
[IPv6]
您的网络可能没有正常配置IPv6，或者没有IPv6网络接入
---------------DisneyPlus---------------
[IPv4]
当前IPv4出口解锁DisneyPlus
区域：香港区
解锁Youtube，Netflix，DisneyPlus上面和下面进行比较，不同之处自行判断
----------------流媒体解锁--感谢RegionRestrictionCheck开源--------------
 以下为IPV4网络测试，若无IPV4网络则无输出
============[ Multination ]============
 Dazn:					Yes (Region: HK)
 HotStar:				No
 Disney+:				No
 Netflix:				Yes (Region: HK)
 YouTube Premium:			Yes (Region: HK)
 Amazon Prime Video:			Yes (Region: HK)
 TVBAnywhere+:				No
 iQyi Oversea Region:			HK
 Viu.com:				Yes (Region: HK)
 YouTube CDN:				Hong Kong 
 Netflix Preferred CDN:			Hong Kong  
 Spotify Registration:			No
 Steam Currency:			HKD
 ChatGPT:				Only Available with Mobile APP
 Bing Region:				HK
 Instagram Licensed Audio:		->
 Instagram Licensed Audio:		Yes
=======================================
 以下为IPV6网络测试，若无IPV6网络则无输出
---------------TikTok解锁--感谢lmc999的源脚本及fscarmen PR--------------
 Tiktok Region:		Failed
```

### IP

```
-------------------欺诈分数以及IP质量检测--本脚本原创-------------------
数据仅作参考，不代表100%准确，如果和实际情况不一致请手动查询多个数据库比对
以下为各数据库编号，输出结果后将自带数据库来源对应的编号
ipinfo数据库  ① | scamalytics数据库 ②  | virustotal数据库  ③ | abuseipdb数据库 ④  | ip2location数据库   ⑤
ip-api数据库  ⑥ | ipwhois数据库     ⑦  | ipregistry数据库  ⑧ | ipdata数据库    ⑨  | ipgeolocation数据库 ⑩
ipapiis数据库 ⑪ | ipapicom数据库    ⑫  | abstractapi数据库 ⑬ | ipqualityscore数据库 ⑭ 
欺诈分数(越低越好): 0⑤  abuse得分(越低越好): 0⑤  0.0039 (Low)⑪  威胁等级: low②  
IP类型: 
  使用类型(usage_type):hosting①  Data Center/Web Hosting/Transit⑤  hosting⑧  business⑪  
  公司类型(company_type):hosting①  hosting⑧  business⑪  
  云服务提供商(cloud_provider):  Yes⑧ 
  数据中心(datacenter):  No⑥ ⑨   Yes⑪ 
  移动网络(mobile):  No⑥ ⑪ 
  代理(proxy):  No① ② ⑥ ⑦ ⑧ ⑨ ⑪ ⑫ 
  VPN(vpn):  No① ② ⑦ ⑧ ⑪ 
  TOR(tor):  No① ② ⑦ ⑧ ⑨ ⑪ ⑫ 
  TOR出口(tor_exit):  No⑧ 
  搜索引擎机器人(search_engine_robot):② 
  匿名代理(anonymous):  No⑦ ⑧ ⑨ 
  攻击方(attacker):  No⑧ ⑨ 
  滥用者(abuser):  No⑧ ⑨ ⑪ 
  威胁(threat):  No⑧ ⑨ 
  iCloud中继(icloud_relay):  No① ⑧ ⑨ 
  未分配IP(bogon):  No⑧ ⑨ ⑪ 
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
国家: HK 城市: Hong Kong 服务商: AS63888 TISP LIMITED
北京电信 219.141.136.12  联通4837[普通线路]           
北京联通 202.106.50.1    联通4837[普通线路]           
北京移动 221.179.155.161 联通4837[普通线路]           
上海电信 202.96.209.133  联通4837[普通线路]           
上海联通 210.22.97.1     联通4837[普通线路]           
上海移动 211.136.112.200 联通4837[普通线路]           
广州电信 58.60.188.222   联通4837[普通线路]           
广州联通 210.21.196.6    联通4837[普通线路]           
广州移动 120.196.165.24  联通4837[普通线路]           
成都电信 61.139.2.69     联通4837[普通线路]           
成都联通 119.6.6.6       联通4837[普通线路]           
成都移动 211.137.96.205  联通4837[普通线路]           
---------------------回程路由--感谢fscarmen开源及PR---------------------
依次测试电信/联通/移动经过的地区及线路，核心程序来自ipip.net或nexttrace，请知悉!
广州电信 58.60.188.222
2.19 ms  *  局域网
5.15 ms  AS63888  中国, 香港
3.11 ms  AS63888  中国, 香港
2.42 ms  AS33491  美国, 伊利诺伊州, 芒特普罗斯佩克特, comcast.com
4.21 ms  AS10099  中国, 香港, chinaunicom.com, 联通
3.89 ms  AS10099  中国, 香港, chinaunicom.com, 联通
66.05 ms  AS10099  中国, 香港, chinaunicom.com, 联通
60.08 ms  AS4837  中国, 广东, 广州, chinaunicom.com, 联通
67.29 ms  AS4837  中国, 广东, 广州, chinaunicom.com, 联通
58.45 ms  AS4837  中国, 广东, 广州, chinaunicom.com, 联通
64.38 ms  AS4134  中国, 广东, 深圳, chinatelecom.com.cn, 电信
61.69 ms  AS4134  中国, 广东, 深圳, chinatelecom.com.cn, 电信
广州联通 210.21.196.6
2.14 ms  *  局域网
10.83 ms  AS63888  中国, 香港
14.97 ms  AS63888  中国, 香港
2.23 ms  AS33491  美国, 伊利诺伊州, 芒特普罗斯佩克特, comcast.com
4.15 ms  AS10099  中国, 香港, chinaunicom.com, 联通
5.88 ms  AS10099  中国, 香港, chinaunicom.com, 联通
60.65 ms  AS10099  中国, 香港, chinaunicom.com, 联通
63.71 ms  AS4837  中国, 广东, 广州, chinaunicom.com, 联通
59.56 ms  AS4837  中国, 广东, 广州, chinaunicom.com, 联通
64.80 ms  AS17816  中国, 广东, 广州, chinaunicom.com, 联通
71.33 ms  AS17623  中国, 广东, 深圳, chinaunicom.com, 联通
61.90 ms  AS17623  中国, 广东, 深圳, chinaunicom.com, 联通
广州移动 120.196.165.24
2.51 ms  *  局域网
14.41 ms  AS63888  中国, 香港
9.27 ms  AS63888  中国, 香港
6.01 ms  AS33491  美国, 伊利诺伊州, 芒特普罗斯佩克特, comcast.com
4.25 ms  AS10099  中国, 香港, chinaunicom.com, 联通
3.78 ms  AS10099  中国, 香港, chinaunicom.com, 联通
58.33 ms  AS10099  中国, 香港, chinaunicom.com, 联通
64.07 ms  AS4837  中国, 广东, 广州, chinaunicom.com, 联通
61.86 ms  AS4837  中国, 广东, 广州, chinaunicom.com, 联通
61.26 ms  AS4837  中国, 广东, 广州, chinaunicom.com, 联通
62.76 ms  AS4837  中国, 广东, 广州, chinaunicom.com, 联通
12.49 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
14.19 ms  AS9808  中国, 广东, 广州, chinamobile.com, 移动
13.53 ms  AS56040  中国, 广东, 深圳, chinamobile.com, 移动
--------------------自动更新测速节点列表--本脚本原创--------------------
位置		 上传速度	 下载速度	 延迟	  丢包率
Speedtest.net	 102.46 Mbps	 102.97 Mbps	 0.67	  NULL
中国香港	 101.25 Mbps	 100.33 Mbps	 2.49	  NULL
新加坡		 102.05 Mbps	 110.88 Mbps	 34.73	  0.0%
联通上海5G	 34.54 Mbps	 31.34 Mbps	 56.77	  NULL
联通海南	 103.57 Mbps	 109.88 Mbps	 77.82	  NULL
电信浙江	 104.92 Mbps	 8.05 Mbps	 75.03	  NULL
移动杭州5G	 103.82 Mbps	 111.06 Mbps	 31.97	  0.0%
移动Beijing	 101.67 Mbps	 105.35 Mbps	 69.11	  NULL
```

## 总结评价

emm，很灵车的商家，但是如果这个机器能稳一个月我暂且相信他

机器的话，白嫖的也就那样，CPU 700+，超开王 Azure B1s 都比不上

欢迎加入 High Ping 大家庭:
- [官网](https://highp.ing)
- [Blog](https://blog.highp.ing)
- [@HighPingNetwork](https://t.me/HighPingNetwork)
- [@HighPingChat](https://t.me/highpingchat)