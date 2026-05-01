# Cheatsheet pandas — Fundamentos Python y R · PEBIBA XVIII

> Imprime esta página tamaño A4. Pégala junto al monitor. Cubre el 90% de lo que harás con datos tabulares.

---

## Imports estándar

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from pathlib import Path
```

---

## Cargar y guardar

| Operación | Código |
|---|---|
| Leer CSV | `df = pd.read_csv('archivo.csv')` |
| Leer CSV con encoding | `pd.read_csv(p, encoding='latin1')` |
| Leer CSV con separador | `pd.read_csv(p, sep=';')` |
| Leer CSV parseando fechas | `pd.read_csv(p, parse_dates=['col'])` |
| Leer Excel | `pd.read_excel('archivo.xlsx')` |
| Guardar CSV | `df.to_csv('out.csv', index=False)` |
| Guardar Excel | `df.to_excel('out.xlsx', index=False)` |
| Guardar Parquet | `df.to_parquet('out.parquet')` |

---

## Inspeccionar

| Pregunta | Código |
|---|---|
| ¿Tamaño? | `df.shape` |
| ¿Primeras filas? | `df.head()` o `df.head(10)` |
| ¿Últimas filas? | `df.tail()` |
| ¿Tipos y nulos? | `df.info()` |
| ¿Estadística básica? | `df.describe()` |
| ¿Nombres columnas? | `df.columns.tolist()` |
| ¿Tipos individuales? | `df.dtypes` |
| ¿Nulos por columna? | `df.isnull().sum()` |
| ¿Filas duplicadas? | `df.duplicated().sum()` |
| ¿Valores únicos? | `df['col'].unique()` |
| ¿Conteo de valores? | `df['col'].value_counts()` |

---

## Filtrar y seleccionar

```python
# Filas — condición simple
df.query("region == 'Lima'")
df.loc[df['region'] == 'Lima']

# Filas — condiciones combinadas (paréntesis OBLIGATORIOS)
df.loc[(df['region'] == 'Lima') & (df['quarter'] == 'Q4')]

# Filas — IN
df.loc[df['region'].isin(['Lima', 'Cusco'])]

# Filas — NOT
df.loc[~df['region'].isin(['Lima'])]

# Columnas — una
df['ingresos']

# Columnas — varias
df[['region', 'producto', 'ingresos']]

# Excluir columnas
df.drop(columns=['col1', 'col2'])
```

> **Truco pandas:** usa `&` (no `and`) y `|` (no `or`).

---

## Crear y modificar columnas

```python
# Asignación directa
df['ingresos'] = df['cantidad'] * df['precio']

# Con .assign (encadenable)
df.assign(ingresos = lambda d: d['cantidad'] * d['precio'])

# Múltiples columnas
df.assign(
    ingresos = lambda d: d['cantidad'] * d['precio'],
    impuesto = lambda d: d['ingresos'] * 0.18    # ve 'ingresos' recién creado
)

# Renombrar
df.rename(columns={'old_name': 'new_name'})
```

---

## Agrupar y agregar

```python
# Agregación simple
df.groupby('region')['ingresos'].sum()

# Agregaciones múltiples (sintaxis moderna recomendada)
df.groupby('region', as_index=False).agg(
    n_transacciones = ('id', 'count'),
    ingresos_totales = ('ingresos', 'sum'),
    ingreso_promedio = ('ingresos', 'mean')
)

# Múltiples columnas de agrupación
df.groupby(['region', 'quarter'], as_index=False)['ingresos'].sum()

# Conteo rápido
df.groupby('region').size()
df['region'].value_counts()
```

> Siempre `as_index=False` o `.reset_index()` si vas a exportar.

---

## Method chaining

```python
# El patrón moderno
result = (
    df
    .query("quarter == 'Q4'")
    .assign(ingresos = lambda d: d['cantidad'] * d['precio'])
    .loc[lambda d: d['ingresos'] > 100]
    .groupby('region', as_index=False)
    .agg(total = ('ingresos', 'sum'))
    .sort_values('total', ascending=False)
)
```

> Paréntesis externos `(...)` permiten saltos de línea sin `\`.

---

## Pivot (ancho ↔ largo)

```python
# Largo → Ancho
df.pivot_table(
    index='region',
    columns='quarter',
    values='ingresos',
    aggfunc='sum'
)

