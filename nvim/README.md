## My NVIM setup

### Setup file path

The config files are stored in `~/.config/nvim/`

### Basic keybindings

- #### Pane split
  - `C-w v`: Vertical split
  - `C-w s`: Horizontal split
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
  - `.`: Redo the previous command
  - `t<char>`: Cursor to the nearest specified character
  - `r<char>`: Replace the specified character
  - `gf`: Open file mentioned in the path (Path on the cursor)
  - `C-w o`: Close pop-up windows
  - `:set nonumber`: Remove the line number column
  - `:set signcolumn=no`: Remove the git diff sign column

### Plugin keybindings

- neoclide/coc.nvim:
  - `<Tab>` Choose the first suggestion.
- nvim-lspconfig
  - `gd` Jumps to the definition of symbol under the cursor.
- lspsaga.nvim
  - `<C-j>` Lspsaga diagnostic_jump_next
  - `K` Lspsaga hover_doc
  - `<C-k>` Lspsaga signature_help
  - `gh` Lspsaga lsp_finder
  - `gp` Lspsaga preview_definition
  - `gr` Lspsaga rename
- preservim/nerdtree
  - `<C-f>` NerdTree focus
  - `<C-n>` NerdTree
  - `<C-t>` NerdTree toggle
- telescope.nvim
  - `:f` find_files
  - `;r` live_grep
  - `\\` buffers
  - `;;` help_tags
- vim-commentary
  - `gcc` to comment the current line.
  - `gc` to comment multiple lines.

