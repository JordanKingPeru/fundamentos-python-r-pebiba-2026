#!/usr/bin/env bash
# ============================================================
#  setup.sh — Instalador del entorno del curso (macOS / Linux)
#  Curso: Fundamentos de Python y R · PEBIBA XVIII · 2026
# ============================================================
#  Uso:
#     bash setup.sh
#
#  Tarda 10-15 min la primera vez. Idempotente: puedes correrlo
#  varias veces sin romper nada.
# ============================================================

set -u  # error en variables no definidas (no -e: queremos seguir si falla un paso)

echo
echo "============================================"
echo "   Setup curso Fundamentos Python y R"
echo "============================================"
echo

# ---------- Pre-check: conda ----------
if ! command -v conda &> /dev/null; then
    echo "[X] ERROR: 'conda' no está disponible."
    echo
    echo "    Instala Miniconda desde:"
    echo "      https://www.anaconda.com/download/success"
    echo
    echo "    Después abre una terminal nueva y vuelve a ejecutar este script."
    exit 1
fi

eval "$(conda shell.bash hook)"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
KERNEL_R_OK=0

# ---------- [1/4] Crear o reutilizar el entorno ----------
echo "[1/4] Comprobando entorno conda 'fundamentos-pyr'..."
echo
if conda env list | grep -q "^fundamentos-pyr "; then
    echo "      [OK] El entorno ya existe. Salto la creación."
    echo "           Si quieres recrearlo desde cero, antes ejecuta:"
    echo "             conda env remove -n fundamentos-pyr -y"
    echo "           y vuelve a correr este script."
else
    echo "      Creando el entorno con Python 3.11 + R 4.3 + librerías..."
    echo "      Tarda 5-10 minutos. Ten paciencia."
    echo
    if ! conda env create -f "$SCRIPT_DIR/environment.yml"; then
        echo
        echo "[X] ERROR: la creación del entorno falló."
        echo "    Causas típicas: sin internet, falta espacio (~3 GB), conflicto de canales."
        exit 1
    fi
    echo "      [OK] Entorno creado."
fi
echo

# ---------- [2/4] Registrar kernel Python ----------
echo "[2/4] Registrando kernel Python en Jupyter..."
echo
if conda run -n fundamentos-pyr python -m ipykernel install --user --name fundamentos-pyr --display-name "Python 3.11 (fundamentos-pyr)"; then
    echo "      [OK] Kernel Python registrado."
else
    echo "[X] No pude registrar el kernel Python. Continúo para registrar R."
fi
echo

# ---------- [3/4] Registrar kernel R ----------
echo "[3/4] Registrando kernel R en Jupyter..."
echo

# Limpiar kernel R duplicado del env conda si existiera (a veces Jupyter
# elige ese y no el del usuario, dejando al alumno con un kernel que
# no encuentra IRkernel).
CONDA_R_KERNEL_1="$HOME/miniconda3/envs/fundamentos-pyr/share/jupyter/kernels/ir"
CONDA_R_KERNEL_2="$HOME/anaconda3/envs/fundamentos-pyr/share/jupyter/kernels/ir"
for k in "$CONDA_R_KERNEL_1" "$CONDA_R_KERNEL_2"; do
    if [[ -d "$k" ]]; then
        rm -rf "$k"
        echo "      [i] Limpié kernel R duplicado del env conda: $k"
    fi
done

# Intento A: R del env conda
if conda run -n fundamentos-pyr Rscript -e 'IRkernel::installspec(user = TRUE)' &>/dev/null; then
    echo "      [OK] Kernel R registrado vía conda."
    KERNEL_R_OK=1
