---

03_security_engine.md — Moteur de sécurité

Rôle du module
Le module security-engine/ centralise toutes les fonctionnalités de sécurité : cryptographie, détection d’intégrité, sécurité réseau, stockage sécurisé et authentification.

---

Structure interne

crypto/
- Chiffrement AES/GCM.
- Hashing SHA‑256 / SHA‑512.
- Signatures numériques.
- Gestion du Keystore Android.

detection/
- Détection root.
- Détection debug.
- Détection hooking (Frida, Xposed).
- Détection tampering (signature, checksum).

network/
- TLS Pinning.
- Validation des certificats.
- Sécurisation des requêtes.

storage/
- EncryptedSharedPreferences.
- SecureStorage abstrait.
- Protection des données sensibles.

auth/
- Authentification biométrique.
- MFA (OTP, challenge‑response).
- Sessions sécurisées.

---

API exposée
- SecurityEngine.init(context)
- SecurityEngine.isDeviceCompromised()
- SecurityEngine.encrypt(data)
- SecurityEngine.authenticateUser()

---

Bonnes pratiques
- Aucun accès direct depuis la UI.
- Utilisation via interfaces injectées.
- Logs minimaux pour éviter les fuites.

---
