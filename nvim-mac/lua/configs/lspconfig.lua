require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 

-- Fix for signature help to not focus the floating window
vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
  config = vim.tbl_extend("force", config or {}, {
    focus = false,
    silent = true,
  })

  -- Use the new handler directly
  return vim.lsp.handlers.signature_help_default(err, result, ctx, config)
end

vim.lsp.config("ts_ls", {
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
})

local vue_language_server_path = vim.fn.stdpath('data') .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}
vim.lsp.config('vtsls', {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

vim.lsp.enable("ts_ls")
vim.lsp.enable("vtsls")
vim.lsp.enable("vue_ls")

vim.lsp.enable('marksman')

vim.lsp.enable('pyright')

vim.lsp.enable('bashls')

-- See for more lua-language-server settings: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
vim.lsp.enable('lua_ls')

-- Typescript LSP Configuration
-- vim.lsp.config.ts_ls = {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
--   -- root_dir = function(bufnr, cb)
--   --   local root = vim.fs.root(bufnr, { "package.json", "tsconfig.json", "jsonconfig.json" })
--   --   cb(root)
--   -- end,
--   -- init_options = {
--   --   plugins = {
--   --     {
--   --       name = "@vue/typescript-plugin",
--   --       location = vim.fn.expand(
--   --         "$NVM_DIR/versions/node/v20.17.0/lib/node_modules/@vue/typescript-plugin"
--   --       ),
--   --       languages = { "vue", "typescript", "javascript" }
--   --     },
--   --   },
--   -- },
--   -- filetypes = { "typescript", "javascript", "tsx", "jsx", "ts", "js", "vue" }
-- }
--
-- -- Markdown LSP Configuration
-- vim.lsp.config.marksman.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--
-- -- Python LSP Configuration
-- vim.lsp.config.pyright.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--
-- -- Lua LSP Configuration
-- vim.lsp.config.lua.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--
-- -- Vue LSP Configuration
-- vim.lsp.config.volar.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
--   cmd = { "vue-language-server", "--stdio" },
--   filetypes = { "vue" },
--   settings = {
--     vetur = {
--       completion = {
--         autoImport = true,
--         useScaffoldSnippets = true
--       },
--
--       validation = {
--         template = true,
--         script = true,
--         style = true,
--         templateProps = true,
--         interpolation = true
--       }
--     }
--   }
-- }
--
-- vim.lsp.config.gopls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--
-- -- Bash LSP Configuration
-- vim.lsp.config.bash.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
--   cmd = { "bash-language-server" },
-- }
