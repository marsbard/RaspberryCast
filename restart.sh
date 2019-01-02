#!/usr/bin/env bash

cd $(dirname "$0")

sudo ./RaspberryCast.sh stop

rm RaspberryCast.log
touch RaspberryCast.log

sleep 3

./RaspberryCast.sh start 2>&1 > /dev/null

tail -F RaspberryCast.log
