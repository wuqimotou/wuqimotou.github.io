---
title: 【啃透Java基础知识】2Java基本数据类型与字符串
subtitle:

date: 2024-03-11T23:10:03+08:00
slug: Java basic data types and strings

description: "啃透Java基础知识第二期"

keywords: "java, java基础知识, java学习, 数据类型, 字符串"

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

本章介绍了关于Java基本数据类型和String字符串类的知识。

<!--more-->

# Java基本数据类型

Java是一种强类型语言，即每一个变量都必须声明其数据类型。

Java中一共有8中基本数据类型，分别是表示整数的*byte* 、*short* 、*int* 、*long* ，表示浮点数（小数）的*float* 、*double* ，表示字符的*char* ，表示真值的*boolean* 。

## 整数类型

整数类型用于表示整数，有*byte* 、*short* 、*int* 、*long* 。

- *byte* 占1个字节，取值范围为$-2^7$ ~ $2^7-1$ ，即-128~127。
- *short* 占2个字节，取值范围为$-2^{15}$ ~ $2^{15}-1$ ，即-32768~32767。
- *int* 占4个字节，取值范围为$-2^{31}$ ~ $2^{31}-1$ ，即-2147483648~2147483647（略高于20亿）。
- *long* 占8个字节，取值范围为$-2^{63}$ ~ $2^{63}-1$ 。

最常用的整数类型为*int* ，*long* 常用于存放*int* 类型放不下的大数，在Java中需要在数字后加入`l` 或者`L`来表示该数为*long* 类型。

Java中的整数常量默认为*int* 类型。

## 浮点数类型

浮点数类型用于表示小数，有*float* 、*double* 。

- *float* 占4个字节，取值范围为$\pm3.40282347*10^{38}$ 。
- *double* 占8个字节，取值范围为$\pm1.79769313486231570*10^{308}$

Java中浮点数常量默认为*double* 类型。

在Java中需要在数字后加入`f`或者`F`来表示该数为*float* 类型。

{{% admonition %}}

Java中对浮点类型变量的计算并不是准确的，而是通过近似获得的。因此在进行运算后两浮点变量判断相等时，不能用`==` 来判断，而是应该利用差值小于某个精度来进行判断。

{{% /admonition %}}

有三个特殊的浮点值来表示出错和溢出：

- 常量Double.POSITIVE_INFINITY，表示正无穷大。
- 常量Double.NEGATIVE_INFINITY，表示负无穷大。
- 常量Double.NaN，表示数不存在。

{{% admonition %}}

Double.NaN被认为是与其他所有数不相等的，包括它自己。因此检测一个结果是否为Double.NaN时不能使用`==` ，而是应该使用`Double.isNaN（x）` 方法。

{{% /admonition %}}

## 字符类型

字符类型用于表示字符，有*char* 。

*char* 占用两个字节，可以存放汉字。

*char* 类型常量通常用`''` 表示，如`'a'` 。

类型的存储涉及到编码，例如一个*char* 类型变量为`'a'` ，则其存储在内存中的值为`a` 对应的编码值，在ASCII值编码中`a`的编码值为97。

{{% admonition tip %}}

常见的编码有

- ASCII码，字母用一个字节表示。
- Unicode码，字母与汉字都用两个字节表示。
- UTF-8码，字母用一个字节表示，汉字用三个字节表示。
- GBK码，字母用一个字节表示，汉字用两个字节表示。

具体编码自行查阅百度。

{{% /admonition %}}

*char* 类型变量可以进行运算，字符用其编码值参与运算。

~~~java
public class hello {
    public static void main(String[] args){
        char a = 'a';
        System.out.println(a * 2);
    }
}
>>> 194
    
public class hello {
    public static void main(String[] args){
        char a = 'a' + 10;
        System.out.println(a);
    }
}
>>> k
~~~

{{% admonition  %}}

不建议使用*char* 类型变量，而是使用字符串String代替。

{{% /admonition %}}

## 真值类型

真值类型用于判定逻辑条件，有*boolean* 。

*boolean* 占用一个字节，取值只有`true`和`false`。

{{% admonition  %}}

和C++不同，`true`和`false`不能用0与1替代。

{{% /admonition %}}

## 数值类型转换

分为自动类型转换和强制类型转换。

{{% admonition  %}}

*boolean* 不参与类型转换。

{{% /admonition %}}

### 自动类型转换

我们知道不同数据类型占用的存储空间大小是不同的，两个不同的数据类型，根据存储空间大小可以将存储空间大的数据类型视作高精度类型，存储空间小的数据类型视作低精度类型。如*int* 相较于*short* 就是高精度数据类型。

在运算中，如果存在不同数据类型的变量参与，则会自动将低精度数据类型转换成高精度数据类型进行运算。

~~~java
public class hello {
    public static void main(String[] args){
        int n = 1;
        short m = 2;
        int a = n + m; //n + m -> int
        System.out.println(a);
    }
}
>>> 3
~~~

如果将一个高精度数据类型强行赋值给低精度数值类型，则会面临丢失精度的错误，编译程序会报错。

~~~java
public class hello {
    public static void main(String[] args){
        int n = 1;
        short m = 2;
        byte a = n + m; //n + m -> int
        System.out.println(a);
    }
}
>>> java: 不兼容的类型: 从int转换到byte可能会有损失
~~~

{{% admonition tip %}}

两个不同类型的变量进行二元运算时，自动转换的原则如下：

- 如果两个操作数中有一个为*double* 类型，则另一个操作数转换成*double* 类型。
- 否则，如果一个操作数是*float* 类型，则另一个操作数转换成*float* 类型。
- 否则，如果一个操作数是*long* 类型，则另一个操作数转换成*long* 类型。
- 否则，两个操作数全部转为*int* 类型。

