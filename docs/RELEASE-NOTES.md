---

RELEASE-NOTES.md — Notes de version

Version 1.0.0 — Initialisation du projet
Cette première version marque la fondation de Security‑APK en tant que suite modulaire dédiée à la sécurité Android, au forensic et au reporting. L’objectif principal est d’établir une base technique solide, cohérente et extensible.

Nouveautés principales
- Mise en place de l’architecture complète du projet :
  - Module app/ basé sur AndroidX + MVVM.
  - Module security-engine/ pour la sécurité applicative.
  - Module security-services/ pour la surveillance continue.
  - Module forensic-core/ pour l’analyse forensic.
  - Module reports/ pour la génération de rapports.
  - Module sandbox/ pour les tests isolés.
- Intégration de l’injection de dépendances (Hilt/Koin selon configuration).
- Mise en place des conventions de code, de nommage et de structure.
- Ajout du dossier docs/ avec les fichiers 00 → 11.

Fonctionnalités du module App
- Architecture MVVM complète.
- Navigation Jetpack.
- Gestion centralisée des états ViewModel.
- Système de ressources structuré (layouts, thèmes, assets).
- BaseActivity, BaseFragment et BaseViewModel.

Fonctionnalités du moteur Security Engine
- Détection root, debug et tampering.
- Chiffrement AES/GCM et hashing SHA‑256/512.
- TLS Pinning et validation réseau.
- SecureStorage basé sur EncryptedSharedPreferences.
- Authentification biométrique.

Fonctionnalités des Security Services
- Monitoring d’intégrité en arrière‑plan.
- Services persistants pour la surveillance continue.
- Système d’alertes de sécurité.

Fonctionnalités du Forensic Core
- Extraction d’artefacts (fichiers, logs, bases SQLite).
- Analyse de signatures et métadonnées.
- Reconstruction de timeline.
- Normalisation JSON des artefacts.

Fonctionnalités du module Reports
- Génération de rapports PDF, HTML et JSON.
- Système de templates personnalisables.
- Export versionné des artefacts forensic.

Fonctionnalités du Sandbox
- Simulation d’environnements compromis.
- Tests d’intégrité et scénarios isolés.
- Virtualisation d’artefacts pour validation.

Documentation
- Ajout des fichiers :
  - 00_overview.md  
  - 01_architecture.md  
  - 02appmodule.md  
  - 03securityengine.md  
  - 04securityservices.md  
  - 05forensiccore.md  
  - 06_reports.md  
  - 07_sandbox.md  
  - 08permissionssecurity.md  
  - 09forensicflow.md  
  - 10_contributing.md  
  - 11_roadmap.md  

---

Version 1.1.0 — Améliorations de sécurité (prévue)
Cette version se concentrera sur le renforcement du moteur de sécurité et l’amélioration des services persistants.

Améliorations prévues
- Détection avancée de hooking (Frida, Xposed).
- Vérification d’intégrité renforcée (checksums dynamiques).
- Optimisation du TLS Pinning.
- Amélioration du monitoring en arrière‑plan.

---

Version 1.2.0 — Extension forensic (prévue)
Cette version étendra les capacités forensic pour couvrir davantage d’artefacts et améliorer la corrélation.

Améliorations prévues
- Extraction avancée de bases SQLite.
- Analyse heuristique des fichiers.
- Timeline enrichie avec corrélation multi‑sources.
- Export JSON versionné.

---

Version 2.0.0 — Plateforme complète (prévue)
Objectif : transformer Security‑APK en une suite complète de sécurité + forensic + reporting.

Objectifs
- API interne stable pour plugins.
- Reporting interactif avancé.
- Sandbox évolué avec stress tests.
- Intégration CI/CD pour tests automatisés.

---
