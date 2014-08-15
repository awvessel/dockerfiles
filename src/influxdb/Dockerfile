FROM aweber/ubuntu
MAINTAINER gavinr@aweber.com

RUN curl -o /tmp/influxdb_latest_amd64.deb http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb && \
  sudo dpkg -i /tmp/influxdb_latest_amd64.deb && \
  rm /tmp/influxdb_latest_amd64.deb

ADD etc/consul.d/8083.json /etc/consul.d/8083.json
ADD etc/consul.d/8086.json /etc/consul.d/8086.json
ADD etc/consul.d/8090.json /etc/consul.d/8090.json
ADD etc/consul.d/8099.json /etc/consul.d/8099.json
ADD etc/supervisor/conf.d/influxdb.conf /etc/supervisor/conf.d/influxdb.conf

EXPOSE 8083 8086 8090 8099
