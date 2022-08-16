## My tmux setup

### Setup file path

The config files are stored in the following path: `~/.config/tmux/tmux.conf`

### Prefix

`C-b` is the default prefix.

I have set it up to be `C-Space`

#### Commands

- ##### Managing tmux sessions
  - `tmux`: Starts a new tmux server
  - `tmux new -s sessionName`: Starts a new session with the specified name
  - `tmux a -t targetName`: Attach to the session specified in the target
  - `tmux kill-session -t targetName`: Kills the session specified in the target
  - `tmux ls`: Display the list of sessions

- ##### Sharing sessions between terminals
  - `tmux at -t sessionName`: Attach to existing session (allowing shared sessions)

- `tmux kill-server`: Kills the running tmux server

### Key bindings

#### General
- `Prefix r`: Reloads source file
- `Prefix o`: Opens current path in your file manager
- `Prefix e`: Kill all panes

#### Pane switching (vim-like)
- `Prefix k`: Move UP
- `Prefix j`: Move DOWN
- `Prefix h`: Move LEFT
- `Prefix l`: Move RIGHT

#### Resizing pane
- `Prefix C-k`: Resize UP
- `Prefix C-j`: Resize DOWN
- `Prefix C-h`: Resize LEFT
- `Prefix C-l`: Resize RIGHT
<details>
  <summary>Note</summary>
  Resize set to 5 units.
</details>

#### Moving between windows
- `C-S-Left`: Move to the previous window
- `C-S-Right`: Move to the next window
<details>
  <summary>Note</summary>
  You don't need to use the `Prefix` with the above key binds.
</details>

#### Defaults

- ##### Panes
  - `Prefix %`: Split pane vertically
  - `Prefix "`: Split pane horizontally
  - `Prefix q`: Display pane numbers
  - `Prefix z`: Zoom to active pane (Use the same to zoom out)

- ##### Sessions
  - `Prefix s`: Choose from a list of sessions
  - `Prefix $`: Rename session
  - `Prefix d`: Detach from a session

- ##### Windows
  - `Prefix c`: Create a new window
  - `Prefix ,`: Rename current window
  - `Prefix n`: Move to next window
  - `Prefix p`: Move to previous window
  - `Prefix w`: Choose from a list of windows

- ##### Extras
  - `Prefix ?`: List all keybindings
  - `Prefix :`: Type commands like in vim
  - `Prefix t`: Display time

