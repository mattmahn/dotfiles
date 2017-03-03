#!/bin/sh

if test "$(which pacman)"; then
  sudo pacman -S --noconfirm --needed rxvt-unicode rxvt-perls
  sudo yaourt -S --noconfirm urxvt-resize-font
fi
