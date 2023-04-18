#import "../functions/style.typ": *
#import "../functions/underline.typ": *
#import "../info.typ": *

#box(
  grid(
    columns: (auto, auto),
    gutter: 0.4em,
    image("../images/vi/sysu-emblem.svg", height: 2.4em, fit: "contain")
  )
)
#linebreak()
#textbf(论文名称)

#set text(字号.二号)
#v(60pt)
#grid(
  columns: (80pt, 300pt), 
  [
    #set align(right + top)
    题目：
  ],
  [
    #set align(center + horizon)
    #chineseunderline(论文中文题目, width: 300pt, bold: true)
  ]
)

#v(60pt)
#set text(字号.三号)

#let fieldname(name) = [
  #set align(right + top)
  #textbf(name)
]

#let fieldvalue(value) = [
  #set align(center + horizon)
  #set text(font: 字体.仿宋)
  #grid(
    rows: (auto, auto),
    row-gutter: 0.2em,
    value,
    line(length: 100%)
  )
]

#grid(
  columns: (80pt, 280pt),
  row-gutter: 1em,
  fieldname(text("姓") + h(2em) + text("名：")),
  fieldvalue(中文作者名),
  fieldname(text("学") + h(2em) + text("号：")),
  fieldvalue(学号),
  fieldname(text("学") + h(2em) + text("院：")),
  fieldvalue(学院),
  fieldname(text("专") + h(2em) + text("业：")),
  fieldvalue(专业),
  fieldname("研究方向："),
  fieldvalue(方向),
  fieldname(text("导") + h(2em) + text("师：")),
  fieldvalue(中文导师名),
)

#v(60pt)
#set text(字号.小二)
#text(日期)