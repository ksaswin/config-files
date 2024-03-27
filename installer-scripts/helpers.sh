#!/usr/bin/env bash


notify_installation() {
  app=$1

  echo "Installing $app..."
}


run_installation () {
  installer=$1
  app_name=$2
  app_display_name=$3

  notify_installation "$app_display_name"
  $installer search $app_name # FIXME: Only performing search
  # $installer install $app_name
}


# This function can be accessed from other scripts
# If the application is a cask, the `app_name` expects value as "--cask app_name"
install () {
  installer=$1
  app_name=$2
  app_display_name=$3
  is_conditional_install=$4


  if test $is_conditional_install ; then
    read -p "Would you like to download $app_display_name? (y/n) " -n 1;
    echo "";

    if [[ $REPLY =~ ^[Yy]$ ]]; then
      run_installation "$installer" "$app_name" "$app_display_name"
    fi
  else
    run_installation "$installer" "$app_name" "$app_display_name"
  fi


  echo ""
}
