#!/bin/bash
cd /tmp
mkdir -p ${SERVERDIR}/steamcmd
wget -qO- "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar xvzf - -C "${STEAMCMDDIR}"
./${STEAMCMDDIR}/steamcmd.sh +quit

mkdir -p "${SERVERDIR}/.steam/sdk32"

ln -s "${STEAMCMDDIR}/linux32/steamclient.so" "${SERVERDIR}/.steam/sdk32/steamclient.so"
ln -s "${STEAMCMDDIR}/linux32/steamcmd" "${STEAMCMDDIR}/linux32/steam"
ln -s "${STEAMCMDDIR}/steamcmd.sh" "${STEAMCMDDIR}/steam.sh"

mkdir -p ${SERVERDIR}/steamapps

cd ${SERVERDIR}/steamcmd

chown -R root:root /mnt
export HOME=/mnt/server

bash "${STEAMCMDDIR}/steamcmd.sh" +force_install_dir "${STEAMAPPDIR}" \
				+login anonymous \
				+app_update "${STEAMAPPID}" \
				+quit