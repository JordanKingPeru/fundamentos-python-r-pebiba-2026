---
marp: true
theme: default
size: 16:9
paginate: true
header: 'Bienvenida · PEBIBA XVIII · 2026'
footer: 'UNI · Cand. Dr. Jordan King Rodríguez Mallqui'
style: |
  :root {
    --uni-crimson: #8A1525;
    --uni-crimson-dark: #5C0E18;
    --slate: #2C3E50;
    --slate-dark: #1F2937;
    --paper: #FAFAFA;
    --gray: #E5E7EB;
    --emerald: #10B981;
    --emerald-light: #D1FAE5;
    --amber: #F59E0B;
    --amber-light: #FEF3C7;
    --neutral: #6B7280;
  }
  section {
    background: var(--paper);
    color: var(--slate);
    font-family: 'Lato', 'Roboto', sans-serif;
    font-size: 24pt;
    padding: 50px 80px;
    line-height: 1.5;
  }
  h1, h2, h3 { font-family: 'Montserrat', sans-serif; color: var(--uni-crimson); font-weight: 800; line-height: 1.1; }
  h1 { font-size: 42pt; margin-top: 0; }
  h2 { font-size: 36pt; }
  h3 { font-size: 26pt; color: var(--slate); }
  blockquote { border-left: 6px solid var(--uni-crimson); padding-left: 20px; color: var(--neutral); font-style: italic; margin: 20px 0; }
  strong { color: var(--uni-crimson); }
  .stat { font-size: 110pt; font-weight: 900; color: var(--uni-crimson); line-height: 1; }
  .stat-mid { font-size: 70pt; font-weight: 900; color: var(--amber); line-height: 1; }
  .stat-label { font-size: 26pt; color: var(--slate); margin-top: 10px; }
  .pro-tip { background: var(--emerald-light); border-left: 6px solid var(--emerald); padding: 14px 22px; border-radius: 6px; margin: 16px 0; }
  /* Tarjeta del docente — layout pro */
  .bio-card { display: grid; grid-template-columns: 320px 1fr; gap: 50px; align-items: center; padding: 0; height: 100%; }
  .bio-photo { display: flex; align-items: center; justify-content: center; }
  .bio-photo img {
    width: 290px; height: 520px; object-fit: cover; object-position: center 28%;
    border-radius: 16px;
    border: 5px solid var(--amber);
    box-shadow: 0 18px 48px rgba(0,0,0,0.45), 0 4px 12px rgba(0,0,0,0.3);
  }
  .bio-eyebrow { font-family: 'Montserrat', sans-serif; font-size: 15pt; color: var(--amber); font-weight: 700; letter-spacing: 0.12em; text-transform: uppercase; margin: 0 0 6px 0; line-height: 1; }
  .bio-name { font-family: 'Montserrat', sans-serif; font-size: 30pt; font-weight: 900; color: white; line-height: 1.05; margin: 0 0 6px 0; letter-spacing: -0.01em; }
  .bio-title { font-size: 18pt; color: var(--amber); font-weight: 600; margin: 0 0 18px 0; line-height: 1.3; }
  .bio-creds { font-size: 16pt; color: rgba(255,255,255,0.92); line-height: 1.55; margin: 0 0 16px 0; }
  .bio-creds strong { color: var(--amber); font-weight: 700; }
  .metrics { display: grid; grid-template-columns: repeat(4, 1fr); gap: 14px; margin: 18px 0; }
  .metric { background: rgba(255,255,255,0.10); border: 1px solid rgba(255,255,255,0.18); border-radius: 10px; padding: 14px 8px; text-align: center; }
  .metric-value { font-family: 'Montserrat', sans-serif; font-size: 30pt; font-weight: 900; color: var(--amber); line-height: 1; }
  .metric-label { font-size: 11pt; color: rgba(255,255,255,0.85); margin-top: 6px; line-height: 1.25; text-transform: uppercase; letter-spacing: 0.04em; }
  .bio-tagline { font-size: 16pt; font-style: italic; color: rgba(255,255,255,0.92); border-left: 4px solid var(--amber); padding-left: 16px; margin: 14px 0; line-height: 1.4; }
  .bio-contact { font-size: 14pt; color: rgba(255,255,255,0.85); margin-top: 14px; }
  .bio-contact a { color: var(--amber); text-decoration: none; font-weight: 600; }
  /* Slide del Mentimeter — diagnóstico inicial */
  .menti-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 60px; align-items: center; padding: 0; height: 100%; }
  .menti-qr { display: flex; align-items: center; justify-content: center; }
  .menti-qr img { width: 360px; height: 360px; border: 8px solid white; border-radius: 12px; box-shadow: 0 12px 32px rgba(0,0,0,0.4); }
  .menti-text h2 { color: var(--amber); font-size: 38pt; margin: 0 0 20px 0; }
  .menti-text .menti-url { font-family: 'Fira Code', 'Consolas', monospace; font-size: 22pt; color: white; background: rgba(255,255,255,0.10); border: 1px solid rgba(255,255,255,0.18); border-radius: 8px; padding: 10px 18px; display: inline-block; margin: 14px 0; }
  .menti-text .menti-step { font-size: 19pt; color: rgba(255,255,255,0.92); line-height: 1.55; margin: 8px 0; }
  .menti-text .menti-step strong { color: var(--amber); }
  /* ===== Slides oscuros: contraste WCAG AA garantizado ===== */
  section.title, section.aha, section.break, section.you {
    color: white;
  }
  section.title h1, section.aha h1, section.break h1, section.you h1 { color: white; }
  section.title strong, section.aha strong, section.break strong, section.you strong { color: var(--amber); }
  section.title blockquote, section.aha blockquote, section.break blockquote, section.you blockquote {
    color: rgba(255,255,255,0.92); border-left-color: var(--amber);
  }
  section.title em, section.aha em, section.break em, section.you em { color: rgba(255,255,255,0.92); }
  section.title .stat, section.aha .stat, section.break .stat, section.you .stat { color: var(--amber); }
  section.title .stat-label, section.aha .stat-label, section.break .stat-label, section.you .stat-label {
    color: rgba(255,255,255,0.95);
  }
  section.title { background: linear-gradient(135deg, var(--uni-crimson) 0%, var(--uni-crimson-dark) 100%); }
  section.title h1 { font-size: 64pt; }
  section.title h2 { color: rgba(255,255,255,0.92); font-size: 32pt; font-weight: 400; }
  section.title p { color: rgba(255,255,255,0.92); }
  section.break { background: var(--slate); }
  section.break h1 { font-size: 76pt; text-align: center; }
  section.break h2 { color: var(--amber); text-align: center; }
  section.aha { background: linear-gradient(135deg, var(--slate) 0%, var(--slate-dark) 100%); text-align: center; }
  section.aha h1 { font-size: 72pt; }
  section.aha h2 { color: var(--amber); font-size: 44pt; }
  section.you { background: var(--uni-crimson); text-align: center; }
  section.you h1 { font-size: 70pt; }
  section.you p { font-size: 28pt; color: rgba(255,255,255,0.95); }
