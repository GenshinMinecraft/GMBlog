---
title: NodeGet NS 探针 Intro 
description: 两个月啊两个月，没碰过博客
date: 2025-12-24
slug: nodeget-intro
image: https://img.genmin.icu/p/nodeget-intro/image-1.png
categories:
    - Main
    - NodeGet
---

# NodeGet NS 探针 Intro

Hi，这里是 GenshinMinecraft，有幸参与这次的 NodeGet 探针项目的后端开发

- 官网 & 文档: <https://nodeget.com/>
- Github Repo: <https://github.com/NodeSeekDev/NodeGet>
- 其他前端、频道、群组等暂未公开

老实说，我也不知道五月一日是否可以发第一个 Release

开始写这篇文章是 2026.4.27 22:49 分，刚刚我还问酒神：

![alt text](https://img.genmin.icu/p/nodeget-intro/image.png)

## 一些琐事

### 关于我

我在论坛看到了有很多人期待 NodeGet 的正式出场，我也看到了有人对我的质疑：<https://www.nodeseek.com/post-704190-1>

这不重要，我自认为有条件，有这个技术能力去写好这个探针项目：
- 写过 [`komari-agent-rs`](https://github.com/GenshinMinecraft/komari-monitor-rs)
- 有些许 Rust 经验
- 有充足的时间

这就够了

### 关于项目组

我还是感觉这个项目组成员非常奇特

酒神在整个团队中成员分配类似于测试 + 项目经理的组合，感谢他测试后提出的 Bugs

后端有，且仅有我一个人主力开发，说实话很累，正式发布后，请积极贡献 / Review 代码，提交 Bugs

前端由多位开发者共同并行，效率很高，值得称赞

请不要忽视前端的开发工作，在我看来前端在这个项目中占的份额可不小。特别是新功能适配，各种高端图表渲染等，特别好看！

前端还有各种可拓展功能，可能第三方前端（真的有人会写一个如此复杂的第三方前端吗）适配有点困难，也欢迎和我们开发成员讨论

### 关于 AI

都 2026 年了，大家也都不是什么不开明的人，项目用 AI 已经不足为怪了

大胆承认，本项目的 API（也就是和用户交互的主要地方）有 75% 左右都是 AI 代工的；API 部分主要占整个项目的 40% 左右，掐指一算就是 30% 的地方用到了 AI Agent

每一行我都 Review 了，这请放心。核心内部逻辑，特别是有关 Token 鉴权部分，全都是手写的👋（有的时候还不如 AI 写的呢）

哦对了，这篇 Intro 百分百纯人工，不会`稳稳地将你接住`的！

## 正文

说了这么多，开始吧

本文的主要目的不是教你安装 NodeGet 探针项目，而是介绍 NodeGet 探针项目的主要设计理念、与其他同类项目的区别等

相反的，本文的一些东西可能是你不喜欢 NodeGet 探针的原因，所以这也算一个避坑指南

写 NodeGet 从来不是为了取代 Komari/Nezha 等项目，相比之下，探针只是其中一个非常小的功能罢了...

### 技术栈

后端开发语言是 Rust，不是为了什么 RIIR 或者炫技，只是为了跨平台与高性能，除了 `rquickjs` 外无其他语言依赖

通信协议选择了 WebSocket + JSON-RPC 2.0，这是一套比较常见的微服务技术栈，同时也兼容了 HTTP POST，都可以调用，基本无区别

数据库选择了我最熟悉的 PostgreSql 和最广泛的 SqLite，前者对应大量 Agent 的服务，后者适合小型部署

需要说明的是，其实整个 Server 整体占用并不会很低（特别是数据库储存），由于需要大量数据库操作，个人推荐 2C2G 20GB 可用空间以上的机器部署

不是说什么 0.1C32M 机器无法部署 Server（当然 Agent 可行），只不过你部署下来真不一定能用...

### Token 系统

NodeGet 的亮点之一，所有的 CRUD 操作都应该提供一个有效的 Token，也就是常说的 `Api Key` / `校验令牌` 等，但是为了方便，本项目统称 Token

本项目有且仅有一个超级用户 Token，即 SuperToken，在初始化数据库时会生成，它可以跳过所有的权限限制，请不要外泄

#### 表达方式

一个 Token 可以有两种表达方式:

- `TOKEN_KEY:TOKEN_SECRET`: 用 `:` 分割，Token Key 明文储存，Token Secret 加密，不可指定，自动生成随机字符串
- `Username|Password`: 用 `|` 分割，Username 明文储存，Password 加密，可以指定，也可以为空

这两种在语义上完全相同，需要提供 Token 的地方，这两种格式都可以被接受，指代同一个 Token 时，具有相同的效力

今后，你会持续遇到这样的 Token

#### 设计方案

一个 Token 最重要的就是其中规定的 TokenLimit，该结构体下面是 Vec<Scope> 与 Vec<Permission>，具体解释如下：

Scope 的意义是作用域，它代表了这个 Token 可以生效的范围

Permission 的意义是具有的权限，在指定的 Scope 下，具有的权力

比如一个类似下面的结构体：

```json
{
  "scopes": [
    {
      "agent_uuid": "53f125b6-e7aa-447f-a27c-085a53a36462"
    },
    {
      "agent_uuid": "3e6f227f-56e3-4ca0-a12f-04014ebeebe7"
    }
  ],
  "permissions": [
    {
      "dynamic_monitoring": {
        "read": "cpu"
      }
    }
  ]
}
```

这代表的意义是：

这个 Token 可以读取 UUID 为 `53..62` 与 `3e..e7` 的 Agent 的 DynamicMonitoring Data 中 cpu 字段

在鉴权时，使用的是覆盖的思想，不论结构体怎么写，在实际鉴权都是可以正确匹配的，比如下面的结构体和上面的虽然看起来不同，但是鉴权时完全一致：

```json
[
  {
    "scopes": [
      {
        "agent_uuid": "53f125b6-e7aa-447f-a27c-085a53a36462"
      }
    ],
    "permissions": [
      {
        "dynamic_monitoring": {
          "read": "cpu"
        }
      }
    ]
  },
  {
    "scopes": [
      {
        "agent_uuid": "3e6f227f-56e3-4ca0-a12f-04014ebeebe7"
      }
    ],
    "permissions": [
      {
        "dynamic_monitoring": {
          "read": "cpu"
        }
      }
    ]
  }
]
```

由于这里不是开发者文档，只是给普通用户做一个简介，所以细节请移步文档

### 监控系统

本项目的主要功能之一，属于大众理解的探针部分

本项目有三个表，或者说记录项：
- **StaticMonitoringData**: 静态信息，采集后一般不会变化（CPU 型号、系统版本、GPU 型号等），每个 Agent 只储存一条，不会储存历史记录
- **DynamicMonitoringData**: 动态信息，随系统实时变化（CPU 使用率、内存、磁盘、网络等），储存历史记录，并且数据量较大，储存周期不建议超过 1Day，记录非常详尽，比如各核心、各网卡、各硬盘记录
- **DynamicMonitoringSummaryData**: 动态摘要信息，储存历史记录，数据量较小，用于长期储存，可以 90Days+ 而不占用过多空间，足够日常展示折线图，

第一个用于基本系统信息获取，第二个用于需要精细统计的附属功能 / 需要查看精确负载的用户，第三个用于长期储存。三个记录项目相对是独立的，但也有互通的部分

#### 查询

这部分很有意思，我觉得这个设计很像 SQL 语法的 WHERE

你可以构建一个 DataQueryField，提供类似于 `cpu` / `ram` / `load` 这样的字段，来定向获取你需要的信息，而不是一股脑地全返回给你。这样不仅对数据库是压力，解析序列化也是压力

你还可以搭配 QueryCondition 使用，它可以筛选你需要查询的 时间范围 / 指定 Agent / 查询数量等，如果你有一点点的 SQL 基础，那这就是 WHERE 语句

我们将其与 Token 系统紧密结合起来，特定的 Token 可以被指定只能查询特定 Agent 的特定字段，这都随你而定

### Task 系统

Task 系统设计为用户提交给 Server，由 Server 下发给 Agent 去执行的逻辑

你可以理解为：用户想让 Agent 干啥就干啥的系统

大部分小功能（针对于 Agent 的）都集成在了这里，比如 ping / tcp_ping / http_ping 和在线终端等功能

#### Ping 实现

Ping 实现可以用户定时 Ping 等，目前已经实现了 ICMP Ping（需要特权）/ Tcp Ping / Http Ping（GET 请求）

主要目的是用于在前端展示网络情况等，算是比较常规的功能

#### Terminal & Execite 实现

Terminal 也就是常说的 WebShell / WebSSH / 在线终端，他可以获得一个等同于运行 Agent 的用户（一般是 Root）的 Shell

所以，这很危险，请你慎重选择是否开启该功能

该功能实现很有意思，Server 提供了一个双向的 WebSocket 转发通道，用于给用户和 Agent 实现全双工的数据转发，不仅仅是 Terminal，其他的实现也可以依赖这个通道（预计在后续的版本中添加支持）

请注意，Agent 所连接到的 Terminal Server 不一定是来自 NodeGet 的 Server，他可以是任意一个可以转发流量的 WebSocket 隧道，所以可以接到外部项目，同时也带来了一定的安全问题

类似的，还有 execute，可以直接执行命令，而不是终端实现

#### Agent 配置文件读取与修改

如果开启 read_config / edit_config，则 Server 可以读取/修改 Agent 的配置文件，危险度非常高，有需要才建议开启

#### 安全性与查询

其实，理论上如果拥有了 edit_config / execute / terminal 三者之一，都可以做到完全控制 Agent

每一个 Task 都可以自由地控制开/关，对于不同的 Server（Agent 连接到多 Server 情况下）可以设置不同的权限

同样的，每个 Token 都可以指定对特定 Agent 特定 Task 的控制权限

查询和监控系统类似，都是提供类似 WHERE 的 QueryCondition

### Cron 系统

定时任务，探针必备

有两种 Cron 任务：对于 Agent，你可以定时下发 Task；对于 Server，你可以定时执行 JS Worker / 清理数据库等等操作

表达式采用秒级的 Cron 表达式，比如 `0 0 * * * *`，具有六个有效字段

每秒读取一次 Cron，然后按照表达式执行，不再赘述

### KV 系统

这，才是自由度高的开始

我们结合数据库实现了一个 Key-Value 数据库系统，你可以存储/读取任意类型的 Json 数据

后续介绍的所有系统，都会强依赖 KV 系统

如果你曾使用过 Cloudflare 的 Workers KV，那你应该很容易理解

该系统分为一个个 Namespaces，每个 Namespace 中 Key 唯一，调用者可以通过 Namespace + Key 查询到 Key 所对应的 Value，这个 Value 可以是任何 Json 数据

我们定义了一些特殊的 Namespaces 与其中的 Keys，用于前端展示需求，以及一些 Agent 详情等，移步文档

很简单很普通，但是他就是后续系统的基石

#### 安全性与 CRUD

安全性上，Token 系统同样也和 KV 系统有机结合了起来

你可以为 Token 配置他在某个 Namespace 下对于某个 Key 的 CRUD 权限，并且支持通配符。比如以 `abc*` 为 Key 权限的 Token 可以读取以 `abc` 开头的所有 Key

我们为 KV 提供了非常多的方法用于 CRUD，就是设计成一个简易的数据库，用于方便地存储其他功能需要的数据

### JS Worker

呼呼，终于到了自由度系统的重头戏

你可以把它理解成 Cloudflare Workers 的本地实现版，可以在其中运行任意自定义 JS 脚本

我们以 `quickjs` 为地基，向上拓展了一大堆功能：
- onCall: 正常调用时执行的函数
- onRoute：可以注册一个 HTTP URL，然后用第三方程序（甚至浏览器）去调用，就是 Cloudflare Workers 的功能
- onCron：Cron 调用时执行的函数
- onInlineCall：Js Workers 之间可以互相调度，获取对方的返回值，约等于将其他 Worker 当作函数来调用
- 具有完整的 fetch() 函数支持，由 aws `llrt` 提供，内部调用第三方 API / WebHook 完全可行
- 内置 nodeget() 函数用于调用本地 RPC，可以用该函数方便地调用（对于一个天天写 Fake Agent 的我来说，这玩意直接就能模拟成为一个 Agent 上报虚假数据）
- ... 太多了看文档吧

一些我个人遇见可以设想到的功能：
- TG Bot 可以完全运行于 JS Worker
- 可以将 NodeGet 的 Agent 的信息上报到其他的探针系统，模拟成为他们的真实 Agent
- 可以将其他探针系统的 Agent 上报信息翻译到 NodeGet，作为 NodeGet 的模拟探针（使用 onRoute 注册路由实现）
- 实现一个基于 KV 的图床（已经完全实现，https://www.nodeseek.com/post-677408-1）

我们鼓励个人用户使用 AI 编写 JS Worker 来丰富他们自己的探针系统，但请注意安全性问题

官方也会维护一个仓库用于存放由官方认证的 JS Worker 脚本，类似于插件商店，预计是会有一个 `Deploy On NodeGet` 这样的按钮，可以一键安装

#### 安全性与 CRUD

JS Worker 有一个表用于储存 Worker 的运行结果，每一个 Worker（除 onRoute 返回 Response 结构体外）都应返回一个可以被序列化为 Json 的 String，可以是运行状态，运行结果，当然也可以为空。

查询条件和前文所述差不多，详情请看文档

安全方面，inlineCall 时，被 Call 的 Worker 可以知道 Caller 的 Name，用于做一个小鉴权

Token 也与其该系统紧密结合起来，完全可控

## 小结

NodeGet 的各大系统基本如下：
- Token：权限控制，安全性基石，所有系统都与其深度绑定
- 监控：探针主要部分
- Task：Server 给 Agent 的任务
- Cron：定时任务
- KV：数据库，拓展性的基础
- JS Worker：拓展性的实现，运行任意脚本

前面也提到过了，我之前参与过 Komari Agent 的第三方开发，所以这一次 NodeGet，有大量功能借鉴了 Komari 的设计理念，实现逻辑，谢谢他们

很多东西不可能在这里说完，这只是对普通用户的一个小简介，同时也为不知道什么时候才能发布的 NodeGet 预热下

26.4.28 0:36