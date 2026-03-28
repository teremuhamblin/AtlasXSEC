---

📘 13modulardesign.md — Architecture modulaire

Objectifs
- Séparer clairement les responsabilités  
- Permettre l’évolution indépendante des modules  
- Garantir la sécurité et l’intégrité du framework  
- Faciliter l’audit et la maintenance  

Principes
- Aucun module ne doit dépendre de app/.  
- Les modules communiquent via des interfaces exposées.  
- Le manifeste central décrit :  
  - versions  
  - compatibilités  
  - capacités  
  - points d’entrée  

Règles de dépendances
- security-engine ne dépend d’aucun autre module.  
- forensic-core peut dépendre de security-engine.  
- reports peut dépendre de forensic-core.  
- sandbox est isolé et ne dépend que de security-engine.  
- app/ dépend de tous les modules, jamais l’inverse.

Communication inter-modules
- Interfaces Kotlin  
- Services injectés via DI  
- Aucun accès direct aux implémentations internes  

Versioning interne
- Chaque module possède un numéro de version interne :  
  major.minor.patch  
- Le manifeste central valide les compatibilités.  

Avantages
- Scalabilité  
- Sécurité renforcée  
- Tests indépendants  
- Mise à jour modulaire  

---
