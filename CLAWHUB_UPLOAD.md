# 📦 Comment uploader sur ClawHub

## ✅ Fichiers créés

Votre skill est prêt ! Voici ce qui a été créé :

```
openclaw-skill/
├── SKILL.md           ✅ (obligatoire pour ClawHub)
├── README.md          ✅ (documentation)
├── package.json       ✅ (metadata npm)
├── dist/
│   ├── index.js       ✅ (code compilé)
│   └── index.d.ts     ✅ (TypeScript definitions)
└── src/
    └── index.ts       ✅ (code source)
```

---

## 🎯 Étapes pour uploader sur ClawHub

### 1. Créer un dossier pour l'upload

```bash
cd /Users/t4/Documents/GitHub/maclaw/openclaw-skill

# Créer dossier d'upload
mkdir -p clawhub-upload

# Copier les fichiers nécessaires
cp SKILL.md clawhub-upload/
cp README.md clawhub-upload/
cp package.json clawhub-upload/
cp -r dist clawhub-upload/
cp -r src clawhub-upload/
```

### 2. Uploader sur ClawHub

1. Allez sur la page que vous avez montrée
2. Cliquez sur **"Choose folder"**
3. Sélectionnez le dossier `clawhub-upload/`
4. Vérifiez que la validation passe (✅ SKILL.md is present)
5. Cliquez sur **"Publish skill"**

---

## 📋 Checklist avant publication

- [x] ✅ SKILL.md créé
- [x] ✅ README.md présent
- [x] ✅ package.json configuré
- [x] ✅ Code compilé (dist/)
- [x] ✅ Version correcte (1.0.1)
- [x] ✅ Tags configurés (latest)

---

## 🔧 Si erreurs de validation

**Erreur:** "SKILL.md is required"
→ Solution : Le fichier est maintenant créé ✓

**Erreur:** "Add at least one file"
→ Solution : Uploader le dossier `clawhub-upload/`

**Erreur:** "Version already exists"
→ Solution : Changer version dans package.json (ex: 1.0.2)

---

## 📊 Après publication

Une fois publié sur ClawHub, les utilisateurs peuvent :

```bash
# Chercher votre skill
npx clawhub search maclaw

# Installer
npx clawhub install openclaw-macos-security

# Voir dans OpenClaw
openclaw skills list
```

---

**Prêt à publier ! 🚀**
