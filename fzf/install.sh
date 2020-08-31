#!/bin/sh
# https://github.com/junegunn/fzf

if command -v pacman >/dev/null 2>&1; then
  sudo pacman -S --noconfirm --needed fzf
elif command -v apt-get >/dev/null 2>&1; then
  sudo apt-get install fzf
elif command -v dnf >/dev/null 2>&1; then
  sudo dnf install fzf
elif command -v pkg >/dev/null 2>&1; then
  pkg install fzf
elif command -v pkg_add >/dev/null 2>&1; then
  pkg_add fzf
elif command -v brew >/dev/null 2>&1; then
  brew install fzf
  "$(brew --prefix)/opt/fzf/install"
fi
