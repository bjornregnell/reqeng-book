%https://sv.sharelatex.com/blog/2011/03/27/how-to-write-a-latex-class-file-and-design-your-own-cv.html
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simpleslides}[2023/10/14 Document class simpleslides based on beamer]
%\LoadClass[handout]{beamer} %without pauses
\LoadClass{beamer}
\beamertemplatenavigationsymbolsempty
\setbeamertemplate{footline}[frame number] 
\setbeamercolor{page number in head/foot}{fg=gray} 
\usepackage[swedish]{babel}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[scaled=0.95]{beramono}
%\usepackage[scaled=0.85]{noto}
\usepackage[scale=1.0]{tgheros}
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

\setbeamerfont{title}{size=\Large,family=\textrm,series=\bfseries}
\setbeamerfont{frametitle}{size=\Large,series=\bfseries}
\setbeamerfont{subtitle}{size=\fontsize{14pt}{14pt}}
\setbeamerfont{author}{size=\fontsize{14pt}{14pt}}
\setbeamerfont{date}{size=\fontsize{10pt}{10pt}}


\setbeamertemplate{items}[circle]
%\setbeamertemplate{items}[square]

\usepackage{listings}

%%% lingstings specifics:

\lstdefinelanguage{Scala}{
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
    language=Scala,
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

\lstnewenvironment{Scala}[1][]{%
    \lstset{#1}%
}{}  
