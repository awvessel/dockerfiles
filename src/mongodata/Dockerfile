FROM ubuntu:trusty
MAINTAINER gavinr@aweber.com

# Maintain our own mongodb user and group
RUN \
  /usr/sbin/groupadd -r -g 202 mongodb && \
  /usr/sbin/useradd -M -r -u 202 -g mongodb mongodb -d /var/lib/mongodb && \
  mkdir /var/lib/mongodb && \
  touch /var/lib/mongodb/.no-delete && \
  chown -R mongodb:mongodb /var/lib/mongodb

VOLUME ["/var/lib/mongodb"]
CMD true
