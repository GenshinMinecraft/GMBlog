---
title: 搭建 Miaospeed 后端
description: By Poxei Doon
date: 2024-07-18
slug: miaospeed
image: image.png
categories:
  - Main
  - Linux
---
# MiaoSpeed

MiaoSpeed 于 4.0.0 与 MiaoKo 分离，正式成为独立的开源项目。一般来说，MiaoSpeed 依然被认为是 MiaoKo 的专用后端，但也能成为一个通用型后端。[[1]]

> Yet another server for universal connectivity debugging.

## 前言

MiaoSpeed 由**大喵**进行开发，它最初是作为 *MiaoKo* 测试机器人的专属后端，后来进行了开源，但作为主端的 MiaoKo 为商用机器人而并未开源。~~(甚至已经不卖跑路了)~~ 随后，由收藏柜编写的 [FullTclash](https://github.com/AirportR/fulltclash) 与 [koipy](https://github.com/koipy-org/koipy) 逐步实现了对 MiaoSpeed 的对接适配，目前大部分主端都采用这两个项目。

其中，主端可以放在任何地方，它主要负责接受 Telegram指令、解析订阅链接、负载均衡、任务分发，最后整合信息、生成图片。它不直接参与任何与节点的信息交流。后端则需要部署在模拟真实的环境中（例如，如果你希望测试得到的结果与普通家庭用户的体感类似，则你需要把后端部署在家宽后）。
一般来说典型的部署方式为：主端部署在国外，例如香港、日本等地。后端部署在国内（具有固定 IP 的商宽部署方式会容易很多，如果是动态且在 NAT 后的家宽，则需要自建 FRP）。[[2]]

### 关于后端共享

MiaoSpeed 后端是一个无状态的服务器。这意味着你可以和你的好友共享一个后端（后端测速任务采用 Round Robin 的方法，在同一时间只会有一个测速任务运行以保证结果尽可能准确。因此如果有过多的人共享一个后端并频繁使用 Speed 你会发现任务的速度会明显变慢。其他指令则没有这个影响）。[[2]]

## 关于数据安全

MiaoSpeed 不储存任何日志、且只会与 主端 和 节点服务器发生数据交换。[[2]]

## 搭建

### 手动搭建

#### 下载
手动搭建需要下载程序启动，需要在 GitHub 上下载。

MiaoSpeed 在 GitHub 上已进行了开源，官方的仓库为

> ```https://github.com/miaokobot/miaospeed```

但此仓库已停止维护，在2024年已Archieve，这里推荐以下几个仍在维护的分支

##### [墨少离分支](https://github.com/moshaoli688/miaospeed)

大部分 MiaoKo 都在使用的分支，可以说是官方分支的继承，较稳定但仍有一些 Bug。

对于想要对接 MiaoKo 的用户推荐使用此分支，目前对 FullTclash 的兼容性较差，不能测试流媒体。

##### [收藏柜分支](https://github.com/AirportR/miaospeed)

`FullTclash` 及 `koipy` 作者维护的分支，对这两个项目的兼容性极好，同时也保持了对 MiaoKo 官方的兼容。

此分支有许多先进特性，修复了 ipv6 等问题，也对队列进行优化，但不太稳定，更新可能出现 Bug。

对于想要对接 `FullTclash` 及 `koipy` 的用户推荐使用此分支。

##### [PaimonHub分支](https://github.com/Paimonhub/miaospeed_community)

由免费节点池提供方 [PaimonHub](https://t.me/nodpai) 维护的分支，但已一年未更新。

此分支支持自定义对接参数，可以修改官方预设的变量。

对于想要维护 MiaoSpeed 的开发者可以使用此分支进行测试。

### 启动命令 

> 以墨少离维护的分支为例 [[3]]

#### 子命令

##### server

> 启动miaospeed作为后端服务器

**启动 MiaoSpeed 作为后端应使用此命令**

子命令 server 的使用方法:
```
  -bind string
        绑定一个套接字，例如0.0.0.0:8080或/tmp/unix_socket
  -connthread uint
        并行线程处理正常连接任务(默认64)
  -mmdb string
        指定mmdb文件路径，多个文件可以使用逗号分隔，默认情况下不使用。
  -mtls
        启用miaoko certs TLS验证
  -nospeed
        禁止测速
  -pausesecond uint
        在每个速度作业之后暂停该时间(秒)
  -speedlimit uint
        测速速度限制(以字节每秒为单位)，默认没有限制
  -token string
        后端请求验证用的令牌
  -verbose
        打印系统日志
  -whitelist string
        bot白名单，启用后只允许名单内的bot链接后端，格式:1111,2222,3333
```

比如：

```bash
./miaospeed server -bind 0.0.0.0:9876 -token miaokomiaokoyyds -mtls -whitelist 6176969371,5209748886
```

这意思是，监听 `0.0.0.0` IP 上的 `9876` 端口，并设置后端密码 `miaokomiaokoyyds`，白名单Bot为 `6176969371` 和 `5209748886`。如果后端收到非法的请求（即没有用 `miaokomiaokoyyds` 串签名或来源主端 Botid 不是 `6176969371` 和 `5209748886`）则统统不会受理。[[2]]

如果你的主端和后端在同一台服务器上（虽然极不推荐），你还可以用 Linux 套接字的方法监听一个文件 socket：[[2]]

```bash
./miaospeed server -bind /tmp/miaoko.unix -token miaokomiaokoyyds
```

##### sciprt

> 运行临时脚本测试来测试脚本的正确性

```
"除了启动后端外，MiaoSpeed 可以单独测试流媒体脚本，但是无法生成图片。您可以运行以下指令查看" 
``` 

子命令 script 的使用方法:
```
  -file string
        指定脚本路径来进行测试
  -verbose
        打印系统日志
```

##### misc

> 提供MiaoSpeed额外功能

子命令 misc 的使用方法:
```
  -maxmind-update-license string
        指定一个 maxmind key 来更新数据库
  -verbose
        打印系统日志
```

#### 进程守护

启动 MiaoSpeed 后仍需进行进程守护，进程守护有多个方式，这里推荐使用 `systemd` 并提供一个示例的 `systemd` 配置。

```
[Unit]
Description=MiaoSpeed Service
After=network.target

[Service]
Type=simple
User=nobody
Restart=on-failure
RestartSec=5s
ExecStart=程序的绝对路径 启动命令
LimitNOFILE=1048576

[Install]
WantedBy=multi-user.target
```

### Docker 搭建

对于 Docker 搭建，这里推荐墨少离分支维护的 Docker。 [[3]]

默认端口：9966

#### 全局变量

```
MIAOSPEED_META              #启用META，默认不设置即可
MIAOSPEED_MTLS              #启用mtls,不启用不填写,启用:MIAOSPEED_MTLS=1
MIAOSPEED_TOKEN             #验证Token,例如：MIAOSPEED_TOKEN=xxxxx
MIAOSPEED_WHITELIST         #白名单，格式:MIAOSPEED_WHITELIST=1111,2222,3333
MIAOSPEED_NOSPEED           #禁止测速,不启用不填写.启用:MIAOSPEED_NOSPEED=1
MIAOSPEED_CONNTHREAD        #线程池设定，默认为64线程，如内存低于4G建议设置32或以下，例如：MIAOSPEED_CONNTHREAD=32
MIAOSPEED_MMDB              #是否启用MMDB
```

#### 一键启动命令

```
docker run -d -p 9966:9966 --name=miaospeed --restart=always  -e MIAOSPEED_MTLS=1 -e MIAOSPEED_TOKEN=<token>  moshaoli688/miaospeed:latest
```

#### Docker Compose

```yaml
services:
  miaospeed:
    image: moshaoli688/miaospeed:latest
    restart: "always"
    ports:
      - "9966:9966"
    environment:
      - TZ=Asia/Shanghai
      - MIAOSPEED_META=1
      - MIAOSPEED_MTLS=1
      - MIAOSPEED_WHITELIST=xxx,xxx,xxx
    mem_limit: 2048m
    logging:
      driver: "json-file"
      options:
        max-size: "200m"
        max-file: "3"
```

#### 更新MMDB

```
docker exec -it 容器名字 ./miaospeed misc -maxmind-update-license 你的key
docker restart 容器名字
```

## 编译

> 对于高玩选手，可以自己进行编译。

在 MiaoSpeed 官方仓库中有如下描述 [[1]]

由于 miaospeed 中含有部分证书与脚本并未开源，您需要补齐以下文件以成功编译:

1. `./utils/embeded/BUILDTOKEN.key`: 这是 `编译TOKEN`，它用于签名 miaospeed request 的结构体，以防止您的客户端使用不合规的 miaospeed 造成数据不真实的纠纷。您可以随便定义它，例如: `1111|2222|33333333`，不同段用 `|` 切开。
2. `./preconfigs/embeded/miaokoCA/miaoko.crt`: 当 `-mtls` 启用时，miaospeed 会读取这里的证书让客户端做 TLS 验证。
3. `./preconfigs/embeded/miaokoCA/miaoko.key`: 同上，这是私钥。(对于这两个您可以自己用 openssl 签一个证书，但它不能用于 miaoko。)
4. `./preconfigs/embeded/ca-certificates.crt`: miaospeed 自带的根证书集，防止有恶意用户修改系统更证书以作假 TLS RTT。（对于 debian 用户，您可以在安装 `ca-certificates` 包后，在 `/etc/ssl/certs/ca-certificates.crt` 获取这个文件）
5. `./engine/embeded/predefined.js`: 这个文件定义了 `JavaScript` (流媒体)脚本中一些通用方法，例如 `get()`, `safeStringify()`, `safeParse()`, `println()`，您可以自己实现它们，或者只是新建一个空文件。
6. `./engine/embeded/default_geoip.js`: 默认的 `geoip` 脚本，需要提供一个 `handler()` 入口函数。如果您不想提供默认的 `geoip` 脚本，则可以直接新建空文件（或者您可以直接拷贝 miaoko 提供的 `geoip` 脚本）。
7. `./engine/embeded/default_ip.js`: 默认的 `ip_resolve` 脚本，需要提供一个 `ip_resolve_default()` 入口函数，用于获取入口、出口的 IP。如果您不想提供默认的 `ip_resolve` 脚本，则可以直接新建空文件（或者您可以直接拷贝 miaoko 提供的 `geoip` 脚本里的 ip_resolve 函数）。

当您新建好以上文件后，就可以运行 `go build .` 构建 `miaospeed` 了。

很显然，为了验证后端的来源，MiaoSpeed 后端采用了极其复杂的验证设计。

对于 `编译token`，[@MiaoGroup](https://t.me/MiaoGroup) 已公布官方的 `编译token`

```
MIAOKO4|580JxAo049R|GEnERAl|1X571R930|T0kEN
```

对于 `miaoko.crt` 与 `miaoko.key`，由于官方并为公布 MiaoKo 所验证的证书与密钥，因此对接 MiaoKo 官方主端是不可能的。但对于 FullTclash 与 koipy，可以在配置内开启跳过证书验证来避免出现问题。

而对于 `geoip` 和 `ip_resolve` 脚本，由于官方并未提供，可以采用收藏柜自行编写的脚本以避免测试节点拓扑出现问题。[[4]]

在进行编译时，由于上游项目 `clash` 已删库，你可能需要修改 `go.sum` 文件以避免出现问题。

## 对接

> 对于开发者，可以尝试对接此后端。

显然的，MiaoSpeed 采用了极其复杂繁琐的验证方式，验证错误的数据都会被丢弃，因此自行对接是极其困难的。

目前可参考的代码有以下内容：

[多语言对接签名算法](https://www.msl.la/archives/564/)

[Python对接实现代码](https://github.com/koipy-org/koipy/blob/master/utils/types/miaospeed.py)

对于 MiaoSpeed 设计，则可以参考官方仓库中的描述。[[1]]

## 引用

[MiaoSpeed官方仓库](https://github.com/miaokobot/miaospeed)

[FullTclash项目仓库](https://github.com/AirportR/fulltclash)

[koipy项目仓库](https://github.com/koipy-org/koipy)

[MiaoKo官方文档](空气)

[翻翻墙社区-miaospeed部署指南](https://wwwold.ffqla.net/d/29-miaospeedbu-shu-zhi-nan)

[墨少离博客-miaospeed对接签名算法](https://www.msl.la/archives/564/)

[墨少离分支后端Docker](https://hub.docker.com/r/moshaoli688/miaospeed)

[1]: https://github.com/miaokobot/miaospeed
[2]: MiaoKo官方文档
[3]: https://wwwold.ffqla.net/d/29-miaospeedbu-shu-zhi-nan
[4]: https://github.com/AirportR/miaospeed/blob/master/engine/embeded