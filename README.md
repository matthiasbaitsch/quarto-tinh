# quarto-tinh

Neutrale Quarto-Extensions für Lehrunterlagen (Folien, Skript, Aufgaben). Der Name kommt vom vietnamesischen
*tính* (rechnen).

Die Extensions enthalten nur Layout und Stil. Was eine Einrichtung ausmacht (Logo, später ggf. Farben), kommt aus der `_brand.yml` des jeweiligen Projekts, Autor, Untertitel, Fußzeile usw. aus den Metadaten des Projekts.

## Beispiele

Die Beispiele aus `examples/` werden bei jedem Push auf `main` gerendert und auf GitHub Pages veröffentlicht. Sie
verwenden die Brand der Hochschule Bochum ([hsbo-brand](https://github.com/matthiasbaitsch/hsbo-brand), in
`_brand/`), die Extensions selbst sind neutral.

| Beispiel                              | HTML | PDF |
|---------------------------------------|------|-----|
| Folien (`slides.qmd`)                 | [revealjs](https://matthiasbaitsch.github.io/quarto-tinh/examples/slides.html) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/slides.pdf) |
| Skript (`notes.qmd`)                  | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/notes.html) | [LaTeX](https://matthiasbaitsch.github.io/quarto-tinh/examples/notes.pdf) |
| Aufgaben (`assignments.qmd`)          | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/assignments.html) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/assignments.pdf) |
| Aufgaben mit Literatur (`assignments-bib.qmd`) | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/assignments-bib.html) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/assignments-bib.pdf) |
| Makros (`macros.qmd`), Folien         | [revealjs](https://matthiasbaitsch.github.io/quarto-tinh/examples/macros-slides.html) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/macros-slides.pdf) |
| Makros, Skript                        | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/macros-notes.html) | [LaTeX](https://matthiasbaitsch.github.io/quarto-tinh/examples/macros-notes.pdf) |
| Makros, Aufgaben                      | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/macros-assignments.html) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/macros-assignments.pdf) |
| Notebook, beides markiert (`notebook.qmd`) | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook.html), [ipynb](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook.ipynb) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook.pdf) |
| Notebook, Lösung (`notebook-solution.qmd`) | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook-solution.html), [ipynb](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook-solution.ipynb) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook-solution.pdf) |
| Notebook, Gerüst (`notebook-scaffold.qmd`) | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook-scaffold.html), [ipynb](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook-scaffold.ipynb) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook-scaffold.pdf) |
| Notebook, ohne beides (`notebook-blank.qmd`) | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook-blank.html), [ipynb](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook-blank.ipynb) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook-blank.pdf) |

## Formate

Formate heißen `tinh-<zweck>-<grundformat>`.

| Extension     | Format                 | Basis    | Inhalt                                                  |
|---------------|------------------------|----------|---------------------------------------------------------|
| `tinh-slides` | `tinh-slides-revealjs` | revealjs | Folien-Stil, Logo auf jeder Folie                       |
| `tinh-slides` | `tinh-slides-typst`    | typst    | Folien als PDF mit touying, Theme `clean`, Logo auf jeder Folie |
| `tinh-notes`  | `tinh-notes-html`      | html     | Skript mit Inhaltsverzeichnis                           |
| `tinh-notes`  | `tinh-notes-pdf`       | pdf      | Skript als PDF (LaTeX) mit Index                        |
| `tinh-assignments` | `tinh-assignments-html` | html | Aufgabenblätter                                      |
| `tinh-assignments` | `tinh-assignments-typst` | typst | Aufgabenblätter als PDF (Typst), Schrift Libertinus Serif |
| `tinh-notebook` | `tinh-notebook-ipynb`  | ipynb    | Notebook mit Lösung oder Gerüst (siehe unten)           |
| `tinh-notebook` | `tinh-notebook-html`   | html     | dasselbe als HTML, Stil wie `tinh-assignments-html`     |
| `tinh-notebook` | `tinh-notebook-typst`  | typst    | dasselbe als PDF, Stil wie `tinh-assignments-typst`     |

