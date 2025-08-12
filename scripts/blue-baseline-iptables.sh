#!/bin/bash
# Basic host-level whitelisting example (adjust interfaces/ports to your environment)
# Flush existing
iptables -F
iptables -X

# Default: drop inbound
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow loopback
iptables -A INPUT -i lo -j ACCEPT

# Allow established/related
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow SSH from admin subnet (change to your admin IP/subnet)
iptables -A INPUT -p tcp -s 10.0.0.0/24 --dport 22 -j ACCEPT

# Allow HTTP from host (the lab)
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT

# Log and drop the rest (use caution in production)
iptables -A INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables-dropped: "
iptables -A INPUT -j DROP
