#!/bin/bash

iptables -F
iptables -X

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -o vmbr0 -j MASQUERADE

iptables -A FORWARD -i vmbr1 -o vmbr0 -j ACCEPT
iptables -A FORWARD -i vmbr0 -o vmbr1 -j ACCEPT

iptables -t nat -A POSTROUTING -s 192.168.59.0/24 -o vmbr1 -j MASQUERADE

iptables -t nat -A PREROUTING -p tcp -d 192.168.59.44 --dport 22161 -j DNAT --to 10.0.0.1:22
iptables -t nat -A PREROUTING -p tcp -d 192.168.59.44 --dport 22162 -j DNAT --to 10.0.0.2:22
iptables -t nat -A PREROUTING -p tcp -d 192.168.59.44 --dport 22163 -j DNAT --to 10.0.0.3:22
iptables -t nat -A PREROUTING -p tcp -d 192.168.59.44 --dport 22164 -j DNAT --to 10.0.0.4:22
iptables -t nat -A PREROUTING -p tcp -d 192.168.59.44 --dport 22165 -j DNAT --to 10.0.0.5:22
iptables -t nat -A PREROUTING -p tcp -d 192.168.59.44 --dport 22166 -j DNAT --to 10.0.0.6:22
iptables -t nat -A PREROUTING -p tcp -d 192.168.59.44 --dport 22167 -j DNAT --to 10.0.0.7:22
iptables -t nat -A PREROUTING -p tcp -d 192.168.59.44 --dport 22168 -j DNAT --to 10.0.0.8:22
iptables -t nat -A PREROUTING -p tcp -d 192.168.59.44 --dport 22169 -j DNAT --to 10.0.0.9:22
iptables -t nat -A PREROUTING -p tcp -d 192.168.59.44 --dport 22160 -j DNAT --to 10.0.0.10:22

