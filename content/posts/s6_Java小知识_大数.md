---
title: 【大数】范围超越Long和Double的数据类型
subtitle:

date: 2024-03-13T22:49:50+08:00
slug: BigInteger

description: "Java中的大数"

keywords: "Java, 大数"

draft: false

comment: false

tags:
  - Java小知识


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

 精度大于*long*和*double*的数据类型

<!--more-->

# 大数

当整数的范围超过了*long*所能表示的范围，或浮点数的精度超过了*double*所覆盖的范围，Java中提供了两个类用于表示这种大数。

java.math包中的*BigInteger*类和*BigDecimal*类可以处理任意长度数字序列的数值，前者提供整数运算，后者提供浮点数运算。

使用方法：

可以将一个普通的数转换成大数：

`BigInteger a = BigInteger.valueOf(100);`

`BigDecimal b = new BigDecimal(0.1);`（不推荐，会产生误差！）

更推荐使用以数字字符串为参数的大数构造器来生成大数：

`BigInteger a = new BigInteger("2131231231231312");`

`BigDecimal b = new BigDecimal("1.232314141322131231");`

对于大数，不能直接和普通数进行运算，必须将普通数转为大数才能进行运算。

常见的大数常量有：

- BigInteger.ZERO
- BigInteger.ONE
- BigInteger.TWO
- BigInteger.TEN

同样的，大数之间的运算也不能使用脚本基本运算符来运算，而是要使用大数类中的运算方法来运算。

{{% admonition tip %}}

 BigInteger a = new BigInteger("2131231231231312");

 a. add(b);    //a,b均为BigInteger类型，加法

 a.subtract(b);   //减 法

 a.divide(b);  //除法

 a.multiply(b);    //乘法



 a.equals(b);  //如果a、b相等返回true否则返回false

 a.compareTo(b);  //a小于b返回-1，等于返回0，大于返回1，0和1都是普通int



 a.mod(b);  //求余

 a.gcd(b);  //求最大公约数

 a.max(b);  //求最大值

 a.min(b);  //求最小值

 a.toString().length();  //求大数的长度



{{% /admonition %}}
