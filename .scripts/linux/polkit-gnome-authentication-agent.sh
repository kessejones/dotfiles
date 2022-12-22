#!/bin/bash

if [ -z "$(pgrep "polkit-gnome")" ]; then
    /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1
fi
