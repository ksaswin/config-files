# K8S ALIAS FUNCTION


# Expects you to have `gum` installed in your system

function _k_list_ctx {
  config=$(kubectl config get-contexts --no-headers | sed 's/^ /!/' | awk '{ print $2,$3,$4,$5 }' | tr " " "," | tr "\n" " ")

  current_ctx=$(kubectl config current-context)

  table_data=""

  for conf in ${(ps: :)config}; do
    info=$(echo $conf)

    ctx=$(echo $conf | awk -F ',' '{print $1}')

    if [[ $ctx == $current_ctx ]]; then
      info="*,$info"
    else
      info=" ,$info"
    fi

    table_data="$table_data|$info"
  done

  echo $table_data | tr "|" "\n" | gum table -c "Current,Context,Cluster,Auth Info,Namespace" -s "," -p --border.foreground=222 --header.foreground=147 --cell.foreground=117

  return 0
}

function _k_switch_ctx {
  contexts=$(kubectl config get-contexts --no-headers | awk '{ print $2 }')

  chosen_ctx=$(\
    echo $contexts | \
    fzf --height=40% --layout=reverse --info=inline --border --margin=1 --padding=1 \
    --prompt 'Select a context to switch '
  )

  if [[ -z $chosen_ctx ]]; then
    gum style --foreground 216 "Did not choose an action"
    return 1
  fi

  kubectl config use-context $chosen_ctx

  return 0
}

# K8S context actions
function kctx {
  K8S_LIST_CTX="list-contexts"
  K8S_SWITCH_CTX="switch-context"

  choice=$(gum choose --header "Select a tmux action" {$K8S_LIST_CTX,$K8S_SWITCH_CTX})

  if [[ -z $choice ]]; then
    gum style --foreground 216 "Did not choose an action"
    return 1
  elif [[ "$choice" == "$K8S_LIST_CTX" ]]; then
    _k_list_ctx
  elif [[ "$choice" == "$K8S_SWITCH_CTX" ]]; then
    _k_switch_ctx
  fi

  return 0
}


# FIXME: Update the namespace here
NAMESPACE=""
# Aliasing kubectl commands
# BASIC COMMANDS
alias k="kubectl -n $NAMESPACE"
alias kl="kubectl -n $NAMESPACE logs"
# GET COMMANDS
alias kg="kubectl -n $NAMESPACE get"
alias kgns="kubectl -n $NAMESPACE get namespaces"
alias kga="kubectl -n $NAMESPACE get all"
alias kgd="kubectl -n $NAMESPACE get deployments"
alias kgp="kubectl -n $NAMESPACE get pods"
alias kgs="kubectl -n $NAMESPACE get services"
alias kgrs="kubectl -n $NAMESPACE get rs" # Replica Set
# CONFIG COMMANDS
alias kcgc='kubectl config get-contexts'
alias kcuc='kubectl config use-context'
