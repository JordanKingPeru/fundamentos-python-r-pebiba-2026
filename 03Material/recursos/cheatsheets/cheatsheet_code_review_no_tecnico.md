# Code Review no técnico — qué exigirle a tu equipo

> Para gerentes, líderes de proyecto y product owners que **reciben** pipelines, modelos o dashboards de su equipo técnico y deben firmarlos sin saber programar.
>
> Estas 10 preguntas no requieren leer código. Requieren **criterio**.

---

## Las 10 preguntas

### 1. ¿Qué problema de negocio resuelve este código?

> "Quiero que me lo expliques en una frase, sin jerga técnica."

🟢 **Buena respuesta:** *"Detecta clientes con riesgo de no pago en los próximos 60 días, para que cobranzas los priorice."*

🔴 **Mala respuesta:** *"Es un modelo de ML con XGBoost que predice churn."* → te están dando el **cómo**, no el **qué**.

**Por qué importa:** si tu equipo no puede articular el problema en una frase, probablemente está construyendo algo desconectado del negocio.

---

### 2. ¿Cómo se ve el dataset que estás usando? Muéstrame el diccionario de datos.

> "Necesito ver una lista de columnas con su descripción y tipo."

🟢 **Buena respuesta:** un documento (Excel, Markdown o tabla) con todas las columnas, qué representan, qué unidades, valores válidos, y de dónde vienen.

🔴 **Mala respuesta:** *"Está en la base de datos."* → falta documentación. Riesgo: el equipo asume mal el significado de una columna.

**Por qué importa:** sin diccionario, en 6 meses nadie sabe si `precio` es PEN o USD, si `fecha` es de creación o de pago.

---

### 3. ¿Es reproducible? Si te pido los mismos números mañana, ¿salen iguales?

> "¿El código corre solo o requiere pasos manuales?"

🟢 **Buena respuesta:** *"Sí. Hay un script `pipeline.py` (o `.R`). Se ejecuta y produce el mismo output. Las dependencias están en `environment.yml`."*

🔴 **Mala respuesta:** *"Hay que correr esta celda primero, después esta otra, y al final pegar el resultado en Excel manualmente."* → 🚨 **red flag**. El proceso no es auditable.

**Por qué importa:** auditoría y compliance dependen de esto. Y si la persona se va, el proceso se rompe.

---

### 4. ¿Qué versiones de las librerías estás usando?

> "Si yo intento correr esto el año que viene, ¿va a funcionar?"

🟢 **Buena respuesta:** *"Las versiones están fijadas en `requirements.txt` o `environment.yml`. Hicimos test en la versión actual y queda documentado."*

🔴 **Mala respuesta:** *"La última versión, supongo."* → en 12 meses, ese código va a romper.

**Por qué importa:** el código sin versiones fijas es **deuda técnica invisible**. Eventualmente cobra.

---

### 5. ¿Qué pasa si los datos cambian de formato?

> "Si mañana me llega un CSV con una columna nueva o renombrada, ¿qué pasa?"

🟢 **Buena respuesta:** *"Tenemos validaciones que detectan columnas faltantes y abortan con un mensaje claro. Si una columna se renombra, hay un mapping centralizado que actualizamos en un solo lugar."*

🔴 **Mala respuesta:** *"Habría que re-escribir todo."* → fragilidad alta. Una pequeña perturbación rompe todo.

**Por qué importa:** datos reales **siempre** cambian. Tu pipeline debe degradar elegantemente.

---

### 6. ¿Cómo manejan los valores faltantes y los datos malos?

> "¿Hay registros que se ignoran? ¿Cuáles? ¿Por qué?"

🟢 **Buena respuesta:** *"Documentamos las reglas de filtrado. Por ejemplo: descartamos transacciones con monto negativo y guardamos un log. Hoy el 2.3% de las filas se filtra; alertamos si pasa del 5%."*

🔴 **Mala respuesta:** *"Pandas se encarga de eso."* → el equipo no sabe qué pasa con los datos sucios.

**Por qué importa:** el sesgo en datos malos contamina conclusiones. Y si tu modelo predice riesgo de crédito ignorando silenciosamente el 30% de la muestra, vas a tener problemas regulatorios.

---

### 7. ¿Cómo sé que esto NO está sobre-ajustando? (overfitting)

> "Si mañana llegan datos nuevos, ¿el modelo va a funcionar igual?"

🟢 **Buena respuesta:** *"Validamos con datos que NO se usaron para entrenar (test set). El accuracy en train es 92% y en test 89% — diferencia razonable. Además hicimos validación temporal."*

🔴 **Mala respuesta:** *"Tenemos 99% de accuracy."* → 🚨 demasiado bueno para ser verdad. Casi siempre es leakage o overfitting.

**Por qué importa:** un modelo con 99% accuracy en testing puede caer al 60% en producción. Eso te explota en la cara.

---

