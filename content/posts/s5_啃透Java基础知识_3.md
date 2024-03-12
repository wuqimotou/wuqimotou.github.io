---
title: 【啃透Java基础知识】3Java基本运算符
subtitle:

date: 2024-03-12T16:06:51+08:00
slug: Java basic operators

description: "啃透Java基础知识第三期"

keywords: "java, java基础知识, java学习, 运算符"

draft: false

comment: false

tags:
  - 啃透Java基础知识

categories:
  - study
author:
  name: "wuqimotou"
  link:
  email: "wuqimotou@163.com"
  avatar: "https://s11.ax1x.com/2024/03/05/pFDNaVI.png"
license:
weight: 0
hiddenFromHomePage: false
hiddenFromSearch: false
hiddenFromRss: false
hiddenFromRelated: false
summary:
resources:
  - name: featured-image
    src: featured-image.jpg
  - name: featured-image-preview
    src: featured-image-preview.jpg
toc: true
math: false
lightgallery: false
password:
message:
repost:
  enable: true
  url:

# See details front matter: https://fixit.lruihao.cn/documentation/content-management/introduction/#front-matter
---

参考资料：《Java 核心技术卷 I》

本章介绍了关于Java基本运算符的知识。

<!--more-->

# Java运算符

## 原码，反码，补码

计算机中的数都是以二进制的形式存储的。其中二进制的最高位是符号位，0为正，1为负。

正数的原码，反码，补码形式相同。

负数的反码为原码符号位不变，其他位按位取反。补码为反码加1。

计算机中任何数的运算都是补码形式的运算，而结果按照原码显示。

{{% admonition %}}

补码形式进行运算时符号位也参与运算。

{{% /admonition %}}

## 算术运算符

Java中，有`+`、`-`、`*`、`/`来表示加减乘除。

除法运算中，若两个操作数都是整数，则结果也是整数，这被称为整数除法。而其中若有一个及以上的浮点数，则为浮点除法。

{{% admonition %}}

整数除以0会产生异常，浮点数除以0会得到POSITIVE_INFINITY或NEGATIVE_INFINITY或NaN。

{{% /admonition %}}

Java中`%`表示取余，意味对操作数取余数。如：

~~~java
public class hello {
    public static void main(String[] args){
        System.out.println(15%2);
    }
}
>>> 1
~~~

{{% admonition %}}

在Java中，整数和浮点数都可以取余操作。对于浮点数取余，可以将其等效为以下过程：

`a%b => a-(int)(a/b)*b`

{{% /admonition %}}

Java中还有自增运算符`++`和自减运算符`--`。这两种运算符为单目运算符，可以放在变量的前面或者后面，如：

`++i`与`i++`。

两者的区别在于：

`a = ++i; => i += 1; temp = i; a = temp;`

`a = i++; => temp = i; i += 1; a = temp;`

辨析：

~~~java
public class hello {
    public static void main(String[] args){
        int i = 1;
        i = i++;
        System.out.println(i);
    }
}
>>> 1
    
public class hello {
    public static void main(String[] args){
        int i = 1;
        i = ++i;
        System.out.println(i);
    }
}
>>> 2
~~~



## 赋值运算符

赋值运算符`=`的左侧必须是变量，而右侧可以是变量，常量以及表达式。

赋值运算符可以和算术运算符相结合，如：

`x += 1;`等价于`x = x + 1;`

{{% admonition %}}

在Java中，赋值可以被看成一个表达式，该表达式的值等于所赋的那个值。

{{% /admonition %}}

## 逻辑运算符

逻辑运算符中包括关系运算符和逻辑运算符。

### 关系运算符

常见的关系运算符有

- `==`
- `>`
- `<`
- `>=`
- `<=`

这些运算符的用法与数学上一致，当表达式成立时，会返回`true`否则返回`false`。

### 逻辑运算符

逻辑运算符包括与`&&`、或`||`、非`!`。

其中

当`&&`两侧的表达式全为`true`时，返回`true`，否则返回`false`。

当`||`两侧表达式至少有一个为`true`时，返回`true`，否则返回`false`。

当`!`后的表达式为`true`时，返回`false`，反之亦然。

{{% admonition %}}

当`&&`所连接的第一个表达式为`false`时，整个表达式的结果必定为`false`，因此第二个表达式不会执行。

当`||`所连接的第一个表达式为`true`时，整个表达式的结果必定为`true`，因此第二个表达式不会执行。

{{% /admonition %}}

## 条件运算符

条件运算符`? :`是一个三目运算符。表达式为：

`condition ? expression1 : expression2`

其意为当`condition`为`true`时，表达式的值为`expression1`否则为`expression2`。

## 位运算符

位运算符有与`&`、或`|`、异或`^`、非`~`，以及移位运算符。

- 与`&`对两操作数的补码进行逐位与操作。
- 或`|`对两操作数的补码进行逐位或操作。
- 异或`^`对两操作数的补码进行逐位异或操作。
- 非`~`对操作数的补码进行逐位取反操作。

移位运算符有算数左移`<<`、算数右移`>>`和无符号右移`>>>`。

- 算数左移`<<`对操作数的补码向左移位，低位用0补全。
- 算数右移`>>`对操作数的补码向右移位，高位用符号位补全。
- 无符号右移`>>>`对操作数的补码向右移位，高位用0补全。

## 数学函数

对于Java基本运算符没覆盖到的一些数学运算，Java提供了一个`Math`类，其中包含可能会用到的各种数学函数。如：

- Math.sqrt(x)

​	对x进行开方。

- Math.pow(x, a)

​	计算x的a次方。

- Math.sin(x)

​	求出sin x。

- Math.cos(x)

​	求出cos x。

- Math.tan(x)

​	求出tan x。

- Math.atan(x)

​	根据正切值x求角度。

- Math.exp(x)

​	求e的x次方。

- Math.log(x)

​	求$ln x$。

- Math.log10(x)

​	求$log_{10}x$。

还有常用常量：

- Math.PI

- Math.E