`tinh-notes` bettet [quarto-ext/latex-environment](https://github.com/quarto-ext/latex-environment) unverändert ein (MIT, siehe `LICENSE-latex-environment`) (aktualisieren siehe unten). Für PDF sind die Befehle `neuerbegriff`, `ja` und `nein` voreingestellt (`commands`). Definitionen (`#def-`) und Beispiele (`#exm-`) sind Quartos eigene Umgebungen, die Extension gibt ihnen in HTML und PDF einen Kasten. Geplant: Typst-Format für das Skript.

## Befehle

Klassen, die in allen Formaten gleich verwendet werden:

| Klasse                       | Wirkung                                  |
|------------------------------|------------------------------------------|
| `[Begriff]{.neuerbegriff}`   | neuer Begriff, dunkelrot (`accent2`)     |
| `[]{.ja}`, `[]{.nein}`       | grüner Haken, rotes Kreuz                |
| `[]{.down20}` usw.           | vertikaler Abstand, nur Folien (Typst: 10 bis 50, revealjs: auch `.upN` und weitere Werte) |

Ausnahme: Bei `tinh-assignments-typst` wirken diese Klassen nicht.

## Makros

`tinh-macros` definiert LaTeX-Makros für Formeln (`math.tex`) und Einheiten nach siunitx (`units.tex`), alle anderen
Extensions binden den Filter `macros.lua` ein. Er setzt die Makros vor der Ausgabe ein, so dass sie in HTML und Typst
ankommen. Im Fließtext wird z.B. `\SI{20}{\metre}` zu einer Inline-Formel (Werte also in der Mathe-Schrift). Bei
LaTeX setzt der Filter nur die Makros aus `math.tex` ein, die Einheiten übernimmt siunitx (geladen in
`tinh-notes.tex`).

| Makro                                   | Ergebnis                       |
|-----------------------------------------|--------------------------------|
| `\SI{wert}{einheit}`, `\si{einheit}`, `\num{wert}` | Wert mit Einheit wie bei siunitx (vereinfacht) |
| `\metre`, `\newton`, `\pascal`, ...     | Einheiten, siehe `units.tex`   |
| `\kilo`, `\per`, `\squared`, `\tothe{3}`, ... | Vorsätze und Potenzen    |
| `\R`                                    | $\mathbb{R}$                   |
| `\mmat{a & b \\ c & d}`                 | Matrix in runden Klammern      |
| `\mtran`                                | transponiert, $^\top$          |

Ohne die anderen Extensions: `filters: [tinh-macros]`.

## Lösung und Gerüst

In Aufgaben (`tinh-assignments`) und Notebooks (`tinh-notebook`) kommen Lösung und Gerüst für die Studierenden aus
derselben Datei (Filter `solution-scaffold.lua` aus `tinh-common`). Die Variable `tinh-target` legt die Fassung fest:

| Block                     | ohne `tinh-target` | `solution` | `scaffold` | `blank` |
|---------------------------|:------------------:|:----------:|:----------:|:-------:|
| ohne Markierung           | ja                 | ja         | ja         | ja      |
| `::: {.tinh-solution}`    | ja, markiert       | ja, markiert (nicht im `ipynb`) | nein     | nein    |
| `::: {.tinh-scaffold}`    | ja, markiert       | nein       | ja         | nein    |

Markiert heißt: in HTML und Typst ein Block mit farbigem Rand und der Beschriftung „Lösung“ bzw. „Gerüst“, sonst
(z.B. im `ipynb`) die Beschriftung fett davor. Stehen markierte Blöcke derselben Art direkt hintereinander (auch weil
die Blöcke dazwischen wegfallen), gibt es nur eine Markierung. Folgt einem `.tinh-solution`-Block mit Code kein `.tinh-scaffold`-Block,
steht im Gerüst eine Code-Zelle `# ...`. Die Blöcke dürfen in anderen stehen, z.B. in `::: {#exr-…}`. Quartos eigene
Umgebung `.solution` („Lösung.“) bleibt davon unberührt.

## Notebooks

Notebooks werden als `.qmd` gepflegt. Die Sprache der ersten Code-Zelle bestimmt den Kernel im `ipynb` (z.B.
`julia`), Titel und Untertitel stehen in der ersten Zelle.

Für das `ipynb` wird der Code nicht ausgeführt, dafür braucht es `engine: markdown`. Die Engine gilt für das ganze
Dokument, weder die Extension noch ein Eintrag unter `format:` kann sie je Format setzen. Sie steht daher im YAML-Kopf
oder kommt von der Kommandozeile (`-M engine:…` wirkt nur bei Dateien mit YAML-Kopf). HTML und Typst lassen sich mit
einer Engine wie `julia` ausführen:

```bash
# Kopf: engine: julia
quarto render notebook.qmd --to tinh-notebook-html -M tinh-target:solution
quarto render notebook.qmd --to tinh-notebook-ipynb -M engine:markdown -M tinh-target:scaffold -o notebook-scaffold.ipynb
```

Die Engine läuft vor den Filtern und führt alle Zellen aus, auch die aus `.tinh-scaffold`. Code in `.tinh-scaffold` muss
daher lauffähig sein, Lücken als Kommentar (`# xbar = ...`), nicht `xbar = # ...`.

## Grafiken

Grafiken stehen in allen Formaten zentriert: Abbildungen mit Bildunterschrift und Plots über `fig-align: center`,
Bilder ohne Bildunterschrift (`![](bild.png)` allein im Absatz) über den Filter `center-images.lua` aus `tinh-common`.
Bilder im Fließtext, Bilder mit eigenem `fig-align` und bei revealjs Bilder mit `.absolute` oder `.r-stretch` bleiben
unverändert.

## Typst-Folien

`tinh-slides-typst` baut auf der touying-Bridge
[kazuyanagimoto/quarto-touying-typst](https://github.com/kazuyanagimoto/quarto-touying-typst) (MIT, siehe
`LICENSE-touying`) und dem Typst-Paket `touying-quarto-clean` auf. Die Bridge ist unverändert in
`_extensions/tinh-slides/_extensions/` eingebettet, die Befehle oben meldet `_extension.yml` über `commands:` an.
Theme (`clean` mit Seitenzahl links, auch die Titelfolie) und Befehle stehen in `tinh-slides.typ`. Pausen mit `. . .`,
Optionen `aspect-ratio` und `handout` wie bei der Bridge (aktualisieren siehe unten).

## Einbinden

```bash
quarto add matthiasbaitsch/quarto-tinh
```

Danach in `_quarto.yml` oder im Dokument:

```yaml
format:
  tinh-slides-revealjs: default
```

Lokale Optionen in `_quarto.yml` überschreiben die der Extension. Den Ordner `_extensions/` im Projekt
einchecken.

## Logo

Das Logo ist `logo.medium` aus der `_brand.yml` des Projekts. Es gelten Quartos Voreinstellungen: Bei den Aufgabenblättern (Typst) steht es oben rechts auf der Seite, bei HTML-Dokumenten fehlt es. Bei den Folien steht `logo.small` auf jeder Folie: bei revealjs unten rechts (eingebettet von `logo.lua`, weil Quarto den Pfad in Unterordnern falsch setzt), die Seitenzahl dann unten links; bei Typst ebenso.

## Aktualisieren

```bash
quarto update matthiasbaitsch/quarto-tinh
```

Eingebettete Extensions (touying-Bridge, latex-environment) in diesem Repository aktualisieren:

```bash
make update-extensions
```

Danach gibt `make` aus, was noch zu prüfen ist (Pfade in `tinh-slides/_extension.yml`, touying-Version, Beispiele
rendern, Versionen erhöhen).

## Testen

In `examples/` gibt es für jeden Zweck eine Datei mit den Elementen, die die Extension besonders behandelt, jeweils in allen Formaten des Zwecks: `slides.qmd`, `notes.qmd`, `assignments.qmd`. Die `_quarto.yml` im Wurzelverzeichnis macht das Repository zum Projekt, damit Quarto die Extensions aus `_extensions/` findet, rendert nur diese Beispiele und schreibt die Ausgabe nach `__output/`.

```bash
quarto render                        # alle Beispiele
quarto render examples/notes.qmd     # ein Beispiel
```

## Bekannte Meldungen

- `Cannot read properties of undefined (reading 'Config')` in der Browser-Konsole und beim PDF-Export mit
  Decktape: Das Reveal-Mathe-Plugin ruft nach dem Laden `MathJax.Hub.Config` (MathJax-2-API) auf, MathJax 4 kennt das nicht. Harmlos, die Formeln setzt MathJax 4 trotzdem.
