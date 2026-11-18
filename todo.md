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
- [X]  numPDE auf `tinh-notebook` umstellen: in den `notebook.qmd` die Klassen
  umbenennen (`.tinh-solution`, `.tinh-scaffold`), Code in `.tinh-scaffold` lauffähig (Lücken als Kommentar). Im
  Lernpfad-Skript statt `filter_notebook` eine temporäre `.qmd` mit Kopf (`title`, `subtitle`, `engine: markdown`,
  `tinh-target`) schreiben und `quarto render … --to tinh-notebook-ipynb` aufrufen, Ausgabeort bei `output-dir`
  beachten; Zips, Hashes und Slugs bleiben im Skript. CLAUDE.md anpassen, `filter-notebook.jl` löschen.
- [ ]  `tinh-notes-typst`: eigenes schlichtes Book-Layout statt orange-book (zu verspielt). Datei `tinh-book.typ`
  mit `book`, `part` und `appendices` (Schnittstelle wie orange-book), eigenes `typst-show.typ` und `page.typ`;
  `numbering.typ` und `orange-book.lua` weiterverwenden. Aussehen etwa wie KOMA scrreprt: schlichte Titelseite mit
  Logo, Teilseite nur mit „Teil I“ und Titel, Kapitel auf neuer Seite mit Nummer und Titel ohne Rahmen und
  Farbflächen, Kopfzeile mit Kapitel und Seitenzahl. Danach das eingebettete orange-book-Paket entfernen.
- [ ]  Informatik auf `tinh-notebook` umstellen, wie numPDE.
- [ ]  Mathe B auf `tinh-notebook` umstellen, wie numPDE.
- [X]  numPDE: `\newcommand`-Blöcke in den beiden Aufgaben entfernen (Makros jetzt in `tinh-macros`).
- [ ]  `tinh-notes-pdf`: `\fvset{fontsize=\small}` in `tinh-notes.tex` scheitert mit „Undefined control sequence“,
  wenn ein Dokument keinen sichtbaren Code hat, weil Quarto `fancyvrb` dann nicht lädt (z. B. Skript
  `m-dichtekurven-und-normalverteilung` in `bcd-bausteine-statistik`, dort ist der Workflow deshalb abgeschaltet).
  Lösung etwa `\AtBeginDocument{\ifdefined\fvset\fvset{fontsize=\small}\fi}`. Danach Version erhöhen, in
  `bcd-bausteine-statistik` aktualisieren und den Workflow wieder einschalten (`gh workflow enable "Render and
  publish"`).
