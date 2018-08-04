FROM ubuntu:bionic
MAINTAINER oliver@weichhold.com

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz /tmp

RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
    apt-get update -y && apt-get install -y --no-install-recommends software-properties-common && \
    echo "deb http://ppa.launchpad.net/bitcoin/bitcoin/ubuntu bionic main\n" >> /etc/apt/sources.list && \
    echo "deb-src http://ppa.launchpad.net/bitcoin/bitcoin/ubuntu bionic main" >> /etc/apt/sources.list && \
    apt-get update -y && apt-get install -y --no-install-recommends bitcoind && \
    rm -rf /usr/share/man/* /usr/share/groff/* /usr/share/info/* /var/cache/man/* /tmp/* /var/lib/apt/lists/*

EXPOSE 16001 16002 16003 26001 26002 26003

ENTRYPOINT ["/init"]
VOLUME ["/data"]
ADD rootfs /
