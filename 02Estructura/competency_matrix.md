# Matriz de Competencias Terminales — Fundamentos de Python y R


> Formato: **ABCD** (Audience, Behavior, Condition, Degree) + nivel **Bloom revisada** (Anderson & Krathwohl, 2001).


## Distribución Bloom

| Nivel | # Competencias | Competencias | % |
|---|---|---|---|
| Recordar | 0 | — | 0% |
| Comprender | 2 | CT-01, CT-02 | 29% |
| Aplicar | 3 | CT-03, CT-04, CT-05 | 43% |
| Analizar | 1 | CT-06 | 14% |
| Evaluar | 0 | — | 0% |
| Crear | 1 | CT-07 | 14% |
| **Total** | **7** | | **100%** |

> **Razón de la distribución:** curso fundacional de 8h para profesionales sin programación previa. Mayoría en *Aplicar* porque el resultado terminal es "construir un pipeline" — verbo de hacer, no de saber. Niveles altos (Analizar/Crear) reservados para el cierre del día 2 cuando ya hay base operativa.

---

## Competencias

### CT-01 — Modelo mental de la programación
- **Bloom:** Comprender (verbo: explicar)
- **Audience (A):** El profesional egresado del taller
- **Behavior (B):** explica cómo se almacenan y manipulan datos en memoria — diferenciando el modelo de Python (objetos referenciados, listas heterogéneas) del modelo de R (copy-on-modify, vectores homogéneos).
- **Condition (C):** dado un fragmento de código de 5–10 líneas que mute o copie estructuras de datos.
- **Degree (D):** identificando correctamente el comportamiento esperado en al menos 4 de 5 casos.
- **Sesión que la cubre:** S01
- **Evaluada en:** participación intra-sesión (Quiz 1.2 — predicción de output)
- **Ejercicios:** ver carpeta de la sesión correspondiente

### CT-02 — Lectura idiomática bilingüe
- **Bloom:** Comprender (verbo: leer/interpretar)
- **A:** El profesional egresado del taller
- **B:** lee fragmentos de código Python y R no escritos por él/ella e identifica qué hacen.
- **C:** dado un script de 20–30 líneas en cualquiera de los dos lenguajes, sin ejecutarlo.
- **D:** describiendo en lenguaje natural el resultado esperado y los efectos secundarios (mutaciones, archivos generados).
- **Sesión que la cubre:** S01 (introducción), reforzada en S02
- **Evaluada en:** Quiz 2.1 (lectura cruzada)
- **Ejercicios:** Parsons Problems

### CT-03 — Carga de datos desde CSV
- **Bloom:** Aplicar (verbo: ejecutar)
- **A:** El profesional egresado del taller
- **B:** carga un dataset desde un archivo CSV usando `pandas.read_csv` en Python y `readr::read_csv` en R, manejando encoding, separador y tipos de columnas.
- **C:** dado un CSV con encoding ambiguo (UTF-8 o latin1) y separador no estándar (`;`).
- **D:** sin perder filas, sin alterar tipos, en menos de 5 líneas de código por lenguaje.
- **Sesión que la cubre:** S01
- **Evaluada en:** taller intra-clase (cargar dataset de ventas Acme Corp)
- **Ejercicios:** PRIMM (predict-then-run con encoding tricky)

### CT-04 — Diagnóstico de calidad de datos
- **Bloom:** Aplicar (verbo: examinar)
- **A:** El profesional egresado del taller
- **B:** inspecciona un DataFrame/tibble recién cargado para identificar tipos de columnas, valores nulos, duplicados y rangos sospechosos.
- **C:** dado un dataset de ventas con ~5000 filas y 12 columnas, sin documentación previa.
- **D:** produciendo un resumen escrito de 5–8 hallazgos accionables en menos de 10 minutos.
- **Sesión que la cubre:** S01 (introducción), profundizada en S02
- **Evaluada en:** taller día 2 (diagnóstico inicial del dataset del pipeline)
- **Ejercicios:** PRIMM + ejercicio independiente

### CT-05 — Manipulación tabular: filtrar, seleccionar, agregar
- **Bloom:** Aplicar (verbo: transformar)
- **A:** El profesional egresado del taller
- **B:** filtra filas por condición, selecciona columnas, agrupa y agrega usando `pandas` (`.loc`, `.query`, `.groupby`) en Python y `dplyr` (`filter`, `select`, `group_by`, `summarise`) en R.
- **C:** dado un dataset de ventas y 3 preguntas de negocio (top regiones, ventas por mes, % crecimiento).
- **D:** respondiendo las 3 preguntas en ambos lenguajes, con tabla resultado verificable.
- **Sesión que la cubre:** S02
- **Evaluada en:** taller principal día 2 (Arena Python vs R)
- **Ejercicios:** Faded guidance (worked → scaffolded → independent)

### CT-06 — Decisión Python vs R según problema
- **Bloom:** Analizar (verbo: comparar/elegir)
- **A:** El profesional egresado del taller
- **B:** decide qué lenguaje usar (Python o R) ante un problema de datos, justificando la elección con criterios técnicos y de contexto (ecosistema, integración con stack BI existente, audiencia del entregable).
- **C:** dado un escenario de negocio descrito en 3–5 líneas (ej. "automatizar reporte mensual a Power BI", "análisis estadístico para informe ejecutivo").
- **D:** eligiendo el lenguaje apropiado en al menos 4 de 5 escenarios y justificando por escrito en ≤ 3 líneas cada uno.
- **Sesión que la cubre:** S02 (cierre)
- **Evaluada en:** discusión plenaria día 2 + ejercicio escrito
- **Ejercicios:** Productive Failure (5 escenarios sin guía)

### CT-07 — Pipeline end-to-end (resultado terminal)
- **Bloom:** Crear (verbo: construir/integrar)
- **A:** El profesional egresado del taller
- **B:** construye un mini-pipeline reproducible que cargue datos desde CSV, los limpie (nulos, tipos), aplique al menos una transformación (filtro o agregación) y produzca al menos una visualización informativa.
- **C:** dado un dataset nuevo (no visto en clase) similar al de las sesiones, en menos de 30 minutos.
- **D:** en al menos UNO de los dos lenguajes, con código ejecutable de principio a fin sin intervención manual y comentarios mínimos que expliquen las decisiones clave.
- **Sesión que la cubre:** S02 (cierre integrador)
- **Evaluada en:** entregable final (opcional — sin nota, certificado de aprovechamiento)
- **Ejercicios:** mini-proyecto integrador

---

## Mapa de cobertura por sesión

| Sesión | CT-01 | CT-02 | CT-03 | CT-04 | CT-05 | CT-06 | CT-07 |
|---|---|---|---|---|---|---|---|
| **S01 Día 1 (4h)** — Sintaxis y carga | ✅ Intro | ✅ Intro | ✅ Foco | 🔁 Intro | — | — | — |
| **S02 Día 2 (4h)** — Manipulación y pipeline | 🔁 Refuerzo | 🔁 Refuerzo | 🔁 Refuerzo | ✅ Foco | ✅ Foco | ✅ Foco | ✅ Foco |

Leyenda: ✅ Foco · 🔁 Refuerzo · — No tocado

---

## Cobertura por % de logro (longitudinal)

| Cohorte | CT-01 | CT-02 | CT-03 | CT-04 | CT-05 | CT-06 | CT-07 |
|---|---|---|---|---|---|---|---|
| XVIII-2026 | TBD | TBD | TBD | TBD | TBD | TBD | TBD |

> Esta tabla se llena después de cada cohorte para hacer seguimiento longitudinal.
