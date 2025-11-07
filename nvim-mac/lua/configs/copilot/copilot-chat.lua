-- Check if the current working directory contains "<workpath>"
local function is_work_project()
  local cwd = vim.fn.getcwd()
  local workpath = "Work" -- FIXME: Change this to your actual work path identifier

  return string.find(cwd, workpath) ~= nil
end

return function(_, opts)
  local chat = require("CopilotChat")
  local user = vim.env.USER or "User"
  local model = opts.model or "Copilot"
  user = user:upper()
  opts.question_header = "  " .. user .. " "
  opts.answer_header = "  " .. model .. " "

  opts.headers = {
    user = opts.question_header,
    assistant = opts.answer_header,
    tool = " Tool "
  }

  chat.setup(opts)

  local select = require("CopilotChat.select")
  vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
    chat.ask(args.args, { selection = select.visual })
  end, { nargs = "*", range = true })

  -- Inline chat with Copilot
  vim.api.nvim_create_user_command("CopilotChatInline", function(args)
    chat.ask(args.args, {
      selection = select.visual,
      window = {
        layout = "float",
        relative = "cursor",
        width = 1,
        height = 0.4,
        row = 1,
      },
    })
  end, { nargs = "*", range = true })

  -- Restore CopilotChatBuffer
  vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
    chat.ask(args.args, { selection = select.buffer })
  end, { nargs = "*", range = true })

  -- Overriding CopilotChatToggle command to use custom function
  vim.api.nvim_create_user_command("CopilotChatToggle", function()
    if is_work_project() then
      chat.toggle({
        tools = {
          "get_components_documentation",
          "get_css_grid_documentation",
          "get_css_styles_documentation ",
          "get_design_tokens_documentation",
          "get_install_documentation",
          "get_layout_patterns_documentation",
          "get_setup_documentation",
        }
      })
    else
      chat.toggle()
    end
  end, { nargs = "*", range = true })

  -- Custom buffer for CopilotChat
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "copilot-*",
    callback = function()
      -- vim.opt_local.relativenumber = true
      -- vim.opt_local.number = true

      -- Get current filetype and set it to markdown if the current filetype is copilot-chat
      local ft = vim.bo.filetype
      if ft == "copilot-chat" then
        vim.bo.filetype = "markdown"
      end
    end,
  })

  require("configs.copilot.copilot-chat-mcp").mcphub(chat)
end
