---
title: 使用 cloudflare-workers-kv-sdk-rs
description: Rust Crate 好玩
date: 2024-08-29
slug: cloudflare-workers-kv-sdk-rs
image: GQRmDn0b0AAvG3.jpg
categories:
    - Main
    - Rust
    - Cloudflare
---

# 使用 cloudflare-workers-kv-sdk-rs

本文由 `High Ping Network` 的小伙伴 GenshinMinecraft 进行编撰，首发于 [本博客](https://blog.c1oudf1are.eu.org)

## 前言

闲来无事，写了个 `cloudflare-workers-kv-sdk-rs` Rust Crate，用于在 Rust 调用 Cloudflare Workers KV 的 API

基本实现了官方 REST API 的所有功能，如有需求请前往[该项目仓库](https://github.com/GenshinMinecraft/cloudflare-workers-kv-sdk-rs)提交 Issue / PR

该文章同时也为该库的 Doc，如需编辑该 Doc 请前往该[博客的 Github 仓库](https://github.com/High-Ping-Network/HighPingBlog/tree/main/content/post/cloudflare-workers-kv-sdk-rs)修改

## 简介

该库为 Cloudflare Workers KV 的**非官方** Rust SDK

底层采用了基于 `rustls` 的 `reqwest` 库

支持 TTL / Metadata / 批量修改... 特性

## 使用

**PS: 下面所有代码默认您已经引用所需要的所有库，如引用第三方库会标注**

该 SDK 分为两部分:

- `KvClient`: 用于访问主帐号的所有 KV Namespaces，可以列出 / 创建 Namespaces

- `KvNamespaceClient`: 用于访问单个 Namespace，可以对 Namespace 与其中的 Key / Value 操作

### KvClient 使用

#### 初始化 KvClient

```rust
let cf_account_id = "xxx";
let cf_api_key = "xxx";
let kvclient = KvClient::new(cf_account_id, cf_api_key);
```

你需要在 `KvClient` 结构体的 `new()` 函数传入 Cloudflare Account ID 与其对应的 API Key

关于其获取方式不再提，请确保 API Key 一定要拥有对 Worker KV 的读写权限

#### 新建一个 Namespace

```rust
let namespace = kvclient.create_namespace("Test").await?;
println!("{:?}", namespace)
```

`KvClient` 结构体的 `create_namespace()` 函数需要传入一个 `&str` 类型的值作为新 Namespace 的标识符，并返回一个 `Namespace` 结构体，包含了 Namespace ID 和 Namespace Title

该代码会输出新建的 Namespace 的信息

#### 列出账号下所有的 Namespace

```rust
let namespaces = kvclient.list_namespaces().await?;
println!("{:?}", namespaces);
```

`KvClient` 结构体的 `create_namespace()` 函数会返回一个 `Vec<Namespace>`，用于列出所有的 Namespaces

该代码会输出该账号下所有的 Namespace

### KvNamespaceClient 使用

#### 初始化 KvNamespaceClient

##### 直接传入参数

```rust
let cf_account_id = "xxx";
let cf_api_key = "xxx";
let namespace_id = "xxx"
let kvnamespaceclient = KvNamespaceClient::new(cf_account_id, cf_api_key, namespace_id);
```

该方式可以直接传入 Cloudflare Account ID 与其对应的 API Key，并附带 Namespace ID

##### 从 KvClient 读取部分参数

```rust
let namespace_id = "xxx"
let kvnamespaceclient = KvNamespaceClient::from_kvclient(&kvclient, namespace_id);
```

该方式可以使用 `KvClient` 的 Account ID 与 API Key，仅需再传入 Namespace ID 即可

当 Account ID 与 API Key 均一致时，这两种方案等价

#### 删除 Namespace

```rust
kvnamespaceclient.delete_namespace().await?;
```

`delete_namespace()` 函数可以删除 Namespace，请谨慎使用，这会删除该 Namespace 中所有的 KVs

请不要与 `delete()` 或 `delete_multiple()` 相混乱

#### 重命名 Namespace

```rust
let new_title = "tseT";
kvnamespaceclient.rename_namespace(new_title).await?;
```

`rename_namespace()` 函数可以重命名该 Namespace，但保持 Namespace ID 不变

#### 写入 KV

```rust
let kv = KvRequest::new("key", "value").ttl_sec(3600);
kvnamespaceclient.write(kv).await?;
```

在这里，我们引入了一个新的结构体 `KvRequest`

每个 `KvRequest` 为一个新增的 KV 的详细信息

你可以使用下面的函数来定义它: 
- `new(k, v)`: 新建一个 KV，需要传入 `&str` 类型的 Key 和 Value，这是必须的
- `ttl_sec(u64)`: 过期时间，当超过所定义的秒数的时候则自动删除
- `ttl_timestemp()`: 过期时间，但是为 Unix 时间戳，如果与 `ttl_sec()` 共存则保留 `ttl_sec()`
- `metadata(serde_json::Value)`: Metadata 自定义，传入 `serde_json::Value` 类型的 Json
- `enable_base64()`: 开启 Base64 上传，默认为关闭

有关这些参数，可以查看 [Cloudflare Docs](https://developers.cloudflare.com/api/operations/workers-kv-namespace-write-multiple-key-value-pairs)

你可以在一个 `KvRequest` 结构体中使用这些函数来自定义它，但无论怎么样，你至少都需要一个 `new()` 函数来定义 KV

#### 写入 KVs

对比与上面，该实现为写入多个 KVs:

```rust
let kvs = vec![KvRequest::new("test1", "test2"), KvRequest::new("test3", "test4")];
kvnamespaceclient.write_multiple(kvs).await?;
```

`write_multiple()` 函数接受 `Vec<KvRequest>`，添加多个 KVs 仅需一个请求，上限为 10000 个每次

有关 `KvRequest` 的参数可以查看上面介绍写入 KV的部分

#### 删除 KV

```rust
kvnamespaceclient.delete("single_key").await?;
```

`write_multiple()` 函数接受 `&str`，可以根据 Key 删除指定的 KV

该代码可以删除 Key 为 `single_key` 的这一个 KV

#### 删除 KVs

```
let kvs = vec!["kv1", "kv2", "kv3"];
kvnamespaceclient.delete_multiple(kvs).await?;
```

`delete_multiple()` 函数接受 `Vec<&str>`，删除多个 KVs 仅需一个请求

该代码会删除 Key 为 `kv1` `kv2` `kv3` 的 KVs

#### 列出所有的 Key

```
let kvs = kvnamespaceclient.list_all_keys().await?;
println!("{:?}", kvs);
```

`list_all_keys()` 函数返回一个 `Vec<String>`，其中包含了所有的 Keys

该代码会获取 Namespace 下所有的 Keys，并打印到屏幕上

#### 读取 Key 的 Metadata

```rust
let kv_metadata = kvnamespaceclient.read_metadata("kv").await?;
println!("{}", kv_metadata);
```

`read_metadata()` 函数接受一个 `&str` 类型的 Key，并返回一个 `serde_json::Value` 类型的 Metadata

该代码会获取 Key `kv` 的 Metadata 并打印到屏幕上

#### 获取 Key 对应的 Value

```rust
let value = kvnamespaceclient.get("key").await?;
println!("{}", value);
```    

`get()` 函数接受一个 `&str` 类型的 Key，并返回一个 `String` 类型的 Value，获取 Key 对应的 Value 值

该代码会获取 Key `key` 的 Value 并打印到屏幕上


## 小结

就这样吧，有问题欢迎 Issue / PR

欢迎加入 High Ping 大家庭:
- [官网](https://highp.ing)
- [Blog](https://blog.c1oudf1are.eu.org)
- [@HighPingNetwork](https://t.me/HighPingNetwork)
- [@HighPingChat](https://t.me/highpingchat)
