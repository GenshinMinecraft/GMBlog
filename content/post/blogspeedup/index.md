---
title: 博客访问速度提升指南
description: 本文粗略列举了几种提升网站访问速度的方法
date: 2024-01-07
slug: blogspeedup
image: difference-between-internet-and-download-speed-excitel.jpg
categories:
    - Main
    - CloudFlare
    - Free
---

# 博客访问速度提升指南

本文由 `High Ping Network` 的小伙伴 Lemonawa 进行编撰，首发于 [本博客](https://blog.highp.ing)

## 使用静态资源CDN服务

使用静态资源 CDN 上的资源可以加快页面加载的时间, 静态资源 CDN 的服务器大多离访问者较近, 源站只需加载很少的内容即可完成页面加载, 同时减轻了源站的网络负载

具体测评可参考: [常用静态公共CDN评测](https://blog.highp.ing/p/public-cdn/)

## 使用节点分布广泛的图床

图床最初为减轻源站负担而设立, 更可用于加快页面访问速度

具体测评可参考: [各类主流图床评测](https://blog.highp.ing/p/pic-hosting/)

本站采用的是B站图床, 节点众多

## 尽量采用静态驱动程序

对于博客，WordPress 虽然绚丽多彩

相比 Hexo 有更为丰富的主题资源和易用性

但其加载速度远远慢于Hexo

博客类网站强烈建议使用静态驱动程序(如: hexo, jekyll等), 加载速度将获得显著提升
