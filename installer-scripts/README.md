## Installers


### Packages Installed

#### Mac

| Package                          | App Type        | Optional | Description                           |
|----------------------------------|-----------------|----------|---------------------------------------|
| Homebrew                         | Package manager |          | Package manager for MacOs             |
| DuckDuckGo                       | Cask (GUI)      |          |                                       |
| Figma                            | Cask (GUI)      | Yes      |                                       |
| Google Chrome                    | Cask (GUI)      |          |                                       |
| iTerm2                           | Cask (GUI)      |          |                                       |
| Microsoft Azure-Storage Explorer | Cask (GUI)      | Yes      |                                       |
| Microsoft Remote Desktop         | Cask (GUI)      | Yes      |                                       |
| Numi                             | Cask (GUI)      | Yes      | Calculator App                        |
| Obsidian                         | Cask (GUI)      |          | Note-taking App                       |
| PgAdmin4                         | Cask (GUI)      | Yes      |                                       |
| Postman                          | Cask (GUI)      |          |                                       |
| Visual Studio Code               | Cask (GUI)      |          |                                       |
| Azure-CLI                        | CLI             | Yes      |                                       |
| Btop                             | TUI             |          | TUI replacement for htop/top          |
| Fuzzy Finder                     | CLI             |          |                                       |
| Git                              | CLI             |          |                                       |
| Go Lang                          | Language        | Yes      |                                       |
| Json Query Tool (jq)             | CLI             |          |                                       |
| Json Query Tool (jqp)            | TUI             |          |                                       |
| K9S                              | CLI             |          |                                       |
| Kubelogin                        | CLI             |          |                                       |
| Kustomize                        | CLI             |          |                                       |
| lolcat                           | CLI             | Yes      | Colorize stdout with random gradients |
| Neovim                           | TUI             |          |                                       |
| NVM                              | CLI             |          | Node Version Manager                  |
| Pipenv                           | CLI             | Yes      |                                       |
| Postgresql                       | CLI             |          |                                       |
| ripgrep                          | CLI             |          | Dependency for Telescope (Neovim)     |
| TLDR                             | CLI             |          | Shorter man                           |
| TMUX                             | CLI             |          |                                       |
| trash                            | CLI             |          | Safer-replacement for rm              |
| Tree-sitter                      | CLI             |          | Dependency for Neovim                 |
| Hashicorp Vault CLI              | CLI             | Yes      |                                       |
| NvChad                           | Config          |          | Neovim config                         |
| OhMyZsh                          | Zsh theme       |          |                                       |

- TODO:
  - Installation for some form of Docker daemon (maybe Rancher or Podman)

#### Linux

| Package                          | App Type        | Optional | Description                           |
|----------------------------------|-----------------|----------|---------------------------------------|
| Btop                             | TUI             |          | TUI replacement for htop/top          |
| Fuzzy Finder                     | CLI             |          |                                       |
| Git                              | CLI             |          |                                       |
| Json Query Tool (jq)             | CLI             |          |                                       |
| lolcat                           | CLI             | Yes      | Colorize stdout with random gradients |
| Neovim                           | TUI             |          |                                       |
| ripgrep                          | CLI             |          | Dependency for Telescope (Neovim)     |
| TLDR                             | CLI             |          | Shorter man                           |
| TMUX                             | CLI             |          |                                       |
| NvChad                           | Config          |          | Neovim config                         |

- TODO:
  - Automate jqp installation from Github releases.
  - k9s installation on ubuntu.
  - Update Neovim installation to use Github releases.
  - Unable to install nvm using apt.


#### Dotfiles

Download my dotfiles to the `~/.config` directory.


### Usage

The installer `install.sh` script finds the OS being used and runs the installer for the corresponding system.

Run the installer script:
```shell
sh -c "$(curl https://raw.githubusercontent.com/ksaswin/config-files/installers/installer-scripts/curl.sh)" && /usr/bin/env bash ./install.sh
```
