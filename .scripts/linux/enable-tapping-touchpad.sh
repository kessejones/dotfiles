#!/bin/bash

DEV=$(xinput list | awk '/Touchpad/ {print $3" "$4" "$5}')

xinput set-prop "$DEV" "libinput Tapping Enabled" 1
