local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "python",
    "go",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "deno",
    "typescript-language-server",
    "prettier",
    "vetur-vls",
    "vue-language-server",

    -- c/cpp stuff
    -- "clangd",
    -- "clang-format",

    -- go stuff
    "gopls",

    -- python stuff
    "pyright",
    "mypy",
    "ruff",

    -- github stuff
    "marksman",
    "markdownlint",
    "gitlint",
    "actionlint",

    -- docker stuff
    "yaml-language-server",
    "dockerfile-language-server"
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
