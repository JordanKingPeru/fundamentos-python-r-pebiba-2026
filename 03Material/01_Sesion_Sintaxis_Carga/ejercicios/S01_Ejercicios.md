# 🧠 Ejercicios — Sesión 01: Sintaxis y Carga

> **Tiempo total estimado:** 60 minutos
> **Competencias evaluadas:** CT-01, CT-02, CT-03, CT-04
> **Rampa:** 6 niveles (Worked Example → Transfer)


> **Política IA:** puedes usar Claude/ChatGPT, pero declara qué prompt usaste y verifica línea por línea.

---

## Ejercicio 1 (Nivel 1 — Worked Example) — Asignación y aritmética

**Bloom:** Comprender · **Tiempo:** 5min · **Competencia:** CT-01

**Lee y entiende este código (no necesitas escribir nada):**

```python
# Cálculo de comisión de vendedor
ventas = 50000
comision_pct = 0.05
bono_fijo = 200
comision_total = ventas * comision_pct + bono_fijo
print(f'Comisión: PEN {comision_total:.2f}')   # Comisión: PEN 2700.00
```

**Lección clave:**

- Las variables guardan valores fijos hasta que reasignes.
- `f-string` con `:.2f` formatea con 2 decimales.
- El cálculo se hace UNA vez (no como Excel que recalcula).

---

## Ejercicio 2 (Nivel 2 — Parsons Problem) — Suma de lista

**Bloom:** Aplicar · **Tiempo:** 7min · **Competencia:** CT-01

**Pista:** la indentación importa. ¿Qué línea define la función? ¿Cuál inicializa? ¿Cuál acumula? ¿Cuál retorna?

**Líneas mezcladas — reordena (anota A, B, C, D, E en el orden correcto):**

```
[A]    return total
[B]    total = 0
[C]    for monto in ventas:
[D]        total += monto
[E]    def sumar_ventas(ventas):
```

**Tu respuesta:** ___, ___, ___, ___, ___

---

## Ejercicio 3 (Nivel 3 — PRIMM Predict + Run) — Trampa #1

**Bloom:** Aplicar · **Tiempo:** 5min · **Competencia:** CT-01

### Predict (sin ejecutar)

```python
productos_a = ['Laptop', 'Monitor', 'Mouse']
productos_b = productos_a
productos_b.append('Teclado')
print(f'productos_a = {productos_a}')
```

¿Qué imprime?

- (a) `['Laptop', 'Monitor', 'Mouse']`
- (b) `['Laptop', 'Monitor', 'Mouse', 'Teclado']`
- (c) Error

**Tu predicción:** ___

### Run

Ejecuta el código y verifica.

### Investigate

Si fallaste, lee la **Trampa #1** del archivo `S01_Sintaxis_y_Carga_TRAPS.md`. Escribe en 1 línea por qué pasa esto:

> _________________________________________________

---

## Ejercicio 4 (Nivel 4 — Modify) — Listas e indexado

**Bloom:** Aplicar · **Tiempo:** 8min · **Competencia:** CT-01 + CT-02

**Toma este código y modifícalo para que cumpla 3 cosas:**

```python
regiones = ['Lima', 'Arequipa', 'Cusco']
```

1. **Agregar** `'Trujillo'` al final.
2. **Imprimir** las regiones intermedias (todo excepto la primera y última).
3. **Reemplazar** `'Cusco'` por `'Cuzco'` (modifícala in-place).

**Resultado esperado al final:**

```
Intermedias: ['Arequipa', 'Cuzco']
Lista final: ['Lima', 'Arequipa', 'Cuzco', 'Trujillo']
```

**Tu código:**

```python
regiones = ['Lima', 'Arequipa', 'Cusco']

# 1. Agregar 'Trujillo'
# ___

# 2. Imprimir intermedias
# ___

# 3. Reemplazar 'Cusco' por 'Cuzco'
# ___

print(f'Lista final: {regiones}')
```

---

## Ejercicio 5 (Nivel 6 — Productive Failure) — Diccionario complejo

**Bloom:** Crear · **Tiempo:** 12min · **Competencia:** CT-01 + CT-02

> ⚠️ Este ejercicio es **deliberadamente difícil**. Intenta sin mirar adelante; tu lucha es parte del aprendizaje.

**Contexto:**

Tienes datos de 3 clientes B2B representados como una lista de diccionarios. Sin pandas (todavía no lo usamos), responde:

```python
clientes = [
    {'id': 'CL-001', 'region': 'Lima',     'compras': [1500, 800, 2200]},
    {'id': 'CL-002', 'region': 'Cusco',    'compras': [500, 1200]},
    {'id': 'CL-003', 'region': 'Arequipa', 'compras': [3000, 2500, 1800, 1000]},
]
```

