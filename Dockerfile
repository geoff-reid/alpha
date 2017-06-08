FROM ubuntu:16.04 

RUN apt-get update \
  && apt-get -y install apt-transport-https lsb-release curl \
  && curl --silent https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
  && VERSION=node_4.x \
  && DISTRO="$(lsb_release -s -c)" \
  && echo "deb https://deb.nodesource.com/$VERSION $DISTRO main" | tee /etc/apt/sources.list.d/nodesource.list \
  && echo "deb-src https://deb.nodesource.com/$VERSION $DISTRO main" | tee -a /etc/apt/sources.list.d/nodesource.list \
  && apt-get update \
  && apt-get -y install nodejs git python build-essential libkrb5-dev
