#!/usr/bin/env bash
#
# I have a habit of pressing <C-d> after finishing a session, but I don't want
# my dropdown terminal to disappear forever. This will spawn a new one if I
# kill the current terminal.

while true; do
  if [[ ! $(pgrep -fu $USER 'urxvt -name dropdown') ]]; then
    urxvt -name dropdown -geometry 180x40 -cd "$HOME"
  fi
  sleep 5
done
