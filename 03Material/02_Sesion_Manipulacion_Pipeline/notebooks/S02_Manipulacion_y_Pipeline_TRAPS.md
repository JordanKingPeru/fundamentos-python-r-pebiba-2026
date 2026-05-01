# ⚠️ Trampas Asimétricas Python ↔ R — Sesión 02

> Extiende `S01_Sintaxis_y_Carga_TRAPS.md` con las trampas que aparecen al manipular tablas y visualizar.

---

## Trampa #4 (revisitada): Vectorización y reciclaje

Ya vista en S01. Repaso con datos:

| Caso | Python (numpy) | R |
|---|---|---|
| `[1,2,3,4,5,6] * [10,20,30,40,50,60]` | `[10,40,90,160,250,360]` | `[10,40,90,160,250,360]` |
| `[1,2,3,4,5,6] * [10,20]` | **ValueError** (shapes diferentes) | `[10,40,30,80,50,120]` (recicla `[10,20]` 3 veces, sin warning) |
| `[1,2,3,4,5] * [10,20]` (largo no múltiplo) | **ValueError** | `[10,40,30,80,50]` con **warning** "longer object length is not a multiple of shorter" |

**Lección:** R puede dar resultados silenciosamente incorrectos. Python protege con error.

---

## Trampa #6: Pandas `&`/`|` vs Python `and`/`or`

### Síntoma

```python
# ❌ Error
df.loc[df.x > 5 and df.y < 10]
# ValueError: The truth value of a Series is ambiguous

# ✅ Correcto
df.loc[(df.x > 5) & (df.y < 10)]
```

### ¿Por qué?

`and`/`or` de Python son operadores escalares (devuelven un solo bool). Para una Series, pandas necesita comparar elemento-a-elemento — `&`/`|` son los operadores correctos.

**Trampa adicional:** los paréntesis SON OBLIGATORIOS por precedencia de operadores. Sin ellos, `&` se evalúa antes que `>`.

### En R con dplyr

```r
filter(x > 5, y < 10)         # comas = AND implícito (preferido)
filter(x > 5 & y < 10)        # explícito (también funciona)
```

dplyr es más limpio en este aspecto.

---

## Trampa #7: MultiIndex de pandas vs columnas planas de dplyr

### Síntoma

```python
# pandas devuelve MultiIndex jerárquico por defecto
df.groupby(['region', 'quarter'])['ventas'].sum()
# Resultado:
# region    quarter
# Lima      Q1         100
#           Q2         150
#           ...
```

```r
# dplyr devuelve tibble plano siempre
df |> group_by(region, quarter) |> summarise(ventas = sum(ventas))
# Resultado: tibble con 3 columnas (region, quarter, ventas)
```

### Consecuencia

- **Pandas:** exportar a Excel con `df.to_excel()` exporta el MultiIndex como filas con merge — feo en Power BI.
- **Solución pandas:** SIEMPRE agregar `.reset_index()` después de `.agg()` si vas a exportar.
- **dplyr:** ya devuelve formato exportable.

### En código

```python
# ❌ Sale feo en Excel
df.groupby(['region', 'quarter']).agg(s=('x', 'sum'))

# ✅ Plano
df.groupby(['region', 'quarter'], as_index=False).agg(s=('x', 'sum'))
# o equivalente:
df.groupby(['region', 'quarter']).agg(s=('x', 'sum')).reset_index()
```

---

## Trampa #8: dplyr deja agrupado después de `summarise()`

### Síntoma

```r
df |>
  group_by(region, quarter) |>
  summarise(ventas = sum(ventas))
#  → tibble agrupado por `region` (no por `quarter`)
```

Después de `summarise()`, dplyr **descarta UN nivel de agrupación** pero mantiene los demás. Las próximas operaciones aplican por grupo silenciosamente.

### Consecuencia

```r
df |>
  group_by(region, quarter) |>
  summarise(ventas = sum(ventas)) |>
  mutate(porcentaje = ventas / sum(ventas))   # ← ¡suma POR REGIÓN, no global!
```

### Solución

Pasar `.groups = 'drop'` al final del summarise:

```r
df |>
  group_by(region, quarter) |>
  summarise(ventas = sum(ventas), .groups = 'drop') |>   # ← desagrupa
  mutate(porcentaje = ventas / sum(ventas))   # ← suma global ahora
```

O usar `ungroup()` explícitamente.

### En pandas no pasa esto

`.agg()` no preserva agrupación. Una vez agregaste, el resultado es plano (con índice si es default).

---

## Trampa #9: NA propagación en `mean`/`sum` en R

### Síntoma

```r
x <- c(1, 2, NA, 4)
mean(x)              # NA
mean(x, na.rm = TRUE) # 2.333...

sum(x)               # NA
sum(x, na.rm = TRUE) # 7
```

R **propaga NA por defecto**. Si tu vector tiene un solo NA, todos tus agregados serán NA hasta que pidas explícitamente ignorarlos.

### En pandas es al revés

```python
import pandas as pd
s = pd.Series([1, 2, None, 4])
s.mean()         # 2.333... (ignora NaN por defecto)
s.sum()          # 7 (ignora NaN por defecto)
```

### Heurística

- En R: aprende a tipear `na.rm = TRUE` como reflejo en cualquier agregación.
- En Python: si quieres que NaN propague (raro), usa `s.sum(skipna=False)`.

---

## Trampa #10: Asignación dentro de `lambda` en pandas

### Síntoma

`df.assign()` con lambda funciona bien para una columna que dependa de otra calculada en la misma cadena:

```python
(df
 .assign(ingresos = lambda d: d.cantidad * d.precio)
 .assign(impuesto = lambda d: d.ingresos * 0.18)   # ← d ya tiene 'ingresos'
)
```

Pero si intentas en un solo `.assign()`:

```python
# ❌ Error — ingresos NO existe aún cuando se evalúa impuesto
df.assign(
    ingresos = lambda d: d.cantidad * d.precio,
    impuesto = lambda d: d.ingresos * 0.18
)
```

En realidad pandas moderno ≥1.0 SÍ soporta dependencias secuenciales en un mismo `.assign()`, pero no todos lo saben.

### En dplyr funciona naturalmente

```r
df |> mutate(
  ingresos = cantidad * precio,
  impuesto = ingresos * 0.18    # ← SÍ ve 'ingresos' recién creado
)
```

`mutate()` evalúa secuencialmente.

---

## Resumen ejecutivo S02

| Trampa | Síntoma | Lenguaje afectado |
|---|---|---|
| #4 Vectorización | R recicla silenciosamente | R |
| #6 `&`/`\|` vs `and`/`or` | Error si usas `and` con Series | Python pandas |
| #7 MultiIndex | Salida fea al exportar | Python pandas |
| #8 Agrupación residual | Operaciones por grupo inesperadas | R dplyr |
| #9 NA propagation | Agregados devuelven NA | R |
| #10 `.assign()` lambdas | Dependencias entre lambdas confunden | Python pandas |

---

## Cómo memorizar

**Mnemotécnico:** "R recicla, R agrupa, R propaga NA. Pandas usa `&`, `reset_index`, `query` con paréntesis."

> Imprime esta tabla. Pégala junto al monitor durante la S02.
