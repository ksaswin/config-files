# MY CUSTOM ALIASES

# NOTE:
# Make sure the arch_aliases file runs before this one


# NOTE: Update this path
gitPath="$HOME/"


# For work purposes, my git PATs are stored in
# the $gitPath 
# in the following format:
# personal<sep>the_PAT_is_pasted_here<sep>
# work<sep>the_PAT_is_pasted_here<sep>
function getmypat {
  awk -F "<sep>" '/^personal/ { print $2 }' "$gitPath"  | pbcopy
}


# Usually, while creating a new directory,
# you will also need to move into that directory
# after creating it.
# function take {
#   mkdir -p $1
#   cd $1
# }
# COMMENTING IT OUT, SINCE IT'S ALREADY
# AVAILABLE WITH OHMYZSH


# Changing the git remote url involves a
# few steps. Copying the PAT, the old url
# and then updating the PAT in the url.
# Use chrmt <remote> to make it easier.
function chrmt {
  USAGE_MESSAGE="usage:   chrmt [remote]\n\t remote - optional argument (defaults to origin)"
  SUCCESS_MESSAGE="remote-url update status: DONE"

  REMOTE=$1

  old_url=$(git remote get-url origin)
  repo_addr=$(echo "$old_url" | awk -F "github.com" '{ print $2 }')

  user_name='ksaswin'

  pat=$(getmypat && pbpaste | xargs)

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
  USAGE_MESSAGE="usage:   gc repo_url\n\t repo_url - Github repository url"

  git_url=$1

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

  user_name='ksaswin'

  pat=$(getmypat && pbpaste | xargs)

  clone_url="https://$user_name:$pat@github.com$repo_addr"

  git clone $clone_url

  cd $repo_name
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

# Advanced configurations for fzf
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customizations of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command
# You should make sure to pass the rest of the arguments to fzf
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$' {}" "$@" ;;
    ssh)          fzf --preview 'dig {}' "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

source ~/fzf-git.sh/fzf-git.sh


# Using rsync for prettier & verbose copying experience
alias cpv='rsync -avh --progress'

