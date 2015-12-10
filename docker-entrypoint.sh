#!/bin/bash
set -e

echo "Applying token" 
echo $TOKEN

sed -i "s#\$TOKEN#$TOKEN#" /fluentd/etc/$FLUENTD_CONF

echo "Running fluentd"
exec fluentd -v -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OP
