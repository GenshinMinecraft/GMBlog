---
title: NodeGet Static Bucket 功能 & 方便主题搭建
description: 不是说好了发布前不新增功能了吗
date: 2026-05-17
slug: nodeget-static
image: https://img.genmin.icu/p/nodeget-static/image.png
categories:
    - Main
    - NodeGet
---

# NodeGet Static Bucket 功能 & 方便主题搭建

## 前言

Hi，这里是 GenshinMinecraft

- **官方文档**：<https://nodeget.com>
- **Telegram 频道**：[@NodeGetProject](https://t.me/NodeGetProject)
- **Telegram 讨论组**：[@NodegetGroup](https://t.me/NodegetGroup)
- **前端 Dashboard 仓库**：[NodeSeekDev/NodeGet-board](https://github.com/NodeSeekDev/NodeGet-board)
- **前端 Status Board 仓库**：[NodeSeekDev/NodeGet-StatusShow](https://github.com/NodeSeekDev/NodeGet-StatusShow)
- **Nodeseek 社区**：<https://nodeseek.com>


之前有非常多的 NodeGet Status Show 的搭建教程，不论是 Docker，CloudFlare Pages，或者是各路教程部署

都有一个共同缺点，太麻烦了

所以我们在 `v0.2.x` 引入了 Static Bucket 功能

## 简介

Static Bucket 功能可以被理解成本地的一个**极其简易**的 HTTP 服务器，可以简单类比 Cloudflare Pages

他会在本地 `./static` 目录下维护文件夹 (可配置)，具体目录如下:

- `./static/status_show(Static Bucket Path)`

它提供了基于 JSON-RPC 的 API，可以自定义挂载的目录，甚至你可以嵌套

- `./static/status_show(Static Bucket Path)/`
- `./static/status_show/SomeOtherThings/`

类似这样

还可以将其挂载到 `/` 目录，访问 NodeGet 提供的端口就可以直接访问 Status Show 面板

甚至甚至，你可以直接把它当作 WebDAV 服务器，连接到 `/nodeget/static-webdav/{name}`，username 是 TokenKey，password 是 TokenSecret，配合优秀 Token 权限系统，完全可以作为文件管理使用

## 意义

这样做的意义是什么？很简单:

- 你可以同时使用多个主题，都可以连接到同一个后端（甚至你可以做到每次访问随机换一个主题）
- 不止可以存放主题，还可以存放任何静态数据（比如我的博客目前就跑在 NodeGet Status Bucket 上）
- 官方 Dashboard 已经更新，可以编写管理

我们适配了一个按钮，类似:

<a href="https://dash.nodeget.com/#/dashboard/theme-management?add=https://nodeget.pages.dev">
  <img src="https://dash.nodeget.com/deploy-button.png" alt="deploy button" width="230px" />
</a>


如果你的 NodeGet Dashboard 已经连接上了后端，并且版本已经更新到 `v0.2.x`

点击上面的按钮就可以快捷部署官方 Status Show 展示面板，不再需要麻烦的 Pages 等

如果你很喜欢 一个使用了符合最新规范的主题，直接输入他面板的链接，就可以直接下载他的主题 ~~(扒下他的衣服，给自己穿上)~~

## 主题开发者必读

如果你是一位主题开发者，也欢迎内嵌类似这样的按钮

请查阅 https://nodeget.com/dev/theme/ 文档