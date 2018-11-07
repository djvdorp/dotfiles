#!/bin/sh
xfreerdp +clipboard /w:2560 /h:1400 /v:10.140.11.26:3389 /d:MENDIXDOMAIN /u:ddo /p:$(zenity \
    --entry \
    --title="Password" \
    --text="Enter your _password:" \
    --hide-text)
