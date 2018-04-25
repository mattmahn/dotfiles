#!/bin/sh
if test "$(which pacman)"; then
  sudo pacman -S --noconfirm --needed nodejs npm
elif [ "$(uname -s)" = "Darwin" ]; then
  brew install nvm
fi

if command -v nvm >/dev/null 2>&1; then
  nvm install node
  nvm use node
fi
