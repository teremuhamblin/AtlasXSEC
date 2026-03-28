---

05_forensic_core.md — Cœur Forensic

Rôle du module
Le module forensic-core/ est responsable de l’extraction, l’analyse et la normalisation des artefacts forensic Android.

---

Structure interne

artifacts/
- Extraction de fichiers.
- Analyse de bases SQLite.
- Logs système.
- Données d’applications.

timeline/
- Reconstruction chronologique.
- Corrélation d’événements.

fileanalysis/
- Analyse de signatures.
- Hashing.
- Détection de modifications.

metadata/
- Normalisation des artefacts.
- Métadonnées enrichies.

---

Pipeline forensic
1. Extraction  
2. Analyse  
3. Normalisation  
4. Export JSON  
5. Transmission au module reports

---

Formats produits
- artifact_<type>.json
- timeline.json
- metadata.json

---
