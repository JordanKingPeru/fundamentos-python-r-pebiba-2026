---
marp: true
theme: default
size: 16:9
paginate: true
header: 'Sesión 01 · De Excel a Código · PEBIBA XVIII · 2026'
footer: 'UNI · Cand. Dr. Jordan King Rodríguez Mallqui'
style: |
  /* Paleta UNI desde guia_branding.md */
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
  table { font-size: 18pt; border-collapse: collapse; margin: 0 auto; }
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
  section.you h1 { font-size: 64pt; }
  section.you h2 { color: rgba(255,255,255,0.95); }
  section.you p { font-size: 26pt; color: rgba(255,255,255,0.95); }
---

<!-- _class: title -->

# Fundamentos de Python y R

## De Excel a código profesional — en 8 horas

**Sesión 01** · El primer salto

PEBIBA XVIII · 2026
Cand. Dr. Jordan King Rodríguez Mallqui · UNI

---

<!-- _class: aha -->

## Antes de empezar — una pregunta

# ¿Cuántas horas a la semana<br>repites el mismo análisis<br>en Excel?

> *Tomen 10 segundos. Piensen en serio.*

---

<!-- _class: aha -->

# La industria dice: **5 a 12 horas**

<div class="stat">87%</div>
<div class="stat-label">de analistas BI repiten manualmente el mismo workflow cada semana.</div>

> *Hoy aprendes a recuperar esas horas.*

---

## Lo que vas a poder hacer en 8 horas

<div class="columns">

<div>

### Hoy (Sesión 01)
- Cargar un CSV con código
- Detectar tipos, nulos, outliers
- Diagnóstico inicial profesional
- Construir tu modelo mental

</div>

<div>

### Próxima sesión
- Filtrar y agregar como SQL+
- Visualizar con código
- **🎯 Pipeline reproducible**
- Entregar un .xlsx automatizado

</div>

</div>

> *El lunes en tu trabajo: cambias 2 líneas. Funciona.*

---

<!-- _class: break -->

# 🤯 El gran cambio mental

## Variable ≠ celda

---

## Excel piensa en celdas. Código piensa en objetos.

**En Excel:**
```
A1 = 100
B1 = 0.18
C1 = A1 * (1 + B1)   →  118
A1 = 200             →  C1 ahora 236  (recalcula)
```

**En Python:**
```python
precio = 100
iva = 0.18
total = precio * (1 + iva)   # 118
precio = 200
print(total)                 # ¡sigue siendo 118!
```

---

<!-- _class: aha -->

## ¿Por qué esto es **bueno**?

# **Mismo input → mismo output. Siempre.**

> Esa es la **reproducibilidad** que Excel nunca te dará.
> Es lo que distingue a un análisis serio de un análisis frágil.

---

## Tipos básicos — cuatro etiquetas

```python
monto    = 1500.50    # float — decimal
unidades = 12         # int — entero
moneda   = 'PEN'      # str — texto (con comillas)
es_b2b   = True       # bool — lógico
```

```r
monto    <- 1500.50
unidades <- 12L       # L = entero en R
moneda   <- 'PEN'
es_b2b   <- TRUE      # MAYÚSCULAS en R
```

> Asignación: Python usa `=`, R usa `<-` (idiomático).

---

<!-- _class: break -->

# 1. Listas y vectores

## Tu primer contenedor

---

## Lista (Python) vs Vector (R)

```python
# Python — lista heterogénea (mezcla tipos)
regiones = ['Lima', 'Arequipa', 'Cusco']
mezcla = ['TX-001', 1500.50, True]   # OK
```

```r
# R — vector homogéneo (TODOS del mismo tipo)
regiones <- c('Lima', 'Arequipa', 'Cusco')
mezcla <- c('TX-001', 1500.50, TRUE)
typeof(mezcla)   # "character" — R coerciona TODO
```

<div class="warning">

⚠️ **R coerciona silenciosamente.** Verifica `typeof()` siempre.

</div>

---

<!-- _class: break -->

# 2. ⚠️ La trampa #1

## La que te ahorra 4 horas

---

<!-- _class: aha -->

## **Predict.** No ejecutes. Piensa.

```python
x = [1, 2, 3]
y = x
y.append(4)
print(x)   # ¿qué imprime?
```

> A) `[1, 2, 3]`
> B) `[1, 2, 3, 4]`
> C) Error
> D) `[4, 1, 2, 3]`

**¿Cuál votas?**

---

## La respuesta: **B** — `[1, 2, 3, 4]`

```
x ──┐
    ├──> [1, 2, 3, 4]
y ──┘
```

`y = x` **NO copia** la lista.
Solo crea otra **etiqueta** apuntando al MISMO objeto.

> *Cuando muta `y`, muta el objeto. `x` ve el cambio.*

---

## ✅ Solución: copia explícita

```python
x = [1, 2, 3]
y = x.copy()        # ← .copy() crea objeto NUEVO
y.append(4)
print(x)   # [1, 2, 3]   ← intacto ✓
print(y)   # [1, 2, 3, 4]
```

<div class="pro-tip">

💡 **Pro-Tip pandas (te ahorrará bugs):**

Cada vez que hagas `df_clean = df_raw`, escribe `.copy()` al final.
**Siempre.** Sin excepción.

```python
df_clean = df_raw.copy()
```

</div>

---

## R hace lo OPUESTO: copy-on-modify

