local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  --
  -- MY CUSOMISATIONS
  --

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
    event = "BufEnter",
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

  -- Debugger plugins
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("dapui").setup({})
    end
  },

  -- Virutal text support for the debugger. Provides variable definitions
  {
    "theHamsta/nvim-dap-virtual-text",
    event = "VeryLazy",
    dependencies = {
      -- Providing virutal text support for mfussenegger/nvim-dap
      "mfussenegger/nvim-dap",
      -- nvim-treesitter/nvim-treesitter used to find variable definitions
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  },

  -- mfussenegger/nvim-dap apater for vscode-js-debug
  {
    "mxsdev/nvim-dap-vscode-js",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
    config = function()
      require("custom.configs.nvim-dap-vscode-js") -- nvim-dap-vscode-js debugger setup
      require("custom.configs.dap") -- debugger language setup
    end
  },

  -- Experimental plugin for Command line UI with telescope and prettier notification
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("custom.configs.noice")
    end
  },
  --
  -- MY CUSOMISATIONS
  --

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