# Ancho → Largo
df.melt(
    id_vars=['region'],
    value_vars=['Q1', 'Q2', 'Q3', 'Q4'],
    var_name='quarter',
    value_name='ingresos'
)

# Trick rápido después de groupby
df.groupby(['region', 'quarter'])['ingresos'].sum().unstack()
```

---

## Operaciones útiles

```python
# Ordenar
df.sort_values('col', ascending=False)
df.sort_values(['col1', 'col2'])

# Top N
df.nlargest(5, 'ingresos')
df.nsmallest(3, 'ingresos')

# Rank
df['rank'] = df['ingresos'].rank(method='dense', ascending=False)

# Rank dentro de grupo
df['rank_region'] = df.groupby('region')['ingresos'].rank(method='dense', ascending=False)

# Eliminar duplicados
df.drop_duplicates(subset=['col'])

# Eliminar nulos
df.dropna()                          # filas con ALGÚN nulo
df.dropna(subset=['col'])            # filas nulas en col específica

# Rellenar nulos
df['col'].fillna(0)
df['col'].fillna(df['col'].mean())   # imputar con media
```

---

## Estadística rápida

```python
df['col'].sum()
df['col'].mean()
df['col'].median()
df['col'].std()
df['col'].min(), df['col'].max()
df['col'].quantile(0.95)             # percentil 95
df['col'].count()                     # no-nulos
df['col'].nunique()                   # únicos
```

---

## Fechas

```python
# Convertir a datetime
df['fecha'] = pd.to_datetime(df['fecha'])

# Extraer componentes
df['año'] = df['fecha'].dt.year
df['mes'] = df['fecha'].dt.month
df['dia_semana'] = df['fecha'].dt.day_name()

# Diferencia entre fechas (en días)
df['dias'] = (df['fecha_cierre'] - df['fecha_apertura']).dt.days

# Filtrar por rango
df.loc[df['fecha'] >= '2026-01-01']

# Generar rango
pd.date_range('2026-01-01', '2026-12-31', freq='D')
```

---

## Combinar DataFrames

```python
# Concatenar (apilar)
pd.concat([df1, df2], axis=0)            # filas
pd.concat([df1, df2], axis=1)            # columnas

# Merge (como SQL JOIN)
pd.merge(df1, df2, on='id', how='inner') # inner / left / right / outer
```

---

## Visualización rápida (Pandas built-in)

```python
df['col'].plot(kind='hist', bins=20)
df.plot(kind='line', x='fecha', y='ingresos')
df.plot(kind='bar', x='region', y='ingresos')
df.plot(kind='scatter', x='precio', y='ingresos')
df.boxplot(column='ingresos', by='region')
plt.show()
```

---

## Trampas Top 5 a recordar

| # | Trampa | Solución |
|---|---|---|
| 1 | `y = x` con DataFrame: comparte | Usa `df.copy()` |
| 2 | Operadores: `and`/`or` no funcionan | Usa `&` / `|` con paréntesis |
| 3 | MultiIndex después de groupby | `as_index=False` o `.reset_index()` |
| 4 | Coma decimal en CSV de Excel | `decimal=','` en `read_csv` |
| 5 | Encoding: `?` en lugar de tildes | `encoding='latin1'` |

---

## Referencias

- Documentación oficial: https://pandas.pydata.org/docs/
- Cheatsheet oficial: https://pandas.pydata.org/Pandas_Cheat_Sheet.pdf
- Real Python pandas: https://realpython.com/pandas-python-explore-dataset/

---

*Cheatsheet PEBIBA XVIII · 2026 · Cand. Dr. Jordan King Rodríguez Mallqui · [jordandataexpert.com](https://www.jordandataexpert.com/about)*
