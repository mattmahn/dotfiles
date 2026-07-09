#!/bin/sh

if if-command brew; then
  brew install vivid
fi

if p10k help >/dev/null 2>&1; then
  p10k configure
fi
