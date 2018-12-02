#!/bin/sh

[ "$(uname -s)" = "Darwin" ] && exit 0

if command -v yay >/dev/null 2>&1; then
  yay -S --noconfirm --needed i3-gaps i3lock i3status rofi
elif test "$(which apt-get)"; then
  sudo apt-get install -y i3
fi

