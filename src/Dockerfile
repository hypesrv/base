FROM    --platform=$TARGETOS/$TARGETARCH debian:bullseye-slim

LABEL   author="DRANIX" maintainer="walentinlamonos@gmail.com"

ENV SERVERDIR "/mnt/server"
ENV STEAMCMDDIR "${SERVERDIR}/steamcmd"

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
                lib32stdc++6=10.2.1-6 \
                lib32gcc-s1=10.2.1-6 \
                wget=1.21-1+deb11u1 \
                ca-certificates=20210119 \
                nano=5.4-2 \
                curl=7.74.0-1.3+deb11u1 \
                locales=2.31-13+deb11u3 \
	&& sed -i -e 's/# en_US.UTF-8' /etc/locale.gen \
	&& dpkg-reconfigure --frontend=noninteractive locales \
    && apt-get remove --purge --auto-remove -y wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR ${STEAMCMDDIR}