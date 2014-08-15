#!/bin/bash
docker run -d --name=RabbitMQ --link=Consul:Consul -p 1883:1883 -p 5672:5762 -p 15672:15672 docker.ofc.lair/aweber/rabbitmq
