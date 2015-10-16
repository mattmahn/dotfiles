#!/bin/sh
[ "$(uname -s)" = "Darwin" ] && brew cask install atom
apm install \
    atom-beautify \
    atom-justify \
    atom-ternjs \
    autocomplete-emojis \
    autocomplete-hack \
    autocomplete-paths \
    autocomplete-python \
    color-picker \
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
    minimap \
    minimap-git-diff \
    multi-cursor \
    multi-wrap-guide \
    pigments \
    racer \
    rust-api-docs-helper || true
