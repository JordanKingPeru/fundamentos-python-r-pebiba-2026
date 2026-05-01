# Kit de Evaluación Formativa Intra-Sesión

> **NO se califican.** Estos quizzes te ayudan a activar el recuerdo en clase y a saber dónde estás parado (no son examen — son tu propio diagnóstico).

## Sesión 01

### Quiz 1.1 — Después del Bloque 1 (~min 25)

**Tipo:** PRIMM Predict (multiple choice)

**Pregunta:** Tienes este código Python:
```python
precio = 100
iva = 0.18
total = precio * (1 + iva)
precio = 200
print(total)
```
¿Qué imprime?

- (a) `100`
- (b) `118`
- (c) `200`
- (d) `236`

**Respuesta correcta:** (b) 118.

**Por qué importa:** los alumnos de Excel esperan que `total` se "actualice" cuando cambia `precio`, como una fórmula. En código, `total` se evaluó UNA vez con el `precio` antiguo. Cambiar `precio` después no recalcula nada.

**Tiempo:** 90s pensar + 60s discusión.

---

### Quiz 1.2 — Después del Bloque 2 (~min 60)

**Tipo:** PRIMM Predict

**Pregunta:** ¿Qué imprime este código?
```python
x = [1, 2, 3]
y = x
y.append(4)
print(x)
```
- (a) `[1, 2, 3]`
- (b) `[1, 2, 3, 4]`
- (c) `[4, 1, 2, 3]`
- (d) Error

**Respuesta correcta:** (b) `[1, 2, 3, 4]`.

**Por qué importa:** asignación por referencia vs copia. Trampa #1 — la más importante del día.

**Tiempo:** 90s para pensar + 90s para discutir.

---

### Quiz 1.3 — Después del Bloque 3 (~min 95)

**Tipo:** Equivalencia bilingüe

**Pregunta:** El código Python `mi_lista[0]` accede al primer elemento. ¿Cuál es el equivalente en R?

- (a) `mi_vec[0]`
- (b) `mi_vec[1]`
- (c) `mi_vec.first()`
- (d) `head(mi_vec)`

**Respuesta correcta:** (b).

**Por qué importa:** R indexa desde 1, no desde 0. Trampa #2.

**Tiempo:** 60s + 60s.

---

### Quiz 1.4 — Después del Bloque 5 (~min 220)

**Tipo:** Recall abierto

**Pregunta (escribir en chat o en libreta):**
> En máximo 3 líneas, ¿qué hallazgos importantes encontraste sobre el dataset Acme Corp después de inspeccionarlo? Menciona al menos: una observación de tipo de datos y una observación de calidad (nulos / outliers).

**Función:** activar memoria ahora vs solo "ver" la inspección. Para el docente: detectar quién no captó nada vs quién captó hallazgos profundos.

**Tiempo:** 4 min escribir + 6 min discusión plenaria (recoger 3-4 voces).

---

## Sesión 02

### Quiz 2.0 — Recapitulación (Retrieval colectivo) (min 0-15)

**Tipo:** 5 preguntas rápidas en chat (cada una 30s).

1. ¿Python empieza en índice 0 o 1?
   - (Respuesta: 0)
2. Si `y = x` y `x` es una lista, ¿modificar `y` afecta a `x`?
   - (Respuesta: sí, mismo objeto)
3. ¿Qué función carga un CSV en Python con la librería estándar de data?
   - (Respuesta: `pd.read_csv`)
4. Si veo `?` en lugar de tildes al cargar un CSV, ¿qué argumento ajusto?
   - (Respuesta: `encoding`, ej. `encoding='latin1'`)
5. ¿Qué hace `df.info()` que `df.head()` NO hace?
   - (Respuesta: muestra tipos de columnas y conteo de no-nulos)

**Función:** consolidar el día 1 antes de entrar a contenido nuevo. Si > 30% falla pregunta 2 (mutación), repasar 5 minutos antes de avanzar.

---

### Quiz 2.1 — Después del Bloque 1 (~min 90)

**Tipo:** PRIMM Predict cruzado

**Pregunta:** Este código en R:
```r
df |>
  filter(region == "Lima") |>
  group_by(producto) |>
  summarise(total = sum(ventas)) |>
  arrange(desc(total)) |>
  head(5)
```
¿Cuál es el equivalente más cercano en pandas?

- (a) `df[df.region == "Lima"].groupby("producto")["ventas"].sum().sort_values(ascending=False).head(5)`
- (b) `df.query("region == 'Lima'").groupby("producto").ventas.sum().nlargest(5)`
- (c) Ambas son equivalentes
- (d) Ninguna

**Respuesta correcta:** (c).

**Tiempo:** 2 min + 3 min discusión (es complejo, vale la pena).

---

### Quiz 2.2 — Después del Bloque 3 (Productive Failure) (~min 200)

**Tipo:** Justificación abierta

**Escenario:** "Tu equipo BI usa Power BI con datos de SQL Server. Te piden automatizar una limpieza diaria de logs antes de que entren al modelo. ¿Python o R?"

**Función:** discusión sin respuesta única. Lo importante es que el alumno **justifique** con criterios, no que "acierte".

**Tiempo:** 90s pensar + 5 min discusión.

---

### Quiz 2.3 — Cierre (min 235-240)

**Tipo:** Self-assessment

**Pregunta:**
> Antes de irte, califícate (1-5) en cada competencia:
> - CT-01 (modelo mental): __
> - CT-03 (cargar CSV): __
> - CT-05 (manipular tabular): __
> - CT-07 (pipeline end-to-end): __
>
> Y responde: ¿qué competencia te llevarías "casi lista" y cuál necesitarías practicar más?

**Función:** metacognición — al alumno le ayuda a saber qué dominar antes del cierre.

---

## Resumen de cobertura por sesión

| Sesión | Quizzes | Total min | Competencias activadas |
|---|---|---|---|
| S01 | 4 quizzes | ~15 min de quiz total | CT-01, CT-02, CT-03 |
| S02 | 4 quizzes | ~14 min de quiz total | CT-01, CT-02, CT-04, CT-05, CT-06, CT-07 |

> Patrón: 1 quiz cada 25-30 min de clase activa. No saturar — los quizzes son "puntuaciones de consolidación", no clase.

---

