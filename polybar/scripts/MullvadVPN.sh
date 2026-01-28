#!/bin/bash

# Check if wg0-mullvad interface is up
if ip address show wg0-mullvad &> /dev/null; then
    # Get the IPv4 address
    VPN_IP=$(ip address show wg0-mullvad | awk '/inet / {print $2}' | cut -d/ -f1)
    if [ -n "$VPN_IP" ]; then
        echo "%{F#00FF00}$VPN_IP%{F-}"
    else
        echo "%{F#FF0000}NO ADDRESS%{F-}"
    fi
else
    echo -e "%{F#FF0000}DOWN%{F-}"
fi
