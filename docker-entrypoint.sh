#!/bin/bash
set -e

exec sed -i "s#\$TOKEN#$TOKEN#" /fluentd/etc/$FLUENTD_CONF
exec fluentd -v -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT

exec "$@"