else
    echo "      [!] El R de conda no pudo registrar el kernel."
    echo "          Probando con R nativo del sistema..."

    # Intento B: R nativo (cualquier `R` en PATH que no sea el de conda)
    R_NATIVE=""
    if command -v R &> /dev/null; then
        # Verificar que no apunta al R del env conda
        R_PATH="$(command -v R)"
        if [[ "$R_PATH" != *"miniconda3/envs/fundamentos-pyr"* && "$R_PATH" != *"anaconda3/envs/fundamentos-pyr"* ]]; then
            R_NATIVE="$R_PATH"
        fi
    fi

    if [[ -z "$R_NATIVE" ]]; then
        # Buscar en rutas comunes de macOS / Linux
        for candidate in \
            "/usr/local/bin/R" \
            "/opt/homebrew/bin/R" \
            "/Library/Frameworks/R.framework/Resources/bin/R" \
            "/usr/bin/R"; do
            if [[ -x "$candidate" ]]; then
                R_NATIVE="$candidate"
                break
            fi
        done
    fi

    if [[ -z "$R_NATIVE" ]]; then
        echo
        echo "[X] No encontré R nativo en el sistema."
        echo
        echo "    QUÉ HACER:"
        echo "      macOS:  brew install r"
        echo "              o descarga desde https://cran.r-project.org/bin/macosx/"
        echo "      Linux:  sudo apt install r-base       # Debian/Ubuntu"
        echo "              sudo dnf install R            # Fedora"
        echo
        echo "    Después vuelve a ejecutar este setup.sh."
    else
        echo "          Encontré R nativo en: $R_NATIVE"
        echo "          Instalando IRkernel + tidyverse..."

        # User library en $HOME/.R-libs (no $HOME/.R: algunos wrappers crean ahí estado interno)
        R_USERLIB="$HOME/.R-libs/4.6"
        mkdir -p "$R_USERLIB"
        export R_LIBS_USER="$R_USERLIB"

        if "$R_NATIVE" -e "install.packages(c('IRkernel','IRdisplay','repr','crayon','pbdZMQ','uuid','digest','jsonlite','evaluate','base64enc','tidyverse','readxl','writexl','data.table','glue','lubridate'), lib='$R_USERLIB', repos='https://cloud.r-project.org', dependencies=TRUE)"; then
            # Registrar a mano con libPath hardcodeada en el comando -e
            # (más robusto que R_LIBS_USER si VS Code corre con sandbox)
            KERNEL_DIR="$HOME/.local/share/jupyter/kernels/ir"
            mkdir -p "$KERNEL_DIR"
            cat > "$KERNEL_DIR/kernel.json" <<EOF
{
    "argv": [
        "$R_NATIVE",
        "--slave",
        "-e",
        ".libPaths(c('$R_USERLIB', .libPaths())); IRkernel::main()",
        "--args",
        "{connection_file}"
    ],
    "display_name": "R (system)",
    "language": "R"
}
EOF
            echo "      [OK] Kernel R registrado a mano apuntando a R nativo."
            KERNEL_R_OK=1
        else
            echo "[X] No pude instalar IRkernel en R nativo. Revisa los mensajes arriba."
        fi
    fi
fi
echo

# ---------- [4/4] Verificación final ----------
echo
echo "============================================"
echo "   [4/4] Verificación final: kernels disponibles"
echo "============================================"
echo
echo "  Estos son los kernels que Jupyter detecta:"
echo "  (Para los notebooks del curso necesitas que aparezcan"
echo "   'fundamentos-pyr' y 'ir')"
echo
conda run -n fundamentos-pyr python -m jupyter kernelspec list 2>/dev/null || true
echo

# ---------- Resumen ----------
echo
echo "============================================"
echo "   Resumen final"
echo "============================================"
echo
echo "  [OK] Entorno conda 'fundamentos-pyr'"
echo "  [OK] Kernel Python registrado"
if [[ "$KERNEL_R_OK" == "1" ]]; then
    echo "  [OK] Kernel R registrado"
else
    echo "  [X]  Kernel R NO registrado"
fi
echo
echo "--------------------------------------------"
echo "  Qué viene ahora"
echo "--------------------------------------------"
echo
echo "  PASO 1 — Abrir VS Code en la carpeta del curso"
echo "           File > Open Folder > selecciona Fundamentos_Python_R"
echo
echo "  PASO 2 — Verificar que todo funciona"
echo "           Abre 00_Verificacion_Setup.ipynb"
echo "           Ctrl+Shift+P > 'Python: Select Interpreter'"
echo "           Elige 'Python 3.11 (fundamentos-pyr)'"
echo "           Click en 'Run All'"
echo
echo "  PASO 3 — Si las 6 pruebas pasan en verde, estás listo."
echo "           Si alguna falla, revisa la celda con error y"
echo "           sigue las instrucciones que muestre."
echo
if [[ "$KERNEL_R_OK" != "1" ]]; then
    echo "--------------------------------------------"
    echo "  El kernel R NO se registró"
    echo "--------------------------------------------"
    echo
    echo "  Causas típicas:"
    echo "    1. R no está instalado:"
    echo "         macOS:  brew install r"
    echo "         Linux:  sudo apt install r-base   # Debian/Ubuntu"
    echo "                 sudo dnf install R         # Fedora"
    echo "    2. Tu firewall bloqueó la descarga de paquetes desde CRAN."
    echo
    echo "  Después de resolver, vuelve a ejecutar este setup.sh."
    echo "  Es idempotente: no rompe nada al correrlo de nuevo."
    echo
fi
echo "--------------------------------------------"
echo "  Si tienes algún error"
echo "--------------------------------------------"
echo
echo "  Saca captura de esta ventana COMPLETA y mándala al docente:"
echo "    jrodriguezm216@gmail.com"
echo
echo "  Tiempo de respuesta: menos de 24 horas."
echo
echo "============================================"
echo "  Lee el resumen completo y cuando termines,"
echo "  presiona ENTER para cerrar."
echo "============================================"
echo
read -r _
