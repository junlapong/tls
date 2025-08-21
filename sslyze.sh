#!/usr/bin/env bash

HOST=$1
PORT=$2

if ! command -v sslyze &> /dev/null
then
    echo "sslyze could not be found"
    echo "  Python: pip install sslyze"
    echo "see: https://github.com/nabla-c0d3/sslyze#quick-start"
    exit
fi

if [ -z "$PORT" ]
then
    PORT=443
fi

sslyze ${HOST}:${PORT}

### EOF ###