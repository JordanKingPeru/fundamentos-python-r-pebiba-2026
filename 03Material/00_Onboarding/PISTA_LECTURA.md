# 📖 Pista de Lectura — para perfiles ejecutivos

> **Para quién es esta pista:** gerentes, líderes de equipo y ejecutivos que necesitan **entender** el trabajo de su equipo (auditarlo, supervisarlo, tomar decisiones) más que **producirlo** ellos mismos.
>
> **Para quién NO es:** si tu objetivo es escribir código que automatice tu trabajo el lunes, ve a la [`Pista del Productor`](README.md) (la principal).

---

## ¿Por qué hay dos pistas?

El taller de 8 horas exige **construir un mini-pipeline reproducible**. Eso es ambicioso para alguien que no programa y, a la vez, sub-utiliza el tiempo de alguien que **necesita decidir, no codear**.

Si tu rol es:

- ✅ **Gerente de Analytics** que recibe pipelines de tu equipo y debe firmarlos
- ✅ **Producto / negocio** que conversa con DS pero no produce
- ✅ **Auditor / compliance** que valida lo que hace el modelo
- ✅ **Aprendiz que llegó tarde** y prefiere observar antes de codear

…esta pista te lleva a entender **qué hace el código, qué riesgos tiene y qué exigir** sin instalar nada. Tiempo total: **3-4 horas** (no 8).

---

## El recorrido (3-4 horas, sin instalar nada)

### Fase 1 — Entiende el "por qué" (45 min)

1. **Lee el sílabo:** [`Silabo_FundamentosPyR.pdf`](../../Silabo_FundamentosPyR.pdf) — 5 min.
   *Te orienta sobre qué se enseña y para qué.*

2. **Lee el README del repo:** [`README.md`](../../README.md) — 5 min.
   *Vista general del taller.*

3. **Hojea las competencias:** [`02Estructura/competency_matrix.md`](../../02Estructura/competency_matrix.md) — 10 min.
   *7 cosas que un alumno productor debe poder hacer al terminar. Lee solo las **letras "B"** (Behavior). Eso es lo que tu equipo dice cuando dice "sé pandas".*

4. **Ve los slides:** [`S00_Bienvenida.pdf`](S00_Bienvenida.pdf), [`S01_Slides.pdf`](../01_Sesion_Sintaxis_Carga/slides/S01_Slides.pdf) y [`S02_Slides.pdf`](../02_Sesion_Manipulacion_Pipeline/slides/S02_Slides.pdf) — 25 min.
   *Repasa las slides como si asistieras al taller. Te dan el contexto narrativo sin código.*

### Fase 2 — Lee los notebooks ejecutados (1.5 h)

Los notebooks normales son interactivos (requieren Jupyter + Python + R). Para ti hay versiones **HTML estático ya ejecutadas** que se abren en el navegador:

| Sesión | Notebook ejecutado en HTML |
|---|---|
| Sesión 01 — Sintaxis y carga | [`S01_Sintaxis_y_Carga_R.html`](../01_Sesion_Sintaxis_Carga/notebooks/S01_Sintaxis_y_Carga_R.html) (R espejo, completo y ejecutado) |
| Sesión 02 — Manipulación y pipeline | [`S02_Manipulacion_y_Pipeline_R.html`](../02_Sesion_Manipulacion_Pipeline/notebooks/S02_Manipulacion_y_Pipeline_R.html) |

> 💡 Lee el R espejo (no el Python). Los conceptos son **idénticos** en ambos lenguajes; el R espejo está mejor anotado y los outputs ya están renderizados. Si quieres ver Python específicamente, abre los `.ipynb` en VS Code en modo "preview" sin ejecutar.

**Mientras lees, fíjate en estos 4 patrones repetidos** (el contenido del taller):

| Patrón | Por qué importa para tu equipo |
|---|---|
| **Caso de Negocio** al inicio de cada notebook | Tu equipo debe poder explicar qué problema resuelve cada análisis. Si no, es código sin propósito. |
| **Diccionario de Datos** explícito | Tu equipo debe documentar qué significa cada columna. Sin diccionario → riesgo de mala interpretación. |
| **Real-World Warnings ⚠️** | Diferencias entre teoría y producción. Léelas — son los puntos donde un modelo falla en la realidad. |
| **Resumen de Logros** al final | Cierre que conecta lo aprendido con valor de negocio. |

### Fase 3 — Lee las trampas asimétricas (45 min)

Los **errores que matan modelos en producción** están documentados en:

- [`S01_Sintaxis_y_Carga_TRAPS.md`](../01_Sesion_Sintaxis_Carga/notebooks/S01_Sintaxis_y_Carga_TRAPS.md) — 5 trampas básicas.
- [`S02_Manipulacion_y_Pipeline_TRAPS.md`](../02_Sesion_Manipulacion_Pipeline/notebooks/S02_Manipulacion_y_Pipeline_TRAPS.md) — 5 trampas avanzadas.

