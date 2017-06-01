#!/bin/sh

[ "$(uname -s)" = "Darwin" ] && exit 0

if test "$(which yaourt)"; then
  sudo pacman -S --noconfirm --needed rofi
  yaourt -S --noconfirm i3-gaps i3lock i3status
elif test "$(which apt-get)"; then
  sudo apt-get install -y i3
fi

