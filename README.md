# 基于XeLaTeX的电子科技大学毕业论文模板

**ThesisUESTC**提供基于XeLaTeX写作的用于排版电子科技大学毕业论文的模板类，旨在帮助电子科技大学的毕业生高效地完成毕业论文的写作。模板提供各种方便的命令，自动化地排版论文的各个部分，使毕业论文轻易地满足学校的格式要求。为了支持更好的字体效果，模板基于XeLaTeX编写，只能使用XeLaTeX引擎编译，并且放弃对CTeX的依赖，使模板更加稳定。

模板由电子科技大学物理电子学院2014级硕士研究生王稳编写，由于在毕业论文写作中遇到各种问题，希望有一个理想的解决方案，所以决定写一个模板出来。祝愿此项目能继续发展，解决各位同学毕业论文写作中的困难。

## 使用方法
使用模板需要系统安装任意一种TeX环境，如TeXLive、MacTeX和MiKTeX（都自动带有XeLaTeX引擎，但是不推荐CTeX），安装有SimSun和SimHei字体（其实就是宋体和黑体）以及Times New Roman英文字体。字体方面也可以像在线编辑环境那样指定所使用的字体文件。模板采用LaTeX类的形式封装，导入模板只需要把thesis-uestc.cls文件放在文档所在目录，在文档开头使用`\documentclass{thesis-uestc}`命令将文档的类设置成thesis-uestc即可。使用BibTeX录入参考文献还需要thesis-uestc.bst风格定义文件。模板类有bachelor、master和doctor三个选项，对应本科、硕士和博士的毕业论文，默认选项为master。文档内容的书写参考范例`main.tex`。

编译文档请使用XeLaTeX引擎。使用WinEdt、Texmaker或Texpad等编辑环境记得将编译引擎设置成XeLaTeX。命令编译如`xelatex main.tex`即可，文档内部有引用或参考文献的情况下需要编译两次。使用BibTeX形式的参考文献需要先运行一次xelatex，运行一次bibtex，再运行两次xelatex。使用BibTeX录入攻读学问期间的研究成果的情况下还需要额外运行一次`bibtex achievement.aux`。所以完整地编译包含两个BibTeX文献列表（一个是参考文献，一个是攻读学位期间的研究成果）的文档需要按顺序运行以下命令：

```bash
xelatex main.tex
bibtex main.aux
bibtex achievement.aux
xelatex main.tex
xelatex main.tex
```

注意使用某些编辑环境如WinEdt、Texmaker编译文档，编辑器的bibtex编译按钮可能会忽略编译研究成果的文献列表（个人认为这是编辑器设计的一个漏洞），这种情况下编译出来的文档没有列出研究成果，仍需要两次`xelatex main.tex`命令之前手动运行`bibtex achievement.aux`。

