# quarto-tinh

Neutrale Quarto-Extensions für Lehrunterlagen (Folien, Skript, Aufgaben). Der Name kommt vom vietnamesischen
*tính* (rechnen).

Die Extensions enthalten nur Layout und Stil. Was eine Einrichtung ausmacht (Logo, später ggf. Farben), kommt aus der `_brand.yml` des jeweiligen Projekts, Autor, Untertitel, Fußzeile usw. aus den Metadaten des Projekts.

## Formate

Formate heißen `tinh-<zweck>-<grundformat>`.

| Extension     | Format                 | Basis    | Inhalt                                                  |
|---------------|------------------------|----------|---------------------------------------------------------|
| `tinh-slides` | `tinh-slides-revealjs` | revealjs | Folien-Stil, Titelfolie mit Logo aus der Brand          |
| `tinh-slides` | `tinh-slides-typst`    | typst    | Folien als PDF mit touying, Theme `clean`, Titelfolie mit Logo aus der Brand |
| `tinh-notes`  | `tinh-notes-html`      | html     | Skript: Inhaltsverzeichnis, Logo aus der Brand über `toc-title` (bei Büchern und Websites stattdessen in der Seitenleiste) |
| `tinh-notes`  | `tinh-notes-pdf`       | pdf      | Skript als PDF (LaTeX) mit Index                        |
| `tinh-assignments` | `tinh-assignments-html` | html | Aufgabenblätter                                      |
| `tinh-assignments` | `tinh-assignments-typst` | typst | Aufgabenblätter als PDF (Typst), Schrift Liberation Sans |

`tinh-notes` enthält den Filter `latex-environment.lua` aus [quarto-ext/latex-environment](https://github.com/quarto-ext/latex-environment) (MIT, siehe `LICENSE-latex-environment`). Für PDF sind die Befehle `neuerbegriff`, `ja`, `nein` und die Umgebung `beispiel` voreingestellt (`commands`, `environments`). Geplant: Typst-Format für das Skript.

## Befehle

Klassen, die in allen Formaten gleich verwendet werden:

| Klasse                       | Wirkung                                  |
|------------------------------|------------------------------------------|
| `[Begriff]{.neuerbegriff}`   | neuer Begriff, dunkelrot (`accent2`)     |
| `[]{.ja}`, `[]{.nein}`       | grüner Haken, rotes Kreuz                |
| `[]{.down20}` usw.           | vertikaler Abstand, nur Folien (Typst: 10 bis 50, revealjs: auch `.upN` und weitere Werte) |

## Typst-Folien

`tinh-slides-typst` baut auf der touying-Bridge
[kazuyanagimoto/quarto-touying-typst](https://github.com/kazuyanagimoto/quarto-touying-typst) (MIT, siehe
`LICENSE-touying`) und dem Typst-Paket `touying-quarto-clean` auf. Übernommen und angepasst:
`touying.lua`, `environment.lua` (um die Befehle oben ergänzt), `shortcodes.lua`, `typst-template.typ`,
`typst-show.typ` (um das Logo ergänzt). Theme, Befehle und Titelfolie stehen in `tinh-slides.typ`. `page.typ`
ist Quartos Fassung ohne das Logo auf jeder Seite. Pausen mit `. . .`, Optionen `aspect-ratio` und `handout`
wie bei der Bridge.

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

Das Logo auf der Titelfolie ist `logo.medium` aus der `_brand.yml` des Projekts, z. B.

```yaml
logo:
  small: favicon.svg
  medium: logo.svg
```

Statt einer Datei kann `logo.medium` auch eine URL sein, die bei revealjs direkt verwendet wird (Typst kann keine Bilder aus dem Netz laden, dort gibt es dann kein Logo). Eine lokale Datei bettet der Filter `logo.lua` bei revealjs als Daten-URI ein, damit es ohne Pfade funktioniert (Dokumente in Unterordnern, `output-dir`, Zips). Quartos eigenes Logo unten rechts auf jeder Folie ist abgeschaltet (`logo: false`), es verweist bei `output-dir` absolut auf `/_brand/…` und ist dann kaputt. Bei Typst gibt `logo.lua` den Pfad relativ zum Dokument an die Titelfolie weiter, Quartos Logo auf jeder Seite entfällt (eigene `page.typ`). Ohne Brand gibt es kein Logo.

## Aktualisieren

```bash
quarto update matthiasbaitsch/quarto-tinh
```

## Testen

In `examples/` gibt es für jeden Zweck eine Datei mit den Elementen, die die Extension besonders behandelt, jeweils in allen Formaten des Zwecks: `slides.qmd`, `notes.qmd`, `assignments.qmd`. Die `_quarto.yml` im Wurzelverzeichnis macht das Repository zum Projekt, damit Quarto die Extensions aus `_extensions/` findet, rendert nur diese Beispiele und schreibt die Ausgabe nach `_output/`.

```bash
quarto render                        # alle Beispiele
quarto render examples/notes.qmd     # ein Beispiel
```

## Bekannte Meldungen

- `Cannot read properties of undefined (reading 'Config')` in der Browser-Konsole und beim PDF-Export mit
  Decktape: Das Reveal-Mathe-Plugin ruft nach dem Laden `MathJax.Hub.Config` (MathJax-2-API) auf, MathJax 4 kennt das nicht. Harmlos, die Formeln setzt MathJax 4 trotzdem.
