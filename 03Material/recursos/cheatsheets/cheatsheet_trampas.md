# ⚠️ Cheatsheet — Las 10 Trampas Asimétricas Python ↔ R

> Tamaño A4 doble cara. Pega junto al monitor. Memorizalas.

---

## 🎯 Mnemotécnico de bolsillo

> **"Python comparte, R copia.
> Python cuenta desde 0, R cuenta desde 1.
> R recicla, R agrupa, R propaga NA."**

---

## TRAMPA 1 — Asignación

| | Python | R |
|---|---|---|
| `y = x` luego mutar `y` | **AFECTA** `x` | **NO AFECTA** `x` |
| Modelo | Referencia compartida | Copy-on-modify |

```python
x = [1, 2, 3]; y = x; y.append(4)
print(x)   # [1, 2, 3, 4] ⚠️
```
```r
x <- c(1, 2, 3); y <- x; y <- c(y, 4)
print(x)   # 1 2 3 ✓
```

**Solución Python:** `y = x.copy()` para copia explícita.

---

## TRAMPA 2 — Indexado

| | Python | R |
|---|---|---|
| Primer elemento | `x[0]` | `x[1]` |
| Último elemento | `x[-1]` | `tail(x, 1)` o `x[length(x)]` |
| **¡OJO!** `x[-1]` significa | Último | TODOS menos el primero |
| Slicing | `x[0:3]` (excluye 3) | `x[1:3]` (incluye 3) |

---

## TRAMPA 3 — NA / NaN / None

```python
# Python pandas
s = pd.Series([1, 2, None, 4])
s.mean()   # 2.333 (ignora NaN)
```
```r
# R
x <- c(1, 2, NA, 4)
mean(x)              # NA ⚠️
mean(x, na.rm=TRUE)  # 2.333 ✓
```

**Heurística R:** SIEMPRE `na.rm = TRUE` en agregaciones.

---

## TRAMPA 4 — Vectorización y reciclaje

```python
# numpy
a = np.array([1, 2, 3, 4, 5, 6])
b = np.array([10, 20])
a * b   # ValueError ✓ (te protege)
```
```r
# R
a <- c(1, 2, 3, 4, 5, 6)
b <- c(10, 20)
a * b   # [10, 40, 30, 80, 50, 120] ⚠️ recicla silencioso
```

**Heurística R:** verifica `length(x) == length(y)` antes de operar.

---

## TRAMPA 5 — Coerción silenciosa de tipos

```r
# R
mezcla <- c(1, 'dos', TRUE)
typeof(mezcla)   # "character" — ¡todo se vuelve string!
```
```python
# Python — más estricto
mezcla = [1, 'dos', True]   # OK lista heterogénea
sum(mezcla)                  # TypeError ✓
```

---

## TRAMPA 6 — pandas: `&`/`|` no `and`/`or`

```python
# ❌
df.loc[df.x > 5 and df.y < 10]   # ValueError

# ✅
df.loc[(df.x > 5) & (df.y < 10)]   # paréntesis OBLIGATORIOS
```

```r
# ✅ dplyr — coma es AND
df |> filter(x > 5, y < 10)
```

---

## TRAMPA 7 — MultiIndex de pandas

```python
# ❌ Sale feo en Excel
df.groupby(['region', 'quarter']).agg(s=('x', 'sum'))

# ✅ Plano
df.groupby(['region', 'quarter'], as_index=False).agg(s=('x', 'sum'))
# o:
df.groupby(['region', 'quarter']).agg(s=('x', 'sum')).reset_index()
```

```r
# dplyr ya devuelve plano
df |> group_by(region, quarter) |> summarise(s = sum(x), .groups = 'drop')
```

---

## TRAMPA 8 — dplyr deja agrupado después de `summarise()`

```r
# ⚠️ Esto suma POR REGION (no global)
df |>
  group_by(region, quarter) |>
  summarise(ventas = sum(ventas)) |>
  mutate(porcentaje = ventas / sum(ventas))   # ← suma POR REGION

# ✅ Usar .groups = 'drop'
df |>
  group_by(region, quarter) |>
  summarise(ventas = sum(ventas), .groups = 'drop') |>
  mutate(porcentaje = ventas / sum(ventas))   # ← suma global
```

---

## TRAMPA 9 — Encoding al cargar CSV

| Síntoma | Causa | Solución |
|---|---|---|
| `?` en lugar de tildes | Encoding latin1 leído como utf-8 | `encoding='latin1'` |
| Una sola columna gigante | Separador `;` no `,` | `sep=';'` |
| Comas decimales mezcladas | Separador europeo | `decimal=','` |

---

## TRAMPA 10 — `.assign()` con dependencias entre lambdas

```python
# ⚠️ ¿Funciona o no?
df.assign(
    ingresos = lambda d: d.cantidad * d.precio,
    impuesto = lambda d: d.ingresos * 0.18   # ← ¿ve 'ingresos'?
)
```

**Respuesta:** SÍ funciona en pandas ≥1.0 (evalúa secuencial). En versiones antiguas, fallaría.

```r
# dplyr siempre evalúa secuencial
df |> mutate(
  ingresos = cantidad * precio,
  impuesto = ingresos * 0.18   # ✓
)
```

---

## 🎓 Resumen para llevar al trabajo

1. **`.copy()` siempre antes de modificar DataFrames** (pandas).
2. **`as_index=False` o `.reset_index()` después de groupby** (pandas).
3. **`.groups = 'drop'` después de summarise** (R).
4. **`na.rm = TRUE` en toda agregación** (R).
5. **Verifica encoding y separador** antes de asumir defaults.

---

*Cheatsheet PEBIBA XVIII · 2026 · Imprime y pega.*
