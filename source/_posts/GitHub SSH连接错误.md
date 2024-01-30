---
title: GitHub SSH连接错误
date: 2023-09-11 13:51:38
tags:
  - GitHub
categories:	
  - GitHub
description: GitHub SSH连接错误 kex_exchange_identification,Connection closed by remote host
---

## GitHub连接错误：kex_exchange_identification:Connection closed by remote host

#### 前言：

使用命令测试GitHub连接时报错：

```shell
C:\Users\miryang\Desktop\YuJiang4319.github.io>ssh -T git@github.com
kex_exchange_identification: Connection closed by remote host
```

#### 解决：

- 关掉梯子（不推荐）
- 将 Github 的连接端口从 22 改为 443 

#### 操作：

编辑 **~/.ssh/config** 文件（没有就新增），windows在用户目录下的.ssh目录，添加如下内容

```text
Host github.com
    HostName ssh.github.com
    User git
    Port 443
```

#### 验证：

```shell
C:\Users\miryang\Desktop\YuJiang4319.github.io>ssh -T git@github.com
The authenticity of host '[ssh.github.com]:443 ([198.18.2.79]:443)' can't be established.
ECDSA key fingerprint is SHA256:p2QAMXNIC1TJYWeIOttrVc98/R1BUFWu3/LiyKgUfQM.
Are you sure you want to continue connecting (yes/no/[fingerprint])? y
Please type 'yes', 'no' or the fingerprint: yes
Warning: Permanently added '[ssh.github.com]:443,[198.18.2.79]:443' (ECDSA) to the list of known hosts.
Hi YuJiang4319! You've successfully authenticated, but GitHub does not provide shell access.
```

