import os.write.append


class MarkdownToTex(
  val bold: String = "textbf", 
  val italics: String = "textit",
  val code: String = "code"
):
  val matchers = Seq(
    "\\*\\*(.+?)\\*\\*(?!\\*)".r -> s"\\\\$bold{$$1}",
    "\\*([^*><]+)\\*".r          -> s"\\\\$italics{$$1}", 
    "\\`([^*><]+)\\`".r          -> s"\\\\$code{$$1}", 
  )
  def toTex(text: String): String =
    var result = text
    for (expr, replace) <- matchers do result = expr.replaceAllIn(result, replace)
    result
object MarkdownToTex:
  given default: MarkdownToTex = MarkdownToTex()
end MarkdownToTex

val initSettings = Map(
  "file" -> "unknown-file",
  "main" -> "unknown-main",
)

inline val dbg = true
inline def debug(inline s: String): Unit = 
  inline if dbg then println(s" *** DEBUG $s")

val settingStart = ">"
val settingDelim = "="
val titleStart = "# "
val fileStart = "> file"
val bulletStart = "* "


extension (s: String) 
  def nbrLeading(c: Char): Int =
    var i = 0
    while i < s.length && s(i) == c do i += 1
    i
  def isEmptyOrSpaceOnly: Boolean = s.stripLeading.length == 0

case class Chunk(settings: Map[String, String], body: Seq[String]):
  def parseTitle(pos: Int, result: collection.mutable.ArrayBuffer[String]): Int =
    //debug(s"parseTitle, pos=$pos")
    val title = body(pos).stripPrefix(titleStart)
    result.append(s"\\begin{Slide}{$title}")
    val next = parseTitleBody(pos + 1, result)
    result.append(s"\\end{Slide}")
    next

  def parseTitleBody(pos: Int, result: collection.mutable.ArrayBuffer[String]): Int =
    //debug(s"parseTitleBody, pos=$pos")
    var current = pos

    def isNextTitleEnd(i: Int): Boolean =
      if i + 1 < body.length then 
        body(i + 1).startsWith(titleStart) || body(i + 1).startsWith(fileStart) 
      else true 

    while current < body.length && !isNextTitleEnd(current) do
      val line = body(current) 
      if line.stripLeading.startsWith(bulletStart) then 
        current = parseItemize(current, result)
      else
        appendLine("", line, result)
        current += 1 
    end while
    current

  def parseItemize(pos: Int, result: collection.mutable.ArrayBuffer[String]): Int = 
    //debug(s"parseItemize: pos=$pos")
    result.append(s"\\begin{itemize}")
    val next = parseItems(pos, result)
    result.append(s"\\end{itemize}")
    next

  def eatEmptyLines(pos: Int, result: collection.mutable.ArrayBuffer[String]): Int =
    //debug("called eatEmptyLines")
    var current = pos 
    while current < body.length && body(current).isEmptyOrSpaceOnly do 
      //debug(s"eating empty line: ${body(current)}")
      appendLine("", body(current), result)
      current += 1
    current

  def parseItems(pos: Int, result: collection.mutable.ArrayBuffer[String]): Int =
    var current = pos
    var line = body(current)
    
    val indent = line.nbrLeading(' ')
    //debug(s"parseItems current=$current indent=$indent line=$line")
    
    def appendItem(s: String): Unit =
      appendLine("\\item ", s.stripLeading().stripPrefix(bulletStart), result)
    
    appendItem(line)
    current += 1

    var continue = true

    while current < body.length && continue do
      line = body(current)
      if line.isEmptyOrSpaceOnly then
        //debug("found empty line")
        appendLine("", line, result)
        current += 1
      else if line.stripLeading().startsWith(bulletStart) then
        //debug("found another bullet")
        if indent == line.nbrLeading(' ') then
          //debug(s"  bullet is on same indent level")
          appendItem(line)
          current += 1
        else if line.nbrLeading(' ') > indent then 
          //debug("found nested bullet list") 
          current = parseItemize(current, result)
        else 
          //debug("found outer level bullet; ready with this level, don't continue ")
          continue = false
      else
        //debug("found another line without bullet")
        if line.nbrLeading(' ') > indent then
          //debug(s"  line is on higher indent=${line.nbrLeading(' ')}")
          appendLine("", line, result)
          current += 1
        else 
          //debug("  line is on lover indent so end of items on this level")
          continue = false
    end while 
    current
  end parseItems 

  def appendLine(init: String, line: String, result: collection.mutable.ArrayBuffer[String])
    (using md: MarkdownToTex): Unit = 
      val lineReplaced = init + md.toTex(line)
      result.append(lineReplaced)
      //debug(s"appendLine: init=$init lineReplaced=$lineReplaced")

  def toTex: Seq[String] = 
    //debug(s"toTex of Chunk with ${body.length} body lines")
    var pos = 0
    val result = collection.mutable.ArrayBuffer.empty[String]
    while pos < body.length do
      val line = body(pos)
      if line.startsWith(titleStart) then
        pos = parseTitle(pos, result)
      else
        appendLine("", line, result) 
        pos += 1
    end while
    result.toSeq
