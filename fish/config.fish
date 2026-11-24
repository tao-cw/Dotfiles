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

  abbr --add lg lazygit
  abbr --add nb 'newsboat -q'
  abbr --add vi nvim
  abbr --add py 'PAGER="bat --plain" python'
  abbr --add dl aria2c
  abbr --add cd z
  abbr --add mp ncmpcpp -q
  abbr --add ssh 'kitten ssh'

  abbr --add info 'info --vi-keys'
  abbr --add ls 'eza --icons=always'
  # abbrs don't re-expand, so ll/la spell out the eza form instead of 'ls -l'
  abbr --add ll 'eza --icons=always -l'
  abbr --add la 'eza --icons=always -al'
  abbr --add grep 'grep --color=auto'
  abbr --add mv 'mv -v'
  abbr --add cp 'cp -v'
  abbr --add rm 'rm -v'
  abbr --add rb reboot
  abbr --add sn 'shutdown -h now'
  abbr --add se 'sudo -e'
  abbr --add free 'free -h'
  abbr --add df 'df -h'
  abbr --add cat 'bat --style=plain'
  abbr --add bat 'bat --style=plain'
  abbr --add ip 'ip -c'

  abbr --add gl 'git log --pretty="tformat:%Cred%h %Cgreen%cn %Cblue%s" --graph -n 10'

  abbr --add dtmp 'mkdir -p /tmp/taocw-tmp && cd /tmp/taocw-tmp'
  abbr --add sfc 'source $HOME/.config/fish/config.fish'

  abbr --add smi 'sudo make install'
  abbr --add mc 'make clean'

  # Install / remove
  abbr --add paci 'sudo pacman -S'          # install from repos
  abbr --add pacir 'sudo pacman -Rns'       # remove pkg + unneeded deps + configs
  abbr --add pacu 'sudo pacman -U'          # install a local .pkg.tar.zst

  # Search & inspect
  abbr --add pacs 'pacman -Ss'              # search repos
  abbr --add pacsi 'pacman -Si'             # repo info (deps, size, packager)
  abbr --add pacq 'pacman -Qs'              # search installed
  abbr --add pacqi 'pacman -Qi'             # installed package info
  abbr --add pacql 'pacman -Ql'             # list files in a package
  abbr --add pacqo 'pacman -Qo'             # which package owns a file
  abbr --add pacf 'pacman -F'               # which package *would* own a file
  # (needs one-time: sudo pacman -Fy)

  # Lists
  abbr --add pacqu 'pacman -Qu'             # pending updates
  abbr --add pacqe 'pacman -Qe'             # explicitly installed
  abbr --add pacqdt 'pacman -Qdt'           # orphan dependencies
  abbr --add pacforeign 'pacman -Qm'        # foreign / AUR packages

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
