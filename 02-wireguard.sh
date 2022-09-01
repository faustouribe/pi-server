#!/bin/bash

DIRECTORY_BASE="${DIRECTORY_BASE:-$(pwd)}"
[[ -d "$DIRECTORY_BASE" ]] || mkdir -p "$DIRECTORY_BASE" || { echo "Couldn't create storage directory: $DIRECTORY_BASE"; exit 1; }

source local
docker run -d \
  --name=wireguard \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=$TIMEZONE \
  -e SERVERURL=$DCKDNSDOMAIN  \
  -e SERVERPORT=51820 \
  -e PEERS=1 \
  -e PEERDNS=1.1.1.1 \
  -e INTERNAL_SUBNET=10.13.13.0 \
  -e ALLOWEDIPS=10.13.13.0/24,192.168.1.0/24,0.0.0.0/0 \
  -p 51820:51820/udp \
  -v "${DIRECTORY_BASE}/wireguard:/config" \
  -v /lib/modules:/lib/modules \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --restart unless-stopped \
  ghcr.io/linuxserver/wireguard
