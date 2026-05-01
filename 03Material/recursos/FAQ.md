# FAQ — Fundamentos de Python y R

> Preguntas frecuentes recolectadas a lo largo del taller.

---

## Sobre el curso

### ¿Necesito saber programar antes?

**No.** El taller asume que **NO** sabes programar. Asume que sabes Excel y SQL — eso es suficiente.

### ¿Necesito saber estadística?

**No.** El taller no es de análisis estadístico avanzado. Es de fundamentos de programación con datos.

### ¿Es solo Python o solo R?

**Ambos en paralelo.** Verás cada concepto en los dos lenguajes lado a lado. Al final podrás leer código en cualquiera y elegir cuál usar según el problema.

### ¿Cuánto tiempo de práctica entre las dos sesiones?

Recomendado: **2-3 horas**. Lectura de TRAPS, ROSETTA, y completar los TODOs del notebook Alumno.

---

## Sobre el setup

### ¿Anaconda o miniconda?

Cualquiera. **Anaconda** trae todo instalado de fábrica (más cómodo). **miniconda** es más liviano si tienes poco espacio.

### ¿Qué pasa si tengo Python 3.8 o anterior?

Algunos comandos de pandas modernos pueden fallar. **Recomendado: 3.11+**.

### ¿Qué hago si IRkernel no funciona en Jupyter?

Tres opciones:

1. **Reinstalar:** abre R en consola, `install.packages('IRkernel'); IRkernel::installspec()`.
2. **Usar RStudio en lugar de Jupyter** para los notebooks R (no es ideal pero sirve).
3. **Hacer S01 solo con Python** y la parte R verla como lectura.

### ¿Puedo usar Google Colab?

Sí para Python. Para R necesitarás IRkernel — es un poco más complicado pero hay tutoriales.

---

## Durante la clase

### Me atasqué en un ejercicio. ¿Miro la solución?

Espera **5 minutos** intentando. Si pasa de eso:

1. Lee la pista del enunciado.
2. Pregunta en chat.
3. Mira la primera línea de la solución (no toda).

**Nunca** copies la solución sin entenderla.

### ¿Puedo usar ChatGPT/Claude/Copilot durante la clase?

**Sí** — siempre que **declares** y **puedas explicar línea por línea** lo que pegues. La política completa está en el sílabo.

### Mi notebook se "rompió" — ¿qué hago?

1. **Reiniciar el kernel** (menú Kernel > Restart).
2. Si persiste: **descarga la versión Maestro** y compara.
3. Si nada funciona: pide ayuda en chat.

### No me cuadra la respuesta. ¿Estoy mal?

Probablemente algún detalle:
- ¿Cargaste el dataset reciente?
- ¿`parse_dates=['fecha']`?
- ¿Filtraste antes de agregar?

**Pega tu código en chat.** Yo o un compañero te dice qué falta.

---

## Después del curso

### ¿Qué leo después?

**Python:**
- *Python Data Science Handbook* (VanderPlas) — caps 3-4 — gratis online
- *Effective Pandas* (Matt Harrison) — 100 páginas, oro

**R:**
- *R for Data Science* (Wickham, Grolemund) — caps 1-12 — gratis online
- *Advanced R* (Wickham) — para entender por qué R es así

### ¿Cómo sigo practicando?

**3 niveles:**

1. **Replicar lo del curso** con el dataset de tu trabajo (lo más útil).
2. **Datasets públicos:** https://www.kaggle.com/ , https://www.openml.org/
3. **Proyectos reales:** automatizar UN reporte que hacías a mano.

### ¿El mini-proyecto es obligatorio?

**No.** Pero te lo recomiendo si quieres feedback escrito mío sobre tu código. **No tiene nota** — es solo aprendizaje.

### ¿Hay un curso siguiente?

PEBIBA tiene módulos posteriores:
- **Estadística aplicada con R** (siguiente trimestre)
- **Machine Learning con Python** (más adelante)

Pregunta a coordinación PEBIBA por el cronograma completo.

---

## Errores comunes y soluciones rápidas

### `ModuleNotFoundError: No module named 'pandas'`

Tu Jupyter está usando un kernel sin pandas. Soluciones:

```bash
conda activate fundamentos-pyr
pip install pandas
```

Y reinicia Jupyter.

### `UnicodeDecodeError` al leer CSV

Encoding mal. Prueba:

```python
pd.read_csv('archivo.csv', encoding='latin1')
# o:
pd.read_csv('archivo.csv', encoding='cp1252')
```

### `KeyError: 'columna'` en pandas

La columna no existe con ese nombre exacto. Verifica:

```python
print(df.columns.tolist())
```

A veces hay espacios invisibles: `'columna '` ≠ `'columna'`. Limpieza:

```python
df.columns = df.columns.str.strip()
```

### `ValueError: The truth value of a Series is ambiguous`

Estás usando `and`/`or` con Series. Cambia a `&`/`|` con paréntesis:

```python
# ❌
df.loc[df.x > 5 and df.y < 10]

# ✅
df.loc[(df.x > 5) & (df.y < 10)]
```

### En R: `Error: object 'X' not found`

R distingue mayúsculas. `df` ≠ `DF`. Verifica el nombre exacto.

### En R: tu código devuelve `NA` cuando no debería

Probablemente tienes un NA en el vector. Soluciones:

```r
mean(x, na.rm = TRUE)
sum(x, na.rm = TRUE)
```

---

## Política de uso de IA

> Repetida del sílabo porque importa.

**SÍ puedes:**
- Pedir a Claude/ChatGPT que te explique código que no entiendes.
- Pedir ayuda con un error que no puedes resolver.
- Pedir alternativas a una solución que ya tienes.

**Debes:**
- **Declarar** al final del entregable: qué herramienta y para qué.
- **Poder explicar** cada línea que entregas.
- **Verificar** el output (la IA a veces inventa).

**No deberías:**
- Pedir el "ejercicio completo" sin haber intentado.
- Entregar código que no entiendes.
- Esconder el uso de IA.

> *Aprende a USAR la IA bien — no a depender de ella.*

---

## Contacto

**Correo del docente:** [jrodriguezm216@gmail.com](mailto:jrodriguezm216@gmail.com) · [jordandataexpert.com](https://www.jordandataexpert.com/about)

**Grupo del curso:** WhatsApp/Slack (compartido por coordinación PEBIBA)

---

*FAQ del curso PEBIBA XVIII · 2026 · vivo y se actualiza con preguntas reales de cohortes.*
