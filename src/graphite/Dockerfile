FROM aweber/ubuntu
MAINTAINER gavinr@aweber.com

RUN \
  apt-get install -y -qq nginx graphite-web graphite-carbon uwsgi uwsgi-plugin-python && \
  chown _graphite /var/log/graphite && \
  sudo -u _graphite touch /var/lib/graphite/search_index && \
  sed -i 's/worker_processes 4;/worker_processes 2;/' /etc/nginx/nginx.conf

ADD etc/graphite/local_settings.py /etc/graphite/local_settings.py
ADD etc/nginx/sites-available/default /etc/nginx/sites-available/default
ADD etc/consul.d/carbon-cache.json /etc/consul.d/carbon-cache.json
ADD etc/consul.d/carbon-pickle.json /etc/consul.d/carbon-pickle.json
ADD etc/consul.d/graphite.json /etc/consul.d/graphite.json
ADD etc/supervisor/conf.d/carbon.conf /etc/supervisor/conf.d/carbon.conf
ADD etc/supervisor/conf.d/nginx.conf /etc/supervisor/conf.d/nginx.conf
ADD etc/supervisor/conf.d/uwsgi.conf /etc/supervisor/conf.d/uwsgi.conf

RUN sudo -u _graphite graphite-manage syncdb --noinput

EXPOSE 2003 2004 2005
