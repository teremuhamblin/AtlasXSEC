---

📱 Module app/ — Application principale d’AtlasXSEC

Le module app/ constitue le point d’entrée de l’écosystème AtlasXSEC. Il héberge l’application Android principale, orchestre les modules de sécurité et forensic, et fournit l’infrastructure MVVM, DI et navigation nécessaire au fonctionnement cohérent de l’ensemble du framework.

Ce module assure la cohésion entre les briques internes (security-engine, security-services, forensic-core, reports, sandbox) et expose l’interface utilisateur centrale.

---

🧭 Rôle du module app/

- Initialise l’environnement AtlasXSEC et charge les modules déclarés.
- Fournit l’UI principale, la navigation et les écrans de gestion.
- Implémente l’architecture MVVM + AndroidX pour une structure claire et testable.
- Expose les services transverses : sécurité, sandbox, configuration, logs.
- Sert de couche d’intégration entre l’utilisateur et les modules spécialisés.
- Garantit une expérience cohérente, sécurisée et extensible.

---

🗂 Arborescence du module

`
app/
├── src/main/
│   ├── AndroidManifest.xml
│   ├── java/com/themaddogtmdg/securityapp/
│   │   ├── ui/
│   │   ├── viewmodel/
│   │   ├── di/
│   │   ├── navigation/
│   │   ├── utils/
│   │   ├── core/
│   │   └── SecurityApp.kt
│   ├── res/
│   └── assets/
└── test/
`

---

🧩 Description des sous-dossiers

ui/ — Interface utilisateur
Contient les écrans, fragments, activités et composants visuels.  
Responsabilités :
- Écrans principaux de l’application
- Intégration avec la navigation
- Composants UI réutilisables

viewmodel/ — Logique MVVM
Regroupe les ViewModels responsables :
- de l’état des écrans  
- de l’orchestration des modules  
- de la gestion des flux de données  

di/ — Injection de dépendances
Configuration DI (Hilt/Koin) pour :
- les services internes  
- les modules de sécurité  
- les composants transverses  

navigation/ — Graph de navigation
Définit :
- les routes  
- les transitions  
- la structure de navigation globale  

utils/ — Utilitaires génériques
Fonctions d’aide, extensions Kotlin, helpers AndroidX.

core/ — Classes de base
Composants fondamentaux :
- BaseActivity, BaseFragment, BaseViewModel
- gestion des erreurs
- wrappers de sécurité
- gestion du cycle de vie

SecurityApp.kt — Application principale
Point d’entrée de l’application :
- initialisation des modules  
- configuration globale  
- chargement du manifeste central  
- activation des services transverses  

res/ — Ressources Android
Layouts, drawables, styles, thèmes, strings, menus.

assets/ — Données embarquées
- certificats  
- règles de détection  
- signatures  
- profils de sandbox  

test/ — Tests unitaires
Tests MVVM, tests d’intégration légère, mocks des modules.

---

🔗 Intégration avec les autres modules AtlasXSEC

Le module app/ interagit directement avec :

| Module | Rôle | Intégration |
|-------|------|-------------|
| security-engine | Crypto, détection, auth, secure storage | App appelle les APIs via DI |
| security-services | Monitoring, services persistants, alertes | App gère l’activation et l’UI |
| forensic-core | Analyse fichiers, artefacts, timeline | App expose les écrans et workflows |
| reports | Génération PDF/JSON/HTML | App déclenche et affiche les rapports |
| sandbox | Isolation, intégrité, virtualisation | App initialise et supervise |

---

🔐 Responsabilités clés du module app/

- Initialisation sécurisée de l’environnement.
- Gestion centralisée des permissions Android.
- Orchestration des modules via le manifeste.
- Interface utilisateur unifiée pour toutes les fonctionnalités.
- Gouvernance de l’écosystème (navigation, DI, logs, erreurs).
- Extensibilité future sans dette technique.

---

🚀 Vision et philosophie

Le module app/ n’est pas un simple conteneur Android :  
c’est la colonne vertébrale d’AtlasXSEC.

Il garantit :
- une architecture propre et modulaire  
- une expérience utilisateur cohérente  
- une intégration fluide des modules de sécurité et forensic  
- une base solide pour les futures extensions  

---
