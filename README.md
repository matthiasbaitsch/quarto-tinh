# quarto-tinh

Quarto-Extensions für Lehrunterlagen: Folien, Skript, Aufgabenblätter und Notebooks. Der Name kommt vom vietnamesischen *tính* (rechnen).

Die Extensions liefern nur Layout und Stil. Logo (und später ggf. Farben) kommen aus der `_brand.yml` des Projekts, Autor, Untertitel, Fußzeile usw. aus dessen Metadaten.

## Einbinden

```bash
quarto add matthiasbaitsch/quarto-tinh      # einmal, Ordner _extensions/ einchecken
quarto update matthiasbaitsch/quarto-tinh   # später aktualisieren
```

Dann das Format in `_quarto.yml` oder im Dokument wählen:

```yaml
format:
  tinh-slides-revealjs: default
```

Eigene Optionen in `_quarto.yml` überschreiben die der Extension.

## Formate

| Zweck         | Format                   | Ausgabe                                         |
|---------------|--------------------------|-------------------------------------------------|
| Folien        | `tinh-slides-revealjs`   | HTML (revealjs)                                 |
|               | `tinh-slides-typst`      | PDF (Typst, touying)                            |
| Skript        | `tinh-notes-html`        | HTML mit Inhaltsverzeichnis                     |
|               | `tinh-notes-pdf`         | PDF (LaTeX) mit Index                           |
| Aufgabenblatt | `tinh-assignments-html`  | HTML                                            |
|               | `tinh-assignments-typst` | PDF (Typst)                                     |
| Notebook      | `tinh-notebook-ipynb`    | Jupyter-Notebook                                |
|               | `tinh-notebook-html`     | HTML, wie Aufgabenblatt                         |
|               | `tinh-notebook-typst`    | PDF (Typst), wie Aufgabenblatt                  |

## Beispiele

