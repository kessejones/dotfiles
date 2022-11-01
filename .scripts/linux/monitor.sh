#!/bin/sh

xrandr --output DP-0 --off --output DP-1 --off 
xrandr --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal
xrandr --output HDMI-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal 
