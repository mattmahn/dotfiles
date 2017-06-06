#!/bin/sh

readonly BG_IMAGE=$(mktemp --suffix '.png')
readonly BLUR_AMOUNT=25
readonly RESOLUTION=$(xdpyinfo | awk '/dimensions/{print $2}')
readonly DPMS_VALUES=$(xset q | awk 'BEGIN{FPAT="[0-9]+"} /Standby.*Suspend.*Off/{print $1, $2, $3}')
readonly SCREEN_TIMEOUT=5

clean_up() {
  rm -f $BG_IMAGE
  xset dpms $DPMS_VALUES
}

trap clean_up SIGHUP SIGINT SIGTERM

# take & blur screenshot
ffmpeg -loglevel quiet -y -s $RESOLUTION -f x11grab -i $DISPLAY -vframes 1 -vf "gblur=sigma=$BLUR_AMOUNT" $BG_IMAGE
# turn off monitor after inactivity
xset +dpms dpms $SCREEN_TIMEOUT $SCREEN_TIMEOUT $SCREEN_TIMEOUT
# pause notifications
killall -USR1 dunst
# lock
i3lock -I $SCREEN_TIMEOUT -nei $BG_IMAGE
# resume notifications
killall -USR2 dunst
clean_up
