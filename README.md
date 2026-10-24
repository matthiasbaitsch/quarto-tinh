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

## Formate

Formate heißen `tinh-<zweck>-<grundformat>`.

| Extension     | Format                 | Basis    | Inhalt                                                  |
|---------------|------------------------|----------|---------------------------------------------------------|
| `tinh-slides` | `tinh-slides-revealjs` | revealjs | Folien-Stil, ohne Logo                                  |
| `tinh-slides` | `tinh-slides-typst`    | typst    | Folien als PDF mit touying, Theme `clean`, ohne Logo |
| `tinh-notes`  | `tinh-notes-html`      | html     | Skript mit Inhaltsverzeichnis                           |
| `tinh-notes`  | `tinh-notes-pdf`       | pdf      | Skript als PDF (LaTeX) mit Index                        |
| `tinh-assignments` | `tinh-assignments-html` | html | Aufgabenblätter                                      |
| `tinh-assignments` | `tinh-assignments-typst` | typst | Aufgabenblätter als PDF (Typst), Schrift Libertinus Serif |

`tinh-notes` bettet [quarto-ext/latex-environment](https://github.com/quarto-ext/latex-environment) unverändert ein (MIT, siehe `LICENSE-latex-environment`), aktualisieren mit `quarto add quarto-ext/latex-environment --embed tinh-notes`. Für PDF sind die Befehle `neuerbegriff`, `ja` und `nein` voreingestellt (`commands`). Definitionen (`#def-`) und Beispiele (`#exm-`) sind Quartos eigene Umgebungen, die Extension gibt ihnen in HTML und PDF einen Kasten. Geplant: Typst-Format für das Skript.

## Befehle

Klassen, die in allen Formaten gleich verwendet werden:

| Klasse                       | Wirkung                                  |
|------------------------------|------------------------------------------|
| `[Begriff]{.neuerbegriff}`   | neuer Begriff, dunkelrot (`accent2`)     |
| `[]{.ja}`, `[]{.nein}`       | grüner Haken, rotes Kreuz                |
| `[]{.down20}` usw.           | vertikaler Abstand, nur Folien (Typst: 10 bis 50, revealjs: auch `.upN` und weitere Werte) |

Ausnahme: Bei `tinh-assignments-typst` wirken diese Klassen nicht.

## Typst-Folien

`tinh-slides-typst` baut auf der touying-Bridge
[kazuyanagimoto/quarto-touying-typst](https://github.com/kazuyanagimoto/quarto-touying-typst) (MIT, siehe
`LICENSE-touying`) und dem Typst-Paket `touying-quarto-clean` auf. Die Bridge ist unverändert in
`_extensions/tinh-slides/_extensions/` eingebettet, die Befehle oben meldet `_extension.yml` über `commands:` an.
Theme (`clean`, auch die Titelfolie) und Befehle stehen in `tinh-slides.typ`. Pausen mit `. . .`, Optionen `aspect-ratio` und
`handout` wie bei der Bridge.

Bridge aktualisieren:

```bash
quarto add kazuyanagimoto/quarto-touying-typst --embed tinh-slides
```

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

Das Logo ist `logo.medium` aus der `_brand.yml` des Projekts. Es gelten Quartos Voreinstellungen: Bei den Aufgabenblättern (Typst) steht es oben rechts auf der Seite, bei HTML-Dokumenten fehlt es. Bei den Folien ist es abgeschaltet (`logo: false`), weil Quarto es auf jede Folie setzt.

## Aktualisieren

```bash
quarto update matthiasbaitsch/quarto-tinh
```

## Testen

In `examples/` gibt es für jeden Zweck eine Datei mit den Elementen, die die Extension besonders behandelt, jeweils in allen Formaten des Zwecks: `slides.qmd`, `notes.qmd`, `assignments.qmd`. Die `_quarto.yml` im Wurzelverzeichnis macht das Repository zum Projekt, damit Quarto die Extensions aus `_extensions/` findet, rendert nur diese Beispiele und schreibt die Ausgabe nach `__output/`.

```bash
quarto render                        # alle Beispiele
quarto render examples/notes.qmd     # ein Beispiel
```

## Bekannte Meldungen

- `Cannot read properties of undefined (reading 'Config')` in der Browser-Konsole und beim PDF-Export mit
  Decktape: Das Reveal-Mathe-Plugin ruft nach dem Laden `MathJax.Hub.Config` (MathJax-2-API) auf, MathJax 4 kennt das nicht. Harmlos, die Formeln setzt MathJax 4 trotzdem.
