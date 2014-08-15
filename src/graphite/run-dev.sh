docker run -d --name=Graphite --link=Consul:Consul -p 2003:2003 -p 2004:2004 -p 2005:2005 docker.ofc.lair/aweber/graphite
