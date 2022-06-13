![Neovim with nerd tree](https://raw.githubusercontent.com/ksaswin/config-files/master/nvim/screenshot/Neovim.png)
![Neovim with hover doc](https://raw.githubusercontent.com/ksaswin/config-files/master/nvim/screenshot/Neovim-hoverdoc.png)

## Config files
Warning: Don't blindly use my settings unless you know what that entails.
### Contents
- nvim (Neovim) config
  - Plugin manager used: [vim-plug](https://github.com/junegunn/vim-plug)

### NeoVim setup
- [vim-plug](https://github.com/junegunn/vim-plug): A minimalist vim plugin manager.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of configurations for Neovim's built-in LSP.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - [Treesitter](https://github.com/tree-sitter/tree-sitter) configurations and abstraction layer for Neovim.
- [lspsaga.nvim](https://github.com/tami5/lspsaga.nvim) - A light-weight LSP plugin based on Neovim built-in LSP with highly a performant UI.
- [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer) - An LSP server installer
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - A highly extendable fuzzy finder over lists
- [preservim/nerdtree](https://github.com/preservim/nerdtree) - A file system explorer.
- [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim) - Completion plugin.
- [vim-commentary](https://github.com/tpope/vim-commentary) - For single line and multi-line commenting.

### Plugin keybinds
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
