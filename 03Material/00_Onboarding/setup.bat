@echo off
REM ============================================================
REM  setup.bat - Instalador del entorno del curso (Windows)
REM  Curso: Fundamentos de Python y R - PEBIBA XVIII - 2026
REM ============================================================
REM  Doble-click sobre este archivo y deja que corra.
REM  Tarda 10-15 min la primera vez. Idempotente: puedes correrlo
REM  varias veces sin romper nada.
REM ============================================================

REM ---------- Anti-cierre automatico de la ventana ----------
REM Cuando se lanza con doble-click, %CMDCMDLINE% contiene "cmd.exe /c"
REM y al terminar el script la ventana se cierra. Detectamos eso y nos
REM relanzamos en un cmd /k (que NO cierra al terminar).
if /I "%~1" EQU "_relaunched" goto :skip_relaunch
echo %CMDCMDLINE% | findstr /I /C:"/c" >nul 2>&1
if errorlevel 1 goto :skip_relaunch
cmd /k ""%~f0" _relaunched"
exit /b
:skip_relaunch
setlocal EnableDelayedExpansion

set "KERNEL_R_OK=0"

echo.
echo ============================================
echo   Setup curso Fundamentos Python y R
echo ============================================
echo.

REM ---------- Pre-check: conda ----------
where conda >nul 2>&1
if errorlevel 1 goto :no_conda

REM ============================================================
REM [1/4] Crear o reutilizar el entorno
REM ============================================================
echo [1/4] Comprobando entorno conda 'fundamentos-pyr'...
echo.

REM Capturar a variable para evitar problemas de pipe + ERRORLEVEL
set "ENV_EXISTS=0"
for /f "delims=" %%L in ('conda env list 2^>nul ^| findstr /C:"fundamentos-pyr"') do set "ENV_EXISTS=1"

if "!ENV_EXISTS!"=="1" goto :env_ok

REM ---- Pre-empt CondaToSRejectedError ----
REM Algunos perfiles tienen 'defaults' como canal global y conda exige
REM aceptar ToS de pkgs/main y pkgs/r desde 2025. Aceptamos preventivamente
REM (si el environment.yml es solo conda-forge, esto no aplica pero no estorba).
echo       Configurando canales conda...
call conda config --set channel_priority strict >nul 2>&1
call conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main >nul 2>&1
call conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r >nul 2>&1
call conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/msys2 >nul 2>&1

echo       Creando el entorno con Python 3.11 + R 4.3 + librerias...
echo       Tarda 5-10 minutos. Ten paciencia.
echo.
call conda env create -f "%~dp0environment.yml"
if errorlevel 1 goto :env_create_failed
echo       [OK] Entorno creado.
echo.
goto :step_2

:env_ok
echo       [OK] El entorno 'fundamentos-pyr' ya existe. Salto la creacion.
echo            Si quieres recrearlo desde cero, antes ejecuta:
echo              conda env remove -n fundamentos-pyr -y
echo            y vuelve a correr este script.
echo.
goto :step_2

:env_create_failed
echo.
echo [X] ERROR: la creacion del entorno fallo.
echo.
echo     Causas tipicas (en orden de probabilidad):
echo.
echo     1. CondaToSRejectedError (Terms of Service de Anaconda)
echo        Solucion rapida: ejecuta estos 3 comandos en Anaconda Prompt y
echo        vuelve a correr setup.bat:
echo.
echo          conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
echo          conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r
echo          conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/msys2
echo.
echo     2. Sin conexion a internet o internet lenta/inestable
echo        (la descarga es ~1.5 GB, en conexion lenta puede expirar).
echo.
echo     3. Falta de espacio en disco (necesitas ~3 GB libres en C:).
echo.
echo     4. Antivirus o firewall bloqueando conda-forge.
echo.
echo     Despues de resolver, vuelve a ejecutar setup.bat (es idempotente).
echo.
goto :end_failure

REM ============================================================
REM [2/4] Registrar kernel Python
REM ============================================================
:step_2
echo [2/4] Registrando kernel Python en Jupyter...
echo.
call conda run -n fundamentos-pyr python -m ipykernel install --user --name fundamentos-pyr --display-name "Python 3.11 (fundamentos-pyr)"
if errorlevel 1 (
    echo       [X] No pude registrar el kernel Python. Continuo igual.
) else (
    echo       [OK] Kernel Python registrado.
)
echo.

