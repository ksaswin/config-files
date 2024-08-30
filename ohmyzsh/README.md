## OhMyZsh


#### Install oh-my-zsh
[OhMyZsh](https://ohmyz.sh/) is a framework to manage your Zsh configuration.
```bash
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

#### Install theme
Install the powerlevel10k theme for Zsh.
```bash
  git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```
Open `.zshrc` file and add set the new theme using `ZSH_THEME="powerlevel10k/powerlevel10k"`.

By default, the theme is set as `ZSH_THEME="robbyrussel"`.

Re-launch iTerm2 and follow the prompts.

*Make sure you quit iTerm2 and not just exit.*

#### Enable auto suggestions
Clone the repo for auto suggestions.
```bash
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
Add the plugin to `.zshrc` file `plugins=(zsh-autosuggestions)`.

#### My zshrc
My `~/.zshrc` config.

```
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
   git
   zsh-autosuggestions
   )

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"

# To load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# To load nvm bash completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
```

#### Aliases
The `aliases.zsh` could be moved to `$ZSH_CUSTOM/custom/` path.

The `tmux_aliases.zsh` contains some alises for TMUX. It expects `gum` to be installed in your system.
