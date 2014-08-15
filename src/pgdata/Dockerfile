FROM ubuntu:trusty
MAINTAINER gavinr@aweber.com

RUN mkdir /tmp/postgresql /var/lib/postgresql
RUN touch /tmp/postgresql/.no-delete  /var/lib/postgresql/.no-delete
RUN /usr/sbin/groupadd -r -g 200 postgres
RUN /usr/sbin/useradd -M -r -u 200 -g postgres postgres -d /var/lib/postgresql
RUN chown -R postgres:postgres /var/lib/postgresql /tmp/postgresql
VOLUME ["/var/lib/postgresql", "/tmp/postgresql"]
CMD true