REM ============================================================
REM [3/4] Registrar kernel R
REM ============================================================
echo [3/4] Registrando kernel R en Jupyter...
echo.

REM Limpiar kernel R duplicado del env conda si existiera
set "CONDA_R_KERNEL=%USERPROFILE%\miniconda3\envs\fundamentos-pyr\share\jupyter\kernels\ir"
if exist "%CONDA_R_KERNEL%" (
    rmdir /s /q "%CONDA_R_KERNEL%" 2>nul
    echo       [i] Limpie kernel R duplicado del env conda.
)

REM Detectar R nativo. Busqueda directa con if exist (sin for con comillas/backslashes)
set "R_NATIVE="
call :find_r_in "C:\Program Files\R"
if not defined R_NATIVE call :find_r_in "C:\Program Files (x86)\R"
if not defined R_NATIVE call :find_r_in "%USERPROFILE%\AppData\Local\Programs\R"

if not defined R_NATIVE goto :no_r_native

echo       Encontre R nativo en:
echo         !R_NATIVE!
echo.
echo       Instalando IRkernel + tidyverse en C:\R-libs\4.6 ...
echo       (Esto tarda 3-5 minutos la primera vez)
echo.

REM Crear ruta de library FUERA de AppData\Local
REM (AppData\Local es redirigido por sandboxes de Windows Store apps)
set "R_USERLIB=C:\R-libs\4.6"
if not exist "%R_USERLIB%" mkdir "%R_USERLIB%" 2>nul
set "R_USERLIB_FWD=C:/R-libs/4.6"

REM Persistir R_LIBS_USER del usuario
setx R_LIBS_USER "%R_USERLIB%" >nul 2>&1

REM Instalar IRkernel + tidyverse + dependencias del curso
call "!R_NATIVE!" -e "install.packages(c('IRkernel','IRdisplay','repr','crayon','pbdZMQ','uuid','digest','jsonlite','evaluate','base64enc','htmltools','htmlwidgets','tidyverse','readxl','writexl','data.table','glue','lubridate','forcats','purrr'), lib='!R_USERLIB_FWD!', repos='https://cloud.r-project.org', dependencies=TRUE)"
if errorlevel 1 goto :r_install_failed

REM Crear kernel.json apuntando al R nativo + libPath hardcodeada
set "KERNEL_DIR=%APPDATA%\jupyter\kernels\ir"
if not exist "%KERNEL_DIR%" mkdir "%KERNEL_DIR%"

REM El R.exe (no Rscript) que va al kernel.json
set "R_BIN_DIR="
for %%i in ("!R_NATIVE!") do set "R_BIN_DIR=%%~dpi"
set "R_EXE=!R_BIN_DIR!R.exe"
if not exist "!R_EXE!" set "R_EXE=!R_BIN_DIR!..\R.exe"

REM Escapar backslashes para JSON
set "R_EXE_JSON=!R_EXE:\=\\!"

(
    echo {
    echo     "argv": [
    echo         "!R_EXE_JSON!",
    echo         "--slave",
    echo         "-e",
    echo         ".libPaths(c('!R_USERLIB_FWD!', .libPaths())); IRkernel::main()",
    echo         "--args",
    echo         "{connection_file}"
    echo     ],
    echo     "display_name": "R (system)",
    echo     "language": "R"
    echo }
) > "%KERNEL_DIR%\kernel.json"

echo       [OK] Kernel R registrado a mano apuntando a R nativo.
set "KERNEL_R_OK=1"
goto :step_4

:no_r_native
echo       [X] No encontre R nativo en:
echo            C:\Program Files\R
echo            C:\Program Files (x86)\R
echo            %USERPROFILE%\AppData\Local\Programs\R
echo.
echo       QUE HACER:
echo         1. Descarga R desde https://cran.r-project.org/bin/windows/base/
echo         2. Instalalo con la opcion por defecto.
echo         3. Vuelve a ejecutar este setup.bat.
echo.
goto :step_4

:r_install_failed
echo       [X] No pude instalar IRkernel/tidyverse en R nativo.
echo           Revisa el mensaje de error mas arriba.
echo.

