#!/bin/zsh

[[ -d "$HOME/.npm/bin" ]] && export PATH="$PATH:$HOME/.npm/bin"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

if command -v nvm >/dev/null 2>&1; then
  nvm_install_dir="/usr/local/Cellar/nvm"
  latest_nvm_version="$(/bin/ls $nvm_install_dir | sort -rn | head -n 1)"
  . "$nvm_install_dir/$latest_nvm_version/nvm.sh"
  nvm use 9 &>/dev/null
fi
