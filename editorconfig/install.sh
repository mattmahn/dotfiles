#!/bin/sh
# https://github.com/editorconfig/editorconfig-core-c/blob/master/INSTALL.md

if test "$(which pacman)"; then  # Arch
  sudo pacman -S --noconfirm --needed editorconfig-core-c
elif test "$(which apt-get)"; then  # Fedora 24+
  sudo apt-get install editoconfig
elif test "$(which brew)"; then  # Darwin
  brew install editorconfig
fi
