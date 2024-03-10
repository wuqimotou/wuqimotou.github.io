# Java编程中关于转义字符\n换行与\r回车的区别


\n和\r有什么区别？

&lt;!--more--&gt;

# 什么是转义字符？

&gt; 转义字符是很多[程序语言](https://baike.baidu.com/item/程序语言/10696489?fromModule=lemma_inlink)、[数据格式](https://baike.baidu.com/item/数据格式/5198733?fromModule=lemma_inlink)和[通信协议](https://baike.baidu.com/item/通信协议/3351624?fromModule=lemma_inlink)的形式文法的一部分。对于一个给定的[字母表](https://baike.baidu.com/item/字母表/1314769?fromModule=lemma_inlink)，一个转义字符的目的是开始一个字符序列，使得转义字符开头的该字符序列具有不同于该字符序列单独出现时的语义。因此转义字符开头的字符序列被叫做[转义序列](https://baike.baidu.com/item/转义序列/2482443?fromModule=lemma_inlink)。
&gt;
&gt; 转义序列通常有两种功能。第一个是[编码](https://baike.baidu.com/item/编码/80092?fromModule=lemma_inlink)一个句法上的实体，如设备命令或者无法被字母表直接表示的特殊数据。第二种功能，也叫字符引用，用于表示无法在当前上下文中被键盘录入的[字符](https://baike.baidu.com/item/字符/4768913?fromModule=lemma_inlink)（如字符串中的回车符），或者在当前上下文中会有不期望的含义的字符（如C语言字符串中的双引号字符&#34;，不能直接出现，必须用转义序列表示）。在后面那种情况，转义序列是一种由转义字符自身和一个被引用的字符组成的一个二合字母（digraph）情形。

Java中常见的转义字符有：

- \t	制表符
- \n       换行符
- \r        回车符
- \\\        斜杠符
- \\&#34;        双引号符
- \\&#39;         单引号符

受日常Windows系统使用经验的影响，其中换行符\n和回车符\r是容易混淆的两个概念，下面来简单辨析一下这两种转义字符之间的关系与区别。

# 换行符与回车符的起源

&gt; 在计算机还没有出现之前，有一种叫做电传打字机（Teletype Model 33，Linux/Unix下的tty概念也来自于此）的玩意，每秒钟可以打10个字符。但是它有一个问题，就是打完一行换行的时候，要用去0.2秒，正好可以打两个字符。要是在这0.2秒里面，又有新的字符传过来，那么这个字符将丢失。
&gt;
&gt; 于是，研制人员想了个办法解决这个问题，就是在每行后面加两个表示结束的字符。一个叫做“回车”，告诉打字机把打印头定位在左边界；另一个叫做“换行”，告诉打字机把纸向下移一行。这就是“换行”和“回车”的来历，从它们的英语名字上也可以看出一二。
&gt;
&gt; 后来，计算机发明了，这两个概念也就被般到了计算机上。那时，存储器很贵，一些科学家认为在每行结尾加两个字符太浪费了，加一个就可以。于是，就出现了分歧。
&gt;
&gt; Unix系统里，每行结尾只有“&lt;换行&gt;”，即&#34;\n&#34;；
&gt;
&gt; Windows系统里面，每行结尾是“&lt;回车&gt;&lt;换行&gt;”，即“\r\n”；
&gt;
&gt; Mac系统里，每行结尾是“&lt;回车&gt;”，即&#34;\r&#34;；。

# 编写Java程序时使用\r与\n的区别

使用\r时，如：

~~~java
System.out.println(&#34;Hello world！&#34;);
&gt;&gt;&gt; Hello world!

System.out.println(&#34;Hello \rworld！&#34;);
&gt;&gt;&gt; world!
~~~

使用\n时，如：

~~~java
System.out.println(&#34;Hello world！&#34;);
&gt;&gt;&gt; Hello world!

System.out.println(&#34;Hello \nworld！&#34;);
&gt;&gt;&gt; Hello 
    world!
~~~

同时使用\r\n时，如：

~~~java
System.out.println(&#34;Hello world！&#34;);
&gt;&gt;&gt; Hello world!

System.out.println(&#34;Hello \r\nworld！&#34;);
&gt;&gt;&gt; Hello 
    world!
~~~

可见，

当输出包含\r回车符的字符串时，输出的光标会在指向\r时回到当前行首，清空之前该行的输出内容，以\r之后的内容重新输出。

当输出包含\n换行符的字符串时，输出的光标会在指向\r时跳到下一行的行首，并以\n之后的内容输出。

当输出包含\r\n的字符串时，效果同\n换行符。


---

> 作者: wuqimotou  
> URL: https://wuqimotou.github.io/posts/the-difference-between-%5Cn-and-%5Cr/  

