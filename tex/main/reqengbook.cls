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

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

%% FONT PACKAGES
%% https://www.overleaf.com/learn/latex/Font_typefaces
%% https://tex.stackexchange.com/questions/59403/what-font-packages-are-installed-in-tex-live

% Some good looking monospace fonts below: esp. noto is nice
%  - add sfdefault after [ to have san serif as default normal font
%\usepackage[scaled=0.85]{beramono} % monospace
%\usepackage[scaled=0.85]{noto}
\usepackage[scaled=0.85]{noto-mono}
%\usepackage[scaled=0.85]{noto-sans}
%\usepackage[sfdefault,scaled=0.85]{noto}

\usepackage{lmodern} % if included before serif package, it goes for headings only
\usepackage{tgtermes} % serif: clone of Times
%\usepackage{tgheros} % sans serif: clone of Helvetica
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

% \definecolor{mygreen}{rgb}{0,0.4,0}
% \definecolor{myemphcolor}{rgb}{0,0.4,0.1}
% \definecolor{myalertcolor}{rgb}{0.4,0.1,0}
% \definecolor{eclipsepurple}{rgb}{0.5,0,0.25}
% \definecolor{eclipseblue}{rgb}{0.16,0,1.0}
% \definecolor{eclipsegreen}{rgb}{0,0.5,0}

\usepackage{enumitem}

%\linespread{1.0} %% use 0.98 for tighter lines

\usepackage{lipsum} % to create dummy text with \lipsum

\usepackage{amsmath,scalerel} %http://tex.stackexchange.com/questions/125523/is-there-a-bigcdot-symbol-in-latex

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

\usepackage{upquote} %http://tex.stackexchange.com/questions/145416/how-to-have-straight-single-quotes-in-lstlistings

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
\usetkzobj{all}
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

\newenvironment{Slide}[1]{%
% Code for box design goes here.
\begin{mdframed}[backgroundcolor=blue!10]\relax
  \fontfamily{lmss}\fontsize{9}{11}\selectfont  %qhv phv lmss cmss
  \textcolor{myslideheadcolor}{\textbf{#1}}
  \begin{flushleft}
  }{%
\end{flushleft}
\end{mdframed}
}


\newcommand{\MarginPage}[1]{%
\begin{tikzpicture}[remember picture, overlay, anchor = north] %% remember picture allows referring to nodes outside
\node[align=left,yshift=-5mm,xshift=5mm] at (0.53\paperwidth, 0.12\pdfpageheight) { %  add draw, before align to get frame
\begin{minipage}{90mm}
#1
\end{minipage}%
};
\end{tikzpicture}%
}

\newcommand{\code}{\lstinline[basicstyle=\ttfamily]}


\newcommand{\TODO}{\colorbox{red!70}{TODO!!!}~}  
