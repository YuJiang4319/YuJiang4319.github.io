---
title: JavaScript基础
date: 2023-08-08 17:51:38
tags:
  - JavaScript
categories:	
  - Program
description: JavaScript基础
---

# 01、聊聊JavaScript这个东西

## 1、概述

JavaScript是一门世界上最流行的脚本语言



==一个合格的后端人员，必须要精通JavaScript==

## 2、历史

**ECMAScript**可以理解为JavaScript的一个标准

最新版本已经到es6

但是大部分浏览器还只停留在支持es5代码上

开发环境~线上环境，版本不一致



# 02、基本使用及HelloWorld

## 1、引入JavaScript

1. 内部标签

   ```javascript
   <script>
       alert('hello,world')
   </script>
   ```

   

2. 外部引入

   我的第一个JavaScript程序.html

   ```html
   <!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <title>Title</title>
       <!--script标签内，写javaScript代码-->
   
       <!--<script>
           alert('hello,world')
       </script>-->
   
       <!--外部引入-->
       <!--注意：script标签必须成对出现-->
       <script src="js/qj.js"></script>
   
       <!--不用显示定义type,也默认就是JavaScript-->
       <script type="text/javascript"></script>
   
   </head>
   <body>
   
   </body>
   </html>
   ```

   qj.js

   ```java
   alert('hello world');
   ```

   

# 03、浏览器控制台使用

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--javascript严格区分大小写-->
    <script>
        //1. 定义变量  (变量类型  变量名 = 变量值;)
        var score = 1;
        // alert(num);
        //2. 条件控制
        if (score>60 && score<70) {
            alert("60~70");
        } else if(score>70 && score<80) {
            alert("70~80");
        } else {
            alert("other");
        }
        //console.log(score); 在浏览器的控制台打印变量  相当于System.out.println();
    </script>
</head>
<body>

</body>
</html>
```

![image-20210525220557102](https://s2.loli.net/2022/04/14/2UjIgdN3Rh4SMFJ.png)

调试（打断点）

![image-20210525220255060](https://s2.loli.net/2022/04/14/2SutieDGopyUNvP.png)

# 04、数据类型快速浏览

==变量==

```javascript
var 变量名
```



==number==

js不区分小数和整数，number

```javascript
123  //整数
123.1  //浮点数
1.123e3 //科学计数法
-99 //负数
NaN // not a number
Infinity  //表示无限大
```

==字符串==

‘abc’

"abc"

==布尔值==

true 

false

==逻辑运算==

```
&&  //两个都是真，结果为真
||  //一个为真，结果为真 
!   //真即假，假即真
```

==比较运算符==

```
= 赋值，不是比较运算符
== 等于（类型不一样，值一样，也会判断为true）
=== 绝对等于（类型一样，值一样，结果true）
```

这是一个js的缺陷，坚持不要使用==比较

注意：

- NaN===NaN，结果为false,这个与所有的数值都不相等，包括自己
- 只能通过isNaN(NaN)来判断这个数是否是NaN



浮点数问题

```
console.log((1/3)===(1-2/3))
结果为false
```

尽量避免使用浮点数进行运算，存在精度问题

```
console.log(Math.abs((1/3)-(1-2/3))<0.00000000001)
结果为true,可以用这种方式运算
```



==null和undefined==

- null 空
- undefined 未定义



==数组==

java的数值必须是相同的类型的对象，js中不需要这样

```javascript
//保证代码的可读性，尽量使用 [] 定义
var arr = [12,3,'hello',null, true];

new Array(1,2,3,'hello',null, true);
```

取数据下标，如果越界了，就会`undefined`



==对象==

对象是大括号，数组是中括号

> 每个属性之间使用逗号隔开，最后一个不需要添加

```javascript
var person = {
            name : 'zyy', 
            age : 18, 
            tags : ['java', 'css']}
```

取对象的值

```
person.age
18
```



# 05、严格检查模式strict

![image-20210529094415451](https://s2.loli.net/2022/04/14/pyYwEf2dIb4mOW5.png)

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--
    前提：idea需要设置支持es6的语法
    use strict  严格校验模式，预防JavaScript的随意性导致产生的一些问题
    必须写在JavaScript的第一行
    局部变量建议都使用let去定义
    -->
    <script>
        'use strict'
        //Uncaught ReferenceError: j is not defined
        // j = 1;

        //全局变量
        // var i = 1;
        //局部变量
        let i = 1;
    </script>
</head>
<body>
</body>
</html>
```



# 06、字符串类型详解

1. 正常字符串使用单引号或者双引号包裹

