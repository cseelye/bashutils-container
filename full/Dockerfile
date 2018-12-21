FROM ubuntu:16.04
ARG BASHUTILS_VERSION
ENV BASHUTILS_VERSION=${BASHUTILS_VERSION:-1.5.1} BASHUTILS=/bashutils/share BASHUTILS_HOME=/bashutils
LABEL maintainer="Carl Seelye <cseelye@gmail.com>" version="${BASHUTILS_VERSION}" description="Container for hosting bashutils scripts"

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes \
        bsdmainutils \
        bzip2 \
        coreutils \
        cpio \
        curl \
        dialog \
        findutils \
        gawk \
        genisoimage \
        gnupg \
        grep \
        gzip \
        iproute2 \
        iputils-ping \
        jq \
        locales \
        lsb-release \
        openssl \
        ncurses-bin \
        pbzip2 \
        pigz \
        sed \
        squashfs-tools \
        tar \
        tzdata \
        util-linux \
        uuid-runtime \
        vim \
        wget \
        xz-utils && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.utf8 && \
    apt-get autoremove --assume-yes && \
    apt-get clean --assume-yes && \
    rm --force --recursive /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /bashutils && \
    curl https://bitbucket.org/solidfire/bashutils/get/bashutils-${BASHUTILS_VERSION}.tar.gz | tar xz -C bashutils --strip-components=1

ENTRYPOINT ["/bin/bash", "-l", "-c", "${BASHUTILS_HOME}/bin/bashutils"]
