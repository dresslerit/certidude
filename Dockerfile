FROM ubuntu:xenial

#LABEL maintainer="Name <e@mail.com>"

ARG DEBIAN_FRONTEND=noninteractive

#ENV PKGURL=https://dl.ubnt.com/unifi/5.8.24/unifi_sysvinit_all.deb

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


#RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update && apt install -y python3-pip python3-markdown python3-pyxattr python3-jinja2 python3-cffi software-properties-common libnginx-mod-nchan nginx-full postfix
#RUN git clone https://github.com/laurivosandi/certidude \
#RUN cd certidude \
#RUN pip3 install -e .
#RUN certidude provision authority


#EXPOSE 6789/tcp 8080/tcp 8443/tcp 8880/tcp 8843/tcp 3478/udp

#WORKDIR /unifi

#HEALTHCHECK CMD /usr/local/bin/docker-healthcheck.sh || exit 1

# execute controller using JSVC like original debian package does
#ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

#CMD ["unifi"]

# execute the conroller directly without using the service
#ENTRYPOINT ["/usr/bin/java", "-Xmx${JVM_MAX_HEAP_SIZE}", "-jar", "/usr/lib/unifi/lib/ace.jar"]
  # See issue #12 on github: probably want to consider how JSVC handled creating multiple processes, issuing the -stop instraction, etc. Not sure if the above ace.jar class gracefully handles TERM signals.
#CMD ["start"]