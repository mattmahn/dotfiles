#!/bin/sh

# terminate running bar instances
killall -q polybar

# wait until processes have ecitedd
while pgrep -x polybar >/dev/null; do sleep 1; done

# launch bars
for disp in $(xrandr --query | awk '/ connected/ { print $1 }'); do
  MONITOR="$disp" polybar base &
done

echo "Bars launched..."
