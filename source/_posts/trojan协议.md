---
title: trojan协议
date: 2023-08-09 13:51:38
tags:
  - Trojan
categories:	
  - Network
description: Trojan协议详解及搭建
---

# Trojan协议

![image-20230808164533076](https://cdn.jsdelivr.net/gh/YuJiang4319/images/trojan%E5%8D%8F%E8%AE%AE/E4ngrCjNiqQH3Vx.png)

### Trojan绕过GFW原理：

​		与Shadowsocks相反，Trojan不使用自定义的加密协议来隐藏自身。相反，使用特征明显的TLS协议(TLS/SSL)，使得流量看起来与正常的HTTPS网站相同。

​		即，将出国的HTTPS数据包后添加协议相关字段，整体再用TLS加密，作为外层HTTPS的数据内容。

**但是既然HTTPS本身就对数据做了加密，何必多此一举再套一层HTTPS呢？**

​		在HTTPS数据包中，目标网址（也称为主机名或域名）是在握手过程中的服务器名称指示（Server Name Indication，SNI）字段中发送的。SNI字段是在建立TLS连接时发送给服务器的一个扩展字段，用于指定客户端要连接的目标网址。

​		SNI字段是明文发送的，因此中间的网络节点或观察者可以查看到目标网址信息。这是为了让服务器能够根据目标网址选择正确的证书进行TLS握手，建立安全连接。因此，当国内直接对``google.com``发起HTTPS请求时，国际出口的GFW会直接拦截该数据包或者重定向到其他指定页面。值得注意的是，除了SNI字段外，HTTPS的其他内容（包括请求和响应的头部、正文等）都是加密的，无法直接查看。只有目标服务器才能解密这些数据。

​		尽管SNI字段可以被观察者看到，但它通常只包含目标网址的域名部分，而不包含具体的路径或查询参数。例如，对于``https://www.example.com/path?param=value``这样的URL，SNI字段只会包含``www.example.com``。

**关于TLS**

​		TLS是一个成熟的加密体系，HTTPS即使用TLS承载HTTP流量。使用正确配置的加密TLS隧道，可以保证传输的

- 保密性（GFW无法得知传输的内容）
- 完整性（一旦GFW试图篡改传输的密文，通讯双方都会发现）
- 不可抵赖（GFW无法伪造身份冒充服务端或者客户端）
- 前向安全（即使密钥泄露，GFW也无法解密先前的加密流量）

**Trojan如何避免被墙？**

​		对于被动检测，Trojan协议的流量与HTTPS流量的特征和行为完全一致。而HTTPS流量占据了目前互联网流量的一半以上，且TLS握手成功后流量均为密文，几乎不存在可行方法从其中分辨出Trojan协议流量。

​		对于主动检测，当防火墙主动连接Trojan服务器进行检测时，Trojan可以正确识别非Trojan协议的流量。与Shadowsocks等代理不同的是，此时Trojan不会断开连接，而是将这个连接代理到一个正常的Web服务器。在GFW看来，该服务器的行为和一个普通的HTTPS网站行为完全相同，无法判断是否是一个Trojan代理节点。这也是Trojan推荐使用合法的域名、使用权威CA签名的HTTPS证书的原因: 这让你的服务器完全无法被GFW使用主动检测判定是一个Trojan服务器。

​		因此，就目前的情况来看，若要识别并阻断Trojan的连接，只能使用无差别封锁（封锁某个IP段，某一类证书，某一类域名，甚至阻断全国所有出境HTTPS连接）或发动大规模的中间人攻击（劫持所有TLS流量并劫持证书，审查内容）。对于中间人攻击，可以使用Websocket的双重TLS应对，高级配置中有详细讲解。

### Trojan节点搭建（Ubuntu 22.04）：

**trojan-go：https://github.com/p4gefau1t/trojan-go**
**trojan-go官方文档：https://p4gefau1t.github.io/trojan-go/**

##### 1.下载对应版本项目压缩包，上传到/root/trojan目录下解压

<img src="https://cdn.jsdelivr.net/gh/YuJiang4319/images/trojan%E5%8D%8F%E8%AE%AE/image-20230808181727412.png" alt="image-20230808181727412" style="zoom:67%;" />

其中example文件夹中为示例配置文件，绿色的Trojan-go为可执行文件

##### 2.在当前目录下创建 ``config.json``配置文件，填入以下内容或者复制example中的示例

```json
{
    "run_type": "server",
    "local_addr": "0.0.0.0",     //全0表示接收所有ip数据
    "local_port": 443,       //由于用HTTPS流量伪装，端口号不建议修改为其他端口，容易引起注意
    "remote_addr": "192.83.167.78",     //身份认证失败后转发到该服务器，也可转发给本机其他端口
    "remote_port": 80,
    "password": [
        "123456"   //用于身份验证，防止GFW重放攻击
    ],
    "ssl": {
        "cert": "server.crt",    //证书路径
        "key": "server.key"		//私钥路径
    }
}
```

##### 3.申请证书

​		**申请证书前要先准备好域名，将域名解析到该服务器IP上，可通过ping域名的方式验证DNS解析是否生效**

​                                             		<img src="https://cdn.jsdelivr.net/gh/YuJiang4319/images/trojan%E5%8D%8F%E8%AE%AE/image-20230808183127727.png" alt="image-20230808183127727" style="zoom:67%;" />

```shell
#安装acme：
curl https://get.acme.sh | sh
#安装socat：
apt install socat
#添加软链接：
ln -s  /root/.acme.sh/acme.sh /usr/local/bin/acme.sh   
//在Linux中，bin目录是添加到环境变量中的，其中的命令可以在任意位置调用，acme.sh添加软链接到bin目录后可直接调用
#注册账号： 
acme.sh --register-account -m my@example.com    //任意邮箱即可，随便编
#开放80端口：
ufw allow 80
//由于使用独立模式申请证书，acme会在80端口部署服务，并让指定字符串在主页显示，以此证明该域名对应的就是你这台服务器
#申请证书： 
acme.sh  --issue -d 替换为你的域名  --standalone -k ec-256

#如果默认CA无法颁发，则可以切换下列CA：
#切换 Let’s Encrypt：
acme.sh --set-default-ca --server letsencrypt
#切换 Buypass：
acme.sh --set-default-ca --server buypass
#切换 ZeroSSL：
acme.sh --set-default-ca --server zerossl
```

**申请成功后会返回证书、私钥和证书链的路径**

![image-20230808185207646](https://cdn.jsdelivr.net/gh/YuJiang4319/images/trojan%E5%8D%8F%E8%AE%AE/image-20230808185207646.png)

**补充：证书链**

​		证书链（Certificate Chain）是一组证书的集合，用于验证数字证书的有效性和信任。它由一系列证书组成，每个证书都由上一个证书签发机构（Certificate Authority，CA）签发，并形成一个信任链。

​		证书链的最后一个证书是目标证书，也称为服务器证书或终端证书。该证书包含了一个公钥和与之对应的私钥，用于建立安全连接和进行加密通信。

​		证书链的其他证书是中间证书或根证书。中间证书由较高级别的CA签发，而根证书是顶级CA签发的自签名证书。根证书是信任链的根源，因为它们是信任的起点。

​		验证证书的过程是通过检查每个证书的签名和有效期，并验证签发机构的信任链来确保证书的有效性。客户端会使用根证书来验证中间证书的签发机构，然后使用中间证书来验证目标证书的签发机构。如果整个证书链都被验证通过，那么目标证书就被视为有效和受信任。

**也可以自签证书**

```shell
#生成私钥：
openssl ecparam -genkey -name prime256v1 -out ca.key
#生成证书：
openssl req -new -x509 -days 36500 -key ca.key -out ca.crt  -subj "/CN=bing.com"
```

但需要在客户端手动添加受信任的CA机构

##### 4.安装证书

```shell
#安装证书： 
acme.sh --installcert -d 替换为你的域名 --ecc  --key-file   /root/trojan/server.key   --fullchain-file /root/trojan/server.crt 
//本质就是将证书复制到目的路径
```

安装之后路径下多了两个证书文件，与配置文件中的相对路径对应：

<img src="https://cdn.jsdelivr.net/gh/YuJiang4319/images/trojan%E5%8D%8F%E8%AE%AE/image-20230808190348449.png" alt="image-20230808190348449" style="zoom:67%;" />

##### 5.运行trojan-go

```shell
root@localhost:~/trojan# ./trojan-go
root@localhost:~/trojan# ufw allow 443     //服务运行在443端口，放行443
```

<img src="https://cdn.jsdelivr.net/gh/YuJiang4319/images/trojan%E5%8D%8F%E8%AE%AE/image-20230808203953734.png" alt="image-20230808203953734" style="zoom:67%;" />

**常驻后台运行：**

```shell
nohup ./trojan-go > trojan.log 2>&1 &
```

后面的2>&1参数是指将标准错误重定向到标准输出，意味着将错误消息与正常输出一起写入到`trojan.log`文件中。

具体来说，数字2代表标准错误流（stderr），`>`表示重定向操作符，`&1`表示将输出重定向到与标准输出相同的地方。

##### 6.客户端配置

- 地址：服务端地址
- 端口：``config.json``设定的服务端口
- 密码：同``config.json``，用于身份验证
- SNI：外层HTTPS中的SNI字段，默认为服务端域名

<img src="https://cdn.jsdelivr.net/gh/YuJiang4319/images/trojan%E5%8D%8F%E8%AE%AE/image-20230808211705103.png" alt="image-20230808211705103" style="zoom:67%;" />

**连接测试（开启CDN后）：**

![image-20230808213251698](https://cdn.jsdelivr.net/gh/YuJiang4319/images/trojan%E5%8D%8F%E8%AE%AE/image-20230808213251698.png)

##### 7.一些小问题

- 配置DNS解析时默认开启了cloudflare的CDN加速，服务端启动几分钟后，客户端都连接不上，起初以为ip或者端口被GFW墙了，通过https://tcp.ping.pe/网站测试发现全球都能tcping通该服务器443端口，后来将CDN服务关闭才连接成功。
- 于是我又参考了trojan-go的官方文档，发现要开启CDN加速必须在``config.json``文件中添加配置，开启websocket功能，完整配置如下：

```json
{
    "run_type": "server",
    "local_addr": "0.0.0.0",     
    "local_port": 443,       
    "remote_addr": "192.83.167.78",    
    "remote_port": 80,
    "password": [
        "123456"   
    ],
    "ssl": {
        "cert": "server.crt",    
        "key": "server.key"		
    },
    "websocket": {
	    "enabled": true,      //开启websocket
	    "path": "/websocketpath/",     //websocket路径，随便填，保证服务端、客户端路径统一即可
	    "hostname": "vps.diamondheart.top"
}
}
```

**！！！注意websocket路径最后还有个/**

- 同时还需要修改客户端配置：

<img src="https://cdn.jsdelivr.net/gh/YuJiang4319/images/trojan%E5%8D%8F%E8%AE%AE/image-20230808222624967.png" alt="image-20230808222624967" style="zoom:67%;" />

**主要是将传输层协议修改为websocket（ws），添加websocket路径**

- 如果觉得CloudFlare默认分配的CDN  IP较慢，可通过``CloudflareST``自动测速优选IP，然后将地址替换为优选IP，同时伪装域名为该服务器所绑定的域名，如下所示：

<img src="https://cdn.jsdelivr.net/gh/YuJiang4319/images/trojan%E5%8D%8F%E8%AE%AE/image-20230808223643777.png" alt="image-20230808223643777" style="zoom:67%;" />
