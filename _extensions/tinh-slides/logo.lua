-- Logo der Brand (logo.medium) auf der Titelfolie.
-- revealjs: Bild vor dem Titel (siehe titlepage.scss). Eine URL wird direkt verwendet, eine lokale SVG-Datei als
-- Daten-URI eingebettet, damit es ohne Pfade und Kopieren funktioniert (Unterordner, output-dir, Zips).
-- typst: Pfad relativ zum Dokument in der Variable tinh-logo (siehe typst-show.typ und tinh-slides.typ), nur lokale
-- Dateien (Typst lädt keine Bilder aus dem Netz).
local function svg_data_uri(file)
  local f = io.open(file, "r")
  if f == nil then
    return nil
  end
  local svg = f:read("a")
  f:close()
  local encoded = svg:gsub("[^A-Za-z0-9%-%._~ /:=]", function(c)
    return string.format("%%%02X", string.byte(c))
  end):gsub(" ", "%%20")
  return "data:image/svg+xml," .. encoded
end

function Meta(meta)
  local logo = quarto.brand.get_logo("light", "medium")
  if logo == nil or logo.path == nil then
    return meta
  end
  local is_url = logo.path:match("^https?://") ~= nil
  if is_url and quarto.doc.is_format("typst") then
    quarto.log.warning("tinh-slides: Typst kann das Logo nicht aus dem Netz laden: " .. logo.path)
    return meta
  end
  local file = pandoc.path.join({ quarto.project.directory or ".", logo.path })
  if quarto.doc.is_format("typst") then
    local dir = pandoc.path.directory(quarto.doc.input_file)
    meta["tinh-logo"] = pandoc.RawInline("typst", pandoc.path.make_relative(file, dir, true))
    return meta
  end
  local uri = is_url and logo.path or svg_data_uri(file)
  if uri == nil then
    quarto.log.warning("tinh-slides: Logo nicht gefunden: " .. logo.path)
    return meta
  end
  local title = meta["title"] and pandoc.Inlines(meta["title"]) or pandoc.Inlines({})
  title:insert(1, pandoc.Image({}, uri, "", pandoc.Attr("", { "title-logo" })))
  meta["title"] = title
  return meta
end
