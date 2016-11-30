#FROM sickp/alpine-sshd:latest
#RUN passwd -d root
#COPY identity.pub /root/.ssh/authorized_keys
#COPY ssh_config /etc/ssh/ssh_config

FROM gaff/alpine-sshd:1.0

MAINTAINER Dmitry Yakutkin <d.yakutkin@quantumobile.com>

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*