---
title: 【啃透Java基础知识】4Java流程控制
subtitle:

date: 2024-03-13T23:11:08+08:00
slug: Java process control

description: "啃透Java基础知识第四期"

keywords: "java, java基础知识, java学习, 循环, 分支控制"

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

本章介绍了关于Java流程控制相关的知识。

<!--more-->

# Java流程控制

Java程序默认是按顺序流程执行的，但编写者可以使用特定的流程控制语句来控制代码执行的顺序。

## 块

什么是块？

块是由用大括号括起来的若干条Java语句组成的。如下

~~~java
{
    int a = 1;
    int b = 1;
    System.out.println(a + b);
}
~~~

块确定了变量的作用域，在块中声明的变量只能在该块中使用。

块也可以嵌套，但嵌套的块中不能重复声明同名变量，如下是**错误**的:

~~~jav
{
    int a = 1;
    int b = 1;
    {
    	int a = 2;
    	System.out.println(a + b);
    }
}
~~~

## 条件控制

### if-else语句

条件语句即

`if（condition）statement`

其中当表达式`condition`的值为*true*时，执行`statement`语句。

`statement`可以使用块来实现执行多条语句。

条件语句还可以如：

`if（condition）statement1 else statement2`

其中当表达式`condition`的值为*true*时，执行`statement1`语句，否则执行`statement2`语句。

可以对多个if else语句进行组合：

`if（condition1）statement1 elseif(condition2) statement2 ... else statementn`

### switch语句

*switch*语句的基本格式如下：

~~~java
switch(choice){
    case 1:	//当choice的值为1时，执行以下代码，执行到break时跳出switch语句
        ...
        break;
    case 2:	//当choice的值为2时，执行以下代码，执行到break时跳出switch语句
        ...
        break;
    default:	//当choice的值不满足以上所有case时，执行以下代码，执行到break时跳出switch语句
        ...
}
~~~

其中`choice`的类型要与`case`后的常量相匹配，`case`后的常量的类型可以是：

- *char*，*byte*，*short*或*int*的表达式。
- 枚举常量
- 字符串字面量
- 多个字符串，用逗号分隔

除此之外，*switch*语句还有一种形式：

~~~java
switch(choice){
    case 1 ->	//当choice的值为1时，执行以下代码，执行到break时跳出switch语句
        ...
        
    case 2 ->	//当choice的值为2时，执行以下代码，执行到break时跳出switch语句
        ...
        
    default ->	//当choice的值不满足以上所有case时，执行以下代码，执行到break时跳出switch语句
        ...
}
~~~

可以很容易注意到，这两种形式之间的不同不仅是`case`后的连接符号不同，即`:`和`->`，还可以看见第二种形式中执行代码块内没有*break*语句。

我们先要弄清楚，`:`形式的*switch*语句存在一个叫**直通**的问题。

当`:`形式的*switch*语句中某个`case`的代码块不存在*break*语句，程序在执行完对于的代码块后并不会停止执行并跳出*switch*语句，而是会接着执行下一个`case`对应的代码块，直到遇到一个*break*语句或者执行完`default`的代码块，而这种现象就叫做**直通**。这种情况往往不是我们想要看到的，因此通常会在每一个`case`对应的代码块的末尾添加一个*break*语句。

`->`形式的*switch*语句便没有直通的问题。

*switch*语句不仅可以用作一般的语句，还可以当成表达式来使用。

~~~java
int i = switch(season){
        case "spring" -> 1;
        case "summer" -> 2;
        case "fall" -> 3;
        case "winter" ->{
            System.out.println("I love winter!");
            yield 4;
        }
        default -> 0;
}
~~~

可以注意到，*switch*语句用作表达式时，往往要返回一个值，因此使用`->`形式的*switch*语句可以直接在`->`后接返回值。若想用块来执行多条语句，则需要使用*yield*关键字来表明返回的值。

{{% admonition  %}}

`:`形式的*switch*语句也可以用作表达式，如何返回一个值呢？需要使用*yield*关键字来表明返回的值。需要注意的*yield*可以替代*break*实现中断操作。

{{% /admonition %}}

## 循环控制

### 循环语句

基本的循环语句有三种：

- `while(condition) statement;`
- `do statement while(condition);`
- `for(declaration; condition; iteration) statement`

其中while语句和do while语句都是当`condition`为*true*时，循环执行`statement`。

区别是while语句先进行条件的判断，而do while语句先执行一次`statement`再进行条件的判断。

for语句有三个部分，其中第一部分`declaration`为控制循环的变量的声明，`condition`为控制循环的条件判定，`iteration`为控制循环变量的迭代。

所有的`statement`都可以用块来实现多语句执行。

{{% admonition tip %}}

还有一个特殊的循环语句，即for each循环：

`for(variable : collection) statement`

for each循环可以用来依次处理数组或其他元素集合中的每个元素而不必考虑索引值，它将给定的变量`variable`设置为集合中的每一个元素（类型需要匹配），然后执行`statement`。其中`collection`必须是一个数组或是一个实现了*Iterable*接口的类对象。

{{% /admonition %}}

### 循环中断语句

- *break*语句，会中断当前的循环。利用标签可以实现中断外围循环，如

~~~java
label1:
for(int i=0;i<10;i++){
    label2:
    for(int j=0;j<5;j++){
        break label1; //直接退出整个循环
    }
}
~~~

- *continue*语句，会跳过当前循环。利用标签可以实现跳过外围循环，如

~~~java
label1:
for(int i=0;i<10;i++){
    label2:
    for(int j=0;j<5;j++){
        continue label1; //直接跳转到 i++ 环节
    }
}
~~~

