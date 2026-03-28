---

01_architecture.md

Architecture générale de Security‑APK

Security‑APK repose sur une architecture modulaire pensée pour la sécurité, l’analyse forensic et la maintenabilité à long terme. Le projet combine un module Android principal (app), plusieurs moteurs spécialisés (security-engine, security-services), un cœur forensic (forensic-core), un système de génération de rapports (reports) et un environnement d’isolation (sandbox). L’ensemble suit les principes MVVM, Clean Architecture et une séparation stricte des responsabilités.

---

Vision d’ensemble

L’architecture est organisée en six modules majeurs, chacun ayant une responsabilité unique :

- app/ : application Android principale (UI, MVVM, navigation, DI).
- security-engine/ : moteur de sécurité interne (crypto, détection, réseau, stockage sécurisé, auth).
- security-services/ : services Android persistants (monitoring, background, alertes).
- forensic-core/ : extraction, analyse et normalisation des artefacts forensic.
- reports/ : génération de rapports (PDF, JSON, HTML).
- sandbox/ : environnement isolé pour tests, intégrité et virtualisation.

Chaque module est indépendant, testable et versionnable.

---

Structure en couches

Couche 1 — Présentation (app/)
Interface utilisateur, logique MVVM et navigation.

- ui/ : écrans, fragments, composants visuels.
- viewmodel/ : logique métier côté client, états, transformations.
- navigation/ : graphes de navigation Jetpack.
- di/ : injection de dépendances (Hilt/Koin).
- core/ : classes de base (BaseActivity, BaseViewModel…).
- utils/ : helpers génériques.
- res/ : layouts, drawables, strings.
- assets/ : certificats, règles, signatures.

Cette couche ne contient aucune logique de sécurité ou forensic : elle consomme les modules spécialisés.

---

Couche 2 — Moteur de sécurité (security-engine/)
Composant central dédié à la sécurité applicative.

- crypto/ : chiffrement, hashing, signatures.
- detection/ : root detection, debug detection, tampering, hooking.
- network/ : sécurité réseau (TLS pinning, validation).
- storage/ : stockage sécurisé (EncryptedSharedPrefs, keystore).
- auth/ : biométrie, MFA, challenge‑response.

Ce module expose une API interne utilisée par l’app et les services.

---

Couche 3 — Services de sécurité (security-services/)
Services Android persistants et automatisés.

- monitoring/ : surveillance d’intégrité, détection d’anomalies.
- background/ : tâches persistantes, watchdogs, vérifications périodiques.
- alerts/ : notifications de sécurité, alerting interne.

Ces services fonctionnent même lorsque l’app est en arrière‑plan.

---

Couche 4 — Forensic Core (forensic-core/)
Moteur d’analyse forensic Android.

- artifacts/ : extraction d’artefacts (fichiers, logs, bases SQLite).
- timeline/ : reconstruction chronologique d’événements.
- fileanalysis/ : analyse de fichiers, signatures, métadonnées.
- metadata/ : normalisation des données forensic.

Ce module produit des artefacts normalisés consommés par reports/.

---

Couche 5 — Génération de rapports (reports/)
Système de reporting professionnel.

- pdf/ : génération de rapports PDF.
- json/ : exports structurés.
- html/ : rapports interactifs.
- templates/ : modèles visuels, thèmes, structures.
- ReportGenerator.kt : orchestrateur central.

Les rapports peuvent être utilisés pour audits, investigations ou conformité.

---

Couche 6 — Sandbox (sandbox/)
Environnement isolé pour tester les modules.

- isolation/ : exécution contrôlée, sandboxing.
- integrity/ : vérification d’intégrité, tests de robustesse.
- virtualization/ : simulation d’environnements, artefacts, scénarios.

Le sandbox permet de valider les modules sans risque pour l’app réelle.

---

Communication entre modules

Les modules communiquent via des interfaces strictes et des contrats stables.

- app → security-engine : appels API pour sécurité, auth, crypto.
- app → security-services : démarrage/arrêt de services, réception d’alertes.
- security-engine → forensic-core : extraction d’artefacts sécurisés.
- forensic-core → reports : génération de rapports à partir d’artefacts.
- sandbox → tous les modules : tests, simulation, validation.

Les modules ne doivent jamais dépendre circulairement.

---

Flux de données typique

Un flux complet de sécurité + forensic peut ressembler à :

`
security-engine → forensic-core → artifacts.json → reports → rapport.html/pdf
`

Ou côté application :

`
app → security-engine → security-services → alerts → ui
`

Chaque étape est remplaçable sans casser les autres.

---

Conventions techniques

Nommage
- Modules : kebab-case
- Packages : lowercase
- Classes : PascalCase
- Ressources : snake_case
- Artefacts forensic : artifact_<type>.json

Code
- MVVM strict dans app/
- Clean Architecture dans les modules
- Tests unitaires + tests d’intégration
- Logs structurés
- Gestion d’erreurs centralisée

Documentation
- Un fichier dédié par module (02appmodule.md, 03securityengine.md…)
- Schémas, exemples, workflows
- Conventions de sécurité et forensic

---

Extensibilité

L’architecture permet d’ajouter facilement :

- de nouveaux modules de sécurité,
- de nouveaux artefacts forensic,
- de nouveaux formats de rapport,
- des services Android supplémentaires,
- des plugins externes.

Chaque module est autonome et versionnable.

---

Vision long terme

Security‑APK est conçu pour évoluer vers :

- un moteur forensic complet,
- un framework de sécurité Android modulaire,
- une suite d’outils professionnels pour audits et investigations,
- une intégration CI/CD pour tests automatisés,
- une interface graphique avancée pour rapports et analyses.

---
