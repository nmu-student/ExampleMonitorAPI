#!/bin/bash

start() {
    /opt/monitor_api/laba2_main --start > /dev/null 2> /dev/null &
}

stop() {
    kill -9 $(lsof -t -i:8030)
}

case $1 in
    start|stop) "$1" ;;
esac

echo ""
