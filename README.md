# quarto-tinh

Neutrale Quarto-Extensions für Lehrunterlagen (Folien, Skript, Aufgaben). Der Name kommt vom vietnamesischen
*tính* (rechnen).

Die Extensions enthalten nur Layout und Stil. Was eine Einrichtung ausmacht (Logo, später ggf. Farben), kommt aus
der `_brand.yml` des jeweiligen Projekts, Autor, Untertitel, Fußzeile usw. aus den Metadaten des Projekts.

## Formate

Formate heißen `tinh-<zweck>-<grundformat>`.

| Extension     | Format                 | Basis    | Inhalt                                                  |
|---------------|------------------------|----------|---------------------------------------------------------|
| `tinh-slides` | `tinh-slides-revealjs` | revealjs | Folien-Stil, Titelfolie mit Logo aus der Brand          |
| `tinh-slides` | `tinh-slides-typst`    | typst    | Folien als PDF mit touying, Theme `clean`, Titelfolie mit Logo aus der Brand |
| `tinh-slides` | `tinh-slides-html`     | html     | Stil für HTML-Seiten                                    |

Geplant: `tinh-notes-*` (Skript), `tinh-assignments-*` (Aufgabenblätter).

## Befehle

Klassen, die in allen Formaten gleich verwendet werden (bisher nur in `tinh-slides-typst` umgesetzt):

| Klasse                       | Wirkung                                  |
|------------------------------|------------------------------------------|
| `[Begriff]{.neuerbegriff}`   | neuer Begriff, dunkelrot und fett        |
| `[]{.ja}`, `[]{.nein}`       | grüner Haken, rotes Kreuz                |
| `[]{.down20}` usw.           | vertikaler Abstand (10, 20, 30, 40, 50)  |

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

Bei revealjs bettet der Filter `logo.lua` das SVG als Daten-URI ein, damit es ohne Pfade funktioniert
(Dokumente in Unterordnern, `output-dir`, Zips). Quartos eigenes Logo unten rechts auf jeder Folie ist
abgeschaltet (`logo: false`), es verweist bei `output-dir` absolut auf `/_brand/…` und ist dann kaputt. Bei
Typst gibt `logo.lua` den Pfad relativ zum Dokument an die Titelfolie weiter, Quartos Logo auf jeder Seite
entfällt (eigene `page.typ`). Ohne Brand gibt es kein Logo.

## Aktualisieren

```bash
quarto update matthiasbaitsch/quarto-tinh
```

## Testen

`template.qmd` (Folien) und `template-html.qmd` (HTML) enthalten die Elemente, die das Stylesheet besonders
behandelt.

```bash
quarto render template.qmd
quarto render template-html.qmd
```

## Bekannte Meldungen

- `Cannot read properties of undefined (reading 'Config')` in der Browser-Konsole und beim PDF-Export mit
  Decktape: Das Reveal-Mathe-Plugin ruft nach dem Laden `MathJax.Hub.Config` (MathJax-2-API) auf, MathJax 4 kennt
  das nicht. Harmlos, die Formeln setzt MathJax 4 trotzdem.
