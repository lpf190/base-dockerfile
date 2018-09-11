FROM python:2.7-alpine

MAINTAINER lpf190@163.com

WORKDIR /script
COPY pull.sh /script
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && pip install awscli \
    && apk update \
    && apk add docker \
    && rm -rf /var/cache/apk/* \
    && chmod +x /script/pull.sh

ENTRYPOINT /script/pull.sh
