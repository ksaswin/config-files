local vscode_dap = require("dap-vscode-js")

-- Reference:
-- https://github.com/mxsdev/nvim-dap-vscode-js#setup
vscode_dap.setup({
  node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  debugger_path = "/Users/ksaswin/vscode-js-debug/", -- Path to vscode-js-debug installation.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
})

-- VS Code Debugger User Guide
-- https://code.visualstudio.com/docs/editor/debugging

--[[
Steps I followed to install and build vscode-js-debug
The Gitub url: https://github.com/microsoft/vscode-js-debug

Clone the repo to any location:
```bash
git clone https://github.com/microsoft/vscode-js-debug
```
Move into the directory:
```bash
cd vscode-js-debug
```
Install dependencies and build:
```bash
npm install --legacy-peer-deps && npx gulp vsDebugServerBundle
```
Change the dist folder name to out:
```bash
mv dist out
```
]]
