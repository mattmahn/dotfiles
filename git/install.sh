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
if command -v cargo >/dev/null 2>&1; then
  cargo install gitall
fi
