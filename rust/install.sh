#!/bin/sh

if command -v pacman >/dev/null 2>&1; then
  sudo pacman -S --noconfirm --needed rustup
else
  if ! command -v cargo >/dev/null 2>&1; then  # don't reinstall if already installed
    curl -LsSf https://sh.rustup.rs | sh
  fi
fi
