#!/bin/sh
#
# ~/.xinitrc from https://wiki.manjaro.org/index.php/Proper_~/.xinitrc_File
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
