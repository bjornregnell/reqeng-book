trait Generator:
  def generate: String

extension (s: String) def saveTo(pathToFile: String): Unit = 
  val pw = java.io.PrintWriter(java.io.File(pathToFile), "UTF-8")
  try pw.write(s) finally pw.close()

def loadLines(pathToFile: String): Iterator[String] = 
  val s = scala.io.Source.fromFile(pathToFile, "UTF-8") 
  try s.getLines() finally s.close()

def generate(es: Elem*)(using gen: Generator): String = ???