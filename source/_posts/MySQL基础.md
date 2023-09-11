---
title: MySQL基础
date: 2023-08-08 18:51:38
tags:
  - MySQL
categories:	
  - Program
description: MySQL基础
---

# 01、什么是数据库，为什么要学习数据库

javaEE：企业级java开发  Web

前端（页面：展示，数据！）

后台（连接点：连接数据库JDBC，连接前端（控制，控制视图跳转，和给前端传递数据））

数据库（存数据）



## 1.为什么学习数据库

1. 岗位需求
2. 现在的世界，大数据时代，得数据者得天下
3. 被迫需求：存数据
4.  **数据库是所有软件体系中最核心的存在**



## 2.什么是数据库

数据库（DB,database）

概念：数据仓库，软件，安装在操作系统(window,linux,mac...)之上。SQL，可以存储大量的数据，500w！

作用：存储数据，管理数据

# 02、初始MySQL，关系型和非关系型数据库区别

## 1.数据库分类

**关系型数据库：(SQL)**

- MySQL、oracle、SqlServer、DB2、SQLLITE
- 通过表和表之间，行和列之间的关系进行数据的存储。

**非关系型数据库：(NoSQL) not only**

- Redis、mongdb
- 非关系型数据库，对象存储，通过对象的自身的属性来决定。



**DBMS(数据库管理系统)**

- 数据库的管理软件，科学有效的管理我们的数据，维护和获取数据
- MySQL，数据库管理系统



## 2.MySQL简介

