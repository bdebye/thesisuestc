# ThesisUESTC-电子科技大学毕业论文模板

**ThesisUESTC**提供用于排版电子科技大学毕业论文的LaTeX模板类，旨在帮助电子科技大学的毕业生高效地完成毕业论文的写作。模板提供各种方便的命令，自动化地排版论文的各个部分，使毕业论文轻易地满足学校的格式要求。为了支持更好的字体效果，模板基于XeLaTeX编写，并且放弃对CTeX的依赖，使模板更加稳定。

模板由电子科技大学物理电子学院2014级硕士研究生王稳编写，由于在毕业论文写作中遇到各种问题，希望有一个理想的解决方案，所以决定写一个模板出来。祝愿此项目能继续发展，解决各位同学毕业论文写作中的困难。

## 使用方法

### 基本环境
使用模板需要系统安装任意一种TeX环境，如TeXLive、MacTeX和MiKTeX（都自动带有XeLaTeX引擎，但是不推荐CTeX），安装有SimSun和SimHei字体（其实就是宋体和黑体）以及Times New Roman英文字体。字体方面也可以像在线编辑环境那样指定所使用的字体文件。在MacOS下编译会自动识别操作系统，使用Sonti SC和STHeiti字体，但需要启用`--shell-escape`编译选项。

模板采用LaTeX类的形式封装，导入模板只需要把thesis-uestc.cls文件放在文档所在目录，在文档开头使用`\documentclass{thesis-uestc}`命令将文档的类设置成thesis-uestc即可。使用BibTeX录入参考文献还需要`thesis-uestc.bst`风格定义文件。

模板类有bachelor、master、promaster和doctor四个选项，对应本科、硕士、专业硕士和博士的毕业论文，默认选项为`master`。文档内容的书写参考范例`main.tex`。

