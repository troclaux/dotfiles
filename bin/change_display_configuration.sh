#!/bin/bash

choices="0) [❌][❌]
1) [✅][❌]
2) [✅][✅]
3) [❌][✅]"

choice=$(echo -e "$choices" | wofi -i --matching=fuzzy --show dmenu -p "Select display configuration")

case "$choice" in
"0) [❌][❌]")
	wlr-randr --output eDP-1 --off --output HDMI-A-1 --off
	;;
"1) [✅][❌]")
	wlr-randr --output eDP-1 --on --output HDMI-A-1 --off
	;;
"2) [✅][✅]")
	wlr-randr --output eDP-1 --pos 0,0 --on --output HDMI-A-1 --pos 1366,0 --on
	;;
"3) [❌][✅]")
	wlr-randr --output eDP-1 --off --output HDMI-A-1 --on
	;;
*)
	echo "Invalid choice or cancelled."
	;;
esac
