#!/bin/sh

# Start Grafana server using supervisor.
supervisord -c /etc/supervisord.conf & tail -f /dev/null