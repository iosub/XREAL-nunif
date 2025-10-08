# Script de PowerShell para ejecutar iw3 GUI
# Equivalente a Runiw3GUI.bat

# Buscar entorno virtual
$envDir = $null
if (Test-Path ".\.venv\Scripts\pythonw.exe") {
    $envDir = ".venv"
} elseif (Test-Path ".\venv\Scripts\pythonw.exe") {
    $envDir = "venv"
}

if (-not $envDir) {
    Write-Host "No se encontró ningún entorno virtual (.venv ni venv)."
    Write-Host "Crea uno con: python -m venv .venv"
    exit 1
}

# Activar entorno virtual y ejecutar GUI
& ".\$envDir\Scripts\Activate.ps1"
Start-Process -FilePath ".\$envDir\Scripts\pythonw.exe" -ArgumentList "-m", "iw3.gui" -WindowStyle Normal