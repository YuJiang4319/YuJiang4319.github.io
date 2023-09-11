---
title: Docker笔记
date: 2023-08-08 19:51:38
tags:
  - Docker
categories:	
  - Docker
description: Docker基础
---

# Docker笔记

> **docker学习大纲**

- **docker概述**
- **docker安装**
- **docker命令**
  - **镜像命令**
  - **容器命令**
  - **操作命令**
  - **...**
- **docker镜像**
- **容器数据卷**
- **dockerfile**
- **docker网络原理**
- **IDEA整合docker**
- **docker compose**
- **docker swarm**

## Docker概述

### docker为什么出现？

一款产品：开发到上线，是两套环境

开发... 运维。问题：现在在我的电脑上可以运行，而版本更新，导致服务不可用。对于运维来说很麻烦，每个机器都要部署环境（集群Redis，ES，Hadoop）

所以我们希望发布一个项目时，带上所有环境打包

传统：开发jar，运维部署

现在：开发，打包，部署一套

![image-20220318095019373](https://s2.loli.net/2022/04/30/KaOzn7RPAcHBfU2.png)

docker思想来源于集装箱

核心思想--隔离

## Docker历史

- 2010年，几个搞IT的年轻人，就在美国成立了一家公司dotCloud，做一些 pass的云计算服务，LXC 有关的容器技术
- 他们将自己的技术 (容器化技术) 命名 就是 Docker 
- Docker 刚刚诞生的时候，没有引起行业的注意， dotCloud，就活不下去
- 2013年，Docker开源
- Docker越来越多的人发现了docker的优点，火了，Docker每个月都会更新一个版本
- 2014年4月9日，Docker1.0发布
- Docker为什么这么火？十分的轻巧
- 在容器技术出来之前，我们都是使用虚拟机技术
- 虚拟机：在windows中装一个Vmware，通过这个软件我们可以虚拟出来一台或者多台电脑，笨重。
- 虚拟机也是属于虚拟化技术，Docker 容器技术，也是一种 虚拟化技术

```shell
# vm ;1inux centos原生镜像（一个电脑！） 隔离，需要开启多个虚拟机！几个G几分钟
# docker：隔离，镜像（最核心的环境 4m+jdk+mysq1）十分的小巧，运行镜像就可以,小巧,几个M或KB 秒级启动
```

> 聊聊docker

Docker是基于Go语言开发的

官网：https://www.docker.com/

文档：https://docs.docker.com/

Docker仓库：https://hub.docker.com/

## Docker能干嘛

> 之前的虚拟化技术

![image-20220318100850581](https://s2.loli.net/2022/04/30/I43o2x7XGBuM5qg.png)

- 虚拟机技术缺点：
  - 资源占用多
  - 冗余步骤多
  - 启动慢

> 容器化技术

![image-20220318101113843](https://s2.loli.net/2022/04/30/V2xIfwsm6rco9Py.png)

- docker和虚拟机比较
  - 传统虚拟机，虚拟出一套硬件，运行一个完整的操作系统，然后在这个系统上运行软件
  - 容器内的应用直接运行在宿主机的内核上，没有自己单独的内核，也没有虚拟我们的硬件，轻便
  - 每个容器间相互隔离，每个容器内都有一个自己的文件系统 ，互不影响

> DevOps(开发、运维)

**应用更快的交付部署**

- 传统运维：一堆帮助文档，安装程序
- docker：打报镜像发布测试，一键运行

**更便捷的升级和扩缩容**

- 使用docker后，部署应用就和搭积木一样
- 项目打包为一个镜像，服务器A性能瓶颈，直接一键在服务器B上运行做负载均衡

**更简单的系统运维**

- 在容器化之后，我们的开发、测试环境都是高度一致的

**更高效的计算资源利用**

- docker是内核级别的虚拟化，可以在一个物理机上运行很多的容器，极致压榨服务器性能

## Docker安装

### Docker基本组成

> docker架构图

![image-20220318102401999](https://s2.loli.net/2022/04/30/ulEQdTp3tY6HOAR.png)

**镜像(image)：**

docker镜像就好比是一个模板，可以通过这个模板来创建容器服务，如Tomcat镜像=》run=》tomcat01容器(提供服务器)，通过这个镜像可以创建多个容器(最终服务或者项目就是运行在容器中)

**容器(container)：**

- docker利用容器技术，独立运行一个或者一个组应用，通过镜像来创建
- 启动、停止、删除等基本命令
- 可以理解为一个建议的Linux系统

**仓库(repository)：**

- 存放镜像的地方
- 分为私有仓库和公有仓库
  - dockerhub、阿里云...都有容器服务器

### 安装Docker

> 环境准备

- Linux操作基础
- CentOS 7
- Xshell远程连接

> 环境查看

```shell
# 系统内核3.10以上
[root@Mir ~]# uname -r
3.10.0-1160.53.1.el7.x86_64
```

```shell
# 查看系统版本
[root@Mir etc]# cat /etc/os-release 
NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="7"
PRETTY_NAME="CentOS Linux 7 (Core)"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:centos:centos:7"
HOME_URL="https://www.centos.org/"
BUG_REPORT_URL="https://bugs.centos.org/"

CENTOS_MANTISBT_PROJECT="CentOS-7"
CENTOS_MANTISBT_PROJECT_VERSION="7"
REDHAT_SUPPORT_PRODUCT="centos"
REDHAT_SUPPORT_PRODUCT_VERSION="7"
```

> 安装

**查看官方帮助文档**

- **卸载旧版本**

```shell
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
```

- **需要的安装包**

```shell
sudo yum install -y yum-utils
```

- **设置镜像仓库**

```shell
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo # 默认为国外的，较慢
# 建议使用以下仓库(阿里云)
sudo yum-config-manager \
    --add-repo \
	http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
```

- **更新yum软件包索引**

```shell
[root@Mir etc]# yum makecache fast
```

- **安装docker**  

```shell
sudo yum install docker-ce docker-ce-cli containerd.io  # ce为社区版  ee企业版
```

- **启动docker**

```shell
systemctl start docker
```

- **使用docker version查看是否安装成功**

```shell
docker version
```

![image-20220318110211003](https://s2.loli.net/2022/04/30/duLArDq8QiaEJfk.png)

- **测试docker引擎**

```shell
sudo docker run hello-world
```

![image-20220318110549899](https://s2.loli.net/2022/04/30/1YX9oGtDpWCyTNg.png)

- **查看下载的hello-world镜像**

```shell
[root@Mir etc]# docker images
REPOSITORY    TAG       IMAGE ID       CREATED        SIZE
hello-world   latest    feb5d9fea6a5   5 months ago   13.3kB
```

- **卸载docker**

```shell
# 卸载依赖
sudo yum remove docker-ce docker-ce-cli containerd.io
# 删除资源
sudo rm -rf /var/lib/docker  # docker默认工作路径 
sudo rm -rf /var/lib/containerd
```

### 阿里云镜像加速

- **找到容器镜像服务**

![image-20220318111739605](https://s2.loli.net/2022/04/30/Mtw5UmQDFJORA9g.png)

- **配置**

```shell
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://sfvejie6.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```

- **回顾hello-world流程**

![image-20220318112222961](https://s2.loli.net/2022/04/30/Zu4IcTLJrCQe6Vh.png)

### 底层原理

**docker是怎么工作的？**

- Docker是一个Client - Server结构的系统，Docker的守护进程运行在主机上，通过socket从客户端访问
- DockerServer 接收到 Docker-Client 的指令，就会执行这个命令

![image-20220318112838931](https://s2.loli.net/2022/04/30/DG2PS78qi4FHcsO.png)

**Docker为什么比虚拟机快？**

- docker有着比虚拟机更少的抽象层
- docker利用的是宿主机的内核，VM需要的是Guest OS

![image-20220318113420867](https://s2.loli.net/2022/04/30/3aXNtSDWhbEidmY.png)

- 所以说，新建一个容器的时候，docker不需要想虚拟机一样重新加载一个操作系统内核，避免引导
- 虚拟机是加载Guest OS，分钟级别的，而docker 是利用 宿主机的操作系统，省略了这个复杂的过程，秒级

## Docker常用命令

### 帮助命令

```shell
docker version   # 显示docker版本信息
docker info		# 显示docker系统信息，包括镜像和容器的数量
docker command --help		# 帮助命令
```

- 帮助文档地址：https://docs.docker.com/reference/

### 镜像命令

- **docker images  查看所有本地主机上的镜像**

```shell
[root@Mir etc]# docker images
REPOSITORY    TAG       IMAGE ID       CREATED        SIZE
hello-world   latest    feb5d9fea6a5   5 months ago   13.3kB
# 解释
REPOSITORY	镜像的仓库源
TAG			镜像的标签
IMAGE ID	镜像的id
CREATED		镜像的创建时间
SIZE		镜像的大小
# 可选参数
  -a, --all             # 列出所有镜像
  -q, --quiet           # 只显示镜像的id

```

- **docker search 搜索镜像**

```shell
[root@Mir etc]# docker search mysql
```

![image-20220318121511354](https://s2.loli.net/2022/04/30/V4tW7CLUFdYKPkq.png)

```shell
# 可选参数
--filter=STARS=3000  # 搜索STARS大于3000的镜像
[root@Mir etc]# docker search mysql --filter=STARS=3000
NAME      DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
mysql     MySQL is a widely used, open-source relation…   12268     [OK]       
mariadb   MariaDB Server is a high performing open sou…   4718      [OK] 
```

- **docker pull** **下载镜像**

```shell
# 下载镜像  docker pull 镜像名[:tag]
[root@Mir etc]# docker pull mysql
Using default tag: latest   # 不加tag默认为latest最新版
latest: Pulling from library/mysql
72a69066d2fe: Pull complete   # 分层下载，docker image的核心，联合文件系统
93619dbc5b36: Pull complete 
99da31dd6142: Pull complete 
626033c43d70: Pull complete 
37d5d7efb64e: Pull complete 
ac563158d721: Pull complete 
d2ba16033dad: Pull complete 
688ba7d5c01a: Pull complete 
00e060b6d11d: Pull complete 
1c04857f594f: Pull complete 
4d7cfa90e6ea: Pull complete 
e0431212d27d: Pull complete 
Digest: sha256:e9027fe4d91c0153429607251656806cc784e914937271037f7738bd5b8e7709 # 签名防伪
Status: Downloaded newer image for mysql:latest
docker.io/library/mysql:latest   # 真实地址

# 上面命令等价于：
docker pull docker.io/library/mysql:lates

# 指定版本下载：
[root@Mir etc]# docker pull mysql:5.7
```

![image-20220318122304230](https://s2.loli.net/2022/04/30/cDSwCUt92QNuHEJ.png)

- 上面的Already exists体现了联合文件系统的优势，检查到不同版本镜像之间有相同文件则只下载差异部分

![image-20220318122647575](https://s2.loli.net/2022/04/30/tEwyXeVHhBC3kvr.png)

- **docker rmi删除镜像**

```shell
docker rmi -f 容器id  # 删除指定id镜像
docker rmi -f 容器id 容器id 容器id ...   # 删除多个镜像
docker rmi -f $(docker images -aq)    # 删除所有镜像             
```

### 容器命令

**说明：我们有了镜像才可以创建容器，这里我们使用centOS测试学习**

```shell
docker pull centos
```

**新建容器并启动**

```shell
docker run [args] iamge
# 参数说明
--name="Name"  	# 容器名称 如Tomcat01 Tomcat02来区分容器
-d  			# 以后台方式运行
-it				# 使用交互方式运行，进入容器查看内容
-p				# 指定容器的端口  如-p 8080：8080
	-p ip：主机端口：容器端口
	-p 主机端口：容器端口(常用)
	-p 容器端口
	容器端口(直接写，不加-p)
-P				# 随机指定端口
```

```shell
# 启动并进入容器
[root@Mir etc]# docker run -it centos /bin/bash 

# 查看容器内的centos，基础版本，很多命令不完善
[root@a39748e1c63f /]# ls
bin  dev  etc  home  lib  lib64  lost+found  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var

# 从容器中返回主机
[root@a39748e1c63f /]# exit
exit

# 
```

**列出所有运行中的容器**

```shell
[root@Mir /]# docker ps    # 列出当前正在运行的容器
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
# 参数说明
-a 		# 列出当前正在运行的容器以及历史运行过的容器
-n=?  	# 显示最近创建的容器，可指定个数
-q 		# 只显示容器的编号

[root@Mir /]# docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
[root@Mir /]# docker ps -a
CONTAINER ID   IMAGE         COMMAND       CREATED         STATUS                      PORTS     NAMES
a39748e1c63f   centos        "/bin/bash"   3 minutes ago   Exited (0) 31 seconds ago             focused_bose
97988d387bed   hello-world   "/hello"      2 hours ago     Exited (0) 2 hours ago                objective_carver
```

**退出容器**

```shell
exit 	# 直接停止容器并退出
Ctrl + P + Q	# 不停止容器并退出

[root@Mir /]# docker run -it centos /bin/bash
{Ctrl + P + Q}
[root@Mir /]# docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED          STATUS          PORTS     NAMES
bd6bf8cc4c20   centos    "/bin/bash"   45 seconds ago   Up 44 seconds             lucid_archimedes
```

**删除容器**

```shell
docker rm 容器id			# 删除指定容器，不能删除正在运行的容器，强制删除用rm -f
docker rm -f $(docker ps -aq)	# 删除所有的容器
docker ps -a -q|xargs docker rm		# 删除所有的容器
```

**启动、停止容器**

```shell
docker start 容器id		# 启动容器
docker restart 容器id		# 重启容器
docker stop 容器id		# 停止当前正在运行的容器
docker kill 容器id		# 强制停止当前容器
```

### 常用其他命令

**后台启动容器**

```shell
# docker run -d 镜像名
[root@Mir /]# docker run -d centos
# 出现问题docker ps:发现centos停止了
# 这是常见的坑:docker容器使用后台运行，就必须要有一个前台进程，docker发现没有应用，就会自动停止
# 如Nginx容器启动后，发现自己没有提供服务，就会立刻停止，就是没有程序了
```

**查看日志**

```shell
docker logs -f -t --tail n 容器id   # n是输出日志条数,f是format，t显示时间戳 
# 写一段shell脚本
docker run -d centos /bin/sh -c "while true;do echo kuangshen;sleep 1;done"
```

**查看容器中的进程信息**

```shell
# docker top 容器id
[root@Mir /]# docker top 991ab0d4e795
UID                 PID                 PPID                C                   STIME     
root                27592               27572               0                   15:27     
```

**查看镜像元数据**

```shell
# docker inspect 容器id

# 测试
[root@Mir /]# docker inspect 991ab0d4e795
[
    {
        "Id": "991ab0d4e795f0f806783a4f28a39a7e8ff8b096ee25508fe06ef2e199985aea",
        "Created": "2022-03-18T07:27:47.934060985Z",
        "Path": "/bin/bash",
        "Args": [],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 27592,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2022-03-18T07:27:48.331337114Z",
            "FinishedAt": "0001-01-01T00:00:00Z"
        },
        "Image": "sha256:5d0da3dc976460b72c77d94c8a1ad043720b0416bfc16c52c45d4847e53fadb6",
        "ResolvConfPath": "/var/lib/docker/containers/991ab0d4e795f0f806783a4f28a39a7e8ff8b096ee25508fe06ef2e199985aea/resolv.conf",
        "HostnamePath": "/var/lib/docker/containers/991ab0d4e795f0f806783a4f28a39a7e8ff8b096ee25508fe06ef2e199985aea/hostname",
        "HostsPath": "/var/lib/docker/containers/991ab0d4e795f0f806783a4f28a39a7e8ff8b096ee25508fe06ef2e199985aea/hosts",
        "LogPath": "/var/lib/docker/containers/991ab0d4e795f0f806783a4f28a39a7e8ff8b096ee25508fe06ef2e199985aea/991ab0d4e795f0f806783a4f28a39a7e8ff8b096ee25508fe06ef2e199985aea-json.log",
        "Name": "/objective_newton",
        "RestartCount": 0,
        "Driver": "overlay2",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "",
        "ExecIDs": null,
        "HostConfig": {
            "Binds": null,
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
            "NetworkMode": "default",
            "PortBindings": {},
            "RestartPolicy": {
                "Name": "no",
                "MaximumRetryCount": 0
            },
            "AutoRemove": false,
            "VolumeDriver": "",
            "VolumesFrom": null,
            "CapAdd": null,
            "CapDrop": null,
            "CgroupnsMode": "host",
            "Dns": [],
            "DnsOptions": [],
            "DnsSearch": [],
            "ExtraHosts": null,
            "GroupAdd": null,
            "IpcMode": "private",
            "Cgroup": "",
            "Links": null,
            "OomScoreAdj": 0,
            "PidMode": "",
            "Privileged": false,
            "PublishAllPorts": false,
            "ReadonlyRootfs": false,
            "SecurityOpt": null,
            "UTSMode": "",
            "UsernsMode": "",
            "ShmSize": 67108864,
            "Runtime": "runc",
            "ConsoleSize": [
                0,
                0
            ],
            "Isolation": "",
            "CpuShares": 0,
            "Memory": 0,
            "NanoCpus": 0,
            "CgroupParent": "",
            "BlkioWeight": 0,
            "BlkioWeightDevice": [],
            "BlkioDeviceReadBps": null,
            "BlkioDeviceWriteBps": null,
            "BlkioDeviceReadIOps": null,
            "BlkioDeviceWriteIOps": null,
            "CpuPeriod": 0,
            "CpuQuota": 0,
            "CpuRealtimePeriod": 0,
            "CpuRealtimeRuntime": 0,
            "CpusetCpus": "",
            "CpusetMems": "",
            "Devices": [],
            "DeviceCgroupRules": null,
            "DeviceRequests": null,
            "KernelMemory": 0,
            "KernelMemoryTCP": 0,
            "MemoryReservation": 0,
            "MemorySwap": 0,
            "MemorySwappiness": null,
            "OomKillDisable": false,
            "PidsLimit": null,
            "Ulimits": null,
            "CpuCount": 0,
            "CpuPercent": 0,
            "IOMaximumIOps": 0,
            "IOMaximumBandwidth": 0,
            "MaskedPaths": [
                "/proc/asound",
                "/proc/acpi",
                "/proc/kcore",
                "/proc/keys",
                "/proc/latency_stats",
                "/proc/timer_list",
                "/proc/timer_stats",
                "/proc/sched_debug",
                "/proc/scsi",
                "/sys/firmware"
            ],
            "ReadonlyPaths": [
                "/proc/bus",
                "/proc/fs",
                "/proc/irq",
                "/proc/sys",
                "/proc/sysrq-trigger"
            ]
        },
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/cad0d46ed7090be8999df59f077a6f200076b392eea38ed9116ae61e8415179e-init/diff:/var/lib/docker/overlay2/eed1e8983755cd5e93cc031f6f5e99e6ceffef7633ec12843746a3ce5659ef81/diff",
                "MergedDir": "/var/lib/docker/overlay2/cad0d46ed7090be8999df59f077a6f200076b392eea38ed9116ae61e8415179e/merged",
                "UpperDir": "/var/lib/docker/overlay2/cad0d46ed7090be8999df59f077a6f200076b392eea38ed9116ae61e8415179e/diff",
                "WorkDir": "/var/lib/docker/overlay2/cad0d46ed7090be8999df59f077a6f200076b392eea38ed9116ae61e8415179e/work"
            },
            "Name": "overlay2"
        },
        "Mounts": [],
        "Config": {
            "Hostname": "991ab0d4e795",
            "Domainname": "",
            "User": "",
            "AttachStdin": true,
            "AttachStdout": true,
            "AttachStderr": true,
            "Tty": true,
            "OpenStdin": true,
            "StdinOnce": true,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/bash"
            ],
            "Image": "centos",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {
                "org.label-schema.build-date": "20210915",
                "org.label-schema.license": "GPLv2",
                "org.label-schema.name": "CentOS Base Image",
                "org.label-schema.schema-version": "1.0",
                "org.label-schema.vendor": "CentOS"
            }
        },
        "NetworkSettings": {
            "Bridge": "",
            "SandboxID": "43bb1f25f964fce89a5ddb96ec138b332e04ad3b17735c3cab23b5155934430b",
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "Ports": {},
            "SandboxKey": "/var/run/docker/netns/43bb1f25f964",
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "EndpointID": "f2440671838091a3411598d0836cb22353835c6289aac1f51e46c4b092f4bb52",
            "Gateway": "172.17.0.1",
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "172.17.0.2",
            "IPPrefixLen": 16,
            "IPv6Gateway": "",
            "MacAddress": "02:42:ac:11:00:02",
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "NetworkID": "a43851655b4a108b037207aa6027242fd42d48debf90ee2a7eb6a61ab4913fe1",
                    "EndpointID": "f2440671838091a3411598d0836cb22353835c6289aac1f51e46c4b092f4bb52",
                    "Gateway": "172.17.0.1",
                    "IPAddress": "172.17.0.2",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "02:42:ac:11:00:02",
                    "DriverOpts": null
                }
            }
        }
    }
]

```

**进入当前正在运行的容器**

```shell
# 我们通常都是以后台方式运行容器，需要进入容器修改配置

# docker exec -it 容器id bashshell 
[root@Mir /]# docker exec -it 991ab0d4e795 /bin/bash
[root@991ab0d4e795 /]# ps -ef
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 07:27 pts/0    00:00:00 /bin/bash
root        16     0  0 07:51 pts/1    00:00:00 /bin/bash
root        36    16  0 07:53 pts/1    00:00:00 ps -ef

# 方式二
[root@Mir /]# docker attach 991ab0d4e795
正在执行的代码...

# docker exec    进入容器后开启一个新的终端，可以在里面操作(常用)
# docker attach  进入容器正在执行的终端，不会启动新的进程
```

**从容器内拷贝文件到主机上**

```shell
# docker cp 容器id:容器内路径 目的主机路径
# 拷贝是一个手动过程，未来我们使用 -v 卷的技术也可以实现
```

### 小结

![image-20220318163915470](https://s2.loli.net/2022/04/30/7mTA4Z5ycRPD9UW.png)

```shell
attach    	# 当前shell下attach连接指定运行镜像
build     	# 通过Dockerfile定制镜像
commit    	# 提交当前容器为新的镜像
cp        	# 从容器中拷贝指定文件或目录到宿主机中
create    	# 创建一个新的容器，同 run 但不启动容器
diff      	# 查看 docker 容器变化
events    	# 从docker服务器获取容器实时事件
exec      	# 在已存在的容器上运行命令
export    	# 导出容器的内容流作为一个 tar 归档文件【对应 import】
history   	# 展示一个镜像形成历史
images    	# 列出系统当前镜像
import    	# 从tar包中的内容创建一个新的文件系统映像【对应 export】
info      	# 显示系统相关信息
inspect   	# 查看容器详细信息
kill      	# kill 指定的容器
load      	# 从一个 tar 包中加载一个镜像【对应 save】
login     	# 注册或者登录一个 docker 源服务器
logout    	# 从当前 Docekr registry 退出
logs      	# 输出当前容器日志信息
port 		# 查看映射端口对应的容器内部源端
pause		# 暂停容器
ps			# 列出容器列表
pu11		# 从docker镜像源服务器拉取指定镜像或者库镜像
push		# 推送指定镜像或者库镜像至docker源服务器
restart		# 重启运行的容器
rm			# 移除一个或者多个容器
rmi			# 移除一个或多个镜像[无容器使用该镜像才可删除，否则需删除相关容器才能继续-f强制删除
run			# 创建一个新的容器并运行一个命令
save		# 保存一个镜像为一个 tar 包[对应 1oad]
search		# 在 docker hub 中搜索镜像
start		# 启动容器
stop		# 停止容器
tag			# 给源中镜像打标签
top			# 查看容器中运行的进程信息
unpause		# 取消暂停容器
version		# 查看 docker 版本号
wait 		# 截取容器停止时的退出状态值
```

## 练习

> Docker安装Nginx

```shell
# 1、搜索镜像 search  建议去dockerhub搜索，可以查看帮助文档
[root@Mir /]# docker search nginx
# 2、下载镜像 pull
[root@Mir /]# docker pull nginx
# 3、运行测试
[root@Mir /]# docker run -d --name nginx01 -p 3344:80 nginx
[root@Mir /]# curl localhost:3344
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
# 4、进入容器
[root@Mir /]# docker exec -it 5a9bb2449cbe /bin/bash 
root@5a9bb2449cbe:/# ls
bin   dev		   docker-entrypoint.sh  home  lib64  mnt  proc  run   srv  tmp  var
boot  docker-entrypoint.d  etc			 lib   media  opt  root  sbin  sys  usr

root@5a9bb2449cbe:/# whereis nginx
nginx: /usr/sbin/nginx /usr/lib/nginx /etc/nginx /usr/share/nginx
```

![image-20220318165438298](https://s2.loli.net/2022/04/30/vptoX6q2mxCiYOZ.png)

**思考**：

- 我们每次改动nginx配置文件，都需要进入容器内部，十分的麻烦，如果能在容器外部提供一个映射路径，达到在容器外部修改文件名，容器内部就可以自动修改？      ==》-v 数据卷技术

> Tomcat部署

```shell
# 官方使用命令
docker run --rm tomcat:9.0
# 之前-d是后台启动，停止了容器之后，容器不会被删除   docker run --rm,一般用来测试，用完关闭即自动删除
# 这里使用正常下载并启动
[root@Mir /]# docker pull tomcat
[root@Mir /]# docker run -d --name tomcat01 -p 3355:8080 tomcat

# 测试访问没有问题

# 进入容器
[root@Mir /]# docker exec -it tomcat01 /bin/bash
# 发现问题：1.Linux命令少了  2.没有webapps，阿里云镜像的原因，默认是最小的镜像，所有不必要的都剔除掉
# 仅保证最小可运行环境
```

**思考：**

- 以后要部署项目，如果每次都要进入容器十分麻烦，希望在容器外部提供一个映射路径，webapps，我们在外部部署项目，然后自动同步到内部就好了

## 可视化

- portainer(暂时先使用)

- Rancher(CI/CD再用)

**什么是portainer？**

- Docker图形化管理工具，提供一个后台面板供我们操作

```shell
# 安装并运行
[root@Mir /]# docker run -d -p 8088:9000 --restart=always -v /var/run/docker.sock:/var/run/docker.sock --privileged=true portainer/portainer
Unable to find image 'portainer/portainer:latest' locally
latest: Pulling from portainer/portainer
94cfa856b2b1: Pull complete 
49d59ee0881a: Pull complete 
a2300fd28637: Pull complete 
Digest: sha256:fb45b43738646048a0a0cc74fcee2865b69efde857e710126084ee5de9be0f3f
Status: Downloaded newer image for portainer/portainer:latest
084ecedcd13e4a2132110794e44f37a07c25303545d5dc8a443c7d5a9cbcf04c

```

- 访问测试:http://47.99.154.107:8088/

![image-20220318225405341](https://s2.loli.net/2022/04/30/hxReradGjy5lKUQ.png)

- **选择本地**

![image-20220318225442487](https://s2.loli.net/2022/04/30/4niS39JxUAqLC2Q.png)

- **进入之后的面板**

![image-20220318225626995](https://s2.loli.net/2022/04/30/7oSrcnHgVFOCQiz.png)

**平时一般不使用可视化面板，可测试玩玩**

## Docker镜像讲解

### 镜像是什么？

- 镜像是一种轻量级、可执行的独立软件包，用来打包软件运行环境和基于运行环境开发的软件，它包含运行某个软件所需的所有内容，包括代码、运行时库、环境变量和配置文件。
- 所有的应用，直接打包docker镜像，就可以直接跑起来！
- **如何得到镜像：**
  - 从远程仓库下载
  - 朋友拷贝给你
  - 自己制作一个镜像 DockerFile

### Docker镜像加载原理

> UnionFS (联合文件系统)

**我们下载镜像的时候看到的就是这个，类似于Git多次提交修改叠加**

- **UnionFS（联合文件系统）**：Union文件系统（UnionFS）是一种分层、轻量级并且高性能的文件系统，它支持对文件系统的修改作为一次提交来一层层的叠加，同时可以将不同目录挂载到同一个虚拟文件系统下(unite several directories into a single virtualfilesystem)。Union 文件系统是 Docker 镜像的基础。镜像可以通过分层来进行继承，基于基础镜像（没有父镜像）,可以制作各种具体的应用镜像。

- **特性**：一次同时加载多个文件系统，但从外面看起来，只能看到一个文件系统，联合加载会把各层文件系统聋加起来，这样最终的文件系统会包含所有底层的文件和目录

> Docker镜像加载原理

- docker的镜像实际上由一层一层的文件系统组成，这种层级的文件系统UnionFS。


- **bootfs(boot file system)**主要包含bootloader和kernel，bootloader主要是引导加载kernel，Linux刚启动时会加载bootfs文件系统，在Docker镜像的最底层是bootfs。这一层与我们典型的Linux/Unix系统是一样的, 包含boot加载器和内核。当boot加载完成之后整个内核就都在内存中了，此时内存的使用权已由bootfs转交给内核，此时系统也会卸载bootfs。

- **rootfs(root file system)**, 在bootfs之上。包含的就是典型Linux系统中的/dev, /proc, /bin, /etc等标准目录和文件。rootfs就是各种不同的操作系统发行版，比如Ubuntu，Centos等等。
  ![image-20220318231319979](https://s2.loli.net/2022/04/30/Ih8yrHcfNs6BRjO.png)

**平时我们安装进虚拟机的centos都是好几个G，为什么docker这里才200M？**

![image-20220318231644581](https://s2.loli.net/2022/04/30/Dpg6xjHtZrWEwms.png)

- 对于一个精简的OS，rootfs 可以很小，只需要包含最基本的命令，工具和程序库就可以了，因为底层直接用Host的kernel，自己只需要提供rootfs就可以了。由此可见对于不同的linux发行版, bootfs基本是一致的, rootfs会有差别,因此不同的发行版可以公用bootfs。

### 分层理解

> 分层的镜像

- 我们可以去下载一个镜像，注意观察下载的日志输出，可以看到是一层一层在下载

![image-20220318232056267](https://s2.loli.net/2022/04/30/cNHdti2URbJxKYM.png)

- **思考：为什么Docker镜像要采用这种分层的结构呢？**
  - 最大的好处，我觉得莫过于是资源共享了！比如有多个镜像都从相同的Base镜像构建而来，那么宿主机只需在磁盘上保留一份base镜像，同时内存中也只需要加载一份base镜像，这样就可以为所有的容器服务了，而且镜像的每一层都可以被共享。
  - 查看镜像分层的方式可以通过 docker image inspect 命令！

```shell
[root@Mir /]# docker image inspect redis:latest
[
    {
        "Id": "sha256:7614ae9453d1d87e740a2056257a6de7135c84037c367e1fffa92ae922784631",
        "RepoTags": [
            "redis:latest"
        ],
        "RepoDigests": [
            "redis@sha256:db485f2e245b5b3329fdc7eff4eb00f913e09d8feb9ca720788059fdc2ed8339"
        ],
        "Parent": "",
        "Comment": "",
        "Created": "2021-12-21T12:42:49.755107412Z",
        "Container": "13d25f53410417c5220c8dfe8bd49f06abdbcd69faa62a9b877de02464bb04a3",
        "ContainerConfig": {
            "Hostname": "13d25f534104",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "ExposedPorts": {
                "6379/tcp": {}
            },
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "GOSU_VERSION=1.12",
                "REDIS_VERSION=6.2.6",
                "REDIS_DOWNLOAD_URL=http://download.redis.io/releases/redis-6.2.6.tar.gz",
                "REDIS_DOWNLOAD_SHA=5b2b8b7a50111ef395bf1c1d5be11e6e167ac018125055daa8b5c2317ae131ab"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "#(nop) ",
                "CMD [\"redis-server\"]"
            ],
            "Image": "sha256:e093f59d716c95cfce82c676f099b960cc700432ab531388fcedf79932fc81ec",
            "Volumes": {
                "/data": {}
            },
            "WorkingDir": "/data",
            "Entrypoint": [
                "docker-entrypoint.sh"
            ],
            "OnBuild": null,
            "Labels": {}
        },
        "DockerVersion": "20.10.7",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "ExposedPorts": {
                "6379/tcp": {}
            },
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "GOSU_VERSION=1.12",
                "REDIS_VERSION=6.2.6",
                "REDIS_DOWNLOAD_URL=http://download.redis.io/releases/redis-6.2.6.tar.gz",
                "REDIS_DOWNLOAD_SHA=5b2b8b7a50111ef395bf1c1d5be11e6e167ac018125055daa8b5c2317ae131ab"
            ],
            "Cmd": [
                "redis-server"
            ],
            "Image": "sha256:e093f59d716c95cfce82c676f099b960cc700432ab531388fcedf79932fc81ec",
            "Volumes": {
                "/data": {}
            },
            "WorkingDir": "/data",
            "Entrypoint": [
                "docker-entrypoint.sh"
            ],
            "OnBuild": null,
            "Labels": null
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 112691373,
        "VirtualSize": 112691373,
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/c95a095ab39e35a4837e2a625227eef89ef057982a22bf40d8934bf151a7bc43/diff:/var/lib/docker/overlay2/a3f0b0dc2b2706224d8e041bf8e31ebc91ba10de042c48ccd57c41f4917c62a3/diff:/var/lib/docker/overlay2/0c1b85389227627a6c7c6a2c74b8ff98c8ca6965db91e91cf502917201c9ae45/diff:/var/lib/docker/overlay2/f0ecefb9dba28e06368057b36ff93de24ad1ce589967e0b807fe0e36d62145bc/diff:/var/lib/docker/overlay2/39f95bbd9ff98228453939b1b11c068ccaf7d7a4729da1dbb7aaa5848f1235cc/diff",
                "MergedDir": "/var/lib/docker/overlay2/734558b15eb12ff3e826efd65acc62c388776d822917d4ee275e99b26fe044ef/merged",
                "UpperDir": "/var/lib/docker/overlay2/734558b15eb12ff3e826efd65acc62c388776d822917d4ee275e99b26fe044ef/diff",
                "WorkDir": "/var/lib/docker/overlay2/734558b15eb12ff3e826efd65acc62c388776d822917d4ee275e99b26fe044ef/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:2edcec3590a4ec7f40cf0743c15d78fb39d8326bc029073b41ef9727da6c851f",
                "sha256:9b24afeb7c2f21e50a686ead025823cd2c6e9730c013ca77ad5f115c079b57cb",
                "sha256:4b8e2801e0f956a4220c32e2c8b0a590e6f9bd2420ec65453685246b82766ea1",
                "sha256:529cdb636f61e95ab91a62a51526a84fd7314d6aab0d414040796150b4522372",
                "sha256:9975392591f2777d6bf4d9919ad1b2c9afa12f9a9b4d260f45025ec3cc9b18ed",
                "sha256:8e5669d8329116b8444b9bbb1663dda568ede12d3dbcce950199b582f6e94952"
            ]
        },
        "Metadata": {
            "LastTagTime": "0001-01-01T00:00:00Z"
        }
    }
]
```

**理解**

- 所有的 Docker 镜像都起始于一个基础镜像层，当进行修改或增加新的内容时，就会在当前镜像层之上，创建新的镜像层。
- 举一个简单的例子，假如基于 Ubuntu Linux 16.04 创建一个新的镜像，这就是新镜像的第一层；如果在该镜像中添加 Python包，就会在基础镜像层之上创建第二个镜像层；如果继续添加一个安全补丁，就会创建第三个镜像层。
- 该镜像当前已经包含 3 个镜像层，如下图所示（这只是一个用于演示的很简单的例子）。

![image-20220318232632278](https://s2.loli.net/2022/04/30/SyfdM8ctTmxEohA.png)

- 在添加额外的镜像层的同时，镜像始终保持是当前所有镜像的组合，这一点很重要。下图中举了一个简单的例子，每个镜像层包含 3个文件，而镜像包含了来自两个镜像层的 6 个文件。

![image-20220318232835807](https://s2.loli.net/2022/04/30/3NDLSw84o6zqY5K.png)

- 上图中的镜像层跟之前图中的略有区别，主要目的是便于展示文件。
- 下图中展示了一个稍微复杂的三层镜像，在外部看来整个镜像只有6个文件，这是因为最上层中的文件7是文件5的一个更新版本。

![image-20220318233031758](https://s2.loli.net/2022/04/30/OYw96Chpy7iW1F4.png)

- 这种情况下，上层镜像层中的文件覆盖了底层镜像层中的文件。这样就使得文件的更新版本作为一个新镜像层添加到镜像当中。
- Docker 通过存储引擎（新版本采用快照机制）的方式来实现镜像层堆栈，并保证多镜像层对外展示为统一的文件系统。
- Linux 上可用的存储引擎有AUFS、Overlay2、Device Mapper、Btrfs以及ZFS。顾名思义，每种存储引擎都基于 Linux 中对应的文件系统或者块设备技术，并且每种存储引擎都有其独有的性能特点。
- Docker在Windows 上仅支持windowsfilter一种存储引擎，该引擎基于NTFS文件系统之上实现了分层和CoW。
- 下图展示了与系统显示相同的三层镜像。所有镜像层堆叠并合并，对外提供统一的视图。

![image-20220318233248263](https://s2.loli.net/2022/04/30/A8x64ZaXNRPQYDO.png)

> 特点

- Docker镜像都是只读的，当容器启动时，一个新的可写层被加载到镜像顶部
- 这一层就是我们通常说的容器层，容器之下的都叫镜像层

![image-20220318233806301](https://s2.loli.net/2022/04/30/xS9lPQTZWBvsdU8.png)

- 可以将操作后的容器层和原本的镜像层重新打包为新的镜像

### Commit镜像

```shell
docker commit   提交容器成为一个新的副本
#命令和git原理相似
docker commit -m="提交的描述信息" -a="作者" 容器id 目标镜像名:[TAG]
```

**实战测试：**

```shell
#1.启动一个官网下载的默认Tomcat
#2.发现这个默认的Tomcat的webapps文件夹为空，官方默认没有文件
#3.自己手动添加基本的文件(容器层操作)
#4.将我们操作过的容器通过commit提交为一个镜像，以后可以直接通过该镜像启动容器，这就是我们修改过的镜像
```

![](images/P53bFMpQqyzTW1V.png)

> 可见提交后镜像文件变大
>
> 因此我们可以通过commit保存当前容器的状态，类似于VMware的快照

## 容器数据卷

### 什么是容器数据卷？

**docker的理念回顾**
将应用和环境打包成一个镜像！
数据？如果数据都在容器中，那么我们容器删除，数据就会丢失！ 需求：数据可以持久化
MySQL,容器删了，删库跑路！  需求：MySQL数据可以存储在本地！
容器之间可以有一个数据共享的技术！Docker容器中产生的数据，同步到本地！
这就是卷技术！目录的挂载，将我们容器内的目录，挂载到Liux上面！

![image-20220427125439497](https://s2.loli.net/2022/04/30/5FT7k4O9NtEaRC1.png)

**总结：容器的持久化和同步操作，同时容器间可以绑定到同一个目录，实现数据共享**

### 使用数据卷：

> 方式一：直接使用命令来挂载  -v    （volume）

```shell
docker run -it -v 主机目录:容器内目录

# 测试
[root@Mir home]# docker run -it -v /home/test:/home centos /bin/bash

# 启动容器后可通过inspect查看容器信息    Mounts挂载
```

![image-20220427130417813](https://s2.loli.net/2022/04/30/Iu7QxwFUpXA6EGK.png)、

>  **测试文件同步**

![image-20220427130839573](https://s2.loli.net/2022/04/30/28Dnqh1xuOv9glN.png)

> 停止容器后，在宿主机修改文件，再启动容器，文件仍然同步

![image-20220427131220454](https://s2.loli.net/2022/04/30/Jv2fFUMu1CjhSXs.png)

**总结：以后只需在本地修改即可同步到容器**

### 实战：安装MySQL

思考：mysql容器如何将数据持久化存储，不能因为删除容器而导致数据丢失

```shell
# 获取镜像
[root@Mir home]# docker pull mysql:5.7
# 运行容器，需要做数据挂载
# 安装启动mysql，需要注意配置密码
# 官方命令：docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag

# 启动mysql
-d 后台运行
-p 端口映射
-v 数据卷挂载
-e 环境配置(此处为配置密码)
--name 容器名字
[root@Mir home]# docker run -d -p 3310:3306 -v /home/mysql/conf:/etc/mysql/conf.d -v /home/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 --name mysql01 mysql:5.7

# 启动成功之后，可通过sqlyog连接到服务器的3310端口，即容器内的3306端口
```

**假设将容器删除，挂载到本地的数据卷依旧没有消失，实现了容器数据持久化存储功能**

### 具名和匿名挂载

```shell
# 匿名挂载
直接：-v 容器内路径
docker run -d -P --name nginx01 -v /etc/nginx nginx

# 查看所有volume的情况
[root@Mir home]# docker volume ls
DRIVER    VOLUME NAME
local     8da5f07b8cb1cfb14c8124434cf1fda9550abcfeefa6364973ecc179ccd3dd0e
# 这种就为匿名挂载，-v只写了容器内路径，没有指定主机路径

# 具名挂载
-v 卷名：容器内路径
[root@Mir home]# docker run -d -P --name nginx02 -v juming-nginx:/etc/nginx nginx
bcc051750aa3b1cda0a6d7a442ba0d815824509e6f7c8da8e660650198f33869
[root@Mir home]# docker volume ls
DRIVER    VOLUME NAME
local     8da5f07b8cb1cfb14c8124434cf1fda9550abcfeefa6364973ecc179ccd3dd0e
local     juming-nginx

# 查看卷详细信息
[root@Mir home]# docker volume inspect juming-nginx
[
    {
        "CreatedAt": "2022-04-27T15:13:17+08:00",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/juming-nginx/_data",
        "Name": "juming-nginx",
        "Options": null,
        "Scope": "local"
    }
]
# 其中Mountpoint字段即为该卷的主机路径
```

**所有的docker容器卷在没有指定主机路径的情况下都是在  /var/lib/docker/volumes/xxx/_data**

**通过具名挂载可以方便的找到我们存储的卷，建议使用具名挂载**

```shell
# 如何确定是具名挂载，匿名挂载，还是指定路径挂载
-v 容器内路径  # 匿名挂载
-v 卷名：容器内路径  # 具名挂载
-v 主机路径：容器路径   # 指定路径挂载	
```

**拓展**

```shell
# 通过-v 容器内路径:ro或者rw 改变读写权限
ro  readonly   # 只读（指只能主机修改，容器内不能修改）
rw  readwrite  # 可读写

docker run -d -P --name nginx01 -v juming-nginx01:/etc/nginx:ro nginx
docker run -d -P --name nginx02 -v juming-nginx02:/etc/nginx:rw nginx
```

### 初识DockerFile

> 方式二：

**dockerfile就是用来构建docker镜像的构建文件，命令脚本**

**通过这个脚本可以生成镜像，每一行命令就相当于镜像的一层**

```shell
# 创建一个dockerfile文件，名字可以随机，建议Dockerfile
# 文件中的内容：指令（大写） 参数
```

![image-20220427160623309](https://s2.loli.net/2022/04/30/8pemOVWoZIkazu9.png)

```shell
[root@Mir docker_test_volume]# docker build -f /home/docker_test_volume/dockerfile -t yyj_centos:1.0 .
Sending build context to Docker daemon  2.048kB
Step 1/4 : FROM centos
 ---> 5d0da3dc9764
Step 2/4 : VOLUME ["volume01","volume02"]
 ---> Running in 44ce08c4f383
Removing intermediate container 44ce08c4f383
 ---> 03d329965265
Step 3/4 : CMD echo "---end---"
 ---> Running in d6aa40397acd
Removing intermediate container d6aa40397acd
 ---> 316ac9d6f1e1
Step 4/4 : CMD /bin/bash
 ---> Running in 4f5633291a96
Removing intermediate container 4f5633291a96
 ---> d354ecc1bde3
Successfully built d354ecc1bde3
Successfully tagged yyj_centos:1.0

[root@Mir docker_test_volume]# docker images
REPOSITORY            TAG       IMAGE ID       CREATED          SIZE
yyj_centos            1.0       d354ecc1bde3   38 seconds ago   231MB
```

**启动自己构建的镜像**

```shell
[root@Mir docker_test_volume]# docker run -it yyj_centos:1.0 /bin/bash
[root@9abd97510d87 /]# ls
bin  dev  etc  home  lib  lib64  lost+found  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var  volume01	volume02
# 后两个目录就是我们生成镜像的时候自动挂载的数据卷目录
# 由于未指定路径以及卷名，所以为匿名挂载，位于主机的默认路径下
```

![image-20220427161303025](https://s2.loli.net/2022/04/30/oCuvw3Zyedx6zF2.png)

**这种方式较为常用，通常会自己构建镜像**

**假设构建镜像时没有挂载卷，则需要手动挂载**

### 数据卷容器

**实现多MySQL同步数据**

![image-20220427170935792](https://s2.loli.net/2022/04/30/otghcKeb2TCiYQJ.png)

```shell
# 通过刚刚自己构建的镜像启动3个容器
[root@Mir ~]# docker run -it -P --name docker01 yyj_centos:1.0 /bin/bash 
[root@Mir ~]# docker run -it --name docker02 --volumes-from docker01 yyj_centos:1.0 /bin/bash
[root@Mir ~]# docker run -it --name docker03 --volumes-from docker01 yyj_centos:1.0 /bin/bash

# 测试：docker01，docker02，docker03数据同步，之间相当于拷贝的概念，即使停止或删除docker01（父容器），docker02与docker03的数据依旧不会消失
```

![image-20220428082957978](https://s2.loli.net/2022/04/30/86AZHTezgpRvysS.png)

**总结：类似根域名服务器与镜像服务器的关系**

> 实战：多个MySQL实现数据共享

```shell
[root@Mir home]# docker run -d -p 3310:3306 -v /home/mysql/conf:/etc/mysql/conf.d -v /home/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 --name mysql01 mysql:5.7

[root@Mir home]# docker run -d -p 3310:3306 -e MYSQL_ROOT_PASSWORD=123456 --name mysql02 --volumes-from mysql01 mysql:5.7
# 这个时候就可以实现mysql01与mysql02数据的同步 
```

**结论：容器之间配置信息的传递，数据卷的生命周期一直持续到没有容器使用为止，但是一旦持久化存储到本地，即-v，则本地数据不会受影响**

### DcockerFile

dockerfile是用来构建docker镜像的文件，命令参数脚本

构建步骤:

- 编写一个dockerfile文件

- docker build 构建成为一个镜像
- docker run 运行镜像
- docker push 发布镜像（DockerHub，阿里云镜像仓库）

**查看官方命令**

![image-20220428084836666](https://s2.loli.net/2022/04/30/Rgrw6U1XavqHb5K.png)

**选择一个版本进入**

![image-20220428085000490](https://s2.loli.net/2022/04/30/YRfnuxJVG92XsWw.png)

很多官方镜像都是基础包，缺少很多功能，通常需要自己构建

### DockerFile构建过程

**基础知识：**

- 每个保留关键字（指令）都必须是大写字母
- 自上而下执行
- #表示注释
- 每个指令都会创建提交一个新的镜像层

<img src="https://s2.loli.net/2022/04/30/qd8ZuaibAVF2nXw.png" alt="image-20220428085705214" style="zoom:50%;" />

- DockerFile是面向开发的，以后要发布项目，做镜像，就需要编写dockerfile文件
- Docker镜像逐渐成为企业交付的标准，很重要

- DockerFile：构建文件，定义了构建的步骤，源代码

- DockerImages：通过DockerFile构建生成的容器，最终发布和运行的产品

- Docker容器：运行镜像的服务器

### DockerFile 的指令

```shell
FROM       	# 基础镜像，一切从这里开始构建
MAINTAINER	# 镜像是谁写的，姓名+邮箱
RUN			# 镜像构建时需要运行的命令
ADD			# 添加内容，如Nginx，Tomcat
WORKDIR		# 镜像的工作目录
VOLUME		# 挂载的目录
EXPOSE		# 暴露端口配置，运行时不再需要指定端口
CMD			# 指定这个容器启动的时候要运行的命令，只有最后一个会生效，可被替代
ENTRYPOINT  # 指定这个容器启动的时候要运行的命令，可以追加命令
ONBUILD		# 当构建一个被继承DockerFile这个时候就会运行ONBUILD的指令（触发指令）
COPY		# 类似ADD，将文件拷贝到镜像中
ENV			# 构建的时候设置环境变量（如mysql设置用户名密码）
```



<img src="https://s2.loli.net/2022/04/30/KurdhzO25PCpZDE.png" alt="image-20220428090330965" style="zoom: 67%;" />

### 实战测试

**DockerHub中绝大多数镜像都是从这个基础镜像开始构建的（FROM scratch），然后配置需要的软件**

![image-20220428085000490](https://s2.loli.net/2022/04/30/YRfnuxJVG92XsWw.png)

> 创建一个自己的centOS

```shell
# 构建命令
docker build -f dockerfile文件路径 -t 镜像命名：[tag] .
```

**关于命令末尾的点号：**

在官方文档的Dockerfile reference的章节中有以下重点内容:

- 生成过程的第一件事是将整个文件构建镜像上下文（递归）发送到守护进程。
- ps:不要使用根目录 ，因为它会将硬盘驱动器的全部内容传输到 Docker 守护进程。
- 一个个指令是在Docker守护进程中运行,然后将每个指令的结果提交到新镜像,最终输出新镜像的ID，Docker守护进程会自动清理发送的构建镜像上下文。"

![asdfsf](https://s2.loli.net/2022/04/30/IhKbyfdSVPxE8rj.png)

![gsdg](https://s2.loli.net/2022/04/30/mtc2alX5yRU7oAh.png)

- 通过上述内容可以大致知道 镜像的构建是在Docker引擎(Docker守护进程)中完成的，在执行docker build命令后,本机会将Dockerfile文件所在路径下的所有文件打包上传给Docker引擎,由Docker引擎完成镜像的构建。


**结论:点号是指镜像构建时打包上传到Docker引擎中的文件的目录,而不是本机目录**

```shell
# 编写dockerfile文件
[root@Mir my_centos]# cat my_centos 
FROM centos
MAINTAINER yyj<2923979840@qq.com>

ENV MYPATH /usr/local
WORKDIR  $MYPATH   # $为取地址符

RUN yum -y install vim
RUN yum -y install net-tools

EXPOSE 80

CMD echo $MYPATH
CMD echo "----end----"
CMD /bin/bash
```

```shell
# 通过这个文件构建镜像
[root@Mir my_centos]# docker build -f my_centos -t mycentos:0.1 .
Sending build context to Docker daemon  2.048kB
Step 1/10 : FROM centos
 ---> 5d0da3dc9764
Step 2/10 : MAINTAINER yyj<2923979840@qq.com>
 ---> Running in 5cbd2002f8a9
Removing intermediate container 5cbd2002f8a9
 ---> 5cd0386cd376
Step 3/10 : ENV MYPATH /usr/local
 ---> Running in 94aee5d98fb5
Removing intermediate container 94aee5d98fb5
 ---> c15715255426
Step 4/10 : WORKDIR  $MYPATH
 ---> Running in 5a596eee5c36
Removing intermediate container 5a596eee5c36
 ---> fc70fe2060b7
Step 5/10 : RUN yum -y install vim
 ---> Running in 0a57e973d376
CentOS Linux 8 - AppStream                       24  B/s |  38  B     00:01    
Error: Failed to download metadata for repo 'appstream': Cannot prepare internal mirrorlist: No URLs in mirrorlist
The command '/bin/sh -c yum -y install vim' returned a non-zero code: 1
```

**报错原因：自2022年1月31日起，CentOS团队从官方镜像中移除CentOS 8的所有包，但软件包仍在官方镜像上保留一段时间。现在被转移到https://vault.centos.org。如需继续运行旧CentOS 8，可以在/etc/yum.repos中更新repos.d，使用vault.centos.org代替mirror.centos.org**

```shell
# 此处通过修改dockerfile解决，改为FROM centos:7
[root@Mir my_centos]# cat my_centos 
FROM centos:7
MAINTAINER yyj<2923979840@qq.com>

ENV MYPATH /usr/local
WORKDIR  $MYPATH    # $为取地址符

RUN yum -y install vim
RUN yum -y install net-tools

EXPOSE 80

CMD echo $MYPATH
CMD echo "----end----"
CMD /bin/bash
```

```shell
# 再通过这个文件构建镜像
[root@Mir my_centos]# docker build -f my_centos -t mycentos:0.1 .
Sending build context to Docker daemon  2.048kB
Step 1/10 : FROM centos:7
7: Pulling from library/centos
2d473b07cdd5: Pull complete 
Digest: sha256:9d4bcbbb213dfd745b58be38b13b996ebb5ac315fe75711bd618426a630e0987
Status: Downloaded newer image for centos:7
 ---> eeb6ee3f44bd
Step 2/10 : MAINTAINER yyj<2923979840@qq.com>
 ---> Running in e359397ad175
Removing intermediate container e359397ad175
 ---> d317476d2533
Step 3/10 : ENV MYPATH /usr/local
 ---> Running in 266d54db048b
Removing intermediate container 266d54db048b
 ---> 1095fc8e0fcc
Step 4/10 : WORKDIR  $MYPATH
 ---> Running in 7d73c31b81f0
Removing intermediate container 7d73c31b81f0
 ---> 5df1fa112612
Step 5/10 : RUN yum -y install vim
 ---> Running in 4102b98bf13c
Loaded plugins: fastestmirror, ovl
Determining fastest mirrors
 * base: mirrors.163.com
 * extras: mirrors.aliyun.com
 * updates: mirrors.163.com
Resolving Dependencies
--> Running transaction check
---> Package vim-enhanced.x86_64 2:7.4.629-8.el7_9 will be installed
--> Processing Dependency: vim-common = 2:7.4.629-8.el7_9 for package: 2:vim-enhanced-7.4.629-8.el7_9.x86_64
--> Processing Dependency: which for package: 2:vim-enhanced-7.4.629-8.el7_9.x86_64
--> Processing Dependency: perl(:MODULE_COMPAT_5.16.3) for package: 2:vim-enhanced-7.4.629-8.el7_9.x86_64
--> Processing Dependency: libperl.so()(64bit) for package: 2:vim-enhanced-7.4.629-8.el7_9.x86_64
--> Processing Dependency: libgpm.so.2()(64bit) for package: 2:vim-enhanced-7.4.629-8.el7_9.x86_64
--> Running transaction check
---> Package gpm-libs.x86_64 0:1.20.7-6.el7 will be installed
---> Package perl.x86_64 4:5.16.3-299.el7_9 will be installed
--> Processing Dependency: perl(Socket) >= 1.3 for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Scalar::Util) >= 1.10 for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl-macros for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(threads::shared) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(threads) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(constant) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Time::Local) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Time::HiRes) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Storable) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Socket) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Scalar::Util) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Pod::Simple::XHTML) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Pod::Simple::Search) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Getopt::Long) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Filter::Util::Call) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(File::Temp) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(File::Spec::Unix) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(File::Spec::Functions) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(File::Spec) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(File::Path) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Exporter) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Cwd) for package: 4:perl-5.16.3-299.el7_9.x86_64
--> Processing Dependency: perl(Carp) for package: 4:perl-5.16.3-299.el7_9.x86_64
---> Package perl-libs.x86_64 4:5.16.3-299.el7_9 will be installed
---> Package vim-common.x86_64 2:7.4.629-8.el7_9 will be installed
--> Processing Dependency: vim-filesystem for package: 2:vim-common-7.4.629-8.el7_9.x86_64
---> Package which.x86_64 0:2.20-7.el7 will be installed
--> Running transaction check
---> Package perl-Carp.noarch 0:1.26-244.el7 will be installed
---> Package perl-Exporter.noarch 0:5.68-3.el7 will be installed
---> Package perl-File-Path.noarch 0:2.09-2.el7 will be installed
---> Package perl-File-Temp.noarch 0:0.23.01-3.el7 will be installed
---> Package perl-Filter.x86_64 0:1.49-3.el7 will be installed
---> Package perl-Getopt-Long.noarch 0:2.40-3.el7 will be installed
--> Processing Dependency: perl(Pod::Usage) >= 1.14 for package: perl-Getopt-Long-2.40-3.el7.noarch
--> Processing Dependency: perl(Text::ParseWords) for package: perl-Getopt-Long-2.40-3.el7.noarch
---> Package perl-PathTools.x86_64 0:3.40-5.el7 will be installed
---> Package perl-Pod-Simple.noarch 1:3.28-4.el7 will be installed
--> Processing Dependency: perl(Pod::Escapes) >= 1.04 for package: 1:perl-Pod-Simple-3.28-4.el7.noarch
--> Processing Dependency: perl(Encode) for package: 1:perl-Pod-Simple-3.28-4.el7.noarch
---> Package perl-Scalar-List-Utils.x86_64 0:1.27-248.el7 will be installed
---> Package perl-Socket.x86_64 0:2.010-5.el7 will be installed
---> Package perl-Storable.x86_64 0:2.45-3.el7 will be installed
---> Package perl-Time-HiRes.x86_64 4:1.9725-3.el7 will be installed
---> Package perl-Time-Local.noarch 0:1.2300-2.el7 will be installed
---> Package perl-constant.noarch 0:1.27-2.el7 will be installed
---> Package perl-macros.x86_64 4:5.16.3-299.el7_9 will be installed
---> Package perl-threads.x86_64 0:1.87-4.el7 will be installed
---> Package perl-threads-shared.x86_64 0:1.43-6.el7 will be installed
---> Package vim-filesystem.x86_64 2:7.4.629-8.el7_9 will be installed
--> Running transaction check
---> Package perl-Encode.x86_64 0:2.51-7.el7 will be installed
---> Package perl-Pod-Escapes.noarch 1:1.04-299.el7_9 will be installed
---> Package perl-Pod-Usage.noarch 0:1.63-3.el7 will be installed
--> Processing Dependency: perl(Pod::Text) >= 3.15 for package: perl-Pod-Usage-1.63-3.el7.noarch
--> Processing Dependency: perl-Pod-Perldoc for package: perl-Pod-Usage-1.63-3.el7.noarch
---> Package perl-Text-ParseWords.noarch 0:3.29-4.el7 will be installed
--> Running transaction check
---> Package perl-Pod-Perldoc.noarch 0:3.20-4.el7 will be installed
--> Processing Dependency: perl(parent) for package: perl-Pod-Perldoc-3.20-4.el7.noarch
--> Processing Dependency: perl(HTTP::Tiny) for package: perl-Pod-Perldoc-3.20-4.el7.noarch
--> Processing Dependency: groff-base for package: perl-Pod-Perldoc-3.20-4.el7.noarch
---> Package perl-podlators.noarch 0:2.5.1-3.el7 will be installed
--> Running transaction check
---> Package groff-base.x86_64 0:1.22.2-8.el7 will be installed
---> Package perl-HTTP-Tiny.noarch 0:0.033-3.el7 will be installed
---> Package perl-parent.noarch 1:0.225-244.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                    Arch       Version                Repository   Size
================================================================================
Installing:
 vim-enhanced               x86_64     2:7.4.629-8.el7_9      updates     1.1 M
Installing for dependencies:
 gpm-libs                   x86_64     1.20.7-6.el7           base         32 k
 groff-base                 x86_64     1.22.2-8.el7           base        942 k
 perl                       x86_64     4:5.16.3-299.el7_9     updates     8.0 M
 perl-Carp                  noarch     1.26-244.el7           base         19 k
 perl-Encode                x86_64     2.51-7.el7             base        1.5 M
 perl-Exporter              noarch     5.68-3.el7             base         28 k
 perl-File-Path             noarch     2.09-2.el7             base         26 k
 perl-File-Temp             noarch     0.23.01-3.el7          base         56 k
 perl-Filter                x86_64     1.49-3.el7             base         76 k
 perl-Getopt-Long           noarch     2.40-3.el7             base         56 k
 perl-HTTP-Tiny             noarch     0.033-3.el7            base         38 k
 perl-PathTools             x86_64     3.40-5.el7             base         82 k
 perl-Pod-Escapes           noarch     1:1.04-299.el7_9       updates      52 k
 perl-Pod-Perldoc           noarch     3.20-4.el7             base         87 k
 perl-Pod-Simple            noarch     1:3.28-4.el7           base        216 k
 perl-Pod-Usage             noarch     1.63-3.el7             base         27 k
 perl-Scalar-List-Utils     x86_64     1.27-248.el7           base         36 k
 perl-Socket                x86_64     2.010-5.el7            base         49 k
 perl-Storable              x86_64     2.45-3.el7             base         77 k
 perl-Text-ParseWords       noarch     3.29-4.el7             base         14 k
 perl-Time-HiRes            x86_64     4:1.9725-3.el7         base         45 k
 perl-Time-Local            noarch     1.2300-2.el7           base         24 k
 perl-constant              noarch     1.27-2.el7             base         19 k
 perl-libs                  x86_64     4:5.16.3-299.el7_9     updates     690 k
 perl-macros                x86_64     4:5.16.3-299.el7_9     updates      44 k
 perl-parent                noarch     1:0.225-244.el7        base         12 k
 perl-podlators             noarch     2.5.1-3.el7            base        112 k
 perl-threads               x86_64     1.87-4.el7             base         49 k
 perl-threads-shared        x86_64     1.43-6.el7             base         39 k
 vim-common                 x86_64     2:7.4.629-8.el7_9      updates     5.9 M
 vim-filesystem             x86_64     2:7.4.629-8.el7_9      updates      11 k
 which                      x86_64     2.20-7.el7             base         41 k

Transaction Summary
================================================================================
Install  1 Package (+32 Dependent packages)

Total download size: 19 M
Installed size: 63 M
Downloading packages:
warning: /var/cache/yum/x86_64/7/base/packages/gpm-libs-1.20.7-6.el7.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY
Public key for gpm-libs-1.20.7-6.el7.x86_64.rpm is not installed
Public key for perl-5.16.3-299.el7_9.x86_64.rpm is not installed
--------------------------------------------------------------------------------
Total                                              7.1 MB/s |  19 MB  00:02     
Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
Importing GPG key 0xF4A80EB5:
 Userid     : "CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>"
 Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5
 Package    : centos-release-7-9.2009.0.el7.centos.x86_64 (@CentOS)
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : gpm-libs-1.20.7-6.el7.x86_64                                1/33 
  Installing : 2:vim-filesystem-7.4.629-8.el7_9.x86_64                     2/33 
  Installing : 2:vim-common-7.4.629-8.el7_9.x86_64                         3/33 
  Installing : which-2.20-7.el7.x86_64                                     4/33 
install-info: No such file or directory for /usr/share/info/which.info.gz
  Installing : groff-base-1.22.2-8.el7.x86_64                              5/33 
  Installing : 1:perl-parent-0.225-244.el7.noarch                          6/33 
  Installing : perl-HTTP-Tiny-0.033-3.el7.noarch                           7/33 
  Installing : perl-podlators-2.5.1-3.el7.noarch                           8/33 
  Installing : perl-Pod-Perldoc-3.20-4.el7.noarch                          9/33 
  Installing : 1:perl-Pod-Escapes-1.04-299.el7_9.noarch                   10/33 
  Installing : perl-Encode-2.51-7.el7.x86_64                              11/33 
  Installing : perl-Text-ParseWords-3.29-4.el7.noarch                     12/33 
  Installing : perl-Pod-Usage-1.63-3.el7.noarch                           13/33 
  Installing : 4:perl-macros-5.16.3-299.el7_9.x86_64                      14/33 
  Installing : perl-Storable-2.45-3.el7.x86_64                            15/33 
  Installing : perl-Exporter-5.68-3.el7.noarch                            16/33 
  Installing : perl-constant-1.27-2.el7.noarch                            17/33 
  Installing : perl-Socket-2.010-5.el7.x86_64                             18/33 
  Installing : perl-Time-Local-1.2300-2.el7.noarch                        19/33 
  Installing : perl-Carp-1.26-244.el7.noarch                              20/33 
  Installing : perl-PathTools-3.40-5.el7.x86_64                           21/33 
  Installing : perl-Scalar-List-Utils-1.27-248.el7.x86_64                 22/33 
  Installing : 1:perl-Pod-Simple-3.28-4.el7.noarch                        23/33 
  Installing : perl-File-Temp-0.23.01-3.el7.noarch                        24/33 
  Installing : perl-File-Path-2.09-2.el7.noarch                           25/33 
  Installing : perl-threads-shared-1.43-6.el7.x86_64                      26/33 
  Installing : perl-threads-1.87-4.el7.x86_64                             27/33 
  Installing : 4:perl-Time-HiRes-1.9725-3.el7.x86_64                      28/33 
  Installing : perl-Filter-1.49-3.el7.x86_64                              29/33 
  Installing : 4:perl-libs-5.16.3-299.el7_9.x86_64                        30/33 
  Installing : perl-Getopt-Long-2.40-3.el7.noarch                         31/33 
  Installing : 4:perl-5.16.3-299.el7_9.x86_64                             32/33 
  Installing : 2:vim-enhanced-7.4.629-8.el7_9.x86_64                      33/33 
  Verifying  : perl-HTTP-Tiny-0.033-3.el7.noarch                           1/33 
  Verifying  : perl-threads-shared-1.43-6.el7.x86_64                       2/33 
  Verifying  : perl-Storable-2.45-3.el7.x86_64                             3/33 
  Verifying  : groff-base-1.22.2-8.el7.x86_64                              4/33 
  Verifying  : perl-Exporter-5.68-3.el7.noarch                             5/33 
  Verifying  : perl-constant-1.27-2.el7.noarch                             6/33 
  Verifying  : perl-PathTools-3.40-5.el7.x86_64                            7/33 
  Verifying  : 4:perl-macros-5.16.3-299.el7_9.x86_64                       8/33 
  Verifying  : 2:vim-enhanced-7.4.629-8.el7_9.x86_64                       9/33 
  Verifying  : 1:perl-parent-0.225-244.el7.noarch                         10/33 
  Verifying  : perl-Socket-2.010-5.el7.x86_64                             11/33 
  Verifying  : which-2.20-7.el7.x86_64                                    12/33 
  Verifying  : 2:vim-filesystem-7.4.629-8.el7_9.x86_64                    13/33 
  Verifying  : perl-File-Temp-0.23.01-3.el7.noarch                        14/33 
  Verifying  : 1:perl-Pod-Simple-3.28-4.el7.noarch                        15/33 
  Verifying  : perl-Time-Local-1.2300-2.el7.noarch                        16/33 
  Verifying  : 1:perl-Pod-Escapes-1.04-299.el7_9.noarch                   17/33 
  Verifying  : perl-Carp-1.26-244.el7.noarch                              18/33 
  Verifying  : 2:vim-common-7.4.629-8.el7_9.x86_64                        19/33 
  Verifying  : perl-Scalar-List-Utils-1.27-248.el7.x86_64                 20/33 
  Verifying  : perl-Pod-Usage-1.63-3.el7.noarch                           21/33 
  Verifying  : perl-Encode-2.51-7.el7.x86_64                              22/33 
  Verifying  : perl-Pod-Perldoc-3.20-4.el7.noarch                         23/33 
  Verifying  : perl-podlators-2.5.1-3.el7.noarch                          24/33 
  Verifying  : 4:perl-5.16.3-299.el7_9.x86_64                             25/33 
  Verifying  : perl-File-Path-2.09-2.el7.noarch                           26/33 
  Verifying  : perl-threads-1.87-4.el7.x86_64                             27/33 
  Verifying  : 4:perl-Time-HiRes-1.9725-3.el7.x86_64                      28/33 
  Verifying  : gpm-libs-1.20.7-6.el7.x86_64                               29/33 
  Verifying  : perl-Filter-1.49-3.el7.x86_64                              30/33 
  Verifying  : perl-Getopt-Long-2.40-3.el7.noarch                         31/33 
  Verifying  : perl-Text-ParseWords-3.29-4.el7.noarch                     32/33 
  Verifying  : 4:perl-libs-5.16.3-299.el7_9.x86_64                        33/33 

Installed:
  vim-enhanced.x86_64 2:7.4.629-8.el7_9                                         

Dependency Installed:
  gpm-libs.x86_64 0:1.20.7-6.el7                                                
  groff-base.x86_64 0:1.22.2-8.el7                                              
  perl.x86_64 4:5.16.3-299.el7_9                                                
  perl-Carp.noarch 0:1.26-244.el7                                               
  perl-Encode.x86_64 0:2.51-7.el7                                               
  perl-Exporter.noarch 0:5.68-3.el7                                             
  perl-File-Path.noarch 0:2.09-2.el7                                            
  perl-File-Temp.noarch 0:0.23.01-3.el7                                         
  perl-Filter.x86_64 0:1.49-3.el7                                               
  perl-Getopt-Long.noarch 0:2.40-3.el7                                          
  perl-HTTP-Tiny.noarch 0:0.033-3.el7                                           
  perl-PathTools.x86_64 0:3.40-5.el7                                            
  perl-Pod-Escapes.noarch 1:1.04-299.el7_9                                      
  perl-Pod-Perldoc.noarch 0:3.20-4.el7                                          
  perl-Pod-Simple.noarch 1:3.28-4.el7                                           
  perl-Pod-Usage.noarch 0:1.63-3.el7                                            
  perl-Scalar-List-Utils.x86_64 0:1.27-248.el7                                  
  perl-Socket.x86_64 0:2.010-5.el7                                              
  perl-Storable.x86_64 0:2.45-3.el7                                             
  perl-Text-ParseWords.noarch 0:3.29-4.el7                                      
  perl-Time-HiRes.x86_64 4:1.9725-3.el7                                         
  perl-Time-Local.noarch 0:1.2300-2.el7                                         
  perl-constant.noarch 0:1.27-2.el7                                             
  perl-libs.x86_64 4:5.16.3-299.el7_9                                           
  perl-macros.x86_64 4:5.16.3-299.el7_9                                         
  perl-parent.noarch 1:0.225-244.el7                                            
  perl-podlators.noarch 0:2.5.1-3.el7                                           
  perl-threads.x86_64 0:1.87-4.el7                                              
  perl-threads-shared.x86_64 0:1.43-6.el7                                       
  vim-common.x86_64 2:7.4.629-8.el7_9                                           
  vim-filesystem.x86_64 2:7.4.629-8.el7_9                                       
  which.x86_64 0:2.20-7.el7                                                     

Complete!
Removing intermediate container 4102b98bf13c
 ---> 425490aa8811
Step 6/10 : RUN yum -y install net-tools
 ---> Running in 576eec6342ad
Loaded plugins: fastestmirror, ovl
Loading mirror speeds from cached hostfile
 * base: mirrors.163.com
 * extras: mirrors.aliyun.com
 * updates: mirrors.163.com
Resolving Dependencies
--> Running transaction check
---> Package net-tools.x86_64 0:2.0-0.25.20131004git.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package         Arch         Version                          Repository  Size
================================================================================
Installing:
 net-tools       x86_64       2.0-0.25.20131004git.el7         base       306 k

Transaction Summary
================================================================================
Install  1 Package

Total download size: 306 k
Installed size: 917 k
Downloading packages:
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : net-tools-2.0-0.25.20131004git.el7.x86_64                    1/1 
  Verifying  : net-tools-2.0-0.25.20131004git.el7.x86_64                    1/1 

Installed:
  net-tools.x86_64 0:2.0-0.25.20131004git.el7                                   

Complete!
Removing intermediate container 576eec6342ad
 ---> 0a7e55b7cdb7
Step 7/10 : EXPOSE 80
 ---> Running in 2e7562bdfbcd
Removing intermediate container 2e7562bdfbcd
 ---> b1e9992c5048
Step 8/10 : CMD echo $MYPATH
 ---> Running in 125df13aa2d8
Removing intermediate container 125df13aa2d8
 ---> 7fc83e76f7b2
Step 9/10 : CMD echo "----end----"
 ---> Running in f085e3da24f8
Removing intermediate container f085e3da24f8
 ---> bed5d18a5f8e
Step 10/10 : CMD /bin/bash
 ---> Running in d33ad39fe30e
Removing intermediate container d33ad39fe30e
 ---> 97891acdbe87
Successfully built 97891acdbe87
Successfully tagged mycentos:0.1
```

**前后对比**

```shell
# 官方原始的centos7，命令不全，比如缺少vim,ifconfig，并且默认工作目录为/
[root@Mir my_centos]# docker run -it --name centos7-origin centos:7 /bin/bash
[root@0535f28b7b63 /]# ifconfig
bash: ifconfig: command not found
[root@0535f28b7b63 /]# vim
bash: vim: command not found
[root@0535f28b7b63 /]# pwd
/
```

```shell
# 我们在官方原始的centos7基础上构建的镜像，新添了vim和ifconfig命令
[root@Mir my_centos]# docker run -it --name centos7-advanced mycentos:0.1 /bin/bash
[root@ae0fb902150a local]# vim
[root@ae0fb902150a local]# ifconfig
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.17.0.6  netmask 255.255.0.0  broadcast 172.17.255.255
        ether 02:42:ac:11:00:06  txqueuelen 0  (Ethernet)
        RX packets 8  bytes 656 (656.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
# 进入容器后的默认工作目录也根据dockerfile中WORKDIR指定        
[root@ae0fb902150a local]# pwd
/usr/local
```

**可以通过history命令列出镜像变更历史记录**

```shell
[root@Mir my_centos]# docker history 97891acdbe87 
```

![image-20220428121611337](https://s2.loli.net/2022/04/30/gjdXBm1ZCHavnQS.png)

**平时拿到镜像，可以研究一下别人是怎么做的**

> CMD和ENTRYPOINT 区别

```shell
CMD			# 指定这个容器启动的时候要运行的命令，只有最后一个会生效，可被替代
ENTRYPOINT  # 指定这个容器启动的时候要运行的命令，可以追加命令
```

**测试CMD**

```shell
[root@Mir my_centos]# cat cmdtest 
FROM centos:7
CMD ["ls","-a"]

[root@Mir my_centos]# docker build -f cmdtest -t cmd_test .
Sending build context to Docker daemon  15.87kB
Step 1/2 : FROM centos:7
 ---> eeb6ee3f44bd
Step 2/2 : CMD ["ls","-a"]
 ---> Running in 8cc6ba3887e1
Removing intermediate container 8cc6ba3887e1
 ---> 9dc37965152d
Successfully built 9dc37965152d
Successfully tagged cmd_test:latest
# 启动容器时会自动执行CMD中的命令：ls -a
[root@Mir my_centos]# docker run cmd_test:latest
.
..
.dockerenv
anaconda-post.log
bin
dev
etc
home
lib
lib64
media
mnt
opt
proc
root
run
sbin
srv
sys
tmp
usr
var
# 假如想启动时追加参数
[root@Mir my_centos]# docker run cmd_test:latest -l
docker: Error response from daemon: failed to create shim: OCI runtime create failed: container_linux.go:380: starting container process caused: exec: "-l": executable file not found in $PATH: unknown.
ERRO[0000] error waiting for container: context canceled 
# CMD的清理下 -l 替换了CMD ["ls","-a"]命令，而单独的-l不是命令所以报错
# 在这种情况下要使用完整命令，如：
[root@Mir my_centos]# docker run cmd_test:latest ls -al
total 64
drwxr-xr-x   1 root root  4096 Apr 28 04:35 .
drwxr-xr-x   1 root root  4096 Apr 28 04:35 ..
-rwxr-xr-x   1 root root     0 Apr 28 04:35 .dockerenv
-rw-r--r--   1 root root 12114 Nov 13  2020 anaconda-post.log
lrwxrwxrwx   1 root root     7 Nov 13  2020 bin -> usr/bin
drwxr-xr-x   5 root root   340 Apr 28 04:35 dev
drwxr-xr-x   1 root root  4096 Apr 28 04:35 etc
drwxr-xr-x   2 root root  4096 Apr 11  2018 home
lrwxrwxrwx   1 root root     7 Nov 13  2020 lib -> usr/lib
lrwxrwxrwx   1 root root     9 Nov 13  2020 lib64 -> usr/lib64
drwxr-xr-x   2 root root  4096 Apr 11  2018 media
drwxr-xr-x   2 root root  4096 Apr 11  2018 mnt
drwxr-xr-x   2 root root  4096 Apr 11  2018 opt
dr-xr-xr-x 116 root root     0 Apr 28 04:35 proc
dr-xr-x---   2 root root  4096 Nov 13  2020 root
drwxr-xr-x  11 root root  4096 Nov 13  2020 run
lrwxrwxrwx   1 root root     8 Nov 13  2020 sbin -> usr/sbin
drwxr-xr-x   2 root root  4096 Apr 11  2018 srv
dr-xr-xr-x  13 root root     0 Mar 18 07:51 sys
drwxrwxrwt   7 root root  4096 Nov 13  2020 tmp
drwxr-xr-x  13 root root  4096 Nov 13  2020 usr
drwxr-xr-x  18 root root  4096 Nov 13  2020 var
```

**测试ENTRYPOINT**

```shell
[root@Mir my_centos]# cat entrypointtest 
FROM centos:7
ENTRYPOINT ["ls","-a"]

[root@Mir my_centos]# docker build -f entrypointtest -t entrypoint_test .
Sending build context to Docker daemon   16.9kB
Step 1/2 : FROM centos:7
 ---> eeb6ee3f44bd
Step 2/2 : ENTRYPOINT ["ls","-a"]
 ---> Running in e8f917138e2f
Removing intermediate container e8f917138e2f
 ---> 969122ab5918
Successfully built 969122ab5918
Successfully tagged entrypoint_test:latest
# 启动时直接追加参数，可以正常执行，不会替换原命令
[root@Mir my_centos]# docker run entrypoint_test:latest -l
total 64
drwxr-xr-x   1 root root  4096 Apr 28 04:38 .
drwxr-xr-x   1 root root  4096 Apr 28 04:38 ..
-rwxr-xr-x   1 root root     0 Apr 28 04:38 .dockerenv
-rw-r--r--   1 root root 12114 Nov 13  2020 anaconda-post.log
lrwxrwxrwx   1 root root     7 Nov 13  2020 bin -> usr/bin
drwxr-xr-x   5 root root   340 Apr 28 04:38 dev
drwxr-xr-x   1 root root  4096 Apr 28 04:38 etc
drwxr-xr-x   2 root root  4096 Apr 11  2018 home
lrwxrwxrwx   1 root root     7 Nov 13  2020 lib -> usr/lib
lrwxrwxrwx   1 root root     9 Nov 13  2020 lib64 -> usr/lib64
drwxr-xr-x   2 root root  4096 Apr 11  2018 media
drwxr-xr-x   2 root root  4096 Apr 11  2018 mnt
drwxr-xr-x   2 root root  4096 Apr 11  2018 opt
dr-xr-xr-x 119 root root     0 Apr 28 04:38 proc
dr-xr-x---   2 root root  4096 Nov 13  2020 root
drwxr-xr-x  11 root root  4096 Nov 13  2020 run
lrwxrwxrwx   1 root root     8 Nov 13  2020 sbin -> usr/sbin
drwxr-xr-x   2 root root  4096 Apr 11  2018 srv
dr-xr-xr-x  13 root root     0 Mar 18 07:51 sys
drwxrwxrwt   7 root root  4096 Nov 13  2020 tmp
drwxr-xr-x  13 root root  4096 Nov 13  2020 usr
drwxr-xr-x  18 root root  4096 Nov 13  2020 var
```

**DockerFile中很多相似命令，注意区分**

### 实战：Tomcat镜像

1. 准备镜像文件Tomcat的压缩包，JDK压缩包（Tomcat依赖于Java）

![image-20220428160350946](https://s2.loli.net/2022/04/30/qvn9dUADxPrhOHW.png)

2. 编写dockerfile文件 ,建议使用官方命名 **Dockerfile** ，build的时候会自动寻找这个文件，不需要  -f  指定

```shell
FROM centos:7
MAINTAINER yyj<2923979840@qq.com>

COPY readme.txt /usr/local/readme.txt

ADD jdk-8u181-linux-x64.tar.gz /usr/local/
ADD apache-tomcat-9.0.62.tar.gz /usr/local

RUN yum -y install vim

ENV MYPATH /usr/local
WORKDIR $MYPATH

ENV JAVA_HOME /usr/local/jdk1.8.0_181
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV CATALINA_HOME /usr/local/apache-tomcat-9.0.62
ENV CATALINA_BASE /usr/local/apache-tomcat-9.0.62
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin

EXPOSE 8080

CMD /usr/local/apache-tomcat-9.0.62/bin/startup.sh && tail -F /usr/local/apache-tomcat-9.0.62/logs/catalina.out
```

​    3.构建镜像

```shell
[root@Mir DIYTomcat]# docker build -t diytomcat
```

​	4.启动镜像

```shell
[root@Mir DIYTomcat]# docker run -d -p 9090:8080 --name yyjdiytomcat -v /home/yyj/build/tomcat/test:/usr/local/apache-tomcat-9.0.62/webapps/test -v /home/yyj/build/tomcat/tomcatlogs/:/usr/local/apache-tomcat-9.0.62/logs diytomcat
```

​	5.访问测试

**用curl命令测试**

```shell
[root@Mir DIYTomcat]# curl localhost:9090
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Apache Tomcat/9.0.62</title>
        <link href="favicon.ico" rel="icon" type="image/x-icon" />
        <link href="tomcat.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="wrapper">
      .......<手动省略>.......     
        </div>
    </body>

</html>
```

​	**浏览器测试：47.99.154.107:9090**

![image-20220429213226746](https://s2.loli.net/2022/04/30/zuJLBmTvQRhtrA4.png)

6.发布项目（由于做了卷挂载，直接在本地编写项目发布就可以了，会自动同步到容器内）

```shell
[root@Mir test]# pwd
/home/yyj/build/tomcat/test
[root@Mir test]# ls
index.html
[root@Mir test]# cat index.html 
CTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>这是一个测试</title>
</head>
<body>
    <h1>Hello,World!</h1>
    <p>Hello,Tomcat!</p>
</body>
</html>
```

**访问  47.99.154.107：9090/test**

<img src="https://s2.loli.net/2022/04/30/NZ9xStihB32fr8R.png" alt="image-20220429220734296" style="zoom: 50%;" />

**由于默认页面在 tomcat\webapps\ROOT目录下，自建项目为tomcat\webapps\test，访问时需要加上/test**

### 发布自己的镜像

> 发布到DockerHub

1. 地址https://hub.docker.com/注册自己的账号
2. 确定该账号可以登陆
3. 查看login命令帮助

```shell
[root@Mir tomcatlogs]# docker login --help

Usage:  docker login [OPTIONS] [SERVER]

Log in to a Docker registry.
If no server is specified, the default is defined by the daemon.

Options:
  -p, --password string   Password
      --password-stdin    Take the password from stdin
  -u, --username string   Username
```

​	4.登录

```shell
[root@Mir tomcatlogs]# docker login -u miryyj
Password: 
WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```

​	5.提交镜像，docker push

```shell
# docker tag命令
docker tag IMAGE[:TAG] [REGISTRYHOST/][USERNAME/]NAME[:TAG]
#  标记本地镜像，将其归入某一仓库
```

```shell
# 注意要push到DockerHub的镜像需要标记为：dockerhub用户名/镜像名：[tag]
[root@Mir tomcatlogs]# docker tag 5d148005ef8d miryyj/diytomcat:1.0
[root@Mir tomcatlogs]# docker images
REPOSITORY            TAG       IMAGE ID       CREATED         SIZE
diytomcat             latest    5d148005ef8d   2 hours ago     823MB
miryyj/diytomcat      1.0       5d148005ef8d   2 hours ago     823MB
[root@Mir tomcatlogs]# docker push miryyj/diytomcat:1.0
The push refers to repository [docker.io/miryyj/diytomcat]
75189d352397: Pushing  43.44MB/221.1MB
614e95fa1662: Pushed 
e10679d69db9: Pushing   25.4MB/381.7MB
9e77174fff4b: Pushed 
# 正在push，速度较慢
```

> 发布到阿里云镜像服务

1. 进入阿里云容器镜像服务，创建个人实例

![image-20220430090933116](https://s2.loli.net/2022/04/30/IdhtBJnGwePEy6v.png)

​	2.创建命名空间

![image-20220430091306626](https://s2.loli.net/2022/04/30/9rf2vlVsz4emZG8.png)

​	3.创建镜像仓库

![image-20220430091543936](https://s2.loli.net/2022/04/30/NT4zd9rMWL6Ejx7.png)

​	4.可查看基本信息以及操作指南

![image-20220430091734346](https://s2.loli.net/2022/04/30/cPIgsfFvbxD9hwd.png)

​	5.根据指南docker push

### 总结

![image-20220430092606504](https://s2.loli.net/2022/04/30/RZTsSCPFjAMqGtD.png)

## Docker网络

### 理解Docker0

> **清空所有docker环境**

```shell
# 删除所有容器
[root@Mir ~]# docker rm -f $(docker ps -aq)
# 删除所有镜像
[root@Mir ~]# docker rmi -f $(docker images -aq)
```

>  **测试**

```shell
# 用ip addr查看网络信息
[root@Mir ~]# ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo				#本地回环地止
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:16:3e:19:a4:d8 brd ff:ff:ff:ff:ff:ff
    inet 172.23.156.252/20 brd 172.23.159.255 scope global dynamic eth0      #阿里云内网地址
       valid_lft 311137399sec preferred_lft 311137399sec
    inet6 fe80::216:3eff:fe19:a4d8/64 scope link 
       valid_lft forever preferred_lft forever
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
    link/ether 02:42:e0:0d:7a:49 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0			#docker0地址
       valid_lft forever preferred_lft forever
    inet6 fe80::42:e0ff:fe0d:7a49/64 scope link 
       valid_lft forever preferred_lft forever
# 三个网络
```

> **问题：docker如何处理容器网络访问的？**

```shell
# 启动一个Tomcat容器
[root@Mir ~]# docker run -d -P --name tomcat01 tomcat
80b1c11e483acd6a7903101a0947b09b17c7924ce9ebd1a0819675d1f4ef1b09

# 进入容器并安装iproute2
[root@Mir ~]# docker exec -it tomcat01 /bin/bash
root@80b1c11e483a:/usr/local/tomcat# apt update && apt install iproute2

# 使用ip addr查看容器内网络信息
root@80b1c11e483a:/usr/local/tomcat# ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
104: eth0@if105: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:ac:11:00:02 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 172.17.0.2/16 brd 172.17.255.255 scope global eth0
       valid_lft forever preferred_lft forever
# 容器启动时会得到一个ip地址，此处为eth0@if105，由docker分配
```

> **Linux能不能ping通容器内部？**

```shell
[root@Mir ~]# ping 172.17.0.2
PING 172.17.0.2 (172.17.0.2) 56(84) bytes of data.
64 bytes from 172.17.0.2: icmp_seq=1 ttl=64 time=0.114 ms
64 bytes from 172.17.0.2: icmp_seq=2 ttl=64 time=0.053 ms
64 bytes from 172.17.0.2: icmp_seq=3 ttl=64 time=0.089 ms
# Linux可以ping通容器内部，因为都为172.17.0.xxx，属于同一网段
```

> **原理**

- 每启动一个docker容器，docker就会给容器分配一个ip，只要安装了docker，就会有一个docker0网卡，与物理网卡桥接，使用evth-pair技术

> **再次测试ip addr**

```shell
[root@Mir ~]# ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:16:3e:19:a4:d8 brd ff:ff:ff:ff:ff:ff
    inet 172.23.156.252/20 brd 172.23.159.255 scope global dynamic eth0
       valid_lft 311116488sec preferred_lft 311116488sec
    inet6 fe80::216:3eff:fe19:a4d8/64 scope link 
       valid_lft forever preferred_lft forever
3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:e0:0d:7a:49 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:e0ff:fe0d:7a49/64 scope link 
       valid_lft forever preferred_lft forever
105: vethc8ca9cf@if104: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default 
    link/ether 8e:cf:ca:0c:5d:62 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet6 fe80::8ccf:caff:fe0c:5d62/64 scope link 
       valid_lft forever preferred_lft forever
# 发现多了一对网卡，与tomcat01的对应
```

**再启动一个容器测试**

```shell
[root@Mir ~]# docker run -d -P --name tomcat02 tomcat
b32647e88051fd2b4b30d8faba47210ed21dcb0dca4eaaabe5cb50217bcd3d3f
[root@Mir ~]# ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:16:3e:19:a4:d8 brd ff:ff:ff:ff:ff:ff
    inet 172.23.156.252/20 brd 172.23.159.255 scope global dynamic eth0
       valid_lft 311116381sec preferred_lft 311116381sec
    inet6 fe80::216:3eff:fe19:a4d8/64 scope link 
       valid_lft forever preferred_lft forever
3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether 02:42:e0:0d:7a:49 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:e0ff:fe0d:7a49/64 scope link 
       valid_lft forever preferred_lft forever
105: vethc8ca9cf@if104: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default 
    link/ether 8e:cf:ca:0c:5d:62 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet6 fe80::8ccf:caff:fe0c:5d62/64 scope link 
       valid_lft forever preferred_lft forever
107: veth48ac47e@if106: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default 
    link/ether 22:db:cf:90:3f:07 brd ff:ff:ff:ff:ff:ff link-netnsid 1
    inet6 fe80::20db:cfff:fe90:3f07/64 scope link 
       valid_lft forever preferred_lft forever
# 发现又多了一对网卡，与tomcat02对应
```

- **发现创建的容器带来的网卡都是成对的**

- **evth-pair 就是一对的虚拟设备接口，都是成对出现，一端连着协议，一端彼此相连**

-  **因为这个特性，evth-pair充当一个桥梁，连接各种虚拟网络设备的**
- **OpenStac，Docker容器之间的连接，OVS的连接，都是使用evth-pair技术**

> **测试容器之间能够ping通**

```shell
# 在tomcat02(172.17.0.3)内ping  tomcat01(172.17.0.2)
root@b32647e88051:/usr/local/tomcat# ping 172.17.0.2
PING 172.17.0.2 (172.17.0.2): 56 data bytes
64 bytes from 172.17.0.2: icmp_seq=0 ttl=64 time=0.221 ms
64 bytes from 172.17.0.2: icmp_seq=1 ttl=64 time=0.067 ms
# 结论：容器与容器之间可以通信
```

> **网络模型图**

<img src="https://s2.loli.net/2022/04/30/jeLmnvsNWl2oVbr.png" alt="image-20220430155902766" style="zoom: 67%;" />

- **tomcat01和tomcat02公用一个路由器docker0**

- **所有的容器在不指定网络的情况下，都是通过docker0路由的，docker会给容器分配一个默认的可用IP**

- **由/16可知该网络地址前16位为网络地址，后16位为主机地址，一个docker可以分配大约255*255的私有ip**

> **总结**

**docker使用的是Linux的桥接，宿主机中是一个docker容器的网桥docker0**

<img src="https://s2.loli.net/2022/04/30/3HqcrPBR5o7eZ1S.png" alt="image-20220430160852542" style="zoom: 50%;" />

- **docker中所有的网络接口都是虚拟的，转发效率高，相当于内网传输**
- **只要容器删除，则对应一对网桥就被删除**

### --link

**当项目重启时，ip换掉了，希望可以通过名字来访问容器**

```shell
# 在tomcat01中直接ping tomcat02名字
root@80b1c11e483a:/usr/local/tomcat# ping tomcat02
ping: unknown host
# 发现无法ping通
```

**解决方法**

```shell
# 新建容器tomcat03，使用--link将tomcat02与tomcat网络相连
[root@Mir ~]# docker run -d -P --name tomcat03 --link tomcat02 tomcat
556e868784c4c5172a0c643a824234b8f36aa116ab1d5d1d2d24b7ad760e6945
# 发现进入容器tomcat02无法ping通tomcat03
[root@Mir ~]# docker exec -it tomcat02 /bin/bash
root@b32647e88051:/usr/local/tomcat# ping tomcat03
ping: unknown host
# 只能tomcat03 ping通tomcat02
root@556e868784c4:/usr/local/tomcat# ping tomcat02
PING tomcat02 (172.17.0.3): 56 data bytes
64 bytes from 172.17.0.3: icmp_seq=0 ttl=64 time=0.140 ms
64 bytes from 172.17.0.3: icmp_seq=1 ttl=64 time=0.122 ms
```

**引入：docker network命令**

```shell
# 查询帮助
[root@Mir ~]# docker network --help
Usage:  docker network COMMAND
Manage networks
Commands:
  connect     Connect a container to a network
  create      Create a network
  disconnect  Disconnect a container from a network
  inspect     Display detailed information on one or more networks
  ls          List networks
  prune       Remove all unused networks
  rm          Remove one or more networks
Run 'docker network COMMAND --help' for more information on a command.
# 查看网络列表
[root@Mir ~]# docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
a43851655b4a   bridge    bridge    local
20b70f348e7e   host      host      local
f9238c707f47   none      null      local
# 检查其中bridge网络的信息(猜测为docker0的信息)
[root@Mir ~]# docker network inspect a43851655b4a
[
    {
        "Name": "bridge",
        "Id": "a43851655b4a108b037207aa6027242fd42d48debf90ee2a7eb6a61ab4913fe1",
        "Created": "2022-03-18T11:19:51.362481253+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "556e868784c4c5172a0c643a824234b8f36aa116ab1d5d1d2d24b7ad760e6945": {
                "Name": "tomcat03",
                "EndpointID": "bb7009ea5d00d8f9cabfbf6aa190961a76052f2884582149984236b328d8ebfa",
                "MacAddress": "02:42:ac:11:00:04",
                "IPv4Address": "172.17.0.4/16",
                "IPv6Address": ""
            },
            "80b1c11e483acd6a7903101a0947b09b17c7924ce9ebd1a0819675d1f4ef1b09": {
                "Name": "tomcat01",
                "EndpointID": "c99fff49f0aa35b42e31840fee370ecabdf8d48f4f3492047f4a9cb8b05a793a",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            },
            "b32647e88051fd2b4b30d8faba47210ed21dcb0dca4eaaabe5cb50217bcd3d3f": {
                "Name": "tomcat02",
                "EndpointID": "57e42eb233165b72c3ce3672e8b0ad274bcb63d8816be961110db97598cfd6af",
                "MacAddress": "02:42:ac:11:00:03",
                "IPv4Address": "172.17.0.3/16",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.bridge.default_bridge": "true",
            "com.docker.network.bridge.enable_icc": "true",
            "com.docker.network.bridge.enable_ip_masquerade": "true",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
            "com.docker.network.bridge.name": "docker0",
            "com.docker.network.driver.mtu": "1500"
        },
        "Labels": {}
    }
]
```

**其实tomcat03就是在其容器内部配置了tomcat02的信息**

```shell
# 查看tomcat03的hosts配置
root@556e868784c4:/usr/local/tomcat# cat /etc/hosts
127.0.0.1	localhost
::1	localhost ip6-localhost ip6-loopback
fe00::0	ip6-localnet
ff00::0	ip6-mcastprefix
ff02::1	ip6-allnodes
ff02::2	ip6-allrouters
172.17.0.3	tomcat02 b32647e88051   # 发现这里添加了tomcat02的ip地址
172.17.0.4	556e868784c4
```

**但是现在已经不建议使用--link了，我们需要的是自定义网络，不使用docker0**

**docker0的问题：不支持容器名连接访问**

### 自定义网络

> **查看所有docker网络**

```shell
[root@Mir ~]# docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
a43851655b4a   bridge    bridge    local
20b70f348e7e   host      host      local
f9238c707f47   none      null      local
```

**网络模式**

- bridge（默认）：桥接，在docker上搭桥
- none：不配置网络
- host：和宿主机共享网络
- container：容器网络互通（用得少，局限性大）

**测试**

```shell
# 清空docker网络环境，删除所有容器
[root@Mir ~]# docker rm -f $(docker ps -aq)
556e868784c4
b32647e88051
80b1c11e483a
[root@Mir ~]# ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:16:3e:19:a4:d8 brd ff:ff:ff:ff:ff:ff
    inet 172.23.156.252/20 brd 172.23.159.255 scope global dynamic eth0
       valid_lft 311110546sec preferred_lft 311110546sec
    inet6 fe80::216:3eff:fe19:a4d8/64 scope link 
       valid_lft forever preferred_lft forever
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
    link/ether 02:42:e0:0d:7a:49 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:e0ff:fe0d:7a49/64 scope link 
       valid_lft forever preferred_lft forever
```

 

```shell
# 通常直接使用第一种启动方式，实际上省略了默认的参数 --net bridge
[root@Mir ~]# docker run -d -P --name tomcat01 tomcat
[root@Mir ~]# docker run -d -P --name tomcat01 --net bridge tomcat
# docker0特点：默认网络，域名不能访问，--link可以打通各容器

# 我们可以自定义网络
# 查询docker network create命令帮助
[root@Mir ~]# docker network create --help
Usage:  docker network create [OPTIONS] NETWORK
Create a network
Options:
      --attachable           Enable manual container attachment
      --aux-address map      Auxiliary IPv4 or IPv6 addresses used by Network driver (default map[])
      --config-from string   The network from which to copy the configuration
      --config-only          Create a configuration only network
  -d, --driver string        Driver to manage the Network (default "bridge")   #网络模式
      --gateway strings      IPv4 or IPv6 Gateway for the master subnet  	#网关
      --ingress              Create swarm routing-mesh network
      --internal             Restrict external access to the network
      --ip-range strings     Allocate container ip from a sub-range
      --ipam-driver string   IP Address Management Driver (default "default")
      --ipam-opt map         Set IPAM driver specific options (default map[])
      --ipv6                 Enable IPv6 networking
      --label list           Set metadata on a network
  -o, --opt map              Set driver specific options (default map[])
      --scope string         Control the network's scope
      --subnet strings       Subnet in CIDR format that represents a network segment #子网
# 创建网络
--driver bridge     		# 网络模式为bridge
--subnet 192.168.0.0/16		# 子网，192.168.0.2~192.168.255.255
--gateway 192.168.0.1		# 网关
[root@Mir ~]# docker network create --driver bridge --subnet 192.168.0.0/16 --gateway 192.168.0.1 mynet
817b82cace2d85fd3286028801f7ef858deeba2f2c9fab6277e3e3ad0322c9ae
# 查看网络列表
[root@Mir ~]# docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
a43851655b4a   bridge    bridge    local
20b70f348e7e   host      host      local
817b82cace2d   mynet     bridge    local
f9238c707f47   none      null      local
```

**自定义网络创建完成**

```shell
[root@Mir ~]# docker network inspect mynet
[
    {
        "Name": "mynet",
        "Id": "817b82cace2d85fd3286028801f7ef858deeba2f2c9fab6277e3e3ad0322c9ae",
        "Created": "2022-04-30T17:13:11.323068667+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "192.168.0.0/16",
                    "Gateway": "192.168.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {},
        "Options": {},
        "Labels": {}
    }
]
```

**测试**

```shell
# 创建两个容器tomcat01 tomcat02
[root@Mir ~]# docker run -d -P --name tomcat01 --net mynet tomcat
51908428ba5f0e32501ae14b635db734a406aa1381a308d80dadce56719c6d17
[root@Mir ~]# docker run -d -P --name tomcat02 --net mynet tomcat
d8683b2d942029224beced57ac2a0596fe17711542c9078b8d3726da5ee119c2
# 查看mynet信息
[root@Mir ~]# docker network inspect mynet
[
    {
        "Name": "mynet",
        "Id": "817b82cace2d85fd3286028801f7ef858deeba2f2c9fab6277e3e3ad0322c9ae",
        "Created": "2022-04-30T17:13:11.323068667+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "192.168.0.0/16",
                    "Gateway": "192.168.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "51908428ba5f0e32501ae14b635db734a406aa1381a308d80dadce56719c6d17": {
                "Name": "tomcat01",
                "EndpointID": "67825ed8b4676e68b083d6129e9fcbdf6e03736cc41b4d41a64ae93a242a7e9a",
                "MacAddress": "02:42:c0:a8:00:02",
                "IPv4Address": "192.168.0.2/16",
                "IPv6Address": ""
            },
            "d8683b2d942029224beced57ac2a0596fe17711542c9078b8d3726da5ee119c2": {
                "Name": "tomcat02",
                "EndpointID": "d6ed812fd4710d63dbcd4e8f26dca93e7d0755318d544efe78198f24792804ac",
                "MacAddress": "02:42:c0:a8:00:03",
                "IPv4Address": "192.168.0.3/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {}
    }
]
# 可以直接通过容器名双向ping通
root@51908428ba5f:/usr/local/tomcat# ping tomcat02
PING tomcat02 (192.168.0.3): 56 data bytes
64 bytes from 192.168.0.3: icmp_seq=0 ttl=64 time=0.217 ms
64 bytes from 192.168.0.3: icmp_seq=1 ttl=64 time=0.081 ms

# 现在不使用--link也可以互相ping通
```

**我们自定义的网络，docker已经帮我们维护好了对应的关系，建议使用这种方式**

**好处：假如希望搭建MySQL集群或者Redis集群，可以分别搭建一个MySQL网络和Redis网络，不同的集群使用不同的网络，而网络之间是隔离的，保证集群的安全（但二者之间也可以打通）**

![image-20220430175758494](https://s2.loli.net/2022/04/30/o3kv7sARxJq6Ewe.png)

### 网络连通

**docker network connect 命令**

```shell
# 查看命令帮助
[root@Mir ~]# docker network connect --help
Usage:  docker network connect [OPTIONS] NETWORK CONTAINER
Connect a container to a network
Options:
      --alias strings           Add network-scoped alias for the container
      --driver-opt strings      driver options for the network
      --ip string               IPv4 address (e.g., 172.30.100.104)
      --ip6 string              IPv6 address (e.g., 2001:db8::33)
      --link list               Add link to another container
      --link-local-ip strings   Add a link-local address for the container
```

**此小节网络结构背景图：**

<img src="https://s2.loli.net/2022/04/30/uIhPOftKj4RXDxT.png" alt="image-20220430181630650" style="zoom:67%;" />

**测试打通tomcat03到mynet**

```shell
[root@Mir ~]# docker network connect mynet tomcat03
[root@Mir ~]# docker network inspect mynet
[
    {
        "Name": "mynet",
        "Id": "817b82cace2d85fd3286028801f7ef858deeba2f2c9fab6277e3e3ad0322c9ae",
        "Created": "2022-04-30T17:13:11.323068667+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "192.168.0.0/16",
                    "Gateway": "192.168.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "51908428ba5f0e32501ae14b635db734a406aa1381a308d80dadce56719c6d17": {
                "Name": "tomcat01",
                "EndpointID": "67825ed8b4676e68b083d6129e9fcbdf6e03736cc41b4d41a64ae93a242a7e9a",
                "MacAddress": "02:42:c0:a8:00:02",
                "IPv4Address": "192.168.0.2/16",
                "IPv6Address": ""
            },
            "64501e248789b9deb443e621c549500f1871032826ff50f994bd3ac46d909bc7": {
                "Name": "tomcat03",
                "EndpointID": "f2416e80de4c494aecbd0601d73957f1bdf0d093a2130aae68c18355288dcce6",
                "MacAddress": "02:42:c0:a8:00:04",
                "IPv4Address": "192.168.0.4/16",
                "IPv6Address": ""
            },
            "d8683b2d942029224beced57ac2a0596fe17711542c9078b8d3726da5ee119c2": {
                "Name": "tomcat02",
                "EndpointID": "d6ed812fd4710d63dbcd4e8f26dca93e7d0755318d544efe78198f24792804ac",
                "MacAddress": "02:42:c0:a8:00:03",
                "IPv4Address": "192.168.0.3/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {}
    }
]
```

**连通之后直接把tomcat03加入mynet网络，一个容器，两个IP，同时处于mynet和docker0网络下**

**测试能否直接ping通：**

```shell
[root@Mir ~]# docker exec -it tomcat01 ping tomcat03
PING tomcat03 (192.168.0.4): 56 data bytes
64 bytes from 192.168.0.4: icmp_seq=0 ttl=64 time=0.189 ms
64 bytes from 192.168.0.4: icmp_seq=1 ttl=64 time=0.083 ms
```

**总结：docker内要跨网络连接别人，就必须要使用docker network connect 连通**

### 实战：部署Redis集群

***未完待续......***

