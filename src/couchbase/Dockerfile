FROM aweber/ubuntu
MAINTAINER gavinr@aweber.com

RUN curl -o /tmp/couchbase-server-community.deb http://packages.couchbase.com/releases/2.2.0/couchbase-server-community_2.2.0_x86_64.deb && \
  dpkg -i /tmp/couchbase-server-community.deb && rm /tmp/couchbase-server-community.deb

ADD etc/consul.d/couchbase.json /etc/consul.d/
ADD etc/consul.d/memcached.json /etc/consul.d/
ADD etc/consul.d/http.json /etc/consul.d/
ADD etc/supervisor/conf.d/couchbase.conf /etc/supervisor/conf.d/
ADD etc/supervisor/conf.d/initialize.conf /etc/supervisor/conf.d/
ADD initialize.sh /usr/local/bin/

EXPOSE 8091 8092 11210 11211
