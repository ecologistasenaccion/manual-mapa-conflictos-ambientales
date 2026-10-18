-- ---------------------------------------------------------------------------
--  Traduce al PDF las clases propias del manual que en la web resuelve el CSS.
--  [Guardar]{.ui}        -> \ui{Guardar}
--  [Inicio]{.ruta}       -> \ruta{Inicio}
--  [alta]{.gravedad-alta}-> \gravedadalta{alta}
--  ::: {.pasos} ... :::  -> \begin{pasos} ... \end{pasos}
-- ---------------------------------------------------------------------------

if not (FORMAT:match 'latex' or FORMAT:match 'pdf') then
  return {}
end

-- Clase CSS -> orden LaTeX
local ordenes = {
  ['ui']             = 'ui',
  ['ruta']           = 'ruta',
  ['gravedad-alta']  = 'gravedadalta',
  ['gravedad-media'] = 'gravedadmedia',
  ['gravedad-baja']  = 'gravedadbaja',
}

-- Clase CSS -> entorno LaTeX
local entornos = {
  ['pasos']   = 'pasos',
  ['tarjeta'] = 'tarjeta',
}

local function crudo(texto)
  return pandoc.RawInline('latex', texto)
end

function Span(el)
  for _, clase in ipairs(el.classes) do
    local orden = ordenes[clase]
    if orden then
      local contenido = el.content
      table.insert(contenido, 1, crudo('\\' .. orden .. '{'))
      table.insert(contenido, crudo('}'))
      return contenido
    end
  end
  return el
end

function Div(el)
  for _, clase in ipairs(el.classes) do
    local entorno = entornos[clase]
    if entorno then
      local bloques = el.content
      table.insert(bloques, 1, pandoc.RawBlock('latex', '\\begin{' .. entorno .. '}'))
      table.insert(bloques, pandoc.RawBlock('latex', '\\end{' .. entorno .. '}'))
      return bloques
    end
  end
  return el
end
