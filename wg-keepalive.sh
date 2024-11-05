#!/bin/sh

WIREGUARD_ENDPOINT=192.168.33.1
WIREGUARD_INTERFACE=wg0

set -e

echo "Checking connection.."
if ! ping -c 1 "$WIREGUARD_ENDPOINT" >/dev/null; then
    echo "Connection failed, restarting VPN.."
    systemctl restart wg-quick@"$WIREGUARD_INTERFACE".service
    echo "VPN restarted"
else
    echo "Connection successful, no action needed"
fi
