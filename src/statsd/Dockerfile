FROM aweber/nodejs
MAINTAINER gavinr@aweber.com

RUN \
  npm install --prefix /opt statsd && \
  mv /opt/node_modules/statsd /opt && \
  rm -rf /opt/node_modules

ADD statsd.sh /usr/local/bin/statsd
ADD etc/supervisor/conf.d/statsd.conf /etc/supervisor/conf.d/statsd.conf
ADD etc/consul.d/statsd.json /etc/consul.d/statsd.json
ADD etc/consul.d/statsd-admin.json /etc/consul.d/statsd-admin.json

EXPOSE 8125/udp 8126
