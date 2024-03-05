inline val dbg = false

inline def debug(inline s: String): Unit = 
  inline if dbg then println(s" *** DEBUG $s")

val slideSourceDir    = os.pwd / "slides"
val slideSourceFiles  = os.list(slideSourceDir)

val chaptersSourceDir = os.pwd / "chapters"
val lecturesTargetDir = os.pwd / "lectures"
val slidesTargetDir   = lecturesTargetDir / "slides"

val bookDir           = os.pwd / "book"
val bookFileName      = "reqeng-book.tex"

val scalaSourceDir   = Seq(os.pwd / "src") 

val generatedSuffix  = "-generated"

def inputSlide(fileStart: String): String = 
  s"\\input{${slidesTargetDir.last}/$fileStart$generatedSuffix.tex}"

def latexMainPaths() = os.list(lecturesTargetDir)
  .filter(p => p.endsWith(os.RelPath(".tex")) && p.last.startsWith("L"))
  .appended(bookDir / bookFileName)

def watchedPaths() = Seq(chaptersSourceDir, slideSourceDir) ++ latexMainPaths()

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
  result

def deleteAllWithSuffix(path: os.Path, suffix: String): Unit = 
    os.walk(slidesTargetDir).foreach(f => f.lastOpt.foreach(last => 
      if last.endsWith(suffix) then os.remove(f)))

def make(isLatexMk: Boolean): Unit =
  println(s"\n  Processing slide files: ${slideSourceFiles.mkString("\n   ", "\n   ", "\n")}")
  val allChunks = scala.collection.mutable.ArrayBuffer.empty[Seq[Chunk]]
  for f <- slideSourceFiles do
    println(s"processing: $f")
    val lines: Lines = os.read(f).linesIterator.to(collection.immutable.ArraySeq) 
    val chunks: Seq[Chunk] = time("parseLines", parseLines(lines))
    allChunks.append(chunks)

    val genSuf = s"$generatedSuffix.tex"

    println(s"  number of chunks found: ${chunks.length}")
    println(s"  *** deleting all existing $genSuf in\n    $slidesTargetDir")

    deleteAllWithSuffix(slidesTargetDir, genSuf)

    for chunk <- chunks do
      val texFileName = chunk.settings("file") + genSuf 
      val output = chunk.toTex.mkString("\n")
      val pathLastPart = slidesTargetDir.segments.toSeq.takeRight(2).mkString("/")
      println(s"  writing: $pathLastPart/${(slidesTargetDir/texFileName).last}")
      os.write.over(slidesTargetDir/texFileName, output)
    end for
  end for
  
  val flatChunks = allChunks.flatten.toSeq
  val lectureMains = flatChunks.map(_.settings("main")).distinct
  println(s"  slide main files to generate: ${lectureMains.mkString(", ")}")
  for lect <- lectureMains do
    val chunksOfMain = flatChunks.filter(_.settings("main") == lect)
    val inputFiles = chunksOfMain.map(_.settings("file")).distinct
    println(s"    generating $lect of ${inputFiles.length} files: ${inputFiles.mkString(", ")}")
    val latexInputs = inputFiles.map(inputSlide)
    val title = 
      chunksOfMain.lastOption.map(_.settings("title")).getOrElse("Untitled Lecture")
    val doc = latex.slidePreamble(title) +: latexInputs :+ latex.endDocument
    val lectFileName = s"$lect$generatedSuffix.tex"
    os.write.over(lecturesTargetDir / lectFileName, doc.mkString("\n"))
    if isLatexMk then 
      latexMakeWithErrorManagement(lectFileName, lecturesTargetDir)

  if isLatexMk then
    val mains = latexMainPaths()
    println(s"  running latexmk foreach $mains")
    for f <- mains if f.lastOpt.nonEmpty do 
      val workDir = os.root / f.segments.toSeq.dropRight(1)
      val fileName = f.last
      println(s"    spawning latexmk in $workDir $fileName")
      latexMakeWithErrorManagement(fileName, workDir)

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
    println(s"Watching changes in:\n  " + watchedPaths().mkString("\n  "))
    os.watch.watch(watchedPaths(), xs => onChange(xs, isLatexMk))
    os.watch.watch(scalaSourceDir, xs => {
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
  
