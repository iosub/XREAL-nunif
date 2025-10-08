# PowerShell launcher to run iw3 GUI using the project's virtual environment (.venv preferred)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$envDir = $null

$venvDot = Join-Path $root '.venv'
$venvStd = Join-Path $root 'venv'

if (Test-Path (Join-Path $venvDot 'Scripts\python.exe')) {
  $envDir = $venvDot
} elseif (Test-Path (Join-Path $venvStd 'Scripts\python.exe')) {
  $envDir = $venvStd
} else {
  Write-Host 'No se encontro ningun entorno virtual (.venv ni venv).'
  Write-Host 'Crea uno con: python -m venv .venv'
  exit 1
}

# Activate venv in this process
& (Join-Path $envDir 'Scripts\Activate.ps1')

# Run GUI with console to show errors
& (Join-Path $envDir 'Scripts\python.exe') -m iw3.gui

if ($LASTEXITCODE -ne 0) {
  Write-Host "`n[DEBUG] iw3.gui salio con error (codigo $LASTEXITCODE)." -ForegroundColor Yellow
}
