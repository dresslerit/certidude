FROM ubuntu:xenial

#LABEL maintainer="Name <e@mail.com>"

ARG DEBIAN_FRONTEND=noninteractive

#ENV BASEDIR=/usr/lib/unifi \
#    DATADIR=/unifi/data \
#    LOGDIR=/unifi/log \
#    CERTDIR=/unifi/cert \
#    RUNDIR=/var/run/unifi \
#    ODATADIR=/var/lib/unifi \
#    OLOGDIR=/var/log/unifi \
#    CERTNAME=cert.pem \
#    CERT_PRIVATE_NAME=privkey.pem \
#    CERT_IS_CHAIN=false \
#    GOSU_VERSION=1.10 \
#    BIND_PRIV=true \
#    RUNAS_UID0=true \
#    UNIFI_GID=999 \
#    UNIFI_UID=999

ADD . /certidude

WORKDIR /certidude

RUN apt-get update \
    && apt-get install software-properties-common -y \
    && add-apt-repository -y ppa:nginx/stable \
    && apt-get update \
    && apt install -y python3-pip python3-markdown python3-pyxattr python3-jinja2 python3-cffi software-properties-common libnginx-mod-nchan nginx-full postfix \
    && pip3 install -e .




#EXPOSE 6789/tcp 8080/tcp 8443/tcp 8880/tcp 8843/tcp 3478/udp

#HEALTHCHECK CMD /usr/local/bin/docker-healthcheck.sh || exit 1

# execute controller using JSVC like original debian package does
#ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]