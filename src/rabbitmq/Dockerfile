#
# Dockerfile for stand-alone RabbitMQ Server
#
FROM aweber/ubuntu
MAINTAINER gavinr@aweber.com

RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv F7B8CEA6056E8E56 && \
  echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D208507CA14F4FCA && \
  echo "deb http://packages.erlang-solutions.com/debian precise contrib" > /etc/apt/sources.list.d/erlang-solutions.list

# Update the repository indexes and install Erlang and RabbitMQ
RUN apt-get -qq update && apt-get install -y -qq rabbitmq-server curl unzip

# Write out a rabbitmq.config that allows for the guest user to connect from an external IP address
ADD etc/rabbitmq/rabbitmq.config /etc/rabbitmq/rabbitmq.config

# Download and install plugins
RUN \
  curl -L -o /tmp/plugin.zip "https://raw.githubusercontent.com/aweber/pgsql-listen-exchange/binary/pgsql-listen-3-3-x-v-0-2-0.zip" && \
  cd /tmp && unzip plugin.zip && mv *.ez /usr/lib/rabbitmq/lib/rabbitmq_server-3.4.3/plugins/ && \
  rm plugin.zip && \
  curl -L -o /tmp/plugin.zip "https://raw.githubusercontent.com/aweber/influxdb-storage-exchange/binaries/influxdb-storage-exchange-0.1.1.zip" && \
  cd /tmp && unzip plugin.zip && mv *.ez /usr/lib/rabbitmq/lib/rabbitmq_server-3.4.3/plugins/ && \
  rm plugin.zip && \
  curl -L -o /usr/lib/rabbitmq/lib/rabbitmq_server-3.4.3/plugins/rabbitmq_top-3.4.x-b1364318.ez http://www.rabbitmq.com/community-plugins/v3.4.x/rabbitmq_top-3.4.x-b1364318.ez && \
  curl -L -o /usr/lib/rabbitmq/lib/rabbitmq_server-3.4.3/plugins/rabbitmq_sharding-3.4.x-bccd6750.ez http://www.rabbitmq.com/community-plugins/v3.4.x/rabbitmq_sharding-3.4.x-bccd6750.ez && \
  curl -L -o /usr/lib/rabbitmq/lib/rabbitmq_server-3.4.3/plugins/rabbitmq_event_exchange-3.4.x-4813af15.ez http://www.rabbitmq.com/community-plugins/v3.4.x/rabbitmq_event_exchange-3.4.x-4813af15.ez && \
  curl -L -o /usr/lib/rabbitmq/lib/rabbitmq_server-3.4.3/plugins/rabbitmq_management_exchange-3.4.x-54acd65b.ez http://www.rabbitmq.com/community-plugins/v3.4.x/rabbitmq_management_exchange-3.4.x-54acd65b.ez && \
  curl -L -o /usr/lib/rabbitmq/lib/rabbitmq_server-3.4.3/plugins/rabbitmq_priority_queue-3.4.x-3431dc1e.ez http://www.rabbitmq.com/community-plugins/v3.4.x/rabbitmq_priority_queue-3.4.x-3431dc1e.ez

# Clean up apt-leftovers
RUN apt-get -qq -y remove curl unzip
RUN apt-get autoremove -y
RUN apt-get clean
RUN rm -rf /var/lib/{apt,dpkg,cache,log}/


# Enable plugins
RUN rabbitmq-plugins --offline enable rabbitmq_consistent_hash_exchange rabbitmq_management rabbitmq_federation rabbitmq_federation_management rabbitmq_mqtt rabbitmq_tracing rabbitmq_priority_queue rabbitmq_management_exchange rabbitmq_event_exchange rabbitmq_sharding rabbitmq_top pgsql_listen_exchange influxdb_storage_exchange

# Export the volumes for configuration and log file examination
VOLUME ["/etc/rabbitmq", "/var/log/rabbitmq"]

# Set the HOME env variable to the right location for RabbitMQ to run
ENV HOME /var/lib/rabbitmq

ADD etc/consul.d/amqp.json /etc/consul.d/amqp.json
ADD etc/consul.d/http.json /etc/consul.d/http.json
ADD etc/consul.d/mqtt.json /etc/consul.d/mqtt.json
ADD etc/supervisor.d/rabbitmq.conf /etc/supervisor.d/rabbitmq.conf

# Ports to expose
EXPOSE 1883 4369 5672 15672 25672

# Seems to be dropped off
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
