#!/bin/bash
docker run -d --name=Couchbase --link=Consul:Consul -p 8091:8091 -p 11210:11210 -p 11211:11211 docker.ofc.lair/aweber/couchbase
