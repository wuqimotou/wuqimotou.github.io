---
title: Linux基础命令
subtitle:

date: 2024-10-21T22:22:54+08:00
slug: Linux command

description: “linux基础命令”

keywords: Linux

draft: false

comment: true

tags:
  - Linux


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

<!--more-->

# Linux基础命令
## 目录指令
### 目录指代符
- ./ 表示当前目录。
- ../ 表示当前目录的上一级目录，可迭代使用如../../。
- ~ 表示当前用户的 *HOME* 目录。
- / 表示系统根目录。
### 目录操作指令：
---
**目录文件展示指令**
`ls [-a/-l/-h] [dir]` 
其中：
- *-a* 代表列出所有文件以及文件夹包括隐藏文件。
- *-l* 代表以竖向列表形式列出文件以及文件夹。
- *-h* 表示以人性化方式列出文件以及文件夹，需要与 *-l* 搭配使用。      
当参数 *dir* 空时，默认展示当前目录。

---
**目录变换指令**
`cd [dir]`
当参数 *dir* 为空时，默认回到当前用户的 *HOME* 目录。

---
**路径指令**
`pwd`
展示当前目录的文件路径。

---
**新建文件夹指令**
`mkdir [-p] dir`
其中：
- *-p* 代表如果目标文件夹的父级及以上目录不存在，同时创建父级及以上目录。
通过 *dir* 来生成文件夹。
## 文件指令
---
**文件创建指令**
`touch file`
该指令通过指定文件路径来生成指定名称的文件。
与此同时，创建文件只是 *touch* 命令的衍生用法，其更多用途是修改文件的时间属性。即当 *file* 存在时，该命令会修改文件时间属性为当前时间。
{{% admonition %}}
我们还可以利用后面提到的 *cat* 指令来创建文件。
{{% /admonition %}}

---
**文件查看指令**
`cat [-n/-b/-s] file [file2] [file3] ...`
其中：
- *-n* 代表显示行号。
- *-b* 代表显示非空行号。
- *-s* 代表将连续多个非空行压缩成一行。
`more file  [file2] [file3] ...`
这两个命令都可以通过指定文件路径来查看对应的文件。
其中：
- *cat* 命令将文件内容全部展示出来。
- *more* 命令将文件内容分页展示处理，使用空格控制翻页，使用 *q* 退出查看。

{{% admonition %}}
*cat* 指令的用法远不止这么简单。例如我们可以使用
- `cat > file` 来创建或清空文件并进行输入，结束使用*Ctrl+D*进行保存退出。
- `cat >> file` 来在文件末尾另起一行继续输入。
- `cat file1 file2 > file3` 来将*file1*和*file2*拼接到*file3*中。
{{% /admonition %}}

---
**文件复制指令**
`cp [-r/-i/-f/-p/-u/-l/-d/-a] srcDir destDir`
其中：
- *-r* 代表复制 *srcDir* 目录以及所有子目录下的所有文件，**即复制文件夹时的必选项**。
- *-i* 代表若目标文件已存在，询问是否覆盖，按 *y* 时文件将被覆盖。
- *-f* 代表若目标文件已存在，强制覆盖目标文件。
- *-p* 代表保留源文件或目录的全部属性，如权限，所有者和时间戳。
- *-u* 代表复制更新，即若目标文件已存在，仅复制源文件比目标文件新的文件。
- *-l* 代表不复制文件，而是生成指向源文件的链接文件（硬链接）。
- *-d* 代表源文件为链接文件时，生成的目标文件也为链接文件。
- *-a* 代表 *-rpd* 的组合，即复制文件夹时复制源路径下的所有文件，链接文件与文件夹并保留其全部属性。

---
**文件移动指令**
`mv [-b/-i/-f/-n/-u] srcDir destDir` 
其中：
- *-b* 代表若目标文件存在时，在覆盖前会执行备份。
- *-i* 代表若目标文件存在时，询问是否覆盖同名文件。
- *-f* 代表若目标文件存在时，强制覆盖同名文件。
- *-n* 代表不覆盖任何已存在的文件。
- *-u* 代表若目标文件存在时，仅当源文件时间新于目标文件时才执行移动操作。
{{% admonition %}}
目标目录与原目录一致，指定了新文件名，效果就是仅仅重命名。
`mv  /home/ffxhd/a.txt   /home/ffxhd/b.txt`    
目标目录与原目录不一致，没有指定新文件名，效果就是仅仅移动。
`mv  /home/ffxhd/a.txt   /home/ffxhd/test/ `
或者
`mv  /home/ffxhd/a.txt   /home/ffxhd/test `
目标目录与原目录一致, 指定了新文件名，效果就是：移动 + 重命名。
`mv  /home/ffxhd/a.txt   /home/ffxhd/test/c.txt`
{{% /admonition %}}

---
**文件删除指令**
`rm [-r/-f] dir1 dir2 ...`
其中：
- *-r* 删除目录必选项。
- *-f* 强制删除文件，不再询问。 
- {{% admonition %}}
删除当前目录下的所有文件及目录，并且是直接删除，无需逐一确认命令行为：
`rm  -rf  要删除的文件名或目录`
删除文件名 test.txt:
`rm  -rf   test.txt`
删除目录 test，不管该目录下是否有子目录或文件，都直接删除:
`rm  -rf   test/`
{{% /admonition %}}