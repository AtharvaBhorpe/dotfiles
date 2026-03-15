#!/bin/bash

# --- CONFIGURATION ---
GITHUB_REPO="https://github.com"
TEMP_DIR="$HOME/dotfiles_tmp"
OLD_USER="atharvab"
NEW_USER=$(whoami)

echo "🔄 Starting Ubuntu 26.04 Dotfiles Restoration..."

# 1. Clone the repository
if [ -d "$TEMP_DIR" ]; then rm -rf "$TEMP_DIR"; fi
echo "📥 Cloning repository..."
git clone "$GITHUB_REPO" "$TEMP_DIR" || { echo "❌ Clone failed!"; exit 1; }

cd "$TEMP_DIR"

# 2. Automatic Path Updating
echo "✍️  Updating config paths ($OLD_USER -> $NEW_USER)..."
# Searches for your old username in all files and replaces it with the new one
grep -rl "$OLD_USER" . | xargs sed -i "s/$OLD_USER/$NEW_USER/g"

# 3. Deploy Files
echo "📂 Deploying configurations..."
mkdir -p "$HOME/.config"
mkdir -p "$HOME/Pictures"

cp -r DankMaterialShell ghostty niri "$HOME/.config/"
cp -r Wallpapers "$HOME/Pictures/"

# 4. Verification Step
echo "🔍 Verifying installation..."
SUCCESS=true

# Check directories
for dir in "DankMaterialShell" "ghostty" "niri"; do
    if [ -d "$HOME/.config/$dir" ]; then
        echo "✅ $dir: Config folder found."
    else
        echo "❌ $dir: Config folder MISSING!"
        SUCCESS=false
    fi
done

# Check wallpaper path in DMS (assuming standard shell.json/config.json)
if grep -q "$NEW_USER" "$HOME/.config/DankMaterialShell/"* 2>/dev/null; then
    echo "✅ DMS: Username paths updated correctly."
else
    echo "⚠️  DMS: Could not verify username update in config files."
fi

# 5. Cleanup
rm -rf "$TEMP_DIR"

if [ "$SUCCESS" = true ]; then
    echo "🏁 Restoration complete! Please log out and back in to see changes."
else
    echo "⚠️  Restoration finished with errors. Check the logs above."
fi
