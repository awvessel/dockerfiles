#!/bin/bash
docker run -d --name=Redis --link=Consul:Consul -p 6379:6379 docker.ofc.lair/aweber/redis
