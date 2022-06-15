FROM    debian:bullseye-slim

LABEL   author="DRANIX" maintainer="dranix@hypesrv.com"

ENV     DEBIAN_FRONTEND noninteractive

RUN set -x \
        dpkg --add-architecture i386 \
			&& apt update \
			&& apt upgrade -y \
			&& apt install -y --no-install-recommends --no-install-suggests \
                lib32stdc++6=10.2.1-6 \
                lib32gcc-s1=10.2.1-6 \
                wget=1.21-1+deb11u1 \
                ca-certificates=20210119 \
            && apt-get remove --purge --auto-remove -y wget \
            && rm -rf /var/lib/apt/lists/*