#import "functions/numbering.typ": *
#import "functions/outline.typ": *
#import "functions/style.typ": *
#import "functions/helpers.typ": *
#import "functions/underline.typ": *
#import "functions/codeblock.typ": *
#import "functions/figurelist.typ": *
#import "functions/booktab.typ": *

#import "info.typ": *
#import "custom.typ": *

#let conf(
  outlinedepth: 3,
  blind: false,
  listofimage: true,
  listoftable: true,
  listofcode: true,
  alwaysstartodd: true,
  doc,
) = {
  set page("a4",
    header: locate(loc => {
      [
        #set text(字号.五号)
        #set align(center)
        #if partcounter.at(loc).at(0) < 10 {
          // Handle the first page of Chinese abstract specailly
          let headings = query(selector(heading).after(loc), loc)
          let next_heading = if headings == () {
            ()
          } else {
            headings.first().body.text
          }
          if next_heading == "摘要" and calc.odd(loc.page()) {
            [
              #align(center, 中文页眉)
              #v(-1em)
              #line(length: 100%)
            ]
          }
        } else if partcounter.at(loc).at(0) > 20 {
        } else {
          if calc.even(loc.page()) {
            [
              #align(center, 中文页眉)
              #v(-1em)
              #line(length: 100%)
            ]
          } else {
            let footers = query(selector(<__footer__>).after(loc), loc)
            let elems = if footers == () {
              ()
            } else {
              query(
                heading.where(level: 1).before(footers.first().location()), footers.first().location()
              )
            }
            if elems == () {
            } else {
              let el = elems.last()
              [
                // #let numbering = if el.numbering == chinesenumbering {
                //   chinesenumbering(..counter(heading).at(el.location()), location: el.location())
                // } else if el.numbering != none {
                //   numbering(el.numbering, ..counter(heading).at(el.location()))
                // }
                // #if numbering != none {
                //   numbering
                //   h(0.5em)
                // }
                #中文页眉
                #v(-1em)
                #line(length: 100%)
              ]
            }
          }
        }
      ]
    }),
    footer: locate(loc => {
      [
        #set text(字号.五号)
        #set align(center)
        #if query(selector(heading).before(loc), loc).len() < 2 or query(selector(heading).after(loc), loc).len() == 0 {
          // Skip cover, copyright and origin pages
        } else {
          let headers = query(selector(heading).before(loc), loc)
          let part = partcounter.at(headers.last().location()).first()
          [
            #if part < 20 {
              numbering("I", counter(page).at(loc).first())
            } else {
              str(counter(page).at(loc).first())
            }
          ]
        }
        #label("__footer__")
      ]
    }),
  )

  set text(字号.一号, font: 字体.宋体, lang: "zh")
  set align(center + horizon)
  set heading(numbering: chinesenumbering)
  set figure(
    numbering: (..nums) => locate(loc => {
      if appendixcounter.at(loc).first() < 10 {
        numbering("1.1", chaptercounter.at(loc).first(), ..nums)
      } else {
        numbering("A.1", chaptercounter.at(loc).first(), ..nums)
      }
    })
  )
  set math.equation(
    numbering: (..nums) => locate(loc => {
      set text(font: 字体.宋体)
      if appendixcounter.at(loc).first() < 10 {
        numbering("(1.1)", chaptercounter.at(loc).first(), ..nums)
      } else {
        numbering("(A.1)", chaptercounter.at(loc).first(), ..nums)
      }
    })
  )
  set list(indent: 2em)
  set enum(indent: 2em)

  show strong: it => textbf(it)
  show emph: it => textit(it)
  show par: set block(spacing: 行距)
  show raw: set text(font: 字体.代码)

  show heading: it => [
    // Cancel indentation for headings of level 2 or above
    #set par(first-line-indent: 0em)

    #let sizedheading(it, size) = [
      #set text(size)
      #v(2em)
      #if it.numbering != none {
        textbf(counter(heading).display())
        h(0.5em)
      }
      #textbf(it.body)
      #v(1em)
    ]

    #if it.level == 1 {
      if not it.body.text in ("ABSTRACT", "学位论文使用授权说明")  {
        pagebreak(weak: true)
      }
      locate(loc => {
        if it.body.text == "摘要" {
          partcounter.update(10)
          counter(page).update(1)
        } else if it.numbering != none and partcounter.at(loc).first() < 20 {
          partcounter.update(20)
          counter(page).update(1)
        }
      })
      if it.numbering != none {
        chaptercounter.step()
      }
      footnotecounter.update(())
      imagecounter.update(())
      tablecounter.update(())
      rawcounter.update(())
      equationcounter.update(())

      set align(center)
      sizedheading(it, 字号.三号)
    } else {
      if it.level == 2 {
        sizedheading(it, 字号.四号)
      } else if it.level == 3 {
        sizedheading(it, 字号.中四)
      } else {
        sizedheading(it, 字号.小四)
      }
    }
  ]

  show figure: it => [
    #set align(center)
    #if not it.has("kind") {
      it
    } else if it.kind == image {
      it.body
      [
        #set text(字号.五号)
        图
        #locate(loc => {
          chinesenumbering(chaptercounter.at(loc).first(), imagecounter.at(loc).first(), location: loc)
        })
        #h(1em)
        #it.caption
      ]
    } else if it.kind == table {
      [
        #set text(字号.五号)
        表
        #locate(loc => {
          chinesenumbering(chaptercounter.at(loc).first(), tablecounter.at(loc).first(), location: loc)
        })
        #h(1em)
        #it.caption
      ]
      it.body
    } else if it.kind == "code" {
      [
        #set text(字号.五号)
        代码
        #locate(loc => {
          chinesenumbering(chaptercounter.at(loc).first(), rawcounter.at(loc).first(), location: loc)
        })
        #h(1em)
        #it.caption
      ]
      it.body
    }
  ]

  show ref: it => {
    locate(loc => {
      let elems = query(it.target, loc)

      if elems == () {
        // Keep citations as is
        it
      } else {
        // Remove prefix spacing
        h(0em, weak: true)

        let el = elems.first()
        let el_loc = el.location()
        if el.func() == math.equation {
          // Handle equations
          link(el_loc, [
            式
            #chinesenumbering(chaptercounter.at(el_loc).first(), equationcounter.at(el_loc).first(), location: el_loc, brackets: true)
          ])
        } else if el.func() == figure {
          // Handle figures
          if el.kind == image {
            link(el_loc, [
              图
              #chinesenumbering(chaptercounter.at(el_loc).first(), imagecounter.at(el_loc).first(), location: el_loc)
            ])
          } else if el.kind == table {
            link(el_loc, [
              表
              #chinesenumbering(chaptercounter.at(el_loc).first(), tablecounter.at(el_loc).first(), location: el_loc)
            ])
          } else if el.kind == "code" {
            link(el_loc, [
              代码
              #chinesenumbering(chaptercounter.at(el_loc).first(), rawcounter.at(el_loc).first(), location: el_loc)
            ])
          }
        } else if el.func() == heading {
          // Handle headings
          if el.level == 1 {
            link(el_loc, chinesenumbering(..counter(heading).at(el_loc), location: el_loc))
          } else {
            link(el_loc, [
              节
              #chinesenumbering(..counter(heading).at(el_loc), location: el_loc)
            ])
          }
        } else {
          // Handle code blocks
          // Since the ref is linked to the code block instead of the internal
          // `figure`, we need to do an extra query here.
          let figure_el = query(selector(figure).after(el_loc), el_loc).first()
          let el_loc = figure_el.location()
          link(el_loc, [
            #if figure_el.kind == image {
              [图]
            } else if figure_el.kind == table {
              [表]
            } else if figure_el.kind == "code" {
              [代码]
            }
            #chinesenumbering(
              chaptercounter.at(el_loc).first(),
              counter(figure.where(kind: figure_el.kind)).at(el_loc).first(), location: el_loc
           )]
          )
        }

        // Remove suffix spacing
        h(0em, weak: true)
      }
    })
  }

  include "templates/cover.typ"

  locate(loc => {
    if alwaysstartodd {
      pagebreak()
    }
  })

  set align(left + top)
  set text(字号.小四)

  include "templates/declaration.typ" 

  locate(loc => {
    if alwaysstartodd {
      pagebreak()
    }
  })

  include "templates/abstract-cn.typ"
  
  pagebreak()

  locate(loc => {
    if alwaysstartodd and calc.even(loc.page()) {
      pagebreak()
    }

    include "templates/abstract-en.typ"
  })
  pagebreak()

  locate(loc => {
    if alwaysstartodd and calc.even(loc.page()) {
      pagebreak()
    }

    chineseoutline(
      title: "目录",
      depth: outlinedepth,
      indent: true,
    )
  })

  if listofimage {
    listoffigures()
  }

  if listoftable {
    listoffigures(title: "表格", kind: table)
  }

  if listofcode {
    listoffigures(title: "代码", kind: "code")
  }

  set align(left + top)
  par(justify: true, first-line-indent: 2em, leading: 行距)[
    #doc
  ]

  if not blind {
    par(justify: true, first-line-indent: 2em, leading: 行距)[
      #heading(numbering: none, "致谢")
      
      #include "chapters/acknowledgement.typ"
    ]

    partcounter.update(30)
    heading(numbering: none, 学校 + "学位论文原创性声明和使用授权说明")
    align(center)[#heading(level: 2, numbering: none, outlined: false, "原创性声明")]
    par(justify: true, first-line-indent: 2em, leading: 行距)[
      本人郑重声明：所呈交的毕业论文（设计），是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论文（设计）不包含任何其他个人或集体已经发表或撰写过的作品成果。对本论文（设计）的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本论文（设计）的知识产权归属于培养单位。本人完全意识到本声明的法律结果由本人承担。

      #v(1em)

      #align(right)[
        论文作者签名
        #h(5em)
        日期：
        #h(2em)
        年
        #h(2em)
        月
        #h(2em)
        日
      ]

      #align(center)[#heading(level: 2, numbering: none, outlined: false, "学位论文使用授权说明")]
      #v(-0.33em, weak: true)
      #align(center)[#text(字号.五号)[（必须装订在提交学校图书馆的印刷本）]]
      #v(字号.小三)

      本人完全了解#(学校)关于收集、保存、使用学位论文的规定，即：

      - 按照学校要求提交学位论文的印刷本和电子版本；
      - 学校有权保存学位论文的印刷本和电子版，并提供目录检索与阅览服务，在校园网上提供服务；
      - 学校可以采用影印、缩印、数字化或其它复制手段保存论文；
      - 因某种特殊原因须要延迟发布学位论文电子版，授权学校 #box[#rect(width: 9pt, height: 9pt)] 一年 /	 #box[#rect(width: 9pt, height: 9pt)] 两年 / #box[#rect(width: 9pt, height: 9pt)] 三年以后，在校园网上全文发布。

      #align(center)[（保密论文在解密后遵守此规定）]

      #v(1em)
      #align(right)[
        论文作者签名
        #h(5em)
        导师签名
        #h(5em)
        日期：
        #h(2em)
        年
        #h(2em)
        月
        #h(2em)
        日
      ]
    ]
  }
}
