FROM aweber/ubuntu
MAINTAINER gavinr@aweber.com

RUN \
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  apt-get clean && \
  curl -o /tmp/elasticsearch-1.2.1.deb https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.1.deb && \
  sudo dpkg -i /tmp/elasticsearch-1.2.1.deb && \
  rm /tmp/elasticsearch-1.2.1.deb

ADD etc/supervisor/conf.d/elasticsearch.conf /etc/supervisor/conf.d/elasticsearch.conf
ADD etc/consul.d/http.json /etc/consul.d/http.json
ADD etc/consul.d/transport.json /etc/consul.d/transport.json

EXPOSE 9200 9300
