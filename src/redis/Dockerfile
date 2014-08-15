FROM aweber/ubuntu
MAINTAINER gavinr@aweber.com

RUN \
  /usr/sbin/groupadd -r -g 201 redis && \
  /usr/sbin/useradd -M -r -u 201 -g redis redis -d /var/lib/redis && \
  apt-get install -y -q redis-server && \
  touch /var/log/redis/.no-delete && \
  chown -R redis:root /var/log/redis && \
  chmod -R g+rw /var/log/redis

ADD etc/redis/redis.conf /etc/redis/redis.conf
ADD etc/supervisor/conf.d/redis.conf /etc/supervisor/conf.d/redis.conf
ADD etc/consul.d/redis.json /etc/consul.d/redis.json

EXPOSE 6379

VOLUME	["/var/log/redis"]
