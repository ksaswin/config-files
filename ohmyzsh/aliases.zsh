# MY CUSTOM ALIASES

# NOTE:
# This aliases is mostly just for Mac
# It uses commands like pbcopy and pbpaste
# which are only available in Mac machines


# Some global variables
PERSONAL='personal'
WORK='work'
INVALID='invalid'


# NOTE: Update this path
gitPath="$HOME/"


# For work purposes, my git PATs are stored in
# the $gitPath 
# in the following format:
# personal<sep>the_PAT_is_pasted_here<sep>
# work<sep>the_PAT_is_pasted_here<sep>
function getworkpat {
  awk -F "<sep>" '/^work/ { print $2 }' "$gitPath" | pbcopy
}

function getmypat {
  awk -F "<sep>" '/^personal/ { print $2 }' "$gitPath"  | pbcopy
}


# Some reusable utility functions
# Returns PAT based on the PAT_TYPE
# or $INVALID if PAT_TYPE is invalid
function getpatfromtype {
  pat_type=$1

  if [[ "$pat_type" == "$PERSONAL" ]]; then
    echo $(getmypat && pbpaste | xargs)
    return
  elif [[ "$pat_type" == "$WORK" ]]; then
    echo $(getworkpat && pbpaste | xargs)
    return
  fi

  echo $INVALID
}
# Returns git username based on the PAT_TYPE
# or $INVALID if PAT_TYPE is invalid
function getgitunamefromtype {
  pat_type=$1

  if [[ "$pat_type" == "$PERSONAL" ]]; then
    echo 'ksaswin'
    return
  elif [[ "$pat_type" == "$WORK" ]]; then
    echo '' # FIXME: Update the username here
    return
  fi

  echo $INVALID
}


# Usually, while creating a new directory,
# you will also need to move into that directory
# after creating it.
function take {
  mkdir -p $1
  cd $1
}


# Changing the git remote url involves a
# few steps. Copying the PAT, the old url
# and then updating the PAT in the url.
# Use chrmt <pat_type> <remote> to make it easier.
function chrmt {
  USAGE_MESSAGE="usage:   chrmt pat_type [remote]\n\t pat_type - Available options: work/personal\n\t remote - optional argument (defaults to origin)\nStrictly adhere to the order of arguments!"
  SUCCESS_MESSAGE="remote-url update status: DONE"

  PAT_TYPE=$1
  REMOTE=$2

  old_url=$(git remote get-url origin)
  repo_addr=$(echo "$old_url" | awk -F "github.com" '{ print $2 }')

  user_name=$(getgitunamefromtype $PAT_TYPE)
  
  if [[ "$user_name" == "$INVALID" ]]; then
    echo "$USAGE_MESSAGE"
    return 1
  fi

  pat=$(getpatfromtype $PAT_TYPE)

  new_url="https://$user_name:$pat@github.com$repo_addr"
  
  if [[ $REMOTE == "" ]]; then
    git remote set-url origin $new_url
  else
    git remote set-url $REMOTE $new_url
  fi

  echo "$SUCCESS_MESSAGE"
}


# Cloning a repo from github with proper credentials
# and moving into that directory
function gc {
  USAGE_MESSAGE="usage:   gc repo_url\n\t repo_url - Github repository url\n\t pat_type - Available options: work/personal"

  git_url=$1
  pat_type=$2

  if [[ $git_url == "" ]]; then
    echo "Mandatory field not provied!"
    echo "$USAGE_MESSAGE"

    return 1
  fi

  repo_name=$(echo "$git_url" | awk -F "/" '{ print $5 }' | awk -F ".git" '{ print $1 }')

  repo_addr=$(echo "$git_url" | awk -F "github.com" '{ print $2 }')
  if [[ $repo_addr == "" ]]; then
    echo "Provided URL is not valid!"
    echo "$USAGE_MESSAGE"

    return 1
  fi

  user_name=$(getgitunamefromtype $pat_type)
  
  if [[ "$user_name" == "$INVALID" ]]; then
    echo "$USAGE_MESSAGE"

    return 1
  fi

  pat=$(getpatfromtype $pat_type)

  clone_url="https://$user_name:$pat@github.com$repo_addr"

  git clone $clone_url

  cd $repo_name

  if [[ "$pat_type" == "$PERSONAL" ]]; then
    git config --local user.name "K S Aswin"
    git config --local user.email "" # FIXME: Update the email here
  fi
}


# JQP config
alias jqp="jqp --config ~/.config/jqp/config.yaml"


# Upgrading to the exa command
# alias ls='exa --icons --color=always'
# alias ll='exa -l --icons --color=always'
# alias la='exa -la --icons --color=always'


# Setup fzf keybindings and fuzzy completion
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

# Bat
export BAT_THEME=tokyonight_moon


# Using rsync for prettier & verbose copying experience
alias cpv='rsync -avh --progress'


# FIXME: Update the namespace here
NAMESPACE=""
# Aliasing kubectl commands
# BASIC COMMANDS
alias k="kubectl -n $NAMESPACE"
alias kl="kubectl -n $NAMESPACE logs"
# GET COMMANDS
alias kg="kubectl -n $NAMESPACE get"
alias kgns="kubectl -n $NAMESPACE get namespaces"
alias kgp="kubectl -n $NAMESPACE get pods"
alias kgd="kubectl -n $NAMESPACE get deployments"
# CONFIG COMMANDS
alias kcgc='kubectl config get-contexts'
alias kcuc='kubectl config use-context'

