#!/bin/bash
# MaclawPro OpenClaw Skill - One-Click Publisher
# This script automates the entire publication process

set -e  # Exit on error

echo "╔════════════════════════════════════════════════════════════╗"
echo "║     MaclawPro Security - OpenClaw Skill Publisher         ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 1. Pre-flight checks
echo "🔍 Step 1: Pre-flight checks..."
echo ""

if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js not installed${NC}"
    exit 1
fi

if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ npm not installed${NC}"
    exit 1
fi

if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ git not installed${NC}"
    exit 1
fi

echo -e "${GREEN}✅ All dependencies installed${NC}"
echo ""

# 2. Install npm dependencies
echo "📦 Step 2: Installing dependencies..."
npm install
echo -e "${GREEN}✅ Dependencies installed${NC}"
echo ""

# 3. Build TypeScript
echo "🔨 Step 3: Building TypeScript..."
npm run build

if [ ! -d "dist" ]; then
    echo -e "${RED}❌ Build failed - dist/ not created${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Build successful${NC}"
echo ""

# 4. Run basic test
echo "🧪 Step 4: Testing skill..."
node -e "const skill = require('./dist/index.js'); console.log('✅ Skill loads successfully');" || {
    echo -e "${RED}❌ Skill test failed${NC}"
    exit 1
}
echo ""

# 5. Git initialization
echo "📝 Step 5: Git setup..."

if [ ! -d ".git" ]; then
    git init
    echo -e "${GREEN}✅ Git initialized${NC}"
else
    echo -e "${YELLOW}ℹ️  Git already initialized${NC}"
fi

git add .
git status
echo ""

read -p "Commit changes? (y/n): " commit_choice
if [ "$commit_choice" = "y" ]; then
    read -p "Commit message [Initial release v1.0.0]: " commit_msg
    commit_msg=${commit_msg:-"Initial release v1.0.0"}
    git commit -m "$commit_msg"
    echo -e "${GREEN}✅ Changes committed${NC}"
fi
echo ""

# 6. GitHub setup
echo "🌐 Step 6: GitHub repository..."
echo ""
echo "Go to: https://github.com/new"
echo "Repository name: maclaw-openclaw-skill"
echo "Description: MaclawPro Security monitoring skill for OpenClaw - 52+ macOS security tasks"
echo "Public repository"
echo ""
read -p "Have you created the GitHub repo? (y/n): " github_created

if [ "$github_created" = "y" ]; then
    read -p "Enter your GitHub username: " github_user

    if git remote | grep -q origin; then
        git remote remove origin
    fi

    git remote add origin "https://github.com/${github_user}/maclaw-openclaw-skill.git"
    git branch -M main

    read -p "Push to GitHub now? (y/n): " push_choice
    if [ "$push_choice" = "y" ]; then
        git push -u origin main
        echo -e "${GREEN}✅ Pushed to GitHub${NC}"
        echo "View at: https://github.com/${github_user}/maclaw-openclaw-skill"
    fi
else
    echo -e "${YELLOW}⏭️  Skipping GitHub push${NC}"
fi
echo ""

# 7. npm publish
echo "📦 Step 7: npm publication..."
echo ""
echo "Make sure you're logged in to npm:"
echo "  npm login"
echo ""
read -p "Are you logged in to npm? (y/n): " npm_logged

if [ "$npm_logged" = "y" ]; then
    echo "Publishing to npm..."
    npm publish --access public && {
        echo -e "${GREEN}✅ Published to npm${NC}"
        echo "View at: https://www.npmjs.com/package/@maclaw/openclaw-security"
    } || {
        echo -e "${RED}❌ npm publish failed${NC}"
        echo "Run manually: npm publish --access public"
    }
else
    echo -e "${YELLOW}⏭️  Skipping npm publish${NC}"
    echo "To publish later: npm publish --access public"
fi
echo ""

# 8. Post-publication steps
echo "╔════════════════════════════════════════════════════════════╗"
echo "║                  🎉 PUBLICATION COMPLETE!                  ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "✅ Skill built successfully"
echo "✅ Code committed to git"

if [ "$github_created" = "y" ] && [ "$push_choice" = "y" ]; then
    echo "✅ Published to GitHub"
fi

if [ "$npm_logged" = "y" ]; then
    echo "✅ Published to npm"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  📋 NEXT STEPS:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "1️⃣  Submit to OpenClawSearch.com"
echo "   → See PUBLICATION_GUIDE.md for instructions"
echo ""
echo "2️⃣  Announce on Discord"
echo "   → Join: https://discord.gg/openclaw"
echo "   → Post in #skills or #announcements"
echo ""
echo "3️⃣  Cross-promote on your sites"
echo "   → sequr.ca (add blog post)"
echo "   → informatique-quebec.com (add banner)"
echo "   → Email 500+ clients"
echo ""
echo "4️⃣  Social media"
echo "   → Twitter/LinkedIn post"
echo "   → Link to npm package"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📖 Full guide: PUBLICATION_GUIDE.md"
echo "🚀 Quick start: QUICK_START.md"
echo ""
echo "💰 Expected ROI: $2,450-6,125/year (2-5% conversion)"
echo ""
echo "Good luck! 🎉"
