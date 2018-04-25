#!/bin/sh
xrandr --output eDP1 --mode 2560x1440
xrandr --output DP2-1 --mode 1920x1200 --right-of eDP1
xrandr --output DP2-2 --mode 1920x1200 --right-of DP2-1
