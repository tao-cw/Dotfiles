alias tos='sleep 1 && xset dpms force standby'
alias lg='lazygit'
alias cg='chatgpt'
alias nb='newsboat'
alias vi='nvim'
alias py='PAGER="bat --plain" python'
alias lf='lfub'
alias dl='aria2c'
alias g='git'
alias cd='z'

alias info='info --vi-keys'
alias ls='eza --icons=always'
alias ll='ls -l'
alias la='ls -al'
alias grep='grep --color=auto'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias rb='reboot'
alias sn='shutdown -h now'
alias se='sudo -e'
alias free='free -h'
alias df='df -h'
alias bat='bat --style=plain'
alias ip="ip -c"

alias gl='git log --pretty="tformat:%Cred%h %Cgreen%cn %Cblue%s" --graph -n 10'

alias dtmp="mkdir -p /tmp/taocw-tmp && cd /tmp/taocw-tmp"
alias sbc="source $HOME/.bashrc"

alias smi='sudo make install'
alias mc='make clean'

# Install / remove
alias paci='sudo pacman -S'          # install from repos
alias pacir='sudo pacman -Rns'       # remove pkg + unneeded deps + configs
alias pacu='sudo pacman -U'          # install a local .pkg.tar.zst

# Search & inspect
alias pacs='pacman -Ss'              # search repos
alias pacsi='pacman -Si'             # repo info (deps, size, packager)
alias pacq='pacman -Qs'              # search installed
alias pacqi='pacman -Qi'             # installed package info
alias pacql='pacman -Ql'             # list files in a package
alias pacqo='pacman -Qo'             # which package owns a file
alias pacf='pacman -F'               # which package *would* own a file
# (needs one-time: sudo pacman -Fy)

# Lists
alias pacqu='pacman -Qu'             # pending updates
alias pacqe='pacman -Qe'             # explicitly installed
alias pacqdt='pacman -Qdt'           # orphan dependencies
alias pacforeign='pacman -Qm'        # foreign / AUR packages
