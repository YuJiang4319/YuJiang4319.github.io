---
title: Google浏览器卡顿解决
date: 2023-11-16 16:55:38
tags:
  - Google
categories:	
  - Google
description: Google浏览器卡顿解决
---

## 症状：

​		使用Google浏览器看视频和直播不定时卡顿，查询一番，原来Chrome 浏览器默认开启了“GPU 渲染”的特性，当开启了硬件加速选项之后，所有的 Web 网页内容都会使用显卡 GPU 来进行解析渲染

## 解决步骤：

1.先将 Chrome 升级到最新的版本，并将硬件驱动/显卡驱动升级到最新版，打开 Chrome 谷歌浏览器，进入“设置 → 高级 → 系统”，将 `使用硬件加速模式` 的选项关闭掉，重启浏览器。如果设置后卡顿已有明显改善，那么就此搞定，不然继续第二步。

![image-20231116191220873](https://cdn.jsdelivr.net/gh/YuJiang4319/images/blog_imgs/image-20231116191220873.png)

2.在地址栏上输入：`chrome://flags/` 回车，在顶部搜索栏中搜索 `gpu`，列表中找到：“**GPU rasterization**”(GPU 渲染) 以及 “**Accelerated 2D canvas**”(2D 图形加速) 两项，将它们都设为`Disabled`禁用即可。点击右下角的`ReLaunch`重启浏览器。

![image-20231116192056053](https://cdn.jsdelivr.net/gh/YuJiang4319/images/blog_imgs/image-20231116192056053.png)