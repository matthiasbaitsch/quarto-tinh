// Typst-Teil von tinh-slides: Theme, Befehle und Titelfolie
// touying selbst importiert das Template der eingebetteten Bridge (gleiche Datei, steht davor)
#import "@preview/touying-quarto-clean:0.2.1": *

// Befehle (Klassen per environment.lua der Bridge und commands: in _extension.yml, z. B. [Begriff]{.neuerbegriff})
#let neuerbegriff(body) = text(fill: rgb("#9a2515"), weight: "regular", body)
#let ja(body) = text(fill: rgb("#2e7d32"))[✓]
#let nein(body) = text(fill: red)[✗]

// Vertikaler Abstand wie .downN bei revealjs, z. B. []{.down20}
#let down(n) = body => { v(n * 1pt); body }
#let down10 = down(10)
#let down20 = down(20)
#let down30 = down(30)
#let down40 = down(40)
#let down50 = down(50)

// Tabellen ohne Typsts Standardraster
#set table(stroke: none)

// Text in Code kleiner
#show raw.where(block: true): set text(size: 0.8em)

// Überschrift 3 aufrecht
#show heading.where(level: 3): it => text(style: "normal", it)

// Titelfolie wie bei clean
#let tinh-title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let title = info.at("title", default: none)
  let subtitle = info.at("subtitle", default: none)
  let author = info.at("author", default: none)
  let date = info.at("date", default: none)
  let body = {
    set align(left + horizon)
    block(inset: (y: 1em), [
      #text(size: 1.4em, weight: "light", title)
      #if subtitle != none {
        linebreak()
        text(style: "italic", fill: self.colors.primary, subtitle)
      }
    ])
    if author != none { block(author) }
    if date != none { block(date) }
  }
  self = utils.merge-dicts(self, config-common(freeze-slide-counter: true))
  touying-slide(self: self, body)
})
