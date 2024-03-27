#!/usr/bin/env bash

source ./helpers.sh
source ./logs.sh


# Saving HOME path, since wildcard characters (~) does not resolve in conditions
HOME=$(echo $HOME)

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


# Installing CLI and TUI tools

# Azure-CLI
install $BREW "azure-cli" "Azure-CLI"

# Btop (Resource monitoring TUI)
install $BREW "btop" "Btop"

# Fuzzy Finder
install $BREW "fzf" "Fuzzy Finder"

# Git
install $BREW "git" "Git"

# go
install $BREW "go" "Go Lang" true

# Json Query Tool 
install $BREW "jq" "Json Query Tool (jq)"

# Json Query Tool (TUI) 
install $BREW "jqp" "Json Query Tool (TUI) -> jqp"

# k9s
install $BREW "k9s" "K9S"

# kubelogin
install $BREW "Azure/kubelogin/kubelogin" "Kubelogin"

# Kustomize
install $BREW "kustomize" "Kustomize"

# lolcat
install $BREW "lolcat" "lolcat (colorize stdout with random gradients)" true

# neovim
install $BREW "neovim" "Neovim"

# Node Version Manager (nvm)
install $BREW "nvm" "Node Version Manager (nvm)"
mkdir ~/.nvm
echo "export NVM_DIR=~/.nvm\nsource \$(brew --prefix nvm)/nvm.sh" >> .zshrc

# Pipenv
install $BREW "pipenv" "Pipenv" true

# Postgresql
install $BREW "postgresql" "Postgresql"

# ripgrep
install $BREW "ripgrep" "ripgrep"

# tldr
install $BREW "tldr" "TLDR"

# tmux
install $BREW "tmux" "TMUX"

# trash
install $BREW "trash" "trash (safer-replacement for rm)"

# Tree-sitter
install $BREW "tree-sitter" "Tree-sitter"

# Hashicorp Vault CLI
$BREW tap hashicorp/tap
install $BREW "hashicorp/tap/vault" "Hashicorp Vault CLI"

