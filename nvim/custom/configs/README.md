## Configurations


### Debug Adapter Protocol (DAP)

[nvim-dap](https://github.com/mfussenegger/nvim-dap) is a Debug Adapter Protocol client implementation for Neovim.

nvim-dap adapter for [vscode-js-debug](https://github.com/microsoft/vscode-js-debug)

#### Install and Build vscode-js-debug:

Clone the repo to any location (using home for the example):
```bash
cd

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

The build files should now be available inside `~/vscode-js-debug/out`.

My key-binds for DAP and DAP-UI available [here](https://github.com/ksaswin/config-files/blob/master/nvim/custom/mappings.lua)


### Noice

Nvim UI replacement for `messages`, `cmdline` and `popupmenu`.
[noice](https://github.com/folke/noice.nvim)
