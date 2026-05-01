# SÍLABO

**Curso:** Fundamentos de programación en Python y R
**Programa:** PEBIBA XVIII — Programa de Especialización en Business Intelligence & Business Analytics
**Universidad Nacional de Ingeniería · Facultad TBD**

---

## I. INFORMACIÓN GENERAL

| Campo | Valor |
|---|---|
| Código del curso | TBD (asignar coordinación PEBIBA) |
| Programa | PEBIBA XVIII |
| Edición | XVIII-2026 |
| Modalidad | Virtual sincrónica |
| Horas totales | 8 |
| Sesiones | 2 (consecutivas, una por semana, 4h cada una) |
| Fecha de inicio | TBD |
| Idioma de instrucción | Español (con código y referencias técnicas en inglés) |
| Docente | **Cand. Dr. Jordan King Rodríguez Mallqui** — Doctorando en Ciencias e Ingeniería Estadística (UNI, 2° año), MSc Data Science (UPC), BSc Ingeniería Estadística UNI (1er puesto). Senior Manager Pricing Analytics & Data en BBVA Perú · [jordandataexpert.com](https://www.jordandataexpert.com/about) |
| Correo | jrodriguezm216@gmail.com |

---

## II. SUMILLA

El curso introduce a profesionales del ámbito de Business Intelligence y Business Analytics —con dominio de Excel y SQL pero sin experiencia previa en programación— al uso de **Python** y **R** como herramientas complementarias para automatizar y enriquecer su trabajo analítico. Mediante un enfoque bilingüe en paralelo, el participante construye su modelo mental de programación viendo el mismo concepto desde dos lenguajes, identificando trampas asimétricas y desarrollando criterio para elegir la herramienta apropiada según el problema. El curso culmina con la construcción de un mini-pipeline de datos end-to-end (carga, limpieza y visualización) replicable en cualquiera de los dos lenguajes.

---

## III. RESULTADO DE APRENDIZAJE TERMINAL

> Al finalizar el curso, el participante **construye un mini-pipeline de datos (cargar, limpiar, visualizar)** en ambos lenguajes —Python y R— partiendo de un CSV o consulta SQL de un caso de negocio realista, justificando técnicamente cuándo conviene cada lenguaje.

---

## IV. COMPETENCIAS TERMINALES

Las siguientes 7 competencias están detalladas en formato ABCD y mapeadas a niveles de la Taxonomía de Bloom revisada en `02Estructura/competency_matrix.md`.

| # | Competencia | Bloom |
|---|---|---|
| **CT-01** | Explica el modelo mental de variables, listas/vectores y data.frames diferenciando Python y R | Comprender |
| **CT-02** | Lee idiomáticamente fragmentos de código Python y R sin ejecutarlos | Comprender |
| **CT-03** | Carga datos desde CSV con `pandas.read_csv` y `readr::read_csv`, manejando encoding y separadores | Aplicar |
| **CT-04** | Diagnostica calidad de datos (tipos, nulos, duplicados) en DataFrames y tibbles | Aplicar |
| **CT-05** | Manipula datos tabulares (filtrar, seleccionar, agregar) usando `pandas` y `dplyr` | Aplicar |
| **CT-06** | Decide qué lenguaje (Python o R) usar para un problema dado, justificando la elección | Analizar |
| **CT-07** | Construye un mini-pipeline end-to-end reproducible en al menos uno de los dos lenguajes | Crear |

**Distribución Bloom:** 0% Recordar · 29% Comprender · 43% Aplicar · 14% Analizar · 0% Evaluar · 14% Crear.

---

## V. CONTENIDOS POR SESIÓN

### Sesión 01 — De Excel/SQL a Python+R: sintaxis y carga de datos (4h)

**Competencias trabajadas:** CT-01, CT-02, CT-03, CT-04 (intro)

**Contenidos:**
- Por qué scripting (vs. clic en Excel/Power BI). Reproducibilidad y trazabilidad.
- Variables, tipos básicos (numérico, string, lógico) en Python y R.
- Estructuras: listas (Python) vs vectores (R), diccionarios (Python) vs listas con nombre (R), DataFrame vs data.frame/tibble.
- **Trampa #1 (Notional Machine):** asignación por referencia (Python) vs copy-on-modify (R).
- **Trampa #2:** indexado base-0 (Python) vs base-1 (R).
- Lectura de CSV: `pandas.read_csv` y `readr::read_csv`. Encoding (UTF-8, latin1), separador (`,`, `;`).
- Inspección inicial: `.head()`, `.info()`, `.describe()` (Python); `head()`, `glimpse()`, `summary()` (R).
- Caso de negocio: dataset de ventas trimestrales de "Acme Corp B2B".

**Estrategia:** PRIMM (Predict-Run-Investigate-Modify-Make) en cada bloque de 25 min. Live coding con error deliberado #1 (`:` faltante) y predicción de output con `lista = otra_lista`.

**Bibliografía base:** VanderPlas (2023) cap. 3; Wickham & Grolemund (2023) cap. 7-8.

---

### Sesión 02 — Manipulación, visualización y pipeline integrador (4h)

**Competencias trabajadas:** CT-04 (refuerzo), CT-05, CT-06, CT-07

**Contenidos:**
- Manipulación tabular en pandas: `.query`, `.loc`, `.groupby` + `.agg`, encadenamiento de métodos.
- Manipulación tabular en dplyr: `filter`, `select`, `mutate`, `group_by`, `summarise`, pipe `|>`.
- **Arena Python vs R:** mismo set de 3 preguntas de negocio resuelto en ambos lenguajes, lado a lado.
- Visualización básica: matplotlib/seaborn (`plt.bar`, `sns.scatterplot`) y ggplot2 (`geom_bar`, `geom_point`, `aes`).
- **Heurística de decisión:** ¿cuándo Python, cuándo R? Ecosistema, audiencia, integración (Power BI, Tableau, etc.).
- **Mini-proyecto integrador:** dado el dataset Acme Corp, cargar → limpiar → agregar → visualizar el "Top 5 productos por ventas Q4".

**Estrategia:** worked example al inicio, faded guidance al medio, ejercicio independiente con asserts de verificación al final. Productive Failure en CT-06: 5 escenarios sin guía antes de discutir la heurística.

**Bibliografía base:** VanderPlas (2023) cap. 4; Wickham & Grolemund (2023) cap. 3-4 y 12.

---

## VI. METODOLOGÍA

El taller adopta un enfoque **Backward Design** (Wiggins & McTighe): primero se definieron las competencias terminales, luego la evaluación formativa, y finalmente las actividades de aprendizaje. Esta filosofía garantiza alineamiento entre lo que se enseña, se practica y se verifica.

**Estrategias activas aplicadas:**

- **PRIMM** (Sentance et al., 2019): cada Micro-Desafío sigue el ciclo Predict-Run-Investigate-Modify-Make.
- **Worked Examples → Faded Guidance → Independent Practice**: progresión de andamiaje a lo largo de cada sesión.
- **Notional Machines** (du Boulay, Sorva): el formato bilingüe Python+R en paralelo fuerza al participante a comparar dos modelos mentales del mismo problema, profundizando comprensión.
- **Productive Failure** (Kapur, 2008): atascarse antes de la solución oficial en ejercicios estratégicos.
- **Retrieval Practice** (Roediger): micro-quizzes intra-sesión para activar memoria, no para calificar.
- **Cognitive Apprenticeship**: el docente verbaliza su pensamiento experto durante el live coding, no solo el resultado.

**Recursos para el participante:**

- Notebooks Jupyter ejecutables (uno Python, uno R espejo) por cada sesión.
- Tabla **Rosetta Python ↔ R** para consulta permanente.
- Documento **Trampas asimétricas** con los errores más comunes del programador bilingüe.
- Slides en formato Marp con identidad UNI.
- Cheatsheets de pandas y dplyr.
- Glosario y bibliografía evolutiva.

---

## VII. EVALUACIÓN

Este taller, por su carácter intensivo y de extensión profesional, **no contempla evaluación sumativa con calificación numérica**.

**Componentes:**

| Componente | Tipo | Peso | Requisito |
|---|---|---|---|
| Asistencia día 1 | Binaria | — | ≥80% del bloque |
| Asistencia día 2 | Binaria | — | ≥80% del bloque |
| Participación / talleres en clase | Formativa | — | No califica nota; sí certificado |
| Mini-proyecto entregable | **Opcional** | — | Solo para alumnos avanzados que deseen feedback |

**Certificado:** Se otorga **Certificado de Aprovechamiento PEBIBA** al participante que cumpla el requisito de asistencia mínima.

**Evaluación formativa:** durante las sesiones se aplican micro-quizzes (1 cada 25-30 min) para Retrieval Practice. No se califican; sirven al docente para diagnosticar comprensión y al alumno para activar memoria.

### Política institucional

**Asistencia:** mínimo 80% por sesión para certificación.

**Plagio:** el copy-paste de código sin atribución es deshonestidad académica. Citar fuentes (Stack Overflow, documentación, blog posts, IA generativa) es buena práctica profesional, no demérito.

**Uso de IA generativa (Claude, ChatGPT, GitHub Copilot, etc.):**

> **Permitido y bienvenido**, con dos requisitos:
>
> 1. **Declarar el uso** al final del entregable: qué herramienta usaste, en qué partes, qué prompts diste.
> 2. **Auditabilidad:** debes poder explicar línea por línea el código que entregas. La IA es asistente, no autor.
>
> Esta política refleja la realidad del profesional 2026: la IA es parte del stack. El curso te enseña a **usarla bien** (prompting efectivo, verificación de outputs, debugging asistido), no a evitarla.

---

## VIII. BIBLIOGRAFÍA

### Base

1. VanderPlas, J. (2023). *Python Data Science Handbook* (2nd ed.). O'Reilly.
   `https://jakevdp.github.io/PythonDataScienceHandbook/`
2. Wickham, H., & Grolemund, G. (2023). *R for Data Science* (2nd ed.). O'Reilly.
   `https://r4ds.hadley.nz/`
3. Downey, A. (2015). *Think Python: How to Think Like a Computer Scientist* (2nd ed.). Green Tea Press.
   `https://greenteapress.com/wp/think-python-2e/`
4. Wickham, H. (2019). *Advanced R* (2nd ed.). Chapman & Hall/CRC.
   `https://adv-r.hadley.nz/`
5. Sentance, S., Waite, J., & Kallia, M. (2019). Teaching computer programming with PRIMM: A sociocultural perspective. *Computer Science Education*, 29(2-3), 136-160.

### Complementaria

6. Brown, P. C., Roediger, H. L., & McDaniel, M. A. (2014). *Make It Stick: The Science of Successful Learning*. Harvard University Press.
7. Sorva, J. (2013). Notional machines and introductory programming education. *ACM Transactions on Computing Education*, 13(2), 1-31.
8. Pandas team. *Pandas Cheat Sheet*. `https://pandas.pydata.org/Pandas_Cheat_Sheet.pdf`
9. RStudio. *Data Transformation with dplyr Cheatsheet*. `https://posit.co/wp-content/uploads/2022/10/data-transformation-1.pdf`
10. Real Python. `https://realpython.com/`

> Bibliografía evolutiva en `03Material/recursos/bibliografia.md`.

---

## IX. CRONOGRAMA

| Sesión | Fecha | Hora | Tema | Evaluación formativa |
|---|---|---|---|---|
| S01 | TBD | 4h | Sintaxis y carga de datos | Quiz 1.1, 1.2 (PRIMM); Taller intra-clase |
| S02 | TBD (siguiente sesión) | 4h | Manipulación, visualización y pipeline | Quiz 2.1 (lectura cruzada); Arena Py vs R; Mini-proyecto integrador (opcional) |

---

## X. ANEXOS

- **Glosario evolutivo:** `03Material/recursos/glosario.md`
- **Bibliografía evolutiva:** `03Material/recursos/bibliografia.md`
- **Software requerido:** `03Material/00_Onboarding/README.md`
- **Matriz de competencias detallada (ABCD + Bloom):** `02Estructura/competency_matrix.md`
- **Repositorio del curso:** TBD (GitHub privado del docente)

---

## Instrucciones para conversión a `.docx` formato UNI

Este sílabo está en **Markdown** para ser editable y versionable. Para entregar a coordinación PEBIBA en formato `.docx` requerido:

1. Abrir la plantilla institucional `Plantilla Silabo - Curso - PECD.docx` (en Drive: `08PECD/02Aprendizaje Supervisado/`).
2. Pegar el contenido de cada sección romana en su correspondiente sección de la plantilla.
3. Aplicar estilos del documento Word (no del Markdown copiado).
4. Guardar como `Silabo_FundamentosPyR_v4_formato_UNI.docx` en la raíz de este curso.

> Como alternativa, usar `pandoc` con la plantilla:
> ```bash
> pandoc Silabo_FundamentosPyR_v1.md -o Silabo_FundamentosPyR_v4_formato_UNI.docx --reference-doc="Plantilla Silabo - Curso - PECD.docx"
> ```

---


