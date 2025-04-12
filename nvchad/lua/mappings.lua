require "nvchad.mappings"

local map = vim.keymap.set

-- The following line can be read as:
-- In NORMAL mode, map the `;` to run `:`
map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "jk", "<ESC>")


-- To be used with folke/todo-comments plugin
map("n", "<leader>tl", "<cmd> TodoTelescope <CR>", { desc = "Search all project todos in with Telescope" })

-- To be used with numToStr/FTerm.nvim
map("n", "<leader>tt", "<cmd> lua require('FTerm').toggle() <CR>", { desc = "Toggle floating terminal (Normal mode)" })

-- To be used with numToStr/FTerm.nvim
map("t", "<leader>tt", "<C-\\><C-n>:lua require('FTerm').toggle()<CR>", { desc = "Toggle floating terminal (Terminal mode)" })
