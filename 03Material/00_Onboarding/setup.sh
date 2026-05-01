#!/usr/bin/env bash
# ============================================================
#  setup.sh — Instalador del entorno del curso (macOS / Linux)
#  Curso: Fundamentos de Python y R · PEBIBA XVIII · 2026
# ============================================================
#
#  Uso:
#     bash setup.sh
#
#  Tarda 10-15 minutos la primera vez.
#
#  Qué hace:
#   1. Crea el entorno conda 'fundamentos-pyr' con Python + R + librerías
#   2. Registra el kernel Python en Jupyter
#   3. Registra el kernel R en Jupyter
# ============================================================

set -e

echo
echo "============================================"
echo "   Setup curso Fundamentos Python y R"
echo "============================================"
echo

# Verificar que conda existe
if ! command -v conda &> /dev/null; then
    echo "ERROR: 'conda' no está disponible."
    echo
    echo "Necesitas instalar Miniconda primero:"
    echo "  https://www.anaconda.com/download/success"
    echo
    echo "Después de instalar, abre una terminal nueva y vuelve a correr este script."
    echo
    exit 1
fi

# Activar conda en bash
eval "$(conda shell.bash hook)"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "[1/3] Creando entorno fundamentos-pyr con Python 3.11 + R 4.3 + librerías..."
echo "      (esto tarda 5-10 minutos la primera vez, ten paciencia)"
echo

if conda env list | grep -q "^fundamentos-pyr "; then
    echo "El entorno fundamentos-pyr ya existe. Si quieres recrearlo desde cero:"
    echo "  conda env remove -n fundamentos-pyr"
    echo "  y luego corre este script otra vez."
    echo "Continuamos con el registro de kernels..."
else
    conda env create -f "$SCRIPT_DIR/environment.yml"
fi

echo
echo "[2/3] Registrando kernel Python en Jupyter..."
echo
conda run -n fundamentos-pyr python -m ipykernel install --user --name fundamentos-pyr --display-name "Python 3.11 (fundamentos-pyr)"

echo
echo "[3/3] Registrando kernel R en Jupyter..."
echo
conda run -n fundamentos-pyr Rscript -e 'IRkernel::installspec(user = TRUE)'

echo
echo "============================================"
echo "   ¡LISTO!"
echo "============================================"
echo
echo "Siguiente paso: abrir VS Code en la carpeta del curso"
echo "y seleccionar el kernel \"Python 3.11 (fundamentos-pyr)\""
echo
echo "Para verificar que todo funciona, ejecuta:"
echo "  00_Verificacion_Setup.ipynb"
echo