使用在线编辑环境Overleaf只需打开发布在Overleaf Gallery里的[模板](https://www.overleaf.com/latex/templates/uestc-thesis-template/nwpkhtrtjhrg)，点击OPEN AS TEMPLATE即可使用，在线自动编译和预览。Overleaf模板唯一的区别在于直接使用放置在项目根目录的字体文件。

## 论文写作指南

### 中英文摘要

中英文摘要的内容应包含在`chineseabstract`和`englishabstract`环境中，关键字使用`\chinesekeyword`和`\englishkeyword`命令添加，并包含在相应环境中。模板自动设置页眉和页脚，其中中文摘要标题中间空一格，页眉不空格。根据学校的格式说明，模板自动根据摘要结束所在的页数决定是否再空一页。

### 论文目录

论文目录由命令`\thesistableofcontents`添加，这个命令自动处理标题，页眉以及缩进等问题。根据学校的格式说明，模板自动根据目录结束所在的页数决定是否再空一页。

### 绪论

绪论固定是每篇论文第一个正式的章节，由于格式特殊（其实主要是页眉中间没有空格）所以由单独一个命令`\thesischapterexordium`开始。

### 论文主体

论文主体的写作参考一般的LaTeX教程，可以自由添加章节，章节内加入所需要的内容，分小节，插入公式、表格和图片。

### 致谢

致谢由命令`\thesisacknowledgement`开始，实际上是重新开始了一个无编号的章节。

### 参考文献

参考文献使用`thesisbibliography`环境，在其中使用`\bibitem`命令加入文献条目。引用分直接引用`\cite`命令和上标引用命令`\citing`两种。直接引用在正文中的标号显示为正常字体，上标引用显示为上标字体。使用BibTeX录入参考文献由`\thesisloadbibliography`命令导入所使用的数据库，参考文献风格为thesis-uestc。这个命令有一个可选参数，在为`nocite`的情况下会在文档中列出数据库中的所有条目，无论是否引用。其他情况下只列出引用过的条目。

### 附录

附录由命令`\thesisappendix`开始，实际上是重新开始了一个无编号的章节。为了书写方便，附录中可以继续分小节，只不过附录中的小节不会在目录中显示。

### 攻读学位期间取得的成果

将文章条目放在`thesisachievement`环境下，方法与参考文献相同。使用BibTeX录入研究成果的情况下由`\thesisloadachievement`导入文献列表，风格设置为thesis-uestc。此命令没有可选参数，自动在文档中列出数据库中的所有条目。

### 外文资料原文

本科毕业论文要求翻译一篇外文资料，资料原文应由命令`\thesistranslationoriginal`开始。为了书写方便可以继续分小节，只不过这部分中的小节不会在目录中显示。

### 外文资料译文

资料译文应由命令`\thesistranslationchinese`开始。为了书写方便可以继续分小节，只不过这部分中的小节不会在目录中显示。

### 插入图片和表格

插入图片使用`figure`环境，自动调整图片上下的间距。图片文件可以统一放在`./pic`目录下。插入表格使用`table`环境，自动调整表格上下的间距，还有默认的字体大小。具体插入图片和表格代码的写法参考书写范例`main.tex`。

### 定理环境

请使用模板类提供的定义（definition）、公理（axiom）、证明（proof）、定理（theorem）、推论（corollary）和引理（lemma）环境。

### 算法描述

算法描述使用`algorithm`环境，具体写法参考书写范例`main.tex`。模板类自动加载的`algorithm2e`宏包，详细的使用方法请参考[文档](http://mirrors.ustc.edu.cn/CTAN/macros/latex/contrib/algorithm2e/doc/algorithm2e.pdf)。

### 枚举环境和脚注

枚举使用标准的`enumerate`、`itemize`以及`description`环境。脚注用标准的`\footnote`命令插入。

### 分割文件

模板提供的样例将所有内容写在同一个主文档里，使用者认为方便的话也可以将项目分割成文件，将不同的章节写在不同的子文档内，最后统一包含。模板自动导入了standalone包用于对多文件的项目进行管理。子文档的写法应遵守以下格式：

```latex
\documentclass{standalone}
% preamble: usepackage, etc.
\begin{document}
%% my chapter 1 content
%%
%% more of my chapter 1 content
\end{document}
```

然后使用`\input`或`\include`命令包含到主文档。编译方法与单个文件的情况相同。更详细的说明请参考standalone宏包的[文档](https://mirrors.tuna.tsinghua.edu.cn/CTAN/macros/latex/contrib/standalone/standalone.pdf)。

### 主要符号表和缩略词表

由于学校没有给出清楚的格式说明，暂时不提供此功能。

## 技术交流

如果希望用QQ即时交流可加QQ群：成电LaTeX技术交流（71480604）。验证信息请说明身份，不要空置。由于作者不怎么访问清水河畔论坛，如有问题请在项目issue模块提出，或者邮件联系作者（wanygen@gmail.com）。类模板完全由作者手动编写，并非由代码工具生成，相对容易修改和阅读。在此欢迎高阶使用者改进模板代码，提出建议，分享更好的写法。