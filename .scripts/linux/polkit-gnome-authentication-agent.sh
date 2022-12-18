#!/bin/bash

if [ -z $(pgrep "polkit-gnome-authentication-agent") ]; then
    /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1
fi
