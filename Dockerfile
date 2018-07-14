FROM ubuntu:xenial

#LABEL maintainer="Name <e@mail.com>"

ARG DEBIAN_FRONTEND=noninteractive

ADD . /certidude

WORKDIR /certidude

RUN apt-get update \
    && apt-get install software-properties-common -y \
    && add-apt-repository -y ppa:nginx/stable \
    && apt-get update \
    && apt install -y python3-pip python3-markdown python3-pyxattr python3-jinja2 python3-cffi software-properties-common libnginx-mod-nchan nginx-full postfix \
    && pip3 install -r requirements.txt \
    && pip3 install -e . \
    && export LC_ALL=C.UTF-8 \
    && export LANG=C.UTF-8 \
    && certidude provision authority && exit 0



EXPOSE 80/tcp 443/tcp

#HEALTHCHECK CMD /usr/local/bin/docker-healthcheck.sh || exit 1

# execute controller using JSVC like original debian package does
#ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]