#import "../functions/style.typ": *
#import "../custom.typ": *
#import "../info.typ": *

#par(justify: true, first-line-indent: 2em, leading: 行距)[
  // #[
  //   #set text(字号.小二)
  //   #set align(center)
  //   #strong(论文英文题目)
  // ]
  // #[
  //   #set align(center)
  //   #英文作者名 \(#英文专业\) \
  //   Directed by #英文导师名
  // ]
  #heading(numbering: none, outlined: false, "ABSTRACT")
  
  #include "../chapters/abstract-en.typ"
  #import "../chapters/abstract-en.typ": 英文关键词

  #linebreak()
  #set par(first-line-indent: 0em)
  #text("Keywords:", weight: "bold")
  #h(0.5em, weak: true)
  #英文关键词.join(", ")
  #v(2em)
]