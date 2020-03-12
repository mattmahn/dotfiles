#!/bin/sh
# https://github.com/ajeetdsouza/zoxide

if command -v cargo >/dev/null 2>&1; then  # Arch
  cargo install -f zoxide
fi
