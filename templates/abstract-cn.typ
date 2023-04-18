#import "../functions/style.typ": *
#import "../custom.typ": *
#import "../info.typ": *

#par(justify: true, first-line-indent: 2em, leading: 行距)[
  #heading(numbering: none, outlined: false, "摘要")
  
  #include "../chapters/abstract-cn.typ"
  #import "../chapters/abstract-cn.typ": 中文关键词

  #v(1fr)
  #set par(first-line-indent: 0em)
  *关键词：*
  #中文关键词.join("，")
  #v(2em)
]