Die Beispiele in `examples/` werden bei jedem Push auf `main` gerendert und auf GitHub Pages veröffentlicht. Sie nutzen die Brand der Hochschule Bochum ([hsbo-brand](https://github.com/matthiasbaitsch/hsbo-brand)).

| Beispiel                                       | HTML | PDF |
|------------------------------------------------|------|-----|
| Folien (`slides.qmd`)                          | [revealjs](https://matthiasbaitsch.github.io/quarto-tinh/examples/slides.html) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/slides.pdf) |
| Skript (`notes.qmd`)                           | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/notes.html) | [LaTeX](https://matthiasbaitsch.github.io/quarto-tinh/examples/notes.pdf) |
| Aufgaben (`assignments.qmd`)                   | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/assignments.html) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/assignments.pdf) |
| Aufgaben, Lösung (`assignments-solution.qmd`)  | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/assignments-solution.html) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/assignments-solution.pdf) |
| Aufgaben mit Literatur (`assignments-bib.qmd`) | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/assignments-bib.html) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/assignments-bib.pdf) |
| Makros in Folien (`macros.qmd`)                | [revealjs](https://matthiasbaitsch.github.io/quarto-tinh/examples/macros-slides.html) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/macros-slides.pdf) |
| Makros im Skript (`macros.qmd`)                | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/macros-notes.html) | [LaTeX](https://matthiasbaitsch.github.io/quarto-tinh/examples/macros-notes.pdf) |
| Makros in Aufgaben (`macros.qmd`)              | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/macros-assignments.html) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/macros-assignments.pdf) |
| Notebook, Lösung und Gerüst (`notebook.qmd`)   | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook.html), [ipynb](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook.ipynb) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook.pdf) |
| Notebook, Lösung (`notebook-solution.qmd`)     | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook-solution.html), [ipynb](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook-solution.ipynb) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook-solution.pdf) |
| Notebook, Gerüst (`notebook-scaffold.qmd`)     | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook-scaffold.html), [ipynb](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook-scaffold.ipynb) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook-scaffold.pdf) |
| Notebook, leer (`notebook-blank.qmd`)          | [HTML](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook-blank.html), [ipynb](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook-blank.ipynb) | [Typst](https://matthiasbaitsch.github.io/quarto-tinh/examples/notebook-blank.pdf) |

## Schreiben

### Hervorhebungen

| Eingabe                      | Ergebnis                              |
|------------------------------|---------------------------------------|
| `[Begriff]{.neuerbegriff}`   | neuer Begriff, dunkelrot              |
| `[range]{.eng}`              | englischer Begriff, kursiv            |
| `[]{.ja}`, `[]{.nein}`       | grüner Haken, rotes Kreuz             |
| `[]{.down20}` usw.           | vertikaler Abstand, nur auf Folien    |

Gilt in allen Formaten außer `tinh-assignments-typst`. Abstände: Typst `.down10` bis `.down50`, revealjs auch `.upN` und weitere Werte. Definitionen (`#def-`) und Beispiele (`#exm-`) bekommen im Skript einen Kasten.

### Formeln und Einheiten

Diese Makros gibt es in allen Formaten:

| Makro                                              | Ergebnis                                 |
|----------------------------------------------------|------------------------------------------|
| `\SI{20}{\metre}`, `\si{\newton}`, `\num{3.5}`     | Wert und Einheit wie bei siunitx         |
| `\metre`, `\newton`, `\pascal`, ...                | Einheiten, siehe `units.tex`             |
| `\kilo`, `\per`, `\squared`, `\tothe{3}`, ...      | Vorsätze und Potenzen                    |
| `\R`                                               | $\mathbb{R}$                             |
| `\mmat{a & b \\ c & d}`                            | Matrix in runden Klammern                |
| `\mtran`                                           | transponiert, $^\top$                    |

`\SI{…}{…}` darf auch im Fließtext stehen. Im LaTeX-PDF setzt siunitx die Einheiten, sonst die Extension. Ohne die übrigen tinh-Formate: `filters: [tinh-macros]`.

### Aufgabenblätter: Lösung und Gerüst

Ein Aufgabenblatt kann Lösung und Gerüst in derselben Datei enthalten. Das Gerüst ist, was die Lösung ersetzt, z.B. eine leere Tabelle zum Ausfüllen. Was in beiden Fassungen stehen soll, etwa Hinweise, bleibt unmarkiert.

```markdown
::: {#exr-mittelwert}
## Mittelwert

Bestimmen Sie den Mittelwert und tragen Sie die Ergebnisse in die Tabelle ein.

Hinweis: Der Mittelwert ist $\bar{x} = \frac{1}{n} \sum_{i=1}^{n} x_i$.

::: {.tinh-scaffold}
| Größe                | Wert |
|----------------------|-----:|
| Anzahl $n$           |      |
| Mittelwert $\bar{x}$ |      |
:::

::: {.tinh-solution}
| Größe                |                      Wert |
|----------------------|--------------------------:|
| Anzahl $n$           |                         2 |
| Mittelwert $\bar{x}$ | \SI{973.55}{\milli\metre} |
:::
:::
```

Die Variable `tinh-target` wählt die Fassung:

| `tinh-target`  | Lösung     | Gerüst     | Verwendung                       |
|----------------|------------|------------|----------------------------------|
| nicht gesetzt  | markiert   | markiert   | Arbeitsfassung                   |
| `solution`     | markiert   | –          | Lösung                           |
| `scaffold`     | –          | ja         | Fassung für die Studierenden     |
| `blank`        | –          | –          | nur die Aufgabe                  |

*Markiert* heißt: farbiger Balken mit „Lösung“ bzw. „Gerüst“. Direkt aufeinanderfolgende Blöcke bekommen nur eine Markierung.

Ein Block `::: {.tinh-work}` steht nur in der Arbeitsfassung (ohne `tinh-target`), unmarkiert, z.B. Code, der Pakete und Daten lädt, damit sich die Lösungen testen lassen. Die Engine führt den Code darin aber in jeder Fassung aus, der Filter läuft erst danach.

Mit `tinh-solution-task: title` zeigt die Lösung von jeder Aufgabe nur den Titel, Aufgaben ohne Lösung bekommen „Keine Lösung.“

```bash
quarto render aufgaben.qmd -M tinh-target:solution -M tinh-solution-task:title
```

### Notebooks

Notebooks werden als `.qmd` geschrieben. Die Sprache der ersten Code-Zelle (z.B. `julia`) bestimmt den Kernel, Titel und Untertitel kommen in die erste Zelle. Lösung und Gerüst funktionieren wie bei Aufgabenblättern:

````markdown
Berechnen Sie den Mittelwert.

::: {.tinh-solution}
```{julia}
xbar = sum(x) / length(x)
```
:::
::: {.tinh-scaffold}
```{julia}
# xbar = ...
```
:::
````

- Fehlt nach einer Lösung mit Code das Gerüst, steht in der Fassung `scaffold` eine leere Code-Zelle `# ...`.
- Im Lösungs-Notebook (`ipynb`) wird nichts markiert.

Für das `ipynb` darf der Code nicht laufen, dafür braucht es `engine: markdown`. Für HTML und PDF ist eine Engine wie `julia` sinnvoll. Die Engine lässt sich nicht je Format setzen, nur im Kopf der Datei oder mit `-M engine:…` (wirkt nur, wenn die Datei einen YAML-Kopf hat):

```bash
quarto render notebook.qmd --to tinh-notebook-html -M tinh-target:solution
quarto render notebook.qmd --to tinh-notebook-ipynb -M engine:markdown -M tinh-target:scaffold -o notebook-scaffold.ipynb
```

Die Engine führt auch den Code im Gerüst aus. Lücken daher als Kommentar schreiben: `# xbar = ...`, nicht `xbar = # ...`.

### Grafiken und Logo

- Grafiken stehen zentriert. Ausnahmen: Bilder im Fließtext, Bilder mit eigenem `fig-align`, in revealjs Bilder mit `.absolute` oder `.r-stretch`.
- Das Logo kommt aus der `_brand.yml`: `logo.small` unten rechts auf jeder Folie (Seitenzahl dann unten links), `logo.medium` oben rechts auf Aufgabenblättern und Notebooks (Typst). HTML-Dokumente haben kein Logo.

## Entwicklung

### Beispiele rendern

Die `_quarto.yml` macht das Repository zum Projekt. Quarto findet so die Extensions in `_extensions/`, rendert nur `examples/` und schreibt nach `__output/`.

```bash
quarto render                       # alle Beispiele
quarto render examples/notes.qmd    # ein Beispiel
make clean                          # Ausgaben löschen
```

### Eingebettete Extensions

- `tinh-notes` enthält [quarto-ext/latex-environment](https://github.com/quarto-ext/latex-environment) (MIT, siehe `LICENSE-latex-environment`).
- `tinh-slides-typst` enthält die touying-Bridge [kazuyanagimoto/quarto-touying-typst](https://github.com/kazuyanagimoto/quarto-touying-typst) (MIT, siehe `LICENSE-touying`) in `_extensions/tinh-slides/_extensions/`. Theme und Befehle stehen in `tinh-slides.typ`, Pausen mit `. . .`, Optionen `aspect-ratio` und `handout` wie bei der Bridge.

Beide unverändert. Aktualisieren mit `make update-extensions`, danach sagt `make`, was zu prüfen ist.

### Gemeinsame Teile

- `tinh-common`: Lösung und Gerüst (`solution-scaffold.lua`), Grafiken zentrieren (`center-images.lua`).
- `tinh-macros`: Makros (`math.tex`, `units.tex`, Filter `macros.lua`).

Die Formate binden diese Filter über relative Pfade ein.

### Bekannte Meldungen

- `Cannot read properties of undefined (reading 'Config')` in der Browser-Konsole und beim PDF-Export mit Decktape: Das Reveal-Mathe-Plugin ruft die MathJax-2-API auf, MathJax 4 kennt sie nicht. Harmlos.
