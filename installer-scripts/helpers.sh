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


# Creates the directory in the provided path if it does not exist
# Note that the $path is always provided as a relative path
# without any wildcard characters
create_dir () {
  path=$1


  if [ ! -d "$path" ]; then
    mkdir "$path"
  fi
}


# Clone a repo from Github
# Note that the $clone_path is always provided as a
# relative path without any wildcard characters
clone_repo_to_dir () {
  app=$1
  repo_url=$2
  clone_path=$3


  if test $(which git); then
    notify_installation "$app"
    git clone "$repo_url" "$clone_path"
  else
    echo "Git installation might have failed.\nCould not install $app"
  fi
}


# Install and setup OhMyZsh
oh_my_zsh () {
  home=$1


  zshrc_filepath="$home/.zshrc"
  echo "Backing up the ~/.zshrc file to ~/.zshrc.bk"
  cp "$zshrc_filepath" "$zshrc_filepath.bk"

  notify_installation "OhMyZsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  zsh_custom="$home/.oh-my-zsh/custom"
  clone_repo_to_dir "PowerLevel10k" "https://github.com/romkatv/powerlevel10k.git" "$zsh_custom/themes/powerlevel10k"
  echo "Updating the ZSH_THEME in .zshrc to use powerlevel10k"
  # sed command with -i and -e flags works on Mac
  # Intended purpose: Find and replace ZSH_THEME value and write changes to .zshrc
  sed -i -e 's/^ZSH_THEME=".*"/ZSH_THEME="powerlevel10k/powerlevel10k"/' "$zshrc_filepath"

  clone_repo_to_dir "Fish-like Auto-Suggestions" "https://github.com/zsh-users/zsh-autosuggestions" "$zsh_custom/plugins/zsh-autosuggestions"
  # sed command with -i and -e flags works on Mac
  # Intended purpose: Find and replace plugins value and write changes to .zshrc
  echo "Updating the plugins in .zshrc to use zsh-autosuggestions"
  sed -i -e 's/^plugins=\(.*\)/plugins=(zsh-autosuggestions)/' "$zshrc_filepath"

  echo "Creating aliases"
  touch "$zsh_custom/aliases.zsh"
  echo "# MY CUSTOM ALIASES

# Usually, while creating a new directory,
# you will also need to move into that directory
# after creating it.
function take {
  mkdir -p $1
  cd $1
}


# JQP config
alias jqp="jqp --config ~/.config/jqp/config.yaml"


# My most used commands for fuzzy finder
# fzf to checkout to a new branch in a git repository
alias gct='git checkout $(git branch | fzf)'
# Find a directory within Development directory using `fzf`
alias cd-dev='cd $(find Development -type d | fzf)'
# Open a file using Nvim within the current directory using `fzf`
alias edit='nvim $(find . -not \( -path ./.venv -prune \) -not \( -path ./venv -prune \) -not \( -path ./.git -prune \) -not \( -path ./node_modules -prune \) -type file | fzf)'


# Using rsync for prettier & verbose copying experience
alias cpv='rsync -avh --progress'
" > $zsh_custom/aliases.zsh
}
