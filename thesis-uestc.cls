%
%  Copyright 2017 Wen Wang <wanygen@gmail.com>
%
%  This work may be distributed and/or modified under the
%  conditions of the LaTeX Project Public License, either version 1.3
%  of this license or (at your option) any later version.
%  The latest version of this license is in
%    http://www.latex-project.org/lppl.txt
%  and version 1.3 or later is part of all distributions of LaTeX
%  version 2005/12/01 or later.
%
%  This work has the LPPL maintenance status `maintained'.
%
%  The Current Maintainer of this work is Wen Wang <wanygen@gmail.com>.
%
%  This work consists of the files thesis-uestc.cls, thesis-uestc.bst.
%


\ProvidesClass{thesis-uestc}

\LoadClass[12pt, openany, twoside]{book}

\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage[font={doublespacing, small}, labelsep=space, skip=6pt]{caption}

\RequirePackage{array}
\RequirePackage{setspace}
\RequirePackage{multirow}
\RequirePackage[tbtags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{lmodern}
\RequirePackage{mathspec}
\RequirePackage{fontspec}
\RequirePackage{bm}

\RequirePackage{xeCJK}

% value > 0
\def\xeCJKembold{0.4}

% hack into xeCJK, you don't need to understand it
\def\saveCJKnode{\dimen255\lastkern}
\def\restoreCJKnode{\kern-\dimen255\kern\dimen255}

% save old definition of \CJKsymbol and \CJKpunctsymbol for CJK output
\let\CJKoldsymbol\CJKsymbol
\let\CJKoldpunctsymbol\CJKpunctsymbol

% apply pdf literal fake bold
\def\CJKfakeboldsymbol#1{%
  \special{pdf:literal direct 2 Tr \xeCJKembold\space w}%
  \CJKoldsymbol{#1}%
  \saveCJKnode
  \special{pdf:literal direct 0 Tr}%
  \restoreCJKnode}
\def\CJKfakeboldpunctsymbol#1{%
  \special{pdf:literal direct 2 Tr \xeCJKembold\space w}%
  \CJKoldpunctsymbol{#1}%
  \saveCJKnode
  \special{pdf:literal direct 0 Tr}%
  \restoreCJKnode}
\newcommand\CJKfakebold[1]{%
  \let\CJKsymbol\CJKfakeboldsymbol
  \let\CJKpunctsymbol\CJKfakeboldpunctsymbol
  #1%
  \let\CJKsymbol\CJKoldsymbol
  \let\CJKpunctsymbol\CJKoldpunctsymbol}


\RequirePackage{zhnumber}
\RequirePackage{pifont}

\definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
\RequirePackage[hyperfootnotes=false]{hyperref}
\hypersetup{
 	colorlinks=true,
 	citecolor=black,
 	linkcolor=black,
 	urlcolor=black
}

\RequirePackage{standalone}
\RequirePackage{indentfirst}
\RequirePackage{calc}
\RequirePackage{float}
\RequirePackage{fancyvrb}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{setspace}
\RequirePackage{cite}
\RequirePackage{enumitem}
\RequirePackage{algorithm2e}
\RequirePackage{etoolbox}
\RequirePackage{newfloat}
\RequirePackage[resetlabels]{multibib}
\RequirePackage[nottoc]{tocbibind}

\let\algorithm\relax
\let\endalgorithm\relax
\expandafter\let\csname algorithm*\endcsname\relax
\expandafter\let\csname endalgorithm*\endcsname\relax
\let\listofalgorithms\relax

% Define the new algorithm environment
\DeclareFloatingEnvironment{algorithm}

\makeatletter
% Definition for the style ruled
% First add the rules enclosing the captiom
\DeclareCaptionFormat{algrule}{%
  {\@hangfrom{#1#2}%
  	 \doublespacing
     \small
     \advance\caption@parindent\hangindent
     \advance\caption@hangindent\hangindent
     \caption@@par#3\par}%
}

% Apply the new format to the algorithm environment
\captionsetup[algorithm]{format=algrule}

\makeatletter

\renewcommand{\algorithmname}{算法}
\renewcommand{\thealgorithm}{\arabic{chapter}-\arabic{algorithm}}
\captionsetup[algorithm]{aboveskip=6pt}
\AtBeginEnvironment{algorithm}{\vspace{6pt}}

\graphicspath{{./pic/}}

\RequirePackage[titles, subfigure]{tocloft}
\RequirePackage{subfigure}


\urlstyle{rm}
\raggedbottom

\renewcommand{\contentsname}{目\hspace{6pt}录}
\renewcommand{\bibname}{参考文献}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

\RequirePackage[a4paper, inner=3cm, outer=3cm, top=3cm,
bottom=3cm, bindingoffset=0cm]{geometry}
\setlength{\headheight}{15pt}

\pagestyle{fancy}
\linespread{1.391}
\setlength\parindent{24pt}
\titlespacing{\chapter}{0pt}{0pt}{18pt}
\titlespacing{\section}{0pt}{18pt}{6pt}
\titlespacing{\subsection}{0pt}{12pt}{6pt}
\titlespacing{\subsubsection}{0pt}{12pt}{6pt}

\renewcommand\thechapter{第\zhnumber{\arabic{chapter}}章}
\renewcommand\thesection{\arabic{chapter}.\arabic{section}}

\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}

\captionsetup{format=hang}
\captionsetup{width=\textwidth - 42pt}
\captionsetup[figure]{aboveskip=6pt,belowskip=0pt}
\captionsetup[table]{belowskip=6pt}
\setlength{\extrarowheight}{5pt}
\setlength{\subfigcapskip}{0pt}

\makeatletter
\AtBeginEnvironment{figure}{
  \def\@floatboxreset{\centering}
}
\makeatother

\makeatletter
\AtBeginEnvironment{table}{
    \def\@floatboxreset{\centering}
}
\makeatother
\AfterEndEnvironment{table}{\vspace{-6pt}}
\AtBeginEnvironment{tabular}{\small}

\makeatletter
\renewcommand{\p@subfigure}{\arabic{chapter}-\arabic{figure}}
\makeatother

\newcommand{\chinesecolon}{\char"FF1A}
\newcommand{\chinesespace}{\char"3000}

\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}

\titleformat{\chapter}
  {\centering\fontsize{15pt}{15pt}\selectfont\bfseries\thispagestyle{fancy}}{\thechapter}{7.5pt}{}

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
\addtolength{\footnotesep}{0pt}
\setlength{\footnotemargin}{13.5pt}

\renewcommand{\footnotesize}{\fontsize{9pt}{10.8pt}\selectfont}
\renewcommand{\small}{\fontsize{10.5pt}{12.6pt}\selectfont}
\renewcommand\footnotelayout{\fontsize{9}{11.7}\selectfont}

\renewcommand{\thefootnote}{\ifcase\value{footnote}\or\ding{172}\or
\ding{173}\or\ding{174}\or\ding{175}\or\ding{176}\or\ding{177}\or
\ding{178}\or\ding{179}\or\ding{180\or\ding{181}}\fi}

\renewcommand{\footnoterule}{\vfill\noindent\vspace{0.9mm}\hspace{27pt}\rule{5.05cm}{0.02cm}\vspace*{2.6pt}}

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
	\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
	\pagenumbering{Roman}
    \chapter*{摘\chinesespace 要}
    \thispagestyle{fancy}
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 摘要}
}{
	\clearpage{\pagestyle{empty}\cleardoublepage}
}

\newcommand{\chinesekeyword}[1]{
	\vspace{\baselineskip}
	\noindent
    \begin{minipage}[t]{48pt}
    	\noindent\CJKfakebold{关键词\chinesecolon}
    \end{minipage}
    \begin{minipage}[t]{\linewidth - 48pt}
    	#1
    \end{minipage}
}

\newenvironment{englishabstract}{
	\chapter*{ABSTRACT}
    \thispagestyle{fancy}
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont  ABSTRACT}
}{
    \clearpage{\pagestyle{empty}\cleardoublepage}
}

\newcommand{\englishkeyword}[1]{
	\vspace{\baselineskip}
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
	\fancyhead[CO]{\fontsize{10.5pt}{12.6pt}\selectfont\leftmark}
	\fancyhead[CE]{\fontsize{10.5pt}{12.6pt}\selectfont 电子科技大学\chinesedegreename{}学位论文}
	\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
}

\pretocmd{\tableofcontents}{
	\fancyhf{}
	\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 目录}
    \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
}{}{}

\apptocmd{\tableofcontents}{
    \clearpage{\pagestyle{empty}\cleardoublepage}
	\standardhead
	\pagenumbering{arabic}
	\setcounter{page}{1}
}{}{}

\newcommand{\thesistableofcontents}{
	\tableofcontents
}

\renewcommand{\chaptermark}[1]{\markboth{第\zhnumber{\arabic{chapter}}章 \hspace{5.25pt}#1}{}}

\newcommand{\thesisacknowledgement}{
    \renewcommand\thesection{\arabic{section}}
	\addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
    \setcounter{section}{0}
	\chapter*{致\hspace{12pt}谢}
    \addcontentsline{toc}{chapter}{致\hspace{12pt}谢}
    \markboth{致谢}{致谢}
    \thispagestyle{fancy}
}


\newcommand{\thesischapterexordium}{
	\chapter{绪\hspace{6pt}论}
    \markboth{绪论}{绪论}
}

\newcommand{\thesisappendix}{
	\chapter*{附\chinesespace 录}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{附录}
    \markboth{附录}{附录}
    \thispagestyle{fancy}
    \renewcommand{\theequation}{a-\arabic{equation}}
    \renewcommand{\thetable}{a-\arabic{table}}
    \renewcommand{\thefigure}{a-\arabic{figure}}
}

\newcommand{\thesistranslationoriginal}{
	\chapter*{外文资料原文}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{外文资料原文}
    \markboth{外文资料原文}{外文资料原文}
    \thispagestyle{fancy}
    \renewcommand{\theequation}{\arabic{equation}}
    \renewcommand{\thetable}{\arabic{table}}
    \renewcommand{\thefigure}{\arabic{figure}}
    \renewcommand{\figurename}{Figure}
	\renewcommand{\tablename}{Table}
}

\newcommand{\thesistranslationchinese}{
	\chapter*{外文资料译文}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{外文资料译文}
    \markboth{外文资料译文}{外文资料译文}
    \thispagestyle{fancy}
    \renewcommand{\theequation}{\arabic{equation}}
    \renewcommand{\thetable}{\arabic{table}}
    \renewcommand{\thefigure}{\arabic{figure}}
    \renewcommand{\figurename}{图}
	\renewcommand{\tablename}{表}
}

\makeatletter
\renewcommand{\@biblabel}[1]{[#1]\hfill}
\makeatother

\patchcmd\thebibliography
    {\labelsep}
    {\labelsep\itemsep=0pt\parsep=0pt\relax}
    {}
    {\typeout{Couldn't patch the command}}

\newenvironment{thesisbibliography}{
	\begin{thebibliography}{lo}
    \begin{spacing}{1.667}
    \thispagestyle{fancy}
    \small
}{
    \end{spacing}
    \end{thebibliography}
}

\newcommand{\thesisloadbibliography}[2][]{%
	\ifthenelse{
    	\equal{#1}{nocite}
    }{
    	\nocite{*}
    }{}
    \thispagestyle{fancy}
    \begin{spacing}{1.667}
	\bibliographystyle{thesis-uestc}
	\bibliography{#2.bib}
	\end{spacing}
}

\newcites{achievement}{攻读\chinesedegreename{}学位期间取得的成果}

\newenvironment{thesisachievement}{
	\renewcommand{\bibname}{攻读\chinesedegreename{}学位期间取得的成果}
    \begin{thebibliography}{lo}
    \begin{spacing}{1.667}
    \thispagestyle{fancy}
    \small
}{
    \end{spacing}\end{thebibliography}
    \renewcommand{\bibname}{参考文献}
}

\newcommand{\thesisloadachievement}[1]{%
    \nociteachievement{*}
	\renewcommand{\bibname}{攻读\chinesedegreename{}学位期间取得的成果}
    \thispagestyle{fancy}
    \begin{spacing}{1.667}
	\bibliographystyleachievement{thesis-uestc}
	\bibliographyachievement{#1}
	\end{spacing}
    \renewcommand{\bibname}{参考文献}
}



\newtheoremstyle{dotless}{0pt}{0pt}{\normalfont}{24pt}{\bfseries}{}{ }{}
\theoremstyle{dotless}
\newtheorem{theorem}{定理}
\newtheorem{axiom}[theorem]{公理}
\newtheorem{corollary}[theorem]{推论}
\newtheorem{lemma}[theorem]{引理}
\newtheorem{definition}[theorem]{定义}
\newtheorem{example}[theorem]{例子}


\renewcommand{\thetheorem}{\arabic{chapter}.\arabic{theorem}}
\renewcommand{\theaxiom}{\arabic{chapter}.\arabic{axiom}}
\renewcommand{\thecorollary}{\arabic{chapter}.\arabic{corollary}}
\renewcommand{\thelemma}{\arabic{chapter}.\arabic{lemma}}
\renewcommand{\thedefinition}{\arabic{chapter}.\arabic{definition}}
\renewcommand{\theexample}{\arabic{chapter}.\arabic{example}}
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
\setlist{noitemsep}

\defaultfontfeatures{Mapping=tex-text}
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt


\setallmainfonts{Times New Roman}
\setCJKmainfont[BoldFont=SimHei]{SimSun}

%
% If you want to use this template in online editing system like Overleaf
% or ShareLaTeX, upload the font files to the root folder of your project,
% delete above two lines and uncomment the configurations below. Remember
% to keep the names of font files the same as specified in the code.
%
% \setCJKmainfont[BoldFont=simhei.ttf]{simsun.ttc} % SimSun and SimHei
% \setallmainfonts[
%     BoldFont=timesbd.ttf,     % Times New Roman Bold
%     ItalicFont=timesi.ttf,     % Times New Roman Italic
%     BoldItalicFont=timesbi.ttf,     % Times New Roman Bold Italic
% ]{times.ttf}     % Times New Roman Normal Font
%


\endinput
