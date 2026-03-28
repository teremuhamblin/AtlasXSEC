---

10_contributing.md — Contribution

Règles générales
- Respecter l’architecture modulaire.
- Documenter chaque ajout.
- Suivre les conventions de nommage.
- Ajouter des tests unitaires.
- Ne jamais casser la compatibilité entre modules.

---

Workflow Git
- main : stable.
- dev : développement.
- feature/* : nouvelles fonctionnalités.
- fix/* : corrections.

---

Style de code
- Kotlin idiomatique.
- MVVM strict dans app/.
- Clean Architecture dans les modules.
- Logs minimaux.
- Pas de données sensibles dans les logs.

---

Tests
- Tests unitaires obligatoires.
- Tests d’intégration pour forensic-core et security-engine.
- Tests sandbox pour validation.

---

Documentation
- Chaque module doit avoir son fichier dédié.
- Les schémas doivent être placés dans docs/assets/.
- Les exemples doivent être reproductibles.

---
