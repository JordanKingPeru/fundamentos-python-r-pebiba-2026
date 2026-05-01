# 🌊 Cheatsheet dplyr (tidyverse) — Fundamentos Python y R · PEBIBA XVIII

> Imprime tamaño A4. El equivalente de pandas en R.

---

## 📦 Setup

```r
library(tidyverse)   # incluye dplyr, ggplot2, readr, tidyr, purrr, stringr
library(readxl)      # para leer .xlsx
library(writexl)     # para escribir .xlsx
```

---

## 📂 Cargar y guardar

| Operación | Código |
|---|---|
| Leer CSV | `df <- read_csv('archivo.csv')` |
| Leer CSV con encoding | `read_csv(p, locale=locale(encoding='latin1'))` |
| Leer CSV con `;` | `read_csv2(p)` o `read_delim(p, delim=';')` |
| Leer Excel | `read_excel('archivo.xlsx')` |
| Guardar CSV | `write_csv(df, 'out.csv')` |
| Guardar Excel | `write_xlsx(df, 'out.xlsx')` |

---

## 🔍 Inspeccionar

| Pregunta | Código |
|---|---|
| ¿Tamaño? | `dim(df)` o `nrow(df)`, `ncol(df)` |
| ¿Primeras filas? | `head(df)` o `head(df, 10)` |
| ¿Últimas filas? | `tail(df)` |
| ¿Tipos compactos? | `glimpse(df)` |
| ¿Estadística básica? | `summary(df)` |
| ¿Nombres columnas? | `names(df)` o `colnames(df)` |
| ¿Tipos individuales? | `sapply(df, class)` |
| ¿Nulos por columna? | `colSums(is.na(df))` |
| ¿Filas duplicadas? | `sum(duplicated(df))` |
| ¿Valores únicos? | `unique(df$col)` |
| ¿Conteo de valores? | `df \|> count(col)` |

---

## ✂️ Filtrar y seleccionar

```r
# Filas — condición simple
df |> filter(region == 'Lima')

# Filas — AND (coma o &)
df |> filter(region == 'Lima', quarter == 'Q4')
df |> filter(region == 'Lima' & quarter == 'Q4')

# Filas — OR
df |> filter(region == 'Lima' | quarter == 'Q4')

# Filas — IN
df |> filter(region %in% c('Lima', 'Cusco'))

# Filas — NOT IN
df |> filter(!region %in% c('Lima'))

# Columnas
df |> select(region, producto, ingresos)

# Excluir columnas
df |> select(-cliente_id, -notas)

# Renombrar al seleccionar
df |> select(zona = region, prod = producto)
```

---

## ➕ Crear y modificar columnas

```r
# Crear columna
df |> mutate(ingresos = cantidad * precio)

# Múltiples columnas (secuenciales — la siguiente ve la anterior)
df |> mutate(
  ingresos = cantidad * precio,
  impuesto = ingresos * 0.18
)

# Renombrar (después de crearla)
df |> rename(zona = region)

# Mutar varias columnas con la misma función
df |> mutate(across(c(precio, descuento), ~ round(.x, 2)))
```

---

## 🏷️ Agrupar y agregar

```r
# Suma simple por grupo
df |>
  group_by(region) |>
  summarise(ingresos = sum(ingresos))

# Múltiples agregaciones
df |>
  group_by(region) |>
  summarise(
    n = n(),                          # conteo
    ingresos_totales = sum(ingresos),
    ingreso_promedio = mean(ingresos),
    .groups = 'drop'                   # ← OBLIGATORIO desagrupar
  )

# Múltiples columnas de agrupación
df |>
  group_by(region, quarter) |>
  summarise(ingresos = sum(ingresos), .groups = 'drop')

# Conteo rápido
df |> count(region)
df |> count(region, sort = TRUE)

# Conteo con condición
df |> count(region, wt = (ingresos > 1000))
```

⚠️ **Siempre `.groups = 'drop'`** o `ungroup()` después de `summarise()`.

---

## 🔗 Pipe `|>` — encadenar

```r
# El patrón moderno
result <- df |>
  filter(quarter == 'Q4') |>
  mutate(ingresos = cantidad * precio) |>
  filter(ingresos > 100) |>
  group_by(region) |>
  summarise(total = sum(ingresos), .groups = 'drop') |>
  arrange(desc(total))
```

📌 `|>` es el pipe nativo (R 4.1+). Lee como una receta.

📌 También funciona `%>%` (magrittr) si vienes de tidyverse antiguo.

---

## 🔄 Pivot