**Pregunta:** ¿Cuál cliente tiene el **promedio de compra más alto**?

**Tu intento (no borrar aunque falle):**

```python
clientes = [
    {'id': 'CL-001', 'region': 'Lima',     'compras': [1500, 800, 2200]},
    {'id': 'CL-002', 'region': 'Cusco',    'compras': [500, 1200]},
    {'id': 'CL-003', 'region': 'Arequipa', 'compras': [3000, 2500, 1800, 1000]},
]

# tu código aquí
```

**Pistas (usa solo si te atascas más de 5 min):**

1. Necesitas iterar sobre cada cliente.
2. Para cada cliente, calcular `sum(compras) / len(compras)`.
3. Quedarte con el cliente cuyo promedio sea máximo.

---

## Ejercicio 6 (Nivel 7 — Independent) — Carga + diagnóstico

**Bloom:** Aplicar · **Tiempo:** 12min · **Competencia:** CT-03 + CT-04

**Enunciado:**

Carga el dataset `acme_ventas.csv` y responde:

1. ¿Cuántas filas tiene?
2. ¿Qué columna tiene MÁS valores nulos?
3. ¿Cuál es el `precio_unit` promedio en todo el dataset?
4. ¿Qué regiones únicas hay?
5. ¿Hay alguna fila con `cantidad` mayor a 100? ¿Cuántas?

**Criterios de éxito:**

- [ ] Las 5 respuestas son correctas.
- [ ] El código corre sin errores.
- [ ] Usaste `pd.read_csv` con `parse_dates=['fecha']`.
- [ ] Pasa los asserts incluidos abajo.

**Asserts auto-verificables:**

```python
import pandas as pd
df = pd.read_csv('../data/acme_ventas.csv', parse_dates=['fecha'])

# Tu solución
n_filas = ___
col_mas_nulos = ___
precio_promedio = ___
regiones_unicas = ___
filas_cantidad_alta = ___

# Asserts
assert n_filas == 5000, f'Esperaba 5000 filas, obtuve {n_filas}'
assert col_mas_nulos == 'notas', f'Esperaba "notas", obtuve {col_mas_nulos}'
assert 100 < precio_promedio < 2000, f'Precio promedio fuera de rango: {precio_promedio}'
assert len(regiones_unicas) == 6, f'Esperaba 6 regiones, obtuve {len(regiones_unicas)}'
assert filas_cantidad_alta >= 5, f'Deberían haber ≥5 outliers, obtuve {filas_cantidad_alta}'
print('✅ Todos los asserts pasaron')
```

---

## Ejercicio 7 (Nivel 8 — Transfer) — Aplicar a otro dominio

**Bloom:** Aplicar · **Tiempo:** 11min · **Competencia:** CT-02 + CT-03 + CT-04

**Enunciado:**

Imagina que el lunes en tu trabajo te dan un CSV de **logs del servidor de Power BI** (no de ventas). Las columnas son: `timestamp`, `user_id`, `dashboard_id`, `tiempo_carga_seg`, `error_message`.

**Sin necesidad del archivo real**, escribe el código que:

1. Cargue el CSV (asume que está en `data/pbi_logs.csv`, posiblemente con encoding latin1).
2. Imprima las primeras 5 filas.
3. Muestre tipos y nulos por columna.
4. Detecte si hay logs con `tiempo_carga_seg > 60` (sospechoso).
5. Liste los 3 dashboards más usados.

**Tu código:**

```python
import pandas as pd

# 1. Carga
# logs = pd.read_csv(...)

# 2. Vista
# logs.head()

# 3. Tipos y nulos
# logs.info()

# 4. Logs sospechosos
# lentos = logs.loc[...]

# 5. Top 3 dashboards
# top_dashboards = logs['dashboard_id'].value_counts().head(3)
```

> **Reflexión:** lo que aprendiste con el dataset de Acme Corp se aplica a CUALQUIER CSV de tu trabajo. Esa es la utilidad real.

---

## Cierre y reflexión

| Nivel completado | Competencia | Reflexión |
|---|---|---|
| 1 ✅ | CT-01 | |
| 2 ✅ | CT-01 | |
| 3 ✅ | CT-01 | |
| 4 ✅ | CT-01+CT-02 | |
| 5 ✅ | CT-01+CT-02 | |
| 6 ✅ | CT-03+CT-04 | |
| 7 ✅ | CT-02+CT-03+CT-04 | |

**Pregunta de cierre:** ¿Qué ejercicio te pareció más difícil y por qué?

> _________________________________________________

> Las **soluciones completas** están en `S01_Ejercicios_Soluciones.md`. Úsalas SOLO después de intentar sinceramente.
