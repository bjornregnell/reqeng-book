object latex:
  val texEncoding = "%!TEX encoding = UTF-8 Unicode"

  def slidePreamble(title: String, authors: String = "Björn Regnell et al.") = 
    s"""|$texEncoding
        |\\documentclass{reqenglecture}
        |
        |\\author{$authors\\\\ \\vspace{1em}{\\small 
        |  \\url{https://cs.lth.se/bjorn-regnell}}}
        |
        |\\title{Introduction to Software\\\\Requirements Engineering $title}
        |
        |\\date{\\footnotesize Updated: \\today \\\\CC-BY-SA}
        |
        |%\\beamerdefaultoverlayspecification{<+->} %de-comment if you want pause after items
        |
        |\\begin{document}
        |\\maketitle
        |""".stripMargin

  val endDocument = "\\end{document}"