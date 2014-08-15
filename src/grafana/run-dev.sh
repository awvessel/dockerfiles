#!/bin/bash
docker run -d --name=Grafana --link=Consul:Consul -p 9202:9202 docker.ofc.lair/aweber/grafana
