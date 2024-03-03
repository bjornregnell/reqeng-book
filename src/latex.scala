object latex:
  val slidePreamble = 
    s"""|%!TEX encoding = UTF-8 Unicode
        |\\documentclass{simpleslides}
        |
        |\\author{Björn Regnell \\\\ \\vspace{1em}{\\small 
        |  \\url{https://cs.lth.se/bjorn-regnell}}}
        |
        |\\title{Introduction to Software\\\\Requirements Engineering}
        |
        |\\date{\\footnotesize Updated: \\today}
        |\\begin{document}
        |\\maketitle
        |""".stripMargin
  val slideEnd = "\\end{document}"