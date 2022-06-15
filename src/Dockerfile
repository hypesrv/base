FROM    debian:bullseye-slim

LABEL   author='DRANIX' maintainer='dranix@hypesrv.com'

ENV     DEBIAN_FRONTEND noninteractive
ENV     SRVMNT /mmt/server

ENV     STEAM_USER anonymous
ENV     STEAM_PASS ''
ENV     STEAM_AUTH ''

ENV     STEAMAPPID 740
ENV     STEAMAPP csgo

ENV     METAMOD_VERSION 1.11
ENV     SOURCEMOD_VERSION 1.11

RUN     set -x \
            dpkg --add-architecture i386 \
                && apt update \
                && apt upgrade -y \
                && apt install -y --no-install-recommends --no-install-suggests \
                    lib32stdc++6=10.2.1-6 \
                    lib32gcc-s1=10.2.1-6 \
                    wget=1.21-1+deb11u1 \
                    ca-certificates=20210119 \
                    curl=7.74.0-1.3+deb11u1 \
                    locales=2.31-13+deb11u3 \
                && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
                && dpkg-reconfigure --frontend=noninteractive locales \
                && apt-get remove --purge --auto-remove -y \
                && rm -rf /var/lib/apt/lists/* \
                && apt-get clean

WORKDIR ${SRVMNT}