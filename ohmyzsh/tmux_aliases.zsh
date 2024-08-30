# TMUX ALIAS FUNCTION


# Expects you to have `gum` installed in your system

function _choose_tmux_session {
  sessions=$(tmux list-sessions -F "#S")

  chosen_session=$(\
    echo $sessions | \
    fzf --height=40% --layout=reverse --info=inline --border --margin=1 --padding=1 \
    --prompt 'Select a Tmux Session to attach ' \
    --preview 'tmux list-windows -F "#I: #W" -t {}'
  )

  echo $chosen_session
}

function tnew {
  session_prompt=$(gum style --bold --foreground 220 "Create new session: ")

  session_name=$(gum input --prompt $session_prompt --placeholder "Session name")

  if [[ -z "$session_name" ]]; then
    gum style --foreground 216 "Session name not selected"

    return 1
  fi

  tmux new-session -s $session_name
}

function tattach {
  session=$(_choose_tmux_session)

  if [[ -z $session ]]; then
    gum style --foreground 214 "Attaching to last-active session."
    tmux attach-session

    return 0
  fi

  tmux attach-session -t $session
}

function tkill {
  session=$(_choose_tmux_session)

  if [[ -z $session ]]; then
    gum style --foreground 203 "Did not choose a session."

    return 1
  fi

  gum style --foreground 218 "Killing Session: $session"
  tmux kill-session -t $session
}

function tls {
  raw_sessions=$(tmux list-sessions)
  sessions=$(tmux list-sessions -F "#S" | tr "\n" " ")

  table_data=""

  for session in ${(ps: :)sessions}; do
    window_count=$(tmux list-windows -t $session | wc -l | cut -b 8-)
    created_at=$(echo $raw_sessions | grep $session | sed 's/.*(created \(.*\))/\1/g')

    table_data="$table_data|$session,$window_count,$created_at"
  done

  echo $table_data | tr "|" "\n" | gum table -c "Session Name,Window Count, Created At" -s "," -p --border.foreground=222 --header.foreground=147 --cell.foreground=117
}

function tm {
  TMUX_ACTION_NEW_SESSION="new-session"
  TMUX_ACTION_ATTACH_SESSION="attach-session"
  TMUX_ACTION_KILL_SESSION="kill-session"
  TMUX_ACTION_LIST_SESSIONS="list-session"

  choice=$(gum choose --header "Select a tmux action" {$TMUX_ACTION_NEW_SESSION,$TMUX_ACTION_ATTACH_SESSION,$TMUX_ACTION_KILL_SESSION,$TMUX_ACTION_LIST_SESSIONS})

  if [[ -z $choice ]]; then
    gum style --foreground 216 "Did not choose an action"
    return 1
  elif [[ "$choice" == "$TMUX_ACTION_NEW_SESSION" ]]; then
    tnew
  elif [[ "$choice" == "$TMUX_ACTION_ATTACH_SESSION" ]]; then
    tattach
  elif [[ "$choice" == "$TMUX_ACTION_KILL_SESSION" ]]; then
    tkill
  elif [[ "$choice" == "$TMUX_ACTION_LIST_SESSIONS" ]]; then
    tls
  fi

  return 0
}

