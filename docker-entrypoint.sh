#!/bin/bash
set -e

exec sed -i "s#\$TOKEN#$TOKEN#" /fluentd/etc/$FLUENTD_CONF

exec "$@"
