---
title: Git连接GitHub
date: 2023-08-28 16:55:38
tags:
  - GitHub
categories:	
  - GitHub
description: Git连接GitHub
---

### 1.创建SSH Key：

​	在用户主目录（C:\Users\Administrator）下，看看有没有.ssh文件，如果有，再看文件下有没有id_rsa和id_rsa.pub这两个文件，如果已经有了，可直接到下一步。如果没有，打开Git Bash，输入命令，创建SSH Key

```shell
ssh-keygen -t rsa -C "你自己注册GitHub的邮箱"
```

![image-20240130151746288](https://raw.githubusercontent.com/YuJiang4319/images/main/blog_imgs/image-20240130151746288.png)

### 2.添加SSH Key：

​	接下来到GitHub上，打开“Account settings”--“SSH Keys”页面，然后点击“Add SSH Key”，填上Title（随意写），在Key文本框里粘贴 id_rsa.pub文件里的全部内容。

![image-20240130152014787](https://raw.githubusercontent.com/YuJiang4319/images/main/blog_imgs/image-20240130152014787.png)

![image-20240130152102088](https://raw.githubusercontent.com/YuJiang4319/images/main/blog_imgs/image-20240130152102088.png)

### 3.登录：

​	git bash里输入下面的命令登陆

```shell
ssh -T git@github.com
```

![image-20240130152242855](https://raw.githubusercontent.com/YuJiang4319/images/main/blog_imgs/image-20240130152242855.png)

### 4.必要配置：

​	git commit 命令会记录提交者的信息，所以使用git前必须先添加两条信息

```shell
git config --global user.name "你的GitHub登陆名"
git config --global user.email "你的GitHub注册邮箱" 
```

![image-20240130152547523](https://raw.githubusercontent.com/YuJiang4319/images/main/blog_imgs/image-20240130152547523.png)
