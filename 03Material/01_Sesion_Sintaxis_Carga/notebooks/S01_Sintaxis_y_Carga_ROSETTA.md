# Rosetta Python ↔ R — Sesión 01: Sintaxis y carga

> Tabla viva de equivalencias para el alumno bilingüe. Imprímela y tenla a mano durante todo el curso.

---

## Tabla maestra

| Concepto | Python | R |
|---|---|---|
| Asignar variable | `x = 5` | `x <- 5` (también `x = 5`) |
| Imprimir | `print(x)` | `print(x)` o `cat(x, '\n')` |
| Largo de secuencia | `len(x)` | `length(x)` |
| Tipo | `type(x)` | `typeof(x)` o `class(x)` |
| Crear secuencia | `[1, 2, 3]` | `c(1, 2, 3)` |
| Rango | `range(1, 6)` | `1:5` |
| Concatenar | `'a' + 'b'` | `paste0('a', 'b')` |
| Comentario | `# texto` | `# texto` |

---

## Operadores y comparación

| Operación | Python | R |
|---|---|---|
| Igualdad | `x == 5` | `x == 5` |
| Distinto | `x != 5` | `x != 5` |
| Y lógico | `x and y` | `x & y` (vectorial) o `x && y` (scalar) |
| O lógico | `x or y` | `x \| y` (vectorial) o `x \|\| y` (scalar) |
| Negación | `not x` | `!x` |
| Pertenencia | `x in lista` | `x %in% vec` |
| Verdadero | `True` | `TRUE` o `T` |
| Falso | `False` | `FALSE` o `F` |
| Nulo / Ausencia | `None`, `np.nan`, `pd.NA` | `NA`, `NULL`, `NaN` |

---

## Indexado de secuencias

> **Trampa principal:** Python base-0, R base-1.

| Acceso | Python | R |
|---|---|---|
| Primer elemento | `x[0]` | `x[1]` |
| Segundo | `x[1]` | `x[2]` |
| Último | `x[-1]` | `tail(x, 1)` o `x[length(x)]` |
| Penúltimo | `x[-2]` | `x[length(x) - 1]` |
| Primeros 3 | `x[:3]` | `x[1:3]` o `head(x, 3)` |
| Últimos 3 | `x[-3:]` | `tail(x, 3)` |
| Saltar primer | `x[1:]` | `x[-1]` (¡cuidado, distinto a Python!) |
| Selección no contigua | `[x[0], x[2], x[4]]` | `x[c(1, 3, 5)]` |
| Por condición | `[v for v in x if v > 5]` | `x[x > 5]` |

---

## Estructuras de datos

| Estructura | Python | R |
|---|---|---|
| Lista heterogénea | `[1, 'a', True]` | `list(1, 'a', TRUE)` |
| Vector homogéneo | `np.array([1, 2, 3])` | `c(1, 2, 3)` |
| Diccionario | `{'k': v}` | `list(k = v)` |
| Tupla inmutable | `(1, 2, 3)` | (no existe nativo) |
| Conjunto único | `{1, 2, 3}` | `unique(c(1, 2, 3))` |
| Tabla | `pd.DataFrame(...)` | `data.frame(...)` o `tibble(...)` |

---

## Acceso a campos

| Operación | Python | R |
|---|---|---|
| Item de dict | `d['k']` | `lst$k` o `lst[['k']]` |
| Atributo | `obj.attr` | `obj@attr` (S4) o `obj$attr` (S3) |
| Columna de DF | `df['col']` o `df.col` | `df$col` o `df[['col']]` o `df[, 'col']` |
| Columna como vector | `df['col'].values` | `df$col` |
| Múltiples columnas | `df[['a', 'b']]` | `df[, c('a', 'b')]` o `select(df, a, b)` |

---

## Carga y escritura de archivos

| Operación | Python (pandas) | R (readr/tidyverse) |
|---|---|---|
| Leer CSV | `pd.read_csv(path)` | `read_csv(path)` |
| Leer CSV con `;` | `pd.read_csv(path, sep=';')` | `read_csv2(path)` o `read_delim(path, delim=';')` |
| Leer Excel | `pd.read_excel(path)` | `readxl::read_excel(path)` |
| Encoding latin1 | `pd.read_csv(path, encoding='latin1')` | `read_csv(path, locale=locale(encoding='latin1'))` |
| Parsear fechas | `pd.read_csv(path, parse_dates=['col'])` | `read_csv(path)` (auto-detecta) |
| Escribir CSV | `df.to_csv(path, index=False)` | `write_csv(df, path)` |

---

## Inspección de datos

| Inspección | Python (pandas) | R (tidyverse) |
|---|---|---|
| Primeras filas | `df.head()` | `head(df)` |
| Últimas filas | `df.tail()` | `tail(df)` |
| Tamaño | `df.shape` | `dim(df)` |
| Filas | `len(df)` | `nrow(df)` |
| Columnas | `len(df.columns)` | `ncol(df)` |
| Vista compacta | `df.info()` | `glimpse(df)` |
| Estadística | `df.describe()` | `summary(df)` |
| Nombres columnas | `df.columns` | `names(df)` o `colnames(df)` |
| Tipos | `df.dtypes` | `sapply(df, class)` |
| Nulos por col | `df.isnull().sum()` | `df \|> summarise(across(everything(), ~ sum(is.na(.x))))` |
| Duplicados | `df.duplicated().sum()` | `sum(duplicated(df))` |
| Valores únicos | `df['col'].unique()` | `unique(df$col)` |
| Conteo de valores | `df['col'].value_counts()` | `df \|> count(col)` |

---

## Mutación

> Diferencia conceptual fuerte: Python pasa por referencia, R copia al modificar (copy-on-modify).

| Operación | Python | R |
|---|---|---|
| Asignación | `y = x` (mismo objeto) | `y <- x` (copy-on-modify) |
| Modificar lista | `y.append(4)` afecta `x` | `y <- c(y, 4)` NO afecta `x` |
| Copia explícita | `y = x.copy()` o `y = list(x)` | (no necesario en R) |
| Modificar columna DF | `df['col'] = ...` (in-place) | `df <- df \|> mutate(col = ...)` (nueva copia) |

---

## Notas finales

- **`%in%` en R** es exactamente `in` de Python para listas: `5 %in% c(1, 5, 10)` → `TRUE`.
- **Pipe operator:**
  - Python: method chaining nativo (`df.method1().method2()`).
  - R: `|>` (nativo R 4.1+) o `%>%` (magrittr): `df |> filter(...) |> select(...)`.
- **NA en R vs None en Python:** `NA` se propaga en operaciones aritméticas (`mean(c(1, NA, 3))` → `NA` por defecto). Usa `na.rm = TRUE` para ignorar. En Python pandas, `df.mean()` ignora NaN por defecto.
- **Factor en R** es similar a `pd.Categorical` en pandas — categorías fijas que pueden ser ordenadas.

---

> Esta Rosetta se extiende sesión a sesión. La versión final del curso vivirá en `recursos/cheatsheets/`.
