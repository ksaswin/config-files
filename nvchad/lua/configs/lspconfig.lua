-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Typescript LSP Configuration
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Markdown LSP Configuration
lspconfig.marksman.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Python LSP Configuration
lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Lua LSP Configuration
lspconfig.lua.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Vue LSP Configuration
lspconfig.volar.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "vue-language-server" },
  -- filetypes = { "vue" },
  -- settings = {
  --   vetur = {
  --     completion = {
  --       autoImport = true,
  --       useScaffoldSnippets = true
  --     },
  --
  --     validation = {
  --       template = true,
  --       script = true,
  --       style = true,
  --       templateProps = true,
  --       interpolation = true
  --     }
  --   }
  -- }
}
