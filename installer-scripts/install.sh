#!/usr/bin/env bash

source ./logs.sh


unameOut="$(uname -s)"

case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine="UNKNOWN"
esac

if [[ "${machine}" == "UNKNOWN" ]]; then
  echo "No installers configured for your OS: ${unameOut}"
  exit
fi

log "
  OS Detected: ${unameOut}
  Using the ${machine} installer...
"


# Ask for administrator password upfront
# sudo -v  # FIXME: Disabled sudo privilege request


echo "Initializing Development Workspace [×]"


if test $(which git); then
  log "Downloading dot-files to ~/dotfiles"
  # git clone https://github.com/ksaswin/config-files.git ~/dotfiles  # FIXME: Disabled dotfiles installation
fi


if [[ "${machine}" == "Linux" ]]; then
  /usr/bin/env bash ./linux-installer.sh
elif [[ "${machine}" == "Mac" ]]; then
  /usr/bin/env bash ./mac-installer.sh
fi


echo "Development Workspace Ready [✔]"

