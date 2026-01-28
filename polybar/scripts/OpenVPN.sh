#!/bin/bash

VPN_DOWN="❌"
VPN_UP="✅"

# Check if tun0 interface is up
if ip a show tun0 &> /dev/null; then
    # Get the IPv4 address
    VPN_IP=$(ip addr show tun0 | awk '/inet / {print $2}' | cut -d/ -f1)
    if [ -n "$VPN_IP" ]; then
        echo "VPN is connected. IP: $VPN_IP"
    else
        echo "VPN is up but no IP address assigned."
    fi
else
    echo "VPN (tun0) is not connected."
fi
