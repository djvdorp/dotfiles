#!/bin/sh
xrandr --output eDP1 --mode 2560x1440
xrandr --output DP2-1-1 --mode 1920x1080 --left-of eDP1
xrandr --output DP2-2-1 --mode 1920x1080 --left-of DP2-1-1
