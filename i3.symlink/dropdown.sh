#!/usr/bin/env bash
#
# I have a habit of pressing <C-d> after finishing a session, but I don't want
# my dropdown terminal to disappear forever. This will spawn a new one if I
# kill the current terminal.

while true; do
  if [[ ! $(pgrep -fu "$USER" 'alacritty .* dropdown') ]]; then
    alacritty -t dropdown -d 180 40
  fi
  sleep 5
done
