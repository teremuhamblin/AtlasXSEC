---

📘 11_onboarding.md — Onboarding développeur

Introduction
AtlasXSEC est un framework modulaire Android dédié à la sécurité, au forensic et à l’analyse avancée. Ce guide accompagne les nouveaux développeurs dans la prise en main du projet, de l’installation à la compréhension de l’architecture.

Prérequis
- Android Studio Flamingo ou supérieur  
- JDK 17  
- Gradle 8+  
- ADB installé  
- Appareil ou émulateur Android 10+  

Installation
1. Cloner le dépôt :  
   git clone https://.../AtlasXSEC.git
2. Ouvrir le projet dans Android Studio.  
3. Laisser Gradle synchroniser les modules.  
4. Lancer l’application depuis le module app/.

Structure générale
AtlasXSEC repose sur une architecture modulaire :

- app/ : application principale  
- security-engine/ : moteur de sécurité  
- security-services/ : services Android  
- forensic-core/ : analyse forensic  
- reports/ : génération de rapports  
- sandbox/ : isolation et intégrité  

Chaque module est indépendant, versionné et documenté.

Workflow Git
- main : stable  
- dev : développement  
- branches de features : feature/<nom>  
- commits : Conventional Commits  
- PR obligatoires avec revue  

Lancer l’application
- Sélectionner un device Android 10+  
- Build → Run  
- L’application charge automatiquement les modules déclarés dans le manifeste central.

Débogage
- Logs via Logcat (tag : AtlasXSEC)  
- Logs structurés JSON dans /data/local/tmp/atlasxsec/logs/  
- Mode diagnostic activable dans les paramètres internes

---
