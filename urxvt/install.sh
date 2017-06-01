#!/bin/sh

if test "$(which pacman)"; then
  sudo pacman -S --noconfirm --needed rxvt-unicode urxvt-perls
  yaourt -S --noconfirm urxvt-resize-font-git
fi
