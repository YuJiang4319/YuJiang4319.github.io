---
title: 部署leanote云笔记
date: 2023-08-08 21:51:38
tags:
  - Leanote
categories:	
  - Project
description: 部署leanote云笔记
---

# 部署leanote云笔记

### 一、准备

**1.安装宝塔面板**

**2.安装MongoDB和Nginx**

**3.上传leanote的压缩包到主机/homee/www/目录下**

### 二、开始部署

**解压leanote到当前文件夹**

```shell
[root@Mir leanote]# tar -zxvf leanote-linux-amd64-v2.6.1.bin.tar.gz 
```

**进入leanote数据库备份文件夹，并将其导入MongoDB数据库**

```shell
[root@Mir mongodb_backup]# ls
leanote_install_data
# 导入
[root@Mir mongodb_backup]# mongorestore -h localhost -d leanote --dir leanote_install_data/
```

**启动leanote**

```shell
# 进入bin目录
[root@Mir bin]# ls
leanote-linux-amd64  run.sh  src
# 后台启动
[root@Mir bin]# nohup bash run.sh &
[1] 6631
```

### 三、访问9000端口

**记得阿里云和宝塔都要放行9000端口**

![image-20220508092605815](https://s2.loli.net/2022/05/08/LTp6Q82UBJIOsxm.png)

