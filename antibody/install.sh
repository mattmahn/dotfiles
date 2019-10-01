#!/bin/sh

if ! command -v antibody >/dev/null 2>&1; then
  if [ "$(uname)" = "Darwin" ]; then
    brew untap getantibody/homebrew-antibody || true
    brew untap getantibody/tap/antibody || true
    brew tap -q getantibody/tap/antibody
    brew install getantibody/tap/antibody
  else
    curl -sL https://git.io/antibody | sh -s
  fi
fi

antibody bundle < "$DOTFILES/antibody/bundles.txt" > ~/.bundles.txt
antibody bundle romkatv/powerlevel10k >> ~/.bundles.txt
antibody bundle < "$DOTFILES/antibody/last_bundles.txt" >> ~/.bundles.txt
