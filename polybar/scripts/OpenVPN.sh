#!/bin/bash

# Check if tun0 interface is up
if ip a show tun0 &> /dev/null; then
    # Get the IPv4 address
    VPN_IP=$(ip addr show tun0 | awk '/inet / {print $2}' | cut -d/ -f1)
    if [ -n "$VPN_IP" ]; then
        echo "%{F#00FF00}$VPN_IP%{F-}"
    else
        echo "%{F#FF0000}NO ADDRESS%{F-}"
    fi
else
    echo -e "%{F#FF0000}DOWN%{F-}"
fi
