#!/bin/bash

# SpectreConky Setup Script
# Author: Chris Mon Saji
# Website: chrizmonsaji.github.io
# Email: chrizmonsaji@gmail.com

# ASCII Art
cat << "EOF"

 ____                  _             ____            _          
/ ___| _ __   ___  ___| |_ _ __ ___ / ___|___  _ __ | | ___   _ 
\___ \| '_ \ / _ \/ __| __| '__/ _ \ |   / _ \| '_ \| |/ / | | |
 ___) | |_) |  __/ (__| |_| | |  __/ |__| (_) | | | |   <| |_| |
|____/| .__/ \___|\___|\__|_|  \___|\____\___/|_| |_|_|\_\\__, |
      |_|                                                 |___/ 

        Minimalist Conky Widget — SpectreConky
EOF

echo -e "\nWelcome to SpectreConky Setup!"
echo "--------------------------------"

# Confirmation prompt
read -p "Do you want to proceed with installation? [y/N] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation cancelled."
    exit 1
fi

echo -e "\nInstalling dependencies...\n"

# Detect package manager and install dependencies
if command -v apt-get &> /dev/null; then
    # Add PPA for Conky Manager 2 on Ubuntu/Debian-based systems
    echo "Adding Conky Manager 2 PPA..."
    sudo add-apt-repository -y ppa:teejee2008/foss
    sudo apt update
    sudo apt install -y conky-all conky-manager2 fonts-font-awesome
elif command -v dnf &> /dev/null; then
    sudo dnf install -y conky conky-manager2 # Note: conky-manager2 might need to be built from source
elif command -v yum &> /dev/null; then
    sudo yum install -y conky conky-manager2 # Note: conky-manager2 might need to be built from source
elif command -v pacman &> /dev/null; then
    sudo pacman -S --noconfirm conky conky-manager2 # Note: conky-manager2 might be in AUR
else
    echo "⚠️ Unsupported OS. Please install Conky and Conky Manager 2 manually."
    echo "   Visit: https://github.com/zcot/conky-manager2"
    exit 1
fi

# Create Conky config directory
mkdir -p ~/.config/conky
# Copy the config file from the correct path in the repo
cp ./config/conky.conf ~/.config/conky/spectre.conf

# Install Researcher font (.ttf file)
mkdir -p ~/.fonts
# Copy the .ttf font file from the fonts directory
cp ./fonts/Researcher-Regular.ttf ~/.fonts/
fc-cache -fv

# Add to startup safely (only add if not already present)
if ! grep -q "conky -c ~/.config/conky/spectre.conf" ~/.xprofile 2>/dev/null; then
    echo "conky -c ~/.config/conky/spectre.conf &" >> ~/.xprofile
fi

echo -e "\n✅ Setup complete!"
echo "SpectreConky is now installed with Conky Manager 2."
echo "You can manage it from: Applications → Conky Manager 2"
echo "Or start manually with: conky -c ~/.config/conky/spectre.conf"
echo -e "\nCreated by Chris Mon Saji"
echo "Website: chrizmonsaji.github.io"
echo "Email: chrizmonsaji@gmail.com"