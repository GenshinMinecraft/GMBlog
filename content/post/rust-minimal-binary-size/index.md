---
title: Rust Binary 体积优化指南
description: 小白文章，大佬别看了
date: 2025-11-21
slug: rust-minimal-binary-size
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
- Rust Version: Stable 1.91.1 | Nightly 2025-11-20
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

| 参数 | 大小 |
| ---- | ---- |
| dev | 9.00 MB |
| release | 4.20 MB |

正常情况下，用 release binary 是最正常的，兼顾了编译速度、运行速度、文件大小

如果你的项目对此不敏感，可以不用看了 (看这文章的真的只要个 release 就够了吗？)

根据[官方文档](https://doc.rust-lang.org/cargo/reference/profiles.html)，会影响 Binary 大小的参数有这些:

- `opt-level`: 优化级别，选择 `z` 可获得最小 Binary 文件大小
- `lto`: 链接时间优化，选择 `true` 或 `fat` 可优化依赖所有的 crates
- `codegen-units`: 代码生成单元，选择 `1` 会导致最慢的编译速度，但可收获最小的 Binary 体积
- `panic`: 在 panic 时的策略，选择 `about` 直接终止进程，这可能会导致 Debug 困难
- `debug`: Binary 文件中的调试信息量，选择 `false` 可不包含任何 Debug 信息，这可能会导致 Debug 困难
- `strip`: 剥离符号或调试信息，设置为 `true` 可剥离所有符号信息，这可能会导致 Debug 困难
- `debug-assertions`: 禁用 `cfg(debug_assertions)`，在一些库中可能会使用
- `overflow-checks`: 数值溢出检测，若强依赖于该功能请勿关闭

综上，对于 Binary 最小化来说，最优的 Profile 如下:

```toml
[profile]
minimal = { inherits = "release", opt-level = "z", lto = true, codegen-units = 1, panic = "abort", debug = false, strip = true, debug-assertions = false, overflow-checks = false }
```

最终结果:

| 参数 | 大小 |
| ---- | ---- |
| minimal | 2.08 MB |

有了十足的进步，是 release 的 50%

## UPX 大法

那就必须祭出我们的万能 UPX

用 UPX 有几个缺点:

- Windows 必报毒
- `--brute` 参数很慢

采用 Windows UPX 携带 `--brute` 参数最小化压缩上文的 `minimal` profile binary，结果如下:

| 参数 | 大小 |
| ---- | ---- |
| minimal + UPX | 914 KB |


又是原来的 50%，对比普通的 Release 已经是其约为 20% 的体积了

至此，在 Stable 的 Rust 下，不改动任何源代码文件的代码的，缩小 Binary 方法结束

## 最小化依赖

### 移除不必要的 features

举一个例子，对于最常用的异步运行时库 `tokio`，它提供了非常多 features 以供选择性开启，最好拒绝引用 `full` features

比如对于最简单的如下代码:

```rust
// main.rs

#[tokio::main]
async fn main() {
    println!("Hello, world!");
}
```

依赖:
```toml
[dependencies]
tokio = {version = "1", default-features = false, features = ["full"]}
```

该程序使用上述 minimal profile 编译，结果如下:

| 参数 | 大小 |
| ---- | ---- |
| tokio-helloworld-full + minimal | 214 KB |

若关闭不必要好的 features，仅保留必要的能使代码运行的 features:

```toml
[dependencies]
tokio = {version = "1", default-features = false, features = ["rt", "macros", "rt-multi-thread"]}
```

结果如下:

| 参数 | 大小 |
| ---- | ---- |
| tokio-helloworld-min + minimal | 189 KB |

虽然优化程度没有上面那么激进，但是遇到大型依赖时，仅选择必要的功能是最正确也最节省空间、节约编译时间的做法

### 将大型库换为小型库

Rust 中最常用的命令行解析库 `clap` 是最典型的例子

对于以下代码:

```rust
// main.rs

use clap::Parser;
#[derive(Parser)]
struct Args {
    input: String,
}

fn main() {
    let args = Args::parse();
    println!("{}", args.input);
}
```

依赖:

```toml
[dependencies]
clap = { version = "4.5.53", default-features = true, features = ["derive"] }
```

结果如下:

| 参数 | 大小 |
| ---- | ---- |
| clap + minimal | 304 KB |

好惊人的数字！没有异步，没有复杂逻辑，普通读取参数并输出的代码，最小 Profile 编译都有 300KB+ (即使此处没有最小化 features)

我们换用 `palc`，一个对标 `clap` 并宣称无痛兼容 `clap` 的轻量级 Rust 命令行解析库

依赖:

```toml
[dependencies]
palc = { version = "0.0.2", default-features = true, features = ["help"] }
```

代码无需改动，只需要把引入 `clap` 的语句改为 `palc` 即可

结果如下:

| 参数 | 大小 |
| ---- | ---- |
| palc + minimal | 134 KB |

虽然 `palc` 并未实现 `clap` 的所有功能，但是基本可以替换，代码体积可以直线下降

至于为什么可以让 Binary 下降，因为 `clap` 的理念是在运行时解析，而 `palc` 是在编译时用大量宏来预先生成解析代码，这可能会导致不灵活

在很多方面都有许多这样注重于轻量化的库替代流行的大型库，比如:

- `request` HTTP 客户端: `ureq` / `nyquest`
- `serde-json` Json 解析: `miniserde`
- ...

## Nightly 动手脚

### location-detail

你可以设置 RUSTFLAG `location-detail=none` 以移除代码行列信息，这可能会导致 Debug 困难

设置该 Flag 的变量: `RUSTFLAGS="-Zlocation-detail=none"`

结果如下: 

| 参数 | 大小 |
| ---- | ---- |
| minimal + location-detail=none | 1.99 MB |

好吧，姑且也是减少了 0.09MB，再接再厉

### fmt-debug

你可以设置 RUSTFLAG `fmt-debug=none` 以移除代码中的 Debug 兼容性，这将破坏 `dbg!()` / `assert!()` / `unwrap()` 等输出，这可能会导致 Debug 困难

设置该 Flag 的变量: `RUSTFLAGS="-Zfmt-debug=none"`

结果如下: 

| 参数 | 大小 |
| ---- | ---- |
| minimal + fmt-debug=none | 1.98 MB |

### build-std

通常，std 标准库是 pre-built 的，我们可以手动编译我们所需要的 std 部分以最小化 Binary

编译时传入 Cargo 参数: `-Z build-std=std,panic_abort -Z build-std-features="optimize_for_size"`

结果如下: 

| 参数 | 大小 |
| ---- | ---- |
| minimal + build-std | 1.91 MB |

### build-std + 移除 panic 字符串

你可以设置 RUSTFLAG `-Zunstable-options -Cpanic=immediate-abort` 

并在编译命令添加 `-Z build-std=std,panic_abort -Z build-std-features="optimize_for_size" --target $(rustc --print host-tuple)`

以移除所有的 Panic 字符串，这可能会导致 Debug 困难

还有，`--target` 参数是必须的，我也不知道为什么在同时启用 build-std 与 immediate-abort 时候不会应用默认的 Target

结果如下: 

| 参数 | 大小 |
| ---- | ---- |
| minimal + build-std + 移除 panic 字符串 | 1.75 MB |

### 结合与小结

把上面俩 RUSTFLAGS 结合起来，完整编译命令如下:

`RUSTFLAGS="-Zunstable-options -Cpanic=immediate-abort -Zfmt-debug=none -Zlocation-detail=none"" cargo +nightly build -Z build-std=std,panic_abort -Z build-std-features="optimize_for_size" --profile minimal --features ureq-support --target $(rustc --print host-tuple)`

最终结果

| 参数 | 大小 |
| ---- | ---- |
| minimal + Nightly | 1.75 MB |

好吧，结合起来后并没有显著的提升，原因是最后一步 `移除 panic 字符串` 已经将所有调试信息删除完毕了

## 总结

经过以上的各种步骤，你应该、也许、大概、可能编译出了一个小于 1MB 的 CLI 程序

我大概会推荐你按照以下的顺序优化:

1. UPX 压缩
2. 移除不必要的 features
3. 优化 Profile
4. 将大型库换为小型库
5. Nightly 动手脚

最终，这一 20MB 左右的程序被我们压缩到了 810 KB。相比之下一个 0 依赖的 HelloWorld 程序，都需要 125 KB

本文部分参考了 `https://github.com/johnthagen/min-sized-rust`，感谢