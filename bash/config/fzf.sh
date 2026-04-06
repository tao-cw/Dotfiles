[ -x "$(which fzf 2>/dev/null)" ] || return
eval "$(fzf --bash)"

[ -f '/usr/share/bash-completion/completions/fzf' ]\
  && source '/usr/share/bash-completion/completions/fzf'\
  || source '/usr/share/fzf/completion.bash'

EXCLUDES="--exclude={.git,.idea,node_modules,__pycache__,.cache}"

export FZF_DEFAULT_OPTS='
--color fg:#d4be98,bg:#282828,hl:#d8a657,fg+:#e2d3ba,bg+:#282828,hl+:#e1bb7e
--color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
'
export FZF_COMPLETION_TRIGGER='*'
export FZF_DEFAULT_COMMAND="fd ${EXCLUDES} --type f"
_fzf_compgen_path() {
  fd --hidden --follow ${EXCLUDES} . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow ${EXCLUDES} . "$1"
}

_fzf_complete_tldr() {
  _fzf_complete --multi --reverse  -- "$@" < <(tldr -l 2> /dev/null)
}
[ -n "$BASH" ] && complete -F _fzf_complete_tldr -o default -o bashdefault tldr