### 8. ¿Hay algún registro o variable que NO debería usarse pero podría filtrarse al modelo?

> "¿Han revisado data leakage explícitamente?"

🟢 **Buena respuesta:** *"Sí. Hay una lista de variables excluidas con justificación documentada. Por ejemplo: no usamos 'monto pagado' para predecir 'va a pagar' porque es trampa."*

🔴 **Mala respuesta:** *"Usamos todas las columnas disponibles."* → 🚨 red flag. Probable leakage.

**Por qué importa:** un modelo con leakage es **inútil en producción**. Y si toma decisiones de crédito, es una falla regulatoria.

---

### 9. ¿Cómo se monitorea esto en producción?

> "Si la calidad baja, ¿cómo nos enteramos?"

🟢 **Buena respuesta:** *"Tenemos métricas de monitoreo: tasa de errores, drift de la distribución de inputs, accuracy en feedback retrasado. Alertamos si se degrada >3 puntos."*

🔴 **Mala respuesta:** *"Asumimos que sigue funcionando."* → modelos en producción **siempre** se degradan. Si no monitoreas, te enteras cuando ya es tarde.

**Por qué importa:** un modelo que se degrada silenciosamente es peor que no tener modelo, porque genera falsa confianza.

---

### 10. Si tú te vas mañana, ¿alguien más puede operar esto?

> "¿La documentación es suficiente para que otra persona lo continúe sin tu ayuda?"

🟢 **Buena respuesta:** *"Sí. Hay un README con cómo correr el pipeline, un diccionario de datos, comentarios en el código y un runbook para incidentes comunes. Hice una sesión de transferencia con [persona]."*

🔴 **Mala respuesta:** *"Eso solo lo entiendo yo."* → 🚨 dependencia de una sola persona. Riesgo operativo alto.

**Por qué importa:** la rotación es real. Si tu pipeline depende de una persona, tu negocio depende de esa persona.

---

## Bonus — 3 frases-trampa que NUNCA deberías aceptar

| Frase del equipo | Lo que realmente significa | Tu respuesta |
|---|---|---|
| *"El modelo es muy preciso, da 99% accuracy."* | Probable overfitting o leakage | "Muéstrame la matriz de confusión y la validación temporal." |
| *"Se ejecuta solo en mi máquina, hay que correrlo aquí."* | El pipeline no es portable | "Cuándo será reproducible en cualquier máquina del equipo?" |
| *"Es muy técnico, no se puede explicar al negocio."* | La conexión con el negocio no se pensó | "Entonces no estamos listos para tomar decisiones con esto. Volvamos al problema." |

---

## Mapa: red flags por tipo de entregable

| Te entregan... | Red flag #1 | Red flag #2 | Red flag #3 |
|---|---|---|---|
| Análisis ad-hoc | Sin diccionario de datos | Solo un Jupyter sin contexto | "Confía en el número" |
| Modelo predictivo | 99%+ accuracy | Sin validación temporal | Variables sospechosas como features |
| Dashboard | Sin actualizar > 1 mes | Métricas sin definición | Solo un screenshot |
| Reporte recurrente | Hecho a mano cada vez | Sin versionado | Difiere mes a mes sin explicación |
| Pipeline producción | Sin monitoreo | Sin alertas | "Lo arregla X cuando se rompe" |

---

## Glosario express (términos que escucharás)

- **Pipeline:** secuencia automatizada de pasos (cargar → limpiar → calcular → entregar). Si no es automatizable, no es pipeline.
- **Reproducibilidad:** el mismo input siempre produce el mismo output, sin importar cuándo, dónde, ni quién lo ejecute.
- **Data leakage:** información del futuro se filtra al modelo durante entrenamiento. Resultado: parece bueno, falla en producción.
- **Overfitting:** el modelo memorizó los datos de entrenamiento; no generaliza.
- **Drift:** los datos de producción se alejan de los de entrenamiento. El modelo se degrada.
- **Train/test split:** dividir los datos para entrenar con una parte y validar con otra. Sin esto, no sabes si el modelo funciona.
- **Validación temporal:** entrenar con datos pasados y validar con datos posteriores (no aleatorios). Más realista para producción.
- **Hiperparámetro:** configuración del modelo (no aprendida automáticamente). Cambiarlo cambia los resultados.
- **Feature:** columna de entrada al modelo. Nombre técnico de "variable predictora".
- **Baseline:** modelo simple contra el cual se compara. Si tu modelo complejo no le gana al baseline, no sirve.

---

## Cómo escalar este checklist

- **Para análisis informal**: pregunta 1, 2, 3.
- **Para modelo o pipeline en producción**: las 10 + el bonus.
- **Para auditoría externa o regulatorio**: las 10 + bonus + pedir documentación firmada por dos integrantes del equipo.

---

📧 *Para una sesión 1-1 sobre code review específico de tu equipo:* `jrodriguezm216@gmail.com`
