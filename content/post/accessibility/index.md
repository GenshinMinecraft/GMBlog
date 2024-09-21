---
title: 为没有无障碍设置的安卓设备打开无障碍 
description: 能不能投诉设备制造商不重视使用体验
date: 2024-09-21                
slug: accessibility           
image: 6624164248c80.webp 
categories:
    - Main               
    - Android
---

# 为没有无障碍设置的安卓设备打开无障碍 

本文作者 `GenshinMinecraft`，首发于 [本博客](https://blog.c1oudf1are.eu.org)，同时发布于其他论坛

## 前言

前几天心血来潮，想着给某个安卓设备上个 [流体手势导航](https://play.google.com/store/apps/details?id=com.fb.fluid&hl=zh&pli=1)，其需要无障碍权限以i实现功能

可是，该安卓设备阉割了原生安卓设置 `com.android.settings` 的所有与无障碍权限有关的东西，即使在 `
隐藏的设置项` 中寻找也无果，手动通过 ADB / Root 触发无障碍设置的 Activity 也没用

## 解决

经过搜寻，可以直接在 ADB Shell / Root Shell 中用安卓自带的 `settings` 命令来修改系统设置

首先，使用 ADB 连接至你的安卓设备 *(如果其拥有 Root，可直接在设备上的终端执行下列命令且无需前缀 `adb shell`)*

```
❯ adb devices
List of devices attached
202304050046    device
```

然后，使用命令打开**无障碍服务的总开关**:

```bash
adb shell settings put secure accessibility_enabled 1
```

随后，用命令获取**所有已经打开的无障碍权限**

```bash
adb shell settings get secure enabled_accessibility_services    
```

这里输出空白属于正常情况，即代表目前**没有**任何已经打开的无障碍权限

有的设备制造商会默认开启部分的无障碍服务，在这里会输出所有的无障碍 Services，以冒号 `:` 分割，如果需要添加，务必**在原有的基础上加上冒号再填入需要打开的 Services**

在这之前，我们还需要找到需要打开的应用的无障碍 Services，我们可以用下面的方法来寻找: 

```bash
adb shell dumpsys package com.fb.fluid \| grep com.fb.fluid/
```

在其中，你需要将 `com.fb.fluid` 更改为无障碍应用的包名，管道符号需要转义

输出大概长这样:

```
        787272a com.fb.fluid/.ui.ActivitySettings filter fe2980
        787272a com.fb.fluid/.ui.ActivitySettings filter 5dcdbb9
        fe86646 com.fb.fluid/.PauseFNGActivity filter 3ca46b2
        5411007 com.fb.fluid/.ResumeFNGActivity filter e568603
        cfe68eb com.fb.fluid/com.joaomgcd.taskerpluginlibrary.condition.BroadcastReceiverCondition filter 6dc5dac
        aa8c49e com.fb.fluid/.BootReceiver filter 4121bfe
        be2268b com.fb.fluid/com.joaomgcd.taskerpluginlibrary.action.BroadcastReceiverAction filter 4b17f5f
        f4e01fa com.fb.fluid/com.joaomgcd.taskerpluginlibrary.condition.IntentServiceCondition filter 61bacd6
        bc9c5e5 com.fb.fluid/.services.MyTileService filter 298b27b permission android.permission.BIND_QUICK_SETTINGS_TILE
        1aa036c com.fb.fluid/com.joaomgcd.taskerpluginlibrary.action.IntentServiceAction filter 7b148f1
        6a97159 com.fb.fluid/.ServiceNotificationListener filter 787a898 permission android.permission.BIND_NOTIFICATION_LISTENER_SERVICE
        b7b311c com.fb.fluid/.MainAccessibilityService filter f667a75 permission android.permission.BIND_ACCESSIBILITY_SERVICE
        412a125 com.fb.fluid/.CapacitiveKeysService filter 36ffa0a permission android.permission.BIND_ACCESSIBILITY_SERVICE
  com.fb.fluid/androidx.lifecycle.ProcessLifecycleOwnerInitializer:
    Provider{db191eb com.fb.fluid/androidx.lifecycle.ProcessLifecycleOwnerInitializer}
  com.fb.fluid/androidx.core.content.FileProvider:
    Provider{16016f3 com.fb.fluid/androidx.core.content.FileProvider}
    Provider{16016f3 com.fb.fluid/androidx.core.content.FileProvider}
    Provider{db191eb com.fb.fluid/androidx.lifecycle.ProcessLifecycleOwnerInitializer}
```

我们需要在里面找到有 `Accessibility` / `Main` / `Service` 字样的字段，这里为 `com.fb.fluid/.MainAccessibilityService`

不同的软件会有不同的 Service 名字，请仔细寻找

或者最简单的方式，就是*在其他正常的安卓设备* **安装并打开无障碍应用的权限**，再用 `adb shell settings get secure enabled_accessibility_services` 获取即可

最后，使用命令打开其无障碍的 Services 即可:

```bash
adb shell settings put secure enabled_accessibility_services com.fb.fluid/.MainAccessibilityService
```

记得把 `com.fb.fluid/.MainAccessibilityService` 替换为上面获取到的 Services，如果有多个 Services 还要使用 `:` 分割

## 小结

就这样吧，主要的命令就几个:

```bash
adb shell settings put secure accessibility_enabled 1
adb shell settings get secure enabled_accessibility_services   
adb shell settings put secure enabled_accessibility_services com.fb.fluid/.MainAccessibilityService
```

