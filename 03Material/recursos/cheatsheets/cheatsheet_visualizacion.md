# Cheatsheet Visualización — matplotlib + seaborn vs ggplot2

> Lado a lado: los 6 gráficos clave del trabajo de un analista BI.

---

## Filosofías

| matplotlib + seaborn (Python) | ggplot2 (R) |
|---|---|
| Imperativo: agregar elementos | Declarativo (Grammar of Graphics) |
| `fig, ax = plt.subplots()` luego modificas | `ggplot(data, aes(...)) + capa1 + capa2` |
| Bueno para reportes con control fino | Bueno para visualización publicable |

---

## 1. Barras (categórico × numérico)

### Python — pandas built-in
```python
ingresos_region.plot(kind='bar', figsize=(10, 5), color='#2C3E50')
plt.title('Ingresos por región')
plt.tight_layout()
plt.show()
```

### Python — seaborn
```python
sns.barplot(data=df, x='region', y='ingresos', estimator='sum')
plt.title('Ingresos por región')
plt.show()
```

### R — ggplot2
```r
ggplot(df, aes(x = region, y = ingresos)) +
  geom_col(fill = '#2C3E50') +
  labs(title = 'Ingresos por región', x = 'Región', y = 'Ingresos (PEN)') +
  theme_minimal()
```

---

## 2. Líneas (temporal)

### Python
```python
df.groupby('mes')['ingresos'].sum().plot(kind='line', marker='o', color='#8A1525')
plt.title('Tendencia mensual')
plt.show()
```

### R
```r
df |>
  group_by(mes) |>
  summarise(ingresos = sum(ingresos), .groups = 'drop') |>
  ggplot(aes(x = mes, y = ingresos, group = 1)) +
    geom_line(color = '#8A1525', linewidth = 1.5) +
    geom_point(size = 3) +
    labs(title = 'Tendencia mensual') +
    theme_minimal()
```

---

## 3. Scatter (numérico × numérico)

### Python
```python
sns.scatterplot(data=df, x='precio', y='ingresos', hue='categoria', size='cantidad')
plt.title('Precio vs Ingresos por Categoría')
plt.show()
```

### R
```r
ggplot(df, aes(x = precio, y = ingresos, color = categoria, size = cantidad)) +
  geom_point(alpha = 0.6) +
  labs(title = 'Precio vs Ingresos por Categoría') +
  theme_minimal()
```

---

## 4. Histograma (distribución)

### Python
```python
df['precio'].plot(kind='hist', bins=20, color='#10B981', edgecolor='white')
plt.title('Distribución de precios')
plt.show()
```

### R
```r
ggplot(df, aes(x = precio)) +
  geom_histogram(bins = 20, fill = '#10B981', color = 'white') +
  labs(title = 'Distribución de precios') +
  theme_minimal()
```

---

## 5. Boxplot (distribución por grupo)

### Python — seaborn
```python
sns.boxplot(data=df, x='region', y='ingresos', palette='deep')
plt.title('Distribución de ingresos por región')
plt.xticks(rotation=45)
plt.show()
```

### R — ggplot2
```r
ggplot(df, aes(x = region, y = ingresos, fill = region)) +
  geom_boxplot() +
  labs(title = 'Distribución de ingresos por región') +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = 'none')
```

---

## 6. Heatmap (matriz cruzada)

### Python — seaborn
```python
matriz = df.groupby(['region', 'quarter'])['ingresos'].sum().unstack()
sns.heatmap(matriz / 1000, annot=True, fmt='.0f', cmap='RdYlGn',
            cbar_kws={'label': 'Ingresos (miles PEN)'})
plt.title('Ingresos por región × trimestre')
plt.show()
```

### R — ggplot2
```r
df |>
  group_by(region, quarter) |>
  summarise(ingresos = sum(ingresos)/1000, .groups = 'drop') |>
  ggplot(aes(x = quarter, y = region, fill = ingresos)) +
    geom_tile() +
    geom_text(aes(label = round(ingresos, 0)), color = 'white') +
    scale_fill_gradient(low = '#EF4444', high = '#10B981') +
    labs(title = 'Ingresos por región × trimestre',
         fill = 'Miles PEN') +
    theme_minimal()
```

---

## Theming consistente

### Python — al inicio del notebook
```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.set_theme(style='whitegrid', palette='deep')
plt.rcParams['figure.figsize'] = (10, 6)
plt.rcParams['axes.titlesize'] = 14
plt.rcParams['axes.titleweight'] = 'bold'
```

### R — global
```r
library(ggplot2)
theme_set(theme_minimal(base_size = 12))
```

---

## Paleta UNI (de guia_branding.md)

| Color | HEX | Uso |
|---|---|---|
| UNI Crimson | `#8A1525` | Títulos, énfasis institucional |
| Engineering Slate | `#2C3E50` | Cuerpo, técnico |
| Paper White | `#FAFAFA` | Fondo |
| Cool Gray | `#E5E7EB` | Bloques de código |
| Emerald (positivo) | `#10B981` | Éxito, "tu método" |
| Soft Red (riesgo) | `#EF4444` | Errores, baselines fallidos |
| Amber (incertidumbre) | `#F59E0B` | Warnings, rangos |
| Neutral Gray | `#6B7280` | Datos secundarios |

---

## Checklist de calidad de gráfica

- [ ] **Título** descriptivo (no "Plot 1")
- [ ] **Ejes** etiquetados con unidades (`Ingresos (PEN)`, no `valor`)
- [ ] **Leyenda** clara si hay múltiples series
- [ ] **Colores** semánticos (verde=bueno, rojo=malo) — máximo 3 dominantes
- [ ] **Tipo de gráfico apropiado** al tipo de variable
- [ ] **Legibilidad** desde 1m de distancia (texto ≥ 12pt en gráfica embebida en slide)
- [ ] **Sin chartjunk**: ejes secundarios innecesarios, gradientes decorativos, 3D injustificado

---

## Errores comunes a evitar

1. **Pie charts con > 5 categorías** — usar barras horizontales mejor.
2. **Eje Y que NO empieza en cero** en gráficos de barras (engañoso).
3. **Eje Y arbitrario** en gráficos de líneas (puede ser válido).
4. **Demasiados colores** — máximo 6 series distinguibles.
5. **Gradientes 3D** — solo planos.
6. **Texto sobre fondo de bajo contraste** — accesibilidad.

---

*Cheatsheet PEBIBA XVIII · 2026*