```r
# Largo → Ancho
df |>
  group_by(region, quarter) |>
  summarise(ingresos = sum(ingresos), .groups = 'drop') |>
  pivot_wider(names_from = quarter, values_from = ingresos)

# Ancho → Largo
df_ancho |>
  pivot_longer(
    cols = c(Q1, Q2, Q3, Q4),
    names_to = 'quarter',
    values_to = 'ingresos'
  )
```

---

## 🔢 Operaciones útiles

```r
# Ordenar
df |> arrange(col)
df |> arrange(desc(col))
df |> arrange(col1, desc(col2))

# Top N
df |> slice_max(ingresos, n = 5)
df |> slice_min(ingresos, n = 3)

# Top N por grupo
df |> group_by(region) |> slice_max(ingresos, n = 5)

# Rank
df |> mutate(rank = dense_rank(desc(ingresos)))

# Rank dentro de grupo
df |>
  group_by(region) |>
  mutate(rank = dense_rank(desc(ingresos))) |>
  ungroup()

# Eliminar duplicados
df |> distinct()
df |> distinct(col, .keep_all = TRUE)

# Eliminar nulos
df |> drop_na()
df |> drop_na(col)

# Rellenar nulos
df |> mutate(col = replace_na(col, 0))
df |> mutate(col = if_else(is.na(col), mean(col, na.rm = TRUE), col))
```

---

## 📊 Estadística rápida

```r
sum(x, na.rm = TRUE)
mean(x, na.rm = TRUE)
median(x, na.rm = TRUE)
sd(x, na.rm = TRUE)
min(x, na.rm = TRUE)
max(x, na.rm = TRUE)
quantile(x, 0.95, na.rm = TRUE)
length(x[!is.na(x)])    # no-nulos
length(unique(x))         # únicos
```

⚠️ **Siempre `na.rm = TRUE`** o R devuelve NA.

---

## 📅 Fechas

```r
library(lubridate)   # parte del tidyverse

# Convertir
df <- df |> mutate(fecha = ymd(fecha))   # YYYY-MM-DD

# Extraer componentes
df |> mutate(
  ano = year(fecha),
  mes = month(fecha),
  dia_semana = wday(fecha, label = TRUE)
)

# Diferencia entre fechas
df |> mutate(dias = as.numeric(fecha_cierre - fecha_apertura))

# Filtrar por rango
df |> filter(fecha >= ymd('2026-01-01'))

# Generar rango
seq(ymd('2026-01-01'), ymd('2026-12-31'), by = 'day')
```

---

## 🤝 Combinar DataFrames

```r
# Apilar filas
bind_rows(df1, df2)

# Apilar columnas
bind_cols(df1, df2)

# Joins (como SQL)
inner_join(df1, df2, by = 'id')
left_join(df1, df2, by = 'id')
right_join(df1, df2, by = 'id')
full_join(df1, df2, by = 'id')

# Joins con keys distintas
inner_join(df1, df2, by = c('id_a' = 'id_b'))
```

---

## 📈 Visualización ggplot2 (intro)

```r
ggplot(df, aes(x = region, y = ingresos)) +
  geom_col() +                                    # barras
  labs(title = 'Ingresos por región',
       x = 'Región', y = 'Ingresos (PEN)') +
  theme_minimal()

# Otros geoms
geom_line()       # líneas
geom_point()      # scatter
geom_histogram()  # histograma
geom_boxplot()    # boxplot
geom_tile()       # heatmap

# Facetas
+ facet_wrap(~ categoria)
```

---

## ⚠️ Trampas Top 5 a recordar

| # | Trampa | Solución |
|---|---|---|
| 1 | `y <- x` y luego `y <- c(y, 4)` | R copy-on-modify, `x` queda intacto (¡ojo si vienes de Python!) |
| 2 | Indexado base-1: `vec[1]` es el primero | Si vienes de Python, recuerda |
| 3 | `vec[-1]` es TODOS menos el primero (no el último) | Para último: `tail(vec, 1)` |
| 4 | NA propaga: `mean(c(1,NA,3))` → NA | Usa `na.rm = TRUE` |
| 5 | `summarise()` deja agrupado | Pasa `.groups = 'drop'` |

---

## 🔗 Referencias

- Documentación dplyr: https://dplyr.tidyverse.org/
- Cheatsheet oficial: https://posit.co/wp-content/uploads/2022/10/data-transformation-1.pdf
- R for Data Science: https://r4ds.hadley.nz/

---

*Cheatsheet PEBIBA XVIII · 2026 · Cand. Dr. Jordan King Rodríguez Mallqui · [jordandataexpert.com](https://www.jordandataexpert.com/about)*
