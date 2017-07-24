#!/bin/sh

if test "$(which yaourt)"; then
  sudo pacman -S --noconfirm --needed playerctl
  yaourt -S --noconfirm polybar i3ipc-glib-git
fi
