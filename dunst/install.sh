#!/bin/sh

[ "$(uname -s)" = "Darwin" ] && exit 0

if command -v pacman >/dev/null 2>&1; then
  sudo pacman -S --noconfirm --needed dunst
fi

