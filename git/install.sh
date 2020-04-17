#!/bin/sh

# Don't ask ssh password all the time
if [ "$(uname -s)" = "Darwin" ]; then
  git config --global credential.helper osxkeychain
else
  git config --global credential.helper cache
fi

# better diffs
if command -v diff-so-fancy >/dev/null 2>&1; then
  git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
fi

# install npm/yarn merge driver
if command -v npm >/dev/null 2>&1; then
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
  brew install git-revise
elif python3 -m pip >/dev/null; then
  python3 -m pip install --user -U git-revise
fi
