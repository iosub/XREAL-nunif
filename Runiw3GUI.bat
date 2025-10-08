@echo off
setlocal
REM Prefer .venv, fallback to venv
set "ENV_DIR="
if exist ".venv\Scripts\pythonw.exe" set "ENV_DIR=.venv"
if not defined ENV_DIR if exist "venv\Scripts\pythonw.exe" set "ENV_DIR=venv"
if not defined ENV_DIR (
	echo No se encontro ningun entorno virtual (.venv ni venv).
	echo Crea uno con: python -m venv .venv
	exit /b 1
)

call %ENV_DIR%\Scripts\activate
start "iw3-gui" "%ENV_DIR%\Scripts\pythonw.exe" -m iw3.gui
exit /b 0
