#!/usr/bin/env bash

source ./logs.sh


uname_out="$(uname -s)"

case "${uname_out}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine="UNKNOWN"
esac

if [[ "${machine}" == "UNKNOWN" ]]; then
  echo "No installers configured for your OS: ${uname_out}"
  exit
fi

log "
  OS Detected: ${uname_out}
  Using the ${machine} installer...
"


read -p "Proceed with installation? (y/n) " -n 1;
echo "";
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "\nTerminating process"
  exit 1
fi


# Ask for administrator password upfront
# sudo -v  # FIXME: Disabled sudo privilege request


echo "Initializing Development Workspace [×]"
echo ""


if [[ "${machine}" == "Linux" ]]; then
  /usr/bin/env bash ./linux-installer.sh
elif [[ "${machine}" == "Mac" ]]; then
  /usr/bin/env bash ./mac-installer.sh
fi


if test $(which git); then
  log "Downloading dot-files to ~/dotfiles"
  # git clone https://github.com/ksaswin/config-files.git ~/dotfiles  # FIXME: Disabled dotfiles installation

  if [ -d ~/.config/tmux ]; then
    echo "Existing tmux configuration found. Backing up config and replacing."
    mv ~/.config/tmux ~/.config/tmux.bk
  fi
  cp -r ~/dotfiles/tmux ~/.config

  if [ -d ~/.config/nvim/lua/custom ]; then
    echo "Existing nvim configuration found. Backing up config and replacing."
    mv ~/.config/nvim/lua/custom ~/.config/nvim/lua/custom.bk
  fi
  cp -r ~/dotfiles/nvim/custom ~/.config/nvim/lua/custom

  if [ -d ~/.config/jqp ]; then
    echo "Existing jqp configuration found. Backing up config and replacing."
    mv ~/.config/jqp ~/.config/jqp.bk
  fi
  cp -r ~/dotfiles/jqp ~/.config/

fi


echo ""
echo "Development Workspace Ready [✔]"

exit 0
