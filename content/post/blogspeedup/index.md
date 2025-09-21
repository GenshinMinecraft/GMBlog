---
title: 博客网络优化日记
description: 实在受不了 CMCC 了
date: 2025-08-21
slug: blogspeedup
image: https://img.genmin.icu/p/blogspeedup/image.png
categories:
    - Main
---

# 博客网络优化日记

又是一日闲来无事，最近看到我的博客 <https://c1oudf1are.eu.org> 国内访问性 可谓是十分差劲

遂有本文优化记录

## 优化前

优化前，我的博客直接使用 Cloudflare 提供的 DNS 解析，没有任何优化项目，也没有优选

下面是优化前的样子:

- blog.highp.ing:
    ![alt text](https://img.genmin.icu/p/blogspeedup/51B8BD33-8A81-414C-B101-0447F06FA60A.png)
- cf.c1oudf1are.eu.org
    ![alt text](https://img.genmin.icu/p/blogspeedup/B748F6E4-7EEB-4F29-B4FB-804A5504A451.png)

主要的问题在于移动主动屏蔽 Cloudflare 且 DNS 解析服务器位于境外，解析时间过长

而且免费域名 .eu.org 和 不可备案域名 .ing 均可能被特殊针对，域名也是一大问题

## 优化过程

优化过程主要分为以下几个方面:
- 买新的域名
- 用新的 CDN
- 写好分流重定向

### 新的域名

斥巨资在阿里云花了 8 rmb 买了一个 `genmin.icu`，这将作为以后本站的主域名

该域名未在中国进行 ICP 备案 (得 16+)，所以国内 CDN 无境内节点，仅作为分流使用

DNS 使用的是 `阿里云` 国内 DNS 服务，应该会比 Cloudflare 好很多 (但免费无境外 DNS 服务器)

### 新的 CDN

国内电信 / 联通 使用的是群友提供的 `High Ping CDN`，到国内线路良好

国际主要是使用 CF 直连，完全没有问题

国内移动则直接使用 阿里云 免费提供的 ESA CDN 服务，但因无境内服务器 (需备案) 所以国内没法全绿，大部分走的香港节点

### 分流重定向

分流重定向未使用更快捷的 GeoDns，因为证书不好配

入口均为 ESA CDN 服务，使用重定向规则再分流到各个 CDN

理论上，只要访问 <https://genmin.icu> 即可自动 302 到最快的 CDN

本站所有图片资源已转换使用 ESA CDN 分流，所以多图博客再也不慌

## 优化结果

你可以使用下面任何一个域名来访问本博客:

- <https://genmin.icu>: 主站，自动分流
    ![alt text](https://img.genmin.icu/p/blogspeedup/520178B7-1875-4EAF-8AE6-0627526E6C8D.png)
- <https://cf.c1oudf1are.eu.org> / <https://blog.highp.ing>: Cloudflare 站点
    ![alt text](https://img.genmin.icu/p/blogspeedup/B748F6E4-7EEB-4F29-B4FB-804A5504A451.png)
- <https://c1oudf1are.eu.org>: High Ping CDN 站点
    ![alt text](https://img.genmin.icu/p/blogspeedup/16AC1E93-63D5-4D69-9B3B-46011E6FFBBD.png)

## 小结

一开始写博客的时候，并不觉得让用户体验好点是个很重要的事情，因为能看到我的博客的人基本上技术能力应该不会很差

但是，由于博客的生活化，来自搜索引擎的流量增多，所以网站优化不得不提上日程

最主要是买了个新的域名，代替了疑似被国内污染的 Highp.ing 以及免费域名 c1oudf1are.eu.org

还有就是感谢 Cloudflare、阿里云、以及群友的大力支持