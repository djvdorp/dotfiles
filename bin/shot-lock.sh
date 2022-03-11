#!/bin/sh
#
# Lock the screen while showing an unreadable version of your current screen
# Author: rcefala
# Required packages: scrot, imagemagick (convert)

SCREEN1=`tempfile --prefix shot- --suffix .png`
SCREEN2=`tempfile --prefix shot- --suffix .png`

scrot $SCREEN1
convert $SCREEN1 -scale 10% -scale 1000% $SCREEN2
rm -f $SCREEN1
i3lock -i $SCREEN2
rm -f $SCREEN2
