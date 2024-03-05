object latex:
  val texEncoding = "%!TEX encoding = UTF-8 Unicode"

  def slidePreamble(
    lectureTitle: String, 
    authors: String = "Björn Regnell", 
    bookTitle: String = "Introduction to Software Requirements Engineering"
  ) = 
    s"""|$texEncoding
        |\\documentclass{reqenglecture}
        |
        |\\title{$bookTitle}
        |
        |\\subtitle{$lectureTitle}
        |
        |\\author{$authors}
        |
        |\\date{\\vspace{1em}\\footnotesize Updated: \\today~
        |\\\\ License: CC-BY-SA 
        |\\\\ \\url{https://github.com/bjornregnell/reqeng-book} 
        |}
        |
        |%\\beamerdefaultoverlayspecification{<+->} %de-comment if you want pause after items
        |
        |\\begin{document}
        |\\maketitle
        |
        |\\begin{frame}
        |\\frametitle{$lectureTitle}
        |\\framesubtitle{Outline}
        |\\tableofcontents
        |\\end{frame}
        |""".stripMargin

  val endDocument = "\\end{document}"