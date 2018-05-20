#!/bin/bash

grep -rl 'zookeeper.connect=localhost:2181' $KAFKA_HOME/config/server.properties | xargs sed -i 's/zookeeper.connect=localhost:2181/zookeeper.connect=zookeeper-host:2181/g'

exec "$KAFKA_HOME/bin/kafka-server-start.sh" "$KAFKA_HOME/config/server.properties"

/bin/bash
