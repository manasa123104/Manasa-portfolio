# Instructions to Commit Changes to GitHub

Since Git is not currently in your PATH, please follow these steps:

## Option 1: Using Git Bash (Recommended)
1. Open Git Bash (search for "Git Bash" in Start Menu)
2. Navigate to your repository:
   ```bash
   cd "D:/Manasa-portfolio-main/Manasa-portfolio-main"
   ```
3. Run these commands:
   ```bash
   # Initialize repository if not already initialized
   git init
   
   # Add remote if not exists
   git remote add origin https://github.com/manasa123104/Manasa-portfolio.git
   # OR if remote exists, update it:
   git remote set-url origin https://github.com/manasa123104/Manasa-portfolio.git
   
   # Stage the changed files
   git add index.html styles.css
   
   # Commit the changes
   git commit -m "Add Contact Me section with form and Let's Connect section"
   
   # Push to GitHub (first time use: git push -u origin main)
   git branch -M main
   git push -u origin main
   ```

## Option 2: Using GitHub Desktop
1. Open GitHub Desktop
2. File → Add Local Repository
3. Navigate to: `D:\Manasa-portfolio-main\Manasa-portfolio-main`
4. Review the changes (you should see index.html and styles.css)
5. Enter commit message: "Add Contact Me section with form and Let's Connect section"
6. Click "Commit to main"
7. Click "Push origin"

## Option 3: Add Git to PATH (One-time setup)
1. Find where Git is installed (usually: `C:\Program Files\Git\cmd\git.exe`)
2. Add it to your system PATH:
   - Search for "Environment Variables" in Windows
   - Edit System Environment Variables
   - Click "Environment Variables"
   - Under "System variables", find "Path" and click "Edit"
   - Add: `C:\Program Files\Git\cmd` (or wherever git.exe is located)
3. Restart PowerShell/terminal
4. Then run the commands from Option 1

## Files Changed:
- `index.html` - Added Contact section with form and "Let's Connect" section
- `styles.css` - Added styles for contact form and contact methods

