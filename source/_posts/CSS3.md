---
title: CSS3
date: 2023-08-08 16:51:38
tags:
  - CSS
categories:	
  - Program
description: CSS
---

# 01.css的简单介绍

html + css + javascript

结构+ 表现 + 交互

> 如何学习

1. css是什么
2. css怎么用（快速入门）
3. **css选择器（重点+难点）**
4. 美化网页（文字，阴影，超链接，列表，渐变。。。）
5. 盒子模型
6. 浮动
7. 定位
8. 网页动画（特效效果）

# 02.什么是css和发展史

cascading style sheet(层叠级联样式表)

css:表现（美化网页）

字体，颜色，边距，高度，宽度，背景图片，网页定位，网页浮动。。。

![image-20210518144754211](https://s2.loli.net/2022/04/14/7hAg6BylXMDPQRV.png)

> 发展史：

CSS1.0

CSS2.0  DIV（块）+ CSS，HTML与CSS结构分离的思想，网页变得简单，SEO（search engine optimization，搜索引擎优化）

CSS2.1  浮动，定位

CSS3.0  圆角，阴影，动画...浏览器兼容性~

# 03.css的快速入门及优势

> 练习格式

![image-20210518152202036](https://s2.loli.net/2022/04/14/qrwQBldk71fVvyH.png)

> 原生态的

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--
    规范，<style>可以编写css代码，每一个声明最好使用分号结尾
    语法：
      选择器{
          声明1;
          声明2;
          声明3;
      }
    -->
    <style>
        h1 {
            color: red;
        }

    </style>
</head>
<body>

<h1>
    标题
</h1>
</body>
</html>
```

> 建议使用这种规范

![image-20210518153017723](https://s2.loli.net/2022/04/14/TckidpIhM5sUFSV.png)

> css的优势

- 内容和表现分离
- 网页结构表现统一，可以实现复用
- 样式十分的丰富
- 建议使用独立于html的css文件
- 利用SEO，容易被搜索引擎收录！

# 04.四种css导入方式

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--内部样式-->
    <style>
        h1 {
            color: green;
        }
    </style>
    <!--外部样式-->
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<!--优先级：就近原则-->
<!--行内样式：在标签元素中，编写一个style属性，编写样式即可-->
<h1 style="color: red">标题</h1>
</body>
</html>
```

> style.css

```css
/*外部样式*/
h1{
    color: blue;
}
```

> 拓展：外部样式两种写法

- 链接式

  html

  ```html
      <link rel="stylesheet" href="css/style.css"/>
  ```

- 导入式(基本淘汰)

  @import 是css2.1特有的 

  ```html
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <title>Title</title>
      <!--导入式-->
      <style>
          @import url("css/style.css");
      </style>
  </head>
  <body>
  <h1>狂神说java</h1>
  </body>
  </html>
  ```


# 05.三种基本选择器（重要）

作用:选择页面上的某一个或者某一类元素

## 1.基本选择器

> 标签选择器：选择一类标签   标签{}

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        /*标签选择器，会选择到页面上所有的这个标签的元素*/
        h1 {
            color: #39a239;
            background: bisque;
            border-radius: 9px;
        }
        p {
            font-size: 50px;
        }

    </style>
</head>
<body>
<h1>学java</h1>
<h1>学C++</h1>
<p>狂神说</p>

</body>
</html>
```

> 类选择器 class ：选择所有class 属性一致的标签，跨标签  .类名{}

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        /*类选择器的格  .class的名称{}
        好处：可以多个标签归类，同一个class 可以复用
        */
        .t1 {
            color: #39a239;
        }

        .t2 {

            color: red;
        }
    </style>
</head>
<body>
<h1 class="t1">标题1</h1>
<h1 class="t2">标题2</h1>
<h1 class="t1">标题3</h1>
<p class="t2">
    p标签
</p>
</body>
</html>
```

> id选择器： 全局唯一  #id名{}

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        /*
        id选择器：id必须保证全局唯一
        #id名称 {}
        不遵循就近原则，固定的
        id选择器 > 类选择器 > 标签选择器
        */
        #zyy {
            color: #c87e60;
        }
        .style1 {
            color: #2a37c8;
        }
        h1 {
            color: #c82851;
        }
    </style>
</head>
<body>
<h1 id="zyy">标题1</h1>
<h1 class="style1">标题2</h1>
<h1 class="style1">标题3</h1>
<h1>标题4</h1>
<h1>标题5</h1>

</body>
</html>
```

**优先级：id > class > 标签**

# 06.层次选择器

> 后代选择器   ：在某个元素的后面     祖爷爷 爷爷 爸爸 你

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        /*后代选择器*/
        body p{
            background: #7cc813;
        }
    </style>
</head>
<body>
<p>p1</p>
<p>p2</p>
<p>p3</p>
<ul>
    <li><p>p4</p></li>
    <li><p>p5</p></li>
    <li><p>p6</p></li>
</ul>

</body>
</html>
```

> 子选择器：一代 儿子

```css
/*子选择器*/
body>p{
    background: #1954c8;
}
```

> 相邻兄弟选择器

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        /*相邻兄弟选择器，只有一个，相邻（向下）*/
        .active + p {
            background: #c81e14;
        }
    </style>
</head>
<body>
<p>p1</p>
<p class="active">p2</p>
<p>p3</p>
<ul>
    <li><p>p4</p></li>
    <li><p>p5</p></li>
    <li><p>p6</p></li>
</ul>
<p>p7</p>
<p class="active">p8</p>
<p>p9</p>

</body>
</html>
```

> 通用选择器

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        /*通用兄弟选择器，当前选中元素的向下的所有兄弟元素*/
        .active~p{
            background: #c818b8;
        }
    </style>
</head>
<body>
<p>p1</p>
<p class="active">p2</p>
<p>p3</p>
<ul>
    <li><p>p4</p></li>
    <li><p>p5</p></li>
    <li><p>p6</p></li>
</ul>
<p>p7</p>
<p>p8</p>
<p>p9</p>

</body>
</html>
```



# 07.结构伪类选择器

> 伪类：

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--不使用 class选择器  id选择器  的前提下-->
    <style>
        /*ul的第一个子元素*/
        ul li:first-child {
            background: #66c81e;
        }
        /*ul的最后个子元素*/
        ul li:last-child {
            background: #c82527;
        }
        /*
        选中p1  定位到父元素，选择当前的第一个元素 顺序
        选择当前p元素的父级元素，选中父级元素的第一个，并且是当前元素才生效！
        */
        p:nth-child(1) {
            background: #47c8bc;
        }

        /*选中父元素下的p元素的第二个，类型 */
        p:nth-of-type(2) {
            background: #356fc8;
        }
        
        /*鼠标悬停 */
        a:hover {
            background: #c8c557;
        }
    </style>
</head>
<body>
<p>p1</p>
<p>p2</p>
<p>p3</p>
<ul>
    <li>li1</li>
    <li>li2</li>
    <li>li3</li>
</ul>
<a>link</a>

</body>
</html>
```

![image-20210519171610311](https://s2.loli.net/2022/04/14/i3BGqCbZMsHg78h.png)

# 08.属性选择器（重要）

> id + class 结合

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        .demo a {
            float: left;
            display: block;
            height: 50px;
            width: 50px;
            border-radius: 10px;
            background: #c8843a;
            text-align: center;
            color: gainsboro;
            text-decoration: none;
            margin-right: 5px;
            font: bold 20px/50px Arial;
        }

        /*
        属性名;   属性名=属性值（正则）
        =   绝对等于
        *=  包含
        ^=  以这个开头
        $=  以这个结尾
        */

        /*
        存在id属性的元素
        a[]{}
        */
        /*a[id] {
            background: yellow;
        }*/
        /*a[id=first] {
            background: yellow;
        }*/

        /*class中有links的元素*/
        /*a[class *= "links"] {
            background: blue;
        }*/

        /**选中href中以http开头的元素**/
        /*a[href^=http] {
            background: blue;
        }*/

        a[href $= pdf] {
            background: blue;
        }
    </style>
</head>
<body>
<p class="demo">
    <a href="https://www.baidu.com" class="links item first" id="first">1</a>
    <a href="" class="links item active" target="_blank" title="test">2</a>
    <a href="img/123.html" class="links item">3</a>
    <a href="img/123.png" class="links item">4</a>
    <a href="img/123.jpg" class="links item">5</a>
    <a href="abc" class="links item">6</a>
    <a href="/a.pdf" class="links item">7</a>
    <a href="/abc.pdf" class="links item">8</a>
    <a href="abc.doc" class="links item">9</a>
    <a href="abcd.doc" class="links item last">10</a>
</p>

</body>
</html>
```

![image-20210519182556281](https://s2.loli.net/2022/04/14/R7GPanf1Njms2Xc.png)



# 09.css的作用及字体样式

> 为什么要美化网页

- 有效的传递页面信息
- 美化网页，页面漂亮，才能吸引用户
- 凸显页面的主题
- 提供用户的体验

> span标签：重点要突出的字，使用span标签套起来

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        #title1{
            font-size: 50px;
        }
    </style>
</head>
<body>
欢迎学习<span id="title1">java</span>
</body>
</html>
```

## 字体样式

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        /*
        font-family 字体
        font-size  字体大小
        font-weight  字体粗细
        color  字体颜色

        */
        body {
            font-family: 楷体;
            color: #39a239;
        }
        h1 {
            font-size: 50px;
        }
        .p1 {
            font-weight: bold;
        }
    </style>
</head>
<body>

<h1>故事介绍</h1>
<p class="p1">
    平静安详的元泱境界，每隔333年，总会有一个神秘而恐怖的异常生物重生，它就是魁拔！魁拔的每一次出现，都会给元泱境界带来巨大的灾难！即便是天界的神族，也在劫难逃。在天地两界各种力量的全力打击下，魁拔一次次被消灭，但又总是按333年的周期重新出现。魁拔纪元1664年，天神经过精确测算后，在魁拔苏醒前一刻对其进行毁灭性打击。但谁都没有想到，由于一个差错导致新一代魁拔成功地逃脱了致命一击。很快，天界魁拔司和地界神圣联盟均探测到了魁拔依然生还的迹象。因此，找到魁拔，彻底消灭魁拔，再一次成了各地热血勇士的终极目标。
</p>
<p>
    在偏远的兽国窝窝乡，蛮大人和蛮吉每天为取得象征成功和光荣的妖侠纹耀而刻苦修炼，却把他们生活的村庄搅得鸡犬不宁。村民们绞尽脑汁把他们赶走。一天，消灭魁拔的征兵令突然传到窝窝乡，村长趁机怂恿蛮大人和蛮吉从军参战。然而，在这个一切都凭纹耀说话的世界，仅凭蛮大人现有的一块冒牌纹耀，不要说参军，就连住店的资格都没有。受尽歧视的蛮吉和蛮大人决定，混上那艘即将启程去消灭魁拔的巨型战舰，直接挑战魁拔，用热血换取至高的荣誉。
</p>

<p>
    Let me not to the marriage of true mindsAdmit impediments. Love is not loveWhich alters when it alteration finds,Or bends with the remover to remove:
</p>
</body>
</html>
```

连着写

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        p{
            font: oblique lighter 16px "楷体" ;
        }
    </style>
</head>
<body>
<p>
    在偏远的兽国窝窝乡，蛮大人和蛮吉每天为取得象征成功和光荣的妖侠纹耀而刻苦修炼，却把他们生活的村庄搅得鸡犬不宁。村民们绞尽脑汁把他们赶走。一天，消灭魁拔的征兵令突然传到窝窝乡，村长趁机怂恿蛮大人和蛮吉从军参战。然而，在这个一切都凭纹耀说话的世界，仅凭蛮大人现有的一块冒牌纹耀，不要说参军，就连住店的资格都没有。受尽歧视的蛮吉和蛮大人决定，混上那艘即将启程去消灭魁拔的巨型战舰，直接挑战魁拔，用热血换取至高的荣誉。
</p>

</body>
</html>
```



# 10.文本样式

1. 颜色  color   rgb  rgba
2. 文本对齐方式  text-align: center
3. 首行缩进  text-indent: 2em
4. 行高  line-height: 300px
5. 装饰  text-decoration
6. 文本图片水平对齐  vertical-align: middle

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--
    颜色
      单词
      RGB 0~F
      RGBA  A:0~1

      text-align  排版，居中
      text-indent: 2em  段落首行缩进

      行高 和 块 的高度一致，就可以上下居中
            height: 300px;
            line-height: 300px;
    -->
    <style>

        h1 {
            color: rgba(0, 255, 255, 0.5);
            text-align: center;
        }

        .p1 {
            text-indent: 2em;
        }

        .p3 {
            background: #c8c557;
            height: 300px;
            line-height: 100px;
        }

        /*下划线*/
        .p11 {
            text-decoration: underline;
        }

        /*中划线  删除线*/
        .p12 {
            text-decoration: line-through;
        }

        /*上划线*/
        .p13 {
            text-decoration: overline;
        }
        /*超链接去下划线*/
        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
<h1>故事介绍</h1>
<p class="p1">
    平静安详的元泱境界，每隔333年，总会有一个神秘而恐怖的异常生物重生，它就是魁拔！魁拔的每一次出现，都会给元泱境界带来巨大的灾难！即便是天界的神族，也在劫难逃。在天地两界各种力量的全力打击下，魁拔一次次被消灭，但又总是按333年的周期重新出现。魁拔纪元1664年，天神经过精确测算后，在魁拔苏醒前一刻对其进行毁灭性打击。但谁都没有想到，由于一个差错导致新一代魁拔成功地逃脱了致命一击。很快，天界魁拔司和地界神圣联盟均探测到了魁拔依然生还的迹象。因此，找到魁拔，彻底消灭魁拔，再一次成了各地热血勇士的终极目标。
</p>
<p>
    在偏远的兽国窝窝乡，蛮大人和蛮吉每天为取得象征成功和光荣的妖侠纹耀而刻苦修炼，却把他们生活的村庄搅得鸡犬不宁。村民们绞尽脑汁把他们赶走。一天，消灭魁拔的征兵令突然传到窝窝乡，村长趁机怂恿蛮大人和蛮吉从军参战。然而，在这个一切都凭纹耀说话的世界，仅凭蛮大人现有的一块冒牌纹耀，不要说参军，就连住店的资格都没有。受尽歧视的蛮吉和蛮大人决定，混上那艘即将启程去消灭魁拔的巨型战舰，直接挑战魁拔，用热血换取至高的荣誉。
</p>
<p class="p3">
    Let me not to the marriage of true mindsAdmit impediments. Love is not loveWhich alters when it alteration finds,Or
    bends with the remover to remove:
</p>
<p class="p11">1231232</p>
<p class="p12">1231232</p>
<p class="p13">1231232</p>
<a>123</a>
</body>
</html>
```

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--
    水平对齐  参照物
    -->
    <style>
        img, span {
            vertical-align: middle;
        }
    </style>
</head>
<body>
<p>
    <img src="img/20210519215212.png" alt="">
    <span>123456</span>
</p>
</body>
</html>
```

# 11.文本阴影和超链接伪类

![image-20210520113455355](https://s2.loli.net/2022/04/14/8FhIrYBbOUCxD5M.png)

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        /*默认的颜色*/
        a{
            text-decoration: none;
            color: black;
        }
        /*鼠标悬停的状态 重点*/
        a:hover {
            color: #c82527;
        }
        /*鼠标按住未释放的状态*/
        a:active {
            color: #356fc8;
        }
        /*
        阴影：
        text-shadow  阴影颜色  水平偏移  垂直偏移  阴影半径
        */
        #price{
            text-shadow: #FF0000 5px 5px 2px;
        }
    </style>
</head>
<body>
<a>
    <img src="img/12.jpg"/>
</a>

<p>
    <a href="#">码出高效：Java开发手册</a>
</p>
<p>
    <a href="#">作者：孤尽老师</a>
</p>
<p id="price">
    <span>￥99</span>
</p>
</body>
</html>
```

# 12.列表样式练习

```css
/*
详情代码见下方
ul li

list-style
  none 去掉圆点
  circle 空心圆
  decimal 数字
  square 正方形
*/
ul li {
    height: 30px;
    list-style: none;
    text-indent: 1em;
}

```

# 13.背景图像应用及渐变

## 背景

背景颜色

背景图片

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        div {
            width: 1000px;
            height: 700px;
            border: 1px solid red;
            /*默认是全部平铺的*/
            background-image: url("img/12.jpg");
        }
        .div1 {
            background-repeat: repeat-x;
        }
        .div2 {
            background-repeat: repeat-y;
        }
        .div3 {
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
<div class="div1"></div>
<div class="div2"></div>
<div class="div3"></div>

</body>
</html>
```

**练习**

![image-20210520220831102](https://s2.loli.net/2022/04/14/NPAjuyvzi2CVH68.png)

```css
#nav {
    width: 300px;
    background: rgba(143,92,46,0.29);
}
.title2 {
    font-size: 18px;
    font-weight: bold;
    text-indent: 1em;
    line-height: 35px;
    /*颜色 图片 图片位置 平铺方式*/
    background: #4a6cc8 url("../img/下.png") 270px 5px no-repeat;
}

/*ul {
    background: rgba(143,92,46,0.29);
}*/
/*
ul li

list-style
  none 去掉圆点
  circle 空心圆
  decimal 数字
  square 正方形
*/
ul li {
    height: 30px;
    list-style: none;
    text-indent: 1em;
    background-image: url("../img/右.png");
    background-repeat: no-repeat;
    background-position: 230px -3px;
}

a {
    text-decoration: none;
    font-size: 14px;
    color: black;

}
a:hover {
    color: #9effff;
    text-decoration: underline;

}
```

## 渐变

渐变颜色网站[Grabient](https://www.grabient.com/)

```css
background-color: #4158D0;
background-image: linear-gradient(43deg, #4158D0 0%, #C850C0 46%, #FFCC70 100%);
```

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        body{
            /*background-color: #4158D0;*/
            background: linear-gradient(43deg, #4158D0 0%, #C850C0 46%, #FFCC70 100%);
        }
    </style>
</head>
<body>
</body>
</html>
```

# 14.盒子模型及边框使用

## 1.什么是盒子模型？



![image-20210521104640280](https://s2.loli.net/2022/04/14/ubrXPKcYvsxOahk.png)

margin ：外边距

padding : 内边距

border : 边框

## 2.边框

1. 边框的粗细
2. 边框的样式
3. 边框的颜色

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        /*body 总有一个默认的外边距margin  常见操作*/
        /*body {
            margin: 0px;
            padding: 0;
        }*/

        /*border 粗细 样式 颜色*/
        #box {
            width: 300px;
            border: 1px solid red;
        }
        h2{
            font-size: 16px;
            background-color: #adff70;
            line-height: 30px;
            color: white;
        }

        form {
            background: #adff70;
        }
        div:nth-of-type(1) input {
            border: 2px solid black;
        }
        div:nth-of-type(2) input {
            border: 2px dashed blue;
        }
        div:nth-of-type(3) input {
            border: 2px dashed yellow;
        }
    </style>
</head>
<body>
<div id="box">
    <h2>会员登录</h2>
    <form action="#">
        <div>
            <span>用户名：</span>
            <input type="text">
        </div>
        <div>
            <span>密码：</span>
            <input type="text">
        </div>
        <div>
            <span>邮箱：</span>
            <input type="text">
        </div>
    </form>

</div>

</body>
</html>
```



# 15.内外边距及div居中

## 内外边距

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        /*
        外边距的妙用：居中元素
        margin: 0 auto
        */
        #box {
            width: 300px;
            border: 1px solid red;
            margin: 0 auto;
        }
        /*
        顺时针旋转
        margin: 0px
        margin: 0px 1px
        margin: 0px 1px 2px 3px
        */
        h2{
            font-size: 16px;
            background-color: #adff70;
            line-height: 30px;
            color: white;
            margin: 0px;
        }

        form {
            background: #adff70;
        }
        input {
            border: 1px solid black;
        }
        div:nth-of-type(1) {
            padding: 2px 2px;
        }
    </style>
</head>
<body>
<div id="box">
    <h2>会员登录</h2>
    <form action="#">
        <div>
            <span>用户名：</span>
            <input type="text">
        </div>
        <div>
            <span>密码：</span>
            <input type="text">
        </div>
        <div>
            <span>邮箱：</span>
            <input type="text">
        </div>
    </form>

</div>

</body>
</html>
```

盒子的计算方式：你这个元素到底多大？

![image-20210521104640280](https://s2.loli.net/2022/04/14/ubrXPKcYvsxOahk.png)

margin + border + padding + 内容宽度

# 16.圆角边框及阴影和经验分享

## 圆角边框

4个角

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        /*
        圆角
        左上 右上 右下 左下  顺时针方向
        border-radius: 50px 50px 50px 50px;

        圆圈： 圆角 = 半径
        */
        div {
            width: 100px;
            height: 100px;
            border: 5px solid red;
            border-radius: 100px;
        }
    </style>
</head>
<body>
<div></div>

</body>
</html>
```

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        div:nth-of-type(1) {
            width: 100px;
            height: 50px;
            background: red;
            border-radius: 50px 50px 0px 0px;
        }
        div:nth-of-type(2) {
            width: 50px;
            height: 100px;
            background: red;
            border-radius: 50px 0px 0px 50px;
        }
        div:nth-of-type(3) {
            width: 50px;
            height: 50px;
            background: red;
            border-radius: 50px 0px 0px 0px;
        }
        img {
            border: 5px solid red;
            border-radius: 20px;
        }
    </style>
</head>
<body>
<div></div>
<div></div>
<div></div>
<img src="img/12.jpg" alt="">

</body>
</html>
```

## 阴影

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        div {
            width: 100px;
            height: 100px;
            border: 10px solid red;
            box-shadow: 10px 10px 100px yellow;
        }
    </style>
</head>
<body>
<div></div>

</body>
</html>
```



拓展(图片居中发光的效果)

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--
    margin: 0 auto;  居中
    要求：块元素，块元素有固定的宽度

    -->
    <style>
        img{
            border-radius: 16px;
            box-shadow: 10px 10px 100px yellow;
        }
    </style>
</head>
<body>
<div style="width: 500px; display: block; text-align: center">
    <img src="img/12.jpg" alt="">
</div>

</body>
</html>
```

# 17.display和浮动

标准文档流

块级元素

```
h1~h6
p
div
列表
...
```

行内元素（可以被包含在块级元素中，反之，则不可以）

```
span 
a
img
strong
...
```

## display

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        /*
        border 块元素
        inline 行内元素
        inline-block 是块元素，但是可以内联在一行
        none
        */
        div {
            width: 100px;
            height: 100px;
            border: 1px solid red;
            display: inline;

        }

        span {
            width: 100px;
            height: 100px;
            border: 1px solid red;
            display: inline-block;
        }
    </style>
</head>
<body>
<div>块元素</div>
<span>行内元素</span>

</body>
</html>
```

这压实一种实现行内元素排列的方式，但是我们很多情况都是用的float

## float

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        div {
            margin: 10px;
            padding: 5px;
        }
        #father {
            border: 1px #000000 solid;
        }
        .layer01 {
            border: 1px red dashed;
            display: inline-block;
            float: left;
        }
        .layer02 {
            border: 1px blue dashed;
            display: inline-block;
            float: left;
        }
        .layer03 {
            border: 1px #c818b8 dashed;
            display: inline-block;
            float: left;
            clear: both;
        }
        .layer04 {
            border: 1px black dashed;
            font-size: 12px;
            line-height: 23px;
            display: inline-block;
            float: left;
            clear: both;
        }
    </style>
</head>
<body>
<div id="father">
    <div class="layer01">
        <img src="img/12.jpg"/>
    </div>
    <div class="layer02">
        <img src="img/background.png"/>
    </div>
    <div class="layer03">
        <img src="img/l-icon.png"/>
    </div>
    <div class="layer04">
        <span>但是还是饭还是父接口恒大华府接口和四大皆空合适的话发</span>
    </div>
</div>

</body>
</html>
```

# 18.overflow及父级边框塌陷问题

## 父级边框塌陷问题

clear

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        div {
            margin: 10px;
            padding: 5px;
        }
        #father {
            border: 1px #000000 solid;
        }
        .layer01 {
            border: 1px red dashed;
            display: inline-block;
            float: left;
        }
        .layer02 {
            border: 1px blue dashed;
            display: inline-block;
            float: left;
        }
        .layer03 {
            border: 1px #c818b8 dashed;
            display: inline-block;
            float: left;
            clear: both;
        }
        /*
        clear: right;  右侧不允许有浮动元素
        clear: left;   左侧不允许有浮动元素
        clear: both;   两侧不允许有浮动元素
        clear: none;
        */
        .layer04 {
            border: 1px black dashed;
            font-size: 12px;
            line-height: 23px;
            display: inline-block;
            float: left;
            clear: both;
        }
    </style>
</head>
<body>
<div id="father">
    <div class="layer01">
        <img src="img/12.jpg"/>
    </div>
    <div class="layer02">
        <img src="img/background.png"/>
    </div>
    <div class="layer03">
        <img src="img/l-icon.png"/>
    </div>
    <div class="layer04">
        <span>但是还是饭还是父接口恒大华府接口和四大皆空合适的话发</span>
    </div>
</div>

</body>
</html>
```

解决方案：

1. 增加父级元素的高度

   ```css
   #father {
       border: 1px #000000 solid;
       /*height: 800px;*/
   }
   ```

2. 增加一个空的div标签，清除浮动

   ```html
   <!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <title>Title</title>
       <style>
           div {
               margin: 10px;
               padding: 5px;
           }
           #father {
               border: 1px #000000 solid;
               /*height: 800px;*/
           }
           .layer01 {
               border: 1px red dashed;
               display: inline-block;
               float: left;
           }
           .layer02 {
               border: 1px blue dashed;
               display: inline-block;
               float: left;
           }
           .layer03 {
               border: 1px #c818b8 dashed;
               display: inline-block;
               float: left;
           }
           /*
           clear: right;  右侧不允许有浮动元素
           clear: left;   左侧不允许有浮动元素
           clear: both;   两侧不允许有浮动元素
           clear: none;
           */
           .layer04 {
               border: 1px black dashed;
               font-size: 12px;
               line-height: 23px;
               display: inline-block;
               float: left;
           }
           .clear {
               clear: both;
               margin: 0;
               padding: 0;
           }
       </style>
   </head>
   <body>
   <div id="father">
       <div class="layer01">
           <img src="img/12.jpg"/>
       </div>
       <div class="layer02">
           <img src="img/background.png"/>
       </div>
       <div class="layer03">
           <img src="img/l-icon.png"/>
       </div>
       <div class="layer04">
           <span>但是还是饭还是父接口恒大华府接口和四大皆空合适的话发</span>
       </div>
       <div class="clear"></div>
   </div>
   
   </body>
   </html>
   ```

   

3. overflow

   在父级元素中增加一个overflow: hidden;

   ```html
   <!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <title>Title</title>
       <style>
           div {
               margin: 10px;
               padding: 5px;
           }
           #father {
               border: 1px #000000 solid;
               overflow: hidden;
           }
           .layer01 {
               border: 1px red dashed;
               display: inline-block;
               float: left;
           }
           .layer02 {
               border: 1px blue dashed;
               display: inline-block;
               float: left;
           }
           .layer03 {
               border: 1px #c818b8 dashed;
               display: inline-block;
               float: left;
           }
           .layer04 {
               border: 1px black dashed;
               font-size: 12px;
               line-height: 23px;
               display: inline-block;
               float: left;
           }
       </style>
   </head>
   <body>
   <div id="father">
       <div class="layer01">
           <img src="img/12.jpg"/>
       </div>
       <div class="layer02">
           <img src="img/background.png"/>
       </div>
       <div class="layer03">
           <img src="img/l-icon.png"/>
       </div>
       <div class="layer04">
           <span>但是还是饭还是父接口恒大华府接口和四大皆空合适的话发</span>
       </div>
   </div>
   
   </body>
   </html>
   ```

   拓展：

   ```html
   <!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <title>Title</title>
       <style>
           #content {
               width: 200px;
               height: 150px;
               overflow: scroll;
           }
       </style>
   </head>
   <body>
   <div id="content">
       <img src="img/background.png" alt=""/>
       <p>的交付还是得接口返回决胜巅峰激活激活就开始电话费就开始电话费还是得空间和防范宏伟㔷</p>
   </div>
   
   </body>
   </html>
   ```

   

4. 父类添加一个伪类：after

   ```html
   <!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <title>Title</title>
       <style>
           div {
               margin: 10px;
               padding: 5px;
           }
           #father {
               border: 1px #000000 solid;
           }
           #father:after {
               content: '';
               display: block;
               clear: both;
           }
           .layer01 {
               border: 1px red dashed;
               display: inline-block;
               float: left;
           }
           .layer02 {
               border: 1px blue dashed;
               display: inline-block;
               float: left;
           }
           .layer03 {
               border: 1px #c818b8 dashed;
               display: inline-block;
               float: left;
           }
           .layer04 {
               border: 1px black dashed;
               font-size: 12px;
               line-height: 23px;
               display: inline-block;
               float: left;
           }
       </style>
   </head>
   <body>
   <div id="father">
       <div class="layer01">
           <img src="img/12.jpg"/>
       </div>
       <div class="layer02">
           <img src="img/background.png"/>
       </div>
       <div class="layer03">
           <img src="img/l-icon.png"/>
       </div>
       <div class="layer04">
           <span>但是还是饭还是父接口恒大华府接口和四大皆空合适的话发</span>
       </div>
   </div>
   
   </body>
   </html>
   ```



小结;

1. 浮动元素后面增加空div

   简单，代码中尽量避免空div

2. 设置父元素的高度

   简单，元素设置了固定的高度，就会被限制

3. overflow

   简单。下拉的一些场景避免使用

4. 父类添加一个伪类：after（推荐）

   写法稍微复杂一点，但是没有副作用，推荐使用！



## 对比

- display 

  方向不可以控制

- float

  浮动起来的话，会脱离标准文档流，所以需要解决父级边框塌陷的问题



# 19.相对定位的使用和练习



相对定位：position:relative;

相对于原来的位置，进行指定的偏移，相对定位的话，它任然在标准文档流中，原来的位置会被保留

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        body {
            padding: 20px;
        }

        /*
        相对定位  上下左右
        相对于自己原来的位置进行偏移



        */
        div {
            margin: 10px;
            padding: 5px;
            font-size: 12px;
            line-height: 25px;
        }

        #father {
            border: 1px solid #c818b8;
            padding: 0px;
        }

        #first {
            background-color: #adff70;
            border: 1px dashed #356fc8;
            position: relative;
            top: -20px;
            left: 20px;
        }

        #second {
            background-color: #39a239;
            border: 1px dashed #adff70;
        }

        #third {
            background-color: #47c8bc;
            border: 1px dashed #2a37c8;
            position: relative;
            bottom: -10px;
            right: 20px;
        }
    </style>
</head>
<body>
<div id="father">
    <div id="first">第一个盒子</div>
    <div id="second">第二个盒子</div>
    <div id="third">第三个盒子</div>
</div>

</body>
</html>
```



