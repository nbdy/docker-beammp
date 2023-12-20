FROM debian:12-slim

RUN apt-get update ; \
    apt-get upgrade -y ; \
    apt-get install -y wget liblua5.3

WORKDIR /beammp
RUN wget https://github.com/BeamMP/BeamMP-Server/releases/download/v3.1.3/BeamMP-Server-debian ; \
    chmod +x BeamMP-Server-debian

ADD ServerConfig.toml /beammp/ServerConfig.toml

ENTRYPOINT ["/beammp/BeamMP-Server-debian"]
