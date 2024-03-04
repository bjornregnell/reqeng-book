inline val dbg = true
inline def debug(inline s: String): Unit = 
  inline if dbg then println(s" *** DEBUG $s")

val slideFiles = os.list(os.pwd/"slides")

val outDir = os.pwd / "tex" / "lectures"

val latexMainFiles = os.list(os.pwd / "tex" / "main").filter:
  _.lastOpt.map(_.endsWith(".tex")).getOrElse(false)

val watchedPaths = Seq(
  os.pwd / "tex" / "chapters", 
  os.pwd / "slides",
) ++ latexMainFiles

val scalaSource = Seq(os.pwd / "src") 

def latexMake(mainFile: String, wd: os.Path) = scala.util.Try:
  os.proc("latexmk", "-silent", "-pdf", "-cd", mainFile)
    .call(cwd = wd)

def latexMakeWithErrorManagement(mainFile: String, wd: os.Path): Unit =
      latexMake(mainFile, wd) match
        case util.Success(result) => println(result)

        case util.Failure(error)  => 
          val logName = mainFile.stripSuffix(".tex") + ".log"
          println(Console. RED + s"*** ERROR: $error" + Console.RESET)
          val log = os.read(wd / logName).linesIterator.toSeq
          val errorStart = log.indexWhere(_.contains("Error:"))
          val nbrLines = log.drop(errorStart).indexWhere(_.contains("<return"))
          println( // this is a hack to get relevant error lines with file and error
            log.slice(errorStart - 7, errorStart + nbrLines)
              .filter(s => s.trim.startsWith("(/") | s.trim.startsWith("!") | s.trim.endsWith(".tex"))
              .mkString("\n")
          )
          println(Console. RED +  "----- END OF ERROR REPORT ---" + Console.RESET +
            s" see ${Console.GREEN} $logName ${Console.RED} line nbr ${Console.RESET} ${errorStart + 1}")


def time[A](msg: String, b: => A): A =
  val t0 = System.nanoTime()
  val result = b
  val t1 = System.nanoTime() - t0
  println(s"$msg ${math.round(t1 * 100.0/1_000_000)/100.0} ms")
  //println(s"$msg $t1 ns")
  result

def make(isLatexMk: Boolean): Unit =
  println(s"\n  Processing slide files: ${slideFiles.mkString("\n   ", "\n   ", "\n")}")
  val allChunks = scala.collection.mutable.ArrayBuffer.empty[Seq[Chunk]]
  for f <- slideFiles do
    println(s"processing: $f")
    val lines: Lines = os.read(f).linesIterator.to(collection.immutable.ArraySeq) 
    val chunks: Seq[Chunk] = time("parseLines", parseLines(lines))
    allChunks.append(chunks)
    println(s"  number of chunks found: ${chunks.length}")
    println(s"  *** deleting all existing -slide.tex in\n    $outDir")
    os.walk(outDir).foreach(f => f.lastOpt.foreach(s => if s.endsWith("-slide.tex") then os.remove(f)))
    for chunk <- chunks do
      val texFileName = chunk.settings("file") + "-slide.tex" 
      val output = chunk.toTex.mkString("\n")
      val pathLastPart = outDir.segments.toSeq.takeRight(2).mkString("/")
      println(s"  writing: $pathLastPart/${(outDir/texFileName).last}")
      os.write.over(outDir/texFileName, output)
    end for
  end for
  
  val flatChunks = allChunks.flatten.toSeq
  val slideMains = flatChunks.map(_.settings("main")).distinct
  println(s"  slide main files to generate: ${slideMains.mkString(", ")}")
  for m <- slideMains do
    val chunksOfMain = flatChunks.filter(_.settings("main") == m)
    val inputFiles = chunksOfMain.map(_.settings("file")).distinct
    println(s"    generating $m of ${inputFiles.length} files: ${inputFiles.mkString(", ")}")
    val body = inputFiles.map(f => s"\\input{$f-slide.tex}")
    val title = 
      chunksOfMain.lastOption.map(c => "\\\\\\vspace{1em}" + c.settings("title")).getOrElse("")
    val doc = latex.slidePreamble(title) +: body :+ latex.slideEnd
    os.write.over(outDir/ s"$m.tex", doc.mkString("\n"))
    if isLatexMk then 
      latexMakeWithErrorManagement(s"$m.tex", outDir)


  if isLatexMk then
    for f <- latexMainFiles do
      val fileName = f.lastOpt.get
      latexMakeWithErrorManagement(fileName, os.pwd / "tex" / "main")

def printlnOnChangeHelp() = 
  println("main.scala: Watching changes. Press Ctrl+C to exit, or press Enter twice to re-run.")

def onChange(changed: Set[os.Path], isLatexMk: Boolean): Unit = 
  println(s"changed:\n  ${changed.mkString("\n  ")}")
  make(isLatexMk)
  printlnOnChangeHelp()

@main def main(args: String*) =  
  println(s"=== Running main in 'src/main.scala' with args: ${args.mkString(" ")}")
  val isLatexMk = args.contains("-l") || args.contains("--latexmk")
  val isWatch   = args.contains("-w") || args.contains("--watch")
  if isWatch then 
    //os.watch.watch(Seq(os.pwd/"slides"), xs => println("changed: " + xs.mkString(",")))
    println(s"Watching changes in:\n  " + watchedPaths.mkString("\n  "))
    os.watch.watch(watchedPaths, xs => onChange(xs, isLatexMk))
    os.watch.watch(scalaSource, xs => {
      println("\nSources in src changed; exiting... Press Enter to re-start.")
      System.exit(0)
    })
    while true do 
      printlnOnChangeHelp()
      scala.io.StdIn.readLine()
      make(isLatexMk)
    end while
  else // don't watch, just make
    make(isLatexMk)
  
