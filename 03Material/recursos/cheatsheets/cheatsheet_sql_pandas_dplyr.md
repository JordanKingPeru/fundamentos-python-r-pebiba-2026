# Cheatsheet SQL ↔ pandas ↔ dplyr

> Tres formas de decir lo mismo. Si vienes de SQL, esta tabla es tu mapa más rápido a Python y R.
> Asume `df` (pandas) o `df` (tibble) ya cargado. Tabla SQL: `ventas`.

---

## Operaciones fundamentales

| Operación | SQL | pandas (Python) | dplyr (R) |
|---|---|---|---|
| Seleccionar columnas | `SELECT a, b FROM ventas` | `df[['a', 'b']]` | `df %>% select(a, b)` |
| Filtrar filas | `SELECT * FROM ventas WHERE region = 'Lima'` | `df[df['region'] == 'Lima']` o `df.query("region == 'Lima'")` | `df %>% filter(region == "Lima")` |
| Filtrar con AND | `WHERE region = 'Lima' AND ventas > 1000` | `df[(df['region'] == 'Lima') & (df['ventas'] > 1000)]` | `df %>% filter(region == "Lima", ventas > 1000)` |
| Filtrar con OR | `WHERE region = 'Lima' OR region = 'Cusco'` | `df[df['region'].isin(['Lima', 'Cusco'])]` | `df %>% filter(region %in% c("Lima", "Cusco"))` |
| Filtrar IS NULL | `WHERE notas IS NULL` | `df[df['notas'].isna()]` | `df %>% filter(is.na(notas))` |
| Filtrar IS NOT NULL | `WHERE notas IS NOT NULL` | `df[df['notas'].notna()]` | `df %>% filter(!is.na(notas))` |
| LIKE | `WHERE producto LIKE 'Laptop%'` | `df[df['producto'].str.startswith('Laptop')]` | `df %>% filter(str_starts(producto, "Laptop"))` |

---

## Agregación

| Operación | SQL | pandas | dplyr |
|---|---|---|---|
| Suma total | `SELECT SUM(ventas) FROM ventas` | `df['ventas'].sum()` | `df %>% summarise(total = sum(ventas))` |
| Promedio | `SELECT AVG(ventas)` | `df['ventas'].mean()` | `df %>% summarise(prom = mean(ventas))` |
| Conteo | `SELECT COUNT(*)` | `len(df)` o `df.shape[0]` | `nrow(df)` |
| Conteo distinto | `SELECT COUNT(DISTINCT region)` | `df['region'].nunique()` | `df %>% distinct(region) %>% nrow()` |
| Min/Max | `SELECT MIN(ventas), MAX(ventas)` | `df['ventas'].min()`, `.max()` | `df %>% summarise(min = min(ventas), max = max(ventas))` |

---

## GROUP BY

| Operación | SQL | pandas | dplyr |
|---|---|---|---|
| Suma por grupo | `SELECT region, SUM(ventas) FROM ventas GROUP BY region` | `df.groupby('region')['ventas'].sum()` | `df %>% group_by(region) %>% summarise(total = sum(ventas))` |
| Múltiples agregaciones | `SELECT region, SUM(ventas), AVG(ventas) GROUP BY region` | `df.groupby('region').agg({'ventas': ['sum', 'mean']})` | `df %>% group_by(region) %>% summarise(total = sum(ventas), prom = mean(ventas))` |
| GROUP BY con HAVING | `GROUP BY region HAVING SUM(ventas) > 100000` | `df.groupby('region')['ventas'].sum().loc[lambda x: x > 100000]` | `df %>% group_by(region) %>% summarise(total = sum(ventas)) %>% filter(total > 100000)` |
| Agrupar por 2 columnas | `GROUP BY region, quarter` | `df.groupby(['region', 'quarter'])['ventas'].sum()` | `df %>% group_by(region, quarter) %>% summarise(total = sum(ventas))` |

---

## ORDER BY y LIMIT

| Operación | SQL | pandas | dplyr |
|---|---|---|---|
| Ordenar ascendente | `ORDER BY ventas` | `df.sort_values('ventas')` | `df %>% arrange(ventas)` |
| Ordenar descendente | `ORDER BY ventas DESC` | `df.sort_values('ventas', ascending=False)` | `df %>% arrange(desc(ventas))` |
| Top 5 | `ORDER BY ventas DESC LIMIT 5` | `df.nlargest(5, 'ventas')` | `df %>% slice_max(ventas, n = 5)` |
| Múltiple orden | `ORDER BY region ASC, ventas DESC` | `df.sort_values(['region', 'ventas'], ascending=[True, False])` | `df %>% arrange(region, desc(ventas))` |

---

## Crear / modificar columnas

| Operación | SQL | pandas | dplyr |
|---|---|---|---|
| Columna calculada | `SELECT *, ventas * 1.18 AS con_iva FROM ventas` | `df.assign(con_iva = df['ventas'] * 1.18)` | `df %>% mutate(con_iva = ventas * 1.18)` |
| CASE WHEN | `CASE WHEN ventas > 1000 THEN 'alto' ELSE 'bajo' END` | `np.where(df['ventas'] > 1000, 'alto', 'bajo')` | `if_else(ventas > 1000, "alto", "bajo")` |
| COALESCE | `COALESCE(notas, 'sin nota')` | `df['notas'].fillna('sin nota')` | `coalesce(notas, "sin nota")` |
| Renombrar columna | `SELECT region AS zona FROM ventas` | `df.rename(columns={'region': 'zona'})` | `df %>% rename(zona = region)` |

---

## JOIN

