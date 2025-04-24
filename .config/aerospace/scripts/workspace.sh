#!/bin/sh

TOTAL_MONITOR=5

relative_workspace=$1

monitor=$(aerospace list-monitors --focused | awk '{print $1}')
workspace=$(aerospace list-workspaces --focused)

monitor_relative=$(($monitor - 1))

absolute_workspace=$(($relative_workspace + $(($monitor_relative * $TOTAL_MONITOR))))

aerospace workspace $absolute_workspace