REM ============================================================
REM [4/4] Verificacion final
REM ============================================================
:step_4
echo.
echo ============================================
echo   [4/4] Verificacion: kernels en Jupyter
echo ============================================
echo.
echo   Estos son los kernels que Jupyter detecta:
echo   (Para los notebooks del curso necesitas ver
echo    'fundamentos-pyr' y 'ir')
echo.
call conda run -n fundamentos-pyr python -m jupyter kernelspec list
echo.

REM ============================================================
REM Resumen final
REM ============================================================
echo ============================================
echo   Resumen final
echo ============================================
echo.
echo   [OK] Entorno conda 'fundamentos-pyr'
echo   [OK] Kernel Python registrado
if "!KERNEL_R_OK!"=="1" (
    echo   [OK] Kernel R registrado
) else (
    echo   [X]  Kernel R NO registrado
)
echo.
echo --------------------------------------------
echo   Que viene ahora
echo --------------------------------------------
echo.
echo   PASO 1 -- Abrir VS Code en la carpeta del curso
echo            File ^> Open Folder ^> Fundamentos_Python_R
echo.
echo   PASO 2 -- Verificar que todo funciona
echo            Abre 00_Verificacion_Setup.ipynb
echo            Ctrl+Shift+P ^> "Python: Select Interpreter"
echo            Elige "Python 3.11 (fundamentos-pyr)"
echo            Click en "Run All"
echo.
echo   PASO 3 -- Si las 6 pruebas pasan en verde, estas listo.
echo            Si alguna falla, revisa la celda con error y
echo            sigue las instrucciones que muestre.
echo.

if "!KERNEL_R_OK!"=="0" (
    echo --------------------------------------------
    echo   El kernel R NO se registro
    echo --------------------------------------------
    echo.
    echo   Causas tipicas:
    echo     1. R no esta instalado. Instala desde:
    echo        https://cran.r-project.org/bin/windows/base/
    echo     2. Antivirus o firewall bloqueo CRAN.
    echo     3. Sin conexion a internet durante la instalacion.
    echo.
    echo   Despues de resolver, vuelve a ejecutar este setup.bat
    echo   ^(es idempotente, no rompe nada al correrlo de nuevo^).
    echo.
)

echo --------------------------------------------
echo   Si tienes algun error
echo --------------------------------------------
echo.
echo   Saca foto de esta ventana COMPLETA con el celular
echo   y mandasela al docente:
echo     jrodriguezm216@gmail.com
echo.
echo   Tiempo de respuesta: menos de 24 horas.
echo.
echo ============================================
echo   La ventana se quedara abierta indefinidamente.
echo   Cuando termines de leer, cierrala con la X
echo   o tipea "exit" + Enter.
echo ============================================
echo.
goto :eof

REM ============================================================
REM Subrutinas
REM ============================================================

REM Busca R en la ruta dada (param 1) y setea R_NATIVE si lo encuentra.
:find_r_in
set "BASE=%~1"
if not exist "%BASE%" goto :eof
for /f "delims=" %%D in ('dir /b /ad "%BASE%" 2^>nul') do (
    if exist "%BASE%\%%D\bin\x64\Rscript.exe" (
        set "R_NATIVE=%BASE%\%%D\bin\x64\Rscript.exe"
        goto :eof
    )
    if exist "%BASE%\%%D\bin\Rscript.exe" (
        set "R_NATIVE=%BASE%\%%D\bin\Rscript.exe"
        goto :eof
    )
)
goto :eof

REM ---------- Salidas ----------
:no_conda
echo [X] ERROR: 'conda' no esta en el PATH.
echo.
echo     Instala Miniconda desde:
echo       https://www.anaconda.com/download/success
echo.
echo     IMPORTANTE: marca "Add Miniconda to my PATH" durante la instalacion.
echo     Despues vuelve a ejecutar este setup.bat.
echo.
goto :end_failure

:end_failure
echo.
echo ============================================
echo   Setup INCOMPLETO. Revisa los mensajes arriba.
echo   Cuando soluciones el problema, vuelve a ejecutar
echo   este setup.bat (es idempotente).
echo.
echo   Si necesitas ayuda, manda captura de esta
echo   ventana al docente: jrodriguezm216@gmail.com
echo ============================================
echo.
goto :eof
