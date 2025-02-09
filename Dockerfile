FROM debian:12-slim

ARG ARCH=x86_64
# ARG ARCH=arm64

RUN apt-get update ; \
    apt-get upgrade -y ; \
    apt-get install -y wget liblua5.3

WORKDIR /beammp
RUN wget https://github.com/BeamMP/BeamMP-Server/releases/download/v3.4.1/BeamMP-Server.debian.12.$ARCH ; \
    chmod +x BeamMP-Server.debian.12.$ARCH

ADD ServerConfig.toml /beammp/ServerConfig.toml

ENTRYPOINT ["/beammp/BeamMP-Server.debian.12.$ARCH"]
