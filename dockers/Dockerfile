FROM ubuntu:16.04 

#install utilities
RUN apt-get update \
  && apt-get -y install apt-transport-https lsb-release curl devscripts debhelper fontconfig
  
#install node-js v4
RUN curl --silent https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
  && VERSION=node_4.x \
  && DISTRO="$(lsb_release -s -c)" \
  && echo "deb https://deb.nodesource.com/$VERSION $DISTRO main" | tee /etc/apt/sources.list.d/nodesource.list \
  && echo "deb-src https://deb.nodesource.com/$VERSION $DISTRO main" | tee -a /etc/apt/sources.list.d/nodesource.list \
  && apt-get update \
  && apt-get -y install nodejs git python build-essential libkrb5-dev

#install mongodb 2.4.9
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 \
  && echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list \
  && apt-get update \
  && apt-get install -y mongodb-10gen=2.4.10 \
  && mkdir -p /data/db

#install rabbitmq
RUN echo 'deb http://www.rabbitmq.com/debian/ testing main' | tee /etc/apt/sources.list.d/rabbitmq.list \
  && curl --silent https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add - \
  && apt-get update \
  && apt-get install -y rabbitmq-server 

#CMD service rabbitmq-server start \
#  && /usr/bin/mongod --fork --logpath /var/log/mongodb/monngod.log
