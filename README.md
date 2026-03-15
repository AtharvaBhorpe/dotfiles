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

## 🛠️ Automated Restoration (Ubuntu 26.04)

If you are on a fresh install of Ubuntu 26.04, you can restore your entire environment (Niri, Ghostty, and DMS configs with custom wallpapers) using the automated script. 
The script will automatically detect your new username and update all configuration paths to ensure the DMS wallpaper slideshow and Niri configs work out of the box.

### Option 1: The Quick Way
1. Ensure **Niri**, **Ghostty**, and **DankMaterialShell** are installed via their official methods/PPAs before restoring configs.
2. Run this command to download and execute the restoration script immediately:

```bash
curl -sSL https://raw.githubusercontent.com/AtharvaBhorpe/dotfiles/refs/heads/main/restore.sh | bash
```
> [!WARNING]
>>⚠️ Security Warning:
>>Do not run the command above if you feel the script is untrusted. Piping directly to bash can be risky. Instead, follow the manual inspection steps below.

### Option 2: Manual Inspection (Recommended)
1. Ensure **Niri**, **Ghostty**, and **DankMaterialShell** are installed via their official methods/PPAs before restoring configs.
2. Use these steps to download and review the code before running it:
Download the script:
```bash
curl -LO https://raw.githubusercontent.com/AtharvaBhorpe/dotfiles/refs/heads/main/restore.sh
```
3. Review the script
4. Make it executable and run:
```bash
chmod +x restore.sh
./restore.sh
```


