#!/bin/bash

# ===============================================================
#  SpectreConky — Automatic Setup Script
#  Author: Chris Mon Saji
#  Website: chrizmonsaji.github.io
# ===============================================================

# ---------------------------------------------------------------
# 1. Branding & Intro
# ---------------------------------------------------------------
cat << "EOF"

 ____                  _             ____            _          
/ ___| _ __   ___  ___| |_ _ __ ___ / ___|___  _ __ | | ___   _ 
\___ \| '_ \ / _ \/ __| __| '__/ _ \ |   / _ \| '_ \| |/ / | | |
 ___) | |_) |  __/ (__| |_| | |  __/ |__| (_) | | | |   <| |_| |
|____/| .__/ \___|\___|\__|_|  \___|\____\___/|_| |_|_|\_\\__, |
      |_|                                                 |___/ 

        Minimalist Conky Widget — SpectreConky
EOF

echo ""
echo "Author   : Chris Mon Saji"
echo "Project  : SpectreConky — Automatic Setup"
echo "Website  : chrizmonsaji.github.io"
echo "---------------------------------------------------------------"
echo ""

read -p "Proceed with SpectreConky installation? [Y/n]: " choice
if [[ ! "$choice" =~ ^[Yy]$ ]]; then
    echo "Installation cancelled."
    exit 0
fi

# ---------------------------------------------------------------
# 2. Repository Setup & Directory Preparation
# ---------------------------------------------------------------
echo ""
echo "[1/4] Preparing SpectreConky directory..."

mkdir -p "$HOME/SpectreConky"
cd "$HOME/SpectreConky" || exit

echo "Directory created at: $HOME/SpectreConky"
echo "---------------------------------------------------------------"

# ---------------------------------------------------------------
# 3. Dependency & Package Verification
# ---------------------------------------------------------------
echo ""
echo "[2/4] Checking and installing dependencies..."

if ! command -v conky >/dev/null 2>&1; then
    echo "Conky not found — installing..."
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update && sudo apt-get install -y conky-all
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y conky
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -Sy --noconfirm conky
    else
        echo "Unsupported package manager. Please install Conky manually."
        exit 1
    fi
else
    echo "Conky already installed."
fi

# Check for Conky Manager 2
if [ ! -d "$HOME/.conky" ]; then
    echo "Conky Manager 2 directory not found — creating..."
    mkdir -p "$HOME/.conky"
fi

echo "Dependencies verified."
echo "---------------------------------------------------------------"

# ---------------------------------------------------------------
# 4. Configuration & Font Setup
# ---------------------------------------------------------------
echo ""
echo "[3/4] Copying configuration and font files..."

mkdir -p "$HOME/.conky/config"
mkdir -p "$HOME/.conky/fonts"
mkdir -p "$HOME/.local/share/fonts"

# Copy Conky configuration
cp -f "config/spectre.conf" "$HOME/.conky/spectre.conf"

# Copy fonts to both locations
cp -f "fonts/Researcher-Regular.ttf" "$HOME/.local/share/fonts/"
cp -f "fonts/Researcher-Regular.ttf" "$HOME/.conky/fonts/"

# Refresh font cache
fc-cache -fv >/dev/null

echo "Configuration and fonts installed successfully."
echo "---------------------------------------------------------------"

# ---------------------------------------------------------------
# 5. Autostart Configuration
# ---------------------------------------------------------------
echo ""
echo "[4/4] Configuring autostart..."

AUTOSTART_DIR="$HOME/.config/autostart"
mkdir -p "$AUTOSTART_DIR"

cat > "$AUTOSTART_DIR/spectreconky.desktop" <<EOL
[Desktop Entry]
Type=Application
Exec=conky -c $HOME/.conky/spectre.conf
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=SpectreConky
Comment=Start SpectreConky automatically at login
EOL

echo "Autostart entry created at: $AUTOSTART_DIR/spectreconky.desktop"
echo "---------------------------------------------------------------"

# ---------------------------------------------------------------
# 6. Completion Summary
# ---------------------------------------------------------------
echo ""
echo "✅ SpectreConky Installation Complete!"
echo "---------------------------------------------------------------"
echo "Files Installed:"
echo "  → Configuration : $HOME/.conky/spectre.conf"
echo "  → Font          : $HOME/.local/share/fonts/Researcher-Regular.ttf"
echo "  → Autostart     : $AUTOSTART_DIR/spectreconky.desktop"
echo ""
echo "Run manually with:"
echo "  conky -c ~/.conky/spectre.conf"
echo ""
echo "Enjoy your minimalist desktop widget!"
echo "---------------------------------------------------------------"
