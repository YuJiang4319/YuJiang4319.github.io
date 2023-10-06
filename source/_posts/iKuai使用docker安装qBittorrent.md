---
title: iKuai使用docker安装qBittorrent
date: 2023-09-30 16:55:38
tags:
  - Docker
  - qBittorrent
categories:	
  - Docker
  - iKuai
description: iKuai使用docker安装qBittorrent
---

#### 前言：

​	最近刚放国庆，刚好有空研究一下之前了解的PT下载。由于之前软路由使用的openwrt系统感觉不太稳定，玩游戏容易碰到断流，刚刚重新刷了ikuai的系统，用了几天确实稳定多了。但爱快的功能拓展性还是比不上openwrt，openwrt可以自行编译安装需要的插件，但爱快想要安装拓展功能插件基本上只能通过虚拟机和docker的方式安装。

​	以下记录通过docker安装qBittorrent的折腾过程。

#### 流程：

> 首先就是在 `高级应用` - `插件管理` 中安装docker插件，这步比较简单就略过

![image-20230929160730456](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20230929160730456.png)

> 然后给docker和pt下载内容各创建一个磁盘分区并挂载

![img](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/fd0adb151eb999ad31dfb5dcacb96303.png)

> 回到docker，点击 `服务设置` ,配置docker存储目录为刚刚挂载的目录，镜像库最好配置，否则下载镜像很慢

![image-20230929163057081](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20230929163057081.png)

> 然后点击 `镜像管理` - `添加` , `引用下载` 就是选择已经下载好的镜像上传， `镜像库下载` 就是在线拉取镜像，这里我们选择 `镜像库下载` ，搜索 `qBittorrent` ，选择最多人下载的这个 `linuxserver/qbittorrent`

![img](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/45691ebd868362d5fb1d96a3bafccfeb.png)

> 进入 `接口管理` 添加网络接口，

- 接口名称随意取
- IPv4地址一定要填跟当前局域网不同网段的，当时就因为这里搞错被折磨了一天
- IPv4网关一般设置为该网段的 `.1` 或 `.254` ，个人习惯设置 `.1`

![image-20230929163803196](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20230929163803196.png)

> 在 `文件管理` 中创建`docker/qBittorrent/config` 和 `/ptdownload/downloads` 文件夹，用于后续分别映射容器内 `/config` 和 `/downloads` 文件夹

![image-20230929170821708](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20230929170821708.png)

![image-20230929170834102](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20230929170834102.png)

> 回到docker页面，点击添加容器

- 容器名称随意取
- 容器占用内存较少，这里先分配512M
- 镜像文件选择刚刚下载的
- 网络接口选择之前创建的
- IPv4地址最好填为静态地址，注意跟所选网络接口同一网段
- 挂载目录：之前创建的两个文件夹分别映射容器内 `/config` 和 `/downloads` 文件夹

![image-20230929171025289](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20230929171025289.png)

> 创建完成后点击启动，然后在浏览器地址栏输入 `容器IP:8080` 进入web控制页面

- 默认用户名：`admin`
- 默认密码：`adminadmin`

![image-20230929171625195](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20230929171625195.png)

> 成功进入后台，在设置里调成中文，现在还需要做端口映射的配置才能正常使用

![image-20230929172058155](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20230929172058155.png)

> 首先勾选 `使用路由器的upnp功能`，然后修改下方端口号，这里就修改为49203，听说很多pt站会屏蔽默认6881端口，导致下载没速度

![image-20231007010111139](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20231007010111139.png)

> 然后进入 `WEB UI` 选项栏，同样勾选开启 `upnp`

![image-20231007002639052](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20231007002639052.png)

> 然后回到爱快的 `网络设置` - `端口映射` 下，添加以下映射规则

- 内网地址填qbittorrent容器地址
- 内网端口填刚刚修改的端口号
- 协议选 `TCP+UDP` 
- 类型选择外网接口
- 外网地址就选 `WAN`口
- 外网端口可以不与内网端口相同，但最好选择1024以后的端口，防止冲突，这里就简单设置跟内网端口一致
- 允许访问IP：设置哪些IP可以去访问映射规则，不填写代表内网所有IP可以访问

![image-20231007011451663](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20231007011451663.png)

映射规则可能会延迟生效，一段时间后仍未生效可以尝试重启容器或者爱快

#### Tips：

> 以下tips来自网络，仅供参考，个人并未采用以下配置

​	一般都是用qbittorrent来下载pt站的资源，如果要下载普通BT资源的话需要手动添加tracker服务器，不然大概率下资源会没速度，方法是点开设置，在bittorrent选项卡，下拉到最下面有一个“自动添加以下tracker 到新的torrent”选项，勾选上，然后将在网上找到的tracker服务器地址粘贴到下面的文本框内，保存即可

![img](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/087a671cda202a02d9067f72746102e9.png)

​	还有一些优化条目可以设置下，打开设置，切换到 `web ui` 选项卡，如图示找到“启用Host header属性验证”选项卡，取消勾选，防止通过公网无法访问管理页面

![img](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/cd02db0b537c395d2ad28382fb150ac8.png)

​	再切换到“高级”选项卡，找到“验证HTTPS tracker证书”选项，将其取消勾选，防止BT下载没速度

![img](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/6ba0149852fb6f5bb5bc99a416af156f.png)

