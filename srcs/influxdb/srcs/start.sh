#!/bin/sh
export TELEGRAF_CONFIG_PATH=/etc/telegraf.conf
# Start Influxdb and telegraf.
telegraf & influxd

