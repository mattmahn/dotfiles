#!/bin/sh
exit 0
if command -v yay >/dev/null 2>&1; then
  yay -S --noconfirm --needed polybar i3ipc-glib-git playerctl
fi
