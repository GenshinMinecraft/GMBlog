---
title: DN42 最简教程
description: Glad to meet you, the DN42 Internet!
date: 2024-02-07
slug: dn42
image: dn42.png
categories:
    - Main
    - DN42
    - ASN
---

# DN42 最简教程

本文由 `High Ping Network` 的小伙伴 GenshinMinecraft 进行编撰，首发于 [本博客](https://blog.c1oudf1are.eu.org)

>**去中心化网络 42**（英语：Decentralized Network 42，简称 **dn42**），是一个[去中心化](https://zh.wikipedia.org/wiki/%E5%8E%BB%E4%B8%AD%E5%BF%83%E5%8C%96 "去中心化")、[端到端](https://zh.wikipedia.org/wiki/%E5%B0%8D%E7%AD%89%E7%B6%B2%E8%B7%AF "点对点网络")的网络，通过 [VPN](https://zh.wikipedia.org/wiki/%E8%99%9B%E6%93%AC%E7%A7%81%E4%BA%BA%E7%B6%B2%E8%B7%AF "虚拟专用网") 和软件或硬件 [BGP](https://zh.wikipedia.org/wiki/%E8%BE%B9%E7%95%8C%E7%BD%91%E5%85%B3%E5%8D%8F%E8%AE%AE "边界网关协议") 路由器构建。

> dn42 并非作为[暗网](https://zh.wikipedia.org/wiki/%E6%9A%97%E7%BD%91 "暗网")为接入者提供匿名链接，而是希望研究现有的[互联网](https://zh.wikipedia.org/wiki/%E4%BA%92%E8%81%94%E7%BD%91 "互联网")中已经存在的路由技术并尝试在用户间建立起直接的、无须进行 [NAT](https://zh.wikipedia.org/wiki/%E7%BD%91%E7%BB%9C%E5%9C%B0%E5%9D%80%E8%BD%AC%E6%8D%A2 "网络地址转换") 的连接。

> 这一网络不是全[网状结构](https://zh.wikipedia.org/wiki/%E7%BD%91%E7%8A%B6%E7%BD%91%E7%BB%9C "网状网络")的。在不同网络之间进行连通时，它极少使用物理链接而多用虚拟链接。这些虚拟链接以因特网作为传输介质，而又与因特网独立，更像是光纤或网线。每个人都用 VPN 连接的方式连通一个或多个接入者。这些连接在通常情况下使用公共互联网 [IP 地址](https://zh.wikipedia.org/wiki/IP%E5%9C%B0%E5%9D%80 "IP地址")。如果需要使用 [GRE](https://zh.wikipedia.org/wiki/GRE "GRE") 或 SIT，可以根据 IP 地址的变化，更新链接接口上的公共互联网地址。[OpenVPN](https://zh.wikipedia.org/wiki/OpenVPN "OpenVPN") 能够在没有外部工具协助的情况下做到这一点。在 VPN 连接上运行的 BGP 用于处理[自治系统](https://zh.wikipedia.org/wiki/%E8%87%AA%E6%B2%BB%E7%B3%BB%E7%BB%9F "自治系统")间的路由。自治系统内通常使用[开放式最短路径优先](https://zh.wikipedia.org/wiki/%E5%BC%80%E6%94%BE%E5%BC%8F%E6%9C%80%E7%9F%AD%E8%B7%AF%E5%BE%84%E4%BC%98%E5%85%88 "开放式最短路径优先")协议，不过显然接入者亦可使用方便他们进行自治系统内部路由的任何协议去完成。

## 前言

既然要做到最简，那必须一句废话也不多，所以本文不会有太多的解释或者说 "为什么"，只是会告诉你要**这么去做**

本文参考了:
- [Lan Tian @ Blog](https://lantian.pub/article/modify-website/dn42-experimental-network-2020.lantian/)
- [DN42 Getting Started](https://dn42.dev/howto/Getting-Started)

你需要:
- 一台机器 (建议 Debian 系列 Linux，且最好拥有 IPv4 & IPv6 双栈)
- 脑子 (其他无脑教程可以说不用脑子，但是配网有一大部分是脑力活动)
- 一个与你 Peer 的人 (本文采用 Potat0 提供的 Telegram 机器人)
- 掌握 Git, Bash, Gitea, SSH, PGP 等的基础用法

注意：本文只提供 IPv4 单栈教程，IPv6 大同小异

当你需要无偿/有偿帮助时，可以联系 Telegram: [@C1oudF1are](https://t.me/C1oudF1are)

## 在 DN42 网络上注册你自己的 ASN 以及 IP 段

### 在 DN42 的 Gitea 上注册好自己的账号

DN42 的 Gitea 地址为 <https://git.dn42.dev>

按照平常你在其他网站注册的思路，在 DN42 的 Gitea 注册一个账号，很简单

然后，从 [DN42](https://git.dn42.dev/dn42/registry) 主仓库 Fork 一份到自己的账号上，比如: 

`https://git.dn42.dev/YourUserName/registry`

这一步到这里就差不多了!

### PGP 验证

这一步为必选，不然无法通过 Git 仓库内的 CI/CD 验证

根据 [Github 的这篇文章](https://docs.github.com/zh/authentication/managing-commit-signature-verification/generating-a-new-gpg-key?platform=linux) 生成好自己的 PGP 公钥和密钥

并在 [DN42 Gitea Setting](https://git.dn42.dev/user/settings/keys) 导入自己的 PGP 密钥

*PS: 注意是 `管理 GPG 密钥` 不是 `管理 SSH 密钥`*

### 添加 SSH KEY

这一步和其他的 Git 服务都差不多，在本地生成好公钥与密钥并直接导入 [DN42 Gitea Setting](https://git.dn42.dev/user/settings/keys) 即可

```
ssh-keygen -C [YourEmail]
```

一路回车

随后，在 `~/.ssh/id_[加密].pub` 储存着你的公钥，将其导入 [DN42 Gitea Setting](https://git.dn42.dev/user/settings/keys)

*PS: 注意是 `管理 SSH 密钥` 不是 `管理 GPG 密钥`*

### 将 Fork 的仓库 Clone 到本地

将你刚才 Fork 的仓库 Clone 到本地，比如我的 Clone 链接就是 `git@git.dn42.dev:GenshinMinecraft/registry.git`

```bash
git clone git@git.dn42.dev:YourUsername/registry.git && cd registry
```

### 写好注册文件
一般来说，在仅 IPv4 的环境下，你至少需要 5 个文件来申请

首先在 [这个网站](https://explorer.burble.com/free#/asn) 和 [那个网站](https://explorer.burble.com/free#/4) 查看还未注册的 AS Number 和 IPv4 段

#### 提示

请注意，普通用户最好申请 `/27` 的段子，共有 32 个 IPv4，是完全够用的

当你申请过高的 IP 段时，有可能会被驳回，毕竟就算是在虚拟网络中，IPv4 也是十分珍贵的

随后，编写好这几个文件 (下面都是例子，各个项目的解释后面会说): 

#### data/person/\[YOURNAME\]-DN42

```
person:             [YourName]
contact:            [YourEmail]
nic-hdl:            [YOURNAME]-DN42
mnt-by:             [YOURNAME]-MNT
source:             DN42
```

#### data/mntner/\[YOURNAME\]-MNT

```
mntner:             [YOURNAME]-MNT
admin-c:            [YOURNAME]-DN42
tech-c:             [YOURNAME]-DN42
mnt-by:             [YOURNAME]-MNT
source:             DN42
auth:               pgp-fingerprint [你的PGP指纹]
remarks:            [INFO]
```

#### data/aut-num/AS\[ASN\]

```
aut-num:            AS[ASN]
as-name:            [YOURNAME]-AS
descr:              [INFO]
remarks:            [INFO]
admin-c:            [YOURNAME]-DN42
tech-c:             [YOURNAME]-DN42
mnt-by:             [YOURNAME]-MNT
source:             DN42
```

#### data/inetnum/\[IPRange\] (此处的 '/' 用 '\_' 代替)

```
inetnum:            [IPRangeStart] - [IPRangeEnd]
netname:            [YOURNAME]-IPV4
descr:              [INFO]
remarks:            [INFO]
country:            HK
admin-c:            [YOURNAME]-DN42
tech-c:             [YOURNAME]-DN42
mnt-by:             [YOURNAME]-MNT
status:             ASSIGNED
cidr:               [IPRange]
source:             DN42
```

#### data/route/[IPRange] (此处的 '/' 用 '\_' 代替)
```
route:              [IPRanges]
descr:              [INFO]
remarks:            [INFO]
origin:             AS[ASN]
mnt-by:             [YOURNAME]-MNT
source:             DN42
max-length:         [CIDR 掩码位]
```

#### 各项说明

- `[YourName]`: 这部分填写你的名字，**大小写均可**
- `[YOURNAME]`: 这部分也是填写你的名字，**必须为大写**
- `[ASN]`: 这部分填写你的 AS Number，不带 `AS` 前缀
- `[INFO]`: 这部分随便填写，只作为解释说明，可以写一些自己的联系方式以及个人信息
- `[YourEmail]`: 这部分填写你的联系邮箱，请注意一定要可以**接收发送信息**
- `[你的PGP指纹]`: 这部分请根据上面生成 PGP KEY 的部分获取
- `[IPRange]`: 这部分填写你的 IP 段，请注意**在文件名中的 CIDR 的 '/' 需要使用 '\_' 来表示**
- `[IPRangeStart]`: 这部分是你的 IP 段的开始 IP，可以在[这个网站](https://zh.rakko.tools/tools/27/)解析出来
- `[IPRangeEnd]`: 这部分是你的 IP 段的结束 IP，解析方法同上
- `[CIDR 掩码位]`: 你的 IP 段中 '/' 后面的数字

#### 填写示例

比如，我的各项信息为: 

- `[YourName]`: `GenshinMinecraft`
- `[YOURNAME]`: `GENSHINMINECRAFT`
- `[ASN]`: `4242421304`
- `[INFO]`: 随便
- `[YourEmail]`: `genshinminecraft114514@gmail.com`
- `[你的PGP指纹]`: `ab640628a6fe32c749f36b4426dccbe66925e159`
- `[IPRange]`: `172.21.79.128/27`
- `[IPRangeStart]`: `172.21.79.128`
- `[IPRangeEnd]`: `172.21.79.159`
- `[CIDR 掩码位]`: `27`

为了版面，我就不贴上我的完整配置了，可以从[我的 PR](https://git.dn42.dev/dn42/registry/pulls/3168/files) 看见

### Push 并创建 PR

当你在本地修改完成文件后，就可以准备 Push 到你自己的 Git 仓库了

```
git add .
git commit -S
./squash-my-commits
git push -f
```

其中，`./squash-my-commits` 的作用为合并 Commits，因为 DN42 要求必须在同一个 Commit 内完成所有的操作

`git commit -S` 中的 `-S` 代表使用 PGP 签名该 Commit，提供安全性验证

随后，回到 DN42 Gitea，在[官方仓库 PR 界面](https://git.dn42.dev/dn42/registry/compare/master...master)创建一个 PR 提交

`合并到` 不需要更改，`拉取从` 选择你自己的仓库，然后点击 `创建合并请求`

在 PR 界面中随便写点啥，记住要用英文写

我写的非常简单，标题和内容都为 `GLAD！`

### 按照提示修改配置

一般来说，提交 PR 后会有机器人为你检查你的文件的合法性

只要你按照上面的模板写，应该是没有问题的

当出现 `need work` 标签时，不要慌张，看看机器人给出的提示，翻译成中文根据他提示来修改

如果你尚未申请 IPv6，比如我，你应该会收到这样的提示:

`💡 Are you sure you don't want to also register an IPv6 prefix ?`

你回复它 `YES` 即可，当然你随时想加就加，问题不是很大

### 完成 DN42 的申请

当你的 PR 已经被合并的时候，你就已经在 DN42 立足了

下面，就是要与他人 Peer，与 DN42 中的各位连接

DN42 是十分 Friendly 的，当你把网配炸，也不会有人责怪你，而是教你如何正确配网

## 配网

### 在机器上安装好必要依赖

本文以 Debian 系列系统作为演示，其他系统自己看着办

```bash
apt install bird2 wireguard
```

随后，生成 WireGuard 的 公钥以及密钥

```bash
wg genkey | tee privatekey | wg pubkey > publickey
```

打开 Kernel 中的数据包 Forward 功能，关闭 Kernel 中的 rp_filter 严格模式

```bash
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.forwarding=1" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.forwarding=1" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.rp_filter=0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.rp_filter=0" >> /etc/sysctl.conf
sysctl -p
```

### 在 Potat0 机器人创建 Peer 信息

本文采用了 DN42 中的热心人 Potat0 创建的 Bot 来进行配网，非常感谢 Ta 的付出

转到 [Telegram:@Potat0_DN42_Bot](https://t.me/Potat0_DN42_Bot)

#### 登录

##### 确认ASN

发送 '/login' 以登录你的 ASN

```
Enter your ASN, without prefix AS
请输入你的 ASN，不要加 AS 前缀
```

```
4242421304
```
##### 通过邮箱验证

随后通过邮箱验证

```
Select the email address to receive the verification code.
选择接收验证码的邮箱。
```

```
genshinminecraft114514@gmail.com
```

```
Verification code has been sent to your email.
验证码已发送至您的邮箱。
Please contact @Potat00000 if you can not receive it.
如果无法收到请联系 @Potat00000
Enter your verification code:
请输入验证码：
```

然后在邮箱等待验证码，发送回 Bot

```
xxxxxxxxxxxxxxxxxx
```

```
Welcome!

GENSHINMINECRAFT AS4242421304

欢迎你！

GENSHINMINECRAFT AS4242421304
```

#### 创建一个 Peer

对 Bot 发送 `/peer`

##### 选择一个节点

```
You will peer with me through the following identity:  
你将通过以下身份与我 Peer：  

AS4242421304

  
  
If it is wrong, please use /cancel to interrupt the operation.  
如果有误请输入 /cancel 终止操作。  
  
Any problems with the AutoPeer process, please contact @Potat00000  
AutoPeer 过程中产生任何问题，请联系 @Potat00000  
  
Node List 节点列表  
-

US1 | Las Vegas, USA | BuyVM

  
  ✔️ Open For Peer  
  ✔️ Capacity: 52 / Unlimited  
  ✔️ IPv4: Yes  
  ✔️ IPv6: Yes  
  
-

HK1 | Hong Kong | Skywolf


  ✔️ Open For Peer  
  ✔️ Capacity: 41 / Unlimited  
  ✔️ IPv4: Yes  
  ✔️ IPv6: Yes  
  
-

NO1 | Sandefjord, Norway | Terrahost

  
  ✔️ Open For Peer  
  ✔️ Capacity: 27 / Unlimited  
  ✔️ IPv4: Yes  
  ✔️ IPv6: Yes  
  
Which node do you want to choose?  
你想选择哪个节点？
```

```
US1 | Las Vegas, USA | BuyVM  
```

##### 配置 DN42 内网 IP

```
What routes do you want to transmit with me?  
你想和我传递哪些路由？  
```

```  
IPv4 only  
```

```
Input your DN42 IPv4 address, without /L suffix.  
请输入你的 DN42 IPv4 地址，不包含 /L 后缀。
```

然后，在你的 IP 段内挑选一个 IP，请注意，IP 段中的第一个 IP 以及最后一个 IP 都是**不可用**的

比如我挑选了 `172.21.79.131` ，发送给 Bot

```
172.21.79.131
```

##### 配置公网 IP && Port

```
Input your clearnet address for WireGuard tunnel, without port.  
请输入你用于 WireGurad 隧道的公网地址，不包含端口。  
  
You can use IPv4 or IPv6 to establish a tunnel with me.  
你可以使用 IPv4 或者 IPv6 与我建立隧道。  
  
If you don't have a static clearnet address or is behind NAT, please contact @Potat00000  
如果你没有静态公网地址，或你的服务器在 NAT 网络中，请联系 @Potat00000
```

然后输入你的公网地址，可以是域名，也可以是 IP，当然也允许 IPv6

为了隐私，我把我的 IP 打码了

```
xx.xx.xx.xx
```

```
Input your port for WireGuard tunnel.  
请输入你用于 WireGurad 隧道的端口。  
```

选择一个 **你具有完全访问权限的端口**，为什么要着重说出来呢，主要是部分 Nat 机器只有一定数量的端口，非全端口，只能选择暴露在公网的端口

一般来说，DN42 使用的 WireGuard 端口都是以 `2[ASN 后四位]` 来编写的，不过是可以自定义的，这只是一个习惯，比如我的第一个端口就为 `21304`

```
48306  
```

##### WireGuard 公钥

```  
Input your WireGuard public key  
请输入你的 WireGuard 公钥
```

这个公钥储存在上方生成的 `publickey` 文件中，复制粘贴过来即可

为了隐私，我还是乱打（

```
xxxxxxxxxxxxxxxxxxxxxxxx
```

##### 联系方式

```
Input your contact information (Telegram or Email)  
请输入你的联系方式（Telegram 或 Email）
```

```
@C1oudF1are
```

这部分写可以联系到自己的即可，问题不大

##### 确认信息并建立

```
Please check all your information  
请确认你的信息  
  

Region:  
    US1 | Las Vegas, USA | BuyVM  
Basic:  
    ASN:         4242421304  
    Channel:     IPv4 only  
    MP-BGP:      Not supported  
    IPv6:        Not enabled  
    IPv4:        172.21.79.131  
    Request-LLA: Not required due to not use LLA as IPv6  
Tunnel:  
    Endpoint:    xx.xx.xx.xx:48306
    PublicKey:   xxxxxxxxxxxxxxxxxxxxxxxx  
Contact:  
    @C1oudF1are  

  
Please enter an yes to confirm. All other inputs indicate the cancellation of the operation.  
确认无误请输入 yes，所有其他输入表示取消操作。
```

```
yes
```

```
Peer has been created  
Peer 已建立
```

##### 获取 Peer Info

向机器人发送 `/info`

```
Node:  
    US1 | Las Vegas, USA | BuyVM  
Information on your side:  
    ASN:  
        AS4242421304  
    Endpoint:  
        xx.xx.xx.xx:48306  
    WireGuard Public Key:   
        xxxxxxxxxxxxxxxxxxxxxxxx
    DN42 Address:  
        IPv4: 172.21.79.131/32  
Information on my side:  
    ASN:  
        AS4242421816  
    Endpoint:  
        us1.dn42.potat0.cc:21304  
    WireGuard Public Key:  
        LUwqKS6QrCPv510Pwt1eAIiHACYDsbMjrkrbGTJfviU=  
    DN42 Address:  
        IPv4: 172.23.246.3/32  
WireGuard Status:  
    Latest handshake:  
        Never  
    Transfer:  
        0B received, 13.3 KB sent  
Bird Status:  
    IPv4 Session with IPv4 channel only  
    Connect  
Contact:  
    @C1oudF1are  
    (GENSHINMINECRAFT)
```

这样就算完成了 Peer 的建立，接下来就是配置你自己机器的环境咯！

### 配置 WireGuard

#### 编写配置文件

这个配置当然是有模板的

配置文件一般储存于 `/etc/wireguard/xxx.conf`

建议将配置文件存于 `/etc/wireguard/potat0.conf`

```
[Interface]
# 你的 WireGuard 私钥，存储于上方生成 privitekey 文件中
PrivateKey = [PrivateKey]

# 你的端口号，上方输入的公网 IP 与公网端口
ListenPort = [Port]
Table = off

# 第一个是你的 DN42 内的 IP，第二个是我的（或者你的 Peer 的）
PostUp = ip addr add [你的 DN42 IP] peer [Potat0 的 DN42 IP] dev %i
PostUp = sysctl -w net.ipv6.conf.%i.autoconf=0

[Peer]
PublicKey = [Potat0 的公钥]
Endpoint = [Potat0 的公网服务器 IP:Port]

AllowedIPs = 10.0.0.0/8, 172.20.0.0/14, 172.31.0.0/16, fd00::/8, fe80::/64
```

这些配置，均可从上方的 Info 信息中获取到，编辑完保存并退出

#### 开启 WireGuard 隧道

```bash
wg-quick up potat0
```

当无报错输出时，即为配置成功

```bash
[#] ip link add potat0 type wireguard
[#] wg setconf potat0 /dev/fd/63
[#] ip link set mtu 2720 up dev potato
[#] ip addr add [你的 DN42 IP] peer [Potat0 的 DN42 IP] dev potat0
[#] sysctl -w net.ipv6.conf.potat0.autoconf=0
net.ipv6.conf.potato.autoconf = 0
```

#### 检查连接

你可以使用 `wg` 命令来查看目前所有运行着的隧道

在目前，你可以通过 Ping Potat0 DN42 IP 的方式来检查是否已经通过 WireGuard 连接到 Potat0 的服务器

```bash
ping 172.23.246.4
```

```
PING 172.23.246.3 (172.23.246.4) 56(84) bytes of data.
64 bytes from 172.23.246.3: icmp_seq=1 ttl=64 time=428 ms
64 bytes from 172.23.246.3: icmp_seq=2 ttl=64 time=441 ms
64 bytes from 172.23.246.3: icmp_seq=3 ttl=64 time=417 ms
64 bytes from 172.23.246.3: icmp_seq=4 ttl=64 time=407 ms
```

有正常返回，说明是正常的。但这**不代表你已经完全融入了 DN42**，这只不过是你与 Potat0 建立了一个 VPN 而已

### 配置 Bird2

终于到本文章的重头戏了，Bird2 的配置是在 DN42 路上最难的一个部分，你需要对 BGP、路由等知识有最浅的了解

但是我认为还好，反正都是模板的事情（

#### 下载 Roa 文件

这个文件，主要是类似于分流的，如果你不了解，请谷歌

如果你认为没有必要去了解，直接运行以下命令就行

```bash
wget -4 -O /tmp/dn42_roa.conf https://dn42.burble.com/roa/dn42_roa_bird2_4.conf && mv -f /tmp/dn42_roa.conf /etc/bird/dn42_roa.conf
wget -4 -O /tmp/dn42_roa_v6.conf https://dn42.burble.com/roa/dn42_roa_bird2_6.conf && mv -f /tmp/dn42_roa_v6.conf /etc/bird/dn42_roa_v6.conf
mv /etc/bird/dn42_roa_v6.conf /etc/bird/roa_dn42_v6.conf
mv /etc/bird/dn42_roa.conf /etc/bird/roa_dn42.conf
```

该脚本来自于 `High Ping Network` 的小伙伴 sam，懒得改了，复制粘贴就能用不是很爽吗 

#### 编写 Bird2 主配置文件

Bird2 的主配置文件默认放在 `/etc/bird/bird.conf`，我们即将要编辑它

```
define OWNAS       = 4242421304;
define OWNIP       = 172.21.79.130;
define OWNNET      = 172.21.79.128/27;
define OWNNETSET   = [ 172.21.79.128/27 ];

router id OWNIP;

protocol device {
    scan time 10;
}

function is_self_net() {
    return net ~ OWNNETSET;
}

function is_valid_network() {
    return net ~ [
        172.20.0.0/14{21,29}, # dn42
        172.20.0.0/24{28,32}, # dn42 Anycast
        172.21.0.0/24{28,32}, # dn42 Anycast
        172.22.0.0/24{28,32}, # dn42 Anycast
        172.23.0.0/24{28,32}, # dn42 Anycast
        172.31.0.0/16+,       # ChaosVPN
        10.100.0.0/14+,       # ChaosVPN
        10.127.0.0/16{16,32}, # neonetwork
        10.0.0.0/8{15,24}     # Freifunk.net
    ];
}

roa4 table dn42_roa;

protocol static {
    roa4 { table dn42_roa; };
    include "/etc/bird/roa_dn42.conf";
};

protocol kernel {
    scan time 20;

    ipv4 {
        import none;
        export filter {
            if source = RTS_STATIC then reject;
            krt_prefsrc = OWNIP;
            accept;
        };
    };
}

protocol static {
    route OWNNET reject;

    ipv4 {
        import all;
        export none;
    };
}

template bgp dnpeers {
    local as OWNAS;
    path metric 1;

    ipv4 {
        import filter {
            if is_valid_network() && !is_self_net() then {
                if (roa_check(dn42_roa, net, bgp_path.last) != ROA_VALID) then {
                    print "[dn42] ROA check failed for ", net, " ASN ", bgp_path.last;
                    reject;
                }
                accept;
            }
            reject;
        };

        export filter {
            if is_valid_network() && source ~ [RTS_STATIC, RTS_BGP] then accept;
            reject;
        };
        import limit 1000 action block;
    };

}

include "/etc/bird/peers/*.conf";
```

由于这个配置文件的语法有些抽象，所以我直接贴上我的配置了

主要需要修改的仅为前四行:
- 第一行为 ASN，记得不要加上 `AS`
- 第二行为你的 DN42 IP
- 第三行为你 ASN 其中的 IP 段
- 第四行同第三行，但是要记得*不要删去两边的空格以及中括号*

真心不建议动不动就抄模板，无法理解其中的含义，是对技术进步没有帮助的！

建议参阅: [BIRD User's Guide](https://bird.network.cz/?get_doc&f=bird.html&v=20)

#### 编写 Bird2 Peers 文件

新建一个 `/etc/bird/peers/` 文件夹，并在其中创建 `potat0.conf`

```potat0.conf
protocol bgp peers from dnpeers {
    neighbor [Potat0 的 DN42 IP] as [Potat0 的 ASN];
}
```

这个配置非常简单，需要的内容也可以在上面获取到的 Info 看到

#### Bird2? 启动!

启动 Bird2 仅需一行命令 

```bash
birdc c
```

可以通过 `birdc s p` 查看 Bird2 的状态

`peers      BGP        ---        up     13:01:51.314  Established`

当输出显示 `Established` 时，也配置得差不多了

## ALL DONE!

当你完成上述所有步骤，恭喜你，你即将完成好你第一次 DN42 之旅，现在只需要动动你的小手，在终端输入: 

```bash
ping 172.20.0.53
```

当其可以正常输出

```
PING 172.20.0.53 (172.20.0.53) 56(84) bytes of data.
64 bytes from 172.20.0.53: icmp_seq=1 ttl=62 time=471 ms
64 bytes from 172.20.0.53: icmp_seq=2 ttl=62 time=412 ms
64 bytes from 172.20.0.53: icmp_seq=3 ttl=62 time=415 ms
64 bytes from 172.20.0.53: icmp_seq=4 ttl=62 time=435 ms
```

你就已经跨入了 DN42 的大门，Ping 命令所选的为 DN42 中的 DNS 服务器

## 小结

总的来说，DN42 的配置的确是非常具有难度以及挑战性的，但是其带来的成就感也是无与伦比的

我们会在后面持续推出有关于 DN42 的 域名、DNS 配置教程等博文

当你需要无偿/有偿帮助时，可以联系 Telegram: [@C1oudF1are](https://t.me/C1oudF1are)

当然，我们也欢迎在 DN42 网络中 Peer，详情请移步 [@HighPingChat](https://t.me/HighPingChat)

欢迎加入 High Ping 大家庭:
- [官网](https://highp.ing)
- [Blog](https://blog.c1oudf1are.eu.org)
- [@HighPingNetwork](https://t.me/HighPingNetwork)
- [@HighPingChat](https://t.me/highpingchat)