#!/bin/bash

# --- CONFIGURATION ---
REPO_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

echo "🚀 Starting dotfiles sync..."

# 1. Enter the repo directory
cd "$REPO_DIR" || { echo "❌ Directory $REPO_DIR not found!"; exit 1; }

# 2. Pull latest changes from GitHub first (safety check)
git pull origin main

# 3. Copy current system configs into the repo
echo "📂 Copying local configs..."
cp -r "$CONFIG_DIR/DankMaterialShell" .
cp -r "$CONFIG_DIR/ghostty" .
cp -r "$CONFIG_DIR/niri" .

# 4. Copy Wallpapers (Syncs your custom slideshow assets)
if [ -d "$WALLPAPER_DIR" ]; then
    echo "🖼️  Syncing wallpapers..."
    cp -r "$WALLPAPER_DIR" .
else
    echo "⚠️  Wallpaper directory not found at $WALLPAPER_DIR. Skipping."
fi

# 5. Push to GitHub
echo "📤 Pushing to GitHub..."
git add .
git commit -m "Update dotfiles: $(date +'%Y-%m-%d %H:%M')"
git push origin main

echo "✅ All done! Your Ubuntu 26.04 migration kit is ready."
