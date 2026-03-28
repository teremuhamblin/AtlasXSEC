CHANGELOG.md

Format et conventions
Ce document suit les principes de versionnement sémantique (SemVer) et distingue quatre types de changements :

- Added : nouvelles fonctionnalités  
- Changed : modifications existantes  
- Fixed : corrections de bugs  
- Removed : suppressions de fonctionnalités  
- Security : correctifs ou améliorations de sécurité  

Les versions sont listées de la plus récente à la plus ancienne.

---

[1.0.0] – Initial Release
Version fondatrice de Security‑APK, posant l’architecture complète du projet et les modules principaux.

Added
- Module app/ basé sur AndroidX + MVVM  
- Module security-engine/ (crypto, detection, network, storage, auth)  
- Module security-services/ (monitoring, background, alerts)  
- Module forensic-core/ (artifacts, timeline, fileanalysis, metadata)  
- Module reports/ (pdf, html, json, templates)  
- Module sandbox/ (isolation, integrity, virtualization)  
- Injection de dépendances (Hilt/Koin)  
- Documentation initiale (00 → 12)  
- Conventions de code et structure du projet  

Security
- Détection root, debug, tampering  
- TLS Pinning  
- SecureStorage via EncryptedSharedPreferences  
- Authentification biométrique  

---

[1.1.0] – Security Enhancements (prévu)
Renforcement du moteur de sécurité et amélioration des services persistants.

Added
- Détection avancée de hooking (Frida, Xposed)  
- Vérification d’intégrité renforcée (checksums dynamiques)  

Changed
- Optimisation du TLS Pinning  
- Amélioration du monitoring en arrière‑plan  

Security
- Renforcement des protections runtime  

---

[1.2.0] – Forensic Expansion (prévu)

Added
- Extraction avancée de bases SQLite  
- Analyse heuristique des fichiers  
- Timeline enrichie avec corrélation multi‑sources  
- Export JSON versionné  

Changed
- Normalisation des artefacts forensic  
- Amélioration des performances d’analyse  

---

[2.0.0] – Platform Evolution (prévu)

Added
- API interne stable pour plugins  
- Reporting interactif avancé  
- Sandbox évolué avec stress tests  
- Intégration CI/CD pour tests automatisés  

Changed
- Architecture modulaire renforcée  
- Documentation complète versionnée  

---

Historique des versions
- 1.0.0 – Première version stable  
- 1.1.0 – Améliorations de sécurité (prévu)  
- 1.2.0 – Extension forensic (prévu)  
- 2.0.0 – Plateforme complète (prévu)  

---
