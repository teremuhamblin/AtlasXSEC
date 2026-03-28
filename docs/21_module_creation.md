---

📘 21modulecreation_guide.md — Guide de Création de Modules AtlasXSEC

Objectif du guide
Ce document décrit la procédure standardisée pour créer un nouveau module dans l’écosystème AtlasXSEC, en garantissant la cohérence, la sécurité et la maintenabilité.

Étapes de création

1. Définir le rôle du module
- Quel problème résout-il ?  
- Est-il un module de sécurité, forensic, service, ou utilitaire ?  
- Quelles capacités expose-t-il ?

2. Générer la structure du module
Arborescence recommandée :
`
new-module/
├── src/main/java/com/themaddogtmdg/<module>/
│   ├── core/
│   ├── api/
│   ├── internal/
│   └── ModuleEntry.kt
├── build.gradle
└── README.md
`

3. Définir l’API publique
- Interfaces uniquement  
- Pas d’implémentations exposées  
- Documentation obligatoire  

4. Implémenter les fonctionnalités internes
- Séparation stricte entre api/ et internal/  
- Logs structurés  
- Gestion d’erreurs via AtlasError  

5. Ajouter le module au manifeste
- ID unique  
- Version initiale  
- Dépendances  
- Hash cryptographique  

6. Tests
- Tests unitaires  
- Tests d’intégration (si nécessaire)  
- Tests sandbox pour les modules sensibles  

7. Documentation
- README du module  
- Notes de version  
- Diagrammes si nécessaire  

Bonnes pratiques
- Toujours isoler les implémentations.  
- Toujours documenter les API.  
- Toujours utiliser les conventions internes.  
- Toujours valider le module via les scripts d’intégrité.

---
