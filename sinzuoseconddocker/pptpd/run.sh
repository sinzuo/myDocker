#!/bin/bash
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
pptpd -f
