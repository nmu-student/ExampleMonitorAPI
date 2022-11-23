#!/bin/bash

BASE_PATH="/opt/monitor_api"

mkdir -p $BASE_PATH/pub

touch [[ -f $BASE_PATH/test.txt ]] $BASE_PATH/test.txt

if [[ ! -f $BASE_PATH/monitor_api.sh ]]; then
    cp monitor_api.sh $BASE_PATH
fi

if [[ ! -f /etc/systemd/system/monitor_api.service ]]; then
    cp monitor_api.service /etc/systemd/system
fi

if [[ ! -f $BASE_PATH/pub/laba2_main ]]; then
    cp -r laba2_main $BASE_PATH/pub

    cd $BASE_PATH/pub/laba2_main

    sudo go build -o $BASE_PATH
fi

sudo chmod +x $BASE_PATH/monitor_api.sh

sudo systemctl enable monitor_api.service

sudo systemctl start monitor_api.service
