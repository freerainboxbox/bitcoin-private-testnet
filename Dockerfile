FROM ubuntu:xenial
MAINTAINER oliver@weichhold.com

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz /

RUN apt-get update && apt-get install -y software-properties-common && \
    apt-add-repository ppa:bitcoin/bitcoin && \
    apt-get update && apt-get install -y bitcoind

EXPOSE 19001 19002 19003

ENTRYPOINT ["/init"]
VOLUME ["/data"]
ADD rootfs /
