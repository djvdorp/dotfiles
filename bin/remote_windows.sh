#!/bin/sh
xfreerdp +clipboard /w:1920 /h:1050 /v:10.140.11.75:3389 /u:ddo /p:$(zenity \
    --entry \
    --title="Password" \
    --text="Enter your _password:" \
    --hide-text)
