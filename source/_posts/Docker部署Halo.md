---
title: Docker部署Halo
date: 2023-08-08 20:51:38
tags:
  - Docker
categories:	
  - Project
description: Docker部署Halo
---

# Docker部署Halo

### 一、创建Dockerfile

**1.创建目录存放Dockerfile相关文件**

```shell
[root@Mir home]# mkdir yyj
```

**2.将halo.jar放入Dockerfile所在目录**

```shell
[root@Mir yyj]# ls
Dockerfile  halo-1.4.17.jar
```

**3.编辑Dockerfile文件**

```shell
[root@Mir yyj]# vim Dockerfile 
# 内容如下
[root@Mir yyj]# cat Dockerfile 
FROM centos:7			# 基于centos:7镜像
MAINTAINER YYJ<2923979840@qq.com>

RUN yum update -y \      # 更新软件包，安装JDK 11
	&& yum install java-11-openjdk -y
COPY halo-1.4.17.jar /       # 复制halo的jar包到容器内centos的根目录

EXPOSE 8090        # 暴露容器内8090端口(halo默认端口)

ENTRYPOINT ["nohup","java","-jar","/halo-1.4.17.jar","&"]   
# 执行nohup java -jar /halo-1.4.17.jar & 命令
# & 代表在后台运行
# nohup 在系统后台不挂断地运行命令，退出终端不会影响程序的运行
```

### 二、生成镜像

```shell
[root@Mir yyj]# docker build -t halo:1.4 .
Sending build context to Docker daemon  81.15MB
Step 1/6 : FROM centos:7
 ---> eeb6ee3f44bd
Step 2/6 : MAINTAINER YYJ<2923979840@qq.com>
 ---> Using cache
 ---> e8ee294c8d85
Step 3/6 : RUN yum update -y 	&& yum install java-11-openjdk -y
 ---> Using cache
 ---> 8cd7779f1c90
Step 4/6 : COPY halo-1.4.17.jar /
 ---> Using cache
 ---> f89f94f151a1
Step 5/6 : EXPOSE 8090
 ---> Using cache
 ---> 60f4f91884bf
Step 6/6 : ENTRYPOINT ["nohup","java","-jar","/halo-1.4.17.jar","&"]
 ---> Running in 1da403e54f04
Removing intermediate container 1da403e54f04
 ---> 66be95a57964
Successfully built 66be95a57964
Successfully tagged halo:1.4
```

### 三、启动镜像

```shell
[root@Mir yyj]# docker run -d -p 80:8090 --name halo halo:1.4
719ff26517bac163394ce8fabe92465dd5d486d819bce46e7f7493e9beae9e4c
```

### 四、访问IP：80

**跳转到halo安装界面**

![image-20220507204748452](https://s2.loli.net/2022/05/07/IJZSaL3qEowRvK4.png)

**由于有之前的备份文件，此处演示导入备份，不再进行安装**

> **上传备份文件到主机上**

![image-20220507210922870](https://s2.loli.net/2022/05/07/COM2Dq75dW9Kb1h.png)

> **进入容器删除.halo目录**

```shell
[root@719ff26517ba ~]# rm -rf .halo
```

> **再从主机上传到容器内目标路径**

```shell 
[root@Mir ~]# docker cp /root/.halo halo:/root/
```

> **重启容器生效**

```shell
[root@Mir ~]# docker restart halo
halo
```

![image-20220507212930395](https://s2.loli.net/2022/05/07/TE2nlBoM3jHJcdY.png)

### 五、优化

**可将容器内jar包所在目录挂载到主机，以后有新版本更新时直接在主机上替换jar包并重启容器即可**

