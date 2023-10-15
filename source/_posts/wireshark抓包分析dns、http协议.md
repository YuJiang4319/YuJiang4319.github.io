---
title: wireshark抓包分析dns、http协议
date: 2023-10-15 16:55:38
tags:
  - wireshark
  - network
categories:	
  - Wireshark
description: wireshark抓包分析dns、http协议
---

## 一、实验目的

​	通过WireShark工具抓取数据包并分析，从而更深刻的理解TCP/IP网络从底层到顶层的一个封包过程，以及一些HTTP、DNS、POP3、SMTP等常见协议的通讯过程。并可以通过这些工具进行日常的网络诊断。

## 二、实验环境

​	Windows 10，wireshark

## 三、实验内容

1、 WireShark软件的安装

2、 HTTP数据包的抓取，并分析其请求包和响应包的五元组信息

 <流：源端口号、目的端口号、协议号、源IP、目的IP>

3、 DNS协议数据包的抓取，了解DNS协议的工程流程以及常见DNS资源记录的格式，学会使用nslookup来进行DNS查询，记录DNS请求包和响应包的信息

<流：源端口号、目的端口号、协议号、源IP、目的IP>

## **四、**实验知识点、原理

> HTTP数据包格式：

![图片1](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/%E5%9B%BE%E7%89%871-1697347977956-5.png)

> DNS数据包格式：

![img](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/wps2.png)

## **五、** 实验步骤

1. 安装wireshark抓包工具，选择当前使用网卡
2. 先过滤http数据包，任意选择一个http数据包，左边会显示一组箭头，朝右的箭头表示请求数据包，朝左的箭头表示响应数据包，任选一组http数据包分析
3. 对于dns数据包，首先在命令行使用nslookup命令发送dns查询，同时在wireshark中过滤dns数据包，抓取并分析

## **六、**实验结果与分析

> http请求包

![img](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/wps3.jpg)

- 源：192.168.87.139：4210  目的：39.156.165.107：80

- 协议号：4  

- 请求方式：GET

- URL:/api/toolbox/geturl.php?h=C8A8A61957130BC8E14BC46E675C10BD&v=13.0.0.6738&r=0000_sogou_pinyin_130

- 协议版本：HTTP/1.1

- User-Agent：SOGOU_UPDATER   //应用程序名称

- Host: config.pinyin.sogou.com  //目标主机

- Accept: */*    //可接受响应内容类型

> http响应包

![img](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/wps4.jpg) 

- 源：39.156.165.107：80  目的：192.168.87.139：4210

- 协议号：4

- 协议版本：HTTP/1.1

- 状态码：200

- 短语：OK

- Server：nginx   //服务器软件名称

- Date: Fri, 13 Oct 2023 06:05:23 GMT  //响应生成时间，使用格林威治标准时间(GMT)

- Content-Type: application/octet-stream  //响应主体类型

- Content-Length: 0  //响应主体长度

- Connection: keep-alive  //连接状态，keep-alive表示长连接

- Set-Cookie: IPLOC=CN3301; path=/  //设置的cookie信息

- P3P: CP="CURa ADMa DEVa PSAo PSDo OUR BUS UNI PUR INT DEM STA PRE COM NAV OTC NOI DSP COR"  //定义网站的隐私策略

- 由于Content-Length=0，所以无实体主体

> dns请求

![img](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/wps5.jpg) 

- 源：192.168.87.139：51489    目的：192.168.87.49:53

- 协议号：4

- Transaction ID: 0xea7b  //事务ID，标识dns查询与响应的关联

- Flags: 0x0100 Standard query   //DNS数据包的一些标志位信息

- Questions: 1  //指示DNS数据包中包含的查询问题的数量

- Answer RRs: 0  //表示DNS响应中包含的回答资源记录

- Authority RRs: 0  //表示DNS响应中包含的授权资源记录的数量

- Additional RRs: 0	 //表示DNS响应中包含的附加资源记录的数量

- Queries  //包含了查询的域名和查询类型（如A记录、CNAME记录等）

  www.diamondheart.top: type A, class IN

​    Name: www.diamondheart.top

​    [Name Length: 20]

​    [Label Count: 3]

​    Type: A (Host Address) (1)

​    Class: IN (0x0001)

> dns响应

![img](https://cdn.jsdelivr.net/gh/YuJiang4319/images/ikuai/wps6.jpg) 

- 源：192.168.87.49:53    目的：192.168.87.139:51489

- 协议号：4

- Transaction ID: 0xea7b  

- Flags: 0x8180

- Questions: 1

- Answer RRs: 2

- Authority RRs: 0

- Additional RRs: 0

- Answers   //包含了查询的结果，如IP地址、CNAME别名等

  www.diamondheart.top: type A, class IN, addr 104.21.43.194

​    Name: www.diamondheart.top

​    Type: A (Host Address) (1)

​    Class: IN (0x0001)

​    Time to live: 300 (5 minutes)

​    Data length: 4

​    Address: 104.21.43.194

  www.diamondheart.top: type A, class IN, addr 172.67.184.170

​    Name: www.diamondheart.top

​    Type: A (Host Address) (1)

​    Class: IN (0x0001)

​    Time to live: 300 (5 minutes)

​    Data length: 4

​    Address: 172.67.184.170
