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
