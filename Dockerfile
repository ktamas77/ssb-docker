FROM ubuntu:16.04

# Initial config
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y software-properties-common
RUN apt-get install -y locales apt-utils
RUN apt-get install -y curl make g++

# Set the locale
ENV LANG=en_US.UTF-8
RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8

# Install Node
RUN curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o /usr/local/bin/n && chmod +x /usr/local/bin/n
RUN n node/10.16.0

RUN npm install -g ssb-server

WORKDIR /var/www/server
ADD src/run-server.sh .
RUN chmod +x run-server.sh

EXPOSE 8008

CMD ./run-server.sh
