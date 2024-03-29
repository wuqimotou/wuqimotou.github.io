# 【啃透Java基础知识】1什么是Java？关于Java你需要知道的一些事


 参考资料：《Java 核心技术卷 I》

本章简单介绍了一些关于Java的背景知识。

&lt;!--more--&gt;

# 什么是Java？

## Java简史

&gt; 1991年，为了设计一种用于有线电视转换盒之类的消费设备的小型计算机语言，美国Sun公司的Patrick Naughton和James Gosling带领一个工程师小组启动了名为”Green“的项目，并将所设计出的语言命名为”Oak“（后改名为Java）。

&gt; 1992年，基于Java语言的第一个产品”*7“发布。该产品可以提供非常智能的远程控制，可惜的是反响平平。

&gt; 1993年至1994年初，”Green“项目改名为”First Person公司“，并一直苦苦挣扎。

&gt; 1994年，”First Person公司“解散。

&gt; 1995年，在SunWorld&#39;95大会上展示的基于Java语言编写的HotJava浏览器终于引起了全世界编程工作者与爱好者对Java的狂热追逐。

&gt; 1996年初，Java1版本发布，这个版本存在很多缺陷，以至于难以实现真正的应用开发。

&gt; 1997年，该年发布的Java1.1版本改进了许多1.0版本所存在的缺陷。

&gt; 1998年，Java1.2版本发布，并在发布三天后为Java提供了三个版本，分别为Java2标准版软件开发包即J2SE；Java2微型版软件开发包即J2ME；Java2企业版软件开发包即J2EE，软件开发包版本号1.2。（在之后版本中分别改名为JavaSE，JavaME，JavaEE）

&gt; 2000年，Java1.3版本发布，对应Java软件开发包版本为JDK1.3。

&gt; 2002年，Java1.4版本发布，对应Java软件开发包版本为JDK1.4。

&gt; 2004年，Java5版本发布，版本号从1.4直接增加到了5，对应Java软件开发包版本为JDK1.5。

&gt; 2006年，Java6版本发布，对应Java软件开发包版本为JDK1.6。

&gt; 2009年，开发Java语言的母公司Sun被Oracle公司收购。

&gt; 2011年，Java7版本发布，对应Java软件开发包版本为JDK1.7。

&gt; 2014年，Java8版本发布，对应Java软件开发包版本为JDK1.8。

&gt; 2017年，Java9版本发布，对应Java软件开发包版本为JDK1.9。

&gt; 2018年，Java10版本发布，对应Java软件开发包版本为JDK10。

&gt; 。。。

&gt; 2023年，Java21版本发布，对应Java软件开发包版本为JDK21。

## Java的一些特点

### 简单性

学过C&#43;&#43;语言的人应该知道，尽管C&#43;&#43;功能强大，但是一些语法结构是非常复杂的，如果不熟练是很难用好的。而相对于C&#43;&#43;，以其为语言基础的Java在大部分语法上都有着与其类似的特性，但是在一些很少使用，难以理解的特性方面，Java作出了一定的舍弃，例如Java中没有头文件，**没有指针**，没有结构体等。这在很大程度上简化了程序员利用Java进行编程的过程，降低了难度。与此同时，Java提供了庞大的类库也是让编程变得更简单的不可忽视的原因 。

{{% admonition note %}}

其实从另外一个方面去想Java的简单性，就是它的解释器和类库等都很简单，可以运行在小型机器上。

{{% /admonition %}}

### 面向对象

什么是对象，一个学校的管理系统里有一百个学生条例，一个学生条例就可以是一个对象。每个对象都有自己的属性，就像学生有自己的名字，性别，学号等。而每个对象也有若干个接口，就像管理系统中每个学生条例都有个人信息，设置这些个人信息不能直接在数据库中进行修改，要利用每个学生条例中的设置个人信息功能进行设置，而这里的设置个人信息功能就可以当作学生条例的接口。

与C语言的面向过程编程不同，Java将编程的重点放在对象和对象的接口上，而不是代码编写的过程上。利用好对象与接口的概念可以极大程度提高编程的便利性。

### 分布式

分布在不同地区的Java应用程序可以迅速便捷地访问互联网上的资源。

### 健壮性

Java强调进行早期的问题检测，后期的动态检测以及错误改正，相对于其他语言来说，Java可以在运行之前就检测出它们只能在运行时检测出的bug。

### 安全性

Java被设计成：

- 防范运行时堆栈溢出。
- 防范破坏进程空间之外的内存。
- 防范未经授权读写文件。

在后续版本中也逐渐丰富其防范攻击的能力。

### 体系结构中立

Java代码是运行在虚拟机上的，因此编写Java代码时不用考虑所运行的计算机的体系结构，各种指令集都可以通过虚拟机来运行Java代码编译出来的**字节码**。

