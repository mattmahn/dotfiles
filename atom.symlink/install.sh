#!/bin/sh

# only install if not already installed
if test ! "$(which atom)"; then
  if [ "$(uname -s)" = "Darwin" ]; then
    brew cask install atom
  elif test "$(which yaourt)"; then
    yaourt -S --noconfirm atom-editor
  fi
fi

apm install \
  atom-beautify \
  atom-justify \
  atom-material-ui \
  atom-ternjs \
  autocomplete-emojis \
  autocomplete-hack \
  autocomplete-paths \
  autocomplete-python \
  color-picker \
  editorconfig \
  file-icons \
  git-projects \
  hex \
  language-diff \
  language-latex \
  language-rust \
  language-svg \
  latex \
  latexer \
  linter \
  linter-chktex \
  linter-gcc \
  linter-pep8 \
  linter-pep257 \
  linter-pylint \
  linter-rust \
  merge-conflicts \
  inimap \
  minimap-git-diff \
  multi-cursor \
  multi-wrap-guide \
  pigments \
  racer \
  rust-api-docs-helper || true
