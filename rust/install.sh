#!/bin/sh

if [ "$(which pacman)" ]; then
  sudo pacman -S --noconfirm --needed rustup
else
  curl -sSf https://sh.rustup.rs | sh
fi
