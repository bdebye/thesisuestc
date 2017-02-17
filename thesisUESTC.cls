%%
%%  Copyright 2017 Wen Wang <wanygen@gmail.com>
%% 
%%  This work may be distributed and/or modified under the
%%  conditions of the LaTeX Project Public License, either version 1.3
%%  of this license or (at your option) any later version.
%%  The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%%  and version 1.3 or later is part of all distributions of LaTeX
%%  version 2005/12/01 or later.
%% 
%%  This work has the LPPL maintenance status `maintained'.
%% 
%%  The Current Maintainer of this work is Wen Wang <wanygen@gmail.com>.
%% 
%%  This work consists of the file thesisUESTC.cls.
%% 


\ProvidesClass{thesisUESTC}

\LoadClass[12pt, openany, twoside]{book}

\RequirePackage[cm-default]{fontspec}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage[font={doublespacing, small}, labelsep=space, skip=6pt]{caption}
\RequirePackage{array}
\RequirePackage{setspace}
\RequirePackage{multirow}
\RequirePackage{bm}
\RequirePackage{xunicode,xltxtra}
\RequirePackage{xeCJK}
\RequirePackage{CJKnumb}
\RequirePackage{pifont}
\RequirePackage{mathptmx}

\definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
\RequirePackage[hyperfootnotes=false]{hyperref}
\hypersetup{
 colorlinks=true,
 citecolor=black,
 linkcolor=black,
 urlcolor=darkblue}
 
\RequirePackage{indentfirst}
\RequirePackage{calc}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{float}
\RequirePackage{fancyvrb}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{setspace}
\RequirePackage{cite}
\RequirePackage{flafter}

\graphicspath{{./pic/}}

\RequirePackage[titles, subfigure]{tocloft}
\RequirePackage{subfigure}

\renewcommand{\contentsname}{目\chinesespace 录}
\renewcommand{\bibname}{参考文献}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

\RequirePackage[a4paper, inner=3cm, outer=3cm, top=3cm,
bottom=3cm, bindingoffset=0cm]{geometry}

\pagestyle{fancy}
\linespread{1.391}
\setlength\parindent{24pt}
\titlespacing{\chapter}{0pt}{0pt}{0.7cm}
\titlespacing{\section}{0pt}{20pt}{6pt}
\titlespacing{\subsection}{0pt}{12pt}{6pt}
\titlespacing{\subsubsection}{0pt}{12pt}{6pt}


\renewcommand\thechapter{第\CJKnumber{\arabic{chapter}}章}
\renewcommand\thesection{\arabic{chapter}.\arabic{section}}

\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}

\captionsetup{format=hang}
\captionsetup[figure]{aboveskip=2pt,belowskip=-4pt}
\captionsetup[table]{belowskip=6pt}
\setlength{\extrarowheight}{5pt}
\setlength{\subfigcapskip}{-3pt}

\newenvironment{graphic}[1][h]{
	\vspace{-10pt}
	\begin{figure}[#1]
    \centering
}{
	\end{figure}
}

\newenvironment{form}[1][h]{
	\begin{table}[#1]
    \centering
    \small
}{
	\end{table}
    \vspace{-16pt}
}

\makeatletter
\renewcommand{\p@subfigure}{\arabic{chapter}-\arabic{figure}}
\makeatother

\newcommand{\chinesecolon}{\char"FF1A}
\newcommand{\chinesespace}{\char"3000}

\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}

\titleformat{\chapter}
  {\centering\fontsize{15pt}{15pt}\selectfont\bfseries\thispagestyle{fancy}}{\thechapter}{1em}{}
  
\titleformat{\section}
  {\fontsize{14pt}{14pt}\selectfont\bfseries}
  {\thesection}{7pt}{}
  
\titleformat{\subsection}
  {\fontsize{14pt}{14pt}\selectfont\bfseries}
  {\thesubsection}{7pt}{}

\titleformat{\subsubsection}
  {\fontsize{12pt}{12pt}\selectfont\bfseries}
  {\thesubsubsection}{6pt}{}

\RequirePackage[hang]{footmisc}
\addtolength{\footnotesep}{0mm}
\setlength{\footnotemargin}{4.5mm}

\renewcommand{\footnotesize}{\fontsize{9pt}{11pt}\selectfont}
\renewcommand{\small}{\fontsize{10.5pt}{12.6pt}\selectfont}
\renewcommand\footnotelayout{\fontsize{9}{12.5}\selectfont}

\renewcommand{\thefootnote}{\ifcase\value{footnote}\or\ding{172}\or
\ding{173}\or\ding{174}\or\ding{175}\or\ding{176}\or\ding{177}\or
\ding{178}\or\ding{179}\or\ding{180\or\ding{181}}\fi}

\renewcommand{\footnoterule}{\vfill\noindent\vspace*{0.9mm}\hspace{8.2mm}\rule{5.05cm}{0.02cm}\vspace*{2.6pt}}

\makeatletter
\def\@makefntext #1{
	\ifFN@hangfoot 
    	\bgroup \setbox \@tempboxa \hbox {
        	\ifdim
				\footnotemargin >0pt \hb@xt@ 
                \footnotemargin {\hbox { \normalfont \@thefnmark}\hss }
            \else 
            	\hbox { \normalfont \@thefnmark} 
			\fi 
		}
        \leftmargin \wd \@tempboxa 
        \rightmargin \z@ \linewidth \columnwidth 
        	\advance \linewidth -\leftmargin\parshape \@ne 
		\leftmargin \linewidth \footnotesize \@setpar {{\@@par }}
		\leavevmode \llap {\box \@tempboxa }\parskip 
        \hangfootparskip \relax \parindent
		\hangfootparindent \relax 
        \else 
        	\parindent 1em \noindent 
            \ifdim 
                \footnotemargin >\z@ \hb@xt@ 
                \footnotemargin {\hss \hbox { \normalfont \@thefnmark} }
            \else
				\ifdim \footnotemargin =\z@ 
                    \llap {\hbox { \normalfont \@thefnmark} }
                \else
 					\llap {\hb@xt@ -\footnotemargin {\hbox { \normalfont \@thefnmark} \hss }}
 				\fi 
            \fi
		\fi 
        \footnotelayout #1\ifFN@hangfoot \par \egroup 
	\fi
}
\makeatother


\newenvironment{chineseabstract}{
	\fancyfoot[CE,CO]{\fontsize{9pt}{11pt}\selectfont\thepage}
	\pagenumbering{Roman}
    \chapter*{摘\chinesespace 要}
    \thispagestyle{fancy}
    \fancyhead[C]{摘要}
}{
	\clearpage{\pagestyle{empty}\cleardoublepage}
}

\newcommand{\chinesekeyword}[1]{
	\noindent
    \begin{minipage}[t]{1.5cm}
    	\noindent\textbf{关键词\chinesecolon}
    \end{minipage}
    \begin{minipage}[t]{\linewidth - 1.5cm}
    	#1
    \end{minipage}
}
  
\newenvironment{englishabstract}{
	\chapter*{ABSTRACT}
    \thispagestyle{fancy}
    \fancyhead[C]{ABSTRACT}
}{
    \clearpage{\pagestyle{empty}\cleardoublepage}
}
  
\newcommand{\englishkeyword}[1]{
	\noindent\begin{minipage}[t]{2.1cm}
    	\noindent\textbf{Keywords:}
    \end{minipage}
    \begin{minipage}[t]{
    	\linewidth - 2.1cm}
        #1
    \end{minipage}
}


\RequirePackage{everypage}
\AddEverypageHook{\addtocontents{toc}{
	\protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\tocloftpagestyle{fancy}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand\cftchapleader{\cftdotfill{\cftdotsep}}

\renewcommand{\cftdotsep}{0.4}

\setlength{\cftbeforetoctitleskip}{0pt}
\setlength{\cftaftertoctitleskip}{18pt}
\setlength{\cftbeforechapskip}{0pt}

\addtolength{\cftchapnumwidth}{25pt}

\cftsetindents{section}{21pt}{22pt}
\cftsetindents{subsection}{36pt}{31pt}
\cftsetindents{subsubsection}{60pt}{41pt}

\renewcommand{\cfttoctitlefont}{\fontsize{15pt}{15pt}\selectfont\bfseries}

\newcommand{\chinesedegreename}{硕士}
\DeclareOption{bachelor}{
  \renewcommand{\chinesedegreename}{本科}
}

\DeclareOption{master}{
  \renewcommand{\chinesedegreename}{硕士}
}

\DeclareOption{doctor}{
  \renewcommand{\chinesedegreename}{博士}
}

\ProcessOptions\relax

\newcommand{\standardhead}{
	\fancyhf{}
	\fancyhead[CO]{\fontsize{10.5pt}{12pt}\selectfont\leftmark}
	\fancyhead[CE]{\fontsize{10.5pt}{12pt}\selectfont 电子科技大学\chinesedegreename{}学位论文}
	\fancyfoot[CE,CO]{\fontsize{9pt}{11pt}\selectfont\thepage}
}
 
\newcommand{\thesistableofcontents}{
	\fancyhf{}
	\fancyhead[C]{目录}
    \fancyfoot[CE,CO]{\fontsize{9pt}{11pt}\selectfont\thepage}
    \tableofcontents
    \clearpage{\pagestyle{empty}\cleardoublepage}
	\standardhead
	\pagenumbering{arabic}
	\setcounter{page}{1}
}

\renewcommand{\chaptermark}[1]{\markboth{第\CJKnumber{\arabic{chapter}}章 \hspace{0.5em} #1}{}}

\newcommand{\thesisacknowledgement}{
    \renewcommand\thesection{\arabic{section}}
	\addtocontents{toc}{\protect\setcounter{tocdepth}{0}} 
    \setcounter{section}{0}
	\chapter*{致\chinesespace 谢}
    \addcontentsline{toc}{chapter}{致\chinesespace  谢}
    \markboth{致谢}{致谢}
    \markboth{致\chinesespace  谢}{致\chinesespace  谢}
    \thispagestyle{fancy}
}


\newcommand{\thesischapterexordium}{
	\chapter{绪\chinesespace 论}
    \markboth{\thechapter\chinesespace 绪论}{绪\thechapter\chinesespace 论}
}

\newcommand{\thesisappendix}{
	\chapter*{附\chinesespace 录}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{附录}
    \markboth{附录}{附录}
    \thispagestyle{fancy}
}

\newcommand{\thesistranslationoriginal}{
	\chapter*{外文资料原文}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{外文资料原文}
    \markboth{外文资料原文}{外文资料原文}
    \thispagestyle{fancy}
}

\newcommand{\thesistranslationchinese}{
	\chapter*{外文资料译文}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{外文资料译文}
    \markboth{外文资料译文}{外文资料译文}
    \thispagestyle{fancy}
}

\newenvironment{thesisachievement}{
	\renewcommand{\bibname}{攻读\chinesedegreename{}学位期间取得的成果}
    \setcounter{section}{0}
    \begin{thebibliography}{lo}
    \begin{spacing}{1.667}
    \addcontentsline{toc}{chapter}{攻读\chinesedegreename{}学位期间取得的成果}
    \thispagestyle{fancy}
    \small
}{
    \end{spacing}\end{thebibliography}
    \renewcommand{\bibname}{参考文献}
}

\let\OLDthebibliography\thebibliography
\renewcommand\thebibliography[1]{
  \OLDthebibliography{#1}
  \setlength{\parskip}{0pt}
  \setlength{\itemsep}{0pt}
}
\makeatletter
\renewcommand{\@biblabel}[1]{[#1]\hfill}
\makeatother

\newenvironment{thesisbibliography}{
    \setcounter{section}{0}
	\begin{thebibliography}{lo}
    \begin{spacing}{1.667}
    \addcontentsline{toc}{chapter}{参考文献}
    \thispagestyle{fancy}
    \small
}{
    \end{spacing}
    \end{thebibliography}
}

\newtheoremstyle{dotless}{0pt}{0pt}{\normalfont}{24pt}{\bfseries}{}{ }{}
\theoremstyle{dotless}
\newtheorem{theorem}{定理}
\newtheorem{corollary}[theorem]{推论}
\newtheorem{lemma}[theorem]{引理}



\renewcommand{\thetheorem}{\arabic{chapter}.\arabic{theorem}}
\renewcommand{\thecorollary}{\arabic{chapter}.\arabic{corollary}}
\renewcommand{\thelemma}{\arabic{chapter}.\arabic{lemma}}
\renewcommand{\qedsymbol}{$\blacksquare$}
\renewcommand{\proofname}{证明}

\makeatletter
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}
  \normalfont
  \topsep0pt \partopsep0pt
  \trivlist
  \item[\hskip5\labelsep
        \bfseries
    #1\@addpunct{:}]\ignorespaces
}{
  \popQED\endtrivlist\@endpefalse
}
\makeatother

\newcommand{\citing}[1]{\textsuperscript{\cite{#1}}}


\defaultfontfeatures{Mapping=tex-text}
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

\setCJKmainfont[BoldFont=SimHei]{SimSun}
\setmainfont{Times New Roman}

%
% If you want to use this template in online editing system like Overleaf
% or ShareLaTeX, upload the font files to the root folder of your project, 
% delete above two lines and uncomment the configurations below. Remember
% to make the names of font files the same as used below.
%
% \setCJKmainfont[BoldFont=simhei.ttf]{simsun.ttf} % SimSun and SimHei
% \setmainfont[
%     BoldFont=timesbd.ttf,     % Times New Roman Bold
%     ItalicFont=timesi.ttf,     % Times New Roman Italic
%     BoldItalicFont=timesbi.ttf,     % Times New Roman Bold Italic
% ]{times.ttf}     % Times New Roman Normal Font
%

\endinput
