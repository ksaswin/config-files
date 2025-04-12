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

  -- Noice for Pretty Command mode
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

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
