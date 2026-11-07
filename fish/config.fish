if status is-interactive
  set -U fish_greeting

  fish_vi_key_bindings

  set fish_cursor_default block
  set fish_cursor_insert block blink
  set fish_cursor_replace_one underscore
  set fish_cursor_replace underscore
  set fish_cursor_visual block
  set fish_cursor_external line

  bind -M insert jf '
  if commandline -P
    commandline -f cancel
  else
    set fish_bind_mode default
    if test (count (commandline --cut-at-cursor | tail -c2)) != 2
      commandline -f backward-char
    end
    commandline -f repaint-mode
  end
  '

  alias lg 'lazygit'
  alias nb 'newsboat'
  alias vi 'nvim'
  alias py 'PAGER="bat --plain" python'
  alias dl 'aria2c'
  alias cd 'z'

  alias info 'info --vi-keys'
  alias ls 'eza --icons=always'
  alias ll 'ls -l'
  alias la 'ls -al'
  alias grep 'grep --color=auto'
  alias mv 'mv -v'
  alias cp 'cp -v'
  alias rm 'rm -v'
  alias rb 'reboot'
  alias sn 'shutdown -h now'
  alias se 'sudo -e'
  alias free 'free -h'
  alias df 'df -h'
  alias bat 'bat --style=plain'
  alias ip 'ip -c'

  alias gl 'git log --pretty="tformat:%Cred%h %Cgreen%cn %Cblue%s" --graph -n 10'

  alias dtmp 'mkdir -p /tmp/taocw-tmp && cd /tmp/taocw-tmp'
  alias sfc 'source $HOME/.config/fish/config.fish'

  alias smi 'sudo make install'
  alias mc 'make clean'

  # Install / remove
  alias paci 'sudo pacman -S'          # install from repos
  alias pacir 'sudo pacman -Rns'       # remove pkg + unneeded deps + configs
  alias pacu 'sudo pacman -U'          # install a local .pkg.tar.zst

  # Search & inspect
  alias pacs 'pacman -Ss'              # search repos
  alias pacsi 'pacman -Si'             # repo info (deps, size, packager)
  alias pacq 'pacman -Qs'              # search installed
  alias pacqi 'pacman -Qi'             # installed package info
  alias pacql 'pacman -Ql'             # list files in a package
  alias pacqo 'pacman -Qo'             # which package owns a file
  alias pacf 'pacman -F'               # which package *would* own a file
  # (needs one-time: sudo pacman -Fy)

  # Lists
  alias pacqu 'pacman -Qu'             # pending updates
  alias pacqe 'pacman -Qe'             # explicitly installed
  alias pacqdt 'pacman -Qdt'           # orphan dependencies
  alias pacforeign 'pacman -Qm'        # foreign / AUR packages

  if command -q fzf
    set -gx FZF_DEFAULT_OPTS '
    --color fg:#d4be98,bg:#282828,hl:#d8a657,fg+:#e2d3ba,bg+:#282828,hl+:#e1bb7e
    --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
    '
    set -gx FZF_DEFAULT_COMMAND 'fd --exclude={.git,.idea,node_modules,__pycache__,.cache} --type f'
    # bash-only (fzf completion is a bash/zsh feature): FZF_COMPLETION_TRIGGER,
    # _fzf_compgen_path/_fzf_compgen_dir, tldr completion
    fzf --fish | source
  end

  if command -q zoxide
    zoxide init fish | source
  end

  set -gx PYVENV $HOME/workspace/venv
  test -f $PYVENV/base/bin/activate.fish; and source $PYVENV/base/bin/activate.fish

end
