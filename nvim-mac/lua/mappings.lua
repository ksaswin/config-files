require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- The following line can be read as:
-- In NORMAL mode, map the `;` to run `:`
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Floating Diagnostic
map("n", "<leader>lf", "<cmd> lua vim.diagnostic.open_float(nil, {focus=false}) <CR>", { desc = "Floating Diagnostic" })

-- To be used with folke/todo-comments plugin
map("n", "<leader>tl", "<cmd> TodoTelescope <CR>", { desc = "Search all project todos in with Telescope" })

-- To be used with numToStr/FTerm.nvim
map("n", "<leader>tt", "<cmd> lua require('FTerm').toggle() <CR>", { desc = "Toggle floating terminal (Normal mode)" })

-- To be used with numToStr/FTerm.nvim
map("t", "<leader>tt", "<C-\\><C-n>:lua require('FTerm').toggle()<CR>", { desc = "Toggle floating terminal (Terminal mode)" })

-- To be used with gitsigns
map("n", "<leader>gb", "<cmd> lua require('gitsigns').blame_line() <CR>", { desc = "Display git blame on a floating window" })

-- To be used with CopilotChat
local copilotchat = require("CopilotChat")
map("n", "<leader>ai", "<cmd>CopilotChatToggle<CR>", { desc = "CopilotChat - Toggle chat" })

map("n",
  "<leader>ap",
  function()
    copilotchat.select_prompt({
      context = {
        "buffers",
      }
    })
  end,
  { desc = "CopilotChat - Prompt actions" }
)
map("x",
  "<leader>ap",
  function()
    copilotchat.select_prompt()
  end,
  { desc = "CopilotChat - Prompt actions" }
)
map("n", "<leader>ae", "<cmd>CopilotChatExplain<CR>", { desc = "CopilotChat - Explain code" })
map("n", "<leader>an", "<cmd>CopilotChatBetterNamings<CR>", { desc = "CopilotChat - Better naming" })
-- map("n", "<leader>at", "<cmd>CopilotChatTests<CR>", { desc = "CopilotChat - Generate tests" })
-- map("n", "<leader>ar", "<cmd>CopilotChatReview<CR>", { desc = "CopilotChat - Review code" })
-- map("n", "<leader>aR", "<cmd>CopilotChatRefactor<CR>", { desc = "CopilotChat - Refactor code" })

map("n", "<leader>aa", "<cmd>CopilotChatAgents<CR>", { desc = "CopilotChat - Select agents" })
map("n", "<leader>a?", "<cmd>CopilotChatModels<CR>", { desc = "CopilotChat - Select models" })
