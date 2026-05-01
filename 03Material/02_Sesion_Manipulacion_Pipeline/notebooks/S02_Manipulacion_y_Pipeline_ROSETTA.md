# 🌹 Rosetta Python ↔ R — Sesión 02: Manipulación, Visualización, Pipeline

> Extiende `S01_Sintaxis_y_Carga_ROSETTA.md`. Esta tabla cubre las operaciones del día 2.

---

## 1. Manipulación tabular

### Filtrar y seleccionar

| Operación | pandas | dplyr |
|---|---|---|
| Filtrar por condición simple | `df.query("x == 5")` | `df \|> filter(x == 5)` |
| Filtrar AND | `df.loc[(df.a > 5) & (df.b < 10)]` | `df \|> filter(a > 5, b < 10)` |
| Filtrar OR | `df.loc[(df.a > 5) \| (df.b < 10)]` | `df \|> filter(a > 5 \| b < 10)` |
| Filtrar IN | `df.loc[df.region.isin(['Lima','Cusco'])]` | `df \|> filter(region %in% c('Lima','Cusco'))` |
| Negación | `df.loc[~df.x.isin([1,2])]` | `df \|> filter(!x %in% c(1,2))` |
| Seleccionar columnas | `df[['a','b']]` | `df \|> select(a, b)` |
| Excluir columnas | `df.drop(columns=['x'])` | `df \|> select(-x)` |
| Renombrar | `df.rename(columns={'a':'A'})` | `df \|> rename(A = a)` |
| Crear columna | `df.assign(z = df.a + df.b)` | `df \|> mutate(z = a + b)` |
| Crear varias | `df.assign(z=..., w=...)` | `df \|> mutate(z = ..., w = ...)` |

---

### Agrupar y agregar

| Operación | pandas | dplyr |
|---|---|---|
| Agrupar | `df.groupby('g')` | `df \|> group_by(g)` |
| Agrupar múltiples | `df.groupby(['g1','g2'])` | `df \|> group_by(g1, g2)` |
| Suma por grupo | `df.groupby('g')['x'].sum()` | `df \|> group_by(g) \|> summarise(x = sum(x))` |
| Múltiples agregaciones | `df.groupby('g').agg(s=('x','sum'), m=('x','mean'))` | `df \|> group_by(g) \|> summarise(s = sum(x), m = mean(x))` |
| Conteo | `df.groupby('g').size()` | `df \|> count(g)` |
| Quitar agrupación | `.reset_index()` | `.groups = 'drop'` o `ungroup()` |
| Ranking dentro de grupo | `df.groupby('g')['x'].rank()` | `df \|> group_by(g) \|> mutate(r = dense_rank(...))` |
| Top N por grupo | `df.groupby('g').head(n)` | `df \|> group_by(g) \|> slice_max(x, n=n)` |

### Funciones de agregación comunes

| Operación | pandas | dplyr |
|---|---|---|
| Suma | `'sum'` | `sum(x, na.rm=TRUE)` |
| Promedio | `'mean'` | `mean(x, na.rm=TRUE)` |
| Mediana | `'median'` | `median(x, na.rm=TRUE)` |
| Conteo | `'count'` o `'size'` | `n()` |
| Únicos | `'nunique'` | `n_distinct(x)` |
| Std dev | `'std'` | `sd(x, na.rm=TRUE)` |
| Min/Max | `'min'`, `'max'` | `min(x)`, `max(x)` |
| Primero/último | `'first'`, `'last'` | `first(x)`, `last(x)` |

---

### Pivot

| Operación | pandas | tidyr |
|---|---|---|
| Largo → Ancho | `df.pivot(index='r', columns='c', values='v')` | `pivot_wider(names_from = c, values_from = v)` |
| Largo → Ancho (con agg) | `df.pivot_table(index='r', columns='c', values='v', aggfunc='sum')` | combinar `summarise` + `pivot_wider` |
| Ancho → Largo | `df.melt(id_vars='id', var_name='var', value_name='val')` | `pivot_longer(cols, names_to='var', values_to='val')` |
| Pivot rápido en groupby | `.unstack()` | `pivot_wider()` después de `summarise()` |

---

## 2. Encadenamiento

| Acción | Python | R |
|---|---|---|
| Encadenar | Method chaining: `df.method1().method2()` | Pipe nativo: `df \|> fn1() \|> fn2()` |
| Pipe alternativo | (no necesario) | `df %>% fn1() %>% fn2()` (magrittr) |
| Multilínea | Envolver en `(...)` | Saltos directos |
| Pasar `df` a función custom | `df.pipe(mi_func, arg)` | `df \|> mi_func(arg)` |

---

## 3. Visualización

### Filosofías

