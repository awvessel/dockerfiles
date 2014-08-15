FROM aweber/ubuntu
MAINTAINER gavinr@aweber.com

RUN \
  apt-get install -y -q nginx && \
  apt-get clean && \
  sed -i 's/listen 80 default_server;/listen 9202 default_server;/' /etc/nginx/sites-available/default && \
  sed -i 's/worker_processes 4;/worker_processes 1;/' /etc/nginx/nginx.conf && \
  rm /usr/share/nginx/html/* && \
  curl http://grafanarel.s3.amazonaws.com/grafana-1.6.1.tar.gz | tar xvz -C/usr/share/nginx/html --strip-components 1

ADD usr/share/nginx/html/config.js.template /usr/share/nginx/html/
ADD etc/supervisor/conf.d/nginx.conf /etc/supervisor/conf.d/nginx.conf
ADD etc/supervisor/conf.d/config.conf /etc/supervisor/conf.d/config.conf
ADD etc/consul.d/nginx.json /etc/consul.d/nginx.json
ADD config.sh /usr/local/bin/config.sh

EXPOSE 9202
