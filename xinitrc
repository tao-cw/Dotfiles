#!/bin/sh
#
#      _             _
#  ___| |_ __ _ _ __| |___  __
# / __| __/ _` | '__| __\ \/ /
# \__ \ || (_| | |  | |_ >  < 
# |___/\__\__,_|_|   \__/_/\_\
#                             

prefix="/usr"
exec_prefix="${prefix}"
xrdb="xrdb"
xinitdir="/etc/X11/xinit"
xclock="xclock"
xterm="xterm"
twm="twm"
xmodmap="xmodmap"

userresources="$HOME/.Xresources"
usermodmap="$HOME/.Xmodmap"
sysresources="$xinitdir/.Xresources"
sysmodmap="$xinitdir/.Xmodmap"

# merge in defaults and keymaps

if [ -f "$sysresources" ]; then
  if [ -x /usr/bin/cpp ] ; then
    "$xrdb" -merge "$sysresources"
  else
    "$xrdb" -nocpp -merge "$sysresources"
  fi
fi

if [ -f "$sysmodmap" ]; then
  "$xmodmap" "$sysmodmap"
fi

if [ -f "$userresources" ]; then
  if [ -x /usr/bin/cpp ] ; then
    "$xrdb" -merge "$userresources"
  else
    "$xrdb" -nocpp -merge "$userresources"
  fi
fi

if [ -f "$usermodmap" ]; then
  "$xmodmap" "$usermodmap"
fi

# start some nice programs

if [ -d "$xinitdir"/xinitrc.d ] ; then
  for f in "$xinitdir/xinitrc.d"/?*.sh ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xiccd &
xrandr --output eDP-1 --dpi 120
export GDK_SCALE=2
export XCURSOR_SIZE=48
exec dwm 2>/$HOME/.cache/dwm.log