```r
x <- c(1, 2, 3)
y <- x
y <- c(y, 4)
print(x)   # 1 2 3   ← intacto ✓
print(y)   # 1 2 3 4
```

| | Python | R |
|---|---|---|
| `y = x` | mismo objeto | mismo objeto |
| Mutar `y` | **afecta** `x` | **NO afecta** `x` |
| Modelo | Referencia | Copy-on-modify |

---

<!-- _class: break -->

# 3. ⚠️ La trampa #2

## Indexado: un caracter de diferencia

---

## Python desde 0, R desde 1

```python
# Python
lista = ['a', 'b', 'c']
lista[0]    # 'a' — primer
lista[-1]   # 'c' — último
```

```r
# R
vec <- c('a', 'b', 'c')
vec[1]              # 'a' — primer
vec[length(vec)]    # 'c' — último
vec[-1]             # 'b' 'c' — TODOS menos el primero ⚠️
```

---

<!-- _class: aha -->

## ⚠️ La trampa más subestimada

# `vec[-1]` significa<br>cosas **distintas**

> **Python:** último elemento.
> **R:** TODOS menos el primero.

Para el último en R: `tail(vec, 1)`

---

<!-- _class: break -->

# 4. Carga de CSV

## El "momento Excel"

---

## La línea que cambia tu trabajo

```python
import pandas as pd

df = pd.read_csv('data/acme_ventas.csv', parse_dates=['fecha'])
print(df.shape)   # (5000, 12)
```

```r
library(tidyverse)

df <- read_csv('data/acme_ventas.csv')
dim(df)   # 5000 12
```

> *Eso es todo. 1 línea, 5000 filas en memoria.*

---

## ⚠️ Real-World Warning: encoding

<div class="warning">

**Si ves `?` en lugar de tildes:** encoding latin1, no utf-8.

```python
pd.read_csv('archivo.csv', encoding='latin1')
```

```r
read_csv('archivo.csv', locale = locale(encoding = 'latin1'))
```

**Si las columnas se mezclan:** separador `;` no `,`.

```python
pd.read_csv('archivo.csv', sep=';')
```

</div>

---

<!-- _class: break -->

# 5. Diagnóstico inicial

## Los 3 comandos que repetirás siempre

---

## Los 3 canónicos

| Pregunta | pandas | tidyverse |
|---|---|---|
| ¿Cómo se ve? | `df.head()` | `head(df)` |
| ¿Qué tipos hay? | `df.info()` | `glimpse(df)` |
| ¿Qué tamaños? | `df.describe()` | `summary(df)` |

<div class="pro-tip">

💡 **El patrón profesional:** SIEMPRE estos 3, en este orden.
Antes de TOCAR cualquier dato, mira qué tienes.

</div>

---

## Helpers que también usarás

```python
# Nulos
df.isnull().sum()

# Duplicados
df.duplicated().sum()

# Valores únicos por columna categórica
df['region'].unique()
df['region'].value_counts()
```

```r
colSums(is.na(df))
sum(duplicated(df))
unique(df$region)
df |> count(region)
```

---

<!-- _class: results -->

## 🧠 Tu turno: 5 hallazgos

Con `head()`, `info()`, `describe()`:

> Escribe **5 hallazgos** sobre `acme_ventas.csv`.
>
> No "tiene 5000 filas" — eso ya lo sabemos.
> **Hallazgos accionables, como un analista BI.**

⏱️ **5 minutos.** Después comparten en chat.

---

<!-- _class: break -->

# 🏆 Resumen

## En 4 horas pasaste de Excel a script

---

## Lo que te llevas hoy

✅ **Modelo mental:** variable = etiqueta, no celda
✅ **Trampa #1** dominada — `y = x` no copia (Python)
✅ **Trampa #2** dominada — Python desde 0, R desde 1
✅ **Carga de CSV** con encoding y parseo de fechas
✅ **Diagnóstico** profesional con 3 comandos canónicos

> **La próxima sesión:** respondemos al jefe.
> Top 5 productos por región Q4 — en 30 segundos.

---

## Tarea pre-S02 (15 min)

1. Leer `S01_Sintaxis_y_Carga_TRAPS.md` — las 5 trampas asimétricas
2. Hojear `S01_Sintaxis_y_Carga_ROSETTA.md` — tabla de equivalencias
3. **Verificar** que tu kernel R funciona en Jupyter

> *Si algo no funciona: escribe a jrodriguezm216@gmail.com — respondo en menos de 24h.*

---

<!-- _class: you -->

# Lo que ya eres

## **Una persona que carga CSVs con código.**

> En el 13% de los analistas BI del mundo.
> Bienvenido al lado correcto.

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

<p class="bio-tagline">Te enseña alguien que también construye modelos en producción todos los días.</p>

<p class="bio-contact">🌐 <a href="https://www.jordandataexpert.com/about">jordandataexpert.com</a> · 📧 <a href="mailto:jrodriguezm216@gmail.com">jrodriguezm216@gmail.com</a></p>

</div>

</div>

---

<!-- _class: title -->

# Gracias

## Preguntas y discusión

**Cand. Dr. Jordan King Rodríguez Mallqui**
[jrodriguezm216@gmail.com](mailto:jrodriguezm216@gmail.com) · [jordandataexpert.com](https://www.jordandataexpert.com/about)

PEBIBA XVIII · 2026
