@echo off
setlocal
REM Prefer .venv, fallback to venv
if exist ".\.venv\Scripts\activate" (
	call .\.venv\Scripts\activate
) else if exist ".\venv\Scripts\activate" (
	call .\venv\Scripts\activate
) else (
	echo No se encontro ningun entorno virtual (.venv ni venv).
	echo Crea uno con: python -m venv .venv
	exit /b 1
)

call cmd
