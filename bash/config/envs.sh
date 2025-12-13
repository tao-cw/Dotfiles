#!/usr/bin/env sh

export HISTCONTROL=ignoredups

export PATH="$HOME/.local/bin:${PATH}:/opt/texlive/2024/bin/x86_64-linux"
export MANPATH="$(man --path):/opt/texlive/2024/texmf-dist/doc/man"
export INFOPATH="${INFOPATH}:/opt/texlive/2024/texmf-dist/doc/info"
[ -x "$(which nvim)" ] && export EDITOR='nvim'

export wallpapers="$HOME/Pictures/wallpapers"
export DWM="$HOME/workspace/src/dwm"
export ALSA_CARD="Generic_1"
export BROWSER="firefox"
export DF="$HOME/workspace/Dotfiles"

[ -x "$(which fcitx5 2>/dev/null)" ] || [ -x "$(which fcitx 2>/dev/null)" ] &&
	{
		export GTK_IM_MODULE=fcitx
		export QT_IM_MODULE=fcitx
		export XMODIFIERS=@im=fcitx
		export SDL_IM_MODULE=fcitx
		export GLFW_IM_MODULE=ibus
	}
