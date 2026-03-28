Ensemble complet de trois scripts de vérification système, adaptés à AtlasXSEC.  
Ils contrôlent :

- Version Android SDK / Java  
- Présence de Gradle  
- Présence de Kotlin  
- Présence des dépendances critiques (OpenJDK, Git, ADB, etc.)  
- Permissions et outils nécessaires pour compiler et déployer ton application  
- Modules requis pour ton architecture (security-engine, forensic-core, sandbox, etc.)
- Compatibles toutes éditions.

---

📁 1. Script Linux (Bash) — check_system.sh

`bash

!/bin/bash

echo "=== Vérification du système pour AtlasXSEC ==="

Vérification Java
if command -v java >/dev/null 2>&1; then
    echo "[OK] Java installé : $(java -version 2>&1 | head -n 1)"
else
    echo "[ERREUR] Java n'est pas installé."
fi

Vérification Kotlin
if command -v kotlinc >/dev/null 2>&1; then
    echo "[OK] Kotlin installé : $(kotlinc -version)"
else
    echo "[ERREUR] Kotlin n'est pas installé."
fi

Vérification Gradle
if command -v gradle >/dev/null 2>&1; then
    echo "[OK] Gradle installé : $(gradle -v | head -n 1)"
else
    echo "[ERREUR] Gradle n'est pas installé."
fi

Vérification Git
if command -v git >/dev/null 2>&1; then
    echo "[OK] Git installé : $(git --version)"
else
    echo "[ERREUR] Git n'est pas installé."
fi

Vérification ADB
if command -v adb >/dev/null 2>&1; then
    echo "[OK] ADB installé : $(adb version | head -n 1)"
else
    echo "[ERREUR] ADB n'est pas installé."
fi

Vérification SDK Android
if [ -d "$ANDROID_HOME" ] || [ -d "$HOME/Android/Sdk" ]; then
    echo "[OK] SDK Android détecté."
else
    echo "[ERREUR] SDK Android introuvable."
fi

Vérification des modules du projet
MODULES=("app" "security-engine" "security-services" "forensic-core" "reports" "sandbox")

echo "=== Vérification des modules ==="
for module in "${MODULES[@]}"; do
    if [ -d "$module" ]; then
        echo "[OK] Module détecté : $module"
    else
        echo "[ERREUR] Module manquant : $module"
    fi
done

echo "=== Vérification terminée ==="
`

---

📁 2.1 Script Windows CMD — check_system.cmd

`cmd
@echo off
echo === Vérification du système pour AtlasXSEC ===

:: Vérification Java
java -version >nul 2>&1
if %errorlevel%==0 (
    echo [OK] Java installé
) else (
    echo [ERREUR] Java non installé
)

:: Vérification Kotlin
kotlinc -version >nul 2>&1
if %errorlevel%==0 (
    echo [OK] Kotlin installé
) else (
    echo [ERREUR] Kotlin non installé
)

:: Vérification Gradle
gradle -v >nul 2>&1
if %errorlevel%==0 (
    echo [OK] Gradle installé
) else (
    echo [ERREUR] Gradle non installé
)

:: Vérification Git
git --version >nul 2>&1
if %errorlevel%==0 (
    echo [OK] Git installé
) else (
    echo [ERREUR] Git non installé
)

:: Vérification ADB
adb version >nul 2>&1
if %errorlevel%==0 (
    echo [OK] ADB installé
) else (
    echo [ERREUR] ADB non installé
)

:: Vérification SDK Android
if exist "%ANDROID_HOME%" (
    echo [OK] SDK Android détecté
) else (
    echo [ERREUR] SDK Android introuvable
)

echo === Vérification des modules ===
for %%M in (app security-engine security-services forensic-core reports sandbox) do (
    if exist %%M (
        echo [OK] Module détecté : %%M
    ) else (
        echo [ERREUR] Module manquant : %%M
    )
)

echo === Vérification terminée ===
pause
`

---

📁 2.2 Script Windows PowerShell — check_system.ps1

`powershell
Write-Host "=== Vérification du système pour AtlasXSEC ==="

Vérification Java
if (Get-Command java -ErrorAction SilentlyContinue) {
    Write-Host "[OK] Java installé"
} else {
    Write-Host "[ERREUR] Java non installé"
}

Vérification Kotlin
if (Get-Command kotlinc -ErrorAction SilentlyContinue) {
    Write-Host "[OK] Kotlin installé"
} else {
    Write-Host "[ERREUR] Kotlin non installé"
}

Vérification Gradle
if (Get-Command gradle -ErrorAction SilentlyContinue) {
    Write-Host "[OK] Gradle installé"
} else {
    Write-Host "[ERREUR] Gradle non installé"
}

Vérification Git
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host "[OK] Git installé"
} else {
    Write-Host "[ERREUR] Git non installé"
}

Vérification ADB
if (Get-Command adb -ErrorAction SilentlyContinue) {
    Write-Host "[OK] ADB installé"
} else {
    Write-Host "[ERREUR] ADB non installé"
}

Vérification SDK Android
if ($env:ANDROID_HOME -or (Test-Path "$HOME\AppData\Local\Android\Sdk")) {
    Write-Host "[OK] SDK Android détecté"
} else {
    Write-Host "[ERREUR] SDK Android introuvable"
}

Vérification des modules
$modules = @("app", "security-engine", "security-services", "forensic-core", "reports", "sandbox")

Write-Host "=== Vérification des modules ==="
foreach ($m in $modules) {
    if (Test-Path $m) {
        Write-Host "[OK] Module détecté : $m"
    } else {
        Write-Host "[ERREUR] Module manquant : $m"
    }
}

Write-Host "=== Vérification terminée ==="
`

---

📌 Ce que ces scripts vérifient

Outils essentiels
- Java  
- Kotlin  
- Gradle  
- Git  
- ADB  
- SDK Android  

Modules de ton architecture
- app  
- security-engine  
- security-services  
- forensic-core  
- reports  
- sandbox  

Compatibilité multiplateforme
- Linux  
- Windows CMD  
- Windows PowerShell  

---
