#!/bin/sh

if command -v yay >/dev/null 2>&1; then
  yay -S --noconfirm --needed rxvt-unicode urxvt-perls
fi