`byte + short -> int`

{{% /admonition %}}

### 强制类型转换

如果要实现高精度数据类型向低精度数据类型的转换，则需要使用强制类型转换。

浮点数向整数转换后，其小数点部分会被截断。例如：

~~~java
public class hello {
    public static void main(String[] args){
        double m = 9.997;
        int a = (int)m;
        System.out.println(a);
    }
}
>>> 9
~~~

 {{% admonition tip %}}

如果想要实现小数四舍五入的效果，可以使用`Math.round()` 方法。

{{% /admonition %}}

当一个超出低精度数据类型所能表示的范围的数转换成该数据类型时，其结果会变成一个完全不同的值，即发生了溢出。例如

~~~java
public class hello {
    public static void main(String[] args){
        int m = 300;
        byte a = (byte)m;
        System.out.println(a);
    }
}
>>> 44
~~~

# Java变量与常量

## 变量

每个变量都有一个类型，同时都需要声明，如`int a;`。

变量名只能由字母，数字，货币符号以及标点连接符组成，且第一个字符不能为数字。一般都使用字母数字与下划线，字母区分大小写。

在声明一个变量之后，需要为其初始化，否则使用时会报错：

~~~java
public class hello {
    public static void main(String[] args){
        int a;
        System.out.println(a);
    }
}
>>> java: 可能尚未初始化变量a
~~~

## 常量

在Java中，可以使用关键字`final` 指示常量。

`final` 表示该变量只能被赋值一次，无法被更改。

通常常量名使用全大写。

## 枚举

当一个变量的取值为有限个选择时，可以将这有限个选择声明为枚举类型。

`enum Size { SMALL, MEDIUM, LARGE, EXTRA_LARGE};`

声明这种枚举类型的变量，其值为枚举类型中的某一值，或者为代表没有设置任何值的*null* 。

`Size s = Size.MEDIUM;`

# Java字符串

Java中没有内置字符串数据类型，而是使用*String*类来当作字符串使用。

字符串用`""`表示。

~~~java
public class hello {
    public static void main(String[] args){
        String a = ""; //空串
        String e = "abc";
        System.out.println(e);
    }
}
>>> abc
~~~

## 子串

*String*类可以使用*substring*方法来提取子串：

~~~java
public class hello {
    public static void main(String[] args){
        String a = ""; //空串
        String e = "abc";
        String ee = e.substring(0,2); //第二个参数为想要截取字串最后一个字符的后一个字符的位置
        System.out.println(ee);
    }
}
>>> ab
~~~

## 字符串拼接

*String*类允许使用+进行字符串拼接，任意非字符串的值与字符串拼接后都会变成字符串。

~~~java
public class hello {
    public static void main(String[] args){
        String a = "ab";
        System.out.println(a + 22);
    }
}
>>> ab22

public class hello {
    public static void main(String[] args){
        String a = "ab";
        int b = 22
        System.out.println(a + b);
    }
}
>>> ab22
~~~

 {{% admonition tip %}}

Java11中提供了一个*repeat*方法：

`String a = "java".repeat(3); // a is "javajavajava"`

{{% /admonition %}}

 {{% admonition  %}}

请辨析'a' + 1与"a" + 1之间的区别！

{{% /admonition %}}

## 修改字符串

字符串是不可变的，无法直接对字符串中的某个字符进行修改。

如果想要对一个字符串进行修改，可以利用提取子串+拼接的方法。

 {{% admonition tip %}}

Java中，字符串是共享的。即复制一个字符串变量，仅仅是将新变量指向了原来变量指向的字符串所在的内存空间。

{{% /admonition %}}

## 字符串相等

*String*类提供了*equals*方法来判断两个字符串是否相等，返回值为*true*或*false*。

`"abc".equals("abc");`

同时提供了忽略大小写的*equalsIgnoreCase*方法。

`"abc".equals("ABc");`

 {{% admonition  %}}

请不要使用`==`来判断两字符串是否相等。该运算符的含义是判断两字符串变量是否指向同一位置。同一位置的两字符串变量必然相等，但相等的两字符串变量却未必在同一位置。

{{% /admonition %}}

## 空串

空串是长度为0的字符串，可以用

`if(str.length() == 0)`

或

`if(str.equals(""))`

来判断是否为空串。

空串是一个Java对象，有长度（0）和内容（空）。

 {{% admonition  %}}

*String*变量还可以存放*null*，表示当前变量没有与任何对象关联，可用`if(str == null)`判断。

{{% /admonition %}}

## 生成字符串

在用若干个字符串生成新的字符串时，使用拼接过于效率低下，因此可以使用

- *StringBuilder*类
- *StringBuffer*类

这两个类的API是相同的，区别在于*StringBuilder*类效率更高，却只能单线程运行，*StringBuffer*类运行采用多线程方式添加或删除字符，但效率更低。

~~~java
public class hello {
    public static void main(String[] args){
        StringBuilder builder = new StringBuilder();
        builder.append("cc");
        builder.append("dd");
        String ee = builder.toString();
        System.out.println(ee);
    }
}
>>> ccdd
~~~



常见API有

- StringBuilder()

​	构建一个空的字符串构建器。

- int length()

​	返回构建器中字符个数。

- StringBuilder append(String str)

​	追加一个String，返回this。

- StringBuilder append(char c)

​	追加一个char，返回this。

- StringBuilder delete(int start, int end)

​	删除从start到end-1的字符并返回this。

- String tosString()

​	返回一个与构建器中字符相同的字符串。
