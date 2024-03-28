#!/usr/bin/env bash


source ./helpers.sh


# Saving HOME path, since wildcard characters (~) does not resolve in conditions
HOME=$(echo $HOME)

# Check if Homebrew has already been installed
# Install if we don't have it
if test ! $(which brew); then
  notify_installation "Installing Homebrew..."
  /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

BREW=$(which brew)

# oh_my_zsh $HOME # FIXME: Uncomment when ready

echo "
export NVM_DIR="$HOME/.nvm"

# To load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# To load nvm bash completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
" >> ./textfile.zsh

#     __________________________________________________________________________
#    /                                                                         /
#   /                           Installing CASKS                              /
#  /_________________________________________________________________________/

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

# Visual Studio Code
install $BREW "--cask visual-studio-code" "Visual Studio Code"


#     __________________________________________________________________________
#    /                                                                         /
#   /                     Installing CLI and TUI tools                        / 
#  /_________________________________________________________________________/

# Azure-CLI
install $BREW "azure-cli" "Azure-CLI" true

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
create_dir "$HOME/.nvm"
# FIXME: Uncomment when ready
# echo "
# export NVM_DIR="$HOME/.nvm"
#
# # To load nvm
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# # To load nvm bash completion
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# " >> ~/.zshrc

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
install $BREW "hashicorp/tap/vault" "Hashicorp Vault CLI" true


#     __________________________________________________________________________
#    /                                                                         /
#   /                             Other tools                                 /
#  /_________________________________________________________________________/

# Make sure the ~/.config directory is available
# This is required to add customisations to tools
create_dir "$HOME/.config"


# NvChad
create_dir "$HOME/.config/nvim"
# clone_repo_to_dir "NvChad" "https://github.com/NvChad/starter" "$HOME/.config/nvim" # FIXME: Uncomment when ready

