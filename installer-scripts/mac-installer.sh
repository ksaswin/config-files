#!/usr/bin/env bash

source ./logs.sh


# Check if Homebrew has already been installed
# Install if we don't have it
if test ! $(which brew); then
  log "Installing Homebrew..."
  /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi



