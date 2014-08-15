FROM ubuntu:trusty
MAINTAINER gavinr@aweber.com
RUN mkdir /var/lib/redis
RUN touch /var/lib/redis/.no-delete
RUN /usr/sbin/groupadd -r -g 201 redis
RUN /usr/sbin/useradd -M -r -u 201 -g redis redis -d /var/lib/redis
RUN chown -R redis:redis /var/lib/redis
VOLUME ["/var/lib/redis"]
CMD true
