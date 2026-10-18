# Manual de uso · Mapa de Conflictos Ambientales

Manual de uso del Mapa de Conflictos Ambientales de Ecologistas en Acción.
https://conflictosambientales.ecologistasenaccion.org/

## Autor

Alfredo Sánchez Alberca (asalber@riseup.net)

## Requisitos

- Quarto ≥ 1.4 (`quarto --version`)
- Una distribución de LaTeX para el PDF (TeX Live completo o `quarto install tinytex`)

## Compilar

```bash
make todo     # web + PDF
make web      # solo HTML, en _book/
make pdf      # solo PDF, en carpeta docs/
make ver      # previsualización con recarga automática
make limpiar  # borra docs/ y .quarto/
```

Sin `make`: `quarto render`, `quarto render --to html`, `quarto preview`.

El resultado queda en `docs/` (`index.html` y el PDF del libro).

## Estructura

```
_quarto.yml                 configuración del libro y de los dos formatos
_variables.yml              textos reutilizables ({{< var app.url >}})
index.qmd                   presentación
01..11-*.qmd                capítulos, agrupados en partes
a..d-*.qmd                  apéndices
referencias.qmd / .bib      bibliografía
scss/estilos.scss           tema claro (web)
scss/estilos-oscuro.scss    tema oscuro (web)
tex/preambulo.tex           estilo del PDF (colores, capítulos, cabeceras)
tex/before-body.tex         portada y créditos del PDF
_extra/encabezado.html      metadatos y retoques del <head>
assets/                     portada, icono y capturas de pantalla
```

## Cómo escribir contenido

Los elementos visuales propios del manual funcionan **igual en web y en PDF**:

| Qué quieres | Cómo se escribe |
|---|---|
| Botón o campo | `[Guardar]{.ui}` |
| Ruta de menú | `[Inicio › Archivo]{.ruta}` |
| Tecla | `<kbd>Ctrl</kbd>` |
| Pasos numerados | `::: {.pasos}` … `:::` con una lista `1. 2. 3.` |
| Tarjeta destacada | `::: {.tarjeta}` … `:::` |
| Etiqueta de gravedad | `[alta]{.gravedad-alta}` |
| Captura | `![Pie.](assets/capturas/x.png){#fig-x .captura width=90%}` |
| Aviso | `::: {.callout-tip}` … `:::` (`note`, `tip`, `warning`, `important`) |

Las variables de `_variables.yml` se insertan con `{{< var app.url >}}`.

## Añadir un capítulo

1. Crea el fichero `12-mi-capitulo.qmd` empezando por `# Título`.
2. Añádelo a la lista `chapters:` de `_quarto.yml`, dentro de la parte que corresponda.

## Publicación

Para publicar la web en GitHub Pages: `quarto publish gh-pages` desde esta
carpeta, o un flujo de trabajo de GitHub Actions con `quarto-dev/quarto-actions`.
