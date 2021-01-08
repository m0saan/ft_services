#! bin/bash
supervisord -c /etc/supervisord.conf  & tail -f /dev/null