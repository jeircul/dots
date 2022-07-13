#!/usr/bin/env sh

_run() { pidof "$1" || { $1 & } ;}

# Autostart
"$HOME"/scripts/remaps &

# Run if not running
pidof picom > /dev/null || { picom -f > /dev/null 2>&1 & }
pgrep -x mopidy > /dev/null || { mopidy > /dev/null 2>&1 & }
gnome-keyring-daemon --start /usr/lib/polkit-1/polkit-agent-helper-1 &
xsetroot -cursor_name left_ptr
autorandr -c &

# source the colors.
. "${HOME}/.cache/wal/colors.sh" &&	wal -R

"$HOME"/scripts/setbg &
nextcloud --background &
_run nm-applet &
_run mullvad-vpn &
_run unclutter &
_run clipmenud &
_run birdtray &
