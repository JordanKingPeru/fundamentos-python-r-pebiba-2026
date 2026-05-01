# Trampas Asimétricas Python ↔ R — Sesión 01

> Errores específicos del programador bilingüe. Memorizar — son la fuente del 80% de bugs al portar código.

---

## Trampa #1 — Asignación: referencia (Python) vs copy-on-modify (R)

### Síntoma

| | Python | R |
|---|---|---|
| Comportamiento | `y = x` y luego mutar `y` **AFECTA** `x` | `y <- x` y luego mutar `y` **NO AFECTA** `x` |

### Demostración

**Python:**
```python
x = [1, 2, 3]
y = x
y.append(4)
print(x)   # [1, 2, 3, 4]  ← x cambió
print(y)   # [1, 2, 3, 4]
```

**R:**
```r
x <- c(1, 2, 3)
y <- x
y <- c(y, 4)
print(x)   # 1 2 3      ← x intacto
print(y)   # 1 2 3 4
```

### ¿Por qué pasa?

- **Python:** `y = x` solo crea otro nombre apuntando al mismo objeto. Las listas son mutables, así que mutarlas afecta a todos los nombres que apuntan al objeto.
- **R:** internamente R también comparte la referencia inicialmente, pero **al detectar una modificación**, copia silenciosamente. Es seguro pero costoso en memoria.

### Cuándo importa

- **En Python:** al pasar listas/dicts/DataFrames a funciones — la función puede mutarlos sin que lo esperes.
- **En R:** datasets grandes (>1GB) en memoria pueden duplicarse silenciosamente. Por eso `data.table` (que NO copia) es popular para big data en R.

### Solución

| | Python | R |
|---|---|---|
| Copia explícita | `y = x.copy()` o `y = list(x)` | (innecesario, R copia automático) |
| Verificar identidad | `id(x) == id(y)` | `identical(x, y)` (compara contenido, no identidad) |

---

## Trampa #2 — Indexado: base-0 (Python) vs base-1 (R)

### Síntoma

```python
# Python — primer elemento es x[0]
lista = [10, 20, 30]
print(lista[0])    # 10
print(lista[-1])   # 30 (último)
```

```r
# R — primer elemento es x[1]
vec <- c(10, 20, 30)
print(vec[1])     # 10
print(vec[-1])    # 20 30 (¡todos MENOS el primero!)
```

### Trampa adicional: significado de índice negativo

| | Python | R |
|---|---|---|
| `x[-1]` | Último elemento | TODOS menos el primero |
| `x[-2:]` | Últimos 2 | TODOS menos el segundo |
| Último elemento | `x[-1]` | `tail(x, 1)` o `x[length(x)]` |
| Excluir primero | `x[1:]` | `x[-1]` |

### Cuándo importa

- Al portar loops y bucles.
- Al traducir una solución de Stack Overflow.
- Al leer código ajeno bajo presión.

### Heurística para no fallar

> **Antes de tipear un índice numérico, pregúntate: ¿estoy en Python o R?** Si dudas, usa `head()`/`tail()` en R o slicing claro en Python.

---

## Trampa #3 — NA / NaN / NULL / None

### Síntoma

R y Python tienen distintos "tipos de ausencia":

| Lenguaje | Concepto | Cuándo aparece |
|---|---|---|
| Python | `None` | Ausencia genérica |
| Python | `np.nan` | Float ausente (no es entero) |
| Python | `pd.NA` | Pandas — ausencia con tipo |
| R | `NA` | Ausencia genérica |
| R | `NA_integer_`, `NA_real_`, `NA_character_` | Ausencia tipada |
| R | `NaN` | Resultado matemático indefinido (0/0) |
| R | `NULL` | Objeto vacío (distinto a NA) |

### Trampa más severa: comportamiento en agregaciones

```python
# Python pandas — ignora NaN automáticamente en .mean(), .sum(), etc.
import pandas as pd
s = pd.Series([1, 2, None, 4])
print(s.mean())   # 2.333... (ignora NaN)
```

```r
# R base — propaga NA por defecto
x <- c(1, 2, NA, 4)
print(mean(x))           # NA (NA propaga)
print(mean(x, na.rm=TRUE)) # 2.333...
```

### Heurística

- **En R:** SIEMPRE pasa `na.rm = TRUE` o decide explícitamente qué hacer con NA.
- **En Python pandas:** las funciones agregadas IGNORAN NaN. Para incluirlos: `.sum(skipna=False)`.

---

## Trampa #4 — Coerción silenciosa de tipos

### Síntoma

R coerciona silenciosamente cuando mezclas tipos en un vector:

```r
mezcla <- c(1, 'dos', TRUE)
print(typeof(mezcla))   # "character" — TODO se vuelve string
```

Python da error si intentas operaciones inválidas entre tipos:

```python
mezcla = [1, 'dos', True]   # OK — lista heterogénea
print(sum(mezcla))           # ERROR: can't sum int + str
```

### Trampa adicional: lectura de CSV

Si una columna numérica tiene un texto ocasional ("N/A", "—", " "), pandas lo cargará como `object` (string). En R, `readr` también lo convertirá a character pero te avisará explícitamente.

### Solución

- **Python:** especifica `dtype=...` en `pd.read_csv` o limpia post-lectura.
- **R:** usa `col_types = cols(...)` en `read_csv` para forzar tipos.

---

## Trampa #5 — Vectorización implícita y reciclaje (R)

### Síntoma

R recicla silenciosamente vectores de tamaños distintos:

```r
x <- c(1, 2, 3, 4, 5, 6)
y <- c(10, 20)         # 2 elementos
print(x + y)            # 11 22 13 24 15 26 — recicla y!
```

Python con numpy NO recicla (da error):

```python
import numpy as np
x = np.array([1, 2, 3, 4, 5, 6])
y = np.array([10, 20])
print(x + y)   # ValueError — incompatible shapes
```

### ¿Por qué importa?

R puede dar resultados **silenciosamente incorrectos** si los tamaños no calzan exactamente. Si el largo del primer vector NO es múltiplo del segundo, R AVISA con warning, pero igual ejecuta.

### Heurística

> En R, ANTES de operaciones vectoriales: verifica `length(x) == length(y)` o usa funciones explícitas como `mapply`.

---

## Resumen ejecutivo

| Trampa | Python | R | Riesgo |
|---|---|---|---|
| #1 Asignación | `y = x` comparte | `y <- x` copia al mutar | Mutaciones inesperadas (Py) o memoria duplicada (R) |
| #2 Indexado | base-0 | base-1, `x[-1]` distinto | Off-by-one al portar |
| #3 NA | NaN ignora en agg. | NA propaga por defecto | Resultados con NA no detectados |
| #4 Coerción | Strict en algunas ops | Silenciosa | Strings donde esperabas números |
| #5 Vectorización | numpy: error si shapes diferentes | R: recicla silencioso | Cálculos incorrectos sin alarma |

---

## Cómo memorizar

**Mnemotécnico de bolsillo:** "Python comparte, R copia. Python cuenta desde 0, R cuenta desde 1. R recicla, R propaga NA."

> Imprime esta tabla y pégala junto a tu monitor durante el curso.
