#!/usr/bin/env bash

source ./logs.sh
source ./helpers.sh

# NOTE: Currently testing on Ubuntu
PACKAGE_MANAGER=""

declare -A osInfo;
osInfo[/etc/redhat-release]=yum
osInfo[/etc/arch-release]=pacman
osInfo[/etc/gentoo-release]=emerge
osInfo[/etc/SuSE-release]=zypp
osInfo[/etc/debian_version]=apt-get
osInfo[/etc/alpine-release]=apk

for f in ${!osInfo[@]}
do
  if [[ -f $f ]];then
    PACKAGE_MANAGER=${osInfo[$f]}
  fi
done

if [[ $PACKAGE_MANAGER == "" ]]; then
  log "Could not find any package managers for the distro."
  exit
fi


# Saving HOME path, since wildcard characters (~) does not resolve in conditions
HOME=$(echo $HOME)

# oh_my_zsh $HOME # FIXME: Uncomment when ready

#     __________________________________________________________________________
#    /                                                                         /
#   /                     Installing CLI and TUI tools                        / 
#  /_________________________________________________________________________/

# Btop (Resource monitoring TUI)
install $PACKAGE_MANAGER "btop -y" "Btop"

# Fuzzy Finder
install $PACKAGE_MANAGER "fzf -y" "Fuzzy Finder"

# Git
install $PACKAGE_MANAGER "git -y" "Git"

# Json Query Tool 
install $PACKAGE_MANAGER "jq -y" "Json Query Tool (jq)"

# k9s
if [[ $PACKAGE_MANAGER == "pacman" ]]; then
  install $PACKAGE_MANAGER "k9s -y" "K9S"
fi

# lolcat
install $PACKAGE_MANAGER "lolcat -y" "lolcat (colorize stdout with random gradients)" true

# neovim
install $PACKAGE_MANAGER "neovim -y" "Neovim" # FIXME: apt gives you an older release!

# ripgrep
install $PACKAGE_MANAGER "ripgrep -y" "ripgrep"

# tldr
install $PACKAGE_MANAGER "tldr -y" "TLDR"

# tmux
install $PACKAGE_MANAGER "tmux -y" "TMUX"


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
