#!/bin/sh
# Don't forget to create a symlink for this file to use it: sudo ln -s ~/bin/i3exit.sh /usr/local/bin/i3exit
lock() {
    ~/bin/shot-lock.sh
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        lock && systemctl suspend
        ;;
    hibernate)
        lock && systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
