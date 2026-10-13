# quarto-tinh

Neutrale Quarto-Extensions für Lehrunterlagen (Folien, Skript, Aufgaben). Der Name kommt vom vietnamesischen
*tính* (rechnen).

Die Extensions enthalten nur Layout und Stil. Was eine Einrichtung ausmacht (Logo, später ggf. Farben), kommt aus
der `_brand.yml` des jeweiligen Projekts, Autor, Untertitel, Fußzeile usw. aus den Metadaten des Projekts.

## Formate

Formate heißen `tinh-<zweck>-<grundformat>`.

| Extension     | Format                 | Basis    | Inhalt                                                  |
|---------------|------------------------|----------|---------------------------------------------------------|
| `tinh-folien` | `tinh-folien-revealjs` | revealjs | Folien-Stil, Titelfolie mit Logo aus der Brand          |
| `tinh-folien` | `tinh-folien-html`     | html     | Stil für HTML-Seiten                                    |

Geplant: `tinh-folien-typst` (Folien als PDF mit touying), `tinh-skript-*`, `tinh-aufgaben-*`.

## Einbinden

```bash
quarto add matthiasbaitsch/quarto-tinh
```

Danach in `_quarto.yml` oder im Dokument:

```yaml
format:
  tinh-folien-revealjs: default
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

Der Filter `logo.lua` bettet das SVG als Daten-URI ein, damit es ohne Pfade funktioniert (Dokumente in
Unterordnern, `output-dir`, Zips). Ohne Brand gibt es kein Logo. Quartos eigenes Logo unten rechts auf jeder
Folie ist abgeschaltet (`logo: false`), es verweist bei `output-dir` absolut auf `/_brand/…` und ist dann kaputt.

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
