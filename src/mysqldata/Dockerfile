FROM ubuntu:trusty
MAINTAINER gavinr@aweber.com

# Maintain our own mysql user and group
RUN \
  /usr/sbin/groupadd -r -g 203 mysql && \
  /usr/sbin/useradd -M -r -u 203 -g mysql mysql -d /var/lib/mysql && \
  mkdir /var/lib/mysql && \
  touch /var/lib/mysql/.no-delete && \
  chown -R mysql:mysql /var/lib/mysql

VOLUME ["/var/lib/mysql"]
CMD true
