#!/bin/bash
docker run -d --name=InfluxDB -p 8083:8083 -p 8086:8086 -p 8090:8090 -p 8099:8099 --link=Consul:Consul docker.ofc.lair/aweber/influxdb
