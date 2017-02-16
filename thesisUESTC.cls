\ProvidesClass{thesisUESTC}

\LoadClass[12pt, openany, twoside]{book}

\RequirePackage[cm-default]{fontspec}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage[font=small, labelsep=space]{caption}
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


\graphicspath{{./pic/}}

\RequirePackage[titles, subfigure]{tocloft}
\RequirePackage{subfigure}

\renewcommand{\contentsname}{目\chinesespace 录}%
\renewcommand{\proofname}{证明}%
\renewcommand{\bibname}{参考文献}%
\renewcommand{\figurename}{图}%
\renewcommand{\tablename}{表}%

\RequirePackage[a4paper, inner=3cm, outer=3cm, top=3cm,
bottom=3cm, bindingoffset=0cm]{geometry}

\pagestyle{fancy}
\linespread{1.391}
\setlength\parindent{24pt}
\titlespacing{\chapter}{0pt}{0pt}{0.7cm}
\titlespacing{\section}{0pt}{16pt}{6pt}
\titlespacing{\subsection}{0pt}{12pt}{6pt}
\titlespacing{\subsubsection}{0pt}{12pt}{6pt}


\renewcommand\thechapter{第\CJKnumber{\arabic{chapter}}章}
\renewcommand\thesection{\arabic{chapter}.\arabic{section}}

\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}

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
\renewcommand{\small}{\fontsize{10.5pt}{12.3pt}\selectfont}
\renewcommand\footnotelayout{\fontsize{9}{12}\selectfont}

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
\tocloftpagestyle{fancy}
\AddEverypageHook{\addtocontents{toc}{
	\protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand\cftchapleader{\cftdotfill{\cftdotsep}}

\renewcommand{\cftdotsep}{0.8}

\setlength{\cftbeforetoctitleskip}{0pt}
\setlength{\cftaftertoctitleskip}{18pt}
\setlength{\cftbeforechapskip}{0pt}

\addtolength{\cftchapnumwidth}{25pt}
\addtolength{\cftsecnumwidth}{-5pt}
\addtolength{\cftsubsecnumwidth}{-5pt}
\addtolength{\cftsubsubsecnumwidth}{-5pt}

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
    \begin{spacing}{1.5}
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
  \setlength{\itemsep}{3pt}
}
\makeatletter
\renewcommand{\@biblabel}[1]{[#1]\hfill}
\makeatother

\newenvironment{thesisbibliography}{
    \setcounter{section}{0}
	\begin{thebibliography}{lo}
    \begin{spacing}{1.5}
    \addcontentsline{toc}{chapter}{参考文献}
    \thispagestyle{fancy}
    \small
}{
    \end{spacing}
    \end{thebibliography}
}

\newtheoremstyle{dotless}{}{}{\normalfont}{24pt}{\bfseries}{}{ }{}
\theoremstyle{dotless}
\newtheorem{theorem}{定理}
\newtheorem{corollary}{推论}[theorem]
\newtheorem{lemma}[theorem]{引理}

\renewcommand{\thetheorem}{\arabic{chapter}.\arabic{theorem}}
\renewcommand{\thecorollary}{\arabic{chapter}.\arabic{corollary}}
\renewcommand{\thelemma}{\arabic{chapter}.\arabic{lemma}}
\renewcommand{\qedsymbol}{$\blacksquare$}

\makeatletter
\renewenvironment{proof}[1][\proofname]{\par
  \vspace{-\topsep}% remove the space after the theorem
  \pushQED{\qed}%
  \normalfont
  \topsep0pt \partopsep0pt % no space before
  \trivlist
  \item[\hskip5\labelsep
        \bfseries
    #1\@addpunct{\chinesecolon}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
  \addvspace{6pt plus 6pt} % some space after
}
\makeatother

\newcommand{\citing}[1]{\textsuperscript{\cite{#1}}}
\renewcommand\arraystretch{1.6}


\defaultfontfeatures{Mapping=tex-text}
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

\setCJKmainfont[BoldFont=simhei.ttf]{simsun.ttf}
\setmainfont[
	BoldFont=timesbd.ttf,
	ItalicFont=timesi.ttf,
	BoldItalicFont=timesbi.ttf,
]{times.ttf}


\endinput