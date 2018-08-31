FROM debian:jessie

ENV PYTHONIOENCODING=UTF-8
ENV PATH=/root/.local/bin:$PATH

WORKDIR /script

COPY config/config /root/.aws/config

COPY aws.sh /script

RUN apt-get update \
    && apt-get install -y \
    python \
    python-pip 

RUN pip install awscli --upgrade \
    && echo 'export PATH=/root/.local/bin:$PATH' >> /root/.bash_profile 

RUN set -x \
    && export APT_LISTCHANGES_FRONTEND=none \
    && apt-get -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install apt-transport-https \
    && apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
    && echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install docker-engine \
    && apt-get clean \
    && rm -Rf /var/lib/apt/lists/* 2>/dev/null \
    && service docker start 
