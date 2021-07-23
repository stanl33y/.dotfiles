#!/usr/bin/env bash
# Script to echo song information using playerctl
# If spotify is not playing, nothing is echoed.
#
# Requirements:
#   - playerctl (https://github.com/acrisci/playerctl)
#
# @author Edvin Hultberg <post@hultberg.no>

spotify_status=$(playerctl -p spotify status)
spotify_info=$(playerctl -p spotify metadata --format "{{ artist }} - {{ title }}")

if [[ "$spotify_status" = "Playing" ]]; then
	echo -n "  $spotify_info" || exit 1
elif [[ "$spotify_status" = "Paused" ]]; then
	echo -n "  $spotify_info" || exit 1
else
	echo -n ""
fi
