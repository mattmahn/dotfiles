#!/bin/sh

[ "$(uname -s)" = "Darwin" ] && exit 0

if test "$(which pacman)"; then
  yaourt -S --noconfirm i3-gaps-next-git i3lock i3status
elif test "$(which apt-get)"; then
  sudo apt-get install -y i3
fi

