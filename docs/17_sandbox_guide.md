---

📘 17sandboxguide.md — Guide Sandbox AtlasXSEC

Introduction
Le module sandbox fournit un environnement isolé permettant d’exécuter, analyser ou inspecter des fichiers et processus potentiellement dangereux sans compromettre l’intégrité du système.

Objectifs de la sandbox
- Isoler les opérations sensibles.
- Empêcher les accès non autorisés au système.
- Vérifier l’intégrité des fichiers et processus.
- Simuler un environnement contrôlé pour l’analyse forensic.

Architecture interne
- isolation/ : mécanismes d’isolation logique.
- integrity/ : vérification d’intégrité, hash, signatures.
- virtualization/ : environnement simulé (fake FS, fake device).
- SandboxManager.kt : gestionnaire central.

Fonctionnement général
1. Initialisation  
   - Chargement des profils de sandbox depuis assets/.
   - Vérification des signatures des profils.

2. Création d’un environnement isolé  
   - Système de fichiers virtuel.
   - Restrictions réseau.
   - Permissions limitées.

3. Exécution contrôlée  
   - Analyse de fichiers suspects.
   - Extraction de métadonnées.
   - Monitoring en temps réel.

4. Nettoyage  
   - Suppression de l’environnement.
   - Vérification post-exécution.

Profils de sandbox
Chaque profil définit :
- les permissions autorisées,
- les restrictions réseau,
- les règles d’intégrité,
- les limites de ressources.

Exemples :
- profil_light.json : analyse simple.
- profil_strict.json : fichiers suspects.
- profil_apk.json : analyse d’APK.

Bonnes pratiques sandbox
- Toujours utiliser un profil strict pour les fichiers inconnus.
- Ne jamais analyser un fichier directement dans app/.
- Documenter les actions dans les logs.
- Vérifier les signatures des profils avant utilisation.

Points d’extension
- Virtualisation avancée (fake sensors, fake GPS).
- Analyse comportementale.
- Détection d’évasion de sandbox.

---
