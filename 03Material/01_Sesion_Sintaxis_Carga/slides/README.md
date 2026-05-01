# Slides Sesión 01 (Marp)

## Cómo previsualizar y exportar

### Opción A — VS Code (recomendado)

1. Instalar extensión **"Marp for VS Code"** de Marp Team.
2. Abrir `S01_Slides.md` en VS Code.
3. Click en el ícono de presentación (esquina superior derecha) → **Open Preview**.
4. Para exportar PDF: comando `Marp: Export Slide Deck` → seleccionar PDF.

### Opción B — Marp CLI

```bash
# Instalar marp-cli (una sola vez)
npm install -g @marp-team/marp-cli

# Previsualizar (servidor local)
marp --preview S01_Slides.md

# Exportar PDF
marp --pdf S01_Slides.md

# Exportar PowerPoint (pptx)
marp --pptx S01_Slides.md

# Exportar HTML standalone
marp --html S01_Slides.md
```

## Identidad visual aplicada

Este deck respeta la guía de marca UNI:

| Elemento | Especificación |
|---|---|
| Color principal | `#8A1525` UNI Crimson (títulos, slide de portada) |
| Color secundario | `#2C3E50` Engineering Slate (cuerpo, transiciones) |
| Fondo | `#FAFAFA` Paper White (no blanco puro) |
| Acentos | `#10B981` éxito, `#EF4444` riesgo, `#F59E0B` warning |
| Tipografía | Montserrat (títulos), Lato (cuerpo), Fira Code (código) |
| Cuerpo mínimo | 22pt (regla "≥18pt en proyector") |
| Slides totales | ~25 (regla "30-40 max para sesión 4h") |
| Layout | Mezcla 40/60 texto/visual + slides de quiebre |

## Tipos de slides usados

- `<!-- _class: title -->` — slide de portada y cierre (fondo crimson)
- `<!-- _class: break -->` — slide de transición (fondo slate)
- `<!-- _class: results -->` — slide oscuro para resaltar datos/gráficas
- Default — contenido estándar

## Cuándo usar cada tipo

- Cada bloque numerado (1, 2, 3, 4, 5, 6) tiene su slide de quiebre.
- El "money slide" es el de los 5 hallazgos (slide-results) — donde el alumno produce.
- Portada y cierre con identidad UNI fuerte.
