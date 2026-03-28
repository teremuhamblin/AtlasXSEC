---

04_security_services.md — Services Android

Rôle du module
Le module security-services/ fournit des services Android persistants permettant la surveillance continue de l’intégrité du système et la gestion des alertes.

---

Structure interne

monitoring/
- Surveillance du root.
- Détection de modifications système.
- Watchdog d’intégrité.

background/
- Services persistants.
- Vérifications périodiques.
- Tâches planifiées (WorkManager).

alerts/
- Notifications de sécurité.
- Alertes internes.
- Intégration avec l’app.

---

Flux typique
1. Le service démarre en arrière‑plan.
2. Il surveille l’intégrité du système.
3. En cas d’anomalie, il déclenche une alerte.
4. L’app reçoit l’événement et agit (UI, logs, forensic).

---
