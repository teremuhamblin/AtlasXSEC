#!/bin/bash

echo "=== Vérification du système pour AtlasXSEC ==="

# Vérification Java
if command -v java >/dev/null 2>&1; then
    echo "[OK] Java installé : $(java -version 2>&1 | head -n 1)"
else
    echo "[ERREUR] Java n'est pas installé."
fi

# Vérification Kotlin
if command -v kotlinc >/dev/null 2>&1; then
    echo "[OK] Kotlin installé : $(kotlinc -version)"
else
    echo "[ERREUR] Kotlin n'est pas installé."
fi

# Vérification Gradle
if command -v gradle >/dev/null 2>&1; then
    echo "[OK] Gradle installé : $(gradle -v | head -n 1)"
else
    echo "[ERREUR] Gradle n'est pas installé."
fi

# Vérification Git
if command -v git >/dev/null 2>&1; then
    echo "[OK] Git installé : $(git --version)"
else
    echo "[ERREUR] Git n'est pas installé."
fi

# Vérification ADB
if command -v adb >/dev/null 2>&1; then
    echo "[OK] ADB installé : $(adb version | head -n 1)"
else
    echo "[ERREUR] ADB n'est pas installé."
fi

# Vérification SDK Android
if [ -d "$ANDROID_HOME" ] || [ -d "$HOME/Android/Sdk" ]; then
    echo "[OK] SDK Android détecté."
else
    echo "[ERREUR] SDK Android introuvable."
fi

# Vérification des modules du projet
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
