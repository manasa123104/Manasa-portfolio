# Deploy Portfolio to GitHub Pages

This guide will help you make your portfolio publicly accessible using GitHub Pages (free hosting).

## Step 1: Create a GitHub Repository

1. Go to [GitHub.com](https://github.com) and sign in
2. Click the **"+"** icon in the top right → **"New repository"**
3. Repository name: `portfolio` (or `manasa-portfolio`)
4. Description: "My Personal Portfolio"
5. Make it **Public** (required for free GitHub Pages)
6. **DO NOT** initialize with README, .gitignore, or license
7. Click **"Create repository"**

## Step 2: Initialize Git and Push Files

Open PowerShell in the portfolio folder (`D:\IntegrityX\portfolio`) and run:

```powershell
# Initialize git repository
git init

# Add all files
git add .

# Create first commit
git commit -m "Initial commit: Portfolio website"

# Add your GitHub repository (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/portfolio.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## Step 3: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **"Settings"** tab
3. Scroll down to **"Pages"** in the left sidebar
4. Under **"Source"**, select:
   - Branch: **main**
   - Folder: **/ (root)**
5. Click **"Save"**

## Step 4: Access Your Portfolio

After a few minutes, your portfolio will be live at:
- `https://YOUR_USERNAME.github.io/portfolio/`

## Alternative: Quick Deploy with Netlify

If you prefer Netlify (also free):

1. Go to [Netlify.com](https://www.netlify.com) and sign up
2. Drag and drop the `portfolio` folder onto Netlify
3. Your site will be live instantly with a random URL
4. You can customize the domain name in settings

## Files Included

Your portfolio includes:
- ✅ index.html (main page)
- ✅ education.html
- ✅ experience.html
- ✅ certifications.html
- ✅ styles.css
- ✅ script.js
- ✅ images/ folder

All files are ready to deploy!

