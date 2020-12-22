#!/usr/bin/env zsh

if if-command glab; then
  eval "$(glab completion --shell zsh)"
fi
