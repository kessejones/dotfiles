#!/bin/bash

DISPLAY=:1 xinput set-prop 22 344 1
TOUCHPAD_ID=$(xinput | grep Touchpad | cut -d= -f2 | grep -P "^(\d*)" -o)

