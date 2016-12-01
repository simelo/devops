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