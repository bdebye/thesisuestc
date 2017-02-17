# 基于XeLaTeX的电子科技大学毕业论文模板

**thesisUESTC**是一个基于XeLaTeX写作的用于排版电子科技大学毕业论文的模板类，旨在帮助电子科技大学的毕业生高效地完成毕业论文的写作。模板提供各种方便的命令，自动化地排版论文的各个部分，使毕业论文轻易地满足学校的格式要求。为了支持更好的字体效果，模板基于XeLaTeX编写，只能使用XeLaTeX引擎编译，并且放弃对CTEX的依赖，使模板更加稳定。

模板由电子科技大学物理电子学院2014级硕士研究生王稳编写，由于在毕业论文写作中遇到各种问题，希望有一个理想的解决方案，所以决定写一个模板出来。希望此项目能继续发展，解决各位同学毕业论文排版中的困难。

## 使用方法
使用模板需要系统安装任意一种TeX环境，如TeXLive、MacTeX和MiKTeX，自动带有XeLaTeX引擎，但是不推荐CTeX。模板采用LaTeX类的形式封装，导入模板只需要把thesisUESTC.cls文件放在文档所在目录，在文档开头使用`\documentclass{thesisUESTC}`命令将文档的类设置成thesisUESTC即可。文档内容的书写参考范例`main.tex`。

编译文档请使用XeLaTeX引擎。使用WinEdt、Texmaker或Texpad等编辑环境直接使用操作界面提供的编译按钮即可，不需要复杂的编译脚本，但是记得将编译引擎设置成XeLaTeX。命令编译如`xelatex main.tex`即可，文档内部有引用或参考文献的情况下需要多次编译。

使用在线编辑环境如Overleaf或ShareLaTeX的情况下需要上传字体文件到项目的根目录，修改模板最后的字体设置，直接制定所使用的字体文件。详细做法参考模板代码末尾的注释。

    \setCJKmainfont[BoldFont=SimHei]{SimSun}
    \setmainfont{Times New Roman}

    %
    % If you want to use this template in online editing system like Overleaf
    % or ShareLaTeX, upload the font files to the root folder of your project, 
    % delete above two lines and uncomment the configurations below. Remember
    % to make the names of font files same as used below.
    %
    % \setCJKmainfont[BoldFont=simhei.ttf]{simsun.ttf} % SimSun and SimHei
    % \setmainfont[
    %     BoldFont=timesbd.ttf,     % Times New Roman Bold
    %     ItalicFont=timesi.ttf,     % Times New Roman Italic
    %     BoldItalicFont=timesbi.ttf,     % Times New Roman Bold Italic
    % ]{times.ttf}     % Times New Roman Normal Font
    
模板目前还不支持bibtex参考文献，作者目前正积极解决这一问题。
