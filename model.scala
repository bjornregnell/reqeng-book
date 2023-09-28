enum Elem:
  case Document(title: String)
  case Section(heading: String, body: String)
  case Subsection(heading: String, body: String)
  case Paragraph(about: String, body: String)
export Elem.*

def document(title: String) = Document(title: String)
def section(heading: String)(body: String) = Section(heading, body)
def subsection(heading: String)(body: String) = Subsection(heading, body)
def p(about: String)(body: String) = Paragraph(about, body)

