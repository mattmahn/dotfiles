#!/bin/sh

[ "$(uname -s)" = "Darwin" ] && exit 0

if test "$(which pacman)"; then
  sudo pacman -S --noconfirm --needed sxhkd
elif test "$(which apt-get)"; then
  sudo apt-get install -y sxhkd
fi

systemctl --user enable --now sxhkd.service
