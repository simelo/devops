#FROM golang:1.7.3-alpine
#MAINTAINER Dmitry Yakutkin <d.yakutkin@quantumobile.com>
#
#COPY build.sh /build.sh
#RUN chmod 755 /build.sh
#RUN /build.sh
#
#
#ENV S6_KILL_GRACETIME=500
#
#COPY keygen.sh /etc/cont-init.d/keygen
#COPY sshd_config /etc/ssh/sshd_config
#RUN chmod 755 /etc/cont-init.d/keygen
#
#EXPOSE 22
#
#RUN apk add --update \
#    python \
#    python-dev \
#    py-pip \
#    build-base \
#  && pip install virtualenv \
#  && rm -rf /var/cache/apk/*
#
#CMD [ "/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]

FROM gaff/alpine-sshd:1.0

MAINTAINER Dmitry Yakutkin <d.yakutkin@quantumobile.com>

RUN apk add --update bash

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2