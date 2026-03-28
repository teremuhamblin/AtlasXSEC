---

📘 16forensicguide.md — Guide Forensic AtlasXSEC

Introduction
Le module forensic-core d’AtlasXSEC fournit l’infrastructure d’analyse, d’extraction et de corrélation d’artefacts numériques. Il est conçu pour fonctionner dans des environnements sensibles, avec un haut niveau d’intégrité et de traçabilité.

Objectifs du module forensic
- Extraire des artefacts depuis des sources internes ou externes.
- Analyser les fichiers, métadonnées et structures internes.
- Construire une timeline d’événements cohérente.
- Corréler les données pour identifier des patterns ou anomalies.
- Fournir des résultats exploitables par le module reports.

Architecture interne
Le module est organisé en sous-composants spécialisés :

- artifacts/ : extraction brute (fichiers, logs, données système).
- fileanalysis/ : analyse de contenu (PDF, images, APK, archives).
- metadata/ : extraction de métadonnées (EXIF, signatures, timestamps).
- timeline/ : construction d’une chronologie d’événements.
- ForensicCore.kt : point d’entrée du moteur forensic.

Flux forensic standard
1. Acquisition  
   - Extraction des artefacts depuis une source (device, dossier, sandbox).
   - Vérification d’intégrité (hash SHA-256).

2. Analyse  
   - Analyse structurelle (type MIME, entropie, signatures).
   - Analyse de contenu (texte, images, binaires).
   - Extraction des métadonnées.

3. Corrélation  
   - Regroupement par type, timestamp, source.
   - Détection d’anomalies (timestamps incohérents, fichiers suspects).

4. Timeline  
   - Construction d’une chronologie complète.
   - Détection d’événements critiques.

5. Rapport  
   - Export vers reports/ (PDF, JSON, HTML).

Bonnes pratiques forensic
- Ne jamais modifier les artefacts originaux.
- Toujours recalculer les hash avant et après analyse.
- Documenter chaque étape dans les logs.
- Utiliser la sandbox pour les fichiers suspects.
- Séparer acquisition et analyse pour éviter la contamination.

Points d’extension
- Ajout de nouveaux extracteurs (APK, SQLite, logs système).
- Analyse heuristique avancée.
- Moteur de règles forensic personnalisables.

---
