local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require("lspconfig/util")

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}

-- Golang LSP setup
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedParams = true
      },
    },
  },
}

-- Python LSP setup
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" }
}

-- Markdown LSP setup
lspconfig.marksman.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "markdown", "markdown.mdx" },
}

-- Vue LSP Setup
lspconfig.volar.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "vue-language-server" },
  filetypes = { "vue" },
  settings = {
    vetur = {
      completion = {
        autoImport = true,
        useScaffoldSnippets = true
      },

      validation = {
        template = true,
        script = true,
        style = true,
        templateProps = true,
        interpolation = true
      }
    }
  }
}

-- Lua LSP Setup
lspconfig.lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "lua" },
  cmd = { "lua-language-server" }
}

-- Dockerfile LSP Setup
-- lspconfig.docker.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "dockerfile" },
--   cmd = { "docker-langserver" }
-- }
