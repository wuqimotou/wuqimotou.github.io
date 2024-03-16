# 【啃透Java基础知识】5Java中的数组


参考资料：《Java 核心技术卷 I》

本章介绍了关于Java数组的知识。

&lt;!--more--&gt;

# 数组

数组是用来存放若干**同类型**数据的一种**引用数据类型**，可以通过一个从零开始的整数索引来访问数组中的每一个值。

## 数组的声明

通用声明：

`int[] a;`

数组变量的初始化分为**动态初始化**和**静态初始化**：

- 动态初始化：`int[] a = new int[4];`

- 静态初始化：`int[] a = {1, 2, 4};`

{{% admonition %}}

数组一旦创建便不能修改其长度，对于需要动态改变长度的容器，应该使用数组列表*arraylist*。

{{% /admonition %}}

对于一个已经初始化的数组，可以利用**匿名数组**来重新初始化。

`a = new int[] {1, 3, 4, 6, 7};`

其等价于：

```java
int[] t = {1, 3, 4, 6, 7};
a = t;
```

## 数组的访问

利用变量名加中括号加索引即`a[0]`的方法即可访问数组元素。

长度为n的一个数组，其索引值的范围为0~n-1，当索引超出范围时程序会抛出异常。

{{% admonition %}}

数字数组在动态初始化后初值为0。

*boolean*数组在动态初始化后初值为*false*。

对象数组，如*String*数组在动态初始化后初值为*null*。

{{% /admonition %}}

{{% admonition tip %}}

array.length方法可以获得数组中元素的个数。

{{% /admonition %}}

## 数组拷贝

由于数组是引用数据类型，在拷贝上区别于基本数据类型的**值传递**，数组的拷贝是**引用传递**。

引用传递的意思是，若要将数组变量a拷贝至数组变量b，其本质并不是数组变量b创建了一个新的数组空间且大小于与元素和a相同，而是b直接引用数组变量a所引用的数组空间。

在此情况下，改动数组a的元素，数组b也会随之改变。

{{% admonition %}}

读者如果有C&#43;&#43;经验，可以很快发现这与C&#43;&#43;中的数组指针很相似。

在Java中对数组的拷贝就类似于C&#43;&#43;中创建一个新的指针指向原来的数组，其地址空间是共享的。

但与C&#43;&#43;不同的是，Java中的数组并不能通过变量名加减来访问数组中的各个元素。

{{% /admonition %}}

若想实现对数组变量的值传递，有两种办法：

- 创建一个新的数组，将待拷贝数组的元素依次拷贝给新数组。

- 使用Arrays类中的copyof方法：

  `int[] newArray = Arrays.copyof(oldArray, oldArray.length);`

更进一步，若想对数组进行扩容或缩减，同样可以利用这两种方法：

- 创建一个目标大小的数组，初始化后让原数组变量拷贝新数组即可实现数组大小变化。而原数组变量引用的地址空间会因为没有变量引用而自动销毁。

- 使用Arrays类中的copyof方法：

  `int[] oldArray = Arrays.copyof(oldArray, 2*oldArray.length);`

  此时若数组元素为数值型，新增元素将赋值为0；若为布尔型，则赋值为*false*。

  若长度小于原数组长的，则只会保留从前往后保留新长度个数的元素，后面的全部截断。

## 常见数组方法

Java中为数组提供了方便的运算方法。里面xxx代表*byte*、*short*、*int*、*long*、*boolean*、*float*、*double*和*char*。

- `String toString(xxx[] a)`

  返回一个包含a中元素的字符串，这些字符串用中括号包围，用逗号分隔。

- `void sort(xxx[] a)`

  对数组a中元素使用优化后的快速排序进行升序排序。

- `int binarySearch(xxx[] a, xxx v)`

  使用二分查找法在数组a中查找值v，若找到则返回v对应的索引，若找不到则返回一个负值r，-r-1为插入该v值后数组a仍保持有序的索引值。

- `void fill(xxx[] a, xxx v)`

  用值v填充或覆盖数组a中的每个元素。

- `boolean equals(xxx[] a, xxx[] b)`

  若数组a，b长度相同，且每个元素相同，则返回*true*，否则返回*false*。

## 多维数组

多维数组的声明形式如下，以二维数组为例：

`int[][] a;`

同样，多维数组的初始化同样有静态和动态：

- `int[][] a = {{1, 2, 4}, {3, 5, 2}};`
- `int[][] a = new int[2][3];`

可以利用变量名加中括号加多重索引`a[0][1]`来访问数组中某个元素。

{{% admonition %}}

对于多维数组，并不能直接使用for each循环来遍历其中的元素。单层的for each循环只会遍历多维数组中的每一行，具体的元素需要对for each进行嵌套使用。如：

~~~java
for (int[] row : a){
    for (int value : row){
        System.out.print(value);
    }
}
~~~

想要快速打印一个多维数组，可以利用deepToString方法，如：

~~~java
public class hello {
    public static void main(String[] args){
        int[][] a ={
                {1, 2, 3},
                {3, 4, 5},
                {4, 5, 6}
        };
        System.out.println(Arrays.deepToString(a));
    }
}
&gt;&gt;&gt; [[1, 2, 3], [3, 4, 5], [4, 5, 6]]
//注意！不能使用toString方法
public class hello {
    public static void main(String[] args){
        int[][] a ={
                {1, 2, 3},
                {3, 4, 5},
                {4, 5, 6}
        };
        System.out.println(Arrays.toString(a));
    }
}
&gt;&gt;&gt; [[I@4eec7777, [I@3b07d329, [I@41629346]]
~~~

{{% /admonition %}}

从本质上来说，Java并没有多维数组，而是**数组的数组**。

以二维数组来说，数组的第一维的元素全是一维数组。因此二维数组中的每一个一维数组的长度可以是不同的。

支持初始化时只初始化行的个数而不初始化列的个数：

~~~java
public class hello {
    public static void main(String[] args){
        int[][] a = new int[5][];
        for (int i=0;i&lt;5;i&#43;&#43;){
            a[i] = new int[i&#43;1];
        }
        System.out.println(Arrays.deepToString(a));
    }
}
&gt;&gt;&gt; [[0], [0, 0], [0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0, 0]]
//三维数组初始化
public class hello {
    public static void main(String[] args){
        int[][][] a = new int[5][][];
        for (int i=0;i&lt;5;i&#43;&#43;){
            a[i] = new int[i&#43;1][];
            for (int j=0;j&lt;i&#43;1;j&#43;&#43;){
                a[i][j] = new int[j&#43;1];
            }
        }
        System.out.println(Arrays.deepToString(a));
    }
}
&gt;&gt;&gt; [
     [[0]],
     [[0], [0, 0]], 
     [[0], [0, 0], [0, 0, 0]], 
     [[0], [0, 0], [0, 0, 0], [0, 0, 0, 0]], 
     [[0], [0, 0], [0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0, 0]]
	]
~~~



---

> 作者: wuqimotou  
> URL: https://wuqimotou.github.io/posts/java-array/  

