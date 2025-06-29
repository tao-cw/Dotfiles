[ -x "$(which fzf 2>/dev/null)" ] || return
eval "$(fzf --bash)"

[ -f '/usr/share/bash-completion/completions/fzf' ]\
        && source '/usr/share/bash-completion/completions/fzf'\
        || source '/usr/share/fzf/completion.bash'

EXCLUDES="--exclude={.git,.idea,node_modules,__pycache__,.cache}"

export FZF_COMPLETION_TRIGGER='*'
export FZF_DEFAULT_COMMAND="fd ${EXCLUDES} --type f"
_fzf_compgen_path() {
	fd --hidden --follow ${EXCLUDES} . "$1"
}

_fzf_compgen_dir() {
	fd --type d --hidden --follow ${EXCLUDES} . "$1"
}
