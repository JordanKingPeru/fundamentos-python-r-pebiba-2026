# 🧠 Ejercicios — Sesión 02: Manipulación y Pipeline

> **Tiempo total estimado:** 75 minutos
> **Competencias evaluadas:** CT-04 (refuerzo), CT-05, CT-06, CT-07
> **Rampa:** 6 niveles


---

## Ejercicio 1 (Nivel 1 — Worked Example) — Filtro básico

**Bloom:** Comprender · **Tiempo:** 5min · **Competencia:** CT-05

**Lee y entiende:**

```python
import pandas as pd
df = pd.read_csv('../../01_Sesion_Sintaxis_Carga/data/acme_ventas.csv', parse_dates=['fecha'])

# Filtrar ventas en Lima de Q4
lima_q4 = df.loc[(df['region'] == 'Lima') & (df['quarter'] == 'Q4')]
print(f'{len(lima_q4)} transacciones en Lima Q4')
```

**Equivalente R:**

```r
library(tidyverse)
df <- read_csv('../../01_Sesion_Sintaxis_Carga/data/acme_ventas.csv')
lima_q4 <- df |> filter(region == 'Lima', quarter == 'Q4')
cat(nrow(lima_q4), 'transacciones en Lima Q4\n')
```

**Lección clave:**

- pandas: `&` para AND, paréntesis obligatorios.
- dplyr: comas en `filter()` = AND implícito.
- Misma operación, sintaxis distinta.

---

## Ejercicio 2 (Nivel 2 — Parsons Problem) — Pipeline group_by

**Bloom:** Aplicar · **Tiempo:** 7min · **Competencia:** CT-05

**Reordena estas líneas para construir un pipeline que devuelva el top 5 productos por ingresos en Q4** (anota A, B, C, D, E):

```
[A]    .head(5)
[B]    .groupby('producto')['ingresos']
[C]    .sort_values(ascending=False)
[D] (
[E]    df.query("quarter == 'Q4'")
[F]    .sum()
[G] )
```

**Tu respuesta:** ___, ___, ___, ___, ___, ___, ___

---

## Ejercicio 3 (Nivel 3 — PRIMM Predict) — MultiIndex

**Bloom:** Aplicar · **Tiempo:** 5min · **Competencia:** CT-05

### Predict

```python
result = df.groupby(['region', 'quarter'])['ingresos'].sum()
print(type(result))
print(result.shape)
```

¿Qué tipo devuelve y qué shape?

- (a) `DataFrame` con shape `(24, 1)`
- (b) `Series` con shape `(24,)` (MultiIndex)
- (c) `Series` con shape `(6, 4)`
- (d) Error

**Tu predicción:** ___

### Run + Investigate

Si fallaste, lee la **Trampa #7** del archivo `S02_Manipulacion_y_Pipeline_TRAPS.md`. Escribe en 1 línea cómo evitarías el MultiIndex:

> _________________________________________________

---

## Ejercicio 4 (Nivel 4 — Modify) — Encadenamiento

**Bloom:** Aplicar · **Tiempo:** 10min · **Competencia:** CT-05

**Toma este código procedural:**

```python
# Calcular el porcentaje de ingresos por categoría dentro de cada región (en Q3)
df_q3 = df.loc[df['quarter'] == 'Q3']
df_q3 = df_q3.assign(ingresos = df_q3['cantidad'] * df_q3['precio_unit'])
agrupado = df_q3.groupby(['region', 'categoria'])['ingresos'].sum().reset_index()
totales_region = agrupado.groupby('region')['ingresos'].sum()
agrupado['porcentaje'] = agrupado.apply(
    lambda row: row['ingresos'] / totales_region[row['region']] * 100,
    axis=1
)
print(agrupado.head(10))
```

**Reescríbelo con method chaining (paréntesis externos)** para que ocupe **una sola** asignación. Pista: usa `.assign(porcentaje = lambda d: ...)`.

**Tu código:**

```python
result = (
    df
    # tu código aquí
)
print(result.head(10))
```

---

## Ejercicio 5 (Nivel 6 — Productive Failure) — Decisión Python vs R

**Bloom:** Evaluar · **Tiempo:** 15min · **Competencia:** CT-06

> ⚠️ **Sin guía.** Decide cada caso ANTES de discutir.

Para cada escenario, marca **Python (P)**, **R (R)** o **Cualquiera (C)** y justifica en máximo 2 líneas:

