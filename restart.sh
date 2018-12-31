#!/usr/bin/env bash

cd $(dirname "$0")

sudo ./RaspberryCast.sh stop

./RaspberryCast.sh start 2>&1 > /dev/null
