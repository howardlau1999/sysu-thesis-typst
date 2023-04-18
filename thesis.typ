#import "template.typ": *

#show: doc => conf(
  outlinedepth: 3,
  blind: false,
  listofimage: true,
  listoftable: true,
  listofcode: true,
  alwaysstartodd: true,
  doc,
)

#include "chapters/ch01.typ"
#include "chapters/ch02.typ"
#include "chapters/ch03.typ"

#appendix()

#include "chapters/appendix01.typ"
#include "chapters/appendix02.typ"

#pagebreak()
#bibliography(("bibs/ex01.bib", "bibs/ex02.bib"),
  style: "ieee"
)
