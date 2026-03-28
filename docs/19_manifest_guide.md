📘 19manifestguide.md — Guide du Manifeste Central AtlasXSEC

Rôle du manifeste
Le manifeste central est la source de vérité de l’écosystème AtlasXSEC. Il décrit l’ensemble des modules, leurs versions, leurs capacités, leurs dépendances et leurs compatibilités. Il permet à l’application principale de charger dynamiquement les modules et de garantir la cohérence globale.

Structure générale
Le manifeste est un fichier structuré (JSON, TOML ou Rust-like selon ton choix) contenant :

- modules : liste des modules déclarés  
- versioning : version interne de chaque module  
- capabilities : fonctionnalités exposées  
- dependencies : dépendances internes  
- compatibility : versions minimales requises  
- metadata : informations additionnelles (auteur, date, hash)

Exemple de structure
`json
{
  "modules": [
    {
      "id": "security-engine",
      "version": "1.4.0",
      "capabilities": ["crypto", "detection", "auth"],
      "dependencies": [],
      "minAppVersion": "1.0.0",
      "hash": "sha256:..."
    },
    {
      "id": "forensic-core",
      "version": "1.2.1",
      "capabilities": ["artifacts", "timeline", "metadata"],
      "dependencies": ["security-engine"],
      "minAppVersion": "1.0.0",
      "hash": "sha256:..."
    }
  ]
}
`

Cycle de vie du manifeste
- Déclaration : ajout d’un module ou d’une nouvelle version.  
- Validation : vérification cryptographique et compatibilité.  
- Chargement : lecture par app/ au démarrage.  
- Mise à jour : script automatisé pour incrémenter les versions.  

Bonnes pratiques
- Toujours signer le manifeste.  
- Toujours vérifier les hash des modules.  
- Ne jamais charger un module non déclaré.  
- Documenter chaque changement dans un changelog interne.

---
