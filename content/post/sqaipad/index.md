---
title: 松鼠AI学习机V11|SQAIPAD-V11 破解/Root (适用于所有MTK设备)
description: 傻逼松鼠ai什么时候死一死，赶紧跑路ok？
date: 2023-08-23
slug: sqaipad
image: image.png
categories:
    - Main
    - Android
---

# 松鼠AI学习机V11|SQAIPAD-V11 破解/Root (适用于所有MTK设备)

本文由 `High Ping Network` 的小伙伴 GenshinMinecraft 进行编撰，首发于 [本博客](https://blog.highp.ing)

Root原文方法链接：<https://blog.csdn.net/shenjingwa012/article/details/131018766>

***由于原文方法有些过时，且不是描述得很完整，所以撰写这一篇文章***

***`SQAIPAD-V11`的所有分区镜像(不包含userdata)已存放在[我的GitHub仓库中](https://github.com/GenshinMinecraft/SQAIPAD-V11_Official_Images)，设备的目录树文件也存放于[这一GitHub 仓库](https://github.com/GMBuilding/alps_SQAIPAD_V11_Twrp_Devices)中***

## 前言

`SQAIPAD-V11`是一款《智能ai学习机》，专门骗各位家长购买

而由于各种政策导致线下店家*大批量跑路*，留下一块*没什么b用*的板子

这篇文章普遍适用于**松鼠ai的其他学习机**，也适用于**所有MTK设备**!

本文以我手上的`SQAIPAD-V11`作为演示，破解/Root

`SQAIPAD-V11`大致配置如下：
- [MT6771](https://i.mediatek.com/p60/tw)(Helio p60)
- 256G+8G
- Android 10

可以看到性能还是不算差的，而且是MTK平台，*可玩性很高*

我们需要准备以下的东西：

破解：
- 脑子和手
- Win10+电脑一台
- adb驱动
- [platform-tools](https://dl.google.com/android/repository/platform-tools-latest-windows.zip?hl=zh-cn)

Root：
- 上面的破解所需东西
- fastboot驱动
- [MediaTek USB VCOM](https://www.aliyundrive.com/s/JnsAqCJrUyu)
- [UsbDk](https://github.com/daynix/UsbDk/releases/)
- [Python3.8+](https://www.python.org/downloads/)
- [MtkClient](https://github.com/bkerler/mtkclient)

## 破解(可绕过`软件包管理器`进行安装，防止应用被卸载)

### 打开开发者模式

这一步**别看很简单**，但是，按照寻常的方法是打不开`开发者模式`的！

因为系统通过某次OTA升级将开发者模式锁死了，但还是有漏洞绕过的

首先来到`设置`中，去设置一个设备锁屏密码，图案/pin均可

其次直接按照普通方法打开`开发者模式`即可，就是连续点击`版本号`多次

相信这里对玩基佬来说还是轻车熟路的，最后打开`ADB调试`即可！

### 禁用主界面程序(com.boll.tutorialclasslauncher)

Win10+电脑在装好驱动并下载好`platform-tools`后，用数据线将设备连接至电脑

随后去`platform-tools`中打开CMD，输入
```cmd
adb devices
```

有设备输出即为连接上电脑！

其次在CMD内输入：
```cmd
adb shell pm disable-user com.boll.tutorialclasslauncher
```

***注：第一次连接时需要在设备屏幕上验证***

禁用完毕后，点击设备上的`Home`键*（也就是小圆点）*

选择`Launcher3`，就可以到**默认的AOSP桌面了**！

### 安装安装狮并授权

在这里下载`安装狮`APK：<https://blog.highp.ing/p/sqaipad/com.modosa.apkinstaller-3.7.5-42-231938.apk>

通过`ADB`安装至设备上：
```cmd
adb install [将下载好的安装狮拖入进来]
```

稍等几秒钟，就安装好了！

在设备上打开`安装狮`，同意各种协议后，回到CMD：
```
adb shell dpm set-device-owner com.modosa.apkinstaller/.receiver.AdminReceiver
```

然后在`安装狮`软件内打开`安装狮-DPM`的开关

以后就可以使用`安装狮`进行安装APK了，绕过了原来的`软件包管理器`限制！

### 完成

最后，再下载一个浏览器的apk，通过`ADB`安装至设备中，就可以完美使用了！

正常使用与一般安卓设备**无差别**，如果*不想折腾*就可以不用看下去了！

## ROOT

重头戏来了！简单的**破解安卓**肯定不是各位玩基佬的最终目标

所以我们要**Root**这块**松鼠ai学习机**

由于其标准mtk设备的原因，所以十分好折腾！

***注：玩机有风险，Root需谨慎！***
***请先做好备份再折腾！***

***请先按照以上的破解方法在`开发者模式`中打开`OEM解锁`!***

### 安装驱动&Python

请先根据前言中的链接安装好`MediaTek USB VCOM`、`UsbDk`、`Python3.8+`

安装方法基本都是*一路下一步*

需要注意的是安装`Python`时，记得要勾选**Add Python to PATH**，这样才方便使用！

安装完上述东西后，*重启电脑*！

### 安装MtkClient以及依赖

从Github Clone/下载zip:<https://github.com/bkerler/mtkclient>

如果因为网络问题无法下载，可以选择[这一链接](https://ghproxy.com/https://github.com/bkerler/mtkclient/archive/refs/heads/main.zip)

将其解压到**磁盘根目录**或**非中文路径**的地方，在文件夹内打开CMD*安装依赖*：

```cmd
pip3 install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
python setup.py install
```

安装完依赖后重启电脑！

### 使用MtkClient解锁BootLoader

在MtkClient目录下打开CMD：

```
python mtk da seccfg unlock
```

出现以下的文本即为**已设置好上述依赖/驱动**

```
Preloader - Status: Waiting for PreLoader VCOM, please connect mobile

Port - Hint:

Power off the phone before connecting.
For brom mode, press and hold vol up, vol dwn, or all hw buttons and connect usb.
For preloader mode, don't press any hw button and connect usb.
If it is already connected and on, hold power for 10 seconds to reset.
```

这个时候，我们需要事先**将设备关机**

之后**一边按着设备的三个按键，一边将数据线连接电脑**，这一步十分重要！

之后也要频繁地使用这一方法连接！下文不再赘述！看到此信息时请**自觉执行上述步骤！**

此时设备上**不会有任何显示**，如果出现了*开机界面***请重试**！

如果按照上述做了之后，CMD窗口内*没有其他的反应*，持续输出*上述文本*，说明**未成功**！

需要拔掉数据线后再次尝试，如果还无法解决，请按照以下列表排查问题：
- 是否安装好了驱动
- 更换数据线
- 更换接口

随后开始*传输DA*，绕过限制*解锁BootLoader*

当出现`flashext - Successfully wrote seccfg.`即为解锁成功！

断开连接，长按电源键开机，开机界面会有一个`Orange State`，这样就可以验证为解锁成功了！

也可以去`Fastboot`环境下，在`platform-tools`目录下执行：
```
fastboot oem lks
```

返回为0则为成功解锁！

### 备份分区（可选）

玩机过程中总有那么几个时候手贱，所以事先备份就**很重要了！**

#### 备份全机

备份全机可以使用
```
python mtk rl mt6771
```

这样就可以将全机备份在当前目录的`mt6771`文件夹下了！

如果一不小心变砖了，可以通过以下命令恢复：
```
python mtk wl mt6771
```

其中`mt6771`是上面备份文件夹名称，可自定义。

***这里的备份会比较久，请勿在备份时断开设备与电脑连接，并确保电脑储存空间足够！***

#### 备份单个分区

备份单个分区可以使用
```
python mtk r [分区名] [备份后的文件名]
python mtk r boot boot.img
python mtk r boot,vbmeta boot.img,vbmeta.img
```

稍等备份完毕后就可以在路径下**找到文件名**了！

### 提取boot&vbmeta并修补

使用上面的命令，一键**提取Boot与vbmeta**
```
python mtk r boot,vbmeta boot.img,vbmeta.img
```

使用***上面破解的方法***安装最新版Magisk

在`platform-tools`目录下执行
```
adb push [上面备份的boot.img路径，可直接拖入进来] /sdcard/
```

设备打开Magisk，修补`内部储存空间`中的boot.img

修补完成后，电脑CMD执行
```
adb pull /sdcard/Download/[Magisk修补完成后的路径] [本机路径]
```

将`MtkClient`下的**已修补boot.img**改名为`boot-magisk.img`

### 刷入已修补Boot

注：这里可以选择使用`Fastboot`或`MtkClient`刷入，本文以`Fastboot`为例

将设备重启至`BootLoader`模式

在`platform-tools`目录下执行
```
adb reboot bootloader
```

当设备底部显示`FASTBOOT MODE`时即为成功进入`BootLoader`

在`platform-tools`目录下执行
```
fastboot flashing unlock
fastboot flash boot [上面已修补的boot-magisk.img，可直接拖入进来]
fastboot --disable-verity --disable-verification flash vbmeta [MtkClient目录下的vbmeta.img.empty，可直接拖入进来]
fastboot flashing lock
fastboot reboot
```

设备将重启，重新按照***上面破解的方法***安装Magisk，启动即可获取到**Root**权限！

## 总结

这一方法可以通杀Mtk设备，当然可以用在松鼠AI学习机上，[CSDN](https://blog.csdn.net/shenjingwa012/article/details/131018766)的作者使用的是`SQAIPAD-Y1`，我使用的则是`SQAIPAD-V11`，经测试都可以使用此方法！

最后再强调三遍：

***松鼠Ai&栗浩洋 你妈死了 永世不得超生***

***松鼠Ai&栗浩洋 你妈死了 永世不得超生***

***松鼠Ai&栗浩洋 你妈死了 永世不得超生***

***祝所有打着《AI教育》幌子的垃圾企业们 早日倒闭***

***祝所有打着《AI教育》幌子的垃圾企业们 早日倒闭***

***祝所有打着《AI教育》幌子的垃圾企业们 早日倒闭***

欢迎加入 High Ping 大家庭:
- [官网](https://highp.ing)
- [Blog](https://blog.highp.ing)
- [@HighPingNetwork](https://t.me/HighPingNetwork)
- [@HighPingChat](https://t.me/highpingchat)