#!/bin/sh
service polipo restart
sslocal -c /etc/shadowsocks/config.json &
