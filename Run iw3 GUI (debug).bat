@echo off
setlocal
REM Prefer .venv, fallback to venv
set "ENV_DIR="
if exist ".\.venv\Scripts\python.exe" set "ENV_DIR=.venv"
if not defined ENV_DIR if exist ".\venv\Scripts\python.exe" set "ENV_DIR=venv"
if not defined ENV_DIR (
  echo No se encontro ningun entorno virtual (.venv ni venv).
  echo Crea uno con: python -m venv .venv
  pause
  exit /b 1
)

call .\%ENV_DIR%\Scripts\activate
".\%ENV_DIR%\Scripts\python.exe" -m iw3.gui
if errorlevel 1 (
  echo.
  echo [DEBUG] iw3.gui salio con error (codigo %ERRORLEVEL%).
  echo Revise los mensajes anteriores para detalles.
  pause
)