---

<!-- _class: title -->

# Fundamentos de Python y R

## El curso que cambiará la forma en que trabajas con datos

PEBIBA XVIII · 2026
Cand. Dr. Jordan King Rodríguez Mallqui · UNI

---

<!-- _class: aha -->

# **¿Cuánto tiempo<br>pierdes cada semana<br>haciendo lo mismo en Excel?**

---

<!-- _class: aha -->

<div class="stat">7h</div>
<div class="stat-label">tiempo promedio que un analista BI dedica a tareas repetitivas semanales.<br>(Forrester, 2024)</div>

> En 8 horas vamos a recuperar **una jornada completa por semana**.

---

<!-- _class: aha -->

# **El 87% de los analistas BI<br>nunca aprende a programar.**

> *Tú vas a estar en el 13%.*

---

## Lo que harás en 2 sesiones

<div style="font-size: 22pt;">

| | Sesión 01 (4h) | Sesión 02 (4h) |
|---|---|---|
| **Sintaxis básica** | ✅ | recap |
| **Cargar CSV con código** | ✅ | usado |
| **Diagnóstico de datos** | ✅ | usado |
| **Filtrar/agrupar/agregar** | | ✅ |
| **Visualizar con código** | | ✅ |
| **Pipeline reproducible** | | ✅ ← **resultado terminal** |
| **Decidir Python vs R** | | ✅ |

