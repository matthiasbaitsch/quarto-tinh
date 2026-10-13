-- Logo der Brand (logo.medium) als Bild vor dem Titel der Titelfolie, siehe titlepage.scss. Das SVG wird als Daten-URI
-- eingebettet, damit es ohne Pfade und Kopieren funktioniert (Unterordner, output-dir, Zips).
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
  local uri = svg_data_uri(pandoc.path.join({ quarto.project.directory or ".", logo.path }))
  if uri == nil then
    quarto.log.warning("tinh-folien: Logo nicht gefunden: " .. logo.path)
    return meta
  end
  local title = meta["title"] and pandoc.Inlines(meta["title"]) or pandoc.Inlines({})
  title:insert(1, pandoc.Image({}, uri, "", pandoc.Attr("", { "title-logo" })))
  meta["title"] = title
  return meta
end
