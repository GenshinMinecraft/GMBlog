---
title:  Using cloudflare-workers-kv-sdk-rs
description: Rust Is The Best
date: 2024-08-29
hidden: true
slug: cloudflare-workers-kv-sdk-rs-eng
image: GQRmDn0b0AAvG3.jpg
categories:
    - Main
    - Rust
    - Cloudflare
---

# Using cloudflare-workers-kv-sdk-rs

This article was written by GenshinMinecraft from the High Ping Network team and is first published on [our blog](https://blog.highp.ing).

## Preface

Out of boredom, I created a `cloudflare-workers-kv-sdk-rs` Rust crate for calling Cloudflare Workers KV API in Rust.

It basically implements all the functionalities of the official REST API. If you have any needs, please submit an Issue / PR at [the project repository](https://github.com/GenshinMinecraft/cloudflare-workers-kv-sdk-rs).

This article also serves as the documentation for the library. If you need to edit the documentation, please go to the [blog's Github repository](https://github.com/High-Ping-Network/HighPingBlog/tree/main/content/post/cloudflare-workers-kv-sdk-rs) to modify it.

## Introduction

This library is an **unofficial** Rust SDK for Cloudflare Workers KV.

It is based on the `reqwest` library with `rustls`.

It supports features like TTL, Metadata, batch modification, etc.

## Usage

**PS: The following code assumes that you have already referenced all the necessary libraries. Third-party libraries will be noted if referenced.**

The SDK is divided into two parts:

- `KvClient`: Used to access all KV Namespaces of the main account, can list / create Namespaces.

- `KvNamespaceClient`: Used to access a single Namespace, can operate on the Namespace and its Keys / Values.

### KvClient Usage

#### Initializing KvClient

```rust
let cf_account_id = "xxx";
let cf_api_key = "xxx";
let kvclient = KvClient::new(cf_account_id, cf_api_key);
```

You need to pass the Cloudflare Account ID and its corresponding API Key to the `new()` function of the `KvClient` struct.

The methods to obtain these are not mentioned here. Please ensure that the API Key must have read and write permissions for Worker KV.

#### Creating a New Namespace

```rust
let namespace = kvclient.create_namespace("Test").await?;
println!("{:?}", namespace)
```

The `create_namespace()` function of the `KvClient` struct requires passing a `&str` value as the identifier for the new Namespace and returns a `Namespace` struct containing the Namespace ID and Namespace Title.

This code will output the information of the newly created Namespace.

#### Listing All Namespaces Under the Account

```rust
let namespaces = kvclient.list_namespaces().await?;
println!("{:?}", namespaces);
```

The `create_namespace()` function of the `KvClient` struct returns a `Vec<Namespace>` to list all Namespaces.

This code will output all Namespaces under the account.

### KvNamespaceClient Usage

#### Initializing KvNamespaceClient

##### Directly Passing Parameters

```rust
let cf_account_id = "xxx";
let cf_api_key = "xxx";
let namespace_id = "xxx"
let kvnamespaceclient = KvNamespaceClient::new(cf_account_id, cf_api_key, namespace_id);
```

This method can directly pass the Cloudflare Account ID and its corresponding API Key, along with the Namespace ID.

##### Reading Partial Parameters from KvClient

```rust
let namespace_id = "xxx"
let kvnamespaceclient = KvNamespaceClient::from_kvclient(&kvclient, namespace_id);
```

This method can use the Account ID and API Key of `KvClient`, and only needs to pass the Namespace ID.

When the Account ID and API Key are consistent, these two schemes are equivalent.

#### Deleting a Namespace

```rust
kvnamespaceclient.delete_namespace().await?;
```

The `delete_namespace()` function can delete the Namespace. Please use it with caution, as this will delete all KVs in the Namespace.

Do not confuse it with `delete()` or `delete_multiple()`.

#### Renaming a Namespace

```rust
let new_title = "tseT";
kvnamespaceclient.rename_namespace(new_title).await?;
```

The `rename_namespace()` function can rename the Namespace but keep the Namespace ID unchanged.

#### Writing a KV

```rust
let kv = KvRequest::new("key", "value").ttl_sec(3600);
kvnamespaceclient.write(kv).await?;
```

Here, we introduce a new struct `KvRequest`.

Each `KvRequest` contains detailed information about a new KV.

You can define it using the following functions:
- `new(k, v)`: Create a new KV, requiring `&str` type Key and Value, which is mandatory.
- `ttl_sec(u64)`: Expiration time, automatically deleted after the defined number of seconds.
- `ttl_timestemp()`: Expiration time, but in Unix timestamp format. If it coexists with `ttl_sec()`, `ttl_sec()` will be retained.
- `metadata(serde_json::Value)`: Custom Metadata, passing `serde_json::Value` type Json.
- `enable_base64()`: Enable Base64 upload, default is off.

For these parameters, you can refer to [Cloudflare Docs](https://developers.cloudflare.com/api/operations/workers-kv-namespace-write-multiple-key-value-pairs).

You can use these functions in a `KvRequest` struct to customize it, but in any case, you need at least a `new()` function to define the KV.

#### Writing KVs

Compared to the above, this implementation writes multiple KVs:

```rust
let kvs = vec![KvRequest::new("test1", "test2"), KvRequest::new("test3", "test4")];
kvnamespaceclient.write_multiple(kvs).await?;
```

The `write_multiple()` function accepts `Vec<KvRequest>`, adding multiple KVs requires only one request, with a limit of 10000 per request.

For the parameters of `KvRequest`, please refer to the section above on writing a KV.

#### Deleting a KV

```rust
kvnamespaceclient.delete("single_key").await?;
```

The `write_multiple()` function accepts `&str`, and you can delete the specified KV based on the Key.

This code can delete the KV with the Key `single_key`.

#### Deleting KVs

```rust
let kvs = vec!["kv1", "kv2", "kv3"];
kvnamespaceclient.delete_multiple(kvs).await?;
```

The `delete_multiple()` function accepts `Vec<&str>`, deleting multiple KVs requires only one request.

This code will delete KVs with Keys `kv1`, `kv2`, and `kv3`.

#### Listing All Keys

```rust
let kvs = kvnamespaceclient.list_all_keys().await?;
println!("{:?}", kvs);
```

The `list_all_keys()` function returns a `Vec<String>` containing all Keys.

This code will retrieve all Keys under the Namespace and print them to the screen.

#### Reading Metadata of a Key

```rust
let kv_metadata = kvnamespaceclient.read_metadata("kv").await?;
println!("{}", kv_metadata);
```

The `read_metadata()` function accepts a `&str` type Key and returns a `serde_json::Value` type Metadata.

This code will retrieve the Metadata of Key `kv` and print it to the screen.

#### Getting the Value Corresponding to a Key

```rust
let value = kvnamespaceclient.get("key").await?;
println!("{}", value);
```

The `get()` function accepts a `&str` type Key and returns a `String` type Value, retrieving the Value corresponding to the Key.

This code will retrieve the Value of Key `key` and print it to the screen.

## Conclusion

That's it. Feel free to submit Issues / PRs if you have any questions.

Welcome to join the High Ping family:
- [Official Website](https://highp.ing)
- [Blog](https://blog.highp.ing)
- [@HighPingNetwork](https://t.me/HighPingNetwork)
- [@HighPingChat](https://t.me/highpingchat)
