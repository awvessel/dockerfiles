#!/bin/bash
docker run -d --name=StatsD --link=Consul:Consul -p 8125:8125 -p 8126:8126 docker.ofc.lair/aweber/statsd
