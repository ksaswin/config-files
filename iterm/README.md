## Mac OS terminal setup guide

#### Install Homebrew
Visit [Homebrew](https://brew.sh/) for the installation command (command also provided below).
```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Install iTerm2
[iTerm2](https://iterm2.com/) is a terminal emulator for mac OS.
```bash
  brew install --cask iterm2
```

#### Install git
Make sure [git](https://git-scm.com/) is installed.
```bash
  brew install git
```

#### Install oh-my-zsh
[OhMyZsh](https://ohmyz.sh/) is a framework to manage your Zsh configuration.
```bash
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

#### Install my iTerm2 colors
You copy the content from [here](https://raw.githubusercontent.com/ksaswin/config-files/master/iterm/itermColorProfile.itermcolors) and paste it in a file named `itermColorProfile.itermcolors`.

Open iTerm2 settings, move to `Profiles` -> `Colors` -> `Color presets` -> `Import`.

Find the location where you saved the `itermColorProfile.itermcolors` file and import it.

<details>
  <summary>How do I open iTerm settings window?</summary>

- Open iTerm2.

- Click on `Command ,` keys to open settings window.
</details>

Configure iTerm2 to meet your needs!

I've also enabled a status bar to show Network throughput, CPU utilisation and Memory utilisation.

<details>
  <summary>How do I enable status bar?</summary>

- Open iTerm2.

- Click on `Command ,` keys to open settings window.

- Move to `Profiles` -> `Session`.

- Check the `Status bar enabled` checkbox and configure it to match your preference.
</details>

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
<details>
  <summary>What does my .zshrc look like?</summary>

Lines starting with `#` are comments.
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
</details>

[Followed the setup by Engineering with Utsav](https://www.engineeringwithutsav.com/blog/spice-up-your-macos-terminal)

[Follow his video guide](https://youtu.be/0MiGnwPdNGE)
