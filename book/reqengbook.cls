%https://sv.sharelatex.com/blog/2011/03/27/how-to-write-a-latex-class-file-and-design-your-own-cv.html

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{reqengbook}[2016/01/20 Document class reqengbook based on book]
\LoadClass[a4paper,10pt,oneside]{book}  %if onecolumn then flipflops even odd pages

\usepackage[landscape]{geometry} % to change margins:
\geometry{hmargin={4.5cm,4.5cm}}
\geometry{vmargin={1.5cm,1.5cm}}
\usepackage{marginnote} % allows the command: \marginnote{some text in marin}
\usepackage{float} % control placement of figures etc. provides the H float modifier option
% if you are inside a multicols environment you MUST use only H for a float to work

% \RequirePackage{fix-cm}%https://ftpmirror1.infania.net/mirror/CTAN/macros/latex/base/fix-cm.pdf
% \usepackage{type1cm}

\usepackage[utf8]{inputenc}
\usepackage[swedish,main=english]{babel}
\usepackage[T1]{fontenc}

%% FONT PACKAGES
%% https://www.overleaf.com/learn/latex/Font_typefaces
%% https://tex.stackexchange.com/questions/59403/what-font-packages-are-installed-in-tex-live

% Some good looking monospace fonts below: esp. noto is nice
%  - add sfdefault after [ to have san serif as default normal font
%\usepackage{lmodern} % if included before serif package, it goes for headings only
\usepackage{tgheros} % sans serif: clone of Helvetica
\usepackage{tgtermes} % serif: clone of Times
%\usepackage[zerostyle=d]{newtxtt}
\usepackage[scaled=0.87]{beramono} % monospace
%\usepackage[scaled=0.85]{noto-mono}
%\usepackage[scaled=0.85]{noto}
%\usepackage[scaled=0.85]{noto-sans}
%\usepackage[sfdefault,scaled=0.85]{noto}

%\usepackage[scaled=0.85]{FiraSans}
%\usepackage[sfdefault, scaled=0.85]{FiraSans}

%\usepackage{tgbonum} %serif font to TeX Gyre Bonum (clone of Bookman,*)
% \usepackage{fouriernc} % serif: New Century Schoolbook
% \usepackage{tgschola} % serif: New Century Schoolbook
% \usepackage{libertine} % serif: clone of Times
% \usepackage{avant}     % sans serif: Avant Garde

\usepackage{natbib} % for references
\usepackage{graphicx}

\usepackage{microtype} % Slightly tweak font spacing for aesthetics
\usepackage{changepage}   % for the adjustwidth environment to make narrow paragraphs
\usepackage{sectsty} %change font on headings
\allsectionsfont{\sffamily}

\usepackage{marvosym,dingbat,amssymb}

\usepackage{xcolor} % provides definecolor
\definecolor{mylinkcolor}{rgb}{0,0.1,0.5}
\definecolor{myslideheadcolor}{rgb}{0,0.0,0.6}

\definecolor{mygreen}{rgb}{0,0.4,0}
\definecolor{myemphcolor}{rgb}{0,0.4,0.1}
\definecolor{myalertcolor}{rgb}{0.4,0.1,0}
\definecolor{eclipsepurple}{rgb}{0.5,0,0.25}
\definecolor{eclipseblue}{rgb}{0.16,0,1.0}
\definecolor{eclipsegreen}{rgb}{0,0.5,0}

\usepackage{enumitem} %https://ftpmirror1.infania.net/mirror/CTAN/macros/latex/contrib/enumitem/enumitem.pdf
%SEMS TO CLASH WITH paralist
%https://tex.stackexchange.com/questions/18411/what-are-the-differences-between-using-paralist-vs-enumitem

% \usepackage{paralist} %https://ftpmirror1.infania.net/mirror/CTAN/macros/latex/contrib/paralist/paralist.pdf
% \setdefaultleftmargin{2em}{2em}{1em}{1em}{.5em}{.5em}
% \setdefaultitem{\textbullet}{--}{-}{-}

\usepackage[yyyymmdd]{datetime}
\renewcommand{\dateseparator}{-}

%\linespread{1.0} %% use 0.98 for tighter lines

\usepackage{lipsum} % to create dummy text with \lipsum

\usepackage{amsmath,scalerel} %http://tex.stackexchange.com/questions/125523/is-there-a-bigcdot-symbol-in-latex
\usepackage{marvosym} % icons https://ftp.acc.umu.se/mirror/CTAN/fonts/marvosym/doc/fonts/marvosym/marvodoc.pdf

%\usepackage[linesnumbered,lined,boxed]{algorithm2e} % for writing pseudo-code

\usepackage{array}
\usepackage{longtable}
\usepackage{booktabs}

\usepackage[noindentafter]{titlesec}

\titleformat%
{\chapter} % command
[hang] % shape: hang = no new line, display = new line after number
{\bfseries\sffamily\huge} % format
{\thechapter.~} % label
{0.0ex} % sep
{} % before-code
[\vspace{-0.5em}\rule{\columnwidth}{0.5pt}\vspace{0.5em}]% after-code

\titlespacing*{\chapter}{0.0em}{-1.0em}{0.0em}


\usepackage{titletoc}
\setcounter{secnumdepth}{2} % of 2 then no numbers in table of contents on subsubsections


% \usepackage{fancyhdr}
% \fancyhf{} % clear existing header/footer entries
% \pagestyle{fancy}
% \fancyfoot{Page \thepage \hspace{1pt} of \pageref{LastPage}}
\renewcommand{\chaptername}{Chapter~}

 %%increase space due to wide numbers in table of contents: https://stackoverflow.com/questions/33093493/adding-space-after-section-numbers-in-toc
\makeatletter
\renewcommand{\l@section}{\@dottedtocline{1}{1.5em}{2.1em}}
\renewcommand{\l@subsection}{\@dottedtocline{2}{2.5em}{3.1em}}
\renewcommand{\l@subsubsection}{\@dottedtocline{3}{3.4em}{4.1em}}
\makeatother


\usepackage[normalem]{ulem}  % for strikethrough: \sout{Hello World}

\usepackage{hyphenat} % for controloing hyphenation
  \hyphenation{sekvens-algoritmer}

\usepackage[colaction]{multicol} 
\setlength{\columnsep}{7.5mm}  % for multocolumn parts

\usepackage{wrapfig}  %% allow use floating figures inside multicol  
% https://www.overleaf.com/learn/latex/Multiple_columns

\usepackage{listings}  % for typesetting code

%\usepackage{upquote} %http://tex.stackexchange.com/questions/145416/how-to-have-straight-single-quotes-in-lstlistings

\usepackage{xspace} %http://www.math.tamu.edu/~harold.boas/courses/math696/why-macros.html

\usepackage{xr} %to allow xref btw docs %https://tex.stackexchange.com/questions/248491/cross-reference-with-xr-fails-sharelatex

  %http://tex.stackexchange.com/questions/50747/options-for-appearance-of-links-in-hyperref
\usepackage[pdfpagelayout=TwoPageRight]{hyperref} 
  \hypersetup{colorlinks=true, allcolors=mylinkcolor,
    %linkcolor=, linkbordercolor=, urlbordercolor=mylinkcolor,
    urlcolor=mylinkcolor, pdfborderstyle={/S/U/W 1}
  }

\usepackage{pdfpages} % To include multipage pdf documents

\usepackage[labelfont=bf]{caption}  % to get bold faced table and figure captions
% % %https://tex.stackexchange.com/questions/55337/how-to-use-figure-inside-a-minipage


\usepackage{tikz}
\usetikzlibrary{shapes.geometric, shapes.symbols, arrows, matrix, shapes, positioning, calc}
%https://www.sharelatex.com/blog/2013/08/29/tikz-series-pt3.html
\usepackage{tkz-euclide}
%\usetkzobj{all}
%https://tex.stackexchange.com/questions/96459/automatically-draw-and-labels-angles-of-a-triangle-in-tikz
% https://tex.stackexchange.com/questions/165877/latex-complains-that-tkzdrawarc-is-not-defined

\tikzstyle{startstop} = [rectangle, rounded corners, minimum width=3cm, minimum height=1cm,text centered, draw=black, fill=red!30]
\tikzstyle{io} = [trapezium, trapezium left angle=70, trapezium right angle=110, minimum width=1cm, minimum height=1cm, text=white, text centered, draw=black, fill=blue!50!violet]
\tikzstyle{process} = [rectangle, minimum width=3cm, minimum height=1cm, text=white, text centered, draw=black, fill=red!50!black]
\tikzstyle{decision} = [diamond, minimum width=3cm, minimum height=1cm, text centered, draw=black, fill=green!30]
\tikzstyle{arrow} = [thick,->,>=stealth]
%UML definitions
\tikzstyle{umlclass}=[rectangle, draw=black,  thick, anchor=north, text width=3cm, rectangle split, rectangle split parts = 3]
\tikzstyle{umlarrow}=[->, >=open triangle 90, thick]


%\usepackage{framed}  %  allows:   \begin{framed}\end{framed}
%https://ctan.math.illinois.edu/macros/latex/contrib/framed/framed.pdf
\usepackage[framemethod=TikZ]{mdframed} %  allows:   \begin{mdframed}[backgroundcolor=blue!20]\end{mdframed}

% \usepackage[defaultsans,scaled=0.85]{droidsans}
% \renewcommand*\familydefault{\sfdefault}

%\usepackage{setspace} // to use \begin{spacing}{0.8}  etc
\usepackage{amsmath,scalerel} %http://tex.stackexchange.com/questions/125523/is-there-a-bigcdot-symbol-in-latex

\newenvironment{Slide}[1]{%
\begin{mdframed}[backgroundcolor=blue!8,innertopmargin=1em,innerbottommargin=1em,]\relax
  \renewcommand{\labelitemi}{\color{myslideheadcolor}{$\bullet$}}
  \renewcommand{\labelitemii}{\color{myslideheadcolor}{$\scalerel*{\cdot}{\bigodot}$}}
  \renewcommand{\labelitemiii}{\color{myslideheadcolor}{$\circ$}}
  %\renewcommand{\labelitemiii}{\color{myslideheadcolor}{$\cdot$}}
  \fontfamily{qhv}%qhv phv lmss cmss
  \fontsize{9}{11}\selectfont  
  \textcolor{myslideheadcolor}{\textbf{#1}}
  %\setlength{\parskip}{0.0em}
  %\setlength{\itemsep}{0.0em}
  %\setlist{nosep} %this is from enumitem package but clashes with paralist
  %https://tex.stackexchange.com/questions/58050/how-can-i-modify-the-settings-of-the-margin-item-in-a-list
  \setlist{topsep=0em,itemsep=0em,partopsep=0pt}
  \setlength{\leftmargini}{1em}
  \setlength{\leftmarginii}{1em}
  \setlength{\leftmarginiii}{1em}
  \begin{flushleft}
  }{%
\end{flushleft}%
\end{mdframed}
}


\newcommand{\MarginPage}[1]{%
\begin{tikzpicture}[remember picture, overlay, anchor = north] %% remember picture allows referring to nodes outside
\node[align=left,yshift=-5mm,xshift=1.4mm] at (0.53\paperwidth, 0.12\pdfpageheight) { %  add draw, before align to get frame
\begin{minipage}{100mm}
#1
\end{minipage}%
};
\end{tikzpicture}%
}
%% TODO: Make \MarginPage work using twopage document instead of onepage (see top of file)
%% Perhaps below can be used to place the \MarginPage differently ???
% \usepackage{etoolbox}%https://tex.stackexchange.com/questions/6143/if-then-else-for-odd-page-even-page
% \newcommand{\TestOddEven}{\ifnumodd{\thepage}{THIS IS ODD \thepage}{THIS IS EVEN \thepage}} 

\newcommand{\TODO}{\colorbox{red!20}{TODO!!!}~}  

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

\definecolor{entityColor}{RGB}{0,100,200}%{0,100,200}%{160,0,30}%
\definecolor{attributeColor}{RGB}{0,100,50}%{0,100,50}
\definecolor{relationColor}{RGB}{125,0,25}%{160,0,30}%{0,100,200}%

\lstdefinelanguage{reqt}{
  %belowcaptionskip=1\baselineskip,
  breaklines=true,
  %showstringspaces=false,
  showspaces=false,
  %breakatwhitespace=true,
  basicstyle=\footnotesize\fontfamily{qtm}\selectfont,
  %basicstyle=\footnotesize\ttfamily,
  emph={Barrier,Breakpoint,Class,Component,Configuration,Data,Design,Domain,Epic,Event,Feature,Field,Function,Goal,Idea,Image,Interface,Issue,Label,Member,Module,Product,Prototype,Quality,Relationship,Release,Req,Resource,Risk,Screen,Section,Stakeholder,State,Story,System,Target,Task,Term,Test,UseCase,User,Variant,VariationPoint},
  emphstyle=\ttfamily\bfseries\color{entityColor},
  emph={[2]binds,deprecates,excludes,has,helps,hurts,impacts,implements,inherits,interacts,precedes,relates,requires,verifies},
  emphstyle={[2]\ttfamily\itshape\color{relationColor}},
  emph={[3]Benefit,Capacity,Comment,Constraints,Cost,Damage,Deprecated,Example,Expectation,Failure,Frequency,Gist,Input,Location,Max,Min,Order,Output,Prio,Probability,Profit,Spec,Text,Title,Value,Why},
  emphstyle={[3]\ttfamily\color{attributeColor}},  
  %morekeywords={},
  %otherkeywords={*},
  %keywordstyle=\bfseries\ttfamily\selectfont,%\color{blue},
}


\lstset{
    tabsize=2,
    basicstyle=\ttfamily\selectfont,
    keywordstyle=\bfseries,%\color{blue},
    commentstyle=\color{mygreen},
    numberstyle={\footnotesize},
    numbers=none,
    backgroundcolor=\color{gray!10},
    frame=single,
    rulecolor=\color{black!50},
    %title={\footnotesize\lstname},
    breaklines=true,
    breakatwhitespace=false,
    framextopmargin=2pt,
    framexbottommargin=2pt,
    showstringspaces=false,
    columns=fullflexible%,keepspaces,
    %postbreak=\mbox{\space\space\space},
}

\lstset{literate=%
  {Å}{{\AA}}1
  {Ä}{{\"A}}1
  {Ö}{{\"O}}1
  {Ü}{{\"U}}1
  {ß}{{\ss}}1
  {ü}{{\"u}}1
  {å}{{\aa}}1
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

\usepackage{hanging} 
% https://ftp.acc.umu.se/mirror/CTAN/macros/latex/contrib/hanging/hanging.pdf
%https://tex.stackexchange.com/questions/509106/how-to-indent-and-hanging-indent
\newcommand{\SwedishTermsStart}{\textbf{In Swedish}:\par}
\newcommand{\SwedishTerm}[2]{\hangpara{1em}{1}{\textit{#1}~#2}\par}

%% kill slide stuff
\newcommand{\LectureOnly}[1]{}