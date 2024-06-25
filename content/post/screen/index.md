---
title: Linux通用保活方式-Screen教程
description: 只要是能在终端运行的都能使用这种方法保活哦~~
date: 2023-07-23
slug: screen
image: 11.jpg
categories:
    - Main
    - Linux
---

# Linux通用保活方式-Screen教程

本文由 `High Ping Network` 的小伙伴 GenshinMinecraft 进行编撰，首发于 [本博客](https://blog.highp.ing)

## 前言
我们都知道，在ssh终端内运行的命令，断开连接后将会快速地被杀死，这才需要我们去使用保活的方法。

常见的保活方法有很多，如`systemd`、`screen`、`nohup`等。其各有优缺点。我最推荐的是`screen`，它有以下的优点：
1. 配置简单
2. 支持在运行时查看日志与输入
3. 稳定保证进程不被杀死（OOM Killer除外）

但是也有一定的缺点：
1. 无法设置开机自启（也可以使用开机脚本的方式实现）
2. 在screen内运行的程序有可能会被**OOM**（内存管理系统）杀死

但是还是非常建议在临时或*生产力环境*使用`screen`！

## 操作
screen的操作十分简单，简单使用仅需要记住四个命令即可！
***注：如果提示命令不存在，请先使用包管理器安装screen！***

### 创建screen窗口
使用以下命令来创建一个名为***Main***的窗口并进入：
```bash
screen -S Main
```

在其中运行完需要保活的命令之后，直接**关闭终端**或者按下`Ctrl+A+D`退出screen窗口并让命令在里面继续运行。

### 进入screen窗口
在screen窗口里面运行完命令退出后如何回到screen窗口里呢？
```bash
screen -d -r Main
```
这样就可以进入一个名为***Main***的窗口（请确保Main窗口已创建，不然会报错）。可以在里面继续执行命令了！

### 列出screen窗口
开的窗口太多了，找不到了怎么办？
```bash
screen -ls
```
这样就可以列出所有的窗口啦！

### 退出screen窗口
退出screen窗口有两种方式，第一种是先进入窗口终止程序再退出：
```bash
screen -d -r Main(窗口名)
Ctrl+C
Ctrl+D
```

还有一种方式，是通过纯命令行的：
```bash
screen -S Main(窗口名) -X quit
```

## 进阶玩法
### 在命令行里创建screen窗口并在里面执行命令
对于在命令行里创建窗口在里面执行命令，是脚本里面*最为常见*的一个用法：
```bash
screen -dmS [窗口名] [命令]
```
这样就可以创建screen窗口并在里面执行命令，而且不用进入窗口\
前提是这一个**命令必须存在**！\
执行完毕后就会*自动退出窗口*，不用自己关闭。

### 3.1进阶版
如果我们还想在创建窗口时输入命令，并自动输入命令下的参数呢？
```bash
screen -x -S [窗口名] -p 0 -X stuff "命令" && screen -x -S [窗口名] -p 0 -X stuff $'\n'
```
这样就可以在创建窗口后*自动输入命令*，请注意窗口需要**先创建**！

## 总结
对于一些小型的项目，使用screen保活是*最好用的方法*，也可以在里面运行一些***测试脚本、编译***之类的。\
但是请注意机器的内存使用情况，也许会把运行在screen内的大内存进程Killed！

欢迎加入 High Ping 大家庭:
- [官网](https://highp.ing)
- [Blog](https://blog.highp.ing)
- [@HighPingNetwork](https://t.me/HighPingNetwork)
- [@HighPingChat](https://t.me/highpingchat)