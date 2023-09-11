---
title: HTML基础
date: 2023-08-08 15:51:38
tags:
  - HTML
categories:	
  - Program
description: HTML基础
---

# 01.初识HTML

**HTML**

- hyper text markup language(超文本标记语言)

**HTML5**

- 提供了一些新的元素和一些有趣的新特性，同时也建立了一些新的规则。这些元素、特性和规则的建立提供了许多新的网页功能，如使用网页实现动态渲染图形、图表、图像和动画，以及不需要安装任何插件直接网页播放视频等。

**HTML5的优势**

- 世界知名浏览器厂商对HTML5的支持
  - 微软
  - Google
  - 苹果
  - Opera
  - Mozilla
- 市场的需求
- 跨平台

**W3C标准**

- W3C
  - world wide web consortium(万维网联盟)
  - 成立于1994年，web技术领域最权威和具影响力的国际中立性技术标准机构
  - http://www.w3.org/
  - http://www.chinaw3c.org/
- W3C标准包括
  - 结构化标准语言（html、xml）
  - 表现标准语言（css）
  - 行为标准（dom、ECMAScript）

**常见IDE**

- 记事本
- Dreamweaver
- idea
- webstorm
- ...

**html基本机构**

![image-20210516152421486](https://s2.loli.net/2022/04/14/gToPqjBLemrVsaR.png)

`<body>`、`</body>`等成对的标签，分别叫开放标签，和闭合标签

单独呈现的标签（空元素），如`<hr/>；`意为用/来关闭空元素

# 02.网页基本信息

- DOCTYPE声明
- `<title>`标签
- `<meta>`标签

```html
<!--DOCTYPE:告诉浏览器，我们要使用什么规范-->
<!DOCTYPE html>
<html>
<!--head标签代表网页头部-->
<head>
    <!--meta描述性标签，他用来描述我们网站的一些信息-->
    <!--meta一般用来做SEO-->
    <meta charset="UTF-8">
    <meta name="keywords" content="java">
    <meta name="description" content="学习java">
    <!--title网页标题-->
    <title>Title</title>
</head>
<!--body标签代表网页主体-->
<body>
hello
</body>
</html>
```

# 03.网页基本标签

- 标题标签
- 段落标签
- 换行标签
- 水平线标签
- 字体样式标签
- 注释和特殊符号

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>基本标签学习</title>
</head>
<body>
<!--标题标签-->
<h1>一级标签</h1>
<h2>二级标签</h2>
<h3>三级标签</h3>
<h4>四级标签</h4>
<h5>五级标签</h5>
<h6>六级标签</h6>
<!--段落标签-->
<p>鹅鹅鹅，</p>
<p>曲项向天歌。</p>
<p>白毛浮绿水，</p>
<p>红掌拨清波。</p>
<!--水平线标签-->
<hr/>
<!--换行标签-->
鹅鹅鹅，<br/>
曲项向天歌。<br/>
白毛浮绿水，<br/>
红掌拨清波。<br/>

<h1>字体样式标签</h1>
<!--粗体，斜体-->
粗体：<strong>i love you</strong>
斜体：<em>i love you</em>

<br/>
<!--特殊符号-->
空    格：
空&nbsp; &nbsp; &nbsp; &nbsp; 格
<br/>
&gt;
&lt;
&copy;版权所有
<!--
特殊符合记性方式
&   ;
-->
</body>
</html>
```



# 04.图像标签

常见的图像格式

- jpg
- gif
- png
- bmp
- ...

![image-20210516155705837](https://s2.loli.net/2022/04/14/KqYVNIZ8j3ACMzm.png)

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>图像标签学习</title>
</head>
<body>
<!--
img 学习
src:图片地址（必填）
  相对地址（推荐使用）
  绝地地址

../   上一级目录

alt:图片名字（必填）
-->
<img src="../resource/img/5efaffbac96db.jpg" alt="图片" title="悬停文字" width="300" height="300">
<a href="链接标签.html#down">跳转</a>
</body>
</html>
```



# 05.超链接标签及应用

- 文本超链接
- 图像超链接

![image-20210516160554567](https://s2.loli.net/2022/04/14/J1sCAF2zbecnPqD.png)



超链接

- 页面间链接
- 锚链接
- 功能性链接

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>链接标签学习</title>
</head>
<body>
<!--
a标签

href:表示要跳转到哪个页面（必填）
target:表示窗口在哪里打开
    _blank 在新的签页中打开
    _self  在自己的签页中打开
-->
<!--使用name作为标记-->
<a name="top">顶部</a>
<a href="first.html" target="_blank">点击跳转到页面一</a>
<a href="https://www.baidu.com" target="_self">点击跳转到百度</a>
<br/>
<a href="first.html">
    <img src="../resource/img/5efaffbac96db.jpg" alt="图片" title="悬停文字" width="500" height="500">
</a>
<p>
    <a href="first.html">
        <img src="../resource/img/5efaffbac96db.jpg" alt="图片" title="悬停文字" width="500" height="500">
    </a>
</p>
<p>
    <a href="first.html">
        <img src="../resource/img/5efaffbac96db.jpg" alt="图片" title="悬停文字" width="500" height="500">
    </a>
</p>
<p>
    <a href="first.html">
        <img src="../resource/img/5efaffbac96db.jpg" alt="图片" title="悬停文字" width="500" height="500">
    </a>
</p>
<p>
    <a href="first.html">
        <img src="../resource/img/5efaffbac96db.jpg" alt="图片" title="悬停文字" width="500" height="500">
    </a>
</p>
<p>
    <a href="first.html">
        <img src="../resource/img/5efaffbac96db.jpg" alt="图片" title="悬停文字" width="500" height="500">
    </a>
</p>


<!--
锚链接
 1. 需要一个锚标记
 2. 跳转到标记
-->
<a href="#top">回到顶部</a>
<a name="down">底部</a>

<!--
功能性连接

邮件连接：mailto

QQ连接
-->
<a href="mailto:2550705615@qq.com">点击联系我</a>
<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2::52" alt="QQ交谈" title="QQ交谈"/></a>
</body>
</html>
```



# 06.块元素和行内元素

- 块元素
  - 无论内容多少，该元素独占一行
  - (p、h1-h6、...)
- 行内元素
  - 内容撑开宽度，左右都是行内元素的可以排在一行
  - (a  strong   em ...)

# 07.列表标签

- 分类
  - 无序列表
  - 有序列表
  - 定义列表

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>列表学习</title>
</head>
<body>
<!--
有序列表
应用范围：试卷，问答。。。
-->
<ol>
    <li>java</li>
    <li>python</li>
    <li>C</li>
    <li>C++</li>
</ol>
<!--
无序列表
应用范围：导航，侧边栏。。。
-->
<ul>
    <li>java</li>
    <li>python</li>
    <li>C</li>
    <li>C++</li>
</ul>
<!--
自定义列表
dl:标签
dt:列表名称
dd:列表内容

应用范围：公司网站底部
-->
<dl>
    <dt>学科</dt>
    <dd>java</dd>
    <dd>python</dd>
    <dd>C</dd>
    <dd>C++</dd>

    <dt>位置</dt>
    <dd>西安</dd>
    <dd>重庆</dd>
</dl>
</body>
</html>
```

效果

![image-20210516164441626](https://gitee.com/zhayuyao/img/raw/master/zhayuyao/img/image-20210516164441626.png)

# 08.表格标签

- 为什么使用表格
  - 简单通用
  - 结构稳定
- 基本结构
  - 单元格
  - 行
  - 列
  - 跨行
  - 跨列

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>表格学习</title>
</head>
<body>

<!--
表格
行 tr
列 td
-->
<table border="1px">
    <tr>
        <!--colspan 跨列-->
        <td colspan="4">1-1</td>
    </tr>
    <tr>
        <!--rowspan跨行-->
        <td rowspan="2">2-1</td>
        <td>2-2</td>
        <td>2-3</td>
        <td>2-4</td>
    </tr>
    <tr>
        <td>3-2</td>
        <td>3-3</td>
        <td>3-4</td>
    </tr>
</table>
</body>
</html>
```



# 09.媒体元素

- 视频元素
  - video
- 音频元素
  - audio

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>媒体元素学习</title>
</head>
<body>
<!--
音频和视频
src  资源路径
controls  控制条
autoplay  自动播放
-->
<video src="../resource/video/1.mp4" controls autoplay></video>
<audio src="../resource/audio/1.mp3" controls autoplay></audio>
</body>
</html>
```



# 10.页面结构分析

![image-20210516230515224](https://s2.loli.net/2022/04/14/KfWCM3cleV9tdmg.png)

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>页面结构分析</title>
</head>
<body>
<header>
    <h1>
        网页头部
    </h1>
</header>
<section>
    <h2>
        网页主体
    </h2>
</section>
<footer>
    <h2>
        网页脚部
    </h2>
</footer>
</body>
</html>
```



# 11.iframe内联框架

![image-20210516231051987](https://s2.loli.net/2022/04/14/Rv4BIry5uSeEHGZ.png)

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>内联框架学习</title>
</head>
<body>

<iframe src="https://www.baidu.com" name="hello" frameborder="0" width="1000px" height="800px"></iframe>
<a href="first.html" target="hello">点击跳转</a>
<!--<iframe src="//player.bilibili.com/player.html?aid=55631961&bvid=BV1x4411V75C&cid=97257967&page=11" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>-->
</body>
</html>
```



# 12.初识表单post和get提交

表单

![image-20210517215302615](https://s2.loli.net/2022/04/14/UfhD5lKjLOa21PS.png)

表单元素格式

![image-20210517220619329](https://s2.loli.net/2022/04/14/pWyEiZgL6tz81vO.png)

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录注册</title>
</head>
<body>
<h1>注册</h1>
<!--
form 表单
action ： 表单提交的位置，可以是网站，也可以是一个请求处理地址
method: post/get 提交方式
  get方式提交：可以再URL中看到我们提交的信息，不安全，高效
  post ：比较安全，传输大文件
-->
<form action="first.html" method="post">
    <p>名字：<input type="text" name="username"></p>
    <p>密码：<input type="password" name="pwd"></p>
    <p>
        <input type="submit">
        <input type="reset">
    </p>
</form>
</body>
</html>
```

![image-20210517220505924](https://s2.loli.net/2022/04/14/RWMmp6VnIUHcCvu.png)

# 13.文本框和单选框

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录注册</title>
</head>
<body>
<h1>注册</h1>
<!--
form 表单
action ： 表单提交的位置，可以是网站，也可以是一个请求处理地址
method: post get 提交方式
  get 方式提交：可以再URL中看到我们提交的信息，不安全，高效
  post ：比较安全，传输大文件
-->
<form action="first.html" method="post">
    <!--

    文本框
    value="haha"    默认初始值
    maxlength="8"   最长能写几个字符
    size="30"       文本框的长度
    -->
    <p>名字：<input type="text" name="username" value="haha" maxlength="8"/></p>
    <!--
    密码框
    input type="password"
     -->
    <p>密码：<input type="password" name="pwd"/></p>
    <!--
    单选框标签
    input type="radio"
    value : 单选框的值
    name: 表示组
    -->
    <p>
        <input type="radio" value="man" name="sex"/>男
        <input type="radio" value="woman" name="sex"/>女
    </p>
    <p>
        <input type="submit"/>
        <input type="reset"/>
    </p>
</form>
</body>
</html>
```



# 14.按钮和多选按钮

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录注册</title>
</head>
<body>
<h1>注册</h1>
<!--
form 表单
action ： 表单提交的位置，可以是网站，也可以是一个请求处理地址
method: post get 提交方式
  get 方式提交：可以再URL中看到我们提交的信息，不安全，高效
  post ：比较安全，传输大文件
-->
<form action="first.html" method="post">
    <!--

    文本框
    value="haha"    默认初始值
    maxlength="8"   最长能写几个字符
    size="30"       文本框的长度
    -->
    <p>名字：<input type="text" name="username" value="haha" maxlength="8"/></p>
    <!--
    密码框
    input type="password"
     -->
    <p>密码：<input type="password" name="pwd"/></p>
    <!--
    单选框标签
    input type="radio"
    value : 单选框的值
    name: 表示组
    -->
    <p>
        <input type="radio" value="man" name="sex"/>男
        <input type="radio" value="woman" name="sex"/>女
    </p>

    <!--
    多选框
    type="checkbox"
    -->
    <p>
        爱好：
        <input type="checkbox" value="sleep" name="hobby"/>睡觉
        <input type="checkbox" value="code" name="hobby"/>敲代码
        <input type="checkbox" value="chat" name="hobby"/>聊天
        <input type="checkbox" value="game" name="hobby"/>游戏
    </p>
    <!--    
    按钮
    input type="button" 普通按钮
    input type="image"  图片按钮
    input type="submit" 提交按钮
    input type="reset"  重置
    -->
    <p>
        按钮：
        <input type="button" value="点击变长" name="but1"/>
        <input type="image" src="../resource/img/5efaffbac96db.jpg"/>
    </p>
    <p>
        <input type="submit"/>
        <input type="reset"/>
    </p>
</form>
</body>
</html>
```



# 15.列表框文本域和文件域

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录注册</title>
</head>
<body>
<h1>注册</h1>
<!--
form 表单
action ： 表单提交的位置，可以是网站，也可以是一个请求处理地址
method: post get 提交方式
  get 方式提交：可以再URL中看到我们提交的信息，不安全，高效
  post ：比较安全，传输大文件
-->
<form action="first.html" method="post">
    <!--

    文本框
    value="haha"    默认初始值
    maxlength="8"   最长能写几个字符
    size="30"       文本框的长度
    -->
    <p>名字：<input type="text" name="username" value="haha" maxlength="8"/></p>
    <!--
    密码框
    input type="password"
     -->
    <p>密码：<input type="password" name="pwd"/></p>
    <!--
    单选框标签
    input type="radio"
    value : 单选框的值
    name: 表示组
    -->
    <p>
        <input type="radio" value="man" name="sex" checked/>男
        <input type="radio" value="woman" name="sex"/>女
    </p>

    <!--
    多选框
    type="checkbox"
    -->
    <p>
        爱好：
        <input type="checkbox" value="sleep" name="hobby"/>睡觉
        <input type="checkbox" value="code" name="hobby" checked/>敲代码
        <input type="checkbox" value="chat" name="hobby"/>聊天
        <input type="checkbox" value="game" name="hobby"/>游戏
    </p>
    <!--
    按钮
    input type="button" 普通按钮
    input type="image"  图片按钮
    input type="submit" 提交按钮
    input type="reset"  重置
    -->
    <p>
        按钮：
        <input type="button" value="点击变长" name="but1"/>
        <!--<input type="image" src="../resource/img/5efaffbac96db.jpg"/>-->
    </p>

    <!--
    下拉框，列表框
    -->
    <p>
        国家：
        <select name="country">
            <option value="1" selected>中国</option>
            <option value="2">美国</option>
            <option value="3">瑞士</option>
            <option value="4">印度</option>
        </select>
    </p>
    <!--
    文本域
    cols="50" 行
    rows="10" 列
    -->
    <p>
        反馈：
        <textarea name="textarea" cols="50" rows="10">文本内容</textarea>
    </p>
    <!--
    文件域
    input type="file" name="files"
    -->
    <p>
        <input type="file" name="files"/>
        <input type="button" value="上传" name="upload"/>
    </p>
    <p>
        <input type="submit"/>
        <input type="reset"/>
    </p>
</form>
</body>
</html>
```



# 16.搜索框滑动和简单验证

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录注册</title>
</head>
<body>
<h1>注册</h1>
<!--
form 表单
action ： 表单提交的位置，可以是网站，也可以是一个请求处理地址
method: post get 提交方式
  get 方式提交：可以再URL中看到我们提交的信息，不安全，高效
  post ：比较安全，传输大文件
-->
<form action="first.html" method="post">
    <!--

    文本框
    value="haha"    默认初始值
    maxlength="8"   最长能写几个字符
    size="30"       文本框的长度
    -->
    <p>名字：<input type="text" name="username" value="haha" maxlength="8"/></p>
    <!--
    密码框
    input type="password"
     -->
    <p>密码：<input type="password" name="pwd"/></p>
    <!--
    单选框标签
    input type="radio"
    value : 单选框的值
    name: 表示组
    -->
    <p>
        <input type="radio" value="man" name="sex" checked/>男
        <input type="radio" value="woman" name="sex"/>女
    </p>

    <!--
    多选框
    type="checkbox"
    -->
    <p>
        爱好：
        <input type="checkbox" value="sleep" name="hobby"/>睡觉
        <input type="checkbox" value="code" name="hobby" checked/>敲代码
        <input type="checkbox" value="chat" name="hobby"/>聊天
        <input type="checkbox" value="game" name="hobby"/>游戏
    </p>
    <!--
    按钮
    input type="button" 普通按钮
    input type="image"  图片按钮
    input type="submit" 提交按钮
    input type="reset"  重置
    -->
    <p>
        按钮：
        <input type="button" value="点击变长" name="but1"/>
        <!--<input type="image" src="../resource/img/5efaffbac96db.jpg"/>-->
    </p>

    <!--
    下拉框，列表框
    -->
    <p>
        国家：
        <select name="country">
            <option value="1" selected>中国</option>
            <option value="2">美国</option>
            <option value="3">瑞士</option>
            <option value="4">印度</option>
        </select>
    </p>
    <!--
    文本域
    cols="50" 行
    rows="10" 列
    -->
    <p>
        反馈：
        <textarea name="textarea" cols="50" rows="10">文本内容</textarea>
    </p>
    <!--
    文件域
    input type="file" name="files"
    -->
    <p>
        <input type="file" name="files"/>
        <input type="button" value="上传" name="upload"/>
    </p>
    <!--
    邮件验证
    -->
    <p>
        邮箱：
        <input type="email" name="email"/>
    </p>
    <!--
    url
    -->
    <p>
        url：
        <input type="url" name="url"/>
    </p>
    <!--
    数字
    -->
    <p>
        数字：
        <input type="number" name="num" max="100" min="0" step="10"/>
    </p>
    <!--
    滑块
    input type="range"
    -->
    <p>
        滑块：
        <input type="range" name="voice" max="100" min="0" step="1"/>
    </p>
    <!--
    搜索
    input type="search"
    -->
    <p>
        搜索：
        <input type="search" name="search"/>
    </p>

    <p>
        <input type="submit"/>
        <input type="reset"/>
    </p>
</form>
</body>
</html>
```



# 17.表单的应用

- 隐藏域 hidden
- 只读 readonly
- 禁用 disabled

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录注册</title>
</head>
<body>
<h1>注册</h1>
<!--
form 表单
action ： 表单提交的位置，可以是网站，也可以是一个请求处理地址
method: post get 提交方式
  get 方式提交：可以再URL中看到我们提交的信息，不安全，高效
  post ：比较安全，传输大文件
-->
<form action="first.html" method="post">
    <!--

    文本框
    value="haha"    默认初始值
    maxlength="8"   最长能写几个字符
    size="30"       文本框的长度
    -->
    <p>名字：<input type="text" name="username" value="admin" readonly/></p>
    <!--
    密码框
    input type="password"
     -->
    <p>密码：<input type="password" value="123456" name="pwd" hidden/></p>
    <!--
    单选框标签
    input type="radio"
    value : 单选框的值
    name: 表示组
    -->
    <p>
        <input type="radio" value="man" name="sex" disabled/>男
        <input type="radio" value="woman" name="sex"/>女
    </p>

    <!--
    多选框
    type="checkbox"
    -->
    <p>
        爱好：
        <input type="checkbox" value="sleep" name="hobby"/>睡觉
        <input type="checkbox" value="code" name="hobby" checked/>敲代码
        <input type="checkbox" value="chat" name="hobby"/>聊天
        <input type="checkbox" value="game" name="hobby"/>游戏
    </p>
    <!--
    按钮
    input type="button" 普通按钮
    input type="image"  图片按钮
    input type="submit" 提交按钮
    input type="reset"  重置
    -->
    <p>
        按钮：
        <input type="button" value="点击变长" name="but1"/>
        <!--<input type="image" src="../resource/img/5efaffbac96db.jpg"/>-->
    </p>

    <!--
    下拉框，列表框
    -->
    <p>
        国家：
        <select name="country">
            <option value="1" selected>中国</option>
            <option value="2">美国</option>
            <option value="3">瑞士</option>
            <option value="4">印度</option>
        </select>
    </p>
    <!--
    文本域
    cols="50" 行
    rows="10" 列
    -->
    <p>
        反馈：
        <textarea name="textarea" cols="50" rows="10">文本内容</textarea>
    </p>
    <!--
    文件域
    input type="file" name="files"
    -->
    <p>
        <input type="file" name="files"/>
        <input type="button" value="上传" name="upload"/>
    </p>
    <!--
    邮件验证
    -->
    <p>
        邮箱：
        <input type="email" name="email"/>
    </p>
    <!--
    url
    -->
    <p>
        url：
        <input type="url" name="url"/>
    </p>
    <!--
    数字
    -->
    <p>
        数字：
        <input type="number" name="num" max="100" min="0" step="10"/>
    </p>
    <!--
    滑块
    input type="range"
    -->
    <p>
        滑块：
        <input type="range" name="voice" max="100" min="0" step="1"/>
    </p>
    <!--
    搜索
    input type="search"
    -->
    <p>
        搜索：
        <input type="search" name="search"/>
    </p>


    <!--
    增强鼠标可用性
    -->
    <p>
        <label for="mark">点我试试</label>
        <input type="text" id="mark">
    </p>

    <p>
        <input type="submit"/>
        <input type="reset"/>
    </p>
</form>
</body>
</html>
```



# 18.表单初级验证

为什么要进行表单验证?



常用方式：

- placeholder  提示信息
- required   非空判断
- pattern  正则表达式

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录注册</title>
</head>
<body>
<h1>注册</h1>
<!--
form 表单
action ： 表单提交的位置，可以是网站，也可以是一个请求处理地址
method: post get 提交方式
  get 方式提交：可以再URL中看到我们提交的信息，不安全，高效
  post ：比较安全，传输大文件
-->
<form action="first.html" method="post">
    <!--

    文本框
    value="haha"    默认初始值
    maxlength="8"   最长能写几个字符
    size="30"       文本框的长度
    -->
    <p>名字：<input type="text" name="username" value="admin" placeholder="请输入用户名" required/></p>
    <!--
    密码框
    input type="password"
     -->
    <p>密码：<input type="password" value="123456" name="pwd" hidden/></p>
    <!--
    单选框标签
    input type="radio"
    value : 单选框的值
    name: 表示组
    -->
    <p>
        <input type="radio" value="man" name="sex" disabled/>男
        <input type="radio" value="woman" name="sex"/>女
    </p>

    <!--
    多选框
    type="checkbox"
    -->
    <p>
        爱好：
        <input type="checkbox" value="sleep" name="hobby"/>睡觉
        <input type="checkbox" value="code" name="hobby" checked/>敲代码
        <input type="checkbox" value="chat" name="hobby"/>聊天
        <input type="checkbox" value="game" name="hobby"/>游戏
    </p>
    <!--
    按钮
    input type="button" 普通按钮
    input type="image"  图片按钮
    input type="submit" 提交按钮
    input type="reset"  重置
    -->
    <p>
        按钮：
        <input type="button" value="点击变长" name="but1"/>
        <!--<input type="image" src="../resource/img/5efaffbac96db.jpg"/>-->
    </p>

    <!--
    下拉框，列表框
    -->
    <p>
        国家：
        <select name="country">
            <option value="1" selected>中国</option>
            <option value="2">美国</option>
            <option value="3">瑞士</option>
            <option value="4">印度</option>
        </select>
    </p>
    <!--
    文本域
    cols="50" 行
    rows="10" 列
    -->
    <p>
        反馈：
        <textarea name="textarea" cols="50" rows="10">文本内容</textarea>
    </p>
    <!--
    文件域
    input type="file" name="files"
    -->
    <p>
        <input type="file" name="files"/>
        <input type="button" value="上传" name="upload"/>
    </p>
    <!--
    邮件验证
    -->
    <p>
        邮箱：
        <input type="email" name="email"/>
    </p>
    <!--
    url
    -->
    <p>
        url：
        <input type="url" name="url"/>
    </p>
    <!--
    数字
    -->
    <p>
        数字：
        <input type="number" name="num" max="100" min="0" step="10"/>
    </p>
    <!--
    滑块
    input type="range"
    -->
    <p>
        滑块：
        <input type="range" name="voice" max="100" min="0" step="1"/>
    </p>
    <!--
    搜索
    input type="search"
    -->
    <p>
        搜索：
        <input type="search" name="search"/>
    </p>


    <!--
    增强鼠标可用性
    -->
    <p>
        <label for="mark">点我试试</label>
        <input type="text" id="mark">
    </p>

    <!--
    正则表达式
    -->
    <p>
        手机号码
        <input type="text" name="phoneNo"
               pattern="^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$">
    </p>

    <p>
        <input type="submit"/>
        <input type="reset"/>
    </p>
</form>
</body>
</html>
```



# 19.HTML总结