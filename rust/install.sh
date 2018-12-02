#!/bin/sh

if command -v pacman >/dev/null 2>&1; then
  sudo pacman -S --noconfirm --needed rustup
else
  curl -LsSf https://sh.rustup.rs | sh
fi
