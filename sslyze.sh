#!/usr/bin/env bash

HOST=$1
PORT=$2

if ! command -v sslyze &> /dev/null
then
    echo "sslyze could not be found"
    echo "Homebrew: brew install sslyze"
    echo "  Python: pip install sslyze"
    exit
fi

if [ -z "$PORT" ]
then
    PORT=443
fi

sslyze --regular ${HOST}:${PORT}

### EOF ###