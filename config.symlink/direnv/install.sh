#!/bin/sh

if if-command asdf; then
  asdf plugin-add direnv || true
fi
