# Onboarding — Setup pre-curso

> Antes de la Sesión 01, completa estos 3 pasos. Si algo falla, escribe a `jrodriguezm216@gmail.com` con captura de pantalla.

## Empieza aquí

**Para la guía completa de instalación con VS Code, abre [`INSTALACION.md`](INSTALACION.md).**

Ese archivo te lleva paso a paso por:
1. Instalar VS Code y Miniconda
2. Crear el entorno con `environment.yml` (Python 3.11 + R 4.3 + todo el stack del curso, en un solo comando)
3. Instalar las extensiones de VS Code (Python, Jupyter, R)
4. Verificar que todo funciona ejecutando `00_Verificacion_Setup.ipynb`

⏱️ Tiempo total: 30–45 min con buena conexión.

---

## Resumen rápido (si ya hiciste el Paso 1 de INSTALACION.md)

Para este curso necesitas dos lenguajes corriendo en el mismo Jupyter:

1. **Python** con pandas, numpy, matplotlib, seaborn
2. **R** con tidyverse + IRkernel (para que R corra dentro de Jupyter)

El `environment.yml` instala todo en un único entorno conda llamado `fundamentos-pyr`.

## Pasos

### 1. Instalar Anaconda (incluye Python + Jupyter)

- Descarga: https://www.anaconda.com/download
- Versión: la más reciente para tu sistema operativo (Windows / macOS / Linux)
- Durante instalación: aceptar defaults excepto marcar "Add Anaconda to my PATH" si Windows lo ofrece.

### 2. Crear el ambiente del curso

Abre **Anaconda Prompt** (Windows) o terminal (macOS/Linux) y ejecuta:

```bash
conda create -n fundamentos-pyr python=3.11 -y
conda activate fundamentos-pyr
conda install -c conda-forge jupyterlab pandas numpy matplotlib seaborn -y
```

### 3. Instalar R

- Descarga: https://cran.r-project.org/
- Versión: la más reciente (≥ 4.3)
- Aceptar defaults durante instalación

### 4. Instalar IRkernel para R en Jupyter

Abre R (terminal o RStudio si lo tienes) y ejecuta:

```r
install.packages('IRkernel')
IRkernel::installspec(user = TRUE)
install.packages(c('tidyverse', 'readr', 'ggplot2', 'dplyr'))
```

### 5. Verificar que todo funciona

En Anaconda Prompt:

```bash
conda activate fundamentos-pyr
jupyter lab
```

Se abrirá Jupyter Lab en tu navegador. En "Launcher" deberías ver al menos:
- Python 3 (kernel)
- R (kernel) ← este es el que importa

Crea un notebook con kernel R, escribe en una celda:

```r
print("Hola desde R")
library(tidyverse)
```

Y un notebook con kernel Python:

```python
print("Hola desde Python")
import pandas as pd
print(pd.__version__)
```

Si ambas celdas corren sin error, **estás listo**.

## Checklist de verificación

- [ ] Anaconda instalado
- [ ] Ambiente `fundamentos-pyr` creado
- [ ] R instalado (`R --version` desde terminal devuelve algo)
- [ ] IRkernel instalado y registrado
- [ ] Jupyter Lab abre y muestra kernels Python 3 y R
- [ ] Notebook Python ejecuta `import pandas`
- [ ] Notebook R ejecuta `library(tidyverse)`

## Si algo falla

- **Error "command not found: conda"**: PATH no incluye Anaconda. Reinstalar marcando la opción de agregar al PATH.
- **Error "package 'tidyverse' is not available"**: tu versión de R puede ser antigua. Actualiza R desde https://cran.r-project.org/.
- **No aparece kernel R en Jupyter**: ejecutaste `IRkernel::installspec()` desde otro ambiente. Reinstálalo desde la consola R del sistema, no desde Anaconda.

### Caso especial — Windows on ARM (Surface Pro X, Surface Pro 9 5G, Copilot+ PC, etc.)

Si VS Code te muestra el aviso ⚠️ **"No se pudo iniciar el localizador de Python"** y los kernels Python no aparecen (Native Locator falla con `STATUS_INVALID_IMAGE_FORMAT`), abre `Ctrl+,` (settings) → click en el icono `{}` arriba a la derecha (`Open Settings JSON`) y agrega:

```jsonc
"python.experiments.optOutFrom": ["pythonNativeLocator", "All"],
"python.locator": "js",
"python.defaultInterpreterPath": "C:\\Users\\<TU_USUARIO>\\miniconda3\\envs\\fundamentos-pyr\\python.exe"
```

Reinicia VS Code. Esto fuerza al locator legacy (TypeScript) en vez del binario nativo `pet.exe` que tiene un bug en algunas instalaciones de Windows ARM (DLLs UCRT del subfolder `downlevel\` no resueltas a `System32\`).

- **Cualquier otro problema**: contacta al docente con captura de pantalla del error (correo abajo).

## Recursos

- Documentación oficial Jupyter: https://jupyter.org/
- Anaconda Cheatsheet: https://docs.anaconda.com/_downloads/9ee215ff15fde24bf01791d719084950/Anaconda-Starter-Guide.pdf
- IRkernel docs: https://irkernel.github.io/

> **Tiempo estimado de instalación:** 30-45 min con buena conexión.