### 文档编译
编译文档请使用XeLaTeX引擎。模版提供latexmk设置文件用于自动编译。将命令行工作目录切换到项目文件夹下，执行
```bash
latexmk main.tex
```
命令即可自动调用相关程序进行编译，处理各种文件依赖并自动预览。执行`latexmk -c`命令清理所有缓存文件。编译多文件结构的文档将文件名替换成`main_multifile.tex`即可。使用TeXstudio、Texmaker或WinEdt等编辑环境请将编译引擎设置成latexmk，如果在Windows平台下使用MikTeX还需要安装[Perl语言解释器](http://strawberryperl.com/)。

手动编译的话执行
```bash
xelatex main.tex
```
命令即可，若文档内部有交叉引用或录入参考文献则需要编译两次。

使用BibTeX录入参考文献需要先运行一次xelatex，运行一次bibtex，再运行两次xelatex。使用BibTeX录入攻读学位期间的研究成果的情况下还需要额外运行一次`bibtex achievement.aux`。所以完整地编译包含两个BibTeX文献列表（一个是参考文献，一个是攻读学位期间的研究成果）的文档需要按顺序运行以下命令：

```bash
xelatex main.tex
bibtex main.aux
bibtex achievement.aux
xelatex main.tex
xelatex main.tex
```

使用Overleaf在线编辑只需打开发布在Overleaf Gallery里的[模板](https://www.overleaf.com/latex/templates/uestc-thesis-template/nwpkhtrtjhrg)，点击OPEN AS TEMPLATE即可使用，在线自动编译和预览。Overleaf模板唯一的区别在于直接使用放置在项目根目录的字体文件。

## 论文写作指南

### 论文封面

论文封面和扉页由`\makecover`命令添加，可以显示论文题目，作者，指导老师等。模版不会生成英文扉页和独创性声明，这两页包括中文封面最后正式提交时会由文印中心统一提供，无论自己排版的封面是否符合格式要求。已经包含的封面也不会影响任何前期的审核。

### 中英文摘要

中英文摘要应包含在`chineseabstract`和`englishabstract`环境中，对应的关键字使用`\chinesekeyword`和`\englishkeyword`命令添加，并包含在相应的环境中。模板自动设置页眉和页脚，其中中文摘要标题中间空一格，页眉不空格。根据学校的格式说明，模板自动根据摘要结束所在的页数决定是否再空一页。

### 论文目录

论文目录由命令`\thesistableofcontents`添加，并且自动处理标题，页眉以及缩进等问题。根据学校的格式说明，模板自动根据目录结束所在的页数决定是否再空一页。

### 绪论

绪论是毕业论文的第一章，由于格式特殊（其实主要是页眉中间没有空格）由单独一个命令`\thesischapterexordium`开始。

### 论文主体

论文主体的写作参考一般的LaTeX教程，可以自由添加章节，章节内添加所需要的内容，分小节，插入公式、表格和图片。

### 致谢

致谢由命令`\thesisacknowledgement`开始，实际上是开始了一个无编号的章节。

### 参考文献

录入参考文献使用`thesisbibliography`环境，在环境中使用`\bibitem`命令添加文献条目。参考文献的引用分两种：在原文中作句法成分的为直接引用，使用`\cite`命令，否则为`\citing`命令，在文中文献编号显示为上标。

使用BibTeX录入参考文献由`\thesisloadbibliography`命令导入数据库，参考文献风格自动设置为`thesis-uestc`。这个命令有一个可选参数，在为`nocite`的情况下会在文档中列出数据库中的所有条目，无论是否引用，其他情况下只列出引用过的条目。有些编辑器会识别`\bibliography`命令导入的数据库文件，并提供更好的编辑支持，所以模板也支持原生的`\bibliography`命令导入文献列表，只需要导入之前指定参考文献风格（`\bibliographystyle{thesis-uestc}`）即可。

### 附录

附录由命令`\thesisappendix`开始，实际上是开始了一个无编号的章节。为了书写方便，附录中可以继续分小节，但附录中的小节不会在目录中显示。

### 攻读学位期间取得的成果

将文章条目添加在`thesisachievement`环境下，方法与参考文献相同。使用BibTeX录入研究成果由`\thesisloadachievement`命令导入文献列表，参考文献风格自动设置为`thesis-uestc`。此命令没有可选参数，自动在文档中列出数据库中的所有条目。

### 外文资料原文及译文

本科毕业论文要求翻译一篇外文资料，资料原文应由命令`\thesistranslationoriginal`开始，资料译文由命`\thesistranslationchinese`开始。为了书写方便可以继续分小节，但是这部分中的小节不会在目录中显示。

### 插入图片和表格

插入图片使用`figure`环境，自动调整图片前后的间距。插入表格使用`table`环境，自动调整表格前后的间距和默认的字体大小。

图片文件可以统一放在`./pic`目录下。具体插入图片和表格的代码参考范例`main.tex`。

### 定理环境

数学定理使用模板提供的定义（definition）、公理（axiom）、证明（proof）、定理（theorem）、推论（corollary）、命题（proposition）、引理（lemma）和例子（example）环境。

### 算法描述

算法描述使用`algorithm`环境，具体写法可参考范例`main.tex`或`chapter\c3.tex`。

模板类自动加载`algorithm2e`宏包，详细的用法请参考[algorithm2e宏包文档](http://mirrors.ustc.edu.cn/CTAN/macros/latex/contrib/algorithm2e/doc/algorithm2e.pdf)。

### 枚举环境和脚注

枚举使用标准的`enumerate`、`itemize`以及`description`环境。脚注使用标准的`\footnote`命令插入。

### 分割文件

模板提供的样例（`main.tex`）将所有内容写在同一个文档里，使用者认为必要可以将各个章节写在不同的子文件内，使用`\include`命令统一包含。

模版提供另一个多文件的范例（`main_multifile.tex`），执行相应的命令即可自动编译：
```bash
latexmk main_multifile.tex
```
其中每个文件对应独立的章（参见`chapter/template.tex`）或摘要，致谢等（见`misc/`）。分割的文件使用`\input`或`\include`命令包含到主文档内（参见`main_multifile.tex`）。所有需要使用的宏包在主文件中导入，编译方法保持不变。

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

正文中引用缩略词时，使用`glossaries`宏包提供的`\gls`、`\Gls`（首字母大写）或`\glspl`（复数形式）等命令。
具体使用方法参考[glossaries宏包文档](https://www.ctan.org/tex-archive/macros/latex/contrib/glossaries/)。

手动编译包含有缩略词表的文档，执行`xelatex`编译命令后需要执行`makeglossaries main`（注意没有.tex后缀）创建缩略词索引，再执行`xelatex`命令完成编译。所以手动编译一个包含参考文献、研究成果、缩略词表的完整文档命令为：
```bash
xelatex main.tex
bibtex main.aux
bibtex achievement.aux
makeglossaries main
xelatex main.tex
xelatex main.tex
```
推荐使用latexmk命令进行编译，自动处理以上的问题。

## 技术交流

如果希望使用QQ即时交流可加成电LaTeX技术交流群（71480604）。验证信息请说明身份，不要空置。由于作者不怎么访问清水河畔论坛，如有问题请在项目Issue模块提出，或者邮件联系作者（wwzvd@mst.edu）。类模板完全由作者手动编写，并非由代码工具生成，相对容易修改和阅读。在此欢迎高阶的使用者分享更好的写法，提出改进的建议。
