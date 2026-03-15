# 🌑 dotfiles

**Config & Wallpapers for DankMaterialShell + Niri + Ghostty**

Designed for the Ubuntu 25.10 ➔ 26.04 migration.

---

## 🚀 Quick Setup (Ubuntu 26.04)

### 1. Install Core Components
Ensure **Niri**, **Ghostty**, and **DankMaterialShell** are installed via their official methods/PPAs before restoring configs.
```bash
sudo apt update && sudo apt install niri git gcc -y
```

### 2. Deploy Configs
Clone this repository and move the folders to your home directory.
```bash
git clone https://github.com ~/dotfiles
cd ~/dotfiles

# Sync configurations
cp -r DankMaterialShell ghostty niri ~/.config/

# Sync Wallpapers (Ensures DMS slideshow finds the files)
mkdir -p ~/Pictures
cp -r Wallpapers ~/Pictures/
```

### 🛠 Components

| Component | Role |
| ------- | -- |
| DankMaterialShell	| UI, Panels, & Wallpaper Slideshow |
Niri |	Tiling Scroll Compositor
Ghostty	| GPU-accelerated Terminal
Wallpapers	| Custom curated assets for DMS Carousel



