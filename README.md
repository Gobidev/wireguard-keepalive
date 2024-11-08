# Wireguard Keepalive

When using Wireguard with dynDNS endpoints, Wireguard does not automatically
re-resolve the hostname when its IP changes, which causes the connection to
fail when it does.

This project provides a simple script along with a systemd timer that
periodically checks if the connection is currently working (by sending a ping to
a host in the network) and restarts the wireguard connection if it is not.

## Installation

- Run `./install.sh` as root
- Edit the interface name and ping endpoint in `/opt/wg-keepalive.sh`
- Optional: Adjust check frequency in `/etc/systemd/system/wg-keepalive.timer`
  (default: every 5 minutes)

## TODOs

- Provide option to restart VPN based on IP changes of the DNS, not based on
  ping