end Chunk


type Lines = IndexedSeq[String]
type LineBuffer = collection.mutable.ArrayBuffer[String]
class ParseCtx:
  val settings = collection.mutable.Map.empty[String, String].withDefault(initSettings)
  val result = collection.mutable.ArrayBuffer.empty[Chunk]

def parseSetting(setting: String)(using pc: ParseCtx): Unit = 
  val pair = setting.split(settingDelim).map(_.trim).filter(_.nonEmpty)
  require(pair.length == 2, s"malformed setting > $setting")
  //debug(s"update setting: $setting")
  pc.settings.update(pair(0), pair(1))

def parseLines(lines: Lines, from: Int = 0): Seq[Chunk] = 
  given pc: ParseCtx = ParseCtx()
  var pos = from
  var lineBuffer = collection.mutable.ArrayBuffer.empty[String]

  def appendLineBuffer(using pc: ParseCtx): Unit = 
    if lineBuffer.nonEmpty then 
      pc.result.append(Chunk(pc.settings.toMap, lineBuffer.toSeq))
      //debug(s"chunk flushed with settings: ${pc.settings.toMap} body: ${pc.result.last.body.length} lines")
      lineBuffer.clear()

  while pos < lines.length do
    val current = lines(pos)
    if current.startsWith(settingStart) then
      val setting = current.stripPrefix(settingStart) 
      if setting.stripLeading().startsWith("file") then appendLineBuffer
      parseSetting(setting)
    else 
      lineBuffer.append(current)
      //debug(s"appended: $current")
    pos += 1
  end while
  appendLineBuffer
  pc.result.toSeq
end parseLines

val slideFiles = os.list(os.pwd/"slides")

val outDir = os.pwd / "tex" / "generated"

@main def build = 
  println(s"\n  Processing slide files: ${slideFiles.mkString("\n   ", "\n   ", "\n")}")
  for f <- slideFiles do
    println(s"processing: $f")
    val lines: Lines = os.read(f).linesIterator.to(collection.immutable.ArraySeq) 
    val chunks: Seq[Chunk] = parseLines(lines)
    println(s"  number of chunks found: ${chunks.length}")
    println(s"  *** deleting all existing -slide.tex in\n    $outDir")
    os.walk(outDir).foreach(f => f.lastOpt.foreach(s => if s.endsWith("-slide.tex") then os.remove(f)))
    for chunk <- chunks do
      val texFileName = chunk.settings("file") + "-slide.tex" 
      val output = chunk.toTex.mkString("\n")
      println(s"  writing: ${(outDir/texFileName).lastOpt.getOrElse("")}")
      os.write.over(outDir/texFileName, output)
    end for

    def latex(mainFile: String, wd: os.Path): os.CommandResult = 
      os.proc("latexmk", "-silent", "-pdf", "-cd", "book.tex")
        .call(cwd = wd)

    println(latex("book.tex", os.pwd / "tex" / "main"))

