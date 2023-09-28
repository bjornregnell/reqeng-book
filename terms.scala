enum Lang { case EN, SV}

extension (s: String) def cap: String = s.split(" ").map(_.capitalize).mkString(" ")

case class Term(id: String, en: String, sv: String, lang: Lang = Lang.EN):
  def cap = copy(en = en.cap, sv = sv.cap)
  def EN = copy(lang = Lang.EN)
  def SV = copy(lang = Lang.SV)
  override def toString = if lang == Lang.EN then en else sv

def re = Term("re", "requirements engineering", "kravhantering")