FROM ubuntu:16.04

MAINTAINER David de Groot (d.degroot@library.uq.edu.au)

EXPOSE 80

RUN apt-get update
RUN apt upgrade -y
RUN apt-get -y install apache2 python python-pip  curl sqlite3

RUN pip install simplejson

#load apache cgi module
RUN a2enmod cgi

COPY docker-entrypoint.sh /docker-entrypoint.sh
EXPOSE 80
CMD ["/docker-entrypoint.sh"]
