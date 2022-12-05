#!/bin/sh

# Don't ask ssh password all the time
if [ "$(uname -s)" = "Darwin" ]; then
  git config --global credential.helper osxkeychain
else
  git config --global credential.helper cache
fi

# better diffs
if ! if-command delta; then
  # install
  if if-command yay; then
    yay -S git-delta
  elif if-command dnf; then
    dnf install git-delta
  elif if-command pkg; then
    pkg install git-delta
  elif if-command brew; then
    brew install git-delta
  elif if-command cargo; then
    cargo install git-delta
  fi
  # configure
  git config --global core.pager delta
fi

# install npm/yarn merge driver
if if-command npm; then
  npm i -g npm-merge-driver
fi

# install gitall for parallel gitting
if if-command cargo; then
  cargo install gitall || true
fi

if if-command brew; then
  brew install git-absorb
elif if-command cargo; then
  cargo install git-absorb
fi

if if-command brew; then
  brew install difftastic
elif if-command cargo; then
  cargo install difftastic
fi

if if-command brew; then
  brew install git-revise
elif python3 -m pip >/dev/null; then
  python3 -m pip install --user -U git-revise
fi