Para cada trampa, lee la **descripción técnica** y luego pregúntate: *"¿qué impacto de negocio tendría si esto pasara silenciosamente en producción?"* La sección de impacto está al cierre de cada trampa.

### Fase 4 — Cheatsheet "code review no técnico" (30 min)

Lee y guarda: [`recursos/cheatsheets/cheatsheet_code_review_no_tecnico.md`](../recursos/cheatsheets/cheatsheet_code_review_no_tecnico.md).

Son **10 preguntas que cualquier gerente puede hacerle a su equipo** después de recibir un pipeline o modelo. No requieren saber programar — solo saber qué exigir.

### Fase 5 — Encuesta y cierre (15 min)

Llena la [`encuesta_post_curso.md`](../../07Evaluación/encuesta_post_curso.md) (las preguntas son las mismas para ambos perfiles).

---

## Glosario gerencial — términos del taller con impacto de negocio

| Término técnico | En lenguaje de negocio | Riesgo si no se respeta |
|---|---|---|
| **Reproducibilidad** | El mismo input siempre da el mismo output, sin importar quién lo ejecute | Auditorías fallan; números cambian inexplicablemente entre reuniones |
| **Pipeline** | Cadena de pasos automatizada: cargar → limpiar → calcular → entregar | Reportes manuales toman horas y son error-prone |
| **Encoding** | Cómo se guardan los caracteres del idioma (tildes, ñ, etc.) en el archivo | Datos del Perú aparecen como "Lim?", "Tru?illo"; reportes con basura |
| **Data leakage** | Información del futuro se filtra al modelo durante entrenamiento | Modelos con accuracy 99% en testing que fallan al 60% en producción |
| **Mutación por referencia** | Modificar `y` también modifica `x` sin que lo notes (Python) | Un cambio en una variable contamina otra reportada en otra parte del informe |
| **NA propagado** | Un valor faltante invalida todo el cálculo (R por defecto) | Promedios mensuales que reportan "NA" en lugar del valor real |
| **MultiIndex** | Tabla con múltiples niveles de agrupación que no exporta limpio a Excel | Tu CFO recibe un Excel con celdas combinadas que no se pueden filtrar |
| **GroupBy / agregación** | Resumir datos por categoría (suma, promedio, conteo por región) | Sin esto, no hay tablero ejecutivo posible |
| **Visualización idiomática** | Gráficos hechos con principios de diseño (no solo `Insertar gráfico`) | Decisiones tomadas con gráficos engañosos |

---

## Mapa: qué pedir vs qué exigir a tu equipo

| Si tu equipo entrega... | **Pide** ver... | **Exige** ver... |
|---|---|---|
| Un análisis ad-hoc | El notebook con narrativa | El diccionario de datos + supuestos |
| Un modelo predictivo | Las métricas de accuracy | La validación temporal + auditoría de fairness |
| Un dashboard | El dashboard funcionando | El código fuente del pipeline + frequencia de actualización |
| Un reporte recurrente | El último reporte | El script reproducible que lo genera |
| Una decisión basada en datos | El número clave | Los supuestos detrás del número + sensibilidad a esos supuestos |

---

## Equivalencia con la pista del productor

Si tras leer este track decides querer producir también:

| Lo que viste como lector | Lo que harías como productor |
|---|---|
| Notebooks R espejo en HTML | Abrirías los notebooks Alumno en VS Code y completarías los `# TODO:` |
| Trampas asimétricas | Las experimentarías en vivo durante el live coding |
| Slides como contexto | Las verías en clase mientras tipeas |
| Cheatsheet de code review | El cheatsheet [`cheatsheet_sql_pandas_dplyr.md`](../recursos/cheatsheets/cheatsheet_sql_pandas_dplyr.md) lo usarías como referencia para escribir |

Volver a la pista del productor: [`README.md`](../../README.md) raíz del repo.

---

## ¿Cuándo no es suficiente esta pista?

Si tu rol cambia y empiezas a recibir pull requests de código, a definir arquitectura de pipelines, o a revisar modelos con SHAP/feature importance — la pista de lectura no alcanza. Vale la pena que hagas el track productor en una próxima cohorte, aunque sea para ti mismo.

Por ahora, esta pista te da:

- ✅ Lenguaje común con tu equipo técnico
- ✅ Capacidad de hacer preguntas específicas (no genéricas)
- ✅ Detección de red flags en lo que recibes
- ✅ Criterio para priorizar inversión en datos

Eso es **mucho más** que "no programar".

---

📧 *Si quieres una conversación 1-1 sobre code review específico de tu equipo:* `jrodriguezm216@gmail.com`
