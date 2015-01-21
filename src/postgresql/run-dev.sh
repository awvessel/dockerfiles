#!/bin/bash
docker run -d --name=PostgreSQL --link=Consul:Consul -p 5432:5432 docker.ofc.lair/aweber/postgresql
