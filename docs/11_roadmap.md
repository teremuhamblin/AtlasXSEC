---

11_roadmap.md — Feuille de route du projet

Objectifs généraux
Security‑APK évolue autour de trois axes majeurs : renforcer la sécurité applicative, étendre les capacités forensic, et améliorer l’expérience développeur. La feuille de route organise ces objectifs en étapes progressives, avec une vision claire de l’évolution du projet sur le moyen et long terme.

---

Priorités à court terme (0–3 mois)

Stabilisation des modules existants
- Finalisation du module app/ avec une architecture MVVM complète et homogène.
- Renforcement du moteur security-engine/, notamment sur la détection de tampering et la sécurité réseau.
- Mise en place d’un socle stable pour security-services/ afin d’assurer une surveillance continue fiable.

Améliorations techniques
- Intégration complète de l’injection de dépendances (Hilt ou Koin).
- Mise en place d’un système de logs sécurisé et centralisé.
- Normalisation des conventions de code et des structures de packages.

Documentation
- Finalisation des fichiers 02 → 10.
- Ajout de schémas d’architecture dans le dossier docs/assets/.
- Mise en place d’un guide de style Kotlin.

---

Objectifs à moyen terme (3–6 mois)

Évolution du moteur forensic
- Extension du module forensic-core/ avec de nouveaux artefacts (SQLite avancé, caches, journaux système).
- Amélioration du moteur de timeline pour une corrélation plus fine des événements.
- Ajout d’un système de signatures pour détecter les fichiers suspects.

Reporting avancé
- Génération de rapports PDF enrichis avec graphiques et sections dynamiques.
- Templates HTML interactifs pour les analyses forensic.
- Export JSON versionné pour intégration dans des outils externes.

Sandbox
- Simulation d’environnements compromis (root, hooking, debug).
- Tests automatisés pour valider les modules de sécurité.
- Intégration d’un mode “stress test” pour évaluer la robustesse.

---

Objectifs à long terme (6–12 mois)

Sécurité applicative avancée
- Implémentation d’un système complet de MFA (OTP, biométrie, challenge‑response).
- Détection comportementale (anomalies d’usage, patterns suspects).
- Protection runtime avancée (anti‑hooking renforcé, anti‑reverse engineering).

Forensic professionnel
- Extraction d’artefacts multi‑sources (applications tierces, logs système étendus).
- Analyse heuristique des fichiers et métadonnées.
- Intégration d’un moteur de corrélation multi‑modules.

Écosystème complet
- API interne documentée pour permettre l’ajout de plugins.
- Intégration CI/CD avec tests automatisés de sécurité.
- Préparation d’une version open‑source ou entreprise selon la direction du projet.

---

Vision stratégique (12 mois et plus)

Plateforme unifiée
Security‑APK peut évoluer vers une suite complète regroupant :
- un moteur de sécurité Android,
- un framework forensic modulaire,
- un système de reporting professionnel,
- un environnement sandbox avancé.

Objectifs de maturité
- Standardisation des formats forensic.
- Compatibilité avec des outils externes (SIEM, SOC, plateformes forensic).
- Certification interne de sécurité (OWASP MAS, tests de pénétration).

Ouverture et collaboration
- Documentation complète pour les contributeurs externes.
- Roadmap publique versionnée.
- Modules optionnels premium ou spécialisés.

---

Dépendances et risques

Dépendances techniques
- Compatibilité Android 10 → 14.
- Maintien des bibliothèques de sécurité (Keystore, biométrie).
- Suivi des évolutions Jetpack.

Risques identifiés
- Complexité croissante du moteur forensic.
- Maintenance des services persistants selon les restrictions Android.
- Évolution rapide des techniques de tampering et de hooking.

---

Suivi et gouvernance
- Mise à jour trimestrielle de la roadmap.
- Revue mensuelle des modules critiques (security-engine, forensic-core).
- Système de tickets priorisés (P0 → P3).
- Documentation versionnée dans /docs.

---
