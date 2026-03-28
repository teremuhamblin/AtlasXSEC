---

02_app_module.md — Module App (Android)

Rôle du module
Le module app/ constitue l’application Android principale. Il regroupe l’interface utilisateur, la logique MVVM, la navigation, l’injection de dépendances et les interactions avec les modules de sécurité, forensic et reporting.

---

Structure interne

Dossiers principaux
- ui/ : écrans, fragments, composants UI Jetpack.
- viewmodel/ : logique MVVM, états, transformations.
- navigation/ : graphes de navigation Jetpack.
- di/ : configuration Hilt/Koin, injection des modules internes.
- utils/ : helpers génériques (extensions, formatters, validators).
- core/ : classes de base (BaseActivity, BaseFragment, BaseViewModel).
- res/ : layouts, drawables, strings, thèmes.
- assets/ : certificats, règles de sécurité, signatures.
- test/ : tests unitaires et instrumentés.

---

Flux MVVM

Vue (UI)
- Affiche l’état exposé par le ViewModel.
- Ne contient aucune logique métier.

ViewModel
- Transforme les données.
- Appelle les modules :  
  security-engine, security-services, forensic-core, reports.

Repository / UseCases
- Optionnel selon ton architecture.
- Encapsule les appels aux modules internes.

---

Interactions avec les autres modules
- security-engine : authentification, crypto, détection.
- security-services : démarrage/arrêt des services de monitoring.
- forensic-core : déclenchement d’analyses forensic.
- reports : génération de rapports depuis l’UI.

---

Bonnes pratiques
- Respect strict du MVVM.
- Navigation unidirectionnelle.
- Aucun accès direct aux modules depuis la UI.
- Injection via interfaces pour faciliter les tests.

---
