---

📘 15loggingstandard.md — Standard de logs

Format
- JSON structuré  
- Timestamp ISO 8601  
- Niveau : DEBUG, INFO, WARNING, SECURITY, FORENSIC  

Exemple
`json
{
  "timestamp": "2026-03-28T19:49:00Z",
  "module": "security-engine",
  "level": "SECURITY",
  "event": "root_detection",
  "details": { "method": "su_check" }
}
`

Emplacement
- /data/local/tmp/atlasxsec/logs/  
- Rotation automatique  

Intégration
- Tous les modules utilisent le même logger  
- Export possible vers reports/  

---
