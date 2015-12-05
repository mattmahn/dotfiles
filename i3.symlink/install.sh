#!/bin/sh

[ "$(uname -s)" = "Darwin" ] && exit 0

if test "$(which pacman)"; then
  sudo pacman -S i3-wm i3lock i3status
elif test "$(which apt-get)"; then
  sudo apt-get install i3
fi

