## My NVIM setup

### Setup file path

The config files are to be stored in `~/.config/nvim/lua/custom`

### Basic keybindings

- #### Pane split
  - `C-w v`: Vertical split
  - `C-w s`: Horizontal split
  - `C-w q`: Kill the pane
  - `C-w h(j, k, l)`: Move between the split panes
  - `Space`: Cycle through all the panes

- #### Cursor movement
  - `0`: Move to start of line
  - `b`: Move to the start of a word (Move back)
  - `$`: Move to end of line
  - `w`: Move to the end of a word (Move forward)
  - `}`: Jump to next paragraph
  - `{`: Jump to previous paragraph
  - `zz`: Center the cursor on screen

- #### Line marker
  - `m<char>`: Set a marker for a line
  - `'<char>`: Move cursor to the marked line
  - `:delmarks <char>`: Delete the marker

- #### Tabs
  - `:tabnew filepath`: Open the file in a new tab
  - `:tabn`: Move to next tab
  - `:tabp`: Move to previous tab

- #### Editing
  - `cw`: Change the word
  - `dw`: Delete the word
  - `Y`: Copy to the end of the line
  - `dd`: Delete (cut) a line
  - `u`: Undo
  - `C-r`: Redo
  - `>>`: Add indent
  - `<<`: Remove indent

- #### Buffers
  - `:badd <filename>`: Add a new buffer
  - `:bn`: Move to the next buffer
  - `:bp`: Move to previous buffer
  - `:bdelete`: Delete the current buffer

- #### Extras
  - `~`: Swap the case of a letter
  - `VISUAL-MODE U`: Toggle to uppercase
  - `VISUAL-MODE u`: Toggle to lowercase
  - `C-a`: Increment digit
  - `.`: Redo the previous command
  - `t<char>`: Cursor to the nearest specified character
  - `r<char>`: Replace the specified character
  - `gf`: Open file mentioned in the path (Path on the cursor)
  - `C-w o`: Close pop-up windows
  - `:set nonumber`: Remove the line number column
  - `:set signcolumn=no`: Remove the git diff sign column

### Plugin keybindings
- `<leader>` here is the `<SPACE>` key.
- #### Switch between windows
  - `<C-h>`: Window left
  - `<C-l>`: Window right
  - `<C-j>`: Window down
  - `<C-k>`: Window up

- #### Buffers
  - `<TAB>`: Next buffer
  - `<S-TAB>`: Previous buffer
  - `<leader>x`: Close buffer

- #### Commenting
  - `<leader>/`: Toggle comment

- #### LSP
  - `gd`: Lsp definition
  - `K`: Lsp hover
  - `<leaser>lf`: Lsp signature help
  - `[d`: Goto previous
  - `d]`: Goto next
  - `<leader>fm`: Lsp formatting
  - `<leader>wl`: List workspace folders

- #### NVIM Tree
  - `<C-n>`: Nvim tree toggle
  - `<leader>e`: Nvim tree focus

- #### Telescope
  -  `<leader>ff`: Find files
  -  `<leader>fa`: Find all
  -  `<leader>cm`: Git commits
  -  `<leader>gt`: Git status
  -  `<leader>th`: Nvchad themes

- #### Blank line
  -  `<leader>cc`: Jump to current context

