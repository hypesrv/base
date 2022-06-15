#!/bin/bash
STEAM_USER=anonymous
STEAM_PASS=""
STEAM_AUTH=""

cd /tmp
mkdir -p /mnt/server/steamcmd
wget -qO- "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar xvzf - -C /mnt/server/steamcmd
mkdir -p /mnt/server/steamapps
cd /mnt/server/steamcmd

chown -R root:root /mnt
export HOME=/mnt/server

./steamcmd.sh +force_install_dir /mnt/server +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} +app_update ${SRCDS_APPID} ${EXTRA_FLAGS} +quit ## other flags may be needed depending on install. looking at you cs 1.6

mkdir -p /mnt/server/.steam/sdk32
cp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so

# mkdir -p /mnt/server/.steam/sdk64
# cp -v linux64/steamclient.so ../.steam/sdk64/steamclient.so