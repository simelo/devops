FROM gaff/alpine-sshd:1.0

MAINTAINER Dmitry Yakutkin <d.yakutkin@quantumobile.com>

RUN echo "http://mirrors.aliyun.com/alpine/v3.2/main/"|cat - /etc/apk/repositories > /tmp/out && mv /tmp/out /etc/apk/repositories

RUN apk add --update bash

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install --trusted-host mirrors.aliyun.com -i http://mirrors.aliyun.com/pypi/simple/ --upgrade pip \
  && pip install --trusted-host mirrors.aliyun.com -i http://mirrors.aliyun.com/pypi/simple/ virtualenv \
  && rm -rf /var/cache/apk/*

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

CMD [ "/usr/sbin/sshd", "-D", "-f", "/etc/ssh/sshd_config"]
