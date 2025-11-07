return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },


  -- Noice for Pretty Command mode
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("configs.noice")
    end
  },

  -- Highlight todo comments
  -- TODO: This is a todo comment
  -- FIXME: This is a fixme statement
  -- WARN: This is a warning
  -- HACK: Whatever this is!
  -- TEST: This is a test
  -- PERF: Performance / Optimisations
  -- NOTE: This is a note
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = false,  -- disable showing icons in the signs column
    },
  },

  -- Disabling default terminal plugin
  {
    "NvChad/nvterm",
    enabled = false
  },

  -- Using FTerm for floating terminal
  {
    "numToStr/FTerm.nvim",
    opts = { noremap = true, silent = true },
    config = function()
      require("Fterm").setup({
        blend = 5,
        dimensions = {
          height = 0.90,
          width = 0.90,
          x = 0.5,
          y = 0.5
        }
      })
    end
  },

  -- Git plugin
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    -- lazy = false,
  },

  -- Git diff viewer plugin
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
  },

  -- Smart commenting plugin
  {
    "numToStr/Comment.nvim",
    event = "BufEnter",
    config = function()
      require("Comment").setup()
    end
  },

  -- fzf plugin for Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      lazy = 'false',
      config = function ()
        require('telescope').load_extension('fzf')
      end
    },
  },

  -- Github Co-pilot
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("CR")', { silent = true, expr = true})
      -- require("copilot").setup()
    end
  },

  -- Copilot Chat
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    -- 'deathbeam/CopilotChat.nvim', -- forked from CopilotC-Nvim/CopilotChat.nvim for function calling support
    -- branch = "tools",
    dependencies = {
      { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
      -- { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    build = 'make tiktoken',  -- Only on MacOS or Linux
    event = "VeryLazy",
    opts = {
      question_header = "## User ",
      answer_header = "## Copilot ",
      error_header = "## Error ",
      prompts = require("configs.copilot.copilot-chat-prompts"),
    },
    config = require("configs.copilot.copilot-chat"),
  },

  -- json5 dependency for MCPHub
  { 
    'Joakker/lua-json5',
    build = './install.sh',
    event = "BufEnter",
  },

  -- MCPHub
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest",  -- Installs `mcp-hub` node binary globally
    event = "VeryLazy",
    -- event = "BufEnter",
    config = function()
      require("mcphub").setup({
        json_decode = require("json5").parse,
      })
    end
  },
}
