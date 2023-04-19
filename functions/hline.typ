#import "../custom.typ": *

#let hline(thickness: 1pt) = {
  line(start: (-50%, 0%), end: (150%, 0%), stroke: thickness + 强调色);
}