| # | Escenario | Decisión | Justificación |
|---|---|---|---|
| 1 | Tu jefe te pide un dashboard en Power BI con cálculos pre-procesados desde un CSV semanal. | | |
| 2 | Necesitas un análisis estadístico con regresión múltiple, intervalos de confianza, y publicarlo en informe ejecutivo en PDF. | | |
| 3 | Vas a entrenar un modelo de XGBoost para predecir cuáles clientes harán churn el próximo trimestre. | | |
| 4 | Quieres una visualización publicable para una conferencia internacional sobre patrones de venta regionales. | | |
| 5 | Tu equipo BI ya usa Python para todo. Necesitas integrar análisis estadístico al pipeline existente. | | |
| 6 | Hay que automatizar la limpieza nocturna de logs antes de que entren al data warehouse. | | |
| 7 | Quieres explorar rápidamente un dataset de 10K filas y armar un primer reporte exploratorio. | | |

**Después de la discusión grupal**, escribe una heurística personal de 3 líneas que te servirá el lunes:

> 1. ___
> 2. ___
> 3. ___

---

## Ejercicio 6 (Nivel 7 — Independent) — Mini-pipeline propio

**Bloom:** Crear · **Tiempo:** 18min · **Competencia:** CT-07

**Enunciado:**

Construye una función `top_n_por_categoria(df, top_n=3)` que:

1. Calcule columna `ingresos` (cantidad × precio_unit × (1 - descuento_pct)).
2. Filtre filas con `cantidad < 1000` (eliminar outliers).
3. Agrupe por `categoria` × `producto`, sume ingresos.
4. Devuelva los top N productos por **categoría**.

**Asserts auto-verificables:**

```python
import pandas as pd

def top_n_por_categoria(df, top_n=3):
    """Top N productos por ingresos, dentro de cada categoría."""
    # tu código aquí
    pass

# Tests
df = pd.read_csv('../../01_Sesion_Sintaxis_Carga/data/acme_ventas.csv', parse_dates=['fecha'])
result = top_n_por_categoria(df, top_n=3)

assert 'categoria' in result.columns, 'Debe incluir columna categoria'
assert 'producto' in result.columns, 'Debe incluir columna producto'
assert 'ingresos' in result.columns or 'ingresos_totales' in result.columns
assert len(result) <= 4 * 3, 'Máximo 4 categorías × 3 productos = 12 filas'
assert result['ingresos'].iloc[0] > 0 if 'ingresos' in result.columns else result['ingresos_totales'].iloc[0] > 0
print('✅ Función pasa todos los asserts')
```

---

## Ejercicio 7 (Nivel 8 — Transfer) — Aplicar a tu trabajo real

**Bloom:** Crear · **Tiempo:** 15min · **Competencia:** CT-07

**Enunciado:**

Imagina que el lunes te entregan un CSV de **tickets de soporte** de tu empresa con columnas: `ticket_id`, `fecha_apertura`, `fecha_cierre`, `prioridad`, `tipo`, `agente`, `tiempo_resolucion_min`.

**Sin necesidad del archivo**, escribe el pseudocódigo (Python o R, tu elección) de un pipeline que:

1. Cargue el CSV.
2. Calcule días entre apertura y cierre.
3. Filtre tickets con `tiempo_resolucion_min < 5` (sospechoso de cerrar sin trabajar).
4. Agrupe por `agente`, calcule: # tickets, promedio resolución, % cerrados rápido.
5. Identifique los 3 agentes con mayor % de cierre rápido (señal de alerta).
6. Visualice con barras horizontales ordenadas.

**Tu pseudocódigo:**

```python
# Solución en Python (aproximada — sin ejecutar)
import pandas as pd

# 1. Carga
# tickets = pd.read_csv(...)

# 2-4. Pipeline
# resumen_agentes = (
#     tickets
#     ...
# )

# 5. Top 3 sospechosos
# top3 = ...

# 6. Visualización
# top3.plot(kind='barh', ...)
```

**Lo importante:** que la estructura sea correcta, no que ejecute. Vas a aplicar este patrón en tu trabajo real.

---

## Cierre y reflexión

| Nivel completado | Competencia | Reflexión |
|---|---|---|
| 1 ✅ | CT-05 | |
| 2 ✅ | CT-05 | |
| 3 ✅ | CT-05 | |
| 4 ✅ | CT-05 | |
| 5 ✅ | CT-06 | |
| 6 ✅ | CT-07 | |
| 7 ✅ | CT-07 | |

**Pregunta de cierre:** ¿Cuál ejercicio sentiste que te llevarías directo al lunes?

> _________________________________________________

> Soluciones en `S02_Ejercicios_Soluciones.md`. Úsalas DESPUÉS de intentar.
