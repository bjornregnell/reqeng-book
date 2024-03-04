object latex:
  def slidePreamble(title: String) = 
    s"""|%!TEX encoding = UTF-8 Unicode
        |\\documentclass{simpleslides}
        |
        |\\author{Björn Regnell \\\\ \\vspace{1em}{\\small 
        |  \\url{https://cs.lth.se/bjorn-regnell}}}
        |
        |\\title{Introduction to Software\\\\Requirements Engineering $title}
        |
        |\\date{\\footnotesize Updated: \\today}
        |
        |%\\beamerdefaultoverlayspecification{<+->} %de-comment if you want pause after items
        |
        |\\begin{document}
        |\\maketitle
        |""".stripMargin
  val slideEnd = "\\end{document}"