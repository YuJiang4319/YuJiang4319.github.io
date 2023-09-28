---
title: 自用bat脚本
date: 2023-09-25 16:55:38
tags:
  - bat
categories:	
  - Program
description: 个人常用bat脚本整理
---

#### GitHub pull：

```bat
@echo off
git pull
```

#### GitHub push：

```bat
@echo off
git add . 
git commit -m "update" 
git push
```

#### Hexo Update：

```bat
hexo clean && hexo g -d
```

#### Enable DHCP：

```bat
REM 修改为支持中文字符的编码，否则运行为乱码
chcp 65001  
netsh interface ipv4 set address name="以太网" source=dhcp
pause
```

#### Manual Set IP：

```bat
REM 修改为支持中文字符的编码，否则运行为乱码
chcp 65001  
netsh interface ipv4 set address name="以太网" static 192.168.1.100 255.255.255.0 192.168.1.2
netsh interface ipv4 set dns name="以太网" static 192.168.1.1 primary
netsh interface ipv4 add dns name="以太网" 114.114.114.114 index=2
pause 
```

