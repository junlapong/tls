#!/usr/bin/env bash

HOST=$1
PORT=$2

if ! command -v nmap &> /dev/null
then
    echo "nmap could not be found"
    exit
fi

if [ -z "$PORT" ]
then
    PORT=443
fi

nmap --script ssl-enum-ciphers -p ${PORT} ${HOST}

### EOF ###