MySQL是一个**[关系型数据库管理系统](https://baike.baidu.com/item/关系型数据库管理系统/696511)**

前世：瑞典MySQL AB 公司开发

今生：属于 [Oracle](https://baike.baidu.com/item/Oracle) 旗下产品

MySQL是最好的 [RDBMS](https://baike.baidu.com/item/RDBMS/1048260) (Relational Database Management System，关系数据库管理系统) 应用软件之一。

开源的数据库软件

体积小、速度快、总体拥有成本低，招人成本比较低，所以人必须会用~

中小型网站，或者大型网站，集群！

官网：[MySQL](https://www.mysql.com/)



安装建议：

1. 尽量不要使用exe，注册表
2. 尽可能使用压缩包安装~

# 03、安装MySQL详细说明

## 1.安装步骤

1. 解压 mysql-5.7.34-winx64.zip

2. 把这个包放到自己的电脑环境目录下

   ![image-20210610221856286](https://s2.loli.net/2022/04/14/h87UC1Zf3JOlTNq.png)

3. 配置环境变量

   修改系统变量Path即可

   ![image-20210610221806497](https://s2.loli.net/2022/04/14/jyFwedv7iLzpoNs.png)

4. 新建mysql配置文件ini

   ![image-20210610221955841](https://s2.loli.net/2022/04/14/Wpx19SuJDX7m5Yi.png)

   ```ini
   [mysqld]
   # 设置mysql的安装目录
   basedir=D:\\environment\\mysql-5.7.34-winx64
   # 设置mysql数据库的数据的存放目录
   datadir=D:\\environment\\mysql-5.7.34-winx64\\data
   # 设置3306端口
   port=3306
   # 跳过验证
   skip-grant-tables
   ```

5. 启动管理员模式下的cmd，切换到mysql安装目录的bin目录

   ![image-20210610222126769](https://s2.loli.net/2022/04/14/ZjBdbksxQV4wgiq.png)

6. 安装mysql服务

   `mysqld -install`

   ![image-20210610222200449](https://s2.loli.net/2022/04/14/yfZKzlpxAD4n8ST.png)

7. 初始化数据库文件

   `mysqld --initialize-insecure --user=mysql`

   ![image-20210610222359492](https://s2.loli.net/2022/04/14/ARJhPiSLwF9d8ZG.png)

   这个时候安装目录就会多一个data目录

   ![image-20210610222538940](https://s2.loli.net/2022/04/14/OLmY4BwVdyoaIeD.png)

8. 启动mysql`net start mysql`，然后用命令`mysql -u root -p`进入mysql管理界面(-p后面不要加空格)

   ![mm](https://s2.loli.net/2022/05/19/b6VhALJZwaSWxzP.png)

   ![image-20210610222953356](https://s2.loli.net/2022/05/19/83lMSm4fWIEyVuc.png)

9. 进入界面后，修改密码（sql语句后面一定要加分号）

   ```sql
   update mysql.user set authentication_string=password('123456') where user='root' and host='localhost';
   ```

   ![image-20210610223232491](https://s2.loli.net/2022/04/14/uhMmz1tvBNyREA9.png)

10. 输入`flush privileges;`刷新权限

    ![image-20210610223414305](https://s2.loli.net/2022/04/14/2wnFIay8RqPN3eO.png)

11. 注释掉ini中的跳过密码`skip-grant-tables`

    ![image-20210610223507705](https://s2.loli.net/2022/04/14/u2Z1VoBWAPz59yI.png)

12. 退出mysql命令行`exit`，停止mysql `net stop mysql`

![image-20210610223920444](https://s2.loli.net/2022/04/14/QfyLaNYgDktjmVJ.png)

13. 然后启动服务，再次成功登陆，就ok了

    ![image-20210610224629970](https://s2.loli.net/2022/04/14/YC5iQul143OXynv.png)





## 2.安装遇到的问题

1. 执行mysqld -install报错如下的话

![image-20210610221326629](https://s2.loli.net/2022/04/14/XubUJ5OzwrsZh1V.png)

可以先安装下面这个即可

[Download Visual C++ Redistributable Packages for Visual Studio 2013 from Official Microsoft Download Center](https://www.microsoft.com/zh-CN/download/details.aspx?id=40784)



`sc delete mysql` 清空服务

# 04、sqlyog软件安装和使用

1. 无脑安装
2. 注册
3. 打开连接数据库

![image-20210614090411318](https://s2.loli.net/2022/04/14/1Q8x45TvAMfXdhz.png)

界面

![image-20210614090317586](https://s2.loli.net/2022/04/14/46CnrUTLiemxdFJ.png)

这里与之前data文件夹对应

![image-20210614090352253](https://s2.loli.net/2022/04/14/tKswovOMFCNUcfQ.png)

4. 新建一个数据库 school

   ![image-20210614090908854](https://s2.loli.net/2022/04/14/D5Ajy4pPBoExwum.png)

   查看历史记录可以查到对应如下语句：

   ![image-20210614091135625](https://s2.loli.net/2022/04/14/6I2pDVo1aT9JQHN.png)

   ```sql
   CREATE DATABASE `school`CHARACTER SET utf8 COLLATE utf8_general_ci; 
   ```

   ==每一个sqlyog的执行操作，本质就是对应了一个sql,可以在软件的历史记录中查看==

5. 新建一张表student（id，姓名，年龄）

   ![image-20210614091827019](https://s2.loli.net/2022/04/14/mc14UKr3uNjvnOs.png)

6. 查看表

   ![image-20210614092224514](https://s2.loli.net/2022/04/14/AlosIvX64n1bxpK.png)

7. 自己尝试添加多条记录

   ![image-20210614092313191](https://s2.loli.net/2022/04/14/xuiSCjvzr6Afwns.png)

# 05、基本的命令行操作

```sql
mysql -uroot -p123456 -- 连接数据库

update mysql.user set authentication_string=password('123456') where user='root' and host='localhost'; -- 修改用户密码

flush privileges; -- 刷新权限
----------------------------
-- 所有的语句都使用;结尾

show databases; -- 查看所有的数据库

mysql> use school; -- 切换数据库  use 数据库名
Database changed

mysql> show tables; -- 显示数据库中所有表的信息

mysql> describe student; -- 显示表的详细信息

create database zyy;  -- 创建一个数据库（这里过于简洁，后面详细介绍）

exit -- 退出连接

-- 单行注释
/**
多行注释
*/

```

DDL 数据库**定义**语言

DML 数据库**操作**语言

DQL 数据库**查询**语言

DCL 数据库**控制**语言

# 06、操作数据库语句

操作数据库 》 操作数据库中表 》操作数据库中表的数据

==mysql关键字不区分大小写==

## 1.操作数据库（了解）

1. 创建数据库

   ```sql
   CREATE DATABASE [IF NOT EXISTS] student;
   ```

2. 删除数据库

   ```sql
   DROP DATABASE [IF EXISTS] zyy;
   ```

3. 使用数据库

   ```sql
   -- 如果你的表名或者字段名是一个特殊字符，就需要带上``
   USER `student`;
   ```

4. 查看数据库

   ```sql
   SHOW DATABASES; -- 查看所有的数据库
   ```



**学习思路**

1. ==对比sqlyog的可视化操作==
2. 固定的语法或者关键字必须强行记住！

# 07、列的数据类型讲解

> 数值

- tinyint         十分小的数据        1个字节
- smallint       较小的数据           2个字节
- mediumint  中等大小的数据   3个字节
- **int                 标准的整数           4个字节**
- bigint            较大的数据           8个字节
- float              浮点数                   4个字节
- double         浮点数                   8个字节
- **decimal       字符串形式的浮点数 （金融计算的时候，一般是使用decimal）**

> 字符串

- char         字符串固定大小的  0~255
- **varchar   可变字符串  0~65535**  （常量的变量  String）
- tinytext    微型文本  2^8 -1
- **text          文件串  2^16 -1**  (保存大文本)

> 时间日期

- date YYYY-MM-DD  日期格式
- time HH:mm:ss    时间格式
- **datetime  YYYY-MM-DD HH:mm:ss 最常用的时间格式**
- **timestamp  时间戳，1970.1.1到现在的毫秒数！较为常用！**
- year 年份表示

> null

- 没有值，未知
- ==注意：不要使用NULL进行运算，结果为NULL==

# 08、数据库的字段属性(重点)

**Unsigned:**

- 无符号的整数
- 声明了该列不能声明为负数

**Zerofill:**

- 0填充的
- 不足的位数，使用0来填充   int(3)  5 --- 005

**自增：**

- 通用理解为自增，自动在上一条记录的基础上+1（默认）
- 通常用来设计唯一的主键，index，必须是整数类型
- 可以自定义设计主键自增的起始值和步长

**非空** null/not null：

- not null，如果不给他赋值，就会报错
- null，如果不给他赋值，默认就是null

**默认：**

- 设置默认的值
- 如果不赋值，就会存默认值





拓展：

```sql
/*
每个表，都必须存在以下五个字段  未来做项目用的，表示一个记录存在的意义

id          主键
version     乐观锁
is_delete   伪删除
gmt_create  创建时间
gmt_update  修改时间

*/
```



# 09、创建数据库表

```sql
-- 目标：创建一个school数据库
-- 创建student学生表，使用sql创建
-- 学号 姓名 性别 出生日期 家庭地址  email

-- 注意点：使用英文()  表的名称和字段尽量使用``括起来
-- AUTO_INCREMENT 自增
-- 字符串使用单引号括起来
-- 所有的语句后面加上英文逗号，最后一个不加
-- PRIMARY KEY主键，一个表一般只有一个唯一的主键
CREATE TABLE IF NOT EXISTS `student` (
  `id` INT(4) NOT NULL AUTO_INCREMENT COMMENT '学号',
  `name` VARCHAR(30) NOT NULL DEFAULT '匿名' COMMENT '姓名',
  `sex` VARCHAR(2) NOT NULL DEFAULT '女' COMMENT '性别',
  `birthday` DATETIME NOT NULL COMMENT '出生日期',
  `address` VARCHAR(100) DEFAULT NULL COMMENT '家庭地址',
  `email` VARCHAR(30) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY(`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8
```

格式

```sql
CREATE TABLE [IF NOT EXISTS] `表名` (
    `字段名` 列类型[属性]  [索引]  [注释],
    `字段名` 列类型[属性]  [索引]  [注释],
    `字段名` 列类型[属性]  [索引]  [注释],
    ...
)[表类型][字符集设置][注释]
```



常用命令：

```sql
SHOW CREATE DATABASE `school` ; -- 查看创建数据库的语句
SHOW CREATE TABLE `student`; -- 查看student数据表的定义语句

DESC `student`; -- 查看表的结构
```



# 10、MyIASM和InnoDB区别

```sql
/*
关于数据库引擎
INNODB 默认使用
MYISAM 早些年使用的
*/
```

|              | MYISAM | INNODB                |
| ------------ | ------ | --------------------- |
| 事务支持     | 不支持 | 支持                  |
| 数据行锁定   | 不支持 | 支持                  |
| 外键约束     | 不支持 | 支持                  |
| 全文索引     | 支持   | 不支持                |
| 表空间的大小 | 较小   | 较大，约为MYISAM的2倍 |

常规使用操作：

- MYISAM 节约空间，速度较快
- INNODB 安全性高，事务的处理，多表多用户操作

> 在物理空间存在的位置

所有的数据库文件都存在data目录下，一个文件夹就对应一个数据库

本质还是文件的存储！

mysql引擎在物理文件上的区别

- INNODB 在数据库表中只有一个*.frm文件，以及上级目录下的ibdata1文件
- MYISAM 对应的文件
  - *.frm  表结构的定义文件
  - *.MYD 数据文件(data)
  - *.MYI 索引文件 (index)

> 设置数据库表的字符集编码

```sql
CHARSET=utf8
```

不设置的话，会是mysql默认的字符集编码（不支持中文）

mysql的默认编码是Latin1,不支持中文

在my.ini中配置默认的编码

```ini
character-set-server=utf8
```



# 11、修改和删除数据表字段

> 修改

```sql
-- 修改表名 ALTER TABLE `原表名` RENAME AS `新表名`;
ALTER TABLE `teacher` RENAME AS `teacher1`;

-- 新增表的字段  ALTER TABLE `表名` ADD 字段名 列属性
ALTER TABLE `teacher1` ADD age INT(3);

-- 修改表的字段（重命名，修改约束！）
-- ALTER TABLE `表名` MODIFY 字段名 列属性; 
-- ALTER TABLE `表名` CHANGE 原字段名 现字段名 列属性;
ALTER TABLE `teacher1` MODIFY age VARCHAR(3); -- 修改约束

ALTER TABLE `teacher1` CHANGE age age1 INT(3);-- 字段重命名

-- 删除表的字段
ALTER TABLE `teacher1` DROP age1;
```



> 删除

```sql
-- 删除表（如果存在再删除）
DROP TABLE IF EXISTS teacher1;
```

==所有的创建和删除操作尽量加上判断，以免报错~==

注意点：

- ``字段，使用这个包裹
- 注释 -- /**/
- sql关键字大小写不敏感，建议大写写小写
- 所有的符号全部用英文

# 12、数据库级别的外键（了解）

> 方式一：创建表的时候，增加约束（麻烦，比较复杂）

```sql
-- 年级表
CREATE TABLE `grade` (
  `id` INT(30) NOT NULL AUTO_INCREMENT COMMENT '年级id',
  `name` VARCHAR(50) NOT NULL COMMENT '年级名称',
  PRIMARY KEY (`id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8

-- 先删除之前的学生表
DROP TABLE `student`;

-- 学生表 id_grade 字段 需要引用年级表的 id字段
-- 定义外键key
-- 给这个外键添加约束（执行引用） references 引用
CREATE TABLE IF NOT EXISTS `student` (
  `id` INT(4) NOT NULL AUTO_INCREMENT COMMENT '学号',
  `name` VARCHAR(30) NOT NULL DEFAULT '匿名' COMMENT '姓名',
  `sex` VARCHAR(2) NOT NULL DEFAULT '女' COMMENT '性别',
  `birthday` DATETIME NOT NULL COMMENT '出生日期',
  `address` VARCHAR(100) DEFAULT NULL COMMENT '家庭地址',
  `email` VARCHAR(30) DEFAULT NULL COMMENT '邮箱',
  `id_grade` INT(30) NOT NULL COMMENT '年级id',
  PRIMARY KEY(`id`),
  KEY `fk_id_grade`(`id_grade`),
  CONSTRAINT `fk_id_grade` FOREIGN KEY (`id_grade`) REFERENCES `grade` (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8
```

![image-20210620095301587](https://s2.loli.net/2022/04/14/Xr4WBLhjapvY6xn.png)

删除有外键关系的表的时候，必须要先删除引用别人的表（从表），再删除被引用的表（主表）

> 方式二：创建表成功后，添加外键约束

```sql


-- 年级表
CREATE TABLE `grade` (
  `id` INT(30) NOT NULL AUTO_INCREMENT COMMENT '年级id',
  `name` VARCHAR(50) NOT NULL COMMENT '年级名称',
  PRIMARY KEY (`id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8


-- 学生表
CREATE TABLE IF NOT EXISTS `student` (
  `id` INT(4) NOT NULL AUTO_INCREMENT COMMENT '学号',
  `name` VARCHAR(30) NOT NULL DEFAULT '匿名' COMMENT '姓名',
  `sex` VARCHAR(2) NOT NULL DEFAULT '女' COMMENT '性别',
  `birthday` DATETIME NOT NULL COMMENT '出生日期',
  `address` VARCHAR(100) DEFAULT NULL COMMENT '家庭地址',
  `email` VARCHAR(30) DEFAULT NULL COMMENT '邮箱',
  `id_grade` INT(30) NOT NULL COMMENT '年级id',
  PRIMARY KEY(`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8

-- DROP TABLE `grade`;
-- DROP TABLE `student`;

-- 创建表的时候没有外键关系
ALTER TABLE `student` 
ADD CONSTRAINT `fk_id_grade` FOREIGN KEY (`id_grade`) REFERENCES `grade` (`id`);

-- ALTER TABLE 表 ADD CONSTRAINT 约束名 FOREIGN KEY (作为外键的列) REFERENCES 哪个表 (哪个字段)

```

以上的操作都是物理外键，数据库级别的外键，我们不建议使用（避免数据库过多造成困扰！）



**最佳实践**

- 数据库就是单纯的表，只用来存数据，只有行(数据)和列（字段）
- 我们想使用多张表的数据，想使用外键**（程序去实现）**

# 13、insert语句详解

**数据库意义**：数据存储，数据管理

DML语言：数据库操作语言

- 增
- 删
- 改



> insert

```sql
-- 插入语言

-- INSERT INTO `表名`(`字段1`,`字段2`,`字段3`...) VALUES('值1','值2','值3'...);
INSERT INTO `grade`(`name`) VALUES('大四');
INSERT INTO `student`(`name`,`birthday`,`id_grade`) VALUES('张三','1995-11-20','1');
-- 一般写插入语句，我们一定要数据和字段一一对应。

-- 插入多条
-- INSERT INTO `表名`(`字段1`,`字段2`...) VALUES('值1','值2'...),('值1','值2'...)...;
INSERT INTO `grade`(`name`) VALUES('大一'),('大二');

INSERT INTO `student`(`name`,`birthday`,`id_grade`) VALUES('李四','1994-11-20','2'),('王五','1995-11-20','1');
```

注意事项：

- 字段和字段之间使用逗号隔开
- 字段是可以省略，但是后面的值必须要一一对应，不能少
- 可以同时插入多条数据，VALUES后面的值，需要使用逗号分开`VALUES(),()...`

# 14、update语句详解

> update

```sql
-- 修改学员名字
UPDATE `student` SET NAME='zyy' WHERE id='1';
-- 通过多个条件定位数据
UPDATE `student` SET NAME='hehe' WHERE NAME='zyy' AND id_grade='2';
-- 不指定条件的情况，会改动所有的表
UPDATE `student` SET NAME='all';
-- 语法
-- UPDATE 表名 SET 列名=值[,列名=值,列名=值,列名=值...] [WHERE 条件]
```

条件：where 字句 运算符 id等于某个值，大于某个值，在某个区间内修改

| 操作符              | 含义       | 范围            | 结果  |
| ------------------- | ---------- | --------------- | ----- |
| =                   | 等于       | 5=6             | false |
| <> 或者 !=          | 不等于     | 5!=6            | true  |
| >                   |            |                 |       |
| <                   |            |                 |       |
| >=                  |            |                 |       |
| <=                  |            |                 |       |
| BETWEEN ... AND ... | 某个范围内 | BETWEEN 1 AND 3 | [1,3] |
| AND                 | 和 &&      | 5>1 and 1>2     | false |
| OR                  | 或 \|\|    | 5>1 or 1>2      | true  |

注意事项：

- 列尽量带上``

- 条件，筛选的条件，如果没有指定，则会修改所有的列

- value，可以是一个具体的值，也可以是一个变量

  ```sql
  UPDATE `student` SET birthday=CURRENT_TIME WHERE NAME='hehe' AND id_grade='2';
  ```

- 多个设置的属性之间，使用英文逗号隔开（后面trim,可以干掉多余的逗号）

# 15、delete和truncate详解

> delete

语法： `delete from 表名 [where 条件]`

```sql
-- 删除数据（避免这样写，会全部删除）
DELETE FROM `student`;
-- 删除指定数据
DELETE FROM `student` WHERE id=1; 
```

> truncate

作用：完全清空一个数据库表，标的结构和索引约束不会变！

```sql
-- 清空表
TRUNCATE `student`;
```



> delete 和 truncate 区别

- 相同点：都能删除数据，都不会删除表结构
- 不同：
  - truncate 重新设置自增列，计数器会归零
  - truncate 不会影响事务

```sql
-- 测试 delete 和 truncate 区别
CREATE TABLE `test`(
  `id` INT(4) NOT NULL AUTO_INCREMENT,
  `coll` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8


-- 不会影响自增
DELETE FROM `test`;

-- 自增归零
TRUNCATE TABLE `test`;

INSERT INTO `test` (`coll`) VALUES ('1'),('2'),('3'),('4');
```

了解即可`delete 删除的问题`,重启数据库,现象

- innoDB  自增列会从1开始（存在内存当中的，断电即失）
- MyISAM  继续上一个自增量开始（存在文件中，不会丢失）



# 16、基本的select语句和别名使用（重点）

DQL（data query language:数据查询语言）

- 所有的查询操作都用它 select
- 简单的查询，复杂的查询它都能做
- **数据库中最核心的语言，最重要的语句**
- 使用频率最高的语句

select 语法

```sql
SELECT [ALL | DISTINCT]
{* | table.* | [table.field1[as alias1][,table.field2[as alias2]][,...]]}
FROM table_name [as table_alias]
    [left | right | inner join table_name2]  -- 联合查询
    on ...   -- 连接条件
    [WHERE ...]  -- 指定结果需满足的条件
    [GROUP BY ...]  -- 指定结果按照哪几个字段来分组
    [HAVING]  -- 过滤分组的记录必须满足的次要条件
    [ORDER BY ...]  -- 指定查询记录按一个或多个条件排序
    [LIMIT {[offset,]row_count | row_countOFFSET offset}];
    --  指定查询的记录从哪条至哪条
```

注意：[]括号代表可选的，{}括号代表必选的

## 指定查询字段

```sql
DROP DATABASE IF EXISTS `school`;
-- 创建一个school数据库
CREATE DATABASE IF NOT EXISTS `school`;
-- 使用school数据库
USE `school`;
-- 创建学生表
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`(
    `student_no` INT(4) NOT NULL COMMENT '学号',
    `login_pwd` VARCHAR(20) DEFAULT NULL,
    `student_name` VARCHAR(20) DEFAULT NULL COMMENT '学生姓名',
    `sex` TINYINT(1) DEFAULT NULL COMMENT '性别，0或1',
    `grade_id` INT(11) DEFAULT NULL COMMENT '年级编号',
    `phone` VARCHAR(50) NOT NULL COMMENT '联系电话',
    `address` VARCHAR(255) NOT NULL COMMENT '地址',
    `born_date` DATETIME DEFAULT NULL COMMENT '出生时间',
    `email` VARCHAR (50) NOT NULL COMMENT '邮箱账号',
    `identity_card` VARCHAR(18) DEFAULT NULL COMMENT '身份证号',
    PRIMARY KEY (`student_no`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

-- 创建年级表
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`(
  `grade_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '年级编号',
  `grade_name` VARCHAR(50) NOT NULL COMMENT '年级名称',
   PRIMARY KEY (`grade_id`)
) ENGINE=INNODB DEFAULT CHARSET = utf8;

-- 创建科目表
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`(
  `subject_no`INT(11) NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `subject_name` VARCHAR(50) DEFAULT NULL COMMENT '课程名称',
  `class_hour` INT(4) DEFAULT NULL COMMENT '学时',
  `grade_id` INT(4) DEFAULT NULL COMMENT '年级编号',
   PRIMARY KEY (`subject_no`)
)ENGINE = INNODB  DEFAULT CHARSET = utf8;

-- 创建成绩表
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result`(
  `student_no` INT(4) NOT NULL COMMENT '学号',
  `subject_no` INT(4) NOT NULL COMMENT '课程编号',
  `exam_date` DATETIME NOT NULL COMMENT '考试日期',
  `student_result` INT (4) NOT NULL COMMENT '考试成绩'
  )ENGINE = INNODB DEFAULT CHARSET = utf8;
  
-- 插入学生数据 其余自行添加 这里只添加了2行
INSERT INTO `student` (`student_no`,`login_pwd`,`student_name`,`sex`,`grade_id`,`phone`,`address`,`born_date`,`email`,`identity_card`)
VALUES
(1000,'123456','张伟',0,2,'13800001234','北京朝阳','1980-1-1','text123@qq.com','123456198001011234'),
(1001,'123456','赵强',1,3,'13800002222','广东深圳','1990-1-1','text111@qq.com','123456199001011233');

-- 插入年级数据
INSERT INTO `grade` (`grade_id`,`grade_name`) VALUES(1,'大一'),(2,'大二'),(3,'大三'),(4,'大四'),(5,'预科班');

-- 插入科目数据
INSERT INTO `subject`(`subject_no`,`subject_name`,`class_hour`,`grade_id`)VALUES
(1,'高等数学-1',110,1),
(2,'高等数学-2',110,2),
(3,'高等数学-3',100,3),
(4,'高等数学-4',130,4),
(5,'C语言-1',110,1),
(6,'C语言-2',110,2),
(7,'C语言-3',100,3),
(8,'C语言-4',130,4),
(9,'Java程序设计-1',110,1),
(10,'Java程序设计-2',110,2),
(11,'Java程序设计-3',100,3),
(12,'Java程序设计-4',130,4),
(13,'数据库结构-1',110,1),
(14,'数据库结构-2',110,2),
(15,'数据库结构-3',100,3),
(16,'数据库结构-4',130,4),
(17,'C#基础',130,1);

-- 插入成绩数据  这里仅插入了一组，其余自行添加
INSERT INTO `result`(`student_no`,`subject_no`,`exam_date`,`student_result`)
VALUES
(1000,1,'2013-11-11 16:00:00',85),
(1000,2,'2013-11-12 16:00:00',70),
(1000,3,'2013-11-11 09:00:00',68),
(1000,4,'2013-11-13 16:00:00',98),
(1000,5,'2013-11-14 16:00:00',58);

```



```sql
  -- 查询全部的学生   SELECT 字段 FROM 表名;
  SELECT * FROM student;
  
  -- 查询指定字段
  SELECT student_name, student_no FROM student;
  
  -- 别名，给结果起一个名字 AS  可以给字段起别名，也可以给表起别名
  
  SELECT student_name AS '学号', student_no AS '姓名' FROM student;
  
  -- 函数 concat(a,b)
  SELECT CONCAT('姓名：', student_no)  AS '新姓名' FROM student;
```

> 有的时候，列表名不是那么见名知意，我们可以起别名
>
> AS和别名的引号都可以去掉



# 17、去重及数据库的表达式

> 去重 distinct

```sql
  -- 查询全部的考试成绩
  SELECT * FROM result;
  -- 查询有哪些同学参加了考试
  SELECT `student_no` FROM result;
  -- 发现重复数据，去重
  SELECT DISTINCT `student_no` FROM result;
```



> 数据库的列（表达式）

```sql
 -- 查询系统版本（函数）
  SELECT VERSION();
  -- 用来计算（表达式）
  SELECT 100*3 -1 ;
  -- 查询自增的步长（变量）
  SELECT @@auto_increment_increment;
  
  -- 学员考试成绩 +1 查看
  SELECT `student_no`,`student_result` + 1 AS '提分后' FROM result;
```

数据库中的表达式： 文本值，列，Null，函数，计算表达式，系统变量

select `表达式` from 表名

# 18、where子句之逻辑运算符

作用：检索数据中`符合条件`的值

搜索的条件由一个或者多个表达式组成，结果布尔值

> 逻辑运算符

| 运算符      | 语法             | 描述   |
| ----------- | ---------------- | ------ |
| and    &&   | a and b     a&&b | 逻辑与 |
| or     \|\| | a orb     a\|\|b | 逻辑或 |
| not   !     | not a     !a     | 逻辑非 |

==尽量适应英文字母==



```sql
-- 查询考试成绩在 95 ~ 100分之间

SELECT student_no,student_result FROM result;

-- and
SELECT student_no,student_result FROM result
WHERE student_result>95 AND student_result<=100;
-- && 
SELECT student_no,student_result FROM result
WHERE student_result>95 && student_result<=100;

-- 模糊查询（区间）
SELECT student_no,student_result FROM result
WHERE student_result BETWEEN 95 AND 100;

-- 除了1000号学生之外的学生的成绩
-- !=
SELECT student_no,student_result FROM result
WHERE student_no != 1000;
-- not
SELECT student_no,student_result FROM result
WHERE NOT student_no = 1000;
```



# 19、模糊查询操作符详解

> 模糊查询：比较运算符

| 运算符           | 语法                | 描述                                              |
| ---------------- | ------------------- | ------------------------------------------------- |
| IS NULL          | a is null           | 如果操作符为null，结果为真                        |
| IS NOT NULL      | a is not null       | 如果操作符不为null，结果为真                      |
| BWTWEEN...AND... | a between b and c   | 若a在b和c之间，则结果为真                         |
| LIKE             | a like b            | SQL匹配，如果a匹配b,则结果为真                    |
| IN               | a in (a1,a2,a3,...) | 假设a在a1或者a2或者a3,...其中的某一个，则结果为真 |

```sql

-- 查询姓刘的同学

-- like 结合 
--   %（代表0到任意个字符）
--   _（代表1）

-- 查询姓刘的同学
SELECT `student_no`,`student_name` FROM `student`
WHERE student_name LIKE '刘%';

-- 查询姓刘的同学，名字后面只有一个字的
SELECT `student_no`,`student_name` FROM `student`
WHERE student_name LIKE '刘_';

-- 查询姓刘的同学，名字后面有两个字的
SELECT `student_no`,`student_name` FROM `student`
WHERE student_name LIKE '刘__';

-- 查询名字中间有嘉字的同学
SELECT `student_no`,`student_name` FROM `student`
WHERE student_name LIKE '%%嘉%';


-- in (具体的一个或者多个值)
-- 查询学号1001,1002,1003号学号
SELECT `student_no`,`student_name` FROM `student`
WHERE student_no IN ('1001','1002','1003');
-- 查询在北京的学生
SELECT `student_no`,`student_name` FROM `student`
WHERE address IN ('北京');


-- null
-- 查询地址为空的学生
SELECT `student_no`,`student_name` FROM `student`
WHERE address = '' OR address IS NULL;

-- not null
-- 查询有出生日期的同学 不为空
SELECT `student_no`,`student_name` FROM `student`
WHERE born_date IS NOT NULL;

-- 查询没有出生日期的同学 为空
SELECT `student_no`,`student_name` FROM `student`
WHERE born_date IS NULL;
```



# 20、联表查询join on详解

> join 对比

七种join理论

![在这里插入图片描述](https://s2.loli.net/2022/04/14/QP82uEFSwAoC3qZ.png)

```sql
--   =========连表查询==================

-- 查询参加了考试的同学（学号，姓名，科目编号，分数）
SELECT * FROM student;
SELECT * FROM result;

-- join on 连接查询
-- where 等值查询

-- inner join
SELECT st.`student_no`,st.`student_name`,re.`		subject_no`,re.`student_result` 
FROM student AS st
INNER JOIN result AS re ON 
st.`student_no`=re.`student_no`;

-- right join
SELECT st.`student_no`,st.`student_name`,re.`subject_no`,re.`student_result` 
FROM student st
RIGHT JOIN result re ON 
st.`student_no`=re.`student_no`;

-- left join
SELECT st.`student_no`,st.`student_name`,re.`subject_no`,re.`student_result` 
FROM student st
LEFT JOIN result re ON 
st.`student_no`=re.`student_no`;

-- 查询缺考的同学
SELECT st.`student_no`,st.`student_name`,re.`subject_no`,re.`student_result` 
FROM student st
LEFT JOIN result re ON 
st.`student_no`=re.`student_no`
WHERE re.`student_result` IS NULL;

-- 查询了参加考试的同学信息（学号，学生姓名，科目名称，分数）
SELECT stu.`student_no`,stu.`student_name`,sub.`subject_name`,res.`student_result`
FROM `student` stu
RIGHT JOIN `result` res 
ON res.`student_no`=stu.`student_no`
INNER JOIN `subject` sub
ON res.`subject_no`=sub.`subject_no`;

-- 查询学员所属的年级（学号，学生的姓名，年级名称）
SELECT `student_no`,`student_name`,`grade_name`
FROM student stu
INNER JOIN `grade` gra
ON stu.`grade_id`=gra.`grade_id`;

-- 查询了参加数据结构-1考试的同学信息（学号，学生姓名，科目名称，分数）
SELECT stu.`student_no`,stu.`student_name`,sub.`subject_name`,res.`student_result`
FROM student stu
INNER JOIN `result` res
ON stu.`student_no` = res.`student_no`
INNER JOIN `subject` sub
ON res.`subject_no`=sub.`subject_no`
WHERE sub.`subject_name`='数据结构-1';


-- join on 连接查询
-- where 等值查询
-- 我要查询哪些数据 select ...
-- 从哪几个表中查 from 表 XXX join 连接的表 on 连接条件
-- 假设存在一种多张表查询，慢慢来，先查询两张表然后再慢慢增加
```

| 操作       | 描述                                       |
| ---------- | ------------------------------------------ |
| inner join | 如果表中至少有一个匹配，就返回行           |
| left join  | 会从左边中返回所有的值，即使右表中没有匹配 |
| right join | 会从右边中返回所有的值，即使左表中没有匹配 |



# 21、自连接及联表查询

> 自连接

自己的表和自己的表连接，核心：==一张表拆为两张一样的表即可==

```sql
-- 创建表
-- unsigned 无符号
-- auto_increment=9 自增的起始值
DROP TABLE IF EXISTS `category` ;
CREATE TABLE `category` (
  `category_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主题id',
  `pid` INT(10) NOT NULL COMMENT '父id',
  `category_name` VARCHAR(50) NOT NULL COMMENT '主题名字',
  PRIMARY KEY (`category_id`)
) ENGINE=INNODB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 插入值
INSERT INTO `category`(`category_id`,`pid`,`category_name`)
VALUES('2','1','信息技术'),
('3','1','软件开发'),
('4','3','数据库'),
('5','1','美术设计'),
('6','3','web开发'),
('7','5','ps技术'),
('8','2','办公信息');

SELECT * FROM `category`;
```

父类

| pid  | category_id | category_name |
| ---- | ----------- | ------------- |
| 1    | 2           | 信息技术      |
| 1    | 3           | 软件开发      |
| 1    | 5           | 美术设计      |

子类

| pid  | category_id | category_name |
| ---- | ----------- | ------------- |
| 3    | 4           | 数据库        |
| 2    | 8           | 办公信息      |
| 3    | 6           | web开发       |
| 5    | 7           | ps技术        |

操作：查询父类对应的子类关系

| 父类     | 子类     |
| -------- | -------- |
| 信息技术 | 办公信息 |
| 软件开发 | 数据库   |
| 软件开发 | web开发  |
| 美术设计 | ps技术   |

```sql
-- 查询父子信息，把一张表看为两个一模一样的表
SELECT a.`category_name` AS '父栏目',b.`category_name` AS '子栏目'
FROM `category` AS a, `category` AS b
WHERE a.`category_id`=b.`pid`;
```



# 22、分页和排序

> 排序

```sql
-- 排序： 升序 ASC Ascending order    降序 DESC  Descending order
-- ORDER BY 通过那个字段排序，怎么排
-- 查询的结果根据成绩降序 排序
SELECT stu.`student_no`,stu.`student_name`,sub.`subject_name`,res.`student_result`
FROM student stu
INNER JOIN `result` res
ON stu.`student_no` = res.`student_no`
INNER JOIN `subject` sub
ON res.`subject_no`=sub.`subject_no`
WHERE sub.`subject_name`='数据结构-1'
ORDER BY `student_result` DESC;
```

```sql
-- 100w
-- 为什么要分页
-- 缓解数据库压力，给人更好的体验   瀑布流
-- 分页，每页只显示五条数据
-- 语法 ： limit 起始值，页面的大小
-- 网页应用：当前，总的页数，每页大小
-- LIMIT 0,5    1~5
-- LIMIT 1,5    2~6
-- LIMIT 6,5    7~11
SELECT stu.`student_no`,stu.`student_name`,sub.`subject_name`,res.`student_result`
FROM student stu
INNER JOIN `result` res
ON stu.`student_no` = res.`student_no`
INNER JOIN `subject` sub
ON res.`subject_no`=sub.`subject_no`
WHERE sub.`subject_name`='数据结构-1'
ORDER BY `student_result` DESC
LIMIT 1,5;
-- 第一页 limit 0,5    (1-1)*5
-- 第二页 limit 5,5    (2-1)*5
-- 第三页 limit 10,5   (3-1)*5
-- 第N页 limit 10,5    (n-1)*pageSize,pageSize
-- pageSize,页面大小
-- (n-1)*pageSize，起始值
-- n，当前页
-- 总页数 = (数据总数%页面大小==0)? (数据总数/页面大小) : (数据总数/页面大小 + 1)

-- 查询科目高等数学-2，课程成绩排名前十的学生，并且分数要大于60的学生信息（学号，姓名，课程名称，分数）
SELECT stu.`student_no`,stu.`student_name`,sub.`subject_name`,res.`student_result`
FROM student stu
INNER JOIN `subject` sub
ON stu.`grade_id`=sub.`grade_id`
INNER JOIN `result` res
ON sub.`subject_no`=res.`subject_no`
WHERE sub.`subject_name`='高等数学-2'
AND res.`student_result`>60
ORDER BY res.`student_result`
LIMIT 0,10;
```

语法： `limit (查询起始下标,页面大小)`

# 23、子查询和嵌套查询

where（这个值是计算出来的）

本质：`在where语句中嵌套一个子查询语句`

```sql

-- 1.查询数据库结构-1的所有考试结果（学号，科目名，成绩），降序排列
-- 方式1：使用连接查询
SELECT res.`student_no`,res.`subject_no`,res.`student_result`
FROM `result` res
INNER JOIN `subject` sub
ON res.`subject_no`=sub.`subject_no`
WHERE sub.`subject_name`='高等数学-2'
ORDER BY res.`student_result` DESC;


-- 使用子查询(由里及外)
SELECT res.`student_no`,res.`subject_no`,res.`student_result`
FROM `result` res
WHERE res.`subject_no` = (
  SELECT sub.`subject_no`
  FROM `subject` sub
  WHERE sub.`subject_name`='高等数学-2'
)
ORDER BY res.`student_result` DESC;

-- 分数不小于80分的学生的学号和姓名

SELECT DISTINCT stu.`student_no`,stu.`student_name`
FROM student stu
INNER JOIN result res
ON stu.`student_no`=res.`student_no`
WHERE res.`student_result` > 80;


-- 在这个基础上增加一个科目，查询课程为高等数学-2，且分数不小于80分的学生的学号和姓名
SELECT DISTINCT stu.`student_no`,stu.`student_name`
FROM student stu
INNER JOIN result res
ON stu.`student_no`=res.`student_no`
WHERE res.`student_result` > 80
AND res.`subject_no`=(
SELECT sub.`subject_no` FROM `subject` sub
WHERE sub.`subject_name`='高等数学-2'
);


SELECT DISTINCT stu.`student_no`,stu.`student_name`
FROM student stu
INNER JOIN result res
ON stu.`student_no`=res.`student_no`
INNER JOIN `subject` sub
ON res.`subject_no`=sub.`subject_no`
WHERE sub.`subject_name`='高等数学-2'
AND res.`student_result` > 80;

--  再次改造（由里及外）
SELECT DISTINCT `student_no`,`student_name` FROM student WHERE student_no IN (
  SELECT student_no FROM result WHERE `student_result` > 80 AND subject_no = (
    SELECT subject_no FROM `subject` WHERE `subject_name`='高等数学-2'
  )
);
```



# 24、MySQL常用函数

官网：[参考手册](https://dev.mysql.com/doc/refman/5.7/en/)

```sql
SELECT ABS(-8); -- 绝对值
SELECT CEILING(9.4) ;-- 向上取整
SELECT FLOOR(9.4);-- 向下取整
SELECT RAND(); -- 返回一个0~1之间的随机数
SELECT SIGN(-10); -- 判断一个数的符号，0 返回0 负数返回-1 正数返回1

-- 字符串函数
SELECT CHAR_LENGTH('哈哈'); -- 字符串长度
SELECT CONCAT('我','爱','你'); -- 拼接字符串
SELECT INSERT('我爱编程helloworld',1,2,'超级热爱'); -- 插入，替换
SELECT LOWER('ZYY'); -- 小写字母
SELECT UPPER('zyy'); -- 大写字母
SELECT INSTR('zyy','y'); -- 返回第一次出现的子串的索引
SELECT REPLACE('坚持就能成功','坚持','努力'); -- 替换出现的指定字符串
SELECT SUBSTR('坚持就能成功', 5, 2); -- 返回指定的子字符串（源字符串，截取的位置，截取的长度）
SELECT REVERSE('清晨我上马'); -- 反转


-- 时间和日期函数（记住！）
SELECT CURRENT_DATE(); -- 获取当前日期
SELECT CURDATE(); -- 获取当前日期
SELECT NOW(); -- 获取当前的时间
SELECT LOCALTIME(); -- 获取本地时间
SELECT SYSDATE(); -- 获取系统时间

SELECT YEAR(NOW()); -- 年
SELECT MONTH(NOW()); -- 月
SELECT DAY(NOW()); -- 日
SELECT HOUR(NOW()); -- 时
SELECT MINUTE(NOW()); -- 分
SELECT SECOND(NOW()); -- 秒

-- 系统
SELECT SYSTEM_USER();
SELECT USER();
SELECT VERSION();
```





# 25、聚合函数及分组过滤

| 函数名称 | 描述   |
| -------- | ------ |
| count()  | 计数   |
| sum()    | 求和   |
| avg()    | 平均值 |
| max()    | 最大值 |
| min()    | 最小值 |

```sql
-- 聚合函数
-- 都能统计 表中数据

-- count(字段) 会忽略所有的null值(想查询一个表中有多少个记录，就使用这个count())
SELECT COUNT(student_name) FROM student;
-- COUNT(*) 不会忽略所有的null值 本质计算行数
SELECT COUNT(*) FROM student;
-- COUNT(1) 不会忽略所有的null值 本质计算行数
SELECT COUNT(1) FROM student;


SELECT SUM(student_result) AS '总和' FROM result;
SELECT AVG(student_result) AS '平均分' FROM result;
SELECT MAX(student_result) AS '最高分' FROM result;
SELECT MIN(student_result) AS '最低分' FROM result;

-- 查询不同课程的平均分，最高分，最低分
SELECT sub.subject_name AS '课程',
AVG(res.student_result) AS '平均分',
MAX(res.student_result) AS '最高分',
MIN(res.student_result) AS '最低分'
FROM result res
INNER JOIN `subject` sub
ON res.`subject_no`=sub.`subject_no`
GROUP BY res.`subject_no`
HAVING AVG(res.student_result) >80;
```



# 26、拓展之数据库级别的md5加密

什么是MD5?

主要增加算法复杂度和不可逆性。

MD5不可逆，具体的值的md5是一样的

MD5破解网站的原理，背后有一个字典，MD5加密后的值，加密前的值

```sql
CREATE TABLE `testmd5`(
  `id` INT(4) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `pwd` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

-- 明文密码
INSERT INTO `testmd5`(`id`,`name`,`pwd`)
VALUES
(1,'张三','123456'),
(2,'李四','123456'),
(3,'王五','123456');


SELECT * FROM `testmd5`;

-- 加密
UPDATE testmd5 SET pwd=MD5(pwd) WHERE id=2;

-- 插入的时候加密
INSERT INTO `testmd5`(`id`,`name`,`pwd`)
VALUES
(4,'小明',MD5('123456'));

-- 如何校验，将用户传递进来的密码，进行MD5加密，然后比对加密后的值

SELECT * FROM `testmd5` WHERE `name`='小明' AND pwd = MD5('123456');
```



# 27、select小结



# 28、事务ACID原则、脏读、不可重复读、幻读

## 1.什么是事务

==要么都成功，要么都失败==

将一组sql放到一个批次中取执行

> 事务原则：ACID原则 原子性 、一致性、隔离性、持久性     （脏读，幻读。。。）

参考博客链接：[事务ACID理解](https://blog.csdn.net/dengjili/article/details/82468576)

**原子性（Atomicity）**

要么都成功，要么都失败

**一致性（Consistency）**

事务前后的数据完整性要保持一致

下图操作前和操作后的总和都是1000

![这里写图片描述](https://s2.loli.net/2022/04/14/DjIFBuAd5cq3CiS.png)

**隔离性（Isolation）**

事务的隔离性是多个用户并发访问数据库时，数据库为每一个用户开启的事务，不能被其他事务的操作数据所干扰，多个并发事务之间要相互隔离。

**持久性（Durability）**

事务一旦移交不可逆，被持久化到数据库中



> 隔离所导致的一些问题

### 脏读：

1、在事务A执行过程中，事务A对数据资源进行了修改，事务B读取了事务A修改后的数据。

2、由于某些原因，事务A并没有完成提交，发生了RollBack操作，则事务B读取的数据就是脏数据。

这种**读取到另一个事务未提交的数据的现象就是脏读(Dirty Read)。**

![v2-a1664b7cde8c890093f4198afead9bff_720w](https://s2.loli.net/2022/04/14/mWuvOI5ncR2y6fG.png)

### 不可重复读：

事务B读取了两次数据资源，在这两次读取的过程中事务A修改了数据，导致事务B在这两次读取出来的数据不一致。

这种**==在同一个事务中==，前后两次读取的数据不一致的现象就是不可重复读(Nonrepeatable Read)。**

![v2-dbdf320962deee0f4e39e11ade7983d3_720w](https://s2.loli.net/2022/04/14/VX5JxNoOCAmplrg.png)

### 虚读(幻读)

事务B前后两次读取同一个范围的数据，在事务B两次读取的过程中事务A新增了数据，导致事务B后一次读取到前一次查询没有看到的行。

幻读和不可重复读有些类似，但是**幻读强调的是集合的增减，而不是单条数据的更新。**

![img](https://s2.loli.net/2022/04/14/ol2gQwAb1pHhLtJ.png)

### 第一类更新丢失

事务A和事务B都对数据进行更新，但是事务A由于某种原因事务回滚了，把已经提交的事务B的更新数据给覆盖了。这种现象就是第一类更新丢失。

![v2-df373501c48e4bba633c859944394e53_720w](https://s2.loli.net/2022/04/14/aPmCBrOJgtjyzKb.png)

### 第二类更新丢失

其实跟第一类更新丢失有点类似，也是两个事务同时对数据进行更新，但是事务A的更新把已提交的事务B的更新数据给覆盖了。这种现象就是第二类更新丢失。

![v2-b865701afea8e74b2370187c4837da49_720w](https://s2.loli.net/2022/04/14/vWftaZhCDqbkrQH.png)

### 事务隔离级别

为了解决以上的问题，主流的关系型数据库都会提供四种事务的隔离级别。事务隔离级别从低到高分别是：读未提交，读已提交，可重复读，串行化。事务隔离级别越高，越能保证数据的一致性和完整性，但是执行效率也越低，所以在设置数据库的事务隔离级别时需要做一下权衡，mysql默认是可重复读

#### 读未提交

读未提交(Read Uncommitted)，是最低的隔离级别，**所有的事务都可以看到其他未提交的事务的执行结果。**只能防止第一类更新丢失，不能解决脏读，可重复读，幻读，所以很少应用于实际项目。

#### 读已提交

读已提交(Read Committed)，在该隔离级别下，**一个事务的更新操作只有在该事务提交之后，另外一个事务才可能读取到同一笔数据更新后的结果。**可以防止脏读和第一类更新丢失，但是不能解决可重复和幻读的问题。

#### 可重复读（重要）

可重复读(Repeatable Read)，mysql默认的隔离级别。在该隔离级别下，**一个事务多次读同一个数据，在这个事务还没有结束时，其他事务不能访问该数据（包括了读写）**，这样就可以在同一个事务内两次读到的数据是一样的。可以防止脏读、不可重复读、第一类更新丢失，第二类更新丢失的问题，不过还是会出现幻读。

#### 串行化

串行化(Serializable)，这是最高的隔离级别。它要求事务序列化执行，事务只能一个接着一个的执行，不能并发执行。在这个级别，可以解决上面提到的所有并发问题，但是可能导致大量的超时现象和锁竞争，通常不会用这个隔离级别。

### 总结

![img](https://s2.loli.net/2022/04/14/gc79sbjK3ZyDrp5.jpg)

## 扩展：回滚机制

在mysql中，恢复机制是通过回滚日志（undo log）实现的，所有的事务进行的修改都会先记录到这个回滚日志中，然后在堆数据库中的对应进行写入。

mysql的事务是由redo和undo的，redo操作的所有信息都是记录到重做日志（redo_log）中，也就是说当一个事务做commit操作时，需要先把这个事务的操作写到redo_log中，然后在把这些操作flush到磁盘上，当出现故障时，只需要读取redo_log，然后在重新flush到磁盘就行了。

而对于undo就比较麻烦，mysql在处理事务时，会在数据共享表空间里申请一个段就做segment段，用保存undo信息，当在处理rollback，不是完完全全的物理undo，而是逻辑undo，也就是说会之前的操作进行反操作（对于每个insert，回滚时会执行delete；对于每个delete，回滚时会执行insert；对于每个update，回滚时会执行一个相反的update，把数据改回去。），但是这些共享表空间是不进行回收的。这些表空间的回收需要由mysql的master thread进程进行回收。



# 29、测试事务实现转账

> 执行事务

```sql

-- 事务
-- mysql 是默认开启事务自动提交

-- 关闭
SET autocommit = 0; 
-- 开启（默认的）
SET autocommit = 1;

-- 手动处理事务

SET autocommit = 0;  -- 关闭自动提交

-- 事务开启
START TRANSACTION;  -- 标记一个事务的开始，从这个之后的sql都在同一个事务内

INSERT XX
INSERT XX

-- 提交 ： 持久化
COMMIT;
-- 回滚 ： 回到的原来的样子（失败）
ROLLBACK;
-- 事务结束
SET autocommit = 1; -- 开启自动提交

-- 了解
SAVEPOINT 保存点名 -- 设置一个事务的保存点
ROLLBACK TO SAVEPOINT 保存点名 -- 回滚到保存点
RELEASE SAVEPOINT 保存点名 -- 撤销保存点
```

> 模拟场景

```sql
-- 转账

-- 创建数据库
CREATE DATABASE shop CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 使用shop数据库
USE `shop`;


-- 建表
CREATE TABLE `account`(
  `id` INT(3) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `money` DECIMAL(9,2) NOT NULL,
  PRIMARY KEY (`id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

-- 初始化数据
INSERT INTO account(`name`,`money`)
VALUES(1,'A',2000.00),
(2,'B',10000.00);

-- 模拟转账
SET autocommit = 0; -- 关闭自动提交

START TRANSACTION; -- 开启事务 （一组事务）

UPDATE account SET `money`=`money`-500 WHERE `name`='A'; -- A减500
UPDATE account SET `money`=`money`+500 WHERE `name`='B'; -- B加500

COMMIT; -- 提交事务，就会被持久化了

ROLLBACK; -- 回滚

SET autocommit = 1; -- 恢复自动提交
```



# 30、索引介绍及索引的分类

> Msql官方对索引的定义为：**索引（index）是帮助MySQL高效获取数据的数据结构**。
>
> 提取句子主干，就可以得到索引的本质：索引是数据结构。



## 1.索引的分类

> 在一个表中，主键索引只能有一个，唯一索引可以有多个

- 主键索引（primary key）
  - 唯一的标识，主键不可重复，只能有一个列作为主键
- 唯一索引 （unique key）
  - 避免重复的列出现，可以重复，多个列都可以标示为唯一索引
- 常规索引（key/index）
  - 默认的 index 或者key关键字来设置
- 全文索引（FullText）
  - 在特定的数据库引擎下才有，myisam
  - 快速定位数据

基础语法

```sql
-- 索引的使用

-- 1.在创建表的时候给字段增加索引
-- 2.创建完毕后，增加索引

-- 显示所有的索引信息
SHOW INDEX FROM student;

-- 新增一个索引 (索引名) 列名

ALTER TABLE `student` ADD UNIQUE KEY `UK_IDENTITY_CARD` (`identity_card`);
ALTER TABLE `student` ADD KEY `K_STUDENT_NAME`(`student_name`);

ALTER TABLE `student`  ADD FULLTEXT INDEX `FI_PHONE` (`phone`);

-- explain 分析sql执行的状况

EXPLAIN SELECT * FROM student; -- 非全文索引

EXPLAIN SELECT * FROM student WHERE MATCH(`phone`) AGAINST('138'); -- 全文索引
```

[【MySQL优化】——看懂explain_漫漫长途，终有回转；余味苦涩，终有回甘-CSDN博客_explain](https://blog.csdn.net/jiadajing267/article/details/81269067)

# 31、SQL编程创建100万条数据测试索引

```sql
CREATE TABLE app_user (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` VARCHAR(50)  DEFAULT '' COMMENT '用户昵称',
  `email` VARCHAR(50)  NOT NULL COMMENT '用户邮箱',
  `phone` VARCHAR(20)  DEFAULT '' COMMENT '手机号',
  `gender` TINYINT(4)  UNSIGNED DEFAULT '0' COMMENT '性别（0：男  1：女）',
  `password` VARCHAR(100)  NOT NULL COMMENT '密码',
  `age` TINYINT(4)  DEFAULT '0' COMMENT '年龄',
  `create_time` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COMMENT='app用户表'


-- 插入100万数据b (函数)

DELIMITER $$ -- 写函数之前必须要写，分隔符标志
CREATE FUNCTION mock_data()
RETURNS INT
BEGIN
  DECLARE num INT DEFAULT 1000000;
  DECLARE i INT DEFAULT 0;
  WHILE i<num DO
    INSERT INTO app_user(`name`,`email`,`phone`,`gender`,`password`,`age`)
    VALUES(CONCAT('用户',i),'123345@qq.com',CONCAT('18',FLOOR(RAND()*((999999999-100000000)+100000000))),FLOOR(RAND()*2),UUID(),FLOOR(RAND()*100));
    SET i = i+1;
  END WHILE;
  RETURN i;
END;

-- 执行函数
SELECT mock_data();

SELECT * FROM app_user;

-- 函数中间的插入脚本
INSERT INTO app_user(`name`,
`email`,
`phone`,
`gender`,
`password`,
`age`)
VALUES(CONCAT('用户X'),
'123345@qq.com',
CONCAT('18',FLOOR(RAND()*((999999999-100000000)+100000000))),
FLOOR(RAND()*2),
UUID(),
FLOOR(RAND()*100));
```

测试

```sql
-- 加索引前
SELECT * FROM app_user WHERE `name` = '用户9999'; -- 0.440 sec
EXPLAIN SELECT * FROM app_user WHERE `name` = '用户9999';

-- 创建索引
-- id_表名_字段名  索引名
-- CREATE INDEX 索引名 ON 表名(`字段名`);
CREATE INDEX id_app_user_name ON app_user(`name`);
 -- 加索引后
SELECT * FROM app_user WHERE `name` = '用户9999'; -- 0.002 sec
EXPLAIN SELECT * FROM app_user WHERE `name` = '用户9999';
```

加索引前

![image-20210704114603590](https://s2.loli.net/2022/04/14/r5CxlmBzM4b7QcK.png)

加索引后

![image-20210704114402938](https://s2.loli.net/2022/04/14/fDybtz9WEvewu4g.png)

**索引在小数据量的时候，用处不大，但是再大数据的时候，区分十分明显**

# 32、索引原则

- 索引不是越多越好
- 不要对经常变动的数据加索引
- 小数据量的表不需要加索引
- 索引一般加载常用来查询的字段上

> 索引的数据结构

Hash类型的索引

bree ：innodb的默认数据结构



[CodingLabs - MySQL索引背后的数据结构及算法原理](http://blog.codinglabs.org/articles/theory-of-mysql-index.html)

# 33、数据库用户管理

> sql yog 可视化管理

![image-20210704145840971](https://s2.loli.net/2022/04/14/Iqm2KXw5hxtl7fG.png)

> sql 命令操作

用户表：mysql.user

本质:读这张表进行增删改查

```sql
-- 创建用户
CREATE USER zyy IDENTIFIED BY '123456';

-- 修改密码(修改当前用户密码)
SET PASSWORD = PASSWORD('123456');

-- 修改密码(修改指定用户密码)
SET PASSWORD FOR zyy = PASSWORD('123456');


-- 重命名  RENAME 原名子 zyy TO 新名字;
RENAME USER zyy TO newzyy;


-- 用户授权  ALL PRIVILEGES 全部的权限，库，表

-- ALL PRIVILEGES 除了给别人授权不行，其他都能干

GRANT ALL PRIVILEGES ON *.* TO newzyy;

-- 查询权限

SHOW GRANTS FOR newzyy; -- 查看指定用户的权限

SHOW GRANTS FOR root@localhost; -- 查看root用户的权限

-- 撤销权限   REVOKE哪些权限，在哪个库，给谁撤销
REVOKE ALL PRIVILEGES ON *.* FROM newzyy;

-- 删除用户
DROP USER newzyy;
```

# 34、MySQL备份

为什么要备份？

- 保证重要的数据不丢失
- 数据转移



mysql数据库备份的方式

- 直接拷贝物理文件

- 在sqlyog这种可视化工具中手动导出

  - 在想要导出的表或者库中，右键，

    ![image-20210704155338509](https://s2.loli.net/2022/04/14/ZjiHdk8mE9RoMfI.png)

- 使用命令行导出 mysqldump 命令行使用

  ```bash
  # 一张表 mysqldump -h主机 -u用户名 -p密码 数据库 表名 >物理磁盘位置/文件名
  mysqldump -hlocalhost -uroot -p123456 school student >D:/a.sql
  
  # 多张表 mysqldump -h主机 -u用户名 -p密码 数据库 表名1 表名2 >物理磁盘位置/文件名
  mysqldump -hlocalhost -uroot -p123456 school student result >D:/a.sql
  
  # 数据库 mysqldump -h主机 -u用户名 -p密码 数据库 >物理磁盘位置/文件名
  mysqldump -hlocalhost -uroot -p123456 school >D:/a.sql
  
  # 导入
  # 登录的情况下，切换到指定的数据库
  # source 备份文件
  # 也可以这样
  mysql -u用户名 -p密码 库名<备份文件
  ```

  ![image-20210704161230594](https://s2.loli.net/2022/04/14/sDgbIVakGZnLvmd.png)



假设你要备份数据库，防止数据丢失。

把数据库给别人，直接给sql即可。

# 35、如何设计一个项目的数据库

## 1.为什么需要设计

==当数据库比较复杂的时候，我们就需要设计了==

**糟糕的数据库设计**

- 数据冗余，浪费空间
- 数据库插入和删除都会麻烦、异常（屏蔽使用物理外键）
- 程序的性能差

**良好的数据库设计**

- 节省内存空间
- 保证数据库的完整性
- 方便我们开发系统

**软件开发中，关于数据库的设计**

- 分析需求，分析业务和需要处理的数据库的需求
- 概要设计：设计关系图E-R图

**设计数据库的步骤（个人博客）**

- 收集信息，分析需求

  - 用户表（用户登录注销，用户的个人信息，写博客，创建分类）

    ![image-20210704162821445](https://s2.loli.net/2022/04/14/ZMQkEc6AgdiOPJq.png)

  - 分类表（文章分类，谁创建的）

    ![image-20210704163120753](https://s2.loli.net/2022/04/14/yrObDwF5LGkZdI9.png)

  - 文章表（文章信息）

    ![image-20210704164131400](https://s2.loli.net/2022/04/14/iZBgcmC7O5MNASQ.png)

  - 评论表

    ![image-20210704164555263](https://s2.loli.net/2022/04/14/QcFJMfg1bEYZHPh.png)

  - 友链表（友情链接信息）

    ![image-20210704164938625](https://s2.loli.net/2022/04/14/x2FirGQvowI93Lz.png)

  - 自定义表（系统信息，某个关键的字，或者一些主字段） `key:value`

  - 关注表(粉丝数)

    ![image-20210704165556127](https://s2.loli.net/2022/04/14/rZniNhHslquTD3k.png)

  - 说说表（发表心情， id...content...create_time）

- 标识实体（把需求落到每个字段）

- 标识实体之间的关系

  - 写博客：user --> blog
  - 创建分类：user --> category
  - 关注：user --> user
  - 友链：links
  - 评论：user --> user --> blog



(bbs / crm)

# 36、数据库三大范式（了解）

**为什么需要数据规范化？**

- 信息重复
- 更新异常
- 插入异常
  - 无法正常显示信息
- 删除异常
  - 丢失有效的信息

> 三大范式

**第一范式（1NF）**

原子性：保证每一列不可再分

**第二范式（2NF）**

前提：满足第一范式

第二范式需要确保数据库表中的每一列都和主键相关，而不能只与主键的某一部分相关（主要针对联合主键而言）。

每张表只描述一件事情

**第三范式（3NF）**

前提：满足第一范式和第二范式

第三范式需要确保数据表中的每一列数据都和主键直接相关，而不能间接相关。



规范数据库的设计



**规范性和性能的问题**

关联查询的表不得超过三张表

- 考虑商业化的需求和目标（成本，用户体验）数据库的性能更加重要
- 在规范性能的问题的时候，需要适当的考虑一下规范性
- 故意给某些表增加一些冗余的字段。（从多表查询中变为单表查询）
- 故意增加一些计算列（从大数据库降低为小数据量的查询：索引）

# 37、数据库驱动和JDBC

## 1.数据库驱动

驱动：声卡，显卡，数据库

![image-20210713212553844](https://s2.loli.net/2022/04/14/m4qTjHiXNyLoDY1.png)

我们的程序会通过数据库驱动，和数据库打交道！

## 2.JDBC

SUN公司为了简化开发人员的（对数据库的统一）操作，提供了一个（java操作数据库的）规范，俗称JDBC

这些规范的实现由具体的厂商去做~

对于开发人员来说，我们只需要掌握JDBC接口的操作即可！

![image-20210713213250382](https://s2.loli.net/2022/04/14/xgGPbdJMX54O2l1.png)

java.sql

javax.sql

还需要导入一个数据库驱动包 mysql-connector-java-5.1.47.jar

# 38、第一个JDBC程序

> 创建测试数据库

```sql
CREATE DATABASE jdbcstudy CHARACTER SET utf8 COLLATE utf8_general_ci;

USER jdbcstudy;

CREATE TABLE users(
  `id` INT PRIMARY KEY,
  `name` VARCHAR(40),
  `password` VARCHAR(40),
  `email` VARCHAR(60),
  `birthday` DATE
);

INSERT INTO users(`id`,`name`,`password`,`email`,`birthday`)
VALUES(1,'张三','123456','zs@sina.com','1980-12-04'),
(2,'李四','123456','lisi@sina.com','1981-12-04'),
(3,'王五','123456','wangwu@sina.com','1982-12-04');
```

1. 创建一个普通项目

2. 导入数据库驱动（jar包）

   ![image-20210713215804024](https://s2.loli.net/2022/04/14/LIY57vZHEi6eNgu.png)

3. 编写测试代码

   ```java
   import java.sql.Connection;
   import java.sql.DriverManager;
   import java.sql.ResultSet;
   import java.sql.SQLException;
   import java.sql.Statement;
   
   /**
    * @ClassName: JDBCDemo01
    * @Description: 我的第一个JDBC程序
    * @Author: zyy
    * @Date: 2021/07/13 21:59
    * @Version: 1.0
    */
   public class JDBCDemo01 {
       public static void main(String[] args) throws ClassNotFoundException, SQLException {
           //1.加载驱动
   //        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
           //推荐这种写法加载驱动
           Class.forName("com.mysql.jdbc.Driver");
           //2.用户信息和URL
           // useSSL=true可能会报错
           String url = "jdbc:mysql://localhost:3306/jdbcstudy?useUnicode=true&characterEncoding=utf8&useSSL=false";
           String userName = "root";
           String passWord = "123456";
           //3.连接成功，数据库对象 Connection代表数据库
           Connection connection = DriverManager.getConnection(url, userName, passWord);
           //4.执行SQl的对象 Statement 执行的sql对象
           Statement statement = connection.createStatement();
           //5.执行SQL的对象 去 执行SQL ，可能存在结果，查看返回的结果
           String sql = "SELECT * FROM users";
           //返回的结果集 结果集中封装了我们全部的查询的结果
           ResultSet resultSet = statement.executeQuery(sql);
           while (resultSet.next()) {
               System.out.println("id="+resultSet.getObject("id"));
               System.out.println("name="+resultSet.getObject("name"));
               System.out.println("password="+resultSet.getObject("password"));
               System.out.println("email="+resultSet.getObject("email"));
               System.out.println("birthday="+resultSet.getObject("birthday"));
               System.out.println("===============================");
           }
           //6.释放连接
           resultSet.close();
           statement.close();
           connection.close();
       }
   }
   ```
   
   

步骤总结：

1. 加载驱动
2. 连接数据库DriverManager
3. 获取执行SQL的对象 Statement
4. 获得返回的结果集
5. 释放连接



# 39、JDBC中对象1解释

>DriverManager

```java
//1.加载驱动
//DriverManager.registerDriver(new com.mysql.jdbc.Driver());
//推荐这种写法加载驱动
Class.forName("com.mysql.jdbc.Driver");

Connection connection = DriverManager.getConnection(url, userName, passWord);
// connection代表数据库
// 数据库设置自动提交
// 事务提交
// 事务回滚
connection.setAutoCommit(true);
connection.commit();
connection.rollback();
```

> URL

```java
String url = "jdbc:mysql://localhost:3306/jdbcstudy?useUnicode=true&characterEncoding=utf8&useSSL=false";

// mysql默认端口3306
// 协议://主机地址:端口号/数据库名?参数1&参数2&参数3
// oracle默认端口1521
// jdbc:oracle:thin:@localhost:1521:sid
```

> Statement 执行sql对象  、  PreparedStatement 执行sql对象

```java
String sql = "SELECT * FROM users";//编写SQL

statement.executeQuery();//执行查询 返回ResultSet
statement.executeUpdate();//新增，删除，修改，都用这个，返回受影响的行数
statement.execute();//执行任何SQL
```

> ResultSet 查询的结果集，封装了所有的查询结果

获得指定的数据类型

```java
//在不知道列类型的情况下使用
resultSet.getObject();
//如果知道列类型，就使用指定的类型
resultSet.getString();
resultSet.getInt();
resultSet.getDouble();
resultSet.getBigDecimal();
resultSet.getFloat();
resultSet.getDate();
//...
```

遍历，指针

```java
resultSet.beforeFirst();//移动到最前面
resultSet.afterLast();//移动到最后面
resultSet.next();//移动到下一个数据
resultSet.previous();//移动到前一行
resultSet.absolute(row);//移动到指定行
```

> 释放资源

```java
resultSet.close();
statement.close();
connection.close();//消耗资源
```



# 40、statement对象详解

==jdbc中的statement对象用于向数据库发送SQL语句，想完成对数据库的增删改查，只需要通过这个对象向数据库发送增删改查语句即可。==

Statement对象的executeUpdate方法，用于向数据库发送增、删、改的SQL语句，executeUpdate执行完后，将会返回一个整数（即增删改语句导致了数据库几行数据发送了变化）。

Statement.executeQuery方法用于向数据库发送查询语句，executeQuery方法返回代表查询结果的ResultSet对象。

> CRUD操作-create

使用executeUpdate(String sql)方法完成数据添加操作，示例操作：

```java
Statement statement = connection.createStatement();
String sql = "insert into user(...) values(...)";
int num = statement.executeUpdate(sql);
if (num > 0) {
    System.out.println("插入成功~");
}
```

>CRUD操作-delete

```java
Statement statement = connection.createStatement();
String sql = "delete from user where id=1";
int num = statement.executeUpdate(sql);
if (num > 0) {
    System.out.println("删除成功~");
}
```

> CRUD操作-update

```java
Statement statement = connection.createStatement();
String sql = "update user set name='' where name =''";
int num = statement.executeUpdate(sql);
if (num > 0) {
    System.out.println("修改成功~");
}
```

> CRUD操作-read

```java
Statement statement = connection.createStatement();
String sql = "SELECT * FROM users";
ResultSet resultSet = statement.executeQuery(sql);
while (resultSet.next()) {
    //根据获取列的数据类型，分别调用resultSet的相应方法映射到java对象中
}
```

> 代码实现

1. 提取工具类

   ```java
   import java.io.IOException;
   import java.io.InputStream;
   import java.sql.Connection;
   import java.sql.DriverManager;
   import java.sql.ResultSet;
   import java.sql.SQLException;
   import java.sql.Statement;
   import java.util.Properties;
   
   /**
    * @ClassName: JDBCUtils
    * @Description: TODO 类描述
    * @Author: zyy
    * @Date: 2021/07/14 17:48
    * @Version: 1.0
    */
   public class JDBCUtils {
       private static String driver = null;
       private static String url = null;
       private static String username = null;
       private static String password = null;
   
       static {
           try {
               InputStream in = JDBCUtils.class.getClassLoader().getResourceAsStream("db.properties");
               Properties properties = new Properties();
               properties.load(in);
   
               driver = properties.getProperty("driver");
               url = properties.getProperty("url");
               username = properties.getProperty("username");
               password = properties.getProperty("password");
   
               //驱动只用加载一次
               Class.forName(driver);
           } catch (IOException e) {
               e.printStackTrace();
           } catch (ClassNotFoundException e) {
               e.printStackTrace();
           }
       }
   
       /**
        * 获取连接
        */
       public static Connection getConnection() throws SQLException {
           return DriverManager.getConnection(url, username, password);
       }
   
       /**
        * 释放资源
        */
       public static void release(Connection con, Statement st, ResultSet rs) {
           if (rs != null) {
               try {
                   rs.close();
               } catch (SQLException e) {
                   e.printStackTrace();
               }
           }
           if (st != null) {
               try {
                   st.close();
               } catch (SQLException e) {
                   e.printStackTrace();
               }
           }
           if (con != null) {
               try {
                   con.close();
               } catch (SQLException e) {
                   e.printStackTrace();
               }
           }
       }
   }
   ```

   配置文件db.properties

   ![image-20210714221731402](https://s2.loli.net/2022/04/14/DF9kHTdyaIYVpuq.png)

   ```properties
   driver=com.mysql.jdbc.Driver
   url=jdbc:mysql://localhost:3306/jdbcstudy?useUnicode=true&characterEncoding=utf8&useSSL=false
   username=root
   password=123456
   ```

   

2. 编写增删改的方法，`executeUpdate`

   ```java
   import com.zyy.lesson02.utils.JDBCUtils;
   
   import java.sql.Connection;
   import java.sql.ResultSet;
   import java.sql.SQLException;
   import java.sql.Statement;
   
   /**
    * @ClassName: TestInsert
    * @Description: TODO 类描述
    * @Author: zyy
    * @Date: 2021/07/14 18:19
    * @Version: 1.0
    */
   public class TestInsert {
       public static void main(String[] args) {
           Connection con = null;
           Statement st = null;
           ResultSet rs = null;
           try {
               con = JDBCUtils.getConnection();
               st = con.createStatement();
               String sql = "INSERT INTO users(`id`,`name`,`password`,`email`,`birthday`)\n" +
                       "VALUES (5,'钱七','123456','qianqi@sina.com','1988-12-04')";
               int num = st.executeUpdate(sql);
               if (num > 0) {
                   System.out.println("插入成功！");
               }
   
           } catch (SQLException e) {
               e.printStackTrace();
           } finally {
               JDBCUtils.release(con, st, rs);
           }
   
       }
   }
   ```

   ```java
   import com.zyy.lesson02.utils.JDBCUtils;
   
   import java.sql.Connection;
   import java.sql.ResultSet;
   import java.sql.SQLException;
   import java.sql.Statement;
   
   /**
    * @ClassName: TestDelete
    * @Description: TODO 类描述
    * @Author: zyy
    * @Date: 2021/07/14 22:11
    * @Version: 1.0
    */
   public class TestDelete {
       public static void main(String[] args) {
           Connection con = null;
           Statement st = null;
           ResultSet rs = null;
           try {
               con = JDBCUtils.getConnection();
               st = con.createStatement();
               String sql = "DELETE FROM users WHERE `id`=5";
               int num = st.executeUpdate(sql);
               if (num > 0) {
                   System.out.println("删除成功！");
               }
   
           } catch (SQLException e) {
               e.printStackTrace();
           } finally {
               JDBCUtils.release(con, st, rs);
           }
   
       }
   }
   ```

   ```java
   import com.zyy.lesson02.utils.JDBCUtils;
   
   import java.sql.Connection;
   import java.sql.ResultSet;
   import java.sql.SQLException;
   import java.sql.Statement;
   
   /**
    * @ClassName: TestUpdate
    * @Description: TODO 类描述
    * @Author: zyy
    * @Date: 2021/07/14 22:11
    * @Version: 1.0
    */
   public class TestUpdate {
       public static void main(String[] args) {
           Connection con = null;
           Statement st = null;
           ResultSet rs = null;
           try {
               con = JDBCUtils.getConnection();
               st = con.createStatement();
               String sql = "UPDATE users SET birthday='1990-12-01' WHERE id=1";
               int num = st.executeUpdate(sql);
               if (num > 0) {
                   System.out.println("更新成功！");
               }
   
           } catch (SQLException e) {
               e.printStackTrace();
           } finally {
               JDBCUtils.release(con, st, rs);
           }
   
       }
   }
   ```

3. 查询

   ```java
   import com.zyy.lesson02.utils.JDBCUtils;
   
   import java.sql.Connection;
   import java.sql.ResultSet;
   import java.sql.SQLException;
   import java.sql.Statement;
   
   /**
    * @ClassName: TestSelect
    * @Description: TODO 类描述
    * @Author: zyy
    * @Date: 2021/07/14 22:11
    * @Version: 1.0
    */
   public class TestSelect {
       public static void main(String[] args) {
           Connection con = null;
           Statement st = null;
           ResultSet rs = null;
           try {
               con = JDBCUtils.getConnection();
               st = con.createStatement();
               String sql = "SELECT * FROM users WHERE id=1";
               rs = st.executeQuery(sql);
               while (rs.next()) {
                   System.out.println("id="+rs.getInt("id"));
                   System.out.println("name="+rs.getString("name"));
               }
   
           } catch (SQLException e) {
               e.printStackTrace();
           } finally {
               JDBCUtils.release(con, st, rs);
           }
   
       }
   }
   ```

# 41、sql注入问题

sql存在漏洞，会被攻击导致数据泄露 ==SQL会被拼接==

```sql
import com.zyy.lesson02.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @ClassName: SQLQuestion
 * @Description: TODO 类描述
 * @Author: zyy
 * @Date: 2021/07/14 22:23
 * @Version: 1.0
 */
public class SQLQuestion {
    public static void main(String[] args) {

        //正常登录
//        login("张三","1234567");

        //sql注入
        login("' or '1=1","123456");

    }

    /**
     * 登录业务
     */
    public static void login(String userName, String password) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            con = JDBCUtils.getConnection();
            st = con.createStatement();
            String sql = "SELECT * FROM users WHERE `name`='"+userName+"' AND `password`='"+password+"'";
            // SELECT * FROM users WHERE `name`='' or '1=1' AND `password`='123456'
            System.out.println(sql);
            rs = st.executeQuery(sql);
            while (rs.next()) {
                System.out.println("id="+rs.getInt("id"));
                System.out.println("name="+rs.getString("name"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtils.release(con, st, rs);
        }
    }
}
```

导致结果：错误的用户名或者密码可以获取到全部的用户信息

![image-20210714223650768](https://s2.loli.net/2022/04/14/UPo17qr6Ou2ikFX.png)

# 42、PreparedStatement对象

PreparedStatement可以防止SQL注入，效率更好

1. 新增

   ```java
   import com.zyy.lesson02.utils.JDBCUtils;
   
   import java.sql.Connection;
   import java.sql.PreparedStatement;
   import java.sql.ResultSet;
   import java.sql.SQLException;
   
   /**
    * @ClassName: TestInsert
    * @Description: TODO 类描述
    * @Author: zyy
    * @Date: 2021/07/14 18:19
    * @Version: 1.0
    */
   public class TestInsert {
       public static void main(String[] args) {
           Connection con = null;
           PreparedStatement st = null;
           ResultSet rs = null;
           try {
               con = JDBCUtils.getConnection();
               //使用?占位符代替参数
               String sql = "INSERT INTO users(`id`,`name`,`password`,`email`,`birthday`) VALUES (?,?,?,?,?)";
               //预编译SQL，先写SQL，然后不执行
               st = con.prepareStatement(sql);
               //手动给参数赋值
               st.setInt(1, 5);
               st.setString(2, "钱七");
               st.setString(3, "123456");
               st.setString(4, "qianqi@sina.com");
               st.setDate(5, new java.sql.Date(new java.util.Date().getTime()));
               int num = st.executeUpdate();
               if (num > 0) {
                   System.out.println("插入成功！");
               }
   
           } catch (SQLException e) {
               e.printStackTrace();
           } finally {
               JDBCUtils.release(con, st, rs);
           }
   
       }
   }
   ```

2. 删除

   ```java
   import com.zyy.lesson02.utils.JDBCUtils;
   
   import java.sql.Connection;
   import java.sql.PreparedStatement;
   import java.sql.ResultSet;
   import java.sql.SQLException;
   
   /**
    * @ClassName: TestDelete
    * @Description: TODO 类描述
    * @Author: zyy
    * @Date: 2021/07/14 18:19
    * @Version: 1.0
    */
   public class TestDelete {
       public static void main(String[] args) {
           Connection con = null;
           PreparedStatement st = null;
           ResultSet rs = null;
           try {
               con = JDBCUtils.getConnection();
               //使用?占位符代替参数
               String sql = "DELETE FROM users WHERE `id`=?";
               //预编译SQL，先写SQL，然后不执行
               st = con.prepareStatement(sql);
               //手动给参数赋值
               st.setInt(1, 5);
               int num = st.executeUpdate();
               if (num > 0) {
                   System.out.println("删除成功！");
               }
   
           } catch (SQLException e) {
               e.printStackTrace();
           } finally {
               JDBCUtils.release(con, st, rs);
           }
   
       }
   }
   ```

3. 更新

   ```java
   import com.zyy.lesson02.utils.JDBCUtils;
   
   import java.sql.Connection;
   import java.sql.PreparedStatement;
   import java.sql.ResultSet;
   import java.sql.SQLException;
   
   /**
    * @ClassName: TestUpdate
    * @Description: TODO 类描述
    * @Author: zyy
    * @Date: 2021/07/14 18:19
    * @Version: 1.0
    */
   public class TestUpdate {
       public static void main(String[] args) {
           Connection con = null;
           PreparedStatement st = null;
           ResultSet rs = null;
           try {
               con = JDBCUtils.getConnection();
               //使用?占位符代替参数
               String sql = "UPDATE users SET birthday=? WHERE id=?";
               //预编译SQL，先写SQL，然后不执行
               st = con.prepareStatement(sql);
               //手动给参数赋值
               st.setDate(1, new java.sql.Date(new java.util.Date().getTime()));
               st.setInt(2, 1);
               int num = st.executeUpdate();
               if (num > 0) {
                   System.out.println("修改成功！");
               }
   
           } catch (SQLException e) {
               e.printStackTrace();
           } finally {
               JDBCUtils.release(con, st, rs);
           }
   
       }
   }
   ```

4. 查询

   ```java
   import com.zyy.lesson02.utils.JDBCUtils;
   
   import java.sql.Connection;
   import java.sql.PreparedStatement;
   import java.sql.ResultSet;
   import java.sql.SQLException;
   
   /**
    * @ClassName: TestSelect
    * @Description: TODO 类描述
    * @Author: zyy
    * @Date: 2021/07/14 18:19
    * @Version: 1.0
    */
   public class TestSelect {
       public static void main(String[] args) {
           Connection con = null;
           PreparedStatement st = null;
           ResultSet rs = null;
           try {
               con = JDBCUtils.getConnection();
               //使用?占位符代替参数
               String sql = "SELECT * FROM users WHERE id=?";
               //预编译SQL，先写SQL，然后不执行
               st = con.prepareStatement(sql);
               //手动给参数赋值
               st.setInt(1, 1);
               rs = st.executeQuery();
               while (rs.next()) {
                   System.out.println("id="+rs.getInt("id"));
                   System.out.println("name="+rs.getString("name"));
               }
           } catch (SQLException e) {
               e.printStackTrace();
           } finally {
               JDBCUtils.release(con, st, rs);
           }
   
       }
   }
   ```

5. 防止sql注入

   ```java
   import com.zyy.lesson02.utils.JDBCUtils;
   
   import java.sql.Connection;
   import java.sql.PreparedStatement;
   import java.sql.ResultSet;
   import java.sql.SQLException;
   
   /**
    * @ClassName: SQLQuestion
    * @Description: TODO 类描述
    * @Author: zyy
    * @Date: 2021/07/14 18:19
    * @Version: 1.0
    */
   public class SQLQuestion {
       public static void main(String[] args) {
   
           //正常登录
   //        login("张三","123456");
   
           //sql注入
           login("' or '1=1", "123456");
   
       }
   
       /**
        * 登录业务
        */
       public static void login(String userName, String password) {
           Connection con = null;
           PreparedStatement st = null;
           ResultSet rs = null;
           try {
               con = JDBCUtils.getConnection();
               // PreparedStatement 防止SQL注入的本质，把传递进来的参数当做字符
               // 假设其中存在转义字符，比如说'会被直接转义
               String sql = "SELECT * FROM users WHERE `name`=? AND `password`=?";
               st = con.prepareStatement(sql);
               st.setString(1, userName);
               st.setString(2, password);
               rs = st.executeQuery();
               while (rs.next()) {
                   System.out.println("id=" + rs.getInt("id"));
                   System.out.println("name=" + rs.getString("name"));
               }
   
           } catch (SQLException e) {
               e.printStackTrace();
           } finally {
               JDBCUtils.release(con, st, rs);
           }
       }
   }
   ```

   执行结果：查不到任何结果

# 43、使用idea连接数据库

![image-20210715092417582](https://s2.loli.net/2022/04/14/Qke3RDim1yZuvhY.png)

连接成功后，就可以选择数据库

![image-20210715095230497](https://s2.loli.net/2022/04/14/UV7Bk1gGbnWp3Po.png)

![image-20210715095449617](https://s2.loli.net/2022/04/14/yt9wfGMYxvo1S7e.png)

连接不上的话，可以看一下下面这里，配置对应的mysql版本

![image-20210715214953909](https://s2.loli.net/2022/04/14/e4R5936a18jMqSY.png)

双击数据库

![image-20210715095953750](https://s2.loli.net/2022/04/14/9TsIAXR75DL2ogE.png)

更新数据（提交）

![image-20210715100117897](https://s2.loli.net/2022/04/14/BOE1WV2t3HLTu5w.png)

![image-20210715214142285](https://s2.loli.net/2022/04/14/unOXPUWGS49Rjy1.png)

idea编写sql

```sql
create table account
(
    id    int primary key auto_increment,
    name  varchar(40),
    money float
);

insert into account(name, money)
values ('A', 1000),
       ('B', 1000),
       ('C', 1000);
```

![image-20210715214803462](https://s2.loli.net/2022/04/14/4xfmuIAMqeW3rC2.png)

# 44、JDBC操作事务

==要么都成功，要么都失败==

> ACID原则

原子性：要么全部成功，要么全部失败

一致性：总数不变

隔离性：多个进程互不干扰

持久性：一旦提交不可逆，持久化到数据库了



隔离性的问题：

脏读：一个事务读取了另外一个没有提交的事务

不可重复读：在同一个事务内，重复读取表中数据，表数据发生了改变

幻读：在一个事务内，读取到了别人插入的数据，导致前后读出来的结果不一致



> 代码实现

1. 开启事务`con.setAutoCommit(false);`
2. 一组业务执行完毕，提交事务
3. 可以在catch语句中显示的定义回滚语句，但是默认失败就会回滚

正常情况

```java
import com.zyy.lesson02.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @ClassName: TestTransaction1
 * @Description: TODO 类描述
 * @Author: zyy
 * @Date: 2021/07/15 21:59
 * @Version: 1.0
 */
public class TestTransaction1 {
    public static void main(String[] args) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = JDBCUtils.getConnection();
            //关闭自动提交 自动会开启事务
            con.setAutoCommit(false);//开启事务
            // A 转 B 100元
            String sql1 = "update account set money=money-100 where name='A'";
            ps = con.prepareStatement(sql1);
            ps.executeUpdate();
            String sql2 = "update account set money=money+100 where name='B'";
            ps = con.prepareStatement(sql2);
            ps.executeUpdate();
            //业务完毕，提交事务
            con.commit();

            System.out.println("A 转 B 100元 成功！");
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                con.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } finally {
            JDBCUtils.release(con, ps, rs);
        }
    }
}

```

异常情况

```java
import com.zyy.lesson02.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @ClassName: TestTransaction1
 * @Description: TODO 类描述
 * @Author: zyy
 * @Date: 2021/07/15 21:59
 * @Version: 1.0
 */
public class TestTransaction2 {
    public static void main(String[] args) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = JDBCUtils.getConnection();
            //关闭自动提交 自动会开启事务
            con.setAutoCommit(false);//开启事务
            // A 转 B 100元
            String sql1 = "update account set money=money-100 where name='A'";
            ps = con.prepareStatement(sql1);
            ps.executeUpdate();

            //默认失败
            int x = 1/0; //一定会异常

            String sql2 = "update account set money=money+100 where name='B'";
            ps = con.prepareStatement(sql2);
            ps.executeUpdate();
            //业务完毕，提交事务
            con.commit();

            System.out.println("A 转 B 100元 成功！");
        } catch (SQLException e) {
            e.printStackTrace();
            //如果异常，默认也会回滚，下面不写也可以
//            try {
//                con.rollback();
//            } catch (SQLException ex) {
//                ex.printStackTrace();
//            }
        } finally {
            JDBCUtils.release(con, ps, rs);
        }
    }
}
```



# 45、DBCP-C3P0连接池

数据库连接 -- 执行完毕 -- 释放

连接-- 释放  是十分浪费系统资源的

池化技术：准备一些预先的资源，过来就连接预先准备好的



最小连接数：10(常用连接)

最大连接数：100 （业务最高承载上线）

等待超时：100ms



编写连接池，实现一个接口DataSource



> 开源数据源实现

DBCP

C3p0

Druid:阿里巴巴



使用了这些数据库连接池之后，我们在项目开发中就不需要编写连接数据库的代码了

> DBCP

需要用到的jar包

commons-dbcp-1.4

commons-pool-1.6

配置文件dbcp.properties

```properties
#连接设置
driverClassName=com.mysql.jdbc.Driver
url=jdbc:mysql://localhost:3306/jdbcstudy?useUnicode=true&characterEncoding=utf8&useSSL=false
username=root
password=123456

#初始化连接
initialSize=10

#最大连接数量
maxActive=50

#最大空闲连接
maxIdle=20

#最小空闲连接
minIdle=5

#超时等待时间以毫秒为单位 6000毫秒/1000等于60秒
maxWait=60000
#JDBC驱动建立连接时附带的连接属性属性的格式必须为这样：【属性名=property;】
#注意：user 与 password 两个属性会被明确地传递，因此这里不需要包含他们。
connectionProperties=useUnicode=true;characterEncoding=UTF8

#指定由连接池所创建的连接的自动提交（auto-commit）状态。
defaultAutoCommit=true

#driver default 指定由连接池所创建的连接的只读（read-only）状态。
#如果没有设置该值，则“setReadOnly”方法将不被调用。（某些驱动并不支持只读模式，如：Informix）
defaultReadOnly=

#driver default 指定由连接池所创建的连接的事务级别（TransactionIsolation）。
#可用值为下列之一：（详情可见javadoc。）NONE,READ_UNCOMMITTED, READ_COMMITTED, REPEATABLE_READ, SERIALIZABLE
defaultTransactionIsolation=READ_COMMITTED
```

工具类

```java
import org.apache.commons.dbcp.BasicDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * @ClassName: JDBCDBCPUtils
 * @Description: TODO 类描述
 * @Author: zyy
 * @Date: 2021/07/14 17:48
 * @Version: 1.0
 */
public class JDBCDBCPUtils {
    private static DataSource dataSource = null;

    static {
        try {
            InputStream in = JDBCDBCPUtils.class.getClassLoader().getResourceAsStream("dbcp.properties");
            Properties properties = new Properties();
            properties.load(in);
            //创建数据源 工厂模式
            dataSource = BasicDataSourceFactory.createDataSource(properties);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取连接
     */
    public static Connection getConnection() throws SQLException {
        //从数据源中获取连接
        return dataSource.getConnection();
    }

    /**
     * 释放资源
     */
    public static void release(Connection con, Statement st, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (st != null) {
            try {
                st.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
```

测试类

```java
import com.zyy.lesson02.utils.JDBCUtils;
import com.zyy.lesson05.utils.JDBCDBCPUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @ClassName: TestDBCP
 * @Description: TODO 类描述
 * @Author: zyy
 * @Date: 2021/07/15 22:41
 * @Version: 1.0
 */
public class TestDBCP {
    public static void main(String[] args) {
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            con = JDBCDBCPUtils.getConnection();
            //使用?占位符代替参数
            String sql = "INSERT INTO users(`id`,`name`,`password`,`email`,`birthday`) VALUES (?,?,?,?,?)";
            //预编译SQL，先写SQL，然后不执行
            st = con.prepareStatement(sql);
            //手动给参数赋值
            st.setInt(1, 5);
            st.setString(2, "钱七");
            st.setString(3, "123456");
            st.setString(4, "qianqi@sina.com");
            st.setDate(5, new java.sql.Date(new java.util.Date().getTime()));
            int num = st.executeUpdate();
            if (num > 0) {
                System.out.println("插入成功！");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCDBCPUtils.release(con, st, rs);
        }

    }
}
```

> C3P0

需要用到的jar包

c3p0-0.9.5.5.jar

mchange-commons-java-0.2.19.jar

配置文件c3p0-config.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<c3p0-config>
    <!--
    c3p0的缺省（默认）配置
    如果在代码中ComboPooledDataSource ds=new ComboPooledDataSource();这样写就表示使用的是c3p0的缺省（默认）
    -->
    <default-config>
        <property name="driverClass">com.mysql.jdbc.Driver</property>
        <property name="jdbcUrl">jdbc:mysql://localhost:3306/jdbcstudy?useUnicode=true&amp;characterEncoding=utf8&amp;useSSL=false&amp;serverTimezone=UTC</property>
        <property name="user">root</property>
        <property name="password">123456</property>
        <property name="acquiredIncrement">5</property>
        <property name="initialPoolSize">10</property>
        <property name="minPoolSize">5</property>
        <property name="maxPoolSize">20</property>
    </default-config>


    <!--
    c3p0的命名配置
    如果在代码中ComboPooledDataSource ds=new ComboPooledDataSource("MySQL");这样写就表示使用的是name是MySQL
    -->
    <name-config name="MySQL">
        <property name="driverClass">com.mysql.jdbc.Driver</property>
        <property name="jdbcUrl">jdbc:mysql://localhost:3306/jdbcstudy?useUnicode=true&amp;characterEncoding=utf8&amp;useSSL=false&amp;serverTimezone=UTC</property>
        <property name="user">root</property>
        <property name="password">123456</property>
        <property name="acquiredIncrement">5</property>
        <property name="initialPoolSize">10</property>
        <property name="minPoolSize">5</property>
        <property name="maxPoolSize">20</property>
    </name-config>
</c3p0-config>
```



工具类

```java
import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @ClassName: JDBCC3P0Utils
 * @Description: TODO 类描述
 * @Author: zyy
 * @Date: 2021/07/14 17:48
 * @Version: 1.0
 */
public class JDBCC3P0Utils {
    private static DataSource dataSource = null;
    //private static ComboPooledDataSource dataSource = null;


    static {
        try {
            //代码的方式配置
//            dataSource = new ComboPooledDataSource();
//            dataSource.setDriverClass();
//            dataSource.setJdbcUrl();
//            dataSource.setUser();
//            dataSource.setPassword();
//            dataSource.setMaxPoolSize();
//            dataSource.setMinPoolSize();
            //配置文件写法
            dataSource = new ComboPooledDataSource("MySQL");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取连接
     */
    public static Connection getConnection() throws SQLException {
        //从数据源中获取连接
        return dataSource.getConnection();
    }

    /**
     * 释放资源
     */
    public static void release(Connection con, Statement st, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (st != null) {
            try {
                st.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
```

测试类

```java
import com.zyy.lesson05.utils.JDBCC3P0Utils;
import com.zyy.lesson05.utils.JDBCDBCPUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @ClassName: TestC3P0
 * @Description: TODO 类描述
 * @Author: zyy
 * @Date: 2021/07/15 22:41
 * @Version: 1.0
 */
public class TestC3P0 {
    public static void main(String[] args) {
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            con = JDBCC3P0Utils.getConnection();
            //使用?占位符代替参数
            String sql = "INSERT INTO users(`id`,`name`,`password`,`email`,`birthday`) VALUES (?,?,?,?,?)";
            //预编译SQL，先写SQL，然后不执行
            st = con.prepareStatement(sql);
            //手动给参数赋值
            st.setInt(1, 6);
            st.setString(2, "刘八");
            st.setString(3, "123456");
            st.setString(4, "liuba@sina.com");
            st.setDate(5, new java.sql.Date(new java.util.Date().getTime()));
            int num = st.executeUpdate();
            if (num > 0) {
                System.out.println("插入成功！");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCC3P0Utils.release(con, st, rs);
        }

    }
}
```

> 总结

无论用什么数据源，本质还是一样的，DataSource接口不会变，方法就不会变

![image-20210719174041225](https://s2.loli.net/2022/04/14/meEhUxY9ruPL7KA.png)

# 附录：

> 关于mysqld命令中的d的解释

- mysqld是mysql的后台程序，即mysql服务器。想要使用客户端程序，该程序必须运行，mysqld是mysql deamon（Mysql守护进程）的意思。
- mysql 是个命令行程序。
- mysqld 是服务。linux 系统里一般的服务都是以 d 结尾的，比如 httpd，vsftpd 等等。
- d 的全拼应该是 deamon，也就是守护程序的意思，常驻于后台。这个地方的守护进程就是指的服务。
