#!/bin/bash

# hadoop base
curl -H "Content-Type: application/json" --data '{"build": true}' -X POST https://registry.hub.docker.com/u/timveil/docker-hadoop-base/trigger/08cbafd3-0ffe-42bf-a8e9-58d5882faa7a/

# hive metastore db
curl -H "Content-Type: application/json" --data '{"build": true}' -X POST https://registry.hub.docker.com/u/timveil/docker-hadoop-hive-metastore-db/trigger/46fa5969-ee1c-42bc-84e9-baa17c4289da/