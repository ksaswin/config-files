## BAT (cat clone with wings)

### Themes setup

Create new directory for bat themes:
```shell
mkdir -p "~/.config/bat/themes"
cd "$(bat --config-dir)/themes"
```

Download the themes from github:
```shell
curl -O https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_night.tmTheme
curl -O https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_day.tmTheme
curl -O https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_moon.tmTheme
```

Update bat caches:
```shell
bat cache --build
bat --list-themes | grep tokyo
```