</div>

---

<!-- _class: break -->

# Por qué bilingüe

## Python **y** R en paralelo

---

## La pregunta que te harán en una entrevista

> *"¿Por qué Python y R, no uno solo?"*

**Tres razones.**

---

## Razón #1 — Te entrenas en CONCEPTOS, no sintaxis

> Cuando aprendes solo Python, crees que `groupby` es Python.
> Cuando aprendes solo R, crees que `summarise` es R.
>
> Cuando aprendes ambos al mismo tiempo:
>
> **Aprendes que es AGRUPACIÓN.**
> Universal. Atemporal.

---

## Razón #2 — La realidad de tu trabajo

<div class="pro-tip">

**Tu equipo BI puede usar Python.
Tu equipo de Riesgos puede usar R.
Un consultor externo puede usar SAS.**

**Necesitas leer los tres.**

Cuando puedas pasar de uno a otro sin esfuerzo,
serás el "traductor" de tu organización.
Eso vale.

</div>

---

## Razón #3 — Notional Machines

<div class="stat-mid">2x</div>
<div class="stat-label">comprensión profunda al comparar dos modelos mentales del mismo problema (Sorva, 2013).</div>

> Ver Python y R lado a lado **fuerza** la abstracción.
> Te quita el "creía que entendía" engañoso.

---

<!-- _class: break -->

# Quién soy

## Tu instructor

---

<!-- _class: aha -->

<div class="bio-card">

<div class="bio-photo">

![Cand. Dr. Jordan King Rodríguez](assets/jordan_pro.jpg)

</div>

<div class="bio-content">

<p class="bio-eyebrow">Cand. Dr.</p>
<p class="bio-name">Jordan King Rodríguez Mallqui</p>
<p class="bio-title">Senior Manager · Pricing Analytics & Data — BBVA Perú</p>

<p class="bio-creds">
🎓 <strong>Doctorando</strong> en Ciencias e Ingeniería Estadística — UNI · 2° año<br>
🎓 <strong>MSc</strong> Data Science — UPC · <strong>BSc</strong> Ingeniería Estadística — UNI <em>(1er puesto)</em>
</p>

<div class="metrics">
<div class="metric"><div class="metric-value">300+</div><div class="metric-label">Alumnos formados</div></div>
<div class="metric"><div class="metric-value">10</div><div class="metric-label">Publicaciones internacionales</div></div>
<div class="metric"><div class="metric-value">2×</div><div class="metric-label">Top Talent BBVA</div></div>
<div class="metric"><div class="metric-value">7+</div><div class="metric-label">Años PEBIBA UNI</div></div>
</div>

<p class="bio-tagline">No te enseña un teórico. Te enseña alguien que construye modelos en producción todos los días.</p>

<p class="bio-contact">🌐 <a href="https://www.jordandataexpert.com/about">jordandataexpert.com</a> · 📧 <a href="mailto:jrodriguezm216@gmail.com">jrodriguezm216@gmail.com</a></p>

</div>

</div>

---

<!-- _class: aha -->

<div class="menti-grid">

<div class="menti-qr">

![Escanea para responder](assets/menti_qr.png)

</div>

<div class="menti-text">

## ✋ Antes de empezar — pulso de 90 segundos

