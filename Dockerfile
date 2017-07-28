FROM alpine:latest
ARG BASHUTILS_VERSION=1.4.11
ENV BASHUTILS=/bashutils/share
ENV BASHUTILS_HOME=/bashutils

RUN apk update && \
    apk add gawk bash coreutils curl findutils grep iproute2 iputils jq ncurses sed tzdata util-linux vim wget && \
    apk add cpio tar bzip2 gzip pigz xz cdrkit && \
    apk add gnupg openssl

RUN mkdir /bashutils && \
    curl https://bitbucket.org/solidfire/bashutils/get/bashutils-${BASHUTILS_VERSION}.tar.gz | tar xz -C bashutils --strip-components=1

ENTRYPOINT ["/bin/bash", "--init-file", "<(echo 'export BASHUTILS=/bashutils/share; export BASHUTILS_HOME=/bashutils ; source /bashutils/share/bashutils.sh')"]
