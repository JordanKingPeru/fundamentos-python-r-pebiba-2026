# 🐍📊 Fundamentos de programación en Python y R

> **PEBIBA XVIII** · Programa de Especialización en Business Intelligence & Business Analytics
> Universidad Nacional de Ingeniería · 2026

**Bienvenido al taller.** En 8 horas vas a pasar de Excel y SQL a tu primer pipeline de datos en código — Python y R en paralelo.

---

## ✨ El curso en una frase

> Profesionales BI/BA con dominio de Excel y SQL **construyen su primer pipeline de datos reproducible** en **8 horas**, viendo Python y R lado a lado para tener criterio sobre cuándo usar cada uno.

---

## 🎯 Lo que vas a poder hacer al terminar

> **Construir un mini-pipeline de datos** (cargar → limpiar → agregar → visualizar) en ambos lenguajes, partiendo de un CSV o consulta SQL de un caso de negocio realista, y **justificar cuándo conviene cada lenguaje**.

🌐 *Las 7 competencias terminales formato ABCD + Bloom* → [`02Estructura/competency_matrix.md`](02Estructura/competency_matrix.md)

---

## 📐 Estructura del taller

```
                    [PEBIBA XVIII · 2026 · 8 horas en 2 sesiones virtuales]

  ┌────────────────────────────┐         ┌────────────────────────────┐
  │ Sesión 01 · 4h             │   ───►  │ Sesión 02 · 4h             │
  │ Sintaxis y carga de datos  │         │ Manipulación y pipeline    │
  │                            │         │                            │
  │ • Variables y tipos        │         │ • filter / group / agg     │
  │ • Listas y vectores        │         │ • Method chaining + pipe   │
  │ • ⚠️ Trampa #1 (mutación)  │         │ • Visualización            │
  │ • ⚠️ Trampa #2 (indexado)  │         │ • ¿Python o R?             │
  │ • Carga de CSV             │         │ • 🎯 Pipeline integrador   │
  │ • Diagnóstico inicial      │         │                            │
  └────────────────────────────┘         └────────────────────────────┘
```

---

## 🚀 Cómo arrancar (3 pasos antes de la Sesión 01)

### 1️⃣ Instala tu entorno

📂 Abre la guía de instalación: [`03Material/00_Onboarding/README.md`](03Material/00_Onboarding/README.md)

Vas a instalar:
- **Anaconda** (incluye Python + Jupyter)
- **R 4.3+** y el kernel `IRkernel` (para correr R dentro de Jupyter)
- Paquetes: pandas, numpy, matplotlib, seaborn, tidyverse

⏱️ Tiempo estimado: **30–45 min** con buena conexión.

### 2️⃣ Verifica que todo funciona

Abre el notebook de verificación y ejecútalo de principio a fin:

📓 [`03Material/00_Onboarding/00_Verificacion_Setup.ipynb`](03Material/00_Onboarding/00_Verificacion_Setup.ipynb)

Si las **6 pruebas pasan en verde**, estás listo. Si algo falla:
- Lee el mensaje de error.
- Revisa la sección **"Si algo falla"** del onboarding.
- Si sigues atascado: **escribe al correo del docente** con captura de pantalla (ver al final de este README).

### 3️⃣ (Opcional) Lee el sílabo

📄 [`Silabo_FundamentosPyR.pdf`](Silabo_FundamentosPyR.pdf) — formato PEBIBA-UNI. Visión completa del taller: sumilla, contenidos, metodología, evaluación y bibliografía.

---

## 🗂️ Cómo navegar el repositorio

