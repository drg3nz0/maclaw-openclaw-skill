# 🚀 Publier sur npm - 3 commandes

## ✅ Votre package est prêt !

**Nom :** `openclaw-macos-security`
**Version :** 1.0.0
**Statut :** Tous les tests passés ✓

---

## 📦 Étape 1 : Login npm (une seule fois)

```bash
npm login
```

Entrez :
- Username (votre compte npmjs.com)
- Password
- Email

---

## 🚀 Étape 2 : Publier

```bash
cd /Users/t4/Documents/GitHub/maclaw/openclaw-skill
npm publish
```

**Note :** Plus besoin de `--access public` car ce n'est pas un package scopé (@)

---

## ✅ Étape 3 : Vérifier

```bash
# Ouvrir la page npm
open https://www.npmjs.com/package/openclaw-macos-security

# Tester l'installation
cd /tmp
npm install openclaw-macos-security
node -e "require('openclaw-macos-security').cameraStatus().then(console.log)"
```

---

## 📊 Résultat attendu

Après `npm publish`, vous verrez :
```
+ openclaw-macos-security@1.0.0
```

C'est tout ! 🎉

---

## 🌐 Après publication

### Pour les utilisateurs OpenClaw :

**Installation :**
```bash
npm install openclaw-macos-security
```

**Utilisation :**
```bash
openclaw chat
> /camera-status
✅ **CAMERA INACTIVE**
```

---

## 📧 Soumettre à OpenClaw (optionnel)

**Email à :** contact@openclawsearch.com

**Sujet :** New Skill - macOS Security Monitoring

**Message :**
```
Hi,

I've published a new macOS security skill:

Name: MaclawPro Security
Package: openclaw-macos-security
npm: https://www.npmjs.com/package/openclaw-macos-security
GitHub: https://github.com/drg3nz0/maclaw-openclaw-skill

Features:
• Camera/microphone monitoring
• Firewall status
• VPN checker
• WiFi security scanner
• Port scanner
• macOS-specific security tasks

Free tier with upgrade to MaclawPro Pro.

Thanks!
```

---

## 💬 Annoncer sur Discord (optionnel)

**Rejoindre :** https://discord.gg/openclaw

**Message :**
```
🛡️ New skill: openclaw-macos-security

macOS security monitoring with 7+ commands:
/camera-status, /firewall-status, /vpn-checker, and more

Install: npm install openclaw-macos-security

📦 npm: https://www.npmjs.com/package/openclaw-macos-security
```

---

**C'est tout ! Bonne chance ! 🚀**
