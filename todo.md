# TODO

- [X]  Aufgaben ohne Seitenzahl
- [X]  Titel Aufgaben linksbündig
- [X]  Typst Aufgabenblätter sehen scheiße aus
- [X]  Gute Beispiele
- [X]  Aufgabenblatt html mit logo (wontfix)
- [X]  Brand-Extension für die HS Bochum als eigenes Repo (z. B. `hsbo-brand`), einbinden mit
  `quarto use brand …`, statt Kopien der `_brand.yml` in numPDE, Mathe B und hier. Inhalt: Logo als SVG-Dateien
  statt URL, Farben (`color.primary` usw.), ggf. Schrift. Vorher klären: Gestaltungsrichtlinien der HS, ob das
  Logo öffentlich weitergegeben werden darf. Danach feste Farben in tinh (z. B. `neuerbegriff`, Balken bei
  Beispielen) aus `brand.color` nehmen.
- [X]  Formeln in den revealjs-Folien zu fett gegenüber Roboto Light: Formeln grau (`#444`) und Mathe-Schrift
  `mathjax-modern` (Latin Modern).
- [X]  Notebooks mit Lösung und Gerüst als Filter in tinh: Extension `tinh-notebook` (ipynb, HTML, Typst),
  Filter `solution-scaffold.lua` in `tinh-common` (auch für `tinh-assignments`), Klassen `.tinh-solution` und
  `.tinh-scaffold`, Variable `tinh-target`. Ergebnis gleich `filter-notebook.jl` bis auf die Markierung **Lösung**.
- [ ]  numPDE (danach Informatik und Mathe B) auf `tinh-notebook` umstellen: in den `notebook.qmd` die Klassen
  umbenennen (`.tinh-solution`, `.tinh-scaffold`), Code in `.tinh-scaffold` lauffähig (Lücken als Kommentar). Im
  Lernpfad-Skript statt `filter_notebook` eine temporäre `.qmd` mit Kopf (`title`, `subtitle`, `engine: markdown`,
  `tinh-target`) schreiben und `quarto render … --to tinh-notebook-ipynb` aufrufen, Ausgabeort bei `output-dir`
  beachten; Zips, Hashes und Slugs bleiben im Skript. CLAUDE.md anpassen, `filter-notebook.jl` löschen.
- [ ]  numPDE: `\newcommand`-Blöcke in den beiden Aufgaben entfernen (Makros jetzt in `tinh-macros`).