```
Fundamentos_Python_R/
│
├── 📄 README.md                    ← este archivo
├── 📄 Silabo_FundamentosPyR.pdf    Sílabo formato PEBIBA-UNI
│
├── 📁 02Estructura/                Diseño curricular del curso
│   └── competency_matrix.md        7 competencias terminales (ABCD + Bloom)
│
├── 📁 03Material/
│   │
│   ├── 📁 00_Onboarding/           ⬅️ EMPIEZA AQUÍ
│   │   ├── README.md                  Guía de instalación
│   │   ├── INSTALACION.md             Guía paso a paso para VS Code + conda
│   │   ├── environment.yml            Definición del entorno Python + R (1 comando)
│   │   ├── 00_Verificacion_Setup.ipynb   Verifica tu entorno
│   │   └── S00_Bienvenida.pdf         Slides de apertura
│   │
│   ├── 📁 01_Sesion_Sintaxis_Carga/    Sesión 01 — Día 1
│   │   ├── README.md
│   │   ├── notebooks/
│   │   │   ├── S01_..._PY_Alumnos.ipynb   ⬅️ Tu notebook (con # TODO:)
│   │   │   ├── S01_..._R.ipynb            ⬅️ Notebook espejo en R
│   │   │   ├── S01_..._ROSETTA.md         Tabla de equivalencias Python↔R
│   │   │   └── S01_..._TRAPS.md           5 trampas asimétricas críticas
│   │   ├── slides/
│   │   │   └── S01_Slides.pdf             Diapositivas de la sesión
│   │   ├── ejercicios/
│   │   │   └── S01_Ejercicios.md          Rampa de 7 niveles graduados
│   │   └── data/
│   │       ├── acme_ventas.csv            Dataset principal (5,000 × 12)
│   │       └── generar_dataset.py         Script para regenerar
│   │
│   ├── 📁 02_Sesion_Manipulacion_Pipeline/  Sesión 02 — Día 2
│   │   └── (estructura espejo de Sesión 01)
│   │
│   └── 📁 recursos/                      Material transversal
│       ├── utils.py                      Helpers reutilizables
│       ├── config.py                     Constantes globales
│       ├── glosario.md                   Definiciones evolutivas
│       ├── bibliografia.md               Referencias APA 7
│       ├── FAQ.md                        Preguntas frecuentes
│       └── cheatsheets/
│           ├── cheatsheet_pandas.md
│           ├── cheatsheet_dplyr.md
│           ├── cheatsheet_visualizacion.md
│           └── cheatsheet_trampas.md     10 trampas asimétricas Python ↔ R
│
└── 📁 07Evaluación/
    ├── README.md
    ├── formative_assessment_kit.md       Micro-quizzes que verás en clase
    ├── encuesta_post_curso.md            La completarás al cierre
    └── miniproyecto/                     OPCIONAL · sin nota · CON feedback
        ├── enunciado.md
        ├── rubrica.md                    4 dimensiones × 4 niveles
        └── dataset_test/
            └── acme_ventas_2026Q1.csv    Dataset NUEVO (no visto en clase)
```

---

## 🗓️ Cronograma de aprendizaje

| Momento | Qué hacer | Dónde |
|---|---|---|
| **Antes de la Sesión 01** | Instalar Anaconda + IRkernel · Ejecutar notebook de verificación · (Opcional) leer sílabo | [00_Onboarding/](03Material/00_Onboarding/) |
| **Día 1** (4h en vivo) | Seguir slides + completar el notebook Alumno con tus TODOs | [01_Sesion_Sintaxis_Carga/](03Material/01_Sesion_Sintaxis_Carga/) |
| **Entre sesiones** (15 min) | Leer las 5 trampas (TRAPS) + hojear ROSETTA · Verificar que tu kernel R funciona | Carpeta de la Sesión 01 |
| **Día 2** (4h en vivo) | Arena Python vs R · Visualización · 🎯 Construyes tu pipeline integrador | [02_Sesion_Manipulacion_Pipeline/](03Material/02_Sesion_Manipulacion_Pipeline/) |
| **Cierre del Día 2** | Encuesta corta (5 min) | [07Evaluación/encuesta_post_curso.md](07Evaluación/encuesta_post_curso.md) |
| **Post-curso** (opcional, 7 días) | Mini-proyecto con dataset NUEVO + feedback escrito del docente | [07Evaluación/miniproyecto/](07Evaluación/miniproyecto/) |

---

## 📚 Cómo se evalúa este taller

Por su carácter intensivo y de extensión profesional, **no hay calificación numérica**.

| Componente | Tipo | ¿Califica nota? |
|---|---|---|
| Asistencia ≥ 80% por sesión | Binaria | No |
| Participación / talleres en clase | Formativa | No |
| Mini-proyecto entregable | **Opcional** | No (recibes feedback escrito) |

🧠 Durante las sesiones harás **micro-quizzes** intra-sesión (1 cada 25 min). **No se califican** — sirven para activar memoria y darte feedback inmediato sobre lo que ya dominas y lo que falta reforzar.

---

## 🤖 Política sobre uso de IA generativa (Claude, ChatGPT, Copilot…)

**Permitida y bienvenida**, con dos requisitos:

1. **Declara su uso** al final del entregable: qué herramienta, en qué partes, qué prompts diste.
2. **Auditabilidad**: debes poder explicar línea por línea el código que entregas. La IA es asistente, no autor.

> *El profesional 2026 usa IA en su trabajo todos los días.
> Este curso te enseña a usarla bien — no a evitarla.*

📄 Detalle completo en el [sílabo](Silabo_FundamentosPyR_v1.md), sección VII.

