#!/bin/sh
xrandr --output eDP1 --mode 1920x1080
xrandr --output DP2-1 --mode 3840x2160 --left-of eDP1 --scale 0.75x0.75
