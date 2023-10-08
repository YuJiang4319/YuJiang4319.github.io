---
title: 小米路由器青春版（R1CL）刷breed固件
date: 2023-10-02 20:55:38
tags:
  - breed
categories:	
  - Router
description: 小米路由器青春版（R1CL）刷breed固件
---

### 前言：

​		最近无意发现一款老路由器——小米路由器青春版（R1CL），支持刷第三方固件，淘宝只要20来块钱就买来折腾玩一下 。

​		到手后如图，很mini，供电为安卓口，支持充电宝供电

<img src="https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/c133e91cef37da51328316cb13b6952f_720.jpg" alt="img" style="zoom:50%;" />

​	跟一般路由器有点不同的是reset键在背面的右上角散热口

<img src="https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/dfe89ab9c8ac59f11dece39fd83aa260.jpeg" alt="img" style="zoom: 33%;" />

以下记录如何给该路由器刷 `breed` bootloader，并用breed的web页面刷入潘多拉 `Padavan` 的固件。

### 步骤：

#### 1.进入路由器管理页面

1. 路由器连接电源
2. 使用网线将电脑与路由器LAN口连接或者连接路由器WiFi
3. 在浏览器地址栏输入 `192.168.31.1` 进入路由器后台，此时能看到地址栏URL变为 `http://192.168.31.1/cgi-bin/luci/;stok=###/web/home#router`

#### 2.刷入旧版固件

​		由于新版本固件未开放SSH连接工具，所以必须刷回旧版固件利用`BUG`获取权限

​		如果系统固件版本大于2.0，则先刷入开发版固件 [miwifi_r1cl_all_59371_2.1.26.bin](http://bigota.miwifi.com/xiaoqiang/rom/r1cl/miwifi_r1cl_all_59371_2.1.26.bin)

#### 3.更改root密码

将上述URL中的 

```text
/web/home#router
```

替换为

```text
/api/xqsystem/set_name_password?oldPwd=当前路由的密码&newPwd=新的路由密码
```

然后查看网页的返回结果，如果返回的`JSON`字符串为

```json
{"code":0}
```

![image-20231006175034581](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20231006175034581.png)

则说明修改root密码成功

#### 4.启用路由器Telnet登录

以同样的方式修改网址`URL`，把

```url
/web/home#router
```

改为：

```url
/api/xqnetwork/set_wifi_ap?ssid=你的WiFi名称&encryption=NONE&enctype=NONE&channel=1%3B%2Fusr%2Fsbin%2Ftelnetd
```

然后查看返回的`JSON`数据

```json
{"msg":"未能连接到指定WiFi(Probe timeout)","code":1616}
```

![image-20231006175051540](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20231006175051540.png)

返回码有可能不同，但是这里已经可以通过`telnet`的方式来登录路由器了

#### 5.启用路由器SSH登录

使用 `finalshell` 等工具，新建连接：

- 连接类型：`telnet`；
- 主机名称：`192.168.31.1`；
- 打开后看到`login`，输入`root`，密码为刚修改后的新密码

登录后依次执行下面的三条指令

```shell
sed -i ":x;N;s/if \[.*\; then\n.*return 0\n.*fi/#tb/;b x" /etc/init.d/dropbear
/etc/init.d/dropbear start
nvram set ssh_en=1; nvram commit
```

![image-20231006175223129](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20231006175223129.png)

至此SSH已完成开启

#### 6.SSH连接路由器，备份原厂固件

1.查看固件和分区信息

```shell
cat /proc/mtd
```

![image-20231006181955236](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20231006181955236.png)

看名字可以知道第一个`mtd0`固件包含全部分区的数据（`All`），第二个是`Bootloader`

2.备份第一个固件到 `/tmp/all.bin` 

```shell
dd if=/dev/mtd0 of=/tmp/all.bin
```

![image-20231006182003854](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20231006182003854.png)

3.下载备份到本地，打开终端，将以下命令中的各部分修改为你的电脑和路由信息后，执行命令：

```shell
scp username@servername:/path/filename /tmp/local_destination
```

账号密码就是上面修改的账号密码，我的Windows电脑执行的命令为：

```shell
scp root@192.168.31.1:/tmp/all.bin C:\Users\admin\Desktop\all.bin
```

![image-20231006195944838](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20231006195944838.png)

#### 7.下载并刷入breed

1.下载breed

​		这是[Breed发布地址](http://www.right.com.cn/forum/thread-161906-1-1.html)，进入[下载地址](https://breed.hackpascal.net/)，下载[breed-mt7688-reset38.bin](https://breed.hackpascal.net/breed-mt7688-reset38.bin)和[md5sum.txt](https://breed.hackpascal.net/md5sum.txt)；下载后一定要校验`bin`文件的`MD5`值，将校验结果与`md5sum.txt`文件中对应bin文件的`MD5`值比对，如`MD5`值不符，重新下载并校验；将`breed-mt7688-reset38.bin`改名为`breed.bin`，方便后续操作。`Windows`下记算`MD5`可通过在终端中执行以下命令得到

```shell
certutil -hashfile path\to\breed-mt7688-reset38.bin MD5
```

​		其中，`path\to\breed-mt7688-reset38.bin`需要替换成你自己的文件路径

2.上传breed

​		可以通过以下命令将Breed上传到路由器

```shell
scp /path/local_filename username@servername:/path
```

​		例如`scp C:\Users\leuncle\Desktop\breed.bin root@192.168.31.1:/tmp`代表将本机`C:\Users\leuncle\Desktop`目录下的`breed.bin`文件上传到`192.168.31.1`的`tmp`目录下

![image-20231006200343900](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-202310062003430.png)

3.刷入breed

​		在`ssh`窗口中执行以下命令，将`breed`刷入`bootloader`，刷入成功后按提示重启路由器(注意：`breed`作者并不推荐此方法)，至此`breed`固件刷入完毕

```shell
mtd -r write /tmp/breed.bin Bootloader
```

![image-20231006200418190](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20231006200418190.png)

#### 8.Breed使用

1.进入Breed控制台

​		拔掉路由器电源，使路由关机，用取卡针或者其他尖锐物戳着reset键，然后插上电源，待路由器后方的网络接口灯闪烁时松开reset键即可。

​		！！！注意一定要先按住reset键再上电，不能先上电再按reset！！！

​		【之后想再次进入breed管理页同样重复此操作】

​		然后用一条网线把电脑和路由器的 `WAN` 口相连，注意是 ` WAN` 口，打开浏览器访问`192.168.1.1`，即可进入`breed`控制台，进入后即可开始对路由器进行刷机

![image-20231006204805583](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20231006204805583.png)

2.路由器固件推荐

​		推荐使用`Padavan`固件，这是[固件发布地址](http://www.right.com.cn/forum/thread-161324-1-1.html)(注意：小米路由器青春版请选择`MI-NANO`专版，目前最新版固件名称如下：`MI-NANO_3.4.3.9-099.trx`)，这是[固件下载地址](https://opt.cn2qq.com/padavan/)。在breed控制台，选择固件，上传，更新，即可刷入固件。

![image-20231006204752709](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/image-20231006204752709.png)

​		刷入成功后，默认创建了 `SSID` 为 `PCDN` 的无线网络，默认的密码为 `1234567890` ，后台网址为`192.168.123.1`，账号密码都为 `admin` 