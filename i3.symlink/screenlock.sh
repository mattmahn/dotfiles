#!/bin/sh

readonly BG_IMAGE="/tmp/lockscreen_background.png"

# take screenshot
scrot $BG_IMAGE
# blur screenshot
convert "$BG_IMAGE" -blur 0x16 "/tmp/lockscreen_background_blur.png"
rm $BG_IMAGE

# lock
i3lock --inactivity-timeout=10 --image="/tmp/lockscreen_background_blur.png"
