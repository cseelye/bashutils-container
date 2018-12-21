FROM alpine:3.6
ARG BASHUTILS_VERSION
ENV BASHUTILS_VERSION=${BASHUTILS_VERSION:-1.5.1} BASHUTILS=/bashutils/share BASHUTILS_HOME=/bashutils
LABEL maintainer="Carl Seelye <cseelye@gmail.com>" version="${BASHUTILS_VERSION}" description="Container for hosting bashutils scripts"

COPY lsb_release /usr/bin/lsb_release

RUN apk update && \
    apk add bash coreutils curl findutils gawk grep jq ncurses sed util-linux wget

RUN mkdir /bashutils && \
    curl https://bitbucket.org/solidfire/bashutils/get/bashutils-${BASHUTILS_VERSION}.tar.gz | tar xz -C bashutils --strip-components=1

ENTRYPOINT ["/bin/bash", "-l", "-c", "${BASHUTILS_HOME}/bin/bashutils"]
