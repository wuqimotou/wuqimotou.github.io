# 【注释】你不能不知道的Java注释技巧


 参考资料：《Java 核心技术卷 I》

&lt;!--more--&gt;

# Java中的注释

Java程序代码中，一些不想让程序运行但又很有必要的说明性文字被称为注释。注释可以为繁杂难懂的程序代码进行人性化解释，能够提高程序的易读性和可维护性。

总的来说，Java中有三种注释类型，分别是：

- 单行注释
- 多行注释
- 文档注释

下面分别来介绍一下这些注释的用法。

## 单行注释

Java中单行注释通常使用`//`来实现。放在`//`符号后的文字不会被程序编译运行。例如：

~~~java
public class hello {
    public static void main(String[] args){
        //下面这个方法会打印出&#34;Hello world!&#34;
        System.out.println(&#34;Hello world！&#34;);
    }
}
&gt;&gt;&gt; Hello world!
~~~

## 多行注释

上述的单行注释只能实现一行注释的输入，如果想要输入多行的注释，可以利用多个单行注释实现，如：

~~~java
public class hello {
    public static void main(String[] args){
        //下面这个方法会打印出&#34;Hello world!&#34;
        //这是第二行了
        System.out.println(&#34;Hello world！&#34;);
    }
}
&gt;&gt;&gt; Hello world!
~~~

但这样每换一行就要输入一次单行注释符不方便，我们可以利用多行注释符 `/**/` 来实现多行注释，如：

~~~java
public class hello {
    public static void main(String[] args){
        /*
          下面这个方法会打印出&#34;Hello world!&#34;
          这是第二行了
          第三行
        */
        System.out.println(&#34;Hello world！&#34;);
    }
}
&gt;&gt;&gt; Hello world!
~~~

需要注意的是，多行注释符 `/**/`  不能嵌套使用，如：

~~~java
public class hello {
    public static void main(String[] args){
        /*
          下面这个方法会打印出&#34;Hello world!&#34;
          这是第二行了
        /*
          第三行
          第四行
        */
          第五行
        */
        System.out.println(&#34;Hello world！&#34;);
    }
}
&gt;&gt;&gt; java: 非法的表达式开始
~~~

因为多行注释符的匹配是按照 `/*`开始，之后的全是注释直到遇见了`*/`。而嵌套使用多行注释符时会导致注释的提前结束，进而产生语法错误。

## 文档注释

### 文档注释解析

上述两种注释方法使用起来很方便，可以在代码的任何地方编写，起到解释代码提示功能的作用。当我们在进行一个庞大的Java项目编写时，我们往往需要为其中的每一个类文件甚至是每个类中的方法进行注释。此时虽然可以用上述两种注释方法，但查看起来很不方便，需要打开每个类文件的源文件找到具体方法才能看见。因此文档注释符能够帮我们将对模块、包、公共类和接口、公共和受保护的字段、公共和受保护的构造器与方法进行注释并提取生成一个帮助文档。

文档注释符通常放在要解释的特性（如类、接口、方法等）前面，以`/**`开始，直到`*/`结束，其中是自由格式文本，意味着 html 修饰符也是允许的。下面是一个例子：

~~~java
/**
 * 一个打印Hello world！的类
 * @author wuqimotou
 * @version 1.0
 * @since 
 * @see &#34;test&#34;
 */
public class hello {
    public static void main(String[] args){
        System.out.println(&#34;Hello world！&#34;);
    }

}
~~~

可以看到在主类hello前面有一段文档注释，这个注释解释了这个类的一些信息。其中有一些令人迷惑的地方，比如*@author* ，*@version* 等这些是什么？

标记，以*@*开始，如*@author* ，*@version* 等，用于对所要注释的内容的一些基本信息进行解释，如*@author* 标明了该类的编写者身份，*@version* 标明了该类当前的版本等。

还有一些其他的标记，如：

*@param*

*@return*

*@throws*

这三个标记可用于方法之前的文档注释中，*@param* 添加了一个注释标明了当前方法的参数，*@return* 添加了一个注释标明了当前方法的返回值。*@throws* 添加了一个注释标明了当前方法可能抛出的异常。如：

~~~java
public class hello {
    /**
     * hello类的主方法
     * @param 运行时可带的参数
     * @return 不返回值
     */
    public static void main(String[] args){
        System.out.println(&#34;Hello world！&#34;);
        System.out.println(&#34;Hello world！&#34;);
    }
}
~~~

*@since* 会添加一条表示该文档注释是从哪个版本开始的。

*@see* 和*@link* 是用于添加超链接的。不过这两个有略微不同。*@see* 将会在文档注释所转换的帮助文档中的*see also*部分增加超链接，而*@link* 可以在注释的任意地方插入超链接。

以*@see* 举例来说明*@see* 和*@link* 插入超链接的书写方法，有三种方式：

- *@see* *package.class#feature label*
- *@see* *\&lt;a href=&#34;...&#34;&gt; label \&lt;/a&gt;*
- *@see* *&#34;text&#34;*

第一种方式可以用来插入一个指向某方法的超链接，而只需要提供包名，类名与方法名。例子如下：

`@see com.horstmann.corejava.Emplyee#raiseSalary(double)`

{{% admonition tip %}}

若要指向的包位于当前包或当前类，则可以省去包名或者省去包名与类名！

{{% /admonition %}}

第二种方式可以用于插入任意的URL，如下：

`@see &lt;a href=&#34;www.baidu.com&#34;&gt; 百度 &lt;/a&gt;`

第三种方式用于添加文本。

{{% admonition  %}}

可以使用多个*@see* 标记，但*@see* 必须放在一起，不能在其中穿插其他标记。

{{% /admonition %}}

*@link* 用法与*@see* 类似。

### 文档注释提取

在要提取文档注释的源文件目录下执行以下命令：

`javadoc -d docDirectory name1 name2`

其中docDirectory为提取出的帮助文档所存放的目录，name1 name2为要提取的源文件。


---

> 作者: wuqimotou  
> URL: https://wuqimotou.github.io/posts/java-annotation-techniques/  

