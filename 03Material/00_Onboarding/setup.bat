@echo off
REM ============================================================
REM  setup.bat - Instalador del entorno del curso (Windows)
REM  Curso: Fundamentos de Python y R - PEBIBA XVIII - 2026
REM ============================================================
REM
REM  Doble-click sobre este archivo y deja que corra.
REM  Tarda 10-15 minutos la primera vez.
REM
REM  Que hace:
REM   1. Crea el entorno conda 'fundamentos-pyr' con Python + R + librerias
REM   2. Registra el kernel Python en Jupyter
REM   3. Registra el kernel R en Jupyter
REM ============================================================

echo.
echo ============================================
echo   Setup curso Fundamentos Python y R
echo ============================================
echo.

REM Verificar que conda esta en PATH
where conda >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: 'conda' no esta en el PATH.
    echo.
    echo Necesitas instalar Miniconda primero:
    echo   https://www.anaconda.com/download/success
    echo.
    echo IMPORTANTE: durante la instalacion, marca la casilla
    echo "Add Miniconda to my PATH environment variable".
    echo.
    pause
    exit /b 1
)

echo [1/3] Creando entorno fundamentos-pyr con Python 3.11 + R 4.3 + librerias...
echo       (esto tarda 5-10 minutos la primera vez, ten paciencia)
echo.
call conda env create -f "%~dp0environment.yml"
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ATENCION: El entorno ya existia o hubo un error.
    echo Si quieres recrearlo desde cero, ejecuta primero:
    echo   conda env remove -n fundamentos-pyr
    echo y luego corre este script otra vez.
    echo.
    pause
    REM No salir - intentar registrar kernels igual
)

echo.
echo [2/3] Registrando kernel Python en Jupyter...
echo.
call conda run -n fundamentos-pyr python -m ipykernel install --user --name fundamentos-pyr --display-name "Python 3.11 (fundamentos-pyr)"

echo.
echo [3/3] Registrando kernel R en Jupyter...
echo.
call conda run -n fundamentos-pyr Rscript -e "IRkernel::installspec(user = TRUE)"

echo.
echo ============================================
echo   LISTO!
echo ============================================
echo.
echo Siguiente paso: abrir VS Code en la carpeta del curso
echo y seleccionar el kernel "Python 3.11 (fundamentos-pyr)"
echo.
echo Para verificar que todo funciona, ejecuta:
echo   00_Verificacion_Setup.ipynb
echo.
pause
