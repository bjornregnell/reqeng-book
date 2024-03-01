

class MarkdownToTex(
  val bold: String = "textbf", 
  val italics: String = "textit",
):
  val matchers = Seq(
    "\\*\\*(.+?)\\*\\*(?!\\*)".r -> s"\\\\$bold{$$1}",
    "\\*([^*><]+)\\*".r          -> s"\\\\$italics{$$1}", 
  )
  def toTex(text: String): String =
    var result = text
    for (expr, replace) <- matchers do result = expr.replaceAllIn(result, replace)
    result
object MarkdownToTex:
  given default: MarkdownToTex = MarkdownToTex()
end MarkdownToTex


case class Slide(settings: Map[String, String], body: Seq[String]):
  def title: String = body.find(_.trim.startsWith("# ")).getOrElse("").stripPrefix("# ")

  def bodyNoHeadings: Seq[String] = body.filterNot(_.trim.startsWith("# "))
  
  def texBody(using md: MarkdownToTex): Seq[String] = 
    bodyNoHeadings.map(line => md.toTex(line)).dropWhile(_.trim.isEmpty)

  def toTex(using md: MarkdownToTex): Seq[String] = 
    s"\\begin{Slide}{$title}\n" +: texBody :+ "\\end{Slide}"

end Slide

def parseLinesOfSlides(lines: Iterator[String]): Seq[Slide] = 
  val result = Seq.empty[Slide].toBuffer
  if lines.isEmpty then Seq()
  else 
    val first = lines.next()
    assert(first.trim == "---", s"first line is not settings preamble, should start with ---\n$first" )
    val lineBuffer = Seq.empty[String].toBuffer
    val settingsBuffer = Seq.empty[(String, String)].toBuffer
    while lines.hasNext do 
      var line = lines.next()
      while lines.hasNext && line.trim != "---" do
        val pair = line.trim.split(":").map(_.trim)
        assert(pair.length == 2, "setting must be of the form 'setting:value'")
        settingsBuffer.append(pair(0) -> pair(1))
        line = lines.next()
      end while
      if lines.hasNext then line = lines.next() else ()
      var indentLevel = Seq(-1)
      var addedItemize = 0
      while lines.hasNext && line.trim != "---" do // inside slide body
        println(s"debug: $line")
        if line.isBlank() then lineBuffer.append(line)
        else // non-blank line
          val leadingNbrSpaces = line.takeWhile(_ == ' ').length
          if line.trim.startsWith("* ") then
            println(s"debug bullet: leadingNbrSpaces = $leadingNbrSpaces")
            if leadingNbrSpaces > indentLevel.last then 
              lineBuffer.append("\\begin{itemize}")
              addedItemize += 1
              indentLevel :+= leadingNbrSpaces
            else if leadingNbrSpaces < indentLevel.last then 
              println(s"DEBUG: Appending ONLY ONE end{itemize}")
              lineBuffer.append("\\end{itemize}") 
              addedItemize -= 1
              if indentLevel.length > 1 then indentLevel = indentLevel.drop(1)
            end if

            lineBuffer.append("\\item " + line.stripLeading.stripPrefix("* "))
          else // no bullet at start of line 
            if leadingNbrSpaces == 0 then 
              while addedItemize > 0 do
                println(s"DEBUG: Appending end{itemize}")
                lineBuffer.append("\\end{itemize}") 
                addedItemize -= 1
                if indentLevel.length > 1 then indentLevel = indentLevel.drop(1)
              end while
            end if
            lineBuffer.append(line)
          end if
        line = lines.next()
        if  !lines.hasNext || line.trim == "---" then 
          while addedItemize > 0 do
            println(s"DEBUG: Appending end{itemize}")
            lineBuffer.append("\\end{itemize}") 
            addedItemize -= 1
            if indentLevel.length > 1 then indentLevel = indentLevel.drop(1)
          end while
        end if
        println(s"debug: lines.hasNext = ${lines.hasNext} indentLevel=$indentLevel")
      result.append(Slide(settingsBuffer.toMap, lineBuffer.toSeq))
      settingsBuffer.clear()
      lineBuffer.clear()
    end while
  end if
  result.toSeq
end parseLinesOfSlides

val test = "basdklflökajsf **bold text 123, 25** asd,msndf jasdf  *ital text* askdjhkl *hej*"

val bfit = new MarkdownToTex()

val slideFiles = os.list(os.pwd/"slides")

val outDir = os.pwd / "tex" / "generated"

@main def run = 
  println(s"\n  Processing slide files: ${slideFiles.mkString("\n   ", "\n   ", "\n")}")
  for f <- slideFiles do
    println(s"processing: $f")
    val lit = os.read(f).linesIterator 
    val slides = parseLinesOfSlides(lit)
    println(s"  number of Slides found: ${slides.length}")
    println(s"  *** deleting all existing -slide.tex in\n    $outDir")
    os.walk(outDir).foreach(f => f.lastOpt.foreach(s => if s.endsWith("-slide.tex") then os.remove(f)))
    for slide <- slides do
      val t = slide.settings("file") + "-slide.tex" 
      println(s"  writing: ${(outDir/t).lastOpt.getOrElse("")}")
      os.write.over(outDir/t, slide.toTex.mkString("\n"))