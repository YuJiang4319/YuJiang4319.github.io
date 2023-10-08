---
title: GitHub文件生成下载链接
date: 2023-10-08 13:55:38
tags:
  - github
categories:	
  - GitHub
description: GitHub文件生成下载链接
---

### 前言：

​		最近写博客的时候有保存文件的下载链接的需求，担心以后下载链接失效，故通过GitHub建立仓库，来保存一些重要文件，并生成其下载链接，嵌入到博客当中，方便以后下载。

#### 步骤：

​		首先创建一个 `public` 仓库，然后将其 `git clone` 到本地，上传所需保存的文件

![image-20231008131330207](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20231008131330207.png)

​		然后 `push` 到远程仓库

![image-20231008131409622](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20231008131409622.png)

根据以下格式生成下载链接：

```url
https://raw.githubusercontent.com/<用户名>/<仓库名>/<分支>/<路径>/<文件名>
```

如：

```url
https://raw.githubusercontent.com/YuJiang4319/File_download/main/Xiaomi路由器青春版固件/MI-NANO_3.4.3.9-099.trx
```

然后将其嵌入到博客中，点击链接即可下载