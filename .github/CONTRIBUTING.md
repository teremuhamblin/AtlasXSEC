CONTRIBUTING.md

Contribuer à AtlasXSEC

AtlasXSEC est un projet modulaire orienté sécurité, forensic et reporting Android. Les contributions sont les bienvenues tant qu’elles respectent l’architecture, les bonnes pratiques et les exigences de qualité du projet.

---

Principes généraux

La contribution repose sur trois engagements essentiels :

- maintenir la cohérence de l’architecture (modules indépendants, API claires, documentation à jour) ;
- respecter les standards de sécurité (pas de code risqué, pas de dépendances douteuses, pas de logs sensibles) ;
- garantir la qualité du code (tests, lisibilité, documentation).

---

Structure du projet à connaître

Le projet est organisé en modules spécialisés :

- app/ : application Android (UI, MVVM, navigation, DI)  
- security-engine/ : moteur de sécurité (crypto, détection, réseau, auth)  
- security-services/ : services persistants (monitoring, background, alertes)  
- forensic-core/ : extraction, analyse et normalisation des artefacts  
- reports/ : génération de rapports PDF/HTML/JSON  
- sandbox/ : environnement isolé pour tests et validation  
- docs/ : documentation versionnée (00 → 12)

Comprendre cette structure est indispensable avant toute contribution.

---

Workflow Git

Le projet suit un flux simple et robuste :

- main : version stable  
- dev : développement actif  
- feature/<nom> : nouvelle fonctionnalité  
- fix/<nom> : correction de bug  
- docs/<nom> : mise à jour documentaire  

Étapes pour contribuer

1. Fork du dépôt  
2. Création d’une branche dédiée  
3. Développement + tests  
4. Mise à jour de la documentation si nécessaire  
5. Pull Request vers dev  
6. Revue par les mainteneurs  

Les PR doivent être claires, motivées et accompagnées de tests.

---

Standards de code

Les contributions doivent respecter les conventions suivantes :

Kotlin & Android
- Kotlin idiomatique  
- Architecture MVVM dans app/  
- Clean Architecture dans les modules  
- Pas de logique métier dans la UI  
- DI obligatoire (Hilt/Koin)

Sécurité
- Aucun log contenant des données sensibles  
- Pas de dépendances non vérifiées  
- Pas de code obfusqué ou suspect  
- Respect strict des bonnes pratiques Android (Keystore, TLS, biométrie)

Style
- Nommage cohérent (camelCase, PascalCase, snake_case selon contexte)  
- Fichiers courts et lisibles  
- Commentaires uniquement pour clarifier, pas pour compenser un code confus  

---

Tests

Chaque contribution doit inclure des tests adaptés :

- Unit tests pour les modules Kotlin  
- Integration tests pour security-engine et forensic-core  
- Sandbox tests pour les scénarios critiques  
- UI tests si la modification touche l’application  

Les PR sans tests ne seront pas acceptées sauf cas exceptionnel.

---

Documentation

Toute fonctionnalité ajoutée ou modifiée doit être documentée :

- mise à jour du fichier correspondant dans docs/ (02 → 12)  
- ajout d’exemples si nécessaire  
- mise à jour du CHANGELOG.md  
- schémas dans docs/assets/ si pertinent  

Une contribution sans documentation est considérée incomplète.

---

Pull Requests

Une bonne PR doit contenir :

- un titre clair  
- une description précise  
- les motivations du changement  
- les impacts potentiels  
- les tests associés  
- les fichiers documentaires mis à jour  

Les mainteneurs peuvent demander des modifications avant fusion.

---

Sécurité et divulgation responsable

Les vulnérabilités doivent être signalées de manière privée à :  
security@atlasxsec.dev (adresse à personnaliser)

Aucune divulgation publique ne doit être faite avant correction.

---

Licence

En contribuant, vous acceptez que votre code soit publié sous la licence du projet et intégré dans AtlasXSEC.

---
