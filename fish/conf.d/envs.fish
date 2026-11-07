set -gx PATH $HOME/.local/bin $PATH /opt/texlive/2024/bin/x86_64-linux
set -gx MANPATH (man --path | string split :) /opt/texlive/2024/texmf-dist/doc/man
set -gx INFOPATH $INFOPATH /opt/texlive/2024/texmf-dist/doc/info
command -q nvim; and set -gx EDITOR nvim

set -gx wallpapers $HOME/Pictures/wallpapers
set -gx ALSA_CARD Generic_1
set -gx BROWSER firefox
set -gx DF $HOME/workspace/Dotfiles

# if command -q fcitx5; or command -q fcitx
#     set -gx GTK_IM_MODULE fcitx
#     set -gx QT_IM_MODULE fcitx
#     set -gx XMODIFIERS @im=fcitx
#     set -gx SDL_IM_MODULE fcitx
#     set -gx GLFW_IM_MODULE ibus
# end
