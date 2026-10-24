// Typst-Teil von tinh-slides: Theme und Befehle
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
