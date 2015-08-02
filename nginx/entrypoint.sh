#!/bin/bash
set -eu

function reload_nginx() {
    while true; do
        inotifywait -e close_write /etc/hosts 2> /dev/null
        service nginx reload
    done
}

reload_nginx &

exec "$@"
