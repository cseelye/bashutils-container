FROM ubuntu:16.04
ARG BASHUTILS_VERSION
ENV BASHUTILS_VERSION=${BASHUTILS_VERSION:-1.4.11} BASHUTILS=/bashutils/share BASHUTILS_HOME=/bashutils
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
    apt-get autoremove --assume-yes && \
    apt-get clean --assume-yes && \
    rm --force --recursive /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /bashutils && \
    curl https://bitbucket.org/solidfire/bashutils/get/bashutils-${BASHUTILS_VERSION}.tar.gz | tar xz -C bashutils --strip-components=1 && \
    echo 'source ${BASHUTILS}/bashutils.sh' > /root/.bashrc

ENTRYPOINT ["/bin/bash"]
