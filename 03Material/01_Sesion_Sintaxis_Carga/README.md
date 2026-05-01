# Sesión 01 — De Excel/SQL a Python+R: sintaxis y carga de datos

> **Curso:** Fundamentos de programación en Python y R · PEBIBA XVIII · 2026
> **Duración:** 4h (Día 1)

---

## Contenido de esta carpeta

```
01_Sesion_Sintaxis_Carga/
├── README.md                                  Este archivo
├── notebooks/
│   ├── S01_Sintaxis_y_Carga_PY_Alumnos.ipynb  Notebook Python (con # TODO: para que completes)
│   ├── S01_Sintaxis_y_Carga_R.ipynb           Notebook espejo en R (completo, para leer)
│   ├── S01_Sintaxis_y_Carga_ROSETTA.md        Tabla de equivalencias Python ↔ R
│   └── S01_Sintaxis_y_Carga_TRAPS.md          5 trampas asimétricas que vas a encontrar
├── slides/
│   ├── S01_Slides.md                          Slides en Marp (markdown)
│   └── S01_Slides.pdf                         Slides en PDF (para imprimir o leer offline)
├── ejercicios/
│   └── S01_Ejercicios.md                      Rampa de 7 ejercicios graduados
└── data/
    ├── acme_ventas.csv                        Dataset (5,000 filas × 12 columnas)
    └── generar_dataset.py                     Script para regenerarlo si lo borras
```

## Cómo usar este material

### Antes de la sesión
1. Verificar que el dataset `data/acme_ventas.csv` existe (si no, ejecutar `python generar_dataset.py` en esa carpeta).
2. Verificar que el kernel R funciona en Jupyter (ver `00_Onboarding/README.md`).
3. Abrir el notebook Alumno (`S01_..._PY_Alumnos.ipynb`) en VS Code o Jupyter Lab.

### Durante la sesión
- Sigues los slides (`slides/S01_Slides.pdf`) acompañando la explicación en vivo.
- Vas completando los `# TODO:` del notebook Alumno con tu propio código.
- Cuando aparezca **Trampa #1** o **Trampa #2**, cambiamos al notebook R espejo para verlo lado a lado.

### Después de la sesión
- Termina los `# TODO:` que no alcanzaste a completar en clase.
- Lee `S01_..._TRAPS.md` (las 5 trampas asimétricas) — tarea pre-Sesión 02, **15 min**.
- Hojea `S01_..._ROSETTA.md` y guárdalo como referencia rápida durante todo el curso.

## Lo que aprenderás en esta sesión

| Competencia | Lo verás en |
|---|---|
| CT-01 — Modelo mental Python vs R | Trampa #1 (mutación): `y = x` no copia |
| CT-02 — Lectura idiomática bilingüe | Notebook R espejo |
| CT-03 — Cargar CSV con encoding y separador | Sección 6 del notebook |
| CT-04 — Diagnosticar calidad de datos (intro) | Sección 7 del notebook (`.info()`, `.describe()`, `df.isnull()`) |

## Próximo paso

- **Pre-Sesión 02:** lee las 5 trampas (`TRAPS.md`) y verifica que tu kernel R sigue funcionando.
- **Sesión 02:** trabajaremos manipulación tabular (filter / groupby / agg) y construirás un pipeline integrador.
