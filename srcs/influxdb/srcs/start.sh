#! bin/sh

#influxd & telegraf
supervisord -c /etc/supervisord.conf    & tail -f /dev/null