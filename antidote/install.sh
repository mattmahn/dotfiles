#!/bin/sh

antidote_version='v1.8.0'
antidote_dir="${ZDOTDIR:-${HOME}}/.antidote"

if [ ! -d "$antidote_dir" ]; then
  git clone --depth 1 https://github.com/mattmc3/antidote.git "$antidote_dir" --branch "$antidote_version"
fi

"${antidote_dir}/antidote" bundle < "$DOTFILES/antibody/bundles.txt" > ~/.bundles.txt
"${antidote_dir}/antidote" bundle romkatv/powerlevel10k >> ~/.bundles.txt
"${antidote_dir}/antidote" bundle < "$DOTFILES/antibody/last_bundles.txt" >> ~/.bundles.txt