<p class="menti-step"><strong>1.</strong> Escanea el QR (o entra a la URL)</p>
<p class="menti-step"><strong>2.</strong> Responde con honestidad: ¿qué tan cómodo te sientes con Excel, SQL, R, Python, VS Code y LLMs?</p>
<p class="menti-step"><strong>3.</strong> Tus respuestas ajustan el ritmo del taller — no hay respuestas correctas.</p>

<div class="menti-url">menti.com/al46piyfpqc7</div>

</div>

</div>

---

<!-- _class: break -->

# Las 3 promesas<br>del curso

---

## Promesa 1 — Reproducibilidad real

<div class="stat-mid">5min</div>
<div class="stat-label">tiempo de ejecución máximo por notebook.</div>

Cada notebook que veas, **lo ejecutas tú**.
No es teoría. Es código que corre.

---

## Promesa 2 — Calidad universidad-internacional

<div class="stat-mid">22</div>
<div class="stat-label">items del checklist de calidad que cumple cada notebook.</div>

> Mismo estándar que cursos de MIT, Stanford, ETH Zürich.
> No se rebaja porque es PEBIBA.

---

## Promesa 3 — Aplicabilidad inmediata

<div class="stat-mid">Lunes</div>
<div class="stat-label">el día que aplicas lo aprendido en tu trabajo real.</div>

> El pipeline que construyes en clase,
> lo adaptas al día siguiente a tu CSV de la empresa.
> **Si no lo aplicas, no lo aprendiste.**

---

<!-- _class: break -->

# Las 3 reglas<br>del curso

---

## Regla 1 — Predict antes de Run

> Cada vez que vea código en pantalla:
>
> **PRIMERO predices** qué imprime.
> **DESPUÉS ejecutas.**
>
> Cuando fallas la predicción, ahí aprendes.
> Cuando aciertas, confirmas.

> *Sin predicción, no hay aprendizaje.*

---

## Regla 2 — Atascarse es parte del aprendizaje

<div class="pro-tip">

**Productive Failure (Manu Kapur, 2008):**

Los alumnos que **se atascan** antes de la solución
aprenden **mejor** que los que ven la solución directo.

⏱️ Si te atascas 5 minutos: bien.
⏱️ Si te atascas 15 minutos: pide ayuda.

**Nunca: rendirte y mirar la solución sin intentar.**

</div>

---

## Regla 3 — IA permitida, declarable, auditable

<div class="pro-tip">

**Sí puedes usar Claude / ChatGPT / Copilot.**

Dos requisitos:

1. **Declarar** al final del entregable: qué herramienta usaste, en qué partes.
2. **Auditabilidad:** debes poder explicar línea por línea. La IA es asistente, no autor.

> *El profesional 2026 usa IA bien. El curso te enseña a usarla bien.*

</div>

---

<!-- _class: break -->

# Estructura del taller

---

## El cronograma de tus 8 horas

<div style="font-size: 22pt;">

### **Sesión 01 — Día 1 · 4h** (sintaxis y carga)
- Bloque 1: Variables y tipos (25 min)
- Bloque 2: Listas y vectores (35 min)
- Bloque 3: ⚠️ Trampas #1 y #2 (45 min)
- Bloque 4: Carga de CSV + diagnóstico (75 min)

### **Sesión 02 — Día 2 · 4h** (manipulación y pipeline)
- Bloque 0: Recap día 1 (15 min)
- Bloque 1: Arena Python vs R (75 min)
- Bloque 2: Visualización (65 min)
- Bloque 3: ¿Python o R? (30 min)
- Bloque 4: 🎯 Mini-pipeline integrador (35 min)

</div>

---

<!-- _class: aha -->

# **Tu objetivo:<br>responder al jefe<br>en 30 segundos.**

> *"Top 5 productos por región Q4."*

> Hoy: 1 hora en Excel.
> En 8 horas: 1 click.

---

<!-- _class: you -->

# ¿Listos?

## Empezamos.

---

<!-- _class: title -->

# Comenzamos con S01

## Variables, tipos y la primera trampa

PEBIBA XVIII · 2026
