---
title: 200 行 Rust 代码实现简单 CF Workers AI Bot | Rust 学习日记
description: 太好玩了 Rust
date: 2024-06-14
slug: rustcfwksaibot
image: TUAPI-EEES-CC--615310681.jpg
categories:
  - Main
  - CloudFlare
  - AI
  - Rust
---

# 200 行 Rust 代码实现简单 CF Workers AI Bot | Rust 学习日记

本文由 `High Ping Network` 的小伙伴 GenshinMinecraft 进行编撰，首发于 [本博客](https://blog.c1oudf1are.eu.org)

## 前言

又是我，又来开新坑了，这次是在朋友的推荐下去认真学习了一下 Rust，真的是太好玩了 ~~(全群没有几个人不会Rust了)~~

这次主要是用 Rust 重写了[之前用 Python3 写的 Cloudflare Workers AI Telegram 机器人](https://blog.c1oudf1are.eu.org/p/workersaibot/)

一边看着 《Rust 圣经》 一边 Coding，还是挺好玩的

当然，因为我是 Rust 新手，所以代码中有问题的地方还请多多包涵

请注意，本文会一步步讲解这一 Bot 的实现过程，也算是我学习 Rust 的一个*阶段性总结*

如果你不想看实现过程，请直接翻到本文末尾

## Rust 简介

可能因为 Rust 的历史没有多悠久的原因，大部分人对其不是很了解

> 高性能: Rust 速度惊人且内存利用率极高。由于没有运行时和垃圾回收，它能够胜任对性能要求特别高的服务，可以在嵌入式设备上运行，还能轻松和其他语言集成。

> 可靠性: Rust 丰富的类型系统和所有权模型保证了内存安全和线程安全，让您在编译期就能够消除各种各样的错误。

> 生产力: Rust 拥有**出色的文档**、**友好的编译器**和**清晰的错误提示信息**， 还集成了一流的工具——包管理器和构建工具， 智能地自动补全和类型检验的多编辑器支持， 以及自动格式化代码等等。

我认为 Rust 值得让我夸赞的有两个点

- 没有 Runtime 和 GC: 这是与其他语言最显著的区别之一，这造就了 Rust **堪比 C/CPP 等系统级别语言的性能**
- 非常友好的编译器: 如果你的代码有错误，那么编译器不仅会告诉你错误的原因，甚至会帮你列出解决错误的方法

举一个最简单的例子: Rust 实现一个 TGBOT 仅需 13MB 的内存，而 Python 达成同样的效果需要*几倍甚至十几倍*

## 基本思路

这玩意很简单啦，最主要的部分就是请求 API，并用 TGBOT 库返回，~~有手就行~~

说实话只要实现这个功能，绝对不超过 50 行代码，但要考虑到*错误检测*，以及*代码可读性*的问题，那么就会有 150 行是拿来处理 7788 的问题的

## 开干！

如何开启一个项目？ 那当然是: 新建文件夹！

### 环境

环境配置请看 [Rust 官方文档](https://www.rust-lang.org/zh-CN/learn/get-started)

新建文件夹并在终端输入以下命令来初始化一个项目: 
```bash
cargo new [文件夹名字]
```

去 Telegram 申请一个新的 Bot，保存 Bot Token 以留作备用 (这么简单懒得说了)

然后前往[这里](https://dash.cloudflare.com/ai/workers-ai/api-quick-start)来创建 `Workers AI API 令牌` 和 `帐户 ID`，也是复制保存备用

### 配置依赖

在项目根目录下有个 `Cargo.toml`，里面是有关项目信息的内容，在最底下添加如下内容:

```toml
[dependencies]

reqwest = { version = "0.12.4", features = ["json","blocking"] }
serde_json = "1.0"
teloxide = { version = "0.12", features = ["macros"] }
tokio = { version =  "1.38.0", features = ["rt-multi-thread", "macros"] }
log = "0.4.21"
simple_logger = "5.0.0"
```

这里表示了项目需要用到这堆东西，如果之前有用过 Python，那这玩意就可以理解为 `requirements.txt`

然后删除 `src/main.rs` 中所有内容，并在开头引用这些库:
```rust
use reqwest::header;
use serde_json::{from_str, json, Value};
use teloxide::{prelude::*,types::ParseMode};
use log::{Level, info, warn, error, debug};
use simple_logger;
```

这样就算引用完成了！

PS: 你可能还需要去终端来安装一下依赖:

```bash
cargo add reqwest serde_json teloxide log simple_logger
```

### 常量定义

```rust
// 初始化全局常量
static API_KEY: &str = "";
static USER_ID: &str = "";
static PROMPT: &str = "你是一个中文大模型，不管我用什么语言提出问题，你必须使用中文回答！";
static MODEL: &str = "@cf/qwen/qwen1.5-14b-chat-awq";
static TELEGRAM_BOTTOKEN: &str = "";
```

- API_KEY: Workers AI API 令牌
- USER_ID: 帐户 ID
- PROMPT: AI 提示词
- MODEL: 对话使用的大模型，默认是阿里云的通义千问，可以在[这里](https://developers.cloudflare.com/workers-ai/models/)查看支持的模型，更改即可，非必要无需更改
- TELEGRAM_BOTTOKEN: Telegram Bot Token

按照要求将 `Workers AI API 令牌` 和 `帐户 ID` 还有 `Telegram Bot Token` 放入对应的位置中，以便于下面调用

如果有需要，也可以根据文档来修改 `MODEL` 模型和 `PROMPT` 提示词

### 编写 GPT 请求函数

先不着急编写 Bot 主体部分，来看下有关网络请求的调用

#### 函数定义

```rust
// GPT 对话函数，用于请求 API 并返回
async fn gpt(question: &str) -> Result<String, String> {

}
```

简单介绍一下: 

这句定义了一个名为 gpt 的异步函数，`question` 是参数

返回值是 `String` 但是不确定是返回正常结果还是错误信息，这种做法有助于错误处理

#### 构建 Headers

玩过大模型 API 的都知道，鉴权 *(也就是 API_Tokens 这类东西)* 一般是放在 Headers 里面的，所以我们要来构建 Headers

而 Workers AI 的 API Headers 格式类似这样:

```
Authorization: Bearer {API_TOKEN}
```

于是，就有了下面的代码: 

```rust
// 初始化 Headers，包含 API KEY
let mut headers = header::HeaderMap::new();
headers.insert(
    "Authorization",
    format!("Bearer {}", API_KEY).parse().unwrap(),
);
headers.insert(
    "Content-Type",
    "application/x-www-form-urlencoded".parse().unwrap(),
);
```

这里定义了一个变量 `headers`，并用 insert 插入两条键值对

- 其中 `Authorization` 用于存放 `API_KEY`，用到了 `format!()` 宏格式化它的值，运用到了最开始定义的 `API_KEY` 常量
- `Content-Type` 则是表明了发送的数据格式，用于指示资源的MIME类型
- `.parse()`: 将**字符串**转化为 **HeaderValue 类型**，这是 reqwest 库用来存储 Headers 的类型
- `.unwrap()`: 直接获取结果而不进行错误处理 *(有错误就退出，不过这段代码没有必要进行错误处理)*

#### 构建请求体

接下来是请求体: 

```rust
let data = json!({
    "messages": [
        {"role": "system", "content": PROMPT},
        {"role": "user", "content": question},
    ]
});

简单易懂，调用 `PROMPT` 和函数参数中的 `question` 即可，简单的 Json

#### 发送请求

终于可以发送请求了，首先，来初始化一个 HTTP Client:

```rust
let client = reqwest::Client::new();
```

随后就可以发送请求了: 

```rust
let api: String = client
    .post(format!(
        "https://api.cloudflare.com/client/v4/accounts/{}/ai/run/{}",
        USER_ID, MODEL
    ))
    .headers(headers)
    .json(&data)
    .send()
    .await
    .map_err(|_| "请求出现问题".to_string())?
    .text()
    .await
    .map_err(|_| "解析响应体时出错".to_string())?;
```

这里声明了一个 `api` 变量，用于存储获取到的数据

- `client.post()`: 则是发送 Post 请求的主要语句，URL 中的 `Workers AI API 令牌` 和 `模型` 还是一样使用 `format!()` 来构建
- `headers(headers)`: 传递 Headers
- `.json(&data)`: 将 `data` 转换为 Json 作为请求体
- `.send().await`: 这一步就相当于发送请求了，并等待异步操作完成
- `.map_err(|_| "请求出现问题".to_string())?`: 错误处理，如果发生问题则直接返回 `请求出现问题` 而不继续执行，如果出现错误则直接赋值给变量 `api`
- `.text().await`: 将收到的数据转换为文本信息，并等待异步操作完成
- `.map_err(|_| "解析响应体时出错".to_string())?`: 作用和上面那个差不多

这样就算发送完一个请求并把接收到的信息赋值给 `api` 了

#### 解析 Json

经过上面的请求，`api` 应该是一个 Json 格式的字符串，我们需要在里面提取出*需要的答案*

Json 大概长这样:
```json
{
  "result": {
    "response": "我是来自阿里云的超大规模语言模型，我叫通义千问。"
  },
  "success": true,
  "errors": [],
  "messages": []
}
```

```rust
let json: Value = from_str(&api).map_err(|_| "解析 Json 时出错".to_string())?;
let result_tmp = json
    .get("result")
    .ok_or("Json 中缺少 'result' 字段".to_string())?;
let result = result_tmp
    .get("response")
    .ok_or("Json 中缺少 'response' 字段".to_string())?;

Ok(result.to_string())
```

- 第一行代码尝试将变量 `api` 中存储的字符串解析为 JSON 格式，同样的 `.map_err()` 就不再解释了
- 第一次从 Json 中获取信息返回的是 `Option<&Value>` 即可能有或可能没有，所以我们使用 `.ok_or()` 来判断**有**或**无**，当有时则**直接赋值**，没有则返回错误
- 第二次从 Json 中获取信息也一样，不多赘述
- 最后，返回 `result` 即可

### 编写主程序

呼呼，终于等待编写主程序了，不过主要的信息处理程序并不在 main 函数中，main 函数在代码中只起到一个**引导**的作用

```rust
async fn main() {
    // 日志初始化
    simple_logger::init_with_level(Level::Debug).unwrap();

    // 初始化 Bot
    info!("Bot 初始化中");
    let bot = Bot::new(TELEGRAM_BOTTOKEN);
    info!("Bot 初始化完毕");

    // 主程序
    teloxide::repl(bot, |bot: Bot, msg: Message| async move {
        // 私聊
        if msg.chat.is_private() {
            match msg.text() {
                Some(_text) => matchmsgprivate(msg, bot).await,
                None => debug!("消息没有文本内容，跳过"),
            }
        } else { // 非私聊
            match msg.text() {
                Some(_text) => matchmsgpublic(msg, bot).await,
                None => debug!("消息没有文本内容，跳过"),
            }
        }
        Ok(())
    })
    .await;
}
```

- 首先定义一个 main 异步函数，这是主程序的入口
- 初始化一个 Log 记录器，这里使用了 `simple_logger` 库，该库无需繁琐地配置 Log 信息即可做到*美观的输出*，定义 Log Level 为 Debug
- `info!()` 宏是用来记录 Log 的，相同的，还有 `debug!()` `warn!()` `error!()` 等，分别记录*不同等级的日志*，下面不再赘述
- `let bot = Bot::new(TELEGRAM_BOTTOKEN)`: 定义了一个名为 `bot` 的 Bot Client，它可以*接收消息、发送消息*等
- `teloxide::repl`：异步函数，可以启动一个 REPL 循环 (简要理解成可以处理新信息的循环即可)，传入 Bot 并接受名为 `msg` 的信息提供给下面的代码。下面的代码即为*消息处理程序*
- `msg.chat.is_private()`: 返回一个布尔值，**是否**为私聊信息
- `if msg.chat.is_private() {} else {}`: 消息处理程序分成了两个部分，即判断**是否为私聊 Bot**，如果是则*执行上半部分代码*，否则*执行下半部分*
- `msg.text()`: 返回一个字符串，消息的文本内容
- 因为 `msg.text()` 的类型为 `Option<&str>`，即可能有或没有 *(没有文本信息的话可能为图片、文件、贴纸等)*，所以需要使用 `match` 做判断，如果有文本信息则将 `bot` 和 `msg` 传入 `matchmsgprivate` 或者 `matchmsgpublic` 函数中 *(之后会定义这两个函数)*
- 当没有文本消息时候，则 Log Debug 输出

总的来说，main 函数主要就是接受信息并交给其他函数处理 *(尽管是小项目我个人还是建议不要全堆在 main 函数里面)*

### 处理私聊信息

私聊信息需要做到: 

- `/start` 发送帮助信息
- 当直接对话 (不是 `/` 命令时)，直接返回结果
- `/ai 问题` 返回问题的结果

主要思路是判断消息是否为 `/` 开头，如果不是则**直接返回 GPT 回答**，如果是再**进行指令判断**

```rust
async fn matchmsgprivate(msg: Message, bot: Bot) {
    let text: &str = msg.text().unwrap();

    if text.starts_with('/') { // 是否为 "/" 开头的命令
        let mut parts = text.splitn(2, ' '); 
        let command: &str = parts.next().unwrap(); // 命令部分
        let argument: Option<&str> = parts.next(); // 参数部分，可能为 None

        if command.starts_with("/ai") {
            replyai(msg.clone(), bot, argument).await;
        } else if command.starts_with("/start") {
            replystart(msg, bot).await;
        } else {
            debug!("非本 Bot 命令，跳过");
        }
    } else {
        replyai(msg.clone(), bot, msg.text()).await; // 非命令直接当作问题
    }
}
```

- 先定义一个 `text` 用于储存文本信息，便于调用 *(因为在主函数调用该函数时候已经做过检测，所以这里使用 `.unwrap()` 并无不妥)*
- 随后进行 `/` 开头命令检测，为**否**直接调用 replyai 函数 *(等会定义)*，传入 `msg`, `bot`, `msg.text()` *(不想处理借用问题，`msg` 用 `.clone()` 就好)*
- 如果为**是**，则使用 `.splitn()` 分割命令，`command` 为指令部分 (如 `/start`)，`argument` 为参数部分 (可能没有，所以用 `Option<&str>`)
- 如果命令开头为 `/ai`，则传入 replyai 函数；如果开头为 `/start`，则传入 replystart 函数 *(等会定义)*
- 如果都不是机器人的指令，则不做处理，输出 Debug 信息

### 处理群组信息

这一部分和处理私聊信息差不多，区别只是非指令消息不回复

```rust
async fn matchmsgpublic(msg: Message, bot: Bot) {
    let text: &str = msg.text().unwrap();

    if text.starts_with('/') { // 是否为 "/" 开头的命令
        let mut parts = text.splitn(2, ' '); 
        let command: &str = parts.next().unwrap(); // 命令部分
        let argument: Option<&str> = parts.next(); // 参数部分，可能为 None

        if command.starts_with("/ai") {
            replyai(msg.clone(), bot, argument).await;
        } else if command.starts_with("/start") {
            replystart(msg, bot).await;
        } else {
            debug!("非本 Bot 命令，跳过");
        }
    } else {
        debug!("非命令，跳过");
    }
}
```

同样的逻辑，只是检测为非指令仅输出 Debug 消息而已

### AI 回复

这里要实现一个函数

需要传入 `msg`、`bot`、`text` 信息，调用 gpt 函数并发送回 Telegram

```rust
async fn replyai(msg: Message, bot: Bot, optiontext: Option<&str>) {
    let text: &str;

    // 检测是否有参数
    match optiontext {
        Some(texttmp) => text = texttmp,
        None => {
            warn!("{}", format!("用户 {:?} 使用方法不正确", msg.chat.id));
            
            let _ = bot.send_message(msg.chat.id, "使用方法不正确！请使用 /start 来查看使用方法")
            .parse_mode(ParseMode::MarkdownV2)
            .await;
            return;
        }
    }
    
    let mut answer: String = String::new();

    // 最重要的一部分
    match gpt(text).await {
        Ok(response) => answer = response,
        Err(error) => error!("{}", error),
    }

    info!("{}", format!("用户 {} 使用了本 Bot, 问题是: {}", msg.chat.id, text));
    info!("{}", format!("回答是: {}", answer));

    // 回复
    let _ = bot.send_message(msg.chat.id, answer)
    .parse_mode(ParseMode::MarkdownV2)
    .await;
}
```

有点长，但不要着急

- 定义异步函数不再赘述，需要注意 `optiontext: Option<&str>` 需要传入的是 `Option<&str>`，对应着消息处理函数的 `argument`
- 既然 `optiontext` 为可能有可能没有的，那就先来检测一下。使用 `match`，当有值时赋值给 `text`；无值时输出 warn 信息并回复给用户，提示请查看 `/start` 指令，并退出
- 检测成功后，调用 gpt 函数，也是使用 `match`。如果正常则赋值给 `answer`，有错误则输出 error 信息
- 输出几条 info 信息，随后就可以将结果发送回 Telegram 了 *(GPT 返回内容多使用 Markdown 格式，所以这里指定使用 MarkdownV2 格式发送)*

就这么简单，主要的代码还是错误处理，不然没有必要写这么多

### Start 回复

最最最最简单的一部分，传入 `bot` 和 `msg` 即可

```rust
async fn replystart(msg: Message, bot: Bot) {
    let startmessage: &str = r#"
    命令帮助:
    /start: 显示本消息
    /ai 问题: 获取由 Cloudflare Workers AI 驱动的 GPT 答案
    PS: 私聊 Bot 可直接对话，无需 /ai 前缀
    "#;
    
    info!("{}", format!("用户 {} 开始使用本 Bot", msg.chat.id));

    let _ = bot.send_message(msg.chat.id, startmessage)
    .parse_mode(ParseMode::MarkdownV2)
    .await;
}
```

- 定义一个字符串，作为帮助信息
- info 输出基本信息
- 发送帮助信息

## 完整代码

写到这里，差不多就写完了，下面是搓起来的代码:

```rust

use reqwest::header;
use serde_json::{from_str, json, Value};
use teloxide::{prelude::*,types::ParseMode};
use log::{Level, info, warn, error, debug};
use simple_logger;

// 初始化全局变量
static API_KEY: &str = "";
static USER_ID: &str = "";
static PROMPT: &str = "你是一个中文大模型，不管我用什么语言提出问题，你必须使用中文回答！";
static MODEL: &str = "@cf/qwen/qwen1.5-14b-chat-awq";
static TELEGRAM_BOTTOKEN: &str = "";

// GPT 对话函数，用于请求 API 并返回
async fn gpt(question: &str) -> Result<String, String> {
    // 初始化 Headers，包含 API KEY
    let mut headers = header::HeaderMap::new();
    headers.insert(
        "Authorization",
        format!("Bearer {}", API_KEY).parse().unwrap(),
    );
    headers.insert(
        "Content-Type",
        "application/x-www-form-urlencoded".parse().unwrap(),
    );

    // 初始化问题
    let data = json!({
        "messages": [
            {"role": "system", "content": PROMPT},
            {"role": "user", "content": question},
        ]
    });

    // 初始化 Client
    let client = reqwest::Client::new();

    // 请求 CF API
    let api: String = client
        .post(format!(
            "https://api.cloudflare.com/client/v4/accounts/{}/ai/run/{}",
            USER_ID, MODEL
        ))
        .headers(headers)
        .json(&data)
        .send()
        .await
        .map_err(|_| "请求出现问题".to_string())?
        .text()
        .await
        .map_err(|_| "解析响应体时出错".to_string())?;

    // 解析 Json
    let json: Value = from_str(&api).map_err(|_| "解析 Json 时出错".to_string())?;
    let result_tmp = json
        .get("result")
        .ok_or("Json 中缺少 'result' 字段".to_string())?;
    let result = result_tmp
        .get("response")
        .ok_or("Json 中缺少 'response' 字段".to_string())?;

    Ok(result.to_string())
}

// 主函数
#[tokio::main]
async fn main() {
    // 日志初始化
    simple_logger::init_with_level(Level::Debug).unwrap();

    // 初始化 Bot
    info!("Bot 初始化中");
    let bot = Bot::new(TELEGRAM_BOTTOKEN);
    info!("Bot 初始化完毕");

    // 主程序
    teloxide::repl(bot, |bot: Bot, msg: Message| async move {
        // 私聊
        if msg.chat.is_private() {
            match msg.text() {
                Some(_text) => matchmsgprivate(msg, bot).await,
                None => debug!("消息没有文本内容，跳过"),
            }
        } else { // 非私聊
            match msg.text() {
                Some(_text) => matchmsgpublic(msg, bot).await,
                None => debug!("消息没有文本内容，跳过"),
            }
        }
        Ok(())
    })
    .await;
}

// GPT 回复函数
async fn replyai(msg: Message, bot: Bot, optiontext: Option<&str>) {
    let text: &str;

    // 检测是否有参数
    match optiontext {
        Some(texttmp) => text = texttmp,
        None => {
            warn!("{}", format!("用户 {:?} 使用方法不正确", msg.chat.id));
            
            let _ = bot.send_message(msg.chat.id, "使用方法不正确！请使用 /start 来查看使用方法")
            .parse_mode(ParseMode::MarkdownV2)
            .await;
            return;
        }
    }
    
    let mut answer: String = String::new();

    // 最重要的一部分
    match gpt(text).await {
        Ok(response) => answer = response,
        Err(error) => error!("{}", error),
    }

    info!("{}", format!("用户 {} 使用了本 Bot, 问题是: {}", msg.chat.id, text));
    info!("{}", format!("回答是: {}", answer));

    // 回复
    let _ = bot.send_message(msg.chat.id, answer)
    .parse_mode(ParseMode::MarkdownV2)
    .await;
}

// start 回复函数
async fn replystart(msg: Message, bot: Bot) {
    let startmessage: &str = r#"
    命令帮助:
    /start: 显示本消息
    /ai 问题: 获取由 Cloudflare Workers AI 驱动的 GPT 答案
    PS: 私聊 Bot 可直接对话，无需 /ai 前缀
    "#;
    
    info!("{}", format!("用户 {} 开始使用本 Bot", msg.chat.id));

    let _ = bot.send_message(msg.chat.id, startmessage)
    .parse_mode(ParseMode::MarkdownV2)
    .await;
}

// 私聊检测
async fn matchmsgprivate(msg: Message, bot: Bot) {
    let text: &str = msg.text().unwrap();

    if text.starts_with('/') { // 是否为 "/" 开头的命令
        let mut parts = text.splitn(2, ' '); 
        let command: &str = parts.next().unwrap(); // 命令部分
        let argument: Option<&str> = parts.next(); // 参数部分，可能为 None

        if command.starts_with("/ai") {
            replyai(msg.clone(), bot, argument).await;
        } else if command.starts_with("/start") {
            replystart(msg, bot).await;
        } else {
            debug!("非本 Bot 命令，跳过");
        }
    } else {
        replyai(msg.clone(), bot, msg.text()).await; // 非命令直接当作问题
    }
}

// 非私聊
async fn matchmsgpublic(msg: Message, bot: Bot) {
    let text: &str = msg.text().unwrap();

    if text.starts_with('/') { // 是否为 "/" 开头的命令
        let mut parts = text.splitn(2, ' '); 
        let command: &str = parts.next().unwrap(); // 命令部分
        let argument: Option<&str> = parts.next(); // 参数部分，可能为 None

        if command.starts_with("/ai") {
            replyai(msg.clone(), bot, argument).await;
        } else if command.starts_with("/start") {
            replystart(msg, bot).await;
        } else {
            debug!("非本 Bot 命令，跳过");
        }
    } else {
        debug!("非命令，跳过");
    }
}
```

保存后 执行下面指令即可编译运行:

```
cargo build --release
./target/release/RUST
```

## 总结

这次主要是了解了 Rust 的基本语法，更深层次的还尚未触及到，对于代码中解释有误或代码有问题的请多多谅解

同时也可以看看[它的 Python 实现](https://github.com/GenshinMinecraft/Cloudflare-Workers-Ai-Telegram-Bot) ([相关文章](https://blog.c1oudf1are.eu.org/p/workersaibot/))

欢迎加入 High Ping 大家庭:
- [官网](https://highp.ing)
- [Blog](https://blog.c1oudf1are.eu.org)
- [@HighPingNetwork](https://t.me/HighPingNetwork)
- [@HighPingChat](https://t.me/highpingchat)