| Aspecto | matplotlib + seaborn | ggplot2 |
|---|---|---|
| Filosofía | Imperativa | Declarativa (Grammar of Graphics) |
| Estructura base | `fig, ax = plt.subplots()` | `ggplot(df, aes(...))` |
| Capas | `ax.bar(...)` (cada llamada modifica) | `+ geom_bar() + geom_line()` (suma capas) |
| Theming | `plt.rcParams[...]` | `+ theme_minimal()` o `+ theme(...)` |

### Gráficos comunes

| Gráfico | matplotlib | ggplot2 |
|---|---|---|
| Barras | `plt.bar(x, y)` o `df.plot(kind='bar')` | `geom_col(aes(x, y))` |
| Líneas | `plt.plot(x, y)` | `geom_line(aes(x, y))` |
| Puntos | `plt.scatter(x, y)` | `geom_point(aes(x, y))` |
| Histograma | `plt.hist(x, bins=20)` | `geom_histogram(aes(x), bins = 20)` |
| Boxplot | `plt.boxplot(x)` | `geom_boxplot(aes(x, y))` |
| Heatmap | `sns.heatmap(matriz)` | `geom_tile(aes(x, y, fill = z))` |
| Facetas | `sns.FacetGrid(df, col='g').map(...)` | `+ facet_wrap(~ g)` |
| Título | `plt.title('...')` | `+ labs(title = '...')` |
| Etiquetas eje | `plt.xlabel('...')` | `+ labs(x = '...', y = '...')` |
| Color manual | `color='#8A1525'` | `geom_X(fill = '#8A1525')` |
| Color por variable | en seaborn `hue='g'` | `aes(fill = g)` |

---

## 4. I/O

| Operación | pandas | tidyverse |
|---|---|---|
| Leer CSV | `pd.read_csv(p)` | `read_csv(p)` |
| Leer Excel | `pd.read_excel(p)` | `readxl::read_excel(p)` |
| Escribir CSV | `df.to_csv(p, index=False)` | `write_csv(df, p)` |
| Escribir Excel | `df.to_excel(p, index=False)` | `writexl::write_xlsx(df, p)` |
| Escribir Parquet | `df.to_parquet(p)` | `arrow::write_parquet(df, p)` |
| Leer SQL | `pd.read_sql(query, con)` | `DBI::dbGetQuery(con, query)` |

---

## 5. Funciones definidas por el usuario

### Definir una función

| Aspecto | Python | R |
|---|---|---|
| Sintaxis | `def f(x, y=10):` | `f <- function(x, y = 10) {` |
| Cuerpo | indentación | `{ ... }` |
| Retorno | `return ...` (opcional al final) | `return(...)` o última expresión |
| Docstring | `"""Doc...""""` | comentarios `#` o roxygen `#'` |

### Aplicar a vectores/Series

| Operación | Python | R |
|---|---|---|
| Función a cada elemento | `s.map(f)` | `purrr::map(vec, f)` o `sapply(vec, f)` |
| Función a varias columnas | `df[cols].apply(f)` | `df \|> mutate(across(cols, f))` |
| Función custom en pipeline | `.pipe(f)` | `\|> f()` |

---

## 6. Notas de lectura cruzada

### Cuando ves `<-` en R, en Python sería `=`

```r
df <- read_csv('x.csv')
df <- df |> filter(...)
```

```python
df = pd.read_csv('x.csv')
df = df.query('...')   # o df = df.loc[...]
```

### Cuando ves `%in%` en R, en Python sería `.isin()`

```r
filter(region %in% c('Lima','Cusco'))
```

```python
df.loc[df.region.isin(['Lima','Cusco'])]
```

### Cuando ves `desc()` en R, en Python sería `ascending=False`

```r
arrange(desc(x))
```

```python
.sort_values('x', ascending=False)
```

---

## 7. Patrón "carga → limpia → agrega → visualiza"

### Python

```python
result = (
    pd.read_csv('data.csv', parse_dates=['fecha'])
    .assign(ingresos = lambda d: d.cantidad * d.precio_unit * (1 - d.descuento_pct))
    .query("quarter == 'Q4'")
    .loc[lambda d: d.cantidad < 1000]
    .groupby(['region', 'producto'], as_index=False)
    .agg(ingresos_totales=('ingresos', 'sum'))
    .sort_values('ingresos_totales', ascending=False)
)
```

### R

```r
result <- read_csv('data.csv') |>
  mutate(ingresos = cantidad * precio_unit * (1 - descuento_pct)) |>
  filter(quarter == 'Q4', cantidad < 1000) |>
  group_by(region, producto) |>
  summarise(ingresos_totales = sum(ingresos), .groups = 'drop') |>
  arrange(desc(ingresos_totales))
```

**Lectura:** ambos se leen como una receta. El que prefieras como tu "default" depende más de tu equipo y stack que de criterios técnicos.

---

> Esta Rosetta vive en `recursos/cheatsheets/` para consulta permanente.
