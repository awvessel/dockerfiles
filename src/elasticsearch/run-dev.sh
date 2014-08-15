#!/bin/bash
docker run -d --name=Elasticsearch --link=Consul:Consul -p 9200:9200 -p 9300:9300 docker.ofc.lair/aweber/elasticsearch
