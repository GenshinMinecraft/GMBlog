---
title: 关于松鼠 AI 学习机的各种破解方法
description: 十年没玩安卓了
date: 2024-08-17
slug: sqaipadbug
image: Genshin5.jpg
categories:
    - Main
    - Android
---

# 关于松鼠 AI 学习机的各种破解方法

本文由 `High Ping Network` 的小伙伴 GenshinMinecraft 进行编撰，首发于 [本博客](https://blog.c1oudf1are.eu.org/p/) 

## 前言

在上篇文章 [松鼠AI学习机V11|SQAIPAD-V11 破解/Root (适用于所有MTK设备)](https://blog.c1oudf1are.eu.org/p/sqaipad/) 之前，我曾找到过许多该学习机的破解方法 / Bug，为我的 Android 研究开了一扇大门

当然，本文章还是会基于 `SQAIPAD-V11` 机型进行探究，我不清楚是否适用于其他机型，请自行研究

## 蓝牙大法

最开始，当我拿到该学习机后，其系统较为开放，并未做过多限制

只需要使用其他设备向该学习机蓝牙发送一个 主桌面 的 APK，安装后即可完整使用

当时尚未封禁了`软件包管理器`的安装权限，所以这是最为简单的

## 密码大法

在后来的某次 OTA 升级之后，其封禁了 `开发者模式` 的开启选项，表现为不论点击多少次版本号都无法打开 `
开发者模式`，这对后续的 ADB 折腾非常不友好

当然，你只需要先去设置中**设置一个密码**之后，再去用同样的方法，多次点击版本号即可**打开开发者欧式**

我不清楚为什么这样可以打开，可能是奇奇怪怪的历史遗留问题

## 改包名大法

又是在后来的某次 OTA 升级后，其默认的主界面程序 `com.boll.tutorialclasslauncher` 会自动删除所有第三方程序 (其自带的 `素养中心` 内的软件除外)

经过我的观察，他并不会卸载包名开头为 `com.ssai` 的软件

所以，只要将包名修改为 `com.ssai.xxxxxxxxx` 即可完成绕过检测

当然这个方法并不完美，有的软件不可能修改包名，所以这只能作为备用方案

## 杀后台大法

既然前面提到了默认的主界面程序 `com.boll.tutorialclasslauncher` 会自动删除所有第三方程序

那么只要不启动该后台程序不就好了？

这里还是进入 `开发者选项` - 滑动到最底部 - 将 `不保留后台程序` 打开

只要不返回默认的主界面，学习机就与普通 Android 平板无异，可以自由安装任意包名的软件

需要注意的是，一旦使用这种方法，就不要再打开主界面程序了，一旦打开则前功尽弃

所以，该方案有个弊端: **无法再正常使用学习机的学习功能**，毕竟主界面都进不去了

## 终极大法

说了这么多，最好的方法还是完全地破解他

有关 Root 等方案，可以查看[开头提到的该文章](https://blog.c1oudf1are.eu.org/p/sqaipad/)

## 结尾

SO 就这样吧，这款学习机破解起来毫无难度，希望松鼠 AI 官方加强防护，再让我来挑战一下哦！

欢迎加入 High Ping 大家庭:

- [官网](https://highp.ing)
- [Blog](https://blog.c1oudf1are.eu.org)
- [@HighPingNetwork](https://t.me/HighPingNetwork)
- [@HighPingChat](https://t.me/highpingchat)


