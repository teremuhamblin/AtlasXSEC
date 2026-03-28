Write-Host "=== Vérification du système pour AtlasXSEC ==="

# Vérification Java
if (Get-Command java -ErrorAction SilentlyContinue) {
    Write-Host "[OK] Java installé"
} else {
    Write-Host "[ERREUR] Java non installé"
}

# Vérification Kotlin
if (Get-Command kotlinc -ErrorAction SilentlyContinue) {
    Write-Host "[OK] Kotlin installé"
} else {
    Write-Host "[ERREUR] Kotlin non installé"
}

# Vérification Gradle
if (Get-Command gradle -ErrorAction SilentlyContinue) {
    Write-Host "[OK] Gradle installé"
} else {
    Write-Host "[ERREUR] Gradle non installé"
}

# Vérification Git
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host "[OK] Git installé"
} else {
    Write-Host "[ERREUR] Git non installé"
}

# Vérification ADB
if (Get-Command adb -ErrorAction SilentlyContinue) {
    Write-Host "[OK] ADB installé"
} else {
    Write-Host "[ERREUR] ADB non installé"
}

# Vérification SDK Android
if ($env:ANDROID_HOME -or (Test-Path "$HOME\AppData\Local\Android\Sdk")) {
    Write-Host "[OK] SDK Android détecté"
} else {
    Write-Host "[ERREUR] SDK Android introuvable"
}

# Vérification des modules
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
