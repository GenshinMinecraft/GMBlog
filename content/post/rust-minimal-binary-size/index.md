---
title: Rust Binary 体积优化指南
description: 小白文章，大佬别看了
date: 2025-11-12
slug: rust-minimal-binary-size
hidden: true
image: 
categories:
    - Main
    - Rust
---

# Rust Binary 体积优化指南

本文由 GenshinMinecraft 进行编撰，首发于 [本博客](https://blog.c1oudf1are.eu.org/)

## 前言

之前在编写 [`komari-monitor-rs`](https://github.com/GenshinMinecraft/komari-monitor-rs)，学到了一堆有关于 Rust 性能优化与体积优化的方式，特写此篇以记录

由于该项目是个 Agent 监控项目，所以要在保证**跨架构兼容**与**性能足够好**的情况下完成优化，所以本文所述均为可供跨架构使用的方案

还有，本文所属的所有优化方案，**均不考虑编译时间**

还有附上我的测试环境:

- Laptop: Legion R7KP 2025
- CPU: Ryzen R9 8945HX
- RAM: 64G DDR5 5200
- OS: Windows 11 25H2
- Target: x86_64-pc-windows-msvc
- Source: [`komari-monitor-rs` 443a7b906554e72eebc009f4a360499d0416018e](https://github.com/GenshinMinecraft/komari-monitor-rs/tree/443a7b906554e72eebc009f4a360499d0416018e) with `ureq-support` feature
- Build Command: `cargo build --features ureq-support --jobs 128`

以下的所有测试都会以该平台为基础，代码是截止到写这篇文章，最新的 `komari-monitor-rs` 源码，该项目是一个*集成网络 API、大量系统 API* 的典型命令行程序，具有参考意义


## 优化 Profile

说到优化体积，第一个想到的绝对是 `Cargo.toml` 中的 `profile` 字段，有关该字段，请参考 <https://doc.rust-lang.org/cargo/reference/profiles.html>

默认的 dev / release 配置如下:

```toml
# Default Dev Profile
[profile.dev]
opt-level = 0
debug = true
debug-assertions = true
overflow-checks = true
lto = false
panic = 'unwind'
incremental = true
codegen-units = 256
rpath = false

# Default Release Profile
[profile.release]
opt-level = 3
debug = false
debug-assertions = false
overflow-checks = false
lto = false
panic = 'unwind'
incremental = false
codegen-units = 16
rpath = false
```

默认的参数给的肯定不激进，结果如下:

