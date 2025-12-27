# How to Add Your Profile Picture

## Step 1: Save Your Image

1. Copy your profile picture (the one you shared)
2. Save it to: `D:\IntegrityX\portfolio\images\profile.jpg`

   **OR** if you have it saved elsewhere:
   - Copy the image file
   - Paste it into: `D:\IntegrityX\portfolio\images\`
   - Rename it to: `profile.jpg`

## Step 2: Image Requirements

- **Format**: JPG, PNG, or WebP
- **Size**: At least 500x500 pixels (larger is better)
- **Shape**: Square or rectangular (will be automatically cropped to circle)
- **File name**: Must be exactly `profile.jpg`

## Step 3: Verify

1. Open `D:\IntegrityX\portfolio\index.html` in your browser
2. You should see your profile picture in the hero section
3. If you see a placeholder icon instead, check:
   - File is named `profile.jpg` (not `profile.JPG` or `Profile.jpg`)
   - File is in the `images` folder
   - File is a valid image format

## Alternative: Use a Different Image Name

If your image has a different name or format, you can:
1. Keep it in the `images` folder
2. Edit `index.html` line 77
3. Change `src="images/profile.jpg"` to match your file name

Example:
- If your file is `my-photo.png`, change to: `src="images/my-photo.png"`

---

**Current setup**: The portfolio is ready and will automatically display your picture once you save it to the correct location!

