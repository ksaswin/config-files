# Pacman aliases
alias yoink="paru -S"
alias yeet="paru -Rcns"

# NVM usage
export NVM_DIR="/usr/share/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# TMUX (Setting tmux to use utf-8)
alias tmux="tmux -u"

# pbcopy & pbpaste in arch
# NOTE: Depends on the xsel package
# pacman -S xsel
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
