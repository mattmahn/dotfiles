#!/bin/sh

if command -v pacman >/dev/null 2>&1; then
  sudo pacman -S --needed --noconfirm alacritty alacritty-terminfo
fi
