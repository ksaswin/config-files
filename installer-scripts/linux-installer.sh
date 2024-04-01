#!/usr/bin/env bash

source ./logs.sh
source ./helpers.sh

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
