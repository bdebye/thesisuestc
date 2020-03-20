# ThesisUESTC-电子科技大学毕业论文模板
[![](https://img.shields.io/badge/license-LPPL-blue)](https://www.latex-project.org/lppl/)
[![](https://img.shields.io/github/last-commit/x-magus/ThesisUESTC)](https://github.com/x-magus/ThesisUESTC/zipball/master)
[![](https://img.shields.io/github/issues/x-magus/ThesisUESTC)](https://github.com/x-magus/ThesisUESTC/issues)

此项目提供用于排版电子科技大学毕业论文的LaTeX模板类，旨在帮助电子科技大学的毕业生高效地完成毕业论文的写作。模板提供各种方便的命令，自动化地排版论文的各个部分，使毕业论文轻易地满足学校的格式要求。为了支持更好的字体效果，模板基于XeLaTeX编写，并且放弃对CTeX的依赖，使模板更加稳定。

模板由电子科技大学物理电子学院2014级硕士研究生王稳编写，由于在毕业论文写作中遇到各种问题，希望有一个理想的解决方案，所以决定写一个模板出来。祝愿此项目能继续发展，解决各位同学毕业论文写作中的困难。

*由于GitHub最近访问很不稳定，如果下载链接失效请使用[Gitea分支](https://gitea.com/Xmagus/ThesisUESTC)的[下载链接](https://gitea.com/Xmagus/ThesisUESTC/archive/master.zip)。*

This project provides the LaTeX template for UESTC theses, aims to help the students in UESTC efficiently complete the thesis writing task. The template provides various convenient commands, automatically typesets the portions of the thesis, render it perfectly fits the requirements of the school. To support better font effects, the template is based on XeLaTeX, and gives up the dependence on CTeX, to attain better reliability.

The template is authored by Wang Wen, a 2014 master graduate of UESTC. Because of the problems that occurred in thesis writing, an ideal solution is expected, and a LaTeX template is provided overcoming such difficulties. Wishes to the further development of this project, to spare the students' overheads on this matter.

## 使用方法

### 基本环境
使用模板需要系统安装任意一种TeX环境，如[TeXLive](http://mirror.ctan.org/systems/texlive/Images/)、[MacTeX](https://www.tug.org/mactex/mactex-download.html)和[MiKTeX](https://miktex.org/download)（都自动带有XeLaTeX引擎，但是不推荐CTeX），安装有 SimSun 和 SimHei 字体（其实就是宋体和黑体）以及 Times New Roman 英文字体。在 MacOS 系统下编译会自动识别操作系统，使用 Songti SC 和 STHeiti 字体，但需要启用`--shell-escape`编译选项。Linux 使用者可以下载[字体文件包](https://gitlab.com/Xmagus/fonts/-/archive/thesis/fonts-thesis.zip)解压到文档根目录。

模板采用LaTeX类的形式封装，导入模板只需要把`thesis-uestc.cls`文件放在文档所在目录，在文档开头使用`\documentclass{thesis-uestc}`命令将文档的类设置成`thesis-uestc`即可。使用BibTeX录入参考文献还需要`thesis-uestc.bst`风格定义文件。

模板类有bachelor、master、promaster、doctor和engdoctor四个学位选项，对应本科、硕士、专业硕士和博士的毕业论文，默认选项为`master`。文档内容的书写参考范例`main.tex`。英语使用者可以启用`english`选项，模版会按照英语论文的格式排版。

### 文档编译
编译文档请使用XeLaTeX引擎。模版提供latexmk设置文件用于自动编译。将命令行工作目录切换到项目文件夹下，执行
```bash
latexmk main.tex
```
命令即可自动调用相关程序进行编译，处理各种文件依赖并自动预览。执行`latexmk -c`命令清理所有缓存文件。

编译多文件结构的文档将文件名替换成`main_multifile.tex`即可。使用TeXstudio、Texmaker或WinEdt等编辑环境请将编译引擎设置成latexmk，如果在Windows平台下使用MiKTeX还需要安装[Perl语言解释器](http://strawberryperl.com/)。

手动编译的话执行
```bash
xelatex main.tex
```
命令即可，若文档内部有交叉引用或录入参考文献则需要编译两次。

使用BibTeX录入参考文献需要先运行一次xelatex，运行一次bibtex，再运行两次xelatex。使用BibTeX录入攻读学位期间的研究成果的情况下还需要额外运行一次`bibtex accomplish.aux`。所以完整地编译包含两个BibTeX文献列表（一个是参考文献，一个是攻读学位期间的研究成果）的文档需要按顺序运行以下命令：

```bash
xelatex main.tex
bibtex main.aux
bibtex accomplish.aux
xelatex main.tex
xelatex main.tex
```

使用Overleaf在线编辑只需打开发布在Overleaf Gallery里的[模板](https://www.overleaf.com/latex/templates/uestc-thesis-template/nwpkhtrtjhrg)，点击OPEN AS TEMPLATE即可使用，在线自动编译和预览。Overleaf模板唯一的区别在于直接使用放置在项目根目录的字体文件。

## 论文写作指南

### 论文封面

论文封面和扉页由`\makecover`命令添加，可以显示论文题目，作者，指导老师等。正式提交论文时文印中心会统一提供封面和扉页，无论自己排版的封面是否符合格式要求。已经包含的封面也不会影响任何前期的审核。独创性声明可以由`\originalitydeclaration`命令生成。

封面显示的信息可以使用一系列命令进行设置，包括标题、作者、学院等：

| 命令名称 | 参数#1 | 参数#2 |
|---|---|---|
|\title{#1}{#2}| 中文标题 | 英语标题 |
|\author{#1}{#2}| 作者中文名 | 作者英文名 |
|\advisor{#1}{#2}| 导师中文名 | 导师英文名 |
|\school{#1}{#2}| 学院中文名 | 学院英文名|
|\major{#1}{#2}| 专业中文名| 专业英文名 |
|\studentnumber{#1}| 学号 | 无 |

如果想使用自己定义的封面，可以用`\bindpdfcover`命令添加已经做好的PDF格式的封面，如`\bindpdfcover{cover.pdf}`。



### 中英文摘要

中英文摘要应包含在`chineseabstract`和`englishabstract`环境中，对应的关键字使用`\chinesekeyword`和`\englishkeyword`命令添加，并包含在相应的环境中。模板自动设置页眉和页脚，其中中文摘要标题中间空一格，页眉不空格。依照学校的格式说明，模板自动根据摘要结束所在的页数决定是否再空一页。

### 论文目录

论文目录由命令`\thesistableofcontents`添加，并且自动处理标题，页眉以及缩进等问题。依照学校的格式说明，模板自动根据目录结束所在的页数决定是否再空一页。

### 绪论

绪论是毕业论文的第一章，由于格式特殊（其实主要是页眉中间没有空格）由单独一个命令`\thesischapterexordium`开始。

### 论文主体

论文主体的写作参考一般的LaTeX教程（如中文版的[lshort](https://www.ctan.org/pkg/lshort-zh-cn)），可以自由添加章节，章节内添加所需要的内容，分小节，插入公式、表格和图片。

### 数学环境

数学环境的字体加粗可以使用`\mathbf`或者`\bm`命令，使用斜体粗体的符号。由于 Times New Roman 字体的拉丁字母字形修长，偶尔会出现字符粘连的情况。这种情况下可以使用占位符波浪号调整距离，如`$f^{~l}$`和`$\hat{f~}$`。

### 致谢

致谢部分由命令`\thesisacknowledgement`开始，实际上是开始了一个无编号的章节。

### 参考文献

使用BibTeX录入参考文献由`\thesisbibliography`命令导入`*.bib`文件数据库，参考文献风格自动设置为`thesis-uestc`。当参考文献数目超过100时，可以使用`large`选项调整编号的宽度，如`\thesisbibliography[large]{reference}`。

在这个命令之前使用`\nocite{*}`命令会在文档中列出数据库中的所有条目，无论是否引用，其他情况下只列出引用过的条目。有些编辑器会识别`\bibliography`命令导入的数据库文件，并提供更好的编辑支持，所以模板也支持原生的`\bibliography`命令导入文献列表，只需要导入之前指定参考文献风格（`\bibliographystyle{thesis-uestc}`）即可。

参考文献的在文中的引用分两种：在原文中作句法成分的为直接引用，使用`\cite`命令，否则为`\citing`命令，在文中文献编号显示为上标。模版的文献条目处理兼容 IEEE Xplore 和 ScienceDirect 的引用格式，还有其他主流的数据库。获得参考文献条目信息只需要在对应的文章页面点击下载引用的按钮（在 IEEE Xplore 中按钮在PDF下载旁边一个向下的箭头；在 ScienceDirect 中为文章标题上面的 Export 链接），选择BibTeX格式，将文本复制到 bib 文件即可。

当引用中文文献，而文献作者超过三位时，后面的作者想使用“等”字省略，可以在文章条目添加语言选项`language = {zh}`。模版会自动按照中文的习惯处理作者信息。

手动录入参考文献使用`thesisthebibliography`环境，在环境中使用`\bibitem`命令添加文献条目。

### 附录

附录部分由命令`\thesisappendix`开始，之后每一章都会被当作是一个附录，使用大写拉丁字母编号。如果只需要单独一个附录则使用`\thesissingleappendix`命令，在后面添加小节，附录本身没有编号。

### 攻读学位期间取得的成果

使用BibTeX录入研究成果由`\thesisaccomplish`命令导入`*.bib`文献列表，方法与参考文献相同。文献列表风格自动设置为`thesis-uestc`。此命令没有可选参数，自动在文档中列出数据库中的所有条目。手动添加使用`\bibitem`命令将文章条目列在`thesistheaccomplish`环境下，方法与参考文献相同。

### 外文资料原文及译文

本科毕业论文要求翻译一篇外文资料，资料原文应由命令`\thesistranslationoriginal`开始，资料译文由命`\thesistranslationchinese`开始。为了书写方便可以继续分小节，但是这部分中的小节不会在目录中显示。

### 插入图片和表格

插入图片使用`figure`环境，自动调整图片前后的间距，添加子图则使用`\subfloat`命令。若子图过多需要跨页则在间断处插入`\floatcontinue`命令。插入表格使用`table`环境，自动调整表格前后的间距和默认的字体大小。

图片文件可以统一放在`./pic`目录下。具体插入图片和表格的代码参考范例`main.tex`。

### 定理环境

数学定理请使用模板提供的定义（definition）、公理（axiom）、证明（proof）、定理（theorem）、推论（corollary）、命题（proposition）、引理（lemma）和例子（example）环境。

### 算法描述

算法描述使用`algorithm`环境，具体写法请参考范例`main.tex`或`chapter\c3.tex`。模板类自动加载`algorithm2e`宏包，详细的用法请参考[algorithm2e宏包文档](https://www.ctan.org/pkg/algorithm2e)。

### 枚举环境和脚注

枚举使用标准的`enumerate`、`itemize`以及`description`环境。脚注使用标准的`\footnote`命令插入。

### 其他命令
模版提供一些有用的命令方便论文写作，其中包含一些常见的汉语字符：

| 命令名称 | 字符 | Unicode 编号|
|---|---|---|
|\chinesecolon| ： | FF1A |
|\chinesespace|    | 3000 |
|\chineseperiod| 。| 3002 |
|\chinesequestion| ？  | FF1F |
|\chineseexclamation| ！  | FF01 |
|\chinesecomma| ，  | FF0C |
|\chinesesemicolon|  ； | FF1B |
|\chineseleftparenthesis|（ | FF08 |
|\chineserightparenthesis| ）| FF09 |

另外`\blankpage`命令可以强制生成一页空白。

### 分割文件

模板提供的样例（`main.tex`）将所有内容写在同一个文档里，使用者认为必要可以将各个章节写在不同的子文件内，使用`\input`命令统一包含。

模版提供另一个多文件的范例（`main_multifile.tex`），执行相应的命令即可自动编译：
```bash
latexmk main_multifile.tex
```
其中每个文件对应独立的章（参见`chapter/template.tex`）、摘要、致谢等（见`misc/`）。分割的文件使用`\input`命令包含到主文档内（参见`main_multifile.tex`）。所有需要使用的宏包在主文件中导入，编译方法保持不变。

### 图表目录和缩略词

图目录、表目录和缩略词表分别对应`\thesisfigurelist`，`\thesistablelist`，`\thesisglossarylist`命令，这些列表不会出现在目录里。

缩略词表使用`glossaries`宏包实现。定义缩略词使用`\newglossaryentry{<label>}{<description>}`命令，例如：
```latex
\newglossaryentry{Linux}
{
  name=Linux,
  description={is a generic term referring to the family of Unix-like
    computer operating systems that use the Linux kernel},
  plural=Linuces
}
```

或者`\newacronym[description=<chinese>]{<label>}{<abbrv>}{<full>}`命令，例如：
```latex
\newacronym[description=逻辑卷管理器]{lvm}{LVM}{Logical Volume Manager}
```

只有在正文使用命令恰当引用的缩略词才会在缩略词表中列出。正文中引用缩略词时，使用`glossaries`宏包提供的`\gls`、`\Gls`（首字母大写）或`\glspl`（复数形式）等命令引用缩略词的`<label>`。
具体使用方法参考[glossaries宏包文档](https://www.ctan.org/tex-archive/macros/latex/contrib/glossaries/)。

若想在缩略词表中列出所有定义过的条目，无论在正文中是否引用，可以在`\thesisglossarylist`之前使用`\glsaddall`命令。

手动编译包含有缩略词表的文档，执行`xelatex`编译命令后需要执行`makeglossaries main`（注意没有.tex后缀）创建缩略词索引，再执行`xelatex`命令完成编译。所以手动编译一个包含参考文献、研究成果、缩略词表的完整文档命令为：
```bash
xelatex main.tex
bibtex main.aux
bibtex accomplish.aux
makeglossaries main
xelatex main.tex
xelatex main.tex
```
推荐使用latexmk命令进行编译，自动处理以上的问题。

## 技术交流

欢迎各位同学交流技术经验，如果希望使用QQ即时交流可加成电LaTeX模板交流群（926297104）。验证信息请回答问题，不要空置。如有问题还可以在项目 [Issue](https://github.com/x-magus/ThesisUESTC/issues) 模块提出，或者邮件联系作者（wwzvd@mst.edu）。类模板完全由作者手动编写，并非由代码工具生成，相对容易修改和阅读。在此欢迎高阶的使用者分享更好的写法，提出改进的建议。

![](https://x-magus.github.io/pic/save/technical_contact.jpg)