# 20.方块定位练习讲解

![image-20210523115913174](https://s2.loli.net/2022/04/14/NymdZeRHEKatXrh.png)

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        #farther {
            width: 300px;
            height: 300px;
            padding: 10px;
            border: 1px solid red;
        }

        a {
            width: 100px;
            height: 100px;
            text-decoration: none;
            background: #c818b8;
            line-height: 100px;
            text-align: center;
            color: white;
            display: block;
        }

        a:hover {
            background: blue;
        }

        #a2, #a4 {
            position: relative;
            right: -200px;
            top: -100px;
        }

        #a5 {
            position: relative;
            right: -100px;
            top: -300px;
        }
    </style>
</head>
<body>
<div id="farther">
    <a id="a1">链接1</a>
    <a id="a2">链接2</a>
    <a id="a3">链接3</a>
    <a id="a4">链接4</a>
    <a id="a5">链接5</a>
</div>
</body>
</html>
```



# 21.绝对定位和固定定位

## 绝对定位

定位：基于XXX定位，上下左右~

1. 没有父级元素定位的前提下，相对于浏览器定位
2. 假设父级元素存在定位，我们通常会相对于父级元素进行偏移~
3. 在父级元素范围内移动

相对于父级或者浏览器的位置，进行指定的偏移，绝对定位的话，它不在标准文档流中，原来的位置不会被保留

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        body {
            padding: 20px;
        }
        div {
            margin: 10px;
            padding: 5px;
            font-size: 12px;
            line-height: 25px;
        }

        #father {
            border: 1px solid #c818b8;
            padding: 0px;
            position: relative;
        }

        #first {
            background-color: #adff70;
            border: 1px dashed #356fc8;
        }

        #second {
            background-color: #39a239;
            border: 1px dashed #adff70;
            position: absolute;
            right: 30px;
        }

        #third {
            background-color: #47c8bc;
            border: 1px dashed #2a37c8;
        }
    </style>
</head>
<body>
<div id="father">
    <div id="first">第一个盒子</div>
    <div id="second">第二个盒子</div>
    <div id="third">第三个盒子</div>
</div>

</body>
</html>
```

## 固定定位

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        body {
            height: 1000px;
        }
        div:nth-of-type(1) {
            height: 100px;
            width: 100px;
            background: #c818b8;
            position: absolute;
            top: 0px;
            right: 0px;
        }
        div:nth-of-type(2) {
            height: 50px;
            width: 50px;
            background: #39a239;
            position: fixed;
            top: 0px;
            right: 0px;
        }
    </style>
</head>
<body>
<div id="div1"></div>
<div id="div2"></div>

</body>
</html>
```



# 22.z-index及透明度

![image-20210523151303488](https://s2.loli.net/2022/04/14/wkB1vteQ3r97pYN.png)

图层：

z-indx:默认是0 最高无限 999

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div id="content">
    <ul>
        <li><img src="img/background.png"/></li>
        <li class="tipText">学习</li>
        <li class="tipBg"></li>
        <li>时间：2021-5-23</li>
        <li>地点：深圳</li>
    </ul>
</div>

</body>
</html>
```

css

```css
#content {
    width: 1100px;
    padding: 0px;
    margin: 0px;
    font-size: 12px;
    line-height: 25px;
    border: 1px black solid;
}

ul li{
    padding: 0px;
    margin: 0px;
    list-style: none;
}

#content ul {
    position: relative;
}

.tipText, .tipBg {
    position: absolute;
    width: 990px;
    height: 31px;
    top: 445px;
}
.tipText {
    color: wheat;
    z-index: 1;
}
.tipBg {
    background: black;
    /*背景透明度*/
    opacity: 0.5;
    /*filter:alpha(opacity=50);*/
}

```



# 23.动画及视野拓展

# 24.css小结



