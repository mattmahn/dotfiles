#!/bin/sh
if [ "$(uname -s)" = "Darwin" ]; then
  brew install node
elif test "$(which pacman)"; then
  sudo pacman -S nodejs npm
fi
