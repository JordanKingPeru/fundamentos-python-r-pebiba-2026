# 🚀 Guía de instalación — VS Code + Python + R

> **Tiempo estimado:** 30–45 min con buena conexión.
> **Requisito previo:** ninguno. Si nunca has programado, esta es tu primera vez. Tranquilo.

Al terminar esta guía vas a tener:

1. **VS Code** con las extensiones correctas.
2. **Anaconda/Miniconda** instalado.
3. **Un único entorno** `fundamentos-pyr` con Python 3.11 + R 4.3 + todas las librerías del curso.
4. **Jupyter funcionando** dentro de VS Code, con kernels Python y R disponibles.

---

## Paso 1 — Instalar VS Code

### Si NO tienes VS Code

1. Descarga desde https://code.visualstudio.com/Download
2. Instala con valores por defecto (acepta todas las casillas, excepto si te ofrece opciones de "telemetría" — depende de tu preferencia).
3. Abre VS Code.

### Si YA tienes VS Code

Asegúrate de tener una versión reciente (≥ 1.90). En VS Code: `Help → Check for Updates`.

---

## Paso 2 — Instalar Anaconda o Miniconda

**Recomendado: Miniconda** (más liviano, mismo poder que Anaconda).

1. Descarga: https://www.anaconda.com/download/success → **Miniconda**
   Elige el instalador para tu sistema operativo y arquitectura:
   - Windows x64 → `Miniconda3-latest-Windows-x86_64.exe`
   - Windows ARM (Surface Pro X, Copilot+ PC) → `Miniconda3-latest-Windows-arm64.exe`
   - macOS → `Miniconda3-latest-MacOSX-arm64.pkg` (Apple Silicon) o `x86_64.pkg` (Intel)
   - Linux → `Miniconda3-latest-Linux-x86_64.sh`

2. Durante la instalación en Windows:
   - **Marca "Add Miniconda to my PATH environment variable"** (aunque salga warning amarillo — para este curso es lo que necesitas).
   - El resto: defaults.

3. Verifica abriendo PowerShell o terminal:
   ```bash
   conda --version
   # debe mostrar algo como: conda 24.x
   ```

   Si dice "conda not found", reinicia tu terminal/sesión.

---

## Antes de seguir — ¿qué es un "terminal"?

> Si nunca has abierto una "ventana negra con texto" en tu computadora, lee esto. Si ya lo conoces, salta al Paso 3.

Un **terminal** es una ventana donde escribes comandos en lugar de hacer clic. Es lo que vas a usar para crear el entorno del curso.

**En Windows hay dos opciones equivalentes para este curso:**

| Terminal | Cómo abrirlo | Cuándo usarlo |
|---|---|---|
| **Anaconda Prompt** *(recomendado)* | Menú Inicio → escribe "Anaconda Prompt" | Tiene `conda` listo. Es el más fácil. |
| **PowerShell** | Menú Inicio → escribe "PowerShell" | Si ya configuraste `conda init powershell` |

**En macOS / Linux:** abre la app **Terminal** (Spotlight: ⌘+Espacio → "Terminal").

**Cómo se ve un terminal en Anaconda Prompt (Windows):**

```
(base) C:\Users\TuUsuario>
```

Ese `(base)` indica que estás en el entorno conda llamado `base`. Cuando crees `fundamentos-pyr`, va a aparecer `(fundamentos-pyr)` después.

> 💡 **Tip:** copiar y pegar funciona. Click derecho sobre la ventana = pegar (en Anaconda Prompt). En PowerShell: `Ctrl+V`.

### Atajo: script `setup.bat` (Windows) o `setup.sh` (macOS/Linux)

Si prefieres no escribir comandos uno por uno, en `03Material/00_Onboarding/` hay un script que ejecuta los 3 pasos del Paso 3 de un solo doble-click. Ver `setup.bat` (Windows) o `setup.sh` (macOS/Linux).

---

## Paso 3 — Crear el entorno del curso (Python + R en uno)

### Opción A — Con `environment.yml` (recomendado, 1 comando)

Desde la raíz de este repositorio (donde está el README):

```bash
conda env create -f 03Material/00_Onboarding/environment.yml
```

Esto descarga e instala todo: Python 3.11, R 4.3, tidyverse, pandas, numpy, matplotlib, seaborn, IRkernel, Jupyter Lab. **Tarda 10–15 min** la primera vez.

Cuando termine:

```bash
conda activate fundamentos-pyr

# Registrar el kernel Python para que VS Code y Jupyter lo detecten:
python -m ipykernel install --user --name fundamentos-pyr --display-name "Python 3.11 (fundamentos-pyr)"

# Registrar el kernel R (sólo si IRkernel no se registró solo):
R -e "IRkernel::installspec(user = TRUE)"
```

### Opción B — Manual (si la opción A falla)

