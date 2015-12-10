#!/bin/bash
set -e

echo "Applying token" 
echo $TOKEN

exec sed -i "s#\$TOKEN#$TOKEN#" /fluentd/etc/$FLUENTD_CONF

exec "$@"