| Operación | SQL | pandas | dplyr |
|---|---|---|---|
| INNER JOIN | `SELECT * FROM ventas v INNER JOIN clientes c ON v.cliente_id = c.id` | `df_v.merge(df_c, left_on='cliente_id', right_on='id', how='inner')` | `df_v %>% inner_join(df_c, by = c("cliente_id" = "id"))` |
| LEFT JOIN | `LEFT JOIN clientes c ON v.cliente_id = c.id` | `df_v.merge(df_c, ..., how='left')` | `df_v %>% left_join(df_c, by = ...)` |
| FULL OUTER JOIN | `FULL OUTER JOIN ...` | `df_v.merge(df_c, ..., how='outer')` | `df_v %>% full_join(df_c, by = ...)` |
| Anti-join (sin match) | `LEFT JOIN ... WHERE c.id IS NULL` | `df_v[~df_v['cliente_id'].isin(df_c['id'])]` | `df_v %>% anti_join(df_c, by = ...)` |

---

## CTE / Subqueries / encadenamiento

| Operación | SQL | pandas | dplyr |
|---|---|---|---|
| Subquery / CTE | `WITH top AS (SELECT ... LIMIT 5) SELECT * FROM top WHERE ...` | encadenar métodos: `df.query(...).groupby(...).agg(...)` | encadenar pipes: `df %>% filter(...) %>% group_by(...) %>% summarise(...)` |
| Pivot | `PIVOT (SUM(ventas) FOR region IN (...))` (T-SQL) | `df.pivot_table(values='ventas', index='quarter', columns='region', aggfunc='sum')` | `df %>% pivot_wider(names_from = region, values_from = ventas, values_fn = sum)` |
| Unpivot | `UNPIVOT ...` | `df.melt(id_vars=['quarter'], var_name='region', value_name='ventas')` | `df %>% pivot_longer(-quarter, names_to = "region", values_to = "ventas")` |

---

## Funciones de ventana (window functions)

| Operación | SQL | pandas | dplyr |
|---|---|---|---|
| Ranking | `RANK() OVER (PARTITION BY region ORDER BY ventas DESC)` | `df.groupby('region')['ventas'].rank(method='min', ascending=False)` | `df %>% group_by(region) %>% mutate(rank = min_rank(desc(ventas)))` |
| Suma acumulada | `SUM(ventas) OVER (ORDER BY fecha)` | `df.sort_values('fecha')['ventas'].cumsum()` | `df %>% arrange(fecha) %>% mutate(acum = cumsum(ventas))` |
| LAG (valor anterior) | `LAG(ventas, 1) OVER (ORDER BY fecha)` | `df['ventas'].shift(1)` | `df %>% mutate(prev = lag(ventas))` |
| % del total | `ventas / SUM(ventas) OVER ()` | `df['ventas'] / df['ventas'].sum()` | `df %>% mutate(pct = ventas / sum(ventas))` |

---

## Mental model — cuándo cada uno brilla

| Tarea | SQL | pandas | dplyr |
|---|---|---|---|
| Consultar BD productiva | ✅ Nativo | Necesita conector (`pd.read_sql`) | Necesita conector (`DBI`, `dbplyr`) |
| Múltiples transformaciones encadenadas | ❌ Anidación o CTE compleja | ✅ Method chaining | ✅ Pipe `%>%` o `\|>` |
| Manejo de NA/NULL en agregaciones | NULL excluye automático | ✅ `.sum(skipna=True)` por defecto | ⚠️ `na.rm = TRUE` necesario |
| Pivot/Unpivot | Verboso | ✅ `pivot_table` / `melt` | ✅ `pivot_wider` / `pivot_longer` |
| Visualización integrada | ❌ | ✅ matplotlib + `.plot()` | ✅ ggplot2 idiomático |
| Modelos de ML | ❌ | ✅ scikit-learn | ⚠️ tidymodels (más curva) |
| Performance > 10M filas | ✅ Optimizado en motor | ⚠️ pandas en RAM; usar polars/dask | ⚠️ data.table mejor que dplyr |

---

## Mini ejemplo end-to-end

**Pregunta de negocio:** "Top 5 productos por ventas Q4 en Lima."

**SQL:**
```sql
SELECT producto, SUM(ventas) AS total_ventas
FROM ventas
WHERE region = 'Lima' AND quarter = 'Q4'
GROUP BY producto
ORDER BY total_ventas DESC
LIMIT 5;
```

**pandas:**
```python
(df.query("region == 'Lima' and quarter == 'Q4'")
   .groupby('producto')['ventas'].sum()
   .nlargest(5))
```

**dplyr:**
```r
df %>%
  filter(region == "Lima", quarter == "Q4") %>%
  group_by(producto) %>%
  summarise(total_ventas = sum(ventas)) %>%
  slice_max(total_ventas, n = 5)
```

---

## Heurística práctica

- **Tienes los datos en una BD**: empieza con SQL siempre. Lleva la consulta a Python o R solo cuando necesites visualizar o aplicar lógica que no se exprese bien en SQL.
- **Tienes un CSV o Excel**: pandas o dplyr directamente.
- **Vienes de SQL fuerte**: dplyr se va a sentir más natural (mismo orden mental que SQL: `filter → group_by → summarise`). pandas requiere ajustar el chip al "method chaining" (más Python-idiomático).
- **No memorices**: ten esta cheatsheet abierta los primeros 5-10 ejercicios. La sintaxis se sedimenta sola con la práctica.

---

## Recursos adicionales

- pandas oficial: https://pandas.pydata.org/Pandas_Cheat_Sheet.pdf
- dplyr oficial: https://posit.co/wp-content/uploads/2022/10/data-transformation-1.pdf
- Modern Pandas (Tom Augspurger): https://tomaugspurger.net/posts/modern-1-intro/
- R for Data Science (Wickham): https://r4ds.hadley.nz/
