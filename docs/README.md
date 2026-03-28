📁 docs/
- Documentation complète d’AtlasXSEC

📘 1. Introduction générale 
— docs/00_overview.md

Vision du projet
AtlasXSEC est une application Android modulaire dédiée à la sécurité mobile, à l’analyse forensic et à la surveillance d’intégrité.  
Elle repose sur une architecture multi‑modules, MVVM, Kotlin, AndroidX et un moteur de sécurité isolé.

Objectifs
- Analyse système et réseau  
- Détection d’anomalies, root, tampering  
- Extraction d’artefacts forensic  
- Génération de rapports PDF/JSON/HTML  
- Services persistants de surveillance  
- Isolation interne via sandbox  

Architecture globale
- app/ : interface, navigation, DI, ViewModels  
- security-engine/ : moteur de sécurité  
- security-services/ : services Android  
- forensic-core/ : moteur forensic  
- reports/ : génération de rapports  
- sandbox/ : isolation et intégrité interne  

---

📘 2. Architecture du projet 
— docs/01_architecture.md

Structure générale

`
Security-APK/
│
├── app/
├── security-engine/
├── security-services/
├── forensic-core/
├── reports/
├── sandbox/
└── docs/
`

Rôle de chaque module

| Module | Rôle |
|--------|------|
| app | UI, navigation, DI, ViewModels |
| security-engine | crypto, détection, réseau, stockage sécurisé |
| security-services | services Android (foreground, monitoring, alerts) |
| forensic-core | extraction d’artefacts, timeline, analyse fichiers |
| reports | génération PDF/JSON/HTML |
| sandbox | isolation, intégrité, virtualisation interne |

Flux interne
1. L’utilisateur déclenche une analyse.  
2. Le ViewModel appelle le moteur forensic ou sécurité.  
3. Les services collectent les données.  
4. Le moteur forensic traite et structure.  
5. Le module reports génère un rapport.  
6. Le sandbox vérifie l’intégrité des modules.  

---

📘 3. Module app 
— docs/02appmodule.md

Contenu
- ui/ : écrans, fragments  
- viewmodel/ : logique MVVM  
- di/ : injection Hilt  
- navigation/ : graphes de navigation  
- utils/ : helpers  
- core/ : classes de base  
- SecurityApp.kt : point d’entrée  

Responsabilités
- Gestion de l’interface  
- Communication avec les modules internes  
- Gestion des permissions  
- Intégration Hilt  

Manifest
Déclare :
- Activity principale  
- Services externes  
- FileProvider  

---

📘 4. Module security-engine 
— docs/03securityengine.md

Sous-modules
- crypto/ : hashing, signatures, chiffrement  
- detection/ : root, debug, tampering, hooking  
- network/ : TLS pinning, analyse réseau  
- storage/ : SecureStorage (EncryptedSharedPrefs)  
- auth/ : biométrie, MFA  

Responsabilités
- Moteur de sécurité central  
- API interne pour les autres modules  
- Aucune dépendance Android → testable  

Classe principale
SecurityEngine.kt  
- initialise les sous-systèmes  
- expose des fonctions d’analyse  

---

📘 5. Module security-services 
— docs/04securityservices.md

Services inclus
- IntegrityMonitoringService  
- PersistentSecurityService  
- SecurityAlertService  

Rôle
- Surveillance continue  
- Détection d’événements système  
- Notifications de sécurité  
- Exécution en arrière-plan  

Manifest
Déclare les services foreground.

---

📘 6. Module forensic-core 
— docs/05forensiccore.md

Sous-modules
- artifacts/ : extraction logs, caches, bases SQLite  
- timeline/ : reconstruction chronologique  
- fileanalysis/ : entropie, hash, signatures binaires  
- metadata/ : EXIF, attributs étendus  

Classe principale
ForensicCore.kt  
- orchestre les analyses  
- fournit des résultats structurés  

Objectifs forensic
- Analyse non destructive  
- Export sécurisé  
- Compatibilité Android 7 → 14  

---

📘 7. Module reports 
— docs/06_reports.md

Formats supportés
- PDF (iText7)  
- JSON (Gson)  
- HTML (JSoup)  

Sous-modules
- pdf/ : templates PDF  
- json/ : exports machine-readable  
- html/ : rapports interactifs  
- templates/ : modèles  

Classe principale
ReportGenerator.kt  
- génère un rapport complet  
- supporte signatures cryptographiques  

---

📘 8. Module sandbox 
— docs/07_sandbox.md

Sous-modules
- isolation/ : exécution isolée  
- integrity/ : vérification APK + modules  
- virtualization/ : environnement contrôlé  

Classe principale
SandboxManager.kt  
- vérifie l’intégrité  
- isole les analyses sensibles  

Objectifs
- Protection contre le tampering  
- Protection contre l’injection  
- Vérification runtime  

---

📘 9. Permissions & sécurité 
— docs/08permissionssecurity.md

Permissions utilisées
- INTERNET  
- ACCESSNETWORKSTATE  
- READ_LOGS  
- PACKAGEUSAGESTATS  
- QUERYALLPACKAGES  
- FOREGROUND_SERVICE  
- WAKE_LOCK  

Justification
- Analyse réseau → INTERNET  
- Analyse forensic → READ_LOGS  
- Détection apps → QUERYALLPACKAGES  
- Monitoring → FOREGROUND_SERVICE  

Sécurité interne
- allowBackup = false  
- fullBackupContent = false  
- FileProvider sécurisé  
- Services non exportés  

---

📘 10. Flux d’analyse forensic 
— docs/09forensicflow.md

Étapes
1. Collecte des artefacts  
2. Analyse fichiers  
3. Reconstruction timeline  
4. Génération rapport  
5. Vérification sandbox  
6. Export sécurisé  

Diagramme simplifié

`
User → ViewModel → ForensicCore → SecurityEngine → Reports → Sandbox → Output
`

---

📘 11. Guide contributeur 
— docs/10_contributing.md

Règles
- Respecter MVVM  
- Ne jamais mélanger UI et logique  
- Ne jamais ajouter de dépendance Android dans un module Kotlin pur  
- Tests unitaires obligatoires pour security-engine et forensic-core  

Style Kotlin
- KDoc obligatoire  
- Pas de logique dans les Fragments  
- ViewModel = source de vérité  

---

📘 12. Roadmap 
— docs/11_roadmap.md

Version 1.0
- Analyse système  
- Analyse réseau  
- Extraction artefacts  
- Rapports PDF/JSON/HTML  
- Sandbox minimal  

Version 1.5
- Analyse mémoire  
- Détection hooking avancée  
- Timeline enrichie  

Version 2.0
- IA locale pour classification anomalies  
- Mode expert forensic  
- Export cryptographiquement signé  

---