{{% admonition note %}}

在计算机中，数据只用0和1两种表现形式，(这里只表示一个数据点，不是数字)，一个0或者1占一个“位”，而系统中规定8个位为一个字节，用来表示常用的256个字母、符号、控制标记，其中用一个位来进行[数据校验](https://baike.baidu.com/item/数据校验/2609771?fromModule=lemma_inlink)，其他七个位用来记录数据。

字节码（Byte-code）是一种包含执行程序、由一序列代码/数据对组成的[二进制文件](https://baike.baidu.com/item/二进制文件/0?fromModule=lemma_inlink)。字节码是一种中间码，它比[机器码](https://baike.baidu.com/item/机器码/86125?fromModule=lemma_inlink)更抽象。它经常被看作是包含一个[执行程序](https://baike.baidu.com/item/执行程序/0?fromModule=lemma_inlink)的二进制文件。

{{% /admonition %}}

### 可移植性

Java中数据类型以及运算都是明确规定好的，因此在移植Java代码的过程中不用考虑像C&#43;&#43;代码可能出现的因编译器不同导致的数据类型大小不同的问题。

同时Java底层的类库根据不同的操作系统提供了接口不同的实现方式，因此像操作系统这样的底层因素也不用考虑。

### 解释性

传统认知里，Java是编译型编程语言，即代码编写完成后需要经过编译才能运行。而解释型编程语言在代码编写完成后不需要编译即可运行，这无疑能更有探索代码的运行逻辑。

Java9中提供了jshell工具来支持解释型编程。

{{% admonition tip %}}

解释型编程语言还有Lisp，Smalltalk，Visual Basic，Python，R和Scala等。

{{% /admonition %}}

{{% admonition  %}}

尽管解释型语言在程序编写调试上有着更大的便利，但相较于编译型语言来说，其运行效率是短板。

{{% /admonition %}}

### 高性能

Java所用的即使编译器可以监控哪些代码频繁运行，并优化这些代码以提高执行速度，同时还可以使用”内联“技术来进一步优化代码。

### 多线程

多线程可以带来更好的交互响应和实时行为。

Java是第一个支持并发程序设计的编程语言，可以很好地利用多线程的优势。

{{% admonition  %}}

多线程（multithreading），是指从软件或者硬件上实现多个线程并发执行的技术。具有多线程能力的计算机因有硬件支持而能够在同[一时间](https://baike.baidu.com/item/一时间/3618565?fromModule=lemma_inlink)执行多于一个线程，进而提升整体处理性能。具有这种能力的系统包括[对称多处理机](https://baike.baidu.com/item/对称多处理机/10375153?fromModule=lemma_inlink)、[多核心](https://baike.baidu.com/item/多核心/1013410?fromModule=lemma_inlink)处理器以及[芯片级多处理](https://baike.baidu.com/item/芯片级多处理/924724?fromModule=lemma_inlink)或[同时多线程](https://baike.baidu.com/item/同时多线程/22689341?fromModule=lemma_inlink)处理器。在一个程序中，这些独立运行的程序片段叫作“[线程](https://baike.baidu.com/item/线程/103101?fromModule=lemma_inlink)”（Thread）

{{% /admonition %}}

### 动态性

Java支持更新正在运行的程序的代码

## 总结

在Java初次面世时，《Java 核心技术卷 I》的作者们曾是这样认为Java的：

&gt; ”As, a computer language, Java’s hype is overdone: Java is certainly a good programming language. There is no doubt that it is one of the better language savailable to serious programmers. We think it could potentially have been a great programming language, but it is probably too late for that. Once a language is out in the field, the ugly reality of compatibility with existingcodesetsin.“

中文就是:

作为一种计算机语言，Java的广告词确实有点夸大其词。当然，Java的确是一种优秀的程序设计语言。作为一个名副其实的程序设计人员，使用Java无疑是一个比较好的选择。我们认为：Java本来有潜力成为一种卓越的程序设计语言，但可能有些为时过晚，一旦一种语言得到广泛应用，与现存代码尴尬的兼容性问题就摆在了人们的面前。

现在来看，其实Java已经实现了相对于大多数编程语言的遥遥领先。Java是一个完整的平台，有一个庞大的库，其中包含了大量可重用的代码，还有一个提供诸如安全性、跨操作系统的可移植性以及自动垃圾收集等服务的执行环境。它既有令人舒适的语法，也有易于理解的语义，是一个功能齐全的出色语言和一个高质量的执行环境。种种优势于一身才能成就如今Java不可撼动的地位。



---

> 作者: wuqimotou  
> URL: https://wuqimotou.github.io/posts/things-you-need-to-know-about-java/  

