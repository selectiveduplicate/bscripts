#!/bin/bash

#detect the desktop environment
#XDG_CURRENT_DESKTOP is currently not defined in freedesktop standards
#so might not be available in some cases
#XDG_DATA_DIRS would be preferred if the former is undefined

sleep 12

if [[ "$XDG_CURRENT_DESKTOP" != "" ]]; then
    case $XDG_CURRENT_DESKTOP in
        MATE|GNOME) notify-send --expire-time 10000 --icon=face-smile-big "Welcome, "$USER"! Hope you're doing okay.";;
        "KDE") kdialog --passivepopup "Welcome, "$USER"! Hope you're doing okay..." --title "Greetings" --icon face-smile-big;;
        *) exit 1;;
    esac
else 
    environment=echo "$XDG_DATA_DIRS" | sed 's/.*\(xfce\|plasma\|gnome\|mate\).*/\1/'
    case $environment in
        xfce|gnome|mate) notify-send --expire-time 10000 --icon=face-smile-big "Welcome, "$USER"! Hope you're doing okay.";;
        "KDE") kdialog --passivepopup "Welcome, "$USER"! Hope you're doing okay..." --title "Greetings" --icon face-smile-big;;
        *) exit 1;;
    esac
fi
