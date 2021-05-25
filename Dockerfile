FROM ubuntu:16.04
MAINTAINER thuyennc<nguyencongthuyen@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive

#update ubuntu
RUN apt-get update

#Install nginx
RUN apt-get install -y nginx

#install mysql
RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections \
    && echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections \
    && apt-get install -y mysql-server
ADD start.sh /venv/
WORKDIR /venv/
RUN chmod a+x /venv/*
ENTRYPOINT ["/venv/start.sh"]
EXPOSE 80

