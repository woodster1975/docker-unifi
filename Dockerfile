FROM ubuntu:latest

LABEL authors="paulwoodhouse@gmail.com"

RUN apt-get update -y

RUN apt-get install gnupg -y

RUN apt-get install wget -y

RUN apt-get rsync

RUN apt-get update && apt-get install ca-certificates apt-transport-https -y

RUN wget -qO - https://www.mongodb.org/static/pgp/server-3.4.asc | apt-key add -

RUN echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list

RUN echo 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti' | tee /etc/apt/sources.list.d/100-ubnt-unifi.list

RUN wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg 

RUN apt-get update -y

RUN apt-get install openjdk-8-jdk -y

RUN apt-get update && apt-get install unifi -y

# Cleanup
RUN rm -rf /tmp/*

CMD /etc/init.d/unifi start