```bash
# Crear el env con Python
conda create -n fundamentos-pyr python=3.11 -y
conda activate fundamentos-pyr

# Python core
conda install -c conda-forge jupyterlab ipykernel pandas numpy matplotlib seaborn openpyxl -y

# R + tidyverse + IRkernel
conda install -c conda-forge r-base r-irkernel r-tidyverse r-readxl r-writexl -y

# Registrar kernels en Jupyter
python -m ipykernel install --user --name fundamentos-pyr --display-name "Python 3.11 (fundamentos-pyr)"
R -e "IRkernel::installspec(user = TRUE)"
```

---

## Paso 4 — Instalar las extensiones de VS Code

Abre VS Code. En la barra lateral izquierda, ve al icono de **Extensiones** (cuadrados, `Ctrl+Shift+X`).

Instala estas 4 extensiones (busca por nombre):

| Extensión | Para qué sirve |
|---|---|
| **Python** (de Microsoft) | Soporte Python: kernels, debugger, Pylance |
| **Jupyter** (de Microsoft) | Ejecutar notebooks `.ipynb` en VS Code |
| **R** (de REditorSupport) | Soporte para archivos `.R` y kernel R |
| **Marp for VS Code** *(opcional)* | Previsualizar las slides en formato Marp |

> Las primeras 3 son obligatorias. Marp solo si quieres ver/editar los `.md` de slides.

---

## Paso 5 — Configurar el intérprete por defecto

1. Abre la carpeta del curso en VS Code: `File → Open Folder` → selecciona `Fundamentos_Python_R/`.
2. Ctrl+Shift+P → escribe **"Python: Select Interpreter"** → presiona Enter.
3. Elige: `Python 3.11 ('fundamentos-pyr')` o el que apunte a `~/miniconda3/envs/fundamentos-pyr/python.exe`.

Esto le dice a VS Code que cuando abras un `.py` o `.ipynb`, use el entorno del curso.

---

## Paso 6 — Verifica que todo funciona

Abre el notebook de verificación:

📓 `03Material/00_Onboarding/00_Verificacion_Setup.ipynb`

1. En la **esquina superior derecha** del notebook verás un botón "Select Kernel". Cliquéalo.
2. Elige **`Python 3.11 (fundamentos-pyr)`**.
3. Click en `▶ Run All` (o `Ctrl+Alt+Enter` celda por celda).

**Si las 6 pruebas pasan en verde → estás listo. ✅**

Después prueba con un notebook R: abre `03Material/01_Sesion_Sintaxis_Carga/notebooks/S01_Sintaxis_y_Carga_R.ipynb` y selecciona el kernel **R**. Si la primera celda corre y dice la versión de R, también está OK.

---

## Si algo falla

### Error: `command not found: conda`
- En Windows: el instalador no marcó "Add to PATH". Reinstala marcando esa opción, o agrega manualmente `C:\Users\<usuario>\miniconda3\condabin` al PATH del sistema.
- En macOS/Linux: ejecuta `~/miniconda3/bin/conda init bash` (o `zsh`) y reinicia la terminal.

### Error: `package 'tidyverse' is not available`
Tu versión de R es muy antigua. Asegúrate de que el paquete `r-base` instalado por conda es ≥ 4.3:
```bash
conda activate fundamentos-pyr
R --version
# debe decir 4.3.x o superior
```
Si es menor, recrea el entorno: `conda env remove -n fundamentos-pyr` y ejecuta de nuevo el Paso 3.

### El kernel R no aparece en VS Code/Jupyter
Ejecuta esto desde la consola R del **sistema** (no desde Anaconda):
```r
install.packages('IRkernel')
IRkernel::installspec(user = TRUE)
```
Reinicia VS Code.

### Windows on ARM: aviso "No se pudo iniciar el localizador de Python"

Solo afecta a Surface Pro X, Surface Pro 9 5G, Copilot+ PC y similares. El binario nativo del locator de la extensión Python tiene un bug con ciertas instalaciones de Windows ARM. Solución:

`Ctrl+,` (Settings) → click `{}` arriba a la derecha (`Open Settings JSON`) → agrega:

```jsonc
"python.experiments.optOutFrom": ["pythonNativeLocator", "All"],
"python.locator": "js",
"python.defaultInterpreterPath": "C:\\Users\\<TU_USUARIO>\\miniconda3\\envs\\fundamentos-pyr\\python.exe"
```

Reinicia VS Code. Esto fuerza al locator legacy (que no tiene el bug).

### Cualquier otro problema

Escribe a **jrodriguezm216@gmail.com** con captura de pantalla del error. Respuesta < 24h.

---

## Comandos útiles (referencia rápida)

```bash
# Activar el entorno
conda activate fundamentos-pyr

# Ver paquetes instalados
conda list

# Salir del entorno
conda deactivate

# Si quieres recrear el entorno desde cero
conda env remove -n fundamentos-pyr
conda env create -f 03Material/00_Onboarding/environment.yml

# Actualizar un paquete específico
conda update -n fundamentos-pyr -c conda-forge pandas
```

---

## Listo

Si llegaste hasta aquí y la verificación pasó, **estás listo para la Sesión 01**. Nos vemos en clase 👋

— *Cand. Dr. Jordan King Rodríguez Mallqui · jrodriguezm216@gmail.com*
