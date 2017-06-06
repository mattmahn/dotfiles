#!/bin/sh

[ "$(uname -s)" = "Darwin" ] && exit 0

if test "$(which yaourt)"; then
  sudo pacman -S --noconfirm --needed dunst
fi

