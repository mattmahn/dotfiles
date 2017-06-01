#!/bin/sh

# only install if not already installed
if test ! "$(which atom &>/dev/null)"; then
  exit 0
elif test "$(which pacman)"; then
  sudo pacman -S --noconfirm --needed atom
fi

if test "$(which apm)"; then
  apm upgrade --confirm false

  modules="
    atom-beautify
    atom-justify
    atom-material-ui
    atom-ternjs
    autocomplete-emojis
    autocomplete-hack
    autocomplete-paths
    autocomplete-python
    color-picker
    editorconfig
    file-icons
    git-projects
    hex
    language-diff
    language-docker
    language-latex
    language-rust
    language-svg
    latex
    latexer
    linter
    linter-chktex
    linter-gcc
    linter-pylint
    linter-rust
    merge-conflicts
    minimap
    minimap-git-diff
    multi-cursor
    multi-wrap-guide
    native-ui
    one-dark-syntax
    pigments
    racer
    rust-api-docs-helper
    sort-lines
    wakatime
  "
  for module in $modules; do
    apm install "$module" || true
  done

  modules="
    metrics
    exception-reporting
  "
  for module in $modules; do
    apm remove "$module" || true
  done
fi
