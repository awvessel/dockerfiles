FROM aweber/ubuntu
MAINTAINER gavinr@aweber.com

RUN apt-get -y -q install memcached && apt-get clean
ADD memcached.conf /etc/supervisor/conf.d/memcached.conf
ADD memcached.json /etc/consul.d/memcached.json

EXPOSE 11211
