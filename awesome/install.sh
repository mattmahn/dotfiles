#!/bin/sh

[ "$(uname -s)" = "Darwin" ] && exit 0

if test "$(which pacman)"; then
  sudo pacman -S --noconfirm --needed awesome
elif test "$(which apt-get)"; then
  sudo apt-get install -y awesome
fi

