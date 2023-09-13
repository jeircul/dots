#!/usr/bin/env sh

_run() { pidof "$1" || { $1 & } }

# Autostart
"$HOME"/scripts/remaps &

# Run if not running
pidof picom >/dev/null || { picom -f >/dev/null 2>&1 & }
pgrep -x mopidy >/dev/null || { mopidy >/dev/null 2>&1 & }
pgrep blueman || { blueman-applet >/dev/null 2>&1 & }
gnome-keyring-daemon --start /usr/lib/polkit-1/polkit-agent-helper-1 &
xsetroot -cursor_name left_ptr
autorandr -c &

# source the colors.
. "${HOME}/.cache/wal/colors.sh" && wal -R

nextcloud --background &
_run nm-applet &
_run mullvad-vpn &
_run unclutter &
_run clipmenud &
_run birdtray &
_run blueman-applet &

if [ "$(autorandr --detected)" = "qtile home office" ]; then
	xrandr \
		--output eDP-1 --mode 1920x1080 --pos 0x840 --rotate normal \
		--output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate left \
		--output DVI-I-3-2 --primary --mode 1920x1200 --pos 3000x360 --rotate normal \
		--output DVI-I-2-1 --mode 1920x1200 --pos 4920x360 --rotate normal \
		--output DP-1 --off \
		--output DP-2 --off \
		--output DP-3 --off \
		--output DP-4 --off \
		--output DVI-I-5-4 --off \
		--output DVI-I-4-3 --off
fi
sleep 3
"$HOME"/scripts/setbg &&
	qtile cmd-obj -o cmd -f reload_config
