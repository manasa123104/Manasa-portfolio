# Setup GitHub Repository for Portfolio

Your portfolio is now in `D:\portfolio` and ready to be pushed to GitHub!

## Step 1: Create GitHub Repository

1. Go to [GitHub.com](https://github.com) and sign in
2. Click the **"+"** icon in the top right → **"New repository"**
3. Repository name: `portfolio` (or `manasa-portfolio`)
4. Description: "My Personal Portfolio - Manasa Rajagopal Madabushi"
5. Make it **Public** (required for free GitHub Pages)
6. **DO NOT** initialize with README, .gitignore, or license
7. Click **"Create repository"**

## Step 2: Connect and Push to GitHub

Open PowerShell in `D:\portfolio` and run:

```powershell
# Replace YOUR_USERNAME with your actual GitHub username
git remote add origin https://github.com/YOUR_USERNAME/portfolio.git

# Rename branch to main (if needed)
git branch -M main

# Push to GitHub
git push -u origin main
```

**Example:**
If your GitHub username is `manasa123104`, the command would be:
```powershell
git remote add origin https://github.com/manasa123104/portfolio.git
git branch -M main
git push -u origin main
```

## Step 3: Enable GitHub Pages

1. Go to your repository on GitHub: `https://github.com/YOUR_USERNAME/portfolio`
2. Click **"Settings"** tab
3. Scroll down to **"Pages"** in the left sidebar
4. Under **"Source"**, select:
   - Branch: **main**
   - Folder: **/ (root)**
5. Click **"Save"**

## Step 4: Access Your Live Portfolio

After a few minutes (2-5 minutes), your portfolio will be live at:
- **URL:** `https://YOUR_USERNAME.github.io/portfolio/`

For example, if your username is `manasa123104`:
- **URL:** `https://manasa123104.github.io/portfolio/`

## Updating Your Portfolio

After making changes to your portfolio:

```powershell
cd D:\portfolio
git add .
git commit -m "Update portfolio"
git push
```

Your changes will be live on GitHub Pages within a few minutes!

## Current Portfolio Location

Your portfolio is now located at:
- **Local Path:** `D:\portfolio`
- **GitHub Repository:** `https://github.com/YOUR_USERNAME/portfolio`
- **Live URL:** `https://YOUR_USERNAME.github.io/portfolio/`

## Files Included

✅ index.html (main page)
✅ education.html
✅ experience.html  
✅ certifications.html
✅ styles.css
✅ script.js
✅ images/ folder
✅ All documentation files

Everything is ready to go! 🚀