---

## 🧰 Material que recibes (ya incluido en el repo)

- ✅ **Notebooks** Python (versión Alumno con TODOs) y R (espejo completo) por cada sesión
- ✅ **Tabla Rosetta Python ↔ R** acumulada — tu referencia rápida durante todo el curso
- ✅ **Documento de Trampas asimétricas** — los 10 errores más comunes del programador bilingüe
- ✅ **Slides en PDF** + el markdown fuente (Marp) para que veas cómo se hicieron
- ✅ **Ejercicios graduados** (rampa de 7 niveles: Worked Example → Parsons → PRIMM → Faded → Independent → Transfer)
- ✅ **4 cheatsheets** imprimibles (pandas, dplyr, visualización, trampas)
- ✅ **2 datasets sintéticos** realistas (5,000 + 1,500 filas) con outliers y casos borde reales
- ✅ **Glosario, bibliografía y FAQ** evolutivos

---

## 📚 Lecturas recomendadas (todas con versión gratuita open-access)

1. **VanderPlas, J. (2023).** *Python Data Science Handbook* (2nd ed.). O'Reilly. — [Leer online](https://jakevdp.github.io/PythonDataScienceHandbook/)
2. **Wickham, H., & Grolemund, G. (2023).** *R for Data Science* (2nd ed.). O'Reilly. — [Leer online](https://r4ds.hadley.nz/)
3. **Downey, A. (2015).** *Think Python* (2nd ed.). Green Tea Press. — [Leer online](https://greenteapress.com/wp/think-python-2e/)

📖 Bibliografía completa en [`03Material/recursos/bibliografia.md`](03Material/recursos/bibliografia.md).

---

## 👨‍🏫 Sobre el docente

<table>
<tr>
<td width="200" align="center">

<img src="03Material/00_Onboarding/assets/jordan_pro.jpg" width="180" alt="Cand. Dr. Jordan King Rodríguez Mallqui" />

</td>
<td>

### Cand. Dr. Jordan King Rodríguez Mallqui

**Senior Manager · Pricing Analytics & Data — BBVA Perú**

🎓 **Doctorando** en Ciencias e Ingeniería Estadística — UNI (2° año)
🎓 **MSc** Data Science — UPC · **BSc** Ingeniería Estadística — UNI *(1er puesto)*

🏆 **Top Talent BBVA** 2022 & 2023
🥇 1er puesto Hackatón Internacional AWS BBVA · 1er puesto Datathon por la Integridad
📚 10 publicaciones internacionales en analítica avanzada
👨‍🏫 7+ años dictando PEBIBA UPROBYS-UNI · 300+ alumnos formados

🌐 [jordandataexpert.com](https://www.jordandataexpert.com/about) · 📧 [jrodriguezm216@gmail.com](mailto:jrodriguezm216@gmail.com)
[GitHub](https://github.com/JordanKingPeru) · [LinkedIn](https://www.linkedin.com/in/jordan-rodriguez-peru)

</td>
</tr>
</table>

> *"No te enseña un teórico. Te enseña alguien que también construye modelos en producción todos los días."*

---

## 📞 Cómo pedir ayuda

📧 **Correo del docente:** [jrodriguezm216@gmail.com](mailto:jrodriguezm216@gmail.com)

⏱️ **Tiempo de respuesta:** menos de 24 horas (en días hábiles).

🌐 **Web:** [jordandataexpert.com](https://www.jordandataexpert.com/about)

📌 Antes de escribir: revisa primero el [`recursos/FAQ.md`](03Material/recursos/FAQ.md) — probablemente tu duda ya está respondida ahí.

---

## 📜 Licencia y atribución

Este material se libera bajo licencia **Creative Commons BY-NC-SA 4.0** ([texto completo](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.es)):

- ✅ Puedes **compartir y adaptar** este material
- ✅ Debes **dar crédito** al autor (Cand. Dr. Jordan King Rodríguez Mallqui · UNI)
- ❌ **No puedes usarlo con fines comerciales** sin autorización
- ✅ Si lo modificas, debes distribuirlo bajo la **misma licencia**

**Cita sugerida** (formato APA 7):

> Rodríguez Mallqui, J. K. (2026). *Fundamentos de programación en Python y R* [Material de curso]. PEBIBA XVIII, Universidad Nacional de Ingeniería. https://github.com/JordanKingPeru/fundamentos-python-r-pebiba-2026

---

> 🎯 **¿Listo para empezar?** Tu siguiente paso es [`03Material/00_Onboarding/README.md`](03Material/00_Onboarding/README.md).
