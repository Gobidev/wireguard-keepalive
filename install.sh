#!/bin/sh

set -e

echo "Installing keepalive script to /opt/wg-keepalive.sh.."
install -m 700 wg-keepalive.sh /opt/
echo "..done"

echo "Installing wg-keepalive.service and wg-keepalive.timer.."
install -m 644 wg-keepalive.service /etc/systemd/system/
install -m 644 wg-keepalive.timer /etc/systemd/system/
echo "..done"

systemctl daemon-reload

echo "Start and enable wg-keepalive.timer.."
systemctl enable --now wg-keepalive.timer
echo "..done"

echo
echo "Installation finished, make sure to adjust WIREGUARD_ENDPOINT and WIREGUARD_INTERFACE in /opt/wg-keepalive.sh"
