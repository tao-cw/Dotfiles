HISTSIZE=10000
HISTFILESIZE=20000
HISTFILE=$HOME/.cache/bashhistory
HISTCONTROL=ignoredups

# Use bash-completion, if available
#[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
#	. /usr/share/bash-completion/bash_completion

bind -m vi-insert 'Control-l: clear-screen'

shopt -s autocd
