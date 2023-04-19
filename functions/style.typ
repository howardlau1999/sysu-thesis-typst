#import "../custom.typ": *

#let 字号 = (
  初号: 42pt,
  小初: 36pt,
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
  小三: 15pt,
  四号: 14pt,
  中四: 13pt,
  小四: 12pt,
  五号: 10.5pt,
  小五: 9pt,
  六号: 7.5pt,
  小六: 6.5pt,
  七号: 5.5pt,
  小七: 5pt,
)

#let textit(it) = [
  #set text(font: 字体.楷体, style: "italic")
  #h(0em, weak: true)
  #it
  #h(0em, weak: true)
]

#let textbf(it) = [
  #set text(font: 字体.黑体, weight: "semibold")
  #h(0em, weak: true)
  #it
  #h(0em, weak: true)
]

#let lengthceil(len, unit: 字号.小四) = calc.ceil(len / unit) * unit