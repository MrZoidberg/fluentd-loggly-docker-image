#!/bin/bash
set -e

exec gosu sed -i "s#\$TOKEN#$TOKEN#" /fluentd/etc/$FLUENTD_CONF

exec "$@"
