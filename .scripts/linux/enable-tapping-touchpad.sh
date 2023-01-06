#!/bin/sh

DEV=$(xinput list | awk '/Touchpad|TouchPad/ {print $3" "$4" "$5}')

xinput set-prop "$DEV" "libinput Tapping Enabled" 1
