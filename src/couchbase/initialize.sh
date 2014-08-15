#!/bin/bash
sleep 10
USER=Administrator
PASS=potatoball
/opt/couchbase/bin/couchbase-cli cluster-init \
  -c 127.0.0.1 \
  --cluster-init-username=$USER \
  --cluster-init-password=$PASS \
  --cluster-init-port=8091 \
  --cluster-init-ramsize=256
/opt/couchbase/bin/couchbase-cli bucket-create \
  -c 127.0.0.1 \
  -u $USER \
  -p $PASS \
  --bucket=general \
  --bucket-type=couchbase \
  --bucket-ramsize=256 \
  --bucket-replica=1 \
  --enable-flush=1 \
  --enable-index-replica=0
