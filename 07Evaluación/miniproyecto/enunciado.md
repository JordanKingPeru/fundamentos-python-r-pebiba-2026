# Mini-Proyecto: Tu Primer Pipeline de Datos (OPCIONAL)

> Para participantes que quieran demostrar el resultado terminal del taller y recibir feedback escrito del docente.
> **Sin nota.** Sin penalidad si no entregas.
> **Plazo:** 7 días después del cierre del taller.

---

## Contexto de negocio

Eres analista en **Acme Corp B2B**, empresa peruana de distribución mayorista. Tu jefe te pasa un nuevo CSV con las ventas de **Q1-2026** (los primeros 3 meses de este año, datos que NO viste en clase) y te pide:

> *"Antes de la reunión del lunes, dame un reporte rápido con: top 5 productos por ingresos, distribución de ventas por región, y al menos un hallazgo de calidad de datos que debamos arreglar."*

Tienes el CSV `acme_ventas_2026Q1.csv` (provisto en la carpeta `dataset_test/`).

---

## Lo que debes entregar

**Un solo notebook** (Python o R, tú eliges) que:

1. **Cargue** el CSV correctamente, manejando encoding y separador.
2. **Diagnostique** la calidad de los datos: identifica al menos 3 hallazgos sobre tipos, nulos, duplicados o valores sospechosos.
3. **Limpie** lo que sea necesario para responder las preguntas de negocio.
4. **Agregue** los datos para responder las 2 preguntas:
   - Top 5 productos por ingresos en Q1-2026.
   - Distribución de ventas por región.
5. **Visualice** cada respuesta con un gráfico apropiado (1 gráfico de barras para top 5, 1 gráfico para distribución regional).
6. **Cierre** con un párrafo de 5-8 líneas de "conclusiones para la reunión" — escrito en lenguaje de negocio, no técnico.

---

## Formato de entrega

- Notebook (`.ipynb`) ejecutable de principio a fin sin errores.
- Nombre del archivo: `Apellido_Nombre_MiniProyecto.ipynb`.
- Si usaste IA generativa (Claude, ChatGPT, Copilot), **declara al final del notebook** qué herramienta usaste y para qué partes (ver política IA del sílabo).
- Subir a la carpeta compartida del taller (link entregado por coordinación PEBIBA).

---

## Criterios de feedback

Tu docente te dará feedback escrito según la **rúbrica analítica** de 4 dimensiones (ver `rubrica.md`):

1. **Corrección técnica** — el código corre sin errores y responde la pregunta.
2. **Limpieza y reproducibilidad** — código legible, sin pasos manuales, paths relativos.
3. **Diagnóstico de datos** — qué hallazgos detectaste, qué tan profundo fue el examen.
4. **Comunicación de negocio** — el cierre se entiende sin saber Python/R.

Cada dimensión califica en 4 niveles: **Insuficiente · En desarrollo · Logrado · Sobresaliente**. Es feedback formativo, no nota.

---

## Pistas (úsalas si te atascas)

- ⚠️ El CSV puede tener encoding latin1 (ñ, tildes). Si ves `?`, ajusta `encoding` o `locale`.
- 💡 `df.info()` (Python) o `glimpse(df)` (R) son la primera línea del diagnóstico.
- 💡 Para "top 5 por ingresos", asegúrate de que ingresos = precio × cantidad si las columnas vienen separadas.
- 🧠 La distribución regional puede ser por **monto total** o por **% del total** — decide cuál cuenta mejor la historia.
- 🧠 Si tu gráfico de barras tiene > 12 categorías y todas son ilegibles, agrupa "Otros".

---

## Política sobre IA generativa (recordatorio)

- **Permitido y bienvenido.** Pero declara y audita.
- Tienes que poder **explicar línea por línea** cualquier código que pegues. Si no puedes, no lo entregues.
- Buenos prompts a Claude/ChatGPT:
  - "Explícame qué hace `df.groupby('a').agg({'b': 'sum'})`"
  - "¿Por qué este error: `KeyError: 'fecha'`?"
- Malos prompts:
  - "Hazme el mini-proyecto completo de pandas con dataset Acme Corp"

---

## Apoyo

- **Contacto del docente:** [jrodriguezm216@gmail.com](mailto:jrodriguezm216@gmail.com) · [jordandataexpert.com](https://www.jordandataexpert.com/about). Respuesta en menos de 24h.
- **Bibliografía:** ver `recursos/bibliografia.md`.

---

> Tu pipeline reproducible es un **artefacto profesional** que puedes mostrar en tu portafolio. Toma 4-6 horas en total. Vale la pena.
