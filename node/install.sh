#!/bin/sh
if test "$(which pacman)"; then
  sudo pacman -S --noconfirm --needed nodejs npm
fi
