inline val dbg = true
inline def debug(inline s: String): Unit = 
  inline if dbg then println(s" *** DEBUG $s")

val slideFiles = os.list(os.pwd/"slides")

val outDir = os.pwd / "tex" / "generated"

val latexMainFiles = os.list(os.pwd / "tex" / "main").filter:
  _.lastOpt.map(_.endsWith(".tex")).getOrElse(false)

val watchedPaths = Seq(
  os.pwd / "tex" / "chapters", 
  os.pwd / "slides",
) ++ latexMainFiles

val scalaSource = Seq(os.pwd / "src") 

def latexMake(mainFile: String, wd: os.Path): os.CommandResult = 
  os.proc("latexmk", "-silent", "-pdf", "-cd", "book.tex")
    .call(cwd = wd)

def time[A](msg: String, b: => A): A =
  val t0 = System.nanoTime()
  val result = b
  val t1 = System.nanoTime() - t0
  println(s"$msg ${math.round(t1 * 100.0/1_000_000)/100.0} ms")
  //println(s"$msg $t1 ns")
  result

def make(isLatexMk: Boolean): Unit =
  println(s"\n  Processing slide files: ${slideFiles.mkString("\n   ", "\n   ", "\n")}")
  for f <- slideFiles do
    println(s"processing: $f")
    val lines: Lines = os.read(f).linesIterator.to(collection.immutable.ArraySeq) 
    val chunks: Seq[Chunk] = time("parseLines", parseLines(lines))
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
  
  if isLatexMk then
    for f <- latexMainFiles do
      val result = latexMake(f.lastOpt.get, os.pwd / "tex" / "main")
      println(result)

def printlnOnChangeHelp() = 
  println("main.scala: Watching changes. Press Ctrl+C to exit, or press Enter to re-run.")

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
  
