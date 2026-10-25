.PHONY: render update-extensions

# Alle Beispiele rendern (Ausgabe in __output)
render:
	quarto render

# Eingebettete Extensions auf den neuesten Stand bringen
update-extensions:
	quarto add kazuyanagimoto/quarto-touying-typst --embed tinh-slides --no-prompt
	quarto add quarto-ext/latex-environment --embed tinh-notes --no-prompt
	@echo
	@echo "Danach:"
	@echo "  1. git diff _extensions/*/_extensions prüfen"
	@echo "  2. Haben sich in der Bridge Filter, Shortcodes oder Partials geändert"
	@echo "     (_extensions/tinh-slides/_extensions/kazuyanagimoto/touying/_extension.yml),"
	@echo "     die Pfade in _extensions/tinh-slides/_extension.yml anpassen"
	@echo "  3. touying-Version im Import von typst-template.typ (Bridge) mit der von"
	@echo "     @preview/touying-quarto-clean vergleichen, ggf. Version in tinh-slides.typ erhöhen"
	@echo "  4. quarto render und slides.pdf, notes.pdf ansehen"
	@echo "  5. version in _extensions/tinh-slides/_extension.yml bzw. tinh-notes erhöhen, committen"
