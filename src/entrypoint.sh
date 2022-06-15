#!/bin/bash

cd /tmp
mkdir -p ${SRVMNT}/steamcmd ${SRVMNT}/steamapps
wget -qO- "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar xvzf - -C "${SRVMNT}/steamcmd"
cd ${SRVMNT}/steamcmd

chown -R root:root /mnt

./steamcmd.sh +force_install_dir ${SRVMNT} +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} +app_update ${STEAMAPPID} ${EXTRA_FLAGS} +quit

mkdir -p ${SRVMNT}/.steam/sdk32
cp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so

if  [ ! -z "$METAMOD_VERSION" ] && [ ! -d "${SRVMNT}/${STEAMAPP}/addons/metamod" ]; then
	LATESTMM=$(wget -qO- https://mms.alliedmods.net/mmsdrop/"${METAMOD_VERSION}"/mmsource-latest-linux)
	wget -qO- https://mms.alliedmods.net/mmsdrop/"${METAMOD_VERSION}"/"${LATESTMM}" | tar xvzf - -C "${SRVMNT}"	
fi

if  [ ! -z "$SOURCEMOD_VERSION" ] && [ ! -d "${SRVMNT}/${STEAMAPP}/addons/sourcemod" ]; then
	LATESTSM=$(wget -qO- https://sm.alliedmods.net/smdrop/"${SOURCEMOD_VERSION}"/sourcemod-latest-linux)
	wget -qO- https://sm.alliedmods.net/smdrop/"${SOURCEMOD_VERSION}"/"${LATESTSM}" | tar xvzf - -C "${SRVMNT}"
fi