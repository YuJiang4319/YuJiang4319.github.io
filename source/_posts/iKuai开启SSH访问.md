---
title: iKuai开启SSH访问
date: 2023-09-28 11:35:38
tags:
  - Re
categories:	
  - Program
description: iKuai开启SSH访问
---

​	最近在爱快上用docker安装qBittorrent遇到一些问题，想通过SSH连接爱快查看系统日志，结果发现怎么都连接不上。Google查询资料后，才得以连接成功，以下记录解决方式：

​	首先在爱快的管理页面打开远程维护功能，并设置password

![img](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/2bdcee144fa560f91b2a38c246cd048d.png)

​	然后打开SSH连接工具，因为没有给用户名，具体用户名也不知道是什么，尝试了admin、root，密码都没有试对，最后找了很多资料发现这里的用户名是`sshd`，登陆进去就是一个控制台页面

![img](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/11c2429cfb9ced48e29aedd58377d98a.png)