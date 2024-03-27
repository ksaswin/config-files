#!/usr/bin/env bash

source ./helpers.sh
source ./logs.sh


# Check if Homebrew has already been installed
# Install if we don't have it
if test ! $(which brew); then
  log "Installing Homebrew..."
  /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

BREW=$(which brew)


# Installing CASKS

# DuckDuckGo
install $BREW "--cask duckduckgo" "DuckDuckGo Browser"

# Figma
install $BREW "--cask figma" "Figma" true

# Firefox
install $BREW "--cask firefox" "Firefox Browser"

# Google Chrome
install $BREW "--cask google-chrome" "Google Chrome Browser"

# iTerm2
install $BREW "--cask iterm2" "iTerm2"

# Microsoft Azure-Storage Explorer
install $BREW "--cask microsoft-azure-storage-explorer" "Microsoft Azure-Storage Explorer" true

# Microsoft Remote Desktop
install $BREW "--cask microsoft-remote-desktop" "Microsoft Remote Desktop" true

# Numi Calculator
install $BREW "--cask numi" "Numi Calculator" true

# Obsidian (Main Note taking app)
install $BREW "--cask obsidian" "Obsidian"

# PgAdmin4
install $BREW "--cask pgadmin4" "PgAdmin4" true

# Postman
install $BREW "--cask postman" "Postman"

