06_reports.md — Génération de rapports

Rôle du module
Le module reports/ génère des rapports professionnels à partir des artefacts produits par forensic-core.

---

Structure interne

pdf/
- Génération PDF.
- Templates statiques ou dynamiques.

json/
- Exports structurés.
- Intégration API.

html/
- Rapports interactifs.
- Templates responsives.

templates/
- Thèmes.
- Styles.
- Layouts.

---

Flux de génération
`
forensic-core → artifacts.json → ReportGenerator → PDF/HTML/JSON
`

---
