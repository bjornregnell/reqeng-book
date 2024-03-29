%https://sv.sharelatex.com/blog/2011/03/27/how-to-write-a-latex-class-file-and-design-your-own-cv.html
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{reqenglecture}[2023/10/14 Document class simpleslides based on beamer]
%\LoadClass[handout]{beamer} %without pauses
\LoadClass[aspectratio=43]{beamer}
\setbeamersize{text margin left=12mm, text margin right=10mm}

\beamertemplatenavigationsymbolsempty
%https://tex.stackexchange.com/questions/432054/missing-frame-numbers-with-paloalto-theme
%\setbeamertemplate{footline}[frame number]  % fix for ubuntu 18.04 see link above
%\usetheme{Antibes}

%\setbeamercolor{page number in head/foot}{fg=gray} 
%instead of above: place and color the framenumber manually
\setbeamertemplate{footline}
{%
\begin{beamercolorbox}{section in head/foot}
  %\vskip2pt\insertnavigation{\paperwidth}\vskip2pt
  \color{gray}{\vskip2pt\insertnavigation{0.2\paperwidth}%
  \hfill~\insertframenumber~/~\inserttotalframenumber\hspace*{3mm}\vskip3mm}
\end{beamercolorbox}%
}

\usepackage[utf8]{inputenc}
\usepackage[swedish,main=english]{babel}
\usepackage[T1]{fontenc}
%\usepackage[scaled=0.85]{noto}
\usepackage{lmodern} % if included before serif package, it goes for headings only
\usepackage[scaled=0.85]{beramono}
%\usepackage[scale=1.0]{tgheros}

\usepackage{fancyvrb}
\usepackage{xcolor}
\definecolor{mygreen}{rgb}{0,0.4,0}
\definecolor{mylinkcolor}{rgb}{0,0.1,0.5}
\definecolor{myemphcolor}{rgb}{0,0.4,0.1}
\definecolor{myalertcolor}{rgb}{0.4,0.1,0}
\definecolor{eclipsepurple}{rgb}{0.5,0,0.25}
\definecolor{eclipseblue}{rgb}{0.16,0,1.0}
\definecolor{eclipsegreen}{rgb}{0,0.5,0}

\usepackage[yyyymmdd]{datetime}
\renewcommand{\dateseparator}{-}

\setbeamerfont{title}{size=\small,series=\bfseries}
\setbeamerfont{subtitle}{size=\Large}
\setbeamerfont{frametitle}{size=\Large,series=\bfseries}
\setbeamerfont{author}{size=\large}
\setbeamerfont{date}{size=\small}


%\setbeamertemplate{items}[circle]
\setbeamertemplate{items}[square]
%\setbeamertemplate{itemize subitem}[circle]%{$\rightarrow$}
%\setbeamertemplate{itemize subitem}[square]%{$\rightarrow$}
\setbeamertemplate{itemize subitem}{--}
\setbeamertemplate{itemize subsubitem}{-}

\usepackage{amsmath,scalerel} %http://tex.stackexchange.com/questions/125523/is-there-a-bigcdot-symbol-in-latex
\usepackage{marvosym} % icons https://ftp.acc.umu.se/mirror/CTAN/fonts/marvosym/doc/fonts/marvosym/marvodoc.pdf

\usepackage{listings}


\newcommand{\TODO}{\colorbox{red!70}{TODO!!!}~}  

\newcommand{\code}{\lstinline[basicstyle=\ttfamily]}


\lstdefinelanguage{scala}{
  morekeywords={abstract,case,catch,class,def,%
    do,else,enum,export,extends,false,final,finally,%
    for,given,if,implicit,import,lazy,match,%
    new,null,object,override,package,%
    private,protected,return,sealed,%
    super,then,throw,trait,true,try,%
    type,val,var,while,with,yield,%
    as, derives, end, extension, infix, inline, opaque, open, transparent, using}, % soft keywords
  otherkeywords={=>,<-,<:,>:,@,=>>,?=>},
  sensitive=true,
  morecomment=[l]{//},
  morecomment=[n]{/*}{*/},
  morestring=[b]",
  morestring=[b]',
  morestring=[b]"""
}

\lstset{
    language=scala,
    tabsize=2,
    basicstyle=\ttfamily,
    keywordstyle=\bfseries\color{eclipsepurple},
    commentstyle=\color{mygreen},
    numberstyle={\footnotesize},
    numbers=none,
    %backgroundcolor=\color{gray!15},
    frame=none, %single,
    rulecolor=\color{black!25},
    %title={\footnotesize\lstname},
    breaklines=false,
    breakatwhitespace=false,
    framextopmargin=2pt,
    framexbottommargin=2pt,
    showstringspaces=false,
    columns=fullflexible,keepspaces
}

\lstset{literate=%
{Å}{{\AA}}1
{Ä}{{\"A}}1
{Ö}{{\"O}}1
{Ü}{{\"U}}1
{ß}{{\ss}}1
{ü}{{\"u}}1
{å}{{\aa}}1
{ä}{{\"a}}1
{ö}{{\"o}}1
{æ}{{\ae}}1
{ø}{{\o}}1
{Æ}{{\AE}}1
{Ø}{{\O}}1
{`}{{\`{}}}1
{─}{{\textemdash}}1
{└}{{|}}1
{├}{{|}}1
{│}{{|}}1
{♠}{{$\spadesuit$}}1
{♥}{{$\heartsuit$}}1
{♣}{{$\clubsuit$}}1
{♦}{{$\diamondsuit$}}1
}

\lstnewenvironment{Code}[1][]{%
    \lstset{#1}%
}{}  

\newenvironment{Slide}[2][]
  {\begin{frame}[fragile,environment=Slide,#1]{#2}}
  {\end{frame}}

 %% slide-specific stuff
\newcommand{\LectureOnly}[1]{#1}