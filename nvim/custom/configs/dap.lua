local dap = require("dap")
local languages = { "typescript", "javascript" }

for _, language in ipairs( languages ) do
  dap.configurations[ language ] = {
    {
      name = "Launch file",
      type = "pwa-node",
      request = "launch",
      program = "${file}",
      cwd = "${workspaceFolder}",
      rootPath = '${workspaceFolder}',
      sourceMaps = true,
      skipFiles = { "<node_internals>/**", "**/node_modules/**" },
      protocol = 'inspector',
      console = 'integratedTerminal',
    },
    {
      name = 'Launch Current File (Typescript)',
      type = 'pwa-node',
      request = 'launch',
      program = "${file}",
      cwd = "${workspaceFolder}",
      rootPath = '${workspaceFolder}',
      sourceMaps = true,
      skipFiles = { '<node_internals>/**', 'node_modules/**' },
      protocol = 'inspector',
      console = 'integratedTerminal',
      runtimeExecutable = 'node',
      runtimeArgs = { '--loader=ts-node/esm' },
      args = { '${file}' },
      outFiles = { "${workspaceFolder}/**/**/*", "!**/node_modules/**" },
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    },
    {
      name = "Debug Current Jest Test File",
      type = "pwa-node",
      request = "launch",
      program = "${file}",
      cwd = "${workspaceFolder}",
      rootPath = "${workspaceFolder}",
      sourceMaps = true,
      skipFiles = { '<node_internals>/**', 'node_modules/**' },
      protocol = 'inspector',
      console = "integratedTerminal",
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/jest/bin/jest.js",
        "--runInBand"
      },
      trace = true, -- include debugger info
      internalConsoleOptions = "neverOpen",
    },
    {
      name = "Debug All Jest Test Files",
      type = "pwa-node",
      request = "launch",
      cwd = "${workspaceFolder}",
      rootPath = "${workspaceFolder}",
      sourceMaps = true,
      skipFiles = { '<node_internals>/**', 'node_modules/**' },
      protocol = 'inspector',
      console = "integratedTerminal",
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/jest/bin/jest.js",
        "--runInBand"
      },
      trace = true, -- include debugger info
      internalConsoleOptions = "neverOpen",
    }
  }
end

vim.fn.sign_define( 'DapBreakpoint', { text='🔴', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' } ) -- Default: B
vim.fn.sign_define( 'DapLogPoint', { text='㏒', texthl='DapLogPoint', linehl='DapLogPoint', numhl='DapLogPoint' } ) -- Default: L
vim.fn.sign_define( 'DapStopped', { text='↪', texthl='DapStopped', linehl='DapStopped', numhl='DapStopped' } ) -- Default: →

-- vim.fn.sign_define( 'DapBreakpointCondition', { text='C', texthl='DapBreakpointCondition', linehl='DapBreakpointCondition', numhl='DapBreakpointCondition' } ) -- Default: C
-- vim.fn.sign_define( 'DapBreakpointRejected', { text='R', texthl='DapBreakpointRejected', linehl='DapBreakpointRejected', numhl='DapBreakpointRejected' } ) -- Default: R
