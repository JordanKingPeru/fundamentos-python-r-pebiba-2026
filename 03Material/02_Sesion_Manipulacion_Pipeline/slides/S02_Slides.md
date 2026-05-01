---
marp: true
theme: default
size: 16:9
paginate: true
header: 'Sesión 02 · El día del pipeline · PEBIBA XVIII · 2026'
footer: 'UNI · Cand. Dr. Jordan King Rodríguez Mallqui'
style: |
  :root {
    --uni-crimson: #8A1525;
    --uni-crimson-dark: #5C0E18;
    --slate: #2C3E50;
    --slate-dark: #1F2937;
    --paper: #FAFAFA;
    --gray: #E5E7EB;
    --gray-light: #F3F4F6;
    --emerald: #10B981;
    --emerald-light: #D1FAE5;
    --soft-red: #EF4444;
    --soft-red-light: #FEE2E2;
    --amber: #F59E0B;
    --amber-light: #FEF3C7;
    --neutral: #6B7280;
  }
  section {
    background: var(--paper);
    color: var(--slate);
    font-family: 'Lato', 'Roboto', sans-serif;
    font-size: 22pt;
    padding: 50px 80px;
    line-height: 1.5;
  }
  h1, h2, h3 { font-family: 'Montserrat', sans-serif; color: var(--uni-crimson); font-weight: 800; line-height: 1.1; }
  h1 { font-size: 38pt; margin-top: 0; }
  h2 { font-size: 32pt; }
  h3 { font-size: 24pt; color: var(--slate); }
  code, pre { font-family: 'Fira Code', 'Consolas', monospace; }
  pre { background: var(--gray); padding: 14px 18px; border-radius: 8px; font-size: 16pt; line-height: 1.4; }
  code { background: var(--gray); padding: 2px 6px; border-radius: 3px; font-size: 0.9em; }
  blockquote { border-left: 6px solid var(--uni-crimson); padding-left: 20px; color: var(--neutral); font-style: italic; margin: 20px 0; }
  strong { color: var(--uni-crimson); }
  table { font-size: 17pt; border-collapse: collapse; margin: 0 auto; }
  th { background: var(--slate); color: white; padding: 8px 14px; }
  td { padding: 6px 14px; border-bottom: 1px solid var(--gray); }
  .columns { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
  .warning { background: var(--amber-light); border-left: 6px solid var(--amber); padding: 14px 22px; border-radius: 6px; margin: 16px 0; }
  .pro-tip { background: var(--emerald-light); border-left: 6px solid var(--emerald); padding: 14px 22px; border-radius: 6px; margin: 16px 0; }
  .trap { background: var(--soft-red-light); border-left: 6px solid var(--soft-red); padding: 14px 22px; border-radius: 6px; margin: 16px 0; }
  .bigidea { font-size: 56pt; font-weight: 900; color: var(--uni-crimson); line-height: 1.1; text-align: center; }
  .stat { font-size: 90pt; font-weight: 900; color: var(--uni-crimson); line-height: 1; }
  .stat-label { font-size: 26pt; color: var(--slate); }
  /* Tarjeta del docente — layout pro */
  .bio-card { display: grid; grid-template-columns: 290px 1fr; gap: 40px; align-items: center; padding: 0; height: 100%; }
  .bio-photo { display: flex; align-items: center; justify-content: center; }
  .bio-photo img {
    width: 260px; height: 470px; object-fit: cover; object-position: center 28%;
    border-radius: 14px;
    border: 5px solid var(--amber);
    box-shadow: 0 16px 40px rgba(0,0,0,0.45), 0 4px 12px rgba(0,0,0,0.3);
  }
  .bio-eyebrow { font-family: 'Montserrat', sans-serif; font-size: 13pt; color: var(--amber); font-weight: 700; letter-spacing: 0.12em; text-transform: uppercase; margin: 0 0 4px 0; line-height: 1; }
  .bio-name { font-family: 'Montserrat', sans-serif; font-size: 26pt; font-weight: 900; color: white; line-height: 1.05; margin: 0 0 6px 0; letter-spacing: -0.01em; }
  .bio-title { font-size: 16pt; color: var(--amber); font-weight: 600; margin: 0 0 14px 0; line-height: 1.3; }
  .bio-creds { font-size: 15pt; color: rgba(255,255,255,0.92); line-height: 1.55; margin: 0 0 14px 0; }
  .bio-creds strong { color: var(--amber); font-weight: 700; }
  .metrics { display: grid; grid-template-columns: repeat(4, 1fr); gap: 12px; margin: 14px 0; }
  .metric { background: rgba(255,255,255,0.10); border: 1px solid rgba(255,255,255,0.18); border-radius: 10px; padding: 12px 6px; text-align: center; }
  .metric-value { font-family: 'Montserrat', sans-serif; font-size: 26pt; font-weight: 900; color: var(--amber); line-height: 1; }
  .metric-label { font-size: 10pt; color: rgba(255,255,255,0.85); margin-top: 4px; line-height: 1.25; text-transform: uppercase; letter-spacing: 0.04em; }
  .bio-tagline { font-size: 15pt; font-style: italic; color: rgba(255,255,255,0.92); border-left: 4px solid var(--amber); padding-left: 14px; margin: 12px 0; line-height: 1.4; }
  .bio-contact { font-size: 13pt; color: rgba(255,255,255,0.85); margin-top: 12px; }
  .bio-contact a { color: var(--amber); text-decoration: none; font-weight: 600; }
  /* ===== Slides oscuros: contraste WCAG AA garantizado ===== */
  section.title, section.aha, section.break, section.results, section.you {
    color: white;
  }
  section.title h1, section.aha h1, section.break h1, section.results h1, section.you h1 { color: white; }
  section.title strong, section.aha strong, section.break strong, section.results strong, section.you strong { color: var(--amber); }
  section.title blockquote, section.aha blockquote, section.break blockquote, section.results blockquote, section.you blockquote {
    color: rgba(255,255,255,0.92); border-left-color: var(--amber);
  }
  section.title em, section.aha em, section.break em, section.results em, section.you em { color: rgba(255,255,255,0.92); }
  section.title code, section.aha code, section.break code, section.results code, section.you code {
    background: rgba(255,255,255,0.15); color: var(--paper); border: 1px solid rgba(255,255,255,0.2);
  }
  section.title pre, section.aha pre, section.break pre, section.results pre, section.you pre {
    background: rgba(0,0,0,0.35); color: var(--paper); border: 1px solid rgba(255,255,255,0.15);
  }
  section.title .stat, section.aha .stat, section.break .stat, section.results .stat, section.you .stat { color: var(--amber); }
  section.title .stat-label, section.aha .stat-label, section.break .stat-label, section.results .stat-label, section.you .stat-label {
    color: rgba(255,255,255,0.95);
  }
  /* Definiciones por sección */
  section.title { background: linear-gradient(135deg, var(--uni-crimson) 0%, var(--uni-crimson-dark) 100%); }
  section.title h1 { font-size: 60pt; }
  section.title h2 { color: rgba(255,255,255,0.92); font-size: 32pt; font-weight: 400; }
  section.title p { color: rgba(255,255,255,0.92); }
  section.break { background: var(--slate); }
  section.break h1 { font-size: 70pt; text-align: center; }
  section.break h2 { color: var(--amber); text-align: center; }
  section.aha { background: linear-gradient(135deg, var(--slate) 0%, var(--slate-dark) 100%); }
  section.aha h2 { color: var(--amber); font-size: 38pt; }
  section.results { background: var(--slate-dark); }
  section.results h2 { color: var(--amber); }
  section.you { background: var(--uni-crimson); text-align: center; }
  section.you h1 { font-size: 56pt; }
  section.you p { font-size: 26pt; color: rgba(255,255,255,0.95); }
  section.arena { background: white; }
  section.arena h2 { text-align: center; color: var(--uni-crimson); }
---

<!-- _class: title -->

# Fundamentos de Python y R

## El día que respondes al jefe

**Sesión 02** · Manipulación, visualización y pipeline

PEBIBA XVIII · 2026
Cand. Dr. Jordan King Rodríguez Mallqui · UNI

---

<!-- _class: aha -->

## La sesión anterior, tu jefe te dijo:

# *"Top 5 productos<br>por región Q4.<br>**Antes del lunes.**"*

> En Excel: 1 hora.
> Hoy: aprendemos a hacerlo en **30 segundos**.

---

<!-- _class: break -->

# Antes de empezar:<br>recap día 1

---

## 5 mini-recall — responde mentalmente

1. ¿Python empieza en índice **0** o **1**?
2. Si `y = x` y `x` es lista, ¿modificar `y` afecta a `x`?
3. ¿Qué función carga un CSV en pandas?
4. ¿Qué argumento ajustas si ves `?` en lugar de tildes?
5. ¿Qué hace `df.info()` que `df.head()` NO hace?

> ⏱️ **Wait time: 60 segundos.** Después respondemos en chat.

---

<!-- _class: break -->

# 1. Manipulación

## Filter, select, group_by

---

<!-- _class: aha -->

## El gran insight de hoy

# **`groupby` es SQL<br>+ esteroides.**

> Lo que en SQL son 5 líneas y 1 GROUP BY,
> aquí es 1 expresión encadenada,
> con todas las agregaciones que quieras.

---

## Filter (filas) y select (columnas)

<div class="columns">

<div>

**pandas (Python)**
```python
df.query("region == 'Lima'")

# AND con paréntesis
df.loc[
    (df.region == 'Lima') &
    (df.quarter == 'Q4')
]

# Columnas
df[['region', 'producto']]
```

</div>

<div>

**dplyr (R)**
```r
df |> filter(region == 'Lima')

# AND con coma
df |> filter(
  region == 'Lima',
  quarter == 'Q4'
)

# Columnas
df |> select(region, producto)
```

</div>

</div>

---

## ⚠️ Trampa pandas #6 — `&` no `and`

<div class="trap">

```python
# ❌ ERROR
df.loc[df.x > 5 and df.y < 10]
# ValueError: truth value ambiguous

# ✅ Correcto
df.loc[(df.x > 5) & (df.y < 10)]
```

**Reglas pandas:**
1. Operadores son `&`, `|`, `~` (no `and`, `or`, `not`)
2. Cada condición entre paréntesis (precedencia)

dplyr es más limpio: `filter(x > 5, y < 10)` (coma = AND).

</div>

---

## Agrupar y agregar

<div class="columns">

<div>

**pandas**
```python
df.groupby('region', as_index=False).agg(
    n = ('id', 'count'),
    total = ('monto', 'sum'),
    promedio = ('monto', 'mean')
)
```

</div>

<div>

**dplyr**
```r
df |>
  group_by(region) |>
  summarise(
    n = n(),
    total = sum(monto),
    promedio = mean(monto),
    .groups = 'drop'
  )
```

</div>

</div>

> ⚠️ **dplyr deja agrupado** después de summarise. **Siempre `.groups = 'drop'`**.
> ⚠️ **pandas deja MultiIndex.** Usa `as_index=False`.

---

<!-- _class: arena -->

<!-- _class: break -->

# 🥊 Arena<br>Python vs R

## 3 preguntas, 2 lenguajes, 75 minutos

---

## Cómo va a ser

> Yo voy a tener **DOS pantallas**.
> Izquierda Python, derecha R.
> **Misma pregunta**, lados a lado.

> No buscamos "qué es mejor".
> Buscamos: **¿cuál se siente más natural a TI?**

> Cuando entiendes el concepto,
> la sintaxis es secundaria.

---

## Pregunta 1 — Total de ingresos por región

<div class="columns">

<div>

```python
(
    df
    .groupby('region')['ingresos']
    .sum()
    .sort_values(
        ascending=False
    )
)
```

</div>

<div>

```r
df |>
  group_by(region) |>
  summarise(
    ingresos = sum(ingresos),
    .groups = 'drop'
  ) |>
  arrange(
    desc(ingresos)
  )
```

</div>

</div>

> *Mismo flujo, sintaxis distinta.*

---

## Pregunta 2 — Top 5 productos en Q4

<div class="columns">

<div>

```python
(
    df
    .query("quarter=='Q4'")
    .groupby(
        'producto'
    )['ingresos']
    .sum()
    .sort_values(
        ascending=False
    )
    .head(5)
)
```

</div>

<div>

```r
df |>
  filter(quarter=='Q4') |>
  group_by(producto) |>
  summarise(
    ingresos = sum(ingresos),
    .groups = 'drop'
  ) |>
  arrange(
    desc(ingresos)
  ) |>
  slice_head(n = 5)
```

</div>

</div>

---

<!-- _class: aha -->

## **¿Cuál lees más fácil?**

# **No el "mejor".<br>El que te HABLA a TI.**

> 50/50 inicial es lo esperado.
> Eso significa: ambos son legítimos.
> El criterio del lunes: cuál usa tu equipo.

---

<!-- _class: break -->

# 2. Method chaining

## Tu código como una receta

---

## Encadenar = legibilidad

<div class="columns">

<div>

**❌ ANTES — variables intermedias**
```python
df_q4 = df.query("quarter=='Q4'")
gr = df_q4.groupby('producto')
ingresos = gr['ingresos'].sum()
ord = ingresos.sort_values(
    ascending=False
)
top5 = ord.head(5)
print(top5)
```

</div>

<div>

**✅ DESPUÉS — encadenado**
```python
top5 = (
    df
    .query("quarter=='Q4'")
    .groupby('producto')['ingresos']
    .sum()
    .sort_values(ascending=False)
    .head(5)
)
print(top5)
```

</div>

</div>

---

<!-- _class: aha -->

## **Lectura del código encadenado**

# *"Toma el df,<br>filtra Q4,<br>agrupa producto,<br>suma ingresos,<br>ordena descendente,<br>quédate con 5."*

> Una receta.
> Sin variables que olvides limpiar.
> **Eso es código profesional.**

---

<!-- _class: break -->

# 3. ⚠️ Trampa #4

## La que da resultados<br>silenciosamente incorrectos

---

## R recicla, numpy avisa

<div class="columns">

<div>

**numpy (Python)**
```python
a = np.array([1,2,3,4,5,6])
b = np.array([10, 20])
a * b
# ValueError ✓
```

</div>

<div>

**R**
```r
a <- c(1,2,3,4,5,6)
b <- c(10, 20)
a * b
# [10,40,30,80,50,120] ⚠️
```

</div>

</div>

> R recicló `b` 3 veces. **Sin error. Sin warning fuerte.**
> Si tu cálculo combina vectores de fuentes distintas → BUG silencioso.

---

<div class="trap">

## ⚠️ Caso peor: largos NO múltiplos en R

```r
x <- c(1, 2, 3, 4, 5)   # 5 elementos
y <- c(10, 20)           # 2 elementos
x * y
# Warning: longer object length is not a multiple of shorter
# [10, 40, 30, 80, 50]   ← IGUAL ejecuta
```

**Heurística R obligatoria:**
ANTES de operación vectorial → verifica `length(x) == length(y)`.

</div>

---

<!-- _class: break -->

# 4. Visualización

## El idioma de la decisión

---

<!-- _class: aha -->

## Una buena gráfica responde una pregunta de negocio en

# **5 segundos.**

> Si tarda más, está mal hecha.
> Si responde la pregunta equivocada, está peor.

---

## matplotlib vs ggplot2

<div class="columns">

<div>

**matplotlib (imperativo)**
```python
fig, ax = plt.subplots()
ingresos.plot(
    kind='bar',
    ax=ax,
    color='#2C3E50'
)
ax.set_title('Ingresos')
ax.set_xlabel('Región')
plt.tight_layout()
```
*Agregas elementos.*

</div>

<div>

**ggplot2 (declarativo)**
```r
ggplot(ingresos,
       aes(x=region,
           y=ingresos)) +
  geom_col(fill='#2C3E50') +
  labs(title='Ingresos',
       x='Región') +
  theme_minimal()
```
*Describes capas.*

</div>

</div>

---

## 4 gráficos clave para tu trabajo

| Pregunta de negocio | Gráfico | Comando |
|---|---|---|
| Comparar categorías | **Barras** | `geom_col` / `plt.bar` |
| Tendencia temporal | **Líneas** | `geom_line` / `plt.plot` |
| Distribución | **Histograma** | `geom_histogram` / `plt.hist` |
| Matriz cruzada | **Heatmap** | `geom_tile` / `sns.heatmap` |

<div class="pro-tip">

💡 **Reporte ≠ exploración.**
Exploración: rápido y feo está OK.
Reporte: título + ejes claros + paleta corporativa + sin chartjunk.

</div>

---

<!-- _class: break -->

# 5. ¿Python o R?

## Productive Failure (sin guía)

---

<!-- _class: aha -->

## Antes que vean la heurística:

# **Voten** los 5 escenarios.

> Vamos a ver dónde discrepan.
> La discrepancia es el aprendizaje.

---

## 5 escenarios de tu lunes

> Para cada uno: **Python (P)** o **R (R)** o **Cualquiera (C)**.

| # | Escenario | Tu voto |
|---|---|---|
| 1 | Automatizar reporte mensual integrado a Power BI | __ |
| 2 | Análisis estadístico (regresión, IC) para ejecutivos | __ |
| 3 | Modelo XGBoost para predecir churn | __ |
| 4 | Visualización publicable para conferencia | __ |
| 5 | Procesar 10 archivos CSV cada noche en servidor | __ |

⏱️ **3 minutos.** Después: voto a mano alzada.

---

## Heurística (tras el debate)

| Escenario | Lenguaje | Razón |
|---|---|---|
| Stack BI/cloud, ML moderno, scripting | **Python** | Mejor integración + ecosistema ML |
| Estadística clásica, ggplot publicable | **R** | Stack maduro, ggplot SOTA |
| Encuestas con diseño muestral | **R** | Paquete `survey` sin equivalente |
| Web scraping + pipeline | **Python** | requests + scrapy |
| Reporte PDF reproducible | **R** | RMarkdown / Quarto |
| **Tu equipo ya usa uno** | **El que usen** | Friction > optimalidad |

---

<!-- _class: results -->

## 🎯 Mini-Pipeline Integrador

# **30 minutos. Lenguaje a tu elección.**

> Cargar → Diagnosticar → Limpiar → Agregar → Visualizar
> Top 5 productos por ingresos Q4 por región.
> **Asserts auto-verificables al final.**

⏱️ **Empiecen.**

---

<div class="pro-tip">

## 💡 Lo que importa NO es que funcione

**Es que cualquier analista de tu equipo:**

1. Lea tu código en 30 segundos.
2. Sepa qué hace sin que le expliques.
3. Pueda **modificarlo** para otro CSV.

**Eso es código profesional.**

> *Funcional + reutilizable + legible.*

</div>

---

<!-- _class: break -->

# 🏆 Resumen

## En 8 horas pasaste de Excel<br>a pipeline reproducible

---

## Lo que te llevas hoy

✅ **Filter / select / group_by / summarise** en ambos lenguajes
✅ **Method chaining** y **pipe `|>`** — código como receta
✅ **Trampa #4** — vectorización y reciclaje
✅ **Visualización** profesional (matplotlib + ggplot2)
✅ **Heurística** Python vs R con criterio
✅ **🚀 Pipeline reproducible end-to-end** ← el resultado terminal

---

<!-- _class: you -->

# El lunes en tu trabajo:

## Cambias el CSV.<br>Cambias 2 nombres de columna.<br>**Funciona.**

> Eso que te tomaba 1 hora — ahora **30 segundos**.

---

## Próximos pasos

1. **Mini-proyecto opcional** (7 días, sin nota, **CON feedback**)
   - Dataset NUEVO: `acme_ventas_2026Q1.csv`
   - Replica tu pipeline
   - Recibes rúbrica analítica de 4 dimensiones

2. **Lecturas clave**
   - VanderPlas — *Python Data Science Handbook* (cap 3-4)
   - Wickham — *R for Data Science* (cap 3-5)

3. **Encuesta (5 min ahora)** — alimenta la próxima cohorte

---

<!-- _class: aha -->

## Has demostrado que puedes

# **Construir un pipeline.<br>Leer ambos lenguajes.<br>Decidir con criterio.**

> Eso es lo que hace un analista BI moderno.
> **Tú ya eres uno.**

---

<!-- _class: aha -->

<div class="bio-card">

<div class="bio-photo">

![Cand. Dr. Jordan King Rodríguez](assets/jordan_pro.jpg)

</div>

<div class="bio-content">

<p class="bio-eyebrow">Cand. Dr.</p>
<p class="bio-name">Jordan King Rodríguez Mallqui</p>
<p class="bio-title">Senior Manager · Pricing Analytics & Data — BBVA Perú</p>

<p class="bio-creds">
🎓 <strong>Doctorando</strong> Ciencias e Ingeniería Estadística — UNI · 2° año<br>
🎓 <strong>MSc</strong> Data Science — UPC · <strong>BSc</strong> Ing. Estadística — UNI <em>(1er puesto)</em><br>
🏆 <strong>Top Talent BBVA</strong> 2022 &amp; 2023 · 🥇 1er Hackatón AWS BBVA · 🥇 Datathon Integridad
</p>

<div class="metrics">
<div class="metric"><div class="metric-value">300+</div><div class="metric-label">Alumnos formados</div></div>
<div class="metric"><div class="metric-value">10</div><div class="metric-label">Publicaciones internacionales</div></div>
<div class="metric"><div class="metric-value">7+</div><div class="metric-label">Años PEBIBA UNI</div></div>
<div class="metric"><div class="metric-value">54</div><div class="metric-label">Proyectos ML BBVA</div></div>
</div>

<p class="bio-tagline">Construyo modelos que toman decisiones reales en BBVA Perú todos los días. Hoy compartí contigo cómo se hace.</p>

<p class="bio-contact">🌐 <a href="https://www.jordandataexpert.com/about">jordandataexpert.com</a> · 📧 <a href="mailto:jrodriguezm216@gmail.com">jrodriguezm216@gmail.com</a></p>

</div>

</div>

---

<!-- _class: title -->

# ¡Felicidades!

## Construiste tu primer pipeline

**Cand. Dr. Jordan King Rodríguez Mallqui**
[jrodriguezm216@gmail.com](mailto:jrodriguezm216@gmail.com) · [jordandataexpert.com](https://www.jordandataexpert.com/about)

PEBIBA XVIII · 2026
