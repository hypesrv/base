#!/bin/bash
SERVERDIR=/mnt/server
STEAMCMDDIR=mnt/server/steamcmd

cd /tmp
mkdir -p ${SERVERDIR}/steamcmd
wget -qO- 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz'
tar -xzvf steamcmd.tar.gz -C ${STEAMCMDDIR}
./${STEAMCMDDIR}/steamcmd.sh +quit

mkdir -p "${SERVERDIR}/.steam/sdk32"

ln -s "${STEAMCMDDIR}/linux32/steamclient.so" "${SERVERDIR}/.steam/sdk32/steamclient.so"
ln -s "${STEAMCMDDIR}/linux32/steamcmd" "${STEAMCMDDIR}/linux32/steam"
ln -s "${STEAMCMDDIR}/steamcmd.sh" "${STEAMCMDDIR}/steam.sh"