2. 注意转义字符\

   ```
   \'
   \n
   \t
   \u4e2d    \u####  unicode字符
   \x41     Ascll字符
   ```

3. 多行字符串编写

   ```javascript
   let msg = `
   hello
   nihao
   zyy
   `
   ```

4. 模板字符串

   ```javascript
   let name = "zyy";
   let msg = `hello ${name}`;
   console.log(msg); //hello zyy
   ```

5. 字符串长度

   ```javascript
   let str = "student";
   console.log(str.length); // 7
   ```

6. 字符串的可变性，不可变

   ![image-20210529104350256](https://s2.loli.net/2022/04/14/ZnkaoV3puKdmCOQ.png)

7. 大小写转换

   ```javascript
   //注意，这里是防范，不是属性  str = "student"
   str.toUpperCase() //STUDENT
   str.toLowerCase() //student
   ```

8. 找字符的对应字符串中的下标

   ```javascript
   //str = "student"
   console.log(str.indexOf('s')) //0
   ```

9. 截取字符串

   ```javascript
   // [)  str = "student"
   console.log(str.substring(0)) //student
   console.log(str.substring(1))  //tudent
   console.log(str.substring(1,2)) //t
   ```

# 07、数组类型详解

Array可以包含任意的数据类型

![image-20210529105856977](https://s2.loli.net/2022/04/14/doQH5XBlsw6ra7N.png)

1. 长度

   ```javascript
   //arr = [1, 2, 3, 4, "1", "5"]
   arr.length //6
   ```

   注意：假如给arr.length赋值,数组大小就会变化，如果赋值过小，元素就会丢失

2. 通过元素获得下标索引

   ```javascript
   //arr = [1, 2, 3, 4, "1", "5"]
   arr.indexOf(1) //0
   arr.indexOf("1") //4
   ```

   字符串“1”和数字1是不同的

3. slice()  截取Array的一部分，返回一个新的数组，类似于string的substring

   ```javascript
   //arr = [1, 2, 3, 4, "1", "5"]
   arr.slice(1,3) //[2, 3]
   ```

4. push()  pop() 尾部

   ```javascript
   //push  压入到尾部
   //pop  弹出尾部的一个元素
   //arr = [1, 2, 3, 4, "1", "5"]
   arr.push(6) //[1, 2, 3, 4, "1", "5", 6]
   arr.pop() // [1, 2, 3, 4, "1", "5"]
   ```

5. unshift()  shift() 头部

   ```javascript
   //unshift 压入到头部
   //shift 弹出头部的一个元素
   //arr = [1, 2, 3, 4, "1", "5"]
   arr.unshift(0) //[0, 1, 2, 3, 4, "1", "5"]
   arr.shift() //[1, 2, 3, 4, "1", "5"]
   ```

6. 排序sort()

   ```javascript
   //arr = [4, 3, 2, 1]
   arr.sort() //[1, 2, 3, 4]
   ```

7. 元素反转 reverse()

   ```javascript
   //arr = [1, 2, 3, 4]
   arr.reverse() //[4, 3, 2, 1]
   ```

8. concat()

   并没有修改原数组，只是返回一个新的数组

   ```javascript
   //arr = [4, 3, 2, 1]
   arr.concat(6,7)//[4, 3, 2, 1, 6, 7]
   arr//[4, 3, 2, 1]
   ```

9. 连接符join

   打印拼接数组，使用特定的字符串连接

   ```javascript
   //arr = [4, 3, 2, 1]
   arr.join(',')//"4,3,2,1"
   arr //[4, 3, 2, 1]
   ```

10. 多维数组

    ```javascript
    arr2 = [[1,2],[3,4]]
    arr2[0][0]//1
    ```

数组：存储数据（如何存，如何取，方法都可以自己实现！）

# 08、对象类型详解

若干个键值对

```java
let 对象名 = {
    属性名: 属性值,
    属性名: 属性值,
    属性名: 属性值
}

//定义了一个person对象，他有三个属性
let person = {
    name: "zyy",
    age: 18,
    sex: "男"
}
```

js中对象，{...}表示一个对象，键值对描述属性xxx:xxx,多个属性之间用逗号分隔，最后一个属性不加逗号

JavaScript中的所有的键都是字符串，值是任意对象

1. 对象赋值

   ```javascript
   //person = {name: "zyy", age: 18, sex: "男"}
   person.age = 20 //person = {name: "zyy", age: 20, sex: "男"}
   ```

2. 使用一个不存在的对象属性，不会报错！undefined

   ```javascript
   //person = {name: "zyy", age: 18, sex: "男"}
   person.haha //undefined
   ```

3. 动态的删减属性

   ```javascript
   //person = {name: "zyy", age: 18, sex: "男"}
   delete person.sex //person = {name: "zyy", age: 20}
   ```

4. 动态的添加,直接给新的属性添加值即可

   ```javascript
   //person = {name: "zyy", age: 20}
   person.sex = "男" //person = {name: "zyy", age: 18, sex: "男"}
   ```

5. 判断属性值是否在这个对象中  xxx in xxx 

   ```javascript
   //person = {name: "zyy", age: 18, sex: "男"}
   "name" in person //true
   'toString' in person // true
   'hah' in person //false
   ```

6. 判断一个属性是由是这个对象自身拥有的

   ```javascript
   //person = {name: "zyy", age: 18, sex: "男"}
   person.hasOwnProperty('toString') //false
   person.hasOwnProperty('name') // true
   ```


# 09、分支和循环详解

if判断

```javascript
let age = 3;
if (age < 3) {
    console.log('kuwa~')
} else if (age < 18) {
    console.log('haha')
} else {
    console.log('a')
}
```

while循环，避免程序死循环

```javascript
let age = 3;
while (age < 100) {
    age = age + 1;
    console.log(age)
}


do {
    age = age + 1;
    console.log(age)
} while (age < 100)
```

for循环

```javascript
let age = 3;
for (let i = 0; i < 100; i++) {
    age = age + 1;
    console.log(age)
}
```

forEach循环

```javascript
let arr = [1,2,3,4,5,6,7];
arr.forEach(function (value) {
    console.log(value)
});
```

for...in

```javascript
let arr = [1,2,3,4,5,6,7];
for(let num in arr) {
    console.log(arr[num])
}
```

for...of

```javascript
let arr = [3,4,5];
for(let i of arr) {
    console.log(i)
}
```

# 10、Map和Set集合

> es6的新特性

Map

```javascript
let map = new Map([['张三',100],['李四',90],['王五',80]]);
map.get('张三');  //通过key获取value
map.set('赵六',99); //新增或者修改
map.delete('王五'); //删除
map.clear; //清空
```

Set:无序不重复的集合

```javascript
let set = new Set([1,2,3,1,1]);
set.add(1); //{1, 2, 3} 添加
set.add(4);//{1, 2, 3, 4}
set.delete(1);//{2, 3, 4}  删除
set.has(5);//false  是否包含某个元素
set.has(2);//true
```

# 11、Iterable迭代器

遍历数组

```javascript
let arr = [3,4,5];
for(let i of arr) {
    console.log(i)
}
```

遍历Map

```javascript
let map = new Map([['张三',100],['李四',90],['王五',80]]);
for (let i of map) {
    console.log(i);
}
```

遍历Set

```javascript
let set = new Set([1,2,3,4]);
for (let i of set) {
    console.log(i)
}
```

# 12、函数的定义和参数获取

## 定义函数

> 定义方式一

绝对值函数

```javascript
function abs(x) {
    if (x >= 0) {
        return x;
    } else {
        return -x;
    }
}
```

一旦执行到return代表函数结束，返回结果！

如果没有执行return，函数执行完也会返回结果，结果就是undefined

> 定义方式二

```javascript
let abs = function(x) {
    if (x >= 0) {
        return x;
    } else {
        return -x;
    }
}
```

function(x){...}这是一个匿名函数，但是可以把结果赋值给abs，通过abs就可以调用函数！

方式一和方式二等价

> 调用函数

```javascript
abs(10); //10
abs(-10);//10
```

参数问题：JavaScript可以传任意个参数，也可以不传参数~

参数进来是否存在问题?假设不存在参数，如何规避

```javascript
let abs = function(x) {
    //手动抛出异常
    if (typeof x !== 'number') {
        throw 'not a number'
    }
    if (x >= 0) {
        return x;
    } else {
        return -x;
    }
}
```

> arguments

==arguments是一个js免费赠送的关键字==

代表，传递进来的所有的参数，是一个数组！

```javascript
let abs = function(x) {
    //手动抛出异常
    if (typeof x !== 'number') {
        throw 'not a number'
    }
    for (let i = 0; i < arguments.length; i++) {
        console.log(arguments[i])
    }
    if (x >= 0) {
        return x;
    } else {
        return -x;
    }
}
```

问题：arguments包含所有的参数，我们有时候想使用多余的参数来进行附加操作，需要排除已有参数。

> rest

以前

```javascript
let fun = function(a,b) {
    for (let i = 2; i < arguments.length; i++) {
        //...
    }
}
```

es6引入的新特性，获取除了已经定义的参数之外的所有参数~

```javascript
let fun = function(a,b,...rest) {
    console.log(a);
    console.log(b);
    console.log(rest);
}
```

rest参数只能写在最后，必须用...标识。

# 13、变量的作用域、let、const详解

在JavaScript中，var定义变量实际是有作用域的

假设在函数体中声明，则在函数体外不可以使用（非要想实现的话，后面可以研究一下`闭包`）

```javascript
function f() {
    var x = 1;
    x = x + 1;
}
//Uncaught ReferenceError: x is not defined
x = x + 2;
```

如果两个函数使用相同的变量名，只要在函数内部，就不冲突

```javascript
function f() {
    var x = 1;
    x = x + 1;
}
function f2() {
    var x = 2;
    x = x + 2;
}
```

内部函数可以访问外部函数的成员，反之则不行

```javascript
function f() {
    var x = 2;

    function ff() {
        var y = x + 1;
    }

    //Uncaught ReferenceError: y is not defined
    var z = y + 1;
}
```

假设，内部函数变量和外部函数的变量重名

```javascript
function f() {
    var x = 2;

    function ff() {
        var x = 'a';
        console.log('inner' + x);//innera
    }

    console.log('outer' + x);//outer2
    ff();
}

f();
```

假设JavaScript中函数查找变量从自身函数开始，**由内向外**查找，假设外部存在这个同名的函数变量，则内部函数会屏蔽外部函数的变量。



提升变量的作用域

```javascript
function f() {
    var x = 'x' + y;
    //xundefined
    console.log(x);
    var y = 'y';
}
f();
```

结果：xundefined

说明：js执行引擎，自动提升了y的声明，但是不会提升变量y的赋值

```javascript
function f() {
    var y;
    var x = 'x' + y;
    //xundefined
    console.log(x);
    y = 'y';
}
f();
```

这个是在JavaScript建立之初就存在的特性，养成规范，不要乱放，便于代码维护

```javascript
function f() {
    var x = 1,
        y = x + 1,
        z;//undefined
    //之后用
}
```



> 全局函数

```javascript
//全局变量
var x = 1;
function f() {
    console.log(x)
}
console.log(x)
f();
```

全局对象window

```javascript
//全局变量
var x = 1;
alert(x);
alert(window.x);//默认所有的全局变量，都会自动绑定在window对象下
```

alter()这个函数本身也是一个`window`变量

```javascript
//全局变量
var x = 1;
window.alert(x);
var old_alter = window.alert;
old_alter('2');
window.alert = function () {

}
//alert失效了
window.alert('3');
window.alert = old_alter;
//alert恢复了
window.alert('4');
```

JavaScript实际上只有一个全局作用域，任何变量（函数也可以视为变量），假设没有在函数作用范围内找到，就会向外查找。如果在全局作用域都没有找到，报错`ReferenceError`

> 规范

由于我们所有的全局变量都会绑定到我们的window上，如果不同的js文件，使用了相同的全局变量，冲突 --》如何能减少冲突？

```javascript
//唯一全局变量
var zyy = {};

//定义全局变量
zyy.name = '张三';
zyy.add = function (a,b) {
    return a + b;
}
```

把自己的代码全部放入自己定义的唯一空间名字中，降低全局命名冲突的问题~



> 局部作用域

```javascript
function f() {
    for (var i = 0; i < 10; i++) {
        console.log(i);
    }
    console.log(i+1);//问题，1出了这个作用域还可以使用
}
```

es6 let关键字，解决局部作用域冲突问题！

```javascript
function f() {
    for (let i = 0; i < 10; i++) {
        console.log(i);
    }
    console.log(i+1);//Uncaught ReferenceError: i is not defined
}
```

建议都使用let去定义局部作用域

> 常量 const

在es6之前，怎么定义常量：只要用全部大写字母命名的变量就是常量，建议不要修改这样值

```javascript
var PI = '3.14'
console.log(PI);
PI = '3';//可以改变这个值
console.log(PI);
```

在es6引入常量关键字`const`

```javascript
const PI = '3.14' //只读变量
console.log(PI);
PI = '3';//Uncaught TypeError: Assignment to constant variable.
```

# 14、方法的定义和调用、apply

> 定义方法

方法就是把函数放到对象的里面，对象只有两个东西：属性和方法

```javascript
let zyy = {
    name: '张三',
    birth: 1993,
    age: function () {
        let now = new Date().getFullYear();
        return now - this.birth;
    }
}
//属性
zyy.birth;
//方法，一定要带()
zyy.age();
```

this代表什么?拆开上面的代码看看

```javascript
function getAge() {
    let now = new Date().getFullYear();
    return now - this.birth;
}

let zyy = {
    name: '张三',
    birth: 1993,
    age: getAge
}
//zyy.age()  可以调用
//getAge()  NaN
```

this是无法指向的，是默认指向调用它的那个对象。

> apply

在js中可以控制this指向

```javascript
function getAge() {
    let now = new Date().getFullYear();
    return now - this.birth;
};

let zyy = {
    name: '张三',
    birth: 1993,
    age: getAge
};
//zyy.age()  可以调用
//getAge()  NaN
//getAge.apply(zyy, []);//this 指向了zyy,参数为空
```

# 15、Date日期对象

> 标准对象

```javascript
typeof 123
"number"
typeof '12'
"string"
typeof true
"boolean"
typeof NaN
"number"
typeof []
"object"
typeof {}
"object"
typeof Math.abs
"function"
typeof undefined
"undefined"
```

基本使用

```javascript
let now = new Date();//Sun May 30 2021 21:45:07 GMT+0800 (中国标准时间)
now.getFullYear();//年 2021
now.getMonth();//月 0-11
now.getDate();//日
now.getDay();//星期几  0-6 0：星期天
now.getHours();//时
now.getMinutes();//分
now.getSeconds();//秒
now.getTime();//时间戳 全世界统一 1970 1.1 00:00:00 毫秒数

console.log(new Date(1622382307167));//时间戳转为时间
```

转换

```javascript
now = new Date();
Sun May 30 2021 21:52:22 GMT+0800 (中国标准时间)
now.toLocaleString() //注意，调用的是一个方法，不是一个属性
"2021/5/30下午9:52:22"
now.toGMTString()
"Sun, 30 May 2021 13:52:22 GMT"
```

# 16、JSON对象

> json是什么？

- [JSON](https://baike.baidu.com/item/JSON)([JavaScript](https://baike.baidu.com/item/JavaScript) Object Notation, JS 对象简谱) 是一种轻量级的数据交换格式。
- 简洁和清晰的层次结构使得 JSON 成为理想的数据交换语言。 
- 易于人阅读和编写，同时也易于机器解析和生成，并有效地提升网络传输效率。

早起，所有的数据传输习惯使用xml文件。

在JavaScript一切皆为对象，任务js支持的类型都可以用json来表示

格式：

- 对象都用{}
- 数据都用[]
- 所有的键值对都是用key:value



json字符串和js对象的转化

```javascript
let user = {
    name: "zyy",
    age: 18,
    sex: "男"
}

//对象转化为json字符串  "{\"name\":\"zyy\",\"age\":18,\"sex\":\"男\"}"
let jsonUser = JSON.stringify(user)

//json字符串转化为对象 参数为json字符串
let obj = JSON.parse("{\"name\":\"zyy\",\"age\":18,\"sex\":\"男\"}");
```

很多人搞不清楚，json和js对象的区别

```javascript
let obj = {a:'a',b:'b'};
let json = {"a":"a","b":"b"};
```

## Ajax

- 原生的js写法  xhr异步请求
- jQuery封装好的方法 ${"#name"}.ajax("")
- axios请求

# 17、面向对象原型继承

> 什么是面向对象

JavaScript、java、C#  面向对象：JavaScript有些区别

类：模板

对象：具体的实例

在JavaScript这个需要大家换一下思维方式

原型：

```javascript
let student = {
    run: function () {
        console.log(this.name + "run...");
    }
}

let xiaoming = {
    name: "小明"
}

let bird = {
    fly: function () {
        console.log(this.name + "fly...");
    }
}

//小明的原型是student
xiaoming.__proto__ = student;
```

# 18、面向对象class继承

> class继承

```javascript
function student(name) {
    this.name = name;
}

//给student新增一个方法
student.prototype.hello = function () {
    alert('hello');
}
```

`class`关键字，是es6引入的

1. 定义一个类：属性，方法

```javascript
//定义一个学生的类
class student {
    constructor(name) {
        this.name = name;
    }

    hello() {
        alert('hello')
    }
}

let xiaoming = new student('小明');
let xiaohong = new student('小红');
xiaoming.hello();
```

2. 继承

```javascript
class student {
    constructor(name) {
        this.name = name;
    }

    hello() {
        alert('hello')
    }
}

let xiaoming = new student('小明');
let xiaohong = new student('小红');

class xiaoStudent extends student {
    constructor(name, grade) {
        super(name);
        this.grade = grade;
    }

    myGrade() {
        alert('我是小学生')
    }
}


let xiaoxiao = new xiaoStudent('小小',1);
```

本质：查看对象原型

![image-20210530223627271](https://s2.loli.net/2022/04/14/wkLfQ7ihgbr3Uxz.png)

> 原型链

`__proto__`

![image-20210530224017333](https://s2.loli.net/2022/04/14/gznL1HIpZJRGWvj.png)



# 19、操作BOM对象（重点）

> 浏览器介绍

JavaScript和浏览器关系？

JavaScript诞生就是为了能够让他在浏览器中运行！

BOM:浏览器对象模型

**浏览器**

- IE
- Chrome
- Safari
- Firefox

**三方**

- QQ浏览器
- 360浏览器

> window （重点）

window代表浏览器窗口

```javascript
window.alert(1)
undefined
window.innerHeight
936
window.innerWidth
150
window.outerHeight
1056

//可以调整浏览器窗口试试
```

> Navigator （不建议使用）

Navigator封装了浏览器的信息

```javascript
navigator.appName
"Netscape"
navigator.appVersion
"5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36"
navigator.userAgent
"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36"
navigator.platform
"Win32"
```

大多数时候我们不会使用`navigator`对象，因为会被人为修改！

不建议使用这些属性来判断和编写代码



> screen

```javascript
screen.width
1920 //1920px
screen.height
1080 //1080px
```



> location （重要）

location代表当前页面的URL信息

```java
host: "www.baidu.com"
href: "https://www.baidu.com/?tn=40039514_2_oem_dg"
protocol: "https:"
reload: ƒ reload() // 刷新网页
//设置新的地址
location.assign('https://blog.csdn.net/zhayuyao')
```



> document （内容：DOM）

document代表当前的页面，HTML DOM文档树

```java
document.title
"百度一下，你就知道"
document.title='zyy'
"zyy"
```

![image-20210605100110358](https://s2.loli.net/2022/04/14/xYT75IKut9v1mNC.png)

获取具体的文档树节点

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<dl id="app">
    <dt>java</dt>
    <dd>javase</dd>
    <dd>javaee</dd>
</dl>

<script>
    var dl = document.getElementById('app')
</script>

</body>
</html>
```

![image-20210605100501558](https://s2.loli.net/2022/04/14/IFD8dzSs4K9tkMN.png)

获取cookie

```javascript
document.cookie
"BIDUPSID=E915D8DAC0FCA4159DF81414176EBD43; PSTM=1618281055; BAIDUID=E915D8DAC0FCA415F0B2ABB582D30135:FG=1; BAIDUID_BFESS=E915D8DAC0FCA415F0B2ABB582D30135:FG=1; COOKIE_SESSION=76_0_3_0_3_1_0_0_2_1_0_0_499551_0_7_0_1619848144_0_1619848137%7C4%230_0_1619848137%7C1; BDRCVFR[6dKjv_d7L5b]=j0fMgDzVGufPHFbmyqMULR8mvqV; BD_HOME=1; H_PS_PSSID=31660; BD_UPN=12314753; BA_HECTOR=a0a42h0h0g800h2kq91gblmi20r"
```

劫持cookie原理

www.taobao.com

```html
<script src="aa.js"></script>
<!-- 恶意人员：获取你的cookie上传到他的服务器 -->
```

服务器端可以设置cookie:httpOnly



> history （不建议使用）

history代表浏览器的历史记录

```javascript
history.forward() //前进
history.back()//后退
```



# 20、获得DOM节点（重点）

DOM:文档对象模型

> 核心

浏览器网页就是一个DOM树形结构

- 更新：更新DOM节点
- 遍历DOM节点：得到DOM节点
- 删除：删除一个DOM节点
- 添加：添加一个新的DOM节点

要操作一个DOM节点，就必须要先获取这个DOM节点。

> 获得dom节点

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div id="father">
    <h1>标题1</h1>
    <p id="p1">p1</p>
    <p class="p2">p2</p>
</div>
<script>
    //对应css选择器
    let h1 = document.getElementsByTagName('h1');
    let p1 = document.getElementById('p1');
    let p2 = document.getElementsByClassName('p2');
    let father = document.getElementById('father');

    let childrens = father.children;//获取父节点下的所有子节点
    let children0 = father.children[0];
    // father.firstChild
    // father.lastChild
</script>
</body>
</html>
```

这是原生代码，之后我们尽量都使用JQuery();

# 21、更新DOM节点

> 更新节点

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div id="id1">

</div>
<script>
    let id1 = document.getElementById("id1");
    id1.innerText = 'abc'
</script>

</body>
</html>
```

操作文本

- `id1.innerText='123'`修改文本的值
- `id1.innerHTML='<strong>234</strong>'` 可以解析html文本标签

![image-20210605112422334](https://s2.loli.net/2022/04/14/jZhRbeIkAYxvQG5.png)



操作css

```javascript
id1.style.color='red' //属性使用字符串包裹
"red"
id1.style.fontSize='50px'  //下划线转驼峰命名
"50px"
id1.style.padding='1em'
"1em"
```

# 22、删除DOM节点

> 删除节点

删除节点的步骤：先获取父节点，在通过父节点删除自己

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div id="father">
    <h1>标题1</h1>
    <p id="p1">p1</p>
    <p class="p2">p2</p>
</div>
<script>
    //对应css选择器
    let h1 = document.getElementsByTagName('h1');
    let p1 = document.getElementById('p1');
    let p2 = document.getElementsByClassName('p2');
    let father = document.getElementById('father');
    
    //father.removeChild(p1);
    let ff = p1.parentElement;
    ff.removeChild(p1);
    
    //删除是一个动态的过程
    //ff.removeChild(ff.children[0])
    //ff.removeChild(ff.children[1])
    //ff.removeChild(ff.children[2])
    
    
</script>
</body>
</html>
```

注意：删除多个节点的时候，children是在时刻变化的，删除节点的时候一定要注意



# 23、创建插入DOM节点

> 插入节点

我们获得了某个DOM节点，假设这个DOM是空的，我们通过innerHTML就可以增加一个元素，但是这个DOM节点已经存在元素了，我们就不能这么干了！会产生覆盖。

追加

```javascript
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<p id="js">javascript</p>
<div id="list">
    <p id="se">se</p>
    <p id="ee">ee</p>
    <p id="me">me</p>
</div>

<script>
    let js = document.getElementById('js');
    let list = document.getElementById('list');

    list.appendChild(js);//追加
</script>

</body>
</html>
```

效果

![image-20210605115303836](https://s2.loli.net/2022/04/14/7XOqJACo9kghP18.png)

> 创建一个新的标签

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<p id="js">javascript</p>
<div id="list">
    <p id="se">se</p>
    <p id="ee">ee</p>
    <p id="me">me</p>
</div>

<script>
    let js = document.getElementById('js');//已存在的节点
    let list = document.getElementById('list');

    list.appendChild(js);

    //通过js创建一个新的节点
    let newP = document.createElement('p');
    newP.id ='newP';
    newP.innerText = 'hello';
    list.appendChild(newP);

    //创建一个标签节点（通过这个属性，可以设置任意的值）
    let myScript = document.createElement('script');
    myScript.setAttribute('type', 'text/javascript');
    list.appendChild(myScript);

    //创建一个style标签
    let myStyle = document.createElement('style');//创建一个空style标签
    myStyle.innerHTML = 'body {background-color: green;}';//设置标签内容
    document.getElementsByTagName('head')[0].appendChild(myStyle);//追加
</script>

</body>
</html>
```

> insertBefore

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<p id="js">javascript</p>
<div id="list">
    <p id="se">se</p>
    <p id="ee">ee</p>
    <p id="me">me</p>
</div>

<script>
    let js = document.getElementById('js');
    let ee = document.getElementById('ee');
    let list = document.getElementById('list');
    //要包含的节点，insertBefore(newNode, targetNode)
    list.insertBefore(js, ee);
</script>

</body>
</html>
```



# 24、获得和设置表单的值

> 表单是什么？  from DOM树

- 文本框  text
- 下拉框 select
- 单选框 radio
- 多选框 checkbox
- 隐藏域 hidden
- 密码框 password
- 。。。

表单的目的：提交信息



> 获得要提交的信息

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<form action="post">
    <p>
        <span>用户名：</span><input type="text" id="userName">
    </p>
    <!--多选框的值，就是定义好的value-->
    <p>
        <span>性别：</span>
        <input type="radio" name="sex" value="man" id="boy">男
        <input type="radio" name="sex" value="woman" id="girl">女
    </p>
</form>

<script>
    let userName = document.getElementById('userName');
    let boy = document.getElementById('boy');
    let girl = document.getElementById('girl');
    //得到输入框的值
    let v = userName.value;
    //修改输入框的值
    userName.value = 'zyy';

    //对于单选框,多选框等等固定的值，boy.value只能取到当前的值
    let c = boy.checked;//查看返回的结果，是否为true,如果为true,则被选中
    girl.checked = true;//赋值

</script>

</body>
</html>
```



# 25、表单提交验证及前端密码MD5加密

> 提交表单 MD5加密密码 表单优化

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--真正用的时候建议下载到本地，避免网站失效，用不了-->
    <script src="https://cdn.bootcss.com/blueimp-md5/2.10.0/js/md5.min.js"></script>
</head>
<body>
<!--
表单绑定提交事件
onsubmit= 绑定一个提交检测的函数 true false
将这个结果返回给表单，使用onsubmit接收
-->
<form action="https://www.baidu.com" method="post" onsubmit="return f()">
    <p>
        <span>用户名：</span><input type="text" id="username" name="username">
    </p>

    <p>
        <span>密码：</span><input type="password" id="input-password">
    </p>
    <!--密码建议通过隐藏域提交-->
    <input type="hidden" id="md5-pwd" name="password">
    <!--绑定事件 onclick被点击-->
    <!--<button type="submit" onclick="f()">提交</button>-->
    <button type="submit">提交</button>
</form>

<script>
    function f() {
        let username = document.getElementById('username');
        let pwd = document.getElementById('input-password');
        let md5PWD = document.getElementById('md5-pwd');
        console.log(username.value);
        //md5算法
        md5PWD.value = md5(pwd.value);
        //可以校验判断表单内容，true就是可以提交，false就是阻止提交
        return true;
    }
</script>
</body>
</html>
```

# 26、初识JQuery及公式

JavaScript

JQuery库，里面存在大量的JavaScript函数

> 获取JQuery

[中文文档](https://jquery.cuishifeng.cn/)

![image-20210606120955405](https://s2.loli.net/2022/04/14/YFukjpZwAo1b8R4.png)

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!--cdn引入-->
    <!--<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>-->
    <!--本地导入-->
    <script src="lib/jquery-3.6.0.js"></script>
</head>
<body>
<!--
公式：$(selector).action()
-->

<a href="" id="test-jquery">点我</a>

<script>
    // document.getElementById('');
    //选择器就是css选择器
    $('#test-jquery').click(function () {
        alert('hello')
    })
</script>
</body>
</html>
```

# 27、JQuery选择器

> 选择器

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<script>
    //原生js,选择器少，麻烦不好记
    //标签
    document.getElementsByTagName();
    //id
    document.getElementById();
    //类
    document.getElementsByClassName();

    //JQuery  css中的选择器它全部都能用
    $('p').click();  //标签选择器
    $('#id1').click();//id选择器
    $('.class1').click();//class选择器
</script>

</body>
</html>
```

# 28、JQuery事件

> 事件

鼠标事件，键盘事件，其他事件

![image-20210606143505226](https://s2.loli.net/2022/04/14/KchEIYgTq8DZPdU.png)

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="lib/jquery-3.6.0.js"></script>
    <style>
        #divMove {
            width: 500px;
            height: 500px;
            border: 1px solid red;
        }

    </style>
</head>
<body>
<!--获取鼠标当前的一个坐标-->
mouse:<span id="mouseMove"></span>
<div id="divMove">
    在这里移动鼠标试试
</div>
<script>
    //当网页元素加载完毕之后，响应事件
    // $(document).ready(function () {
    //
    // })
    $(function () {
        $('#divMove').mousemove(function (e) {
            $('#mouseMove').text('x:' + e.pageX + ",y:" + e.pageY)
        })
    })
</script>

</body>
</html>
```



# 29、JQuery操作Dom元素

> 操作DOM

节点文本操作

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="lib/jquery-3.6.0.js"></script>
</head>
<body>
<ul id="test-ul">
    <li class="js">JavaScript</li>
    <li name="python">Python</li>
</ul>

<script>
    $('#test-ul li[name=python]').text();//获取值
    $('#test-ul li[name=python]').text('123');//设置值
    $('#test-ul').html();//获得值
    $('#test-ul').html('<stong>123</stong>');//设置值
</script>

</body>
</html>
```

css操作

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="lib/jquery-3.6.0.js"></script>
</head>
<body>
<ul id="test-ul">
    <li class="js">JavaScript</li>
    <li name="python">Python</li>
</ul>

<script>
    $('#test-ul li[name=python]').css('color','red')
</script>

</body>
</html>
```

元素的显示和隐藏：本质`display:none`

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="lib/jquery-3.6.0.js"></script>
</head>
<body>
<ul id="test-ul">
    <li class="js">JavaScript</li>
    <li name="python">Python</li>
</ul>

<script>
    // $('#test-ul li[name=python]').show()
    $('#test-ul li[name=python]').hide()
</script>

</body>
</html>
```

测试

```javascript
$(window).width()
$(window).height()
$('#test-ul li[name=python]').toggle()
```

未来ajax()

# 30、前端小结及开发技巧分享

> 小技巧

1. 如何巩固js(看JQuery源码，看游戏源码)
2. 巩固html,css(扒网站，全部down下来，然后对应修改看效果)

怎么抄别人的前端页面（重要，看视频）
