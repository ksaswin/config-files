---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

  --
  -- MY CUSTOM KEY BINDS
  --
    -- To be used with folke/todo-comments plugin
    ["<leader>tl"] = { "<cmd> TodoTelescope <CR>", "Search all project todos in with Telescope" },

    -- To be used with numToStr/FTerm.nvim
    ["<leader>tt"] = { "<cmd> lua require('FTerm').toggle() <CR>", "Toggle floating terminal (Normal mode)" },
  --
  -- MY CUSTOM KEY BINDS
  --
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
  --
  -- MY CUSTOM KEY BINDS
  --

  -- Terminal mode
  t = {
    -- To be used with numToStr/FTerm.nvim
    ["<leader>tt"] = { "<C-\\><C-n>:lua require('FTerm').toggle()<CR>", "Toggle floating terminal (Terminal mode)" },
  }
  --
  -- MY CUSTOM KEY BINDS
  --
}

--
-- MY CUSTOM KEY BINDS
--
M.dapui = {
  n = {
    -- To be used with rcarriga/nvim-dap-ui
    ["<leader>dt"] = { "<cmd> lua require('dapui').toggle() <CR>", "Toggle debugger UI" },
    ["<leader>dr"] = { "<cmd> lua require('dapui').open({ reset = true }) <CR>", "Reset debugger UI" },
  }
}

M.dap = {
  n = {
    -- To be used with mfussenegger/nvim-dap
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle breakpoint" },
    ["<leader>dc"] = { "<cmd> DapContinue <CR>", "Debugger continue" },

    -- VS Code Debug actions (Reference: https://code.visualstudio.com/docs/editor/debugging#_debug-actions)
    ["F5"] = { "<cmd> DapContinue <CR>", "Debugger Continue" },
    ["F10"] = { "<cmd> DapStepOver <CR>", "Debugger Step-Over" },
    ["F11"] = { "<cmd> DapStepInto <CR>", "Debugger Step-Into" },
    ["S-F11"] = { "<cmd> DapStepOut <CR>", "Debugger Step-Out" },
    ["S-F5"] = { "<cmd> DapTerminate <CR>", "Debugger Stop/Terminate" },
  }
}
--
-- MY CUSTOM KEY BINDS
--

return M
