# Sesión 02 — Manipulación, visualización y pipeline integrador

> **Curso:** Fundamentos de programación en Python y R · PEBIBA XVIII · 2026
> **Duración:** 4h (Día 2)

---

## Contenido de esta carpeta

```
02_Sesion_Manipulacion_Pipeline/
├── README.md                                          Este archivo
├── notebooks/
│   ├── S02_Manipulacion_y_Pipeline_PY_Alumnos.ipynb   Notebook Python (con # TODO: para que completes)
│   ├── S02_Manipulacion_y_Pipeline_R.ipynb            Notebook espejo en R (completo, para leer)
│   ├── S02_Manipulacion_y_Pipeline_ROSETTA.md         Equivalencias Python ↔ R (extiende S01)
│   └── S02_Manipulacion_y_Pipeline_TRAPS.md           Trampas adicionales (#4 a #10)
├── slides/
│   ├── S02_Slides.md                                  Slides en Marp (markdown)
│   └── S02_Slides.pdf                                 Slides en PDF
├── ejercicios/
│   └── S02_Ejercicios.md                              Rampa de 7 ejercicios graduados
└── data/                                              (vacío — usa el dataset de la Sesión 01)
```

## Cómo usar este material

### Antes de la sesión
1. Confirma que `01_Sesion_Sintaxis_Carga/data/acme_ventas.csv` existe (lo usaremos también aquí).
2. Repasa `S01_Sintaxis_y_Carga_TRAPS.md` — es prerrequisito.
3. Abre el notebook Alumno (`S02_..._PY_Alumnos.ipynb`) en VS Code o Jupyter Lab.

### Durante la sesión (4h)

| Bloque | Tiempo | Qué pasa |
|---|---|---|
| 0 — Recapitulación | 15 min | Quiz colectivo con preguntas clave de Sesión 01 |
| 1 — Arena Python vs R | 75 min | Resolvemos las mismas 3 preguntas de negocio en ambos lenguajes, lado a lado |
| 2 — Visualización | 65 min | matplotlib/seaborn (Python) vs ggplot2 (R) |
| 3 — ¿Python o R? | 30 min | Decides en 5 escenarios reales antes de discutir la heurística |
| 4 — Mini-pipeline | 35 min | **Construyes tu pipeline reproducible** — el clímax del taller |
| 5 — Cierre | 5 min | Encuesta corta |

### Después de la sesión
- (Opcional) **Mini-proyecto** con dataset NUEVO: ver `07Evaluación/miniproyecto/enunciado.md`.
- Llena la encuesta: `07Evaluación/encuesta_post_curso.md` (5 min — alimenta la próxima cohorte).

## Lo que aprenderás en esta sesión

| Competencia | Lo verás en |
|---|---|
| CT-04 — Diagnóstico de calidad de datos | Refuerzo (ya introducida en S01) |
| CT-05 — Manipular datos tabulares | Foco principal — Arena pandas vs dplyr |
| CT-06 — Decidir Python o R según el problema | Bloque 3 — 5 escenarios + heurística |
| CT-07 — Construir un mini-pipeline end-to-end | Bloque 4 — clímax del taller |

## Próximo paso

Después de Sesión 02:
- (Opcional) entrega el mini-proyecto en los 7 días siguientes — recibirás feedback escrito.
- Conserva los notebooks como **plantilla** para tu trabajo real: el lunes cambias el CSV y los nombres de las columnas, el código sigue